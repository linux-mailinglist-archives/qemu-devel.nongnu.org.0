Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EB449854C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 17:53:11 +0100 (CET)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC2ac-0002UK-EY
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 11:53:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1nC2Z0-0000ta-AS; Mon, 24 Jan 2022 11:51:30 -0500
Received: from relay68.bu.edu ([128.197.228.73]:43772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1nC2Yy-0003rZ-9W; Mon, 24 Jan 2022 11:51:29 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 20OGoAkS020784
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 24 Jan 2022 11:50:13 -0500
Date: Mon, 24 Jan 2022 11:50:10 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH v3 0/3] physmem: Have flaview API check bus
 permission from MemTxAttrs argument
Message-ID: <20220124165010.jn3lrwk64i56u7cd@mozz.bu.edu>
References: <20211215182421.418374-1-philmd@redhat.com>
 <Ye7UKJTY0D2rbJN2@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ye7UKJTY0D2rbJN2@stefanha-x1.localdomain>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.56, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 220124 1630, Stefan Hajnoczi wrote:
> On Wed, Dec 15, 2021 at 07:24:18PM +0100, Philippe Mathieu-Daudé wrote:
> > This series aim to kill a recent class of bug, the infamous
> > "DMA reentrancy" issues found by Alexander while fuzzing.
> 
> I took a look at how to protect DMA transactions in VIRTIO devices. It
> will require setting the MemTxAttrs for address_space_ld/st_le/be_cached
> calls. Errors on write (store) can be ignored. Errors on read (load) are
> a bit more questionable since the device performs some operation based
> on the loaded value, but at this point the driver has already caused the
> device to do something no correct driver does (as of today, it could
> change in the future...) so undefined device behavior might be okay.
> 
> It would be easier to be confident if there was a single place to
> disable DMA re-entrancy for a device. The currently proposed API
> requires per-device code audits and fixes. It leaves decisions to the
> developer of each device. This will be a lot of work to fix and we
> cannot be confident that everything has been covered since this is an
> opt-in mechanism.
> 
> For these reasons it seems likely that DMA re-entrancy issues will
> continue to creep in. I think the only way to rule out this class of
> bugs is to implement a centralized change that doesn't involve fixing
> every DMA access in QEMU.
> 
> Thoughts?

Hi Stefan,
Do you have some ideas about how to do this centrally?
There were at least two attempts to do this in a centralized way, but it
seems there is some worry that edge cases will break. However, I'm
not sure there were any concrete examples of such breakages.

[1] https://lore.kernel.org/all/20210824120153.altqys6jjiuxh35p@sirius.home.kraxel.org/
[2] https://lore.kernel.org/all/20211217030858.834822-1-alxndr@bu.edu/
(AFAIK Neither handles the BH->DMA->MMIO case, at the moment)

-Alex

> 
> Stefan



