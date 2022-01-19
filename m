Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB6149426D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 22:19:43 +0100 (CET)
Received: from localhost ([::1]:50808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAIMn-0000Eo-Sm
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 16:19:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andre.przywara@arm.com>)
 id 1nAIJF-0005ek-Nc; Wed, 19 Jan 2022 16:16:02 -0500
Received: from foss.arm.com ([217.140.110.172]:59932)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andre.przywara@arm.com>)
 id 1nAIJC-0005pK-LV; Wed, 19 Jan 2022 16:16:00 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8081FED1;
 Wed, 19 Jan 2022 13:15:48 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45FCB3F774;
 Wed, 19 Jan 2022 13:15:47 -0800 (PST)
Date: Wed, 19 Jan 2022 21:15:05 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 00/13] arm gicv3 ITS: Various bug fixes and refactorings
Message-ID: <20220119211505.1895544d@slackpad.fritz.box>
In-Reply-To: <CAFEAcA_BdvbTDp8sJyB32EicB=mNxndgKe7GyNZqE9ER5Ow+wg@mail.gmail.com>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <87pmop7xfw.fsf@linaro.org>
 <CAFEAcA-ncYCtpH2aCjd4GWuN9SLcxGMQUOutBWyNHByD6_gG0w@mail.gmail.com>
 <20220118232935.50ae1b25@slackpad.fritz.box>
 <CAFEAcA_BdvbTDp8sJyB32EicB=mNxndgKe7GyNZqE9ER5Ow+wg@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=andre.przywara@arm.com; helo=foss.arm.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 Jan 2022 10:15:52 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

Hi Peter,

> On Tue, 18 Jan 2022 at 23:30, Andre Przywara <andre.przywara@arm.com> wrote:
> > Looking at k-u-t's arm/gic.c and QEMU's hw/intc/arm_gic.c I see two
> > problems here: QEMU implements word accesses as four successive calls to
> > gic_dist_readb() - which is probably fine if that helps code design,
> > but it won't allow it to actually spot access size issues. I just
> > remember that we spent some brain cells and CPP macros on getting the
> > access size right in KVM - hence those tests in kvm-unit-tests.  
> 
> Thanks for looking at this. I should have read the code rather
> than dashing off a reply last thing in the evening based just
> on the test case output! I think I was confusing how our GICv3
> emulation handles register accesses (with separate functions for
> byte/halfword/word/quad accesses) with the GICv2 emulation
> (which as you say calls down into the byte emulation code
> wherever it can).

No worries!

> > But more importantly it looks like GICD_IIDR is actually not
> > implemented: There is a dubious "if (offset < 0x08) return 0;" line,
> > but IIDR (offset 0x8) would actually fall through, and hit the bad_reg
> > label, which would return 0 (and cause the message, if enabled).  
> 
> Mmm. I actually have a patch in target-arm.next from Petr Pavlu
> which implements GICC_IIDR, but we do indeed not implement the
> distributor equivalent.

Well, returning 0 is actually not the worst idea. Using proper ID
values might not even be feasible for QEMU, or would create some hassle
with versioning. With 0 all a user can assume is spec compliance.

> > If that helps: from a GIC MMIO perspective 8-bit accesses are actually
> > the exception rather than the norm (ARM IHI 0048B.b 4.1.4 GIC register
> > access).  
> 
> Yes. We got this right in the GICv3 emulation design, where almost
> all the logic is in the 32-bit accessor functions and the 8/16-bit
> functions deal only with the very few registers that have to
> permit non-word accesses.

Indeed. I dusted off my old GICv3 MMIO patches for kvm-unit-tests, and
QEMU passed with flying colours. With the debug switch I see it
reporting exactly the violating accesses we except to see.
Will send those patches ASAP.

> The GICv2 code is a lot older (and to
> be fair to it, started out as 11MPcore interrupt controller
> emulation, and I bet the docs of that were not very specific about
> what registers could or could not be accessed byte at a time).
> Unless we want to rewrite all that logic in the GICv2 emulation
> (which I at least do not :-))

... and I can't ...

> I think we'll have to live with
> the warnings about bad-offsets reporting for each byte rather
> than just once for the word access.

Yeah, if those warnings appear only with that debug switch, there is
probably little reason to change that code just because of this. At
least it seemed to work quite well over the years.

Cheers,
Andre

P.S. I changed k-u-t to special case the UP case, so that TCG passes.
But now KVM fails, of course. So I will have to make a patch for the
kernel ...

