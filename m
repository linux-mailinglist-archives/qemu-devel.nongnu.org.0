Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF50321C9C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 17:18:39 +0100 (CET)
Received: from localhost ([::1]:44298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEDux-0001Zo-0W
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 11:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lEDlt-0001UM-RB
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:09:17 -0500
Received: from relay68.bu.edu ([128.197.228.73]:34778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lEDlp-0001sR-Nx
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:09:15 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 11MG8ECp024373
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 22 Feb 2021 11:08:17 -0500
Date: Mon, 22 Feb 2021 11:08:14 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] fuzz: fix the pro100 generic-fuzzer config
Message-ID: <20210222160814.7vmns3nn6mv5yx3v@mozz.bu.edu>
References: <20210221004717.426903-1-alxndr@bu.edu>
 <b4d704ba-a45e-99ba-4bc6-a20b398cd231@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4d704ba-a45e-99ba-4bc6-a20b398cd231@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210221 0947, Philippe Mathieu-Daudé wrote:
> On 2/21/21 1:47 AM, Alexander Bulekov wrote:
> > The device-type names for the pro100 network cards, are i8255.. We were
> > matching "eepro", which catches the PCI PIO/MMIO regions for those
> > devices, however misses the actual PCI device, which we use to map the
> > BARs, before fuzzing. Fix that
> > 
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >  tests/qtest/fuzz/generic_fuzz_configs.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> > index 5d599765c4..2454c627ff 100644
> > --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> > +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> > @@ -177,7 +177,7 @@ const generic_fuzz_config predefined_configs[] = {
> >          .name = "i82550",
> >          .args = "-machine q35 -nodefaults "
> >          "-device i82550,netdev=net0 -netdev user,id=net0",
> > -        .objects = "eepro*"
> > +        .objects = "i8255*"
> 
> What about i82562 & i82801?

True. If we start fuzzing those, we will need to adjust the config.

> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
Thanks

