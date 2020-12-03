Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0962CDBB6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:04:56 +0100 (CET)
Received: from localhost ([::1]:41266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kks2J-0001uY-GD
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.rutland@arm.com>)
 id 1kkrwj-0007bz-7o
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:59:09 -0500
Received: from foss.arm.com ([217.140.110.172]:37932)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.rutland@arm.com>) id 1kkrwe-0002mJ-Pm
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:59:08 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24ADA11D4;
 Thu,  3 Dec 2020 08:59:03 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.0.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 495BC3F575;
 Thu,  3 Dec 2020 08:59:00 -0800 (PST)
Date: Thu, 3 Dec 2020 16:58:56 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v6 0/2] MTE support for KVM guest
Message-ID: <20201203165856.GH96754@C02TD0UTHF1T.local>
References: <20201127152113.13099-1-steven.price@arm.com>
 <20201203160943.GG96754@C02TD0UTHF1T.local>
 <77e65f06-563b-3b30-ab36-9670e8cc03a4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77e65f06-563b-3b30-ab36-9670e8cc03a4@arm.com>
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=mark.rutland@arm.com; helo=foss.arm.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, qemu-devel@nongnu.org,
 Catalin Marinas <catalin.marinas@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 04:49:49PM +0000, Steven Price wrote:
> On 03/12/2020 16:09, Mark Rutland wrote:
> > On Fri, Nov 27, 2020 at 03:21:11PM +0000, Steven Price wrote:
> > > It's been a week, and I think the comments on v5 made it clear that
> > > enforcing PROT_MTE requirements on the VMM was probably the wrong
> > > approach. So since I've got swap working correctly without that I
> > > thought I'd post a v6 which hopefully addresses all the comments so far.
> > > 
> > > This series adds support for Arm's Memory Tagging Extension (MTE) to
> > > KVM, allowing KVM guests to make use of it. This builds on the existing
> > > user space support already in v5.10-rc4, see [1] for an overview.
> > 
> > >   arch/arm64/include/asm/kvm_emulate.h       |  3 +++
> > >   arch/arm64/include/asm/kvm_host.h          |  8 ++++++++
> > >   arch/arm64/include/asm/pgtable.h           |  2 +-
> > >   arch/arm64/include/asm/sysreg.h            |  3 ++-
> > >   arch/arm64/kernel/mte.c                    | 18 +++++++++++++-----
> > >   arch/arm64/kvm/arm.c                       |  9 +++++++++
> > >   arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 14 ++++++++++++++
> > >   arch/arm64/kvm/mmu.c                       | 16 ++++++++++++++++
> > >   arch/arm64/kvm/sys_regs.c                  | 20 +++++++++++++++-----
> > >   include/uapi/linux/kvm.h                   |  1 +
> > >   10 files changed, 82 insertions(+), 12 deletions(-)
> > 
> > I note that doesn't fixup arch/arm64/kvm/inject_fault.c, where in
> > enter_exception64() we have:
> > 
> > | // TODO: TCO (if/when ARMv8.5-MemTag is exposed to guests)
> > 
> > ... and IIUC when MTE is present, TCO should be set when delivering an
> > exception, so I believe that needs to be updated to set TCO.
> 
> Well spotted! As you say TCO should be set when delivering an exception, so
> we need the following:
> 
> -       // TODO: TCO (if/when ARMv8.5-MemTag is exposed to guests)
> +       if (kvm_has_mte(vcpu->kvm))
> +               new |= PSR_TCO_BIT;

Something of that sort, yes.

It'd be worth a look for any mention of TCO or MTE in case there are
other bits that need a fixup.

> > Given that MTE-capable HW does that unconditionally, this is going to be
> > a mess for big.LITTLE. :/
> 
> I'm not sure I follow. Either all CPUs support MTE in which this isn't a
> problem, or the MTE feature just isn't exposed. We don't support a mix of
> MTE and non-MTE CPUs. There are several aspects of MTE which effective mean
> it's an all-or-nothing feature for the system.

So long as the host requires uniform MTE support, I agree that's not a
problem.

The fun is that the CPUs themselves will set TCO upon a real exception
regardless of whether the host is aware, and on a mismatched system some
CPUs will do that while others will not. In such a case the host and
guest will end up seeing the SPSR TCO bit set sometimes upon exceptions
from EL1 or EL2, and I hope that MTE-unaware CPUs ignore the bit upon
ERET, or we're going to have significant problems.

Thanks,
Mark.

