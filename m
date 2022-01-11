Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8EB48B00A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:59:21 +0100 (CET)
Received: from localhost ([::1]:37786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7IcJ-00085f-CW
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:59:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1n7IIH-0000k3-Vm; Tue, 11 Jan 2022 09:38:38 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:40746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1n7IIF-00074v-8F; Tue, 11 Jan 2022 09:38:37 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 60C8B6167E;
 Tue, 11 Jan 2022 14:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB588C36AEB;
 Tue, 11 Jan 2022 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641911911;
 bh=PutJFyltCPb08IZGrqTG7R4v/+VWa2fWSkEQMTS1hjQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vJLu/yvnRPB69/k+Fv8GIeC1OlS1qTs16aPTiG/GocigM2X68NkMrFntdVM5KWvME
 8Pc5RMtfD4FtG3TBcdPd0KOiOV8sw8MPg3KYDMXBTKrEESCpCUioJgWfNbzu+1TAaw
 LC7yuzFbUNre1tMlcAW448a3x6zwOK2MBT2TrnVN3nfuzn5WqqlekdslxOo3b45n6L
 cfwTo9pFU5f/vIpLHiloC22/u4wstIC6tWBbyDUq0mVydIWEDizsdmeQZl+aQHf48M
 moH6NJ1D3TQ4/XGNM7JHOf+So7JEPkgDYu0aNvVzs13HQ0nzUVIRQ+eKyXo+1C3PmN
 bgACAcvR7nwYA==
Received: by mail-wr1-f42.google.com with SMTP id o3so33340592wrh.10;
 Tue, 11 Jan 2022 06:38:31 -0800 (PST)
X-Gm-Message-State: AOAM530s5zOcyg4B0wkgCzZ8T5hQca2+Zc5DDZggLr5c1PIwCmLvO7em
 od7gtijW9jVdhuOU79HMkZr3/6sqF58DVtWuqas=
X-Google-Smtp-Source: ABdhPJxBUePMV/E6p9QgpEik4wDUgYI+FROc0VBYwc0vPWYiHY8c3dYMp963/+uRAyyDrTnwT96R1ylLT3jwDQZDqi8=
X-Received: by 2002:a5d:6210:: with SMTP id y16mr3899265wru.454.1641911910149; 
 Tue, 11 Jan 2022 06:38:30 -0800 (PST)
MIME-Version: 1.0
References: <20220108150952.1483911-1-ardb@kernel.org>
 <CAFEAcA9DCzNJ8q7wLqSW-4pCzGM4gSvo2FLVhkG94cdriYj4zQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9DCzNJ8q7wLqSW-4pCzGM4gSvo2FLVhkG94cdriYj4zQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 11 Jan 2022 15:38:18 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFg_q=43YXScs_pOb3f21V_2dv+HMm3sR3YUu+HK222TA@mail.gmail.com>
Message-ID: <CAMj1kXFg_q=43YXScs_pOb3f21V_2dv+HMm3sR3YUu+HK222TA@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm/cpu64: Use 32-bit GDBstub when running in
 32-bit KVM mode
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ardb@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Alex Bennee <alex.bennee@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Jan 2022 at 15:11, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 8 Jan 2022 at 15:10, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > When running under KVM, we may decide to run the CPU in 32-bit mode, by
> > setting the 'aarch64=off' CPU option. In this case, we need to switch to
> > the 32-bit version of the GDB stub too, so that GDB has the correct view
> > of the CPU state. Without this, GDB debugging does not work at all, and
> > errors out upon connecting to the target with a mysterious 'g' packet
> > length error.
> >
> > Cc: Richard Henderson <richard.henderson@linaro.org>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: Alex Bennee <alex.bennee@linaro.org>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> > v2: refactor existing CPUClass::gdb_... member assignments for the
> >     32-bit code so we can reuse it for the 64-bit code
> >
> >  target/arm/cpu.c   | 16 +++++++++++-----
> >  target/arm/cpu.h   |  2 ++
> >  target/arm/cpu64.c |  3 +++
> >  3 files changed, 16 insertions(+), 5 deletions(-)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index a211804fd3df..ae8e78fc1472 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -2049,6 +2049,15 @@ static const struct TCGCPUOps arm_tcg_ops = {
> >  };
> >  #endif /* CONFIG_TCG */
> >
> > +void arm_cpu_class_gdb_init(CPUClass *cc)
> > +{
> > +    cc->gdb_read_register = arm_cpu_gdb_read_register;
> > +    cc->gdb_write_register = arm_cpu_gdb_write_register;
> > +    cc->gdb_num_core_regs = 26;
> > +    cc->gdb_core_xml_file = "arm-core.xml";
> > +    cc->gdb_arch_name = arm_gdb_arch_name;
> > +}
>
> Most of these fields are not used by the gdbstub until
> runtime, but cc->gdb_num_core_regs is used earlier.
> In particular, in cpu_common_initfn() we copy that value
> into cpu->gdb_num_regs and cpu->gdb_num_g_regs (this happens
> at the CPU object's instance_init time, ie before the
> aarch64_cpu_set_aarch64 function is called), and these are the
> values that are then used when registering dynamic sysreg
> XML, coprocessor registers, etc.
>

Right.

> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -906,6 +906,7 @@ static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
> >  static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
> >  {
> >      ARMCPU *cpu = ARM_CPU(obj);
> > +    CPUClass *cc = CPU_GET_CLASS(obj);
>
> This is called to change the property for a specific CPU
> object -- you can't change the values of the *class* here.
> (Consider a system with 2 CPUs, one of which has aarch64=yes
> and one of which has aarch64=no.)
>

So how is this fundamentally going to work then? Which GDB stub should
we choose in such a case?


> >      /* At this time, this property is only allowed if KVM is enabled.  This
> >       * restriction allows us to avoid fixing up functionality that assumes a
> > @@ -919,6 +920,8 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
> >              return;
> >          }
> >          unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
> > +
> > +        arm_cpu_class_gdb_init(cc)
>
> This fails to compile because of the missing semicolon...
>

Oops, my bad. I spotted this locally as well but failed to fold it
into the patch.

> >      } else {
> >          set_feature(&cpu->env, ARM_FEATURE_AARCH64);
>
> If the user (admittedly slightly perversely) toggles the
> aarch64 flag from on to off to on again, we should reset the
> gdb function pointers to the aarch64 versions again.
>

Ack.

So I can fix most of these issues, but the fundamental one remains, so
I'll hold off on a v3 until we can settle that.

Thanks,
Ard.

