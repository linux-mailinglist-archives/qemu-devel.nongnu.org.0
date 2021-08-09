Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F97D3E4300
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:39:46 +0200 (CEST)
Received: from localhost ([::1]:58682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1l3-0007Kl-GJ
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mD1jO-0005M4-1V; Mon, 09 Aug 2021 05:38:02 -0400
Received: from relay68.bu.edu ([128.197.228.73]:55308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mD1jM-0002oe-3x; Mon, 09 Aug 2021 05:38:01 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 1799bLnL015881
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 9 Aug 2021 05:37:23 -0400
Date: Mon, 9 Aug 2021 05:37:20 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
Message-ID: <20210809093720.fslgjimjd5wa3j35@mozz.bu.edu>
References: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
 <20210806144209.nbx4vlm6ofkza5pl@mozz.bu.edu>
 <31b39c41-17e9-3901-66c3-622afc653121@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31b39c41-17e9-3901-66c3-622afc653121@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Qiang Liu <cyruscyliu@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Bandan Das <bsd@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210809 1131, Philippe Mathieu-Daudé wrote:
> On 8/6/21 4:42 PM, Alexander Bulekov wrote:
> > On 210804 1451, Qiang Liu wrote:
> >> xlnx_dp_read allows an out-of-bounds read at its default branch because
> >> of an improper index.
> >>
> >> According to
> >> https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
> >> (DP Module), registers 0x3A4/0x3A4/0x3AC are allowed.
> >>
> >> DP_INT_MASK     0x000003A4      32      mixed   0xFFFFF03F      Interrupt Mask Register for intrN.
> >> DP_INT_EN       0x000003A8      32      mixed   0x00000000      Interrupt Enable Register.
> >> DP_INT_DS       0x000003AC      32      mixed   0x00000000      Interrupt Disable Register.
> >>
> >> In xlnx_dp_write, when the offset is 0x3A8 and 0x3AC, the virtual device
> >> will write s->core_registers[0x3A4
> >>>> 2]. That is to say, the maxize of s->core_registers could be ((0x3A4
> >>>> 2) + 1). However, the current size of s->core_registers is (0x3AF >>
> >>>> 2), that is ((0x3A4 >> 2) + 2), which is out of the range.
> >> In xlxn_dp_read, the access to offset 0x3A8 or 0x3AC will be directed to
> >> the offset 0x3A8 (incorrect functionality) or 0x3AC (out-of-bounds read)
> >> rather than 0x3A4.
> >>
> >> This patch enforces the read access to offset 0x3A8 and 0x3AC to 0x3A4,
> >> but does not adjust the size of s->core_registers to avoid breaking
> >> migration.
> >>
> >> Fixes: 58ac482a66de ("introduce xlnx-dp")
> >> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> > 
> > Acked-by: Alexander Bulekov <alxndr@bu.edu>
> > 
> > If there is somehow a regression, the test won't fail in a fatal way, so
> > maybe it makes sense to throw in a setenv(UBSAN_OPTIONS=halt_on_error=1)
> 
> Where? Main meson? qtests meson? setenv() in the test (but would
> override preset variable)?
> 

Probably in the test, with overwrite = 0 ? Without halt_on_error the
test will succeed even if the problem returns..
-Alex

