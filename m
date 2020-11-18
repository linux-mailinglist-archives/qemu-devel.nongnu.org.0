Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3839C2B82AA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 18:08:56 +0100 (CET)
Received: from localhost ([::1]:52768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfQwx-00049p-75
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 12:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1kfQr5-0000HH-W3
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:02:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:53600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1kfQr3-00089N-Mt
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:02:51 -0500
Received: from trantor (unknown [2.26.170.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 846B42487D;
 Wed, 18 Nov 2020 17:02:44 +0000 (UTC)
Date: Wed, 18 Nov 2020 17:02:41 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v4 1/2] arm64: kvm: Save/restore MTE registers
Message-ID: <X7VTsaO/7+Izqm8/@trantor>
References: <20201026155727.36685-1-steven.price@arm.com>
 <20201026155727.36685-2-steven.price@arm.com>
 <b8f2fe15e0cab5c24094915b8c000930@kernel.org>
 <98eaa539-0ae8-ce4c-8886-3040542ede80@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98eaa539-0ae8-ce4c-8886-3040542ede80@arm.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=cmarinas@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 11:50:11
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, qemu-devel@nongnu.org,
 Marc Zyngier <maz@kernel.org>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 04:01:18PM +0000, Steven Price wrote:
> On 17/11/2020 19:20, Marc Zyngier wrote:
> > On 2020-10-26 15:57, Steven Price wrote:
> > > diff --git a/arch/arm64/include/asm/sysreg.h
> > > b/arch/arm64/include/asm/sysreg.h
> > > index d52c1b3ce589..7727df0bc09d 100644
> > > --- a/arch/arm64/include/asm/sysreg.h
> > > +++ b/arch/arm64/include/asm/sysreg.h
> > > @@ -565,7 +565,8 @@
> > >  #define SCTLR_ELx_M    (BIT(0))
> > > 
> > >  #define SCTLR_ELx_FLAGS    (SCTLR_ELx_M  | SCTLR_ELx_A | SCTLR_ELx_C | \
> > > -             SCTLR_ELx_SA | SCTLR_ELx_I | SCTLR_ELx_IESB)
> > > +             SCTLR_ELx_SA | SCTLR_ELx_I | SCTLR_ELx_IESB | \
> > > +             SCTLR_ELx_ITFSB)
> > > 
> > >  /* SCTLR_EL2 specific flags. */
> > >  #define SCTLR_EL2_RES1    ((BIT(4))  | (BIT(5))  | (BIT(11)) |
> > > (BIT(16)) | \
> > > diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> > > b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> > > index 7a986030145f..a124ffa49ba3 100644
> > > --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> > > +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> > > @@ -18,6 +18,11 @@
> > >  static inline void __sysreg_save_common_state(struct
> > > kvm_cpu_context *ctxt)
> > >  {
> > >      ctxt_sys_reg(ctxt, MDSCR_EL1)    = read_sysreg(mdscr_el1);
> > > +    if (system_supports_mte()) {
> > > +        ctxt_sys_reg(ctxt, RGSR_EL1)    = read_sysreg_s(SYS_RGSR_EL1);
> > > +        ctxt_sys_reg(ctxt, GCR_EL1)    = read_sysreg_s(SYS_GCR_EL1);
> > > +        ctxt_sys_reg(ctxt, TFSRE0_EL1)    =
> > > read_sysreg_s(SYS_TFSRE0_EL1);
> > 
> > As far as I can tell, HCR_EL2.ATA is still clear when running a guest.
> > So why, do we save/restore this state yet?
> > 
> > Also, I wonder whether we should keep these in the C code. If one day
> > we enable MTE in the kernel, we will have to move them to the assembly
> > part, much like we do for PAuth. And I fear that "one day" is pretty
> > soon:
> > 
> > https://lore.kernel.org/linux-arm-kernel/cover.1605046192.git.andreyknvl@google.com/
> 
> Good point. Although for MTE we do have the option of setting TCO in PSTATE
> so this could remain in C if we're not bothered about the 'gap' in KASAN
> coverage. I haven't yet got my head around how (or indeed if) that series
> handles guests.

I think we should be fine with the currently proposed in-kernel MTE
support. However, setting GCR_EL1 can get in the way if stack tagging is
ever enabled (it breaks single image). The compiler uses GCR_EL1 to
generate different colours for variables on the stack and changing it in
the middle of a function may cause confusion. You'd have to set
PSTATE.TCO for the whole function, either from the caller or, if the
compiler gets smarter, some function attribute.

-- 
Catalin

