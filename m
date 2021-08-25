Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EAE3F741A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:09:14 +0200 (CEST)
Received: from localhost ([::1]:48726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqmP-0004Eq-Nr
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIqNJ-00006w-KO
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:43:17 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:34748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIqNH-0001rW-Kt
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:43:17 -0400
Received: by mail-ot1-f52.google.com with SMTP id
 k12-20020a056830150c00b0051abe7f680bso49211003otp.1
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ssroUs7Zw0tps6spnrbwoh0XAHH4NKMKdQm+UHZF+1E=;
 b=UkXcyaXONoUbqAZclotCeafWKTLUDg1AEWxD1Fqli/yUFerQZsYCmRc3JkHTN7FzAY
 QdUz+QEkmmwUc5cdV6sF9Mw8GyBfST/natdaAPOxL78EubfJQglElviK0O6J1xHUBrCg
 U6/eav1gh8h19JJnrfYWmm0sL2RJluQkeyj6+MK5qc51fb+BrlqKICqpJ9vfLWZzzQ2D
 g+G3Ny/MV6kMRJW4XeWOQKpkBtR9hpXkkcJKlSH0Oj70SVHMSPsNu81THN1LMLFPfwjr
 jS5oMVZznFmp0TWn+sBAOdhGBLV+j7InUGWiw8c+9wuRIwUjCe/BrF4170jsl5qi3niU
 UWrw==
X-Gm-Message-State: AOAM532VQqk37Hah0Ydt1LgJjXp/IiT094asG+4mU6CnzXVuFqOcpLfQ
 dvelkXSeXkWPpW3h/y9RiThGju2i/IPRnKPhQXQ=
X-Google-Smtp-Source: ABdhPJxc0gV/69maQ5n1Xpc5Luocngh0Qpi3GOt3quqN+u5iMfoRiPZKQ1DxPkAEqgW8hsaj6Fm38QagmI4EYCewms8=
X-Received: by 2002:a05:6830:18c7:: with SMTP id
 v7mr35389498ote.126.1629888194453; 
 Wed, 25 Aug 2021 03:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210825095100.20180-1-mark.cave-ayland@ilande.co.uk>
 <74177bc7-384b-60cd-daa7-084d9a3f7c67@amsat.org>
 <6f07e32a-2cec-fac1-10a6-41057698f001@ilande.co.uk>
In-Reply-To: <6f07e32a-2cec-fac1-10a6-41057698f001@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 25 Aug 2021 12:43:03 +0200
Message-ID: <CAAdtpL6Ne3YkG7H-Ha_ROmCw9o9qs24jKn+7aBMNgMQXGC2=MQ@mail.gmail.com>
Subject: Re: [PATCH] sun4m: fix setting CPU id when more than one CPU is
 present
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>, 
 KONRAD Frederic <frederic.konrad@adacore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.52;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f52.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Leon3 maintainers

On Wed, Aug 25, 2021 at 12:39 PM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
> On 25/08/2021 11:29, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 8/25/21 11:51 AM, Mark Cave-Ayland wrote:
> >> Commit 24f675cd3b ("sparc/sun4m: Use start-powered-off CPUState proper=
ty") changed
> >> the sun4m CPU reset code to use the start-powered-off property and so =
split the
> >> creation of the CPU into separate instantiation and realization phases=
 to enable
> >> the new start-powered-off property to be set.
> >>
> >> This accidentally broke sun4m machines with more than one CPU present =
since
> >> sparc_cpu_realizefn() sets a default CPU id, and now that realization =
occurs after
> >> calling cpu_sparc_set_id() in cpu_devinit() the CPU id gets reset back=
 to the
> >> default instead of being uniquely encoded based upon the CPU number. A=
s soon as
> >> another CPU is brought online, the OS gets confused between them and p=
romptly
> >> panics.
> >>
> >> Resolve the issue by moving the cpu_sparc_set_id() call in cpu_devinit=
() to after
> >> the point where the CPU device has been realized as before.
> >>
> >> Fixes: 24f675cd3b ("sparc/sun4m: Use start-powered-off CPUState proper=
ty")
> >> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >> ---
> >>   hw/sparc/sun4m.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> >> index 42e139849e..7f3a7c0027 100644
> >> --- a/hw/sparc/sun4m.c
> >> +++ b/hw/sparc/sun4m.c
> >> @@ -803,11 +803,11 @@ static void cpu_devinit(const char *cpu_type, un=
signed int id,
> >>       cpu =3D SPARC_CPU(object_new(cpu_type));
> >>       env =3D &cpu->env;
> >>
> >> -    cpu_sparc_set_id(env, id);
> >>       qemu_register_reset(sun4m_cpu_reset, cpu);
> >>       object_property_set_bool(OBJECT(cpu), "start-powered-off", id !=
=3D 0,
> >>                                &error_fatal);
> >>       qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
> >> +    cpu_sparc_set_id(env, id);
> >>       *cpu_irqs =3D qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
> >>       env->prom_addr =3D prom_addr;
> >>   }
> >
> > What about directly passing the CPU ID as property (untested):
> >
> > -- >8 --
> > Author: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Date:   Wed Aug 25 12:26:02 2021 +0200
> >
> >      sun4m: fix setting CPU id when more than one CPU is present
> >
> >      Commit 24f675cd3b ("sparc/sun4m: Use start-powered-off CPUState
> > property") changed
> >      the sun4m CPU reset code to use the start-powered-off property and
> > so split the
> >      creation of the CPU into separate instantiation and realization
> > phases to enable
> >      the new start-powered-off property to be set.
> >
> >      This accidentally broke sun4m machines with more than one CPU
> > present since
> >      sparc_cpu_realizefn() sets a default CPU id, and now that
> > realization occurs after
> >      calling cpu_sparc_set_id() in cpu_devinit() the CPU id gets reset
> > back to the
> >      default instead of being uniquely encoded based upon the CPU numbe=
r.
> > As soon as
> >      another CPU is brought online, the OS gets confused between them a=
nd
> > promptly
> >      panics.
> >
> >      Resolve the issue by adding a 'cpu-id' property to CPUSPARCState,
> > removing
> >      cpu_sparc_set_id().
> >
> >      Fixes: 24f675cd3b ("sparc/sun4m: Use start-powered-off CPUState
> > property")
> >      Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >      Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >
> > diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
> > index ff8ae73002a..78ca0925d25 100644
> > --- a/target/sparc/cpu.h
> > +++ b/target/sparc/cpu.h
> > @@ -262,6 +262,7 @@ struct sparc_def_t {
> >       uint32_t mmu_cxr_mask;
> >       uint32_t mmu_sfsr_mask;
> >       uint32_t mmu_trcr_mask;

 #if !defined(TARGET_SPARC64)

> > +    uint8_t mxcc_cpuid;

#endif

> >       uint32_t mxcc_version;
> >       uint32_t features;
> >       uint32_t nwindows;
> > @@ -583,7 +584,6 @@ void cpu_raise_exception_ra(CPUSPARCState *, int,
> > uintptr_t) QEMU_NORETURN;
> >
> >   #ifndef NO_CPU_IO_DEFS
> >   /* cpu_init.c */
> > -void cpu_sparc_set_id(CPUSPARCState *env, unsigned int cpu);
> >   void sparc_cpu_list(void);
> >   /* mmu_helper.c */
> >   bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> > diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
> > index 7b4dec17211..8189045fdbf 100644
> > --- a/hw/sparc/leon3.c
> > +++ b/hw/sparc/leon3.c
> > @@ -238,8 +238,6 @@ static void leon3_generic_hw_init(MachineState *mac=
hine)
> >       cpu =3D SPARC_CPU(cpu_create(machine->cpu_type));
> >       env =3D &cpu->env;
> >
> > -    cpu_sparc_set_id(env, 0);
> > -
> >       /* Reset data */
> >       reset_info        =3D g_malloc0(sizeof(ResetData));
> >       reset_info->cpu   =3D cpu;
> > diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> > index 42e139849ed..5be2e8e73f2 100644
> > --- a/hw/sparc/sun4m.c
> > +++ b/hw/sparc/sun4m.c
> > @@ -803,10 +803,10 @@ static void cpu_devinit(const char *cpu_type,
> > unsigned int id,
> >       cpu =3D SPARC_CPU(object_new(cpu_type));
> >       env =3D &cpu->env;
> >
> > -    cpu_sparc_set_id(env, id);
> >       qemu_register_reset(sun4m_cpu_reset, cpu);
> >       object_property_set_bool(OBJECT(cpu), "start-powered-off", id !=
=3D 0,
> >                                &error_fatal);
> > +    object_property_set_uint(OBJECT(cpu), "cpu-id", id, &error_fatal);
> >       qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
> >       *cpu_irqs =3D qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
> >       env->prom_addr =3D prom_addr;
> > diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> > index da6b30ec747..d76929c68c7 100644
> > --- a/target/sparc/cpu.c
> > +++ b/target/sparc/cpu.c
> > @@ -194,13 +194,6 @@ static void sparc_cpu_parse_features(const char
> > *typename, char *features,
> >       g_list_free_full(minus_features, g_free);
> >   }
> >
> > -void cpu_sparc_set_id(CPUSPARCState *env, unsigned int cpu)
> > -{
> > -#if !defined(TARGET_SPARC64)
> > -    env->mxccregs[7] =3D ((cpu + 8) & 0xf) << 24;
> > -#endif
> > -}
> > -
> >   static const sparc_def_t sparc_defs[] =3D {
> >   #ifdef TARGET_SPARC64
> >       {
> > @@ -754,7 +747,7 @@ static void sparc_cpu_realizefn(DeviceState *dev,
> > Error **errp)
> >       env->nwindows =3D env->def.nwindows;
> >   #if !defined(TARGET_SPARC64)
> >       env->mmuregs[0] |=3D env->def.mmu_version;
> > -    cpu_sparc_set_id(env, 0);
> > +    env->mxccregs[7] =3D ((env->def.mxcc_cpuid + 8) & 0xf) << 24;
> >       env->mxccregs[7] |=3D env->def.mxcc_version;
> >   #else
> >       env->mmu_version =3D env->def.mmu_version;
> > @@ -843,6 +836,7 @@ static Property sparc_cpu_properties[] =3D {
> >                            qdev_prop_uint64, target_ulong),
> >       DEFINE_PROP_UINT32("fpu-version", SPARCCPU, env.def.fpu_version, =
0),
> >       DEFINE_PROP_UINT32("mmu-version", SPARCCPU, env.def.mmu_version, =
0),

 #if !defined(TARGET_SPARC64)

> > +    DEFINE_PROP_UINT8("cpu-id", SPARCCPU, env.def.mxcc_cpuid, 0),

#endif

> >       DEFINE_PROP("nwindows", SPARCCPU, env.def.nwindows,
> >                   qdev_prop_nwindows, uint32_t),
> >       DEFINE_PROP_END_OF_LIST()
>
> The existing code was obviously written with some flexibility here as to =
why id !=3D
> cs->cpu_index, but since Blue Swirl is no longer around I don't really kn=
ow what the
> test cases are and why the default is required, so I'd rather preserve th=
e existing
> behaviour for now.
>
> Also MXCC is specific to 32-bit SPARC: maybe it was written this way to a=
llow for
> future multi-CPU support for 64-bit SPARC?

Will this happen?

