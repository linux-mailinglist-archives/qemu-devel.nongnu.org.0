Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E60C3E594C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 13:43:09 +0200 (CEST)
Received: from localhost ([::1]:35056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDQA0-00061y-59
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 07:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mDQ8S-0005Iv-Fl
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:41:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mDQ8P-0006Zv-H2
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 07:41:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628595688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t/xRQh+r13mTJygYYK/SMGowHF/ULBU11mRcXlPxUPo=;
 b=Z0XieZpelxUuHYQ0TuBXOkD6OFBV+JlF4Jk9Am8S9EPM2sdl/KaL5ArZSnpihPll6+zbh3
 QvKpgU/H0cnPvkvcwbY16PKNyNy1Skk3RRB5hRpGULx1xs8yiqkwzSZwOgbt8gQ/ect2/2
 vg2WHeW3w6MFqdqbntGHP6NmPTportQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-TF75UZSWMjmeg5Ra2DwDQw-1; Tue, 10 Aug 2021 07:41:27 -0400
X-MC-Unique: TF75UZSWMjmeg5Ra2DwDQw-1
Received: by mail-ed1-f72.google.com with SMTP id
 b25-20020a05640202d9b02903be7281a80cso2068855edx.3
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 04:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t/xRQh+r13mTJygYYK/SMGowHF/ULBU11mRcXlPxUPo=;
 b=PfVNTH8qmLu0IsFIzbPDmUFrO2WQjlZxhnGAOulvHOO5qFeUOSJZtlWj+CBMo9YAd8
 Y3ntvwOZZbsPZpGf9rhhGHyIUmu8iuMlc3czhqH85vs8M8vpNnqK6+D1Iff8I7ngUp4a
 Bwmt+RoOxinRwlvp5tMwBTYBp+PqDenTwFAI+XMyojp6OMBj/m1oyU5bRECVNAWa6Gzc
 +JJUS5R/maPobahww1oP85yZbBJhv147d0N/CliVC8eDGlrOSrqll/0upuMghduBKcUH
 2e+yOMRrjGPAKNG6UNV/f1MFY00l2feS1tM4APWxaz279IHVlo4PhnTeJQVAd73HiE/B
 6qmg==
X-Gm-Message-State: AOAM530zlPSjUl7jXRlXLa8UyNGmwwaOY8RbM633MGC7U6Ki8vDEGMN3
 bNpFZeeTP2Tii1JAbIIX18YbgGCaC/Wx1YtOrrb4GrQ2FwnwrZQzZSkn2Otye5/AU5KRqzKZrM7
 2Q115TD23yxi2xIU=
X-Received: by 2002:a17:906:b811:: with SMTP id
 dv17mr27046074ejb.444.1628595686043; 
 Tue, 10 Aug 2021 04:41:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+3bNekG/LmAwqqxsaUMUbvGFWLZ7DhCZMByaJfM8HD+HP8+LxvdVmvRDrZWS9xSJYFO4qBQ==
X-Received: by 2002:a17:906:b811:: with SMTP id
 dv17mr27046054ejb.444.1628595685741; 
 Tue, 10 Aug 2021 04:41:25 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id i6sm6752561ejd.57.2021.08.10.04.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 04:41:25 -0700 (PDT)
Date: Tue, 10 Aug 2021 13:41:23 +0200
From: Andrew Jones <drjones@redhat.com>
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v3 1/3] target-arm: cpu64: Add support for Fujitsu A64FX
Message-ID: <20210810114123.yn6uftzurby25q4b@gator.home>
References: <20210805073045.916622-1-ishii.shuuichir@fujitsu.com>
 <20210805073045.916622-2-ishii.shuuichir@fujitsu.com>
 <20210805112432.mjrqizexwyammfm5@gator.home>
 <TYCPR01MB6160A85D5A15580645876DB9E9F79@TYCPR01MB6160.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <TYCPR01MB6160A85D5A15580645876DB9E9F79@TYCPR01MB6160.jpnprd01.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 10, 2021 at 08:23:39AM +0000, ishii.shuuichir@fujitsu.com wrote:
> 
> Thanks for your comments.
> 
> Before reposting the fix patch series,
> based on your comments and the v3 1/3 patch,
> we have considered the following fixes.
> 
> If you have any comments on the fixes, please let us know.
> 
> ---
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9f0a5f84d5..84ebca731a 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2145,6 +2145,7 @@ enum arm_features {
>      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
>      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
>      ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
> +    ARM_FEATURE_A64FX, /* Fujitsu A64FX processor */
>  };
> 
>  static inline int arm_feature(CPUARMState *env, int feature)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 612644941b..62dcb6a919 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -248,6 +248,21 @@ static void aarch64_a72_initfn(Object *obj)
>      define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
>  }
> 
> +static void a64fx_cpu_set_sve(ARMCPU *cpu)
> +{
> +    /* Suppport of A64FX's vector length are 128,256 and 512byte only */

Missing spaces in text and s/byte/bit/

> +    bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ);
> +    bitmap_zero(cpu->sve_vq_init, ARM_MAX_VQ);
> +    set_bit(0, cpu->sve_vq_map); /* 128byte */
> +    set_bit(0, cpu->sve_vq_init);
> +    set_bit(1, cpu->sve_vq_map); /* 256byte */
> +    set_bit(1, cpu->sve_vq_init);
> +    set_bit(3, cpu->sve_vq_map); /* 512byte */
> +    set_bit(3, cpu->sve_vq_init);

For all the comments in the above function s/byte/bit/

> +    cpu->sve_max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
> +

Extra blank line

> +}
>  void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>  {
>      /*
> @@ -448,6 +463,10 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
> 
>      /* From now on sve_max_vq is the actual maximum supported length. */
>      cpu->sve_max_vq = max_vq;
> +
> +       if(arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
> +        a64fx_cpu_set_sve(cpu);
> +    }

Bad indentation and spacing, but I don't think this is the right place
for this. I wouldn't even let ARM_FEATURE_A64FX enter
arm_cpu_sve_finalize, since we know it doesn't support sve cpu properties.
While it's ugly wherever we put it, since we have to special case it, I
think it's less ugly at the callsite

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2866dd765882..225800ec361c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1350,10 +1350,14 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
     Error *local_err = NULL;
 
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        arm_cpu_sve_finalize(cpu, &local_err);
-        if (local_err != NULL) {
-            error_propagate(errp, local_err);
-            return;
+        if (arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
+            a64fx_cpu_set_sve(cpu);
+        } else {
+            arm_cpu_sve_finalize(cpu, &local_err);
+            if (local_err != NULL) {
+                error_propagate(errp, local_err);
+                return;
+            }
         }
 
         /*

>  }
> 
>  static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
> @@ -852,6 +871,7 @@ static void aarch64_a64fx_initfn(Object *obj)
>      ARMCPU *cpu = ARM_CPU(obj);
> 
>      cpu->dtb_compatible = "arm,a64fx";
> +    set_feature(&cpu->env, ARM_FEATURE_A64FX);
>      set_feature(&cpu->env, ARM_FEATURE_V8);
>      set_feature(&cpu->env, ARM_FEATURE_NEON);
>      set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> @@ -884,10 +904,6 @@ static void aarch64_a64fx_initfn(Object *obj)
>      cpu->gic_vpribits = 5;
>      cpu->gic_vprebits = 5;
>      /* TODO:  Add A64FX specific HPC extension registers */
> -
> -    aarch64_add_sve_properties(obj);
> -    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
> -                        cpu_max_set_sve_max_vq, NULL, NULL);
>  }
> 
>  static const ARMCPUInfo aarch64_cpus[] = {

Otherwise looks OK to me.

Thanks,
drew

> 
> ---
> 
> Best regards.
> 
> 
> > -----Original Message-----
> > From: Andrew Jones <drjones@redhat.com>
> > Sent: Thursday, August 5, 2021 8:25 PM
> > To: Ishii, Shuuichirou <ishii.shuuichir@fujitsu.com>
> > Cc: peter.maydell@linaro.org; qemu-arm@nongnu.org; qemu-devel@nongnu.org
> > Subject: Re: [PATCH v3 1/3] target-arm: cpu64: Add support for Fujitsu A64FX
> > 
> > On Thu, Aug 05, 2021 at 04:30:43PM +0900, Shuuichirou Ishii wrote:
> > > Add a definition for the Fujitsu A64FX processor.
> > >
> > > The A64FX processor does not implement the AArch32 Execution state, so
> > > there are no associated AArch32 Identification registers.
> > >
> > > Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> > > ---
> > >  target/arm/cpu64.c | 44
> > ++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 44 insertions(+)
> > >
> > > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c index
> > > c690318a9b..612644941b 100644
> > > --- a/target/arm/cpu64.c
> > > +++ b/target/arm/cpu64.c
> > > @@ -847,10 +847,54 @@ static void aarch64_max_initfn(Object *obj)
> > >                          cpu_max_set_sve_max_vq, NULL, NULL);  }
> > >
> > > +static void aarch64_a64fx_initfn(Object *obj) {
> > > +    ARMCPU *cpu = ARM_CPU(obj);
> > > +
> > > +    cpu->dtb_compatible = "arm,a64fx";
> > > +    set_feature(&cpu->env, ARM_FEATURE_V8);
> > > +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> > > +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> > > +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> > > +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> > > +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> > > +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> > > +    cpu->midr = 0x461f0010;
> > > +    cpu->revidr = 0x00000000;
> > > +    cpu->ctr = 86668006;
> > > +    cpu->reset_sctlr = 0x30000180;
> > > +    cpu->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS Extensions
> > */
> > > +    cpu->isar.id_aa64pfr1 = 0x0000000000000000;
> > > +    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
> > > +    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
> > > +    cpu->id_aa64afr0 = 0x0000000000000000;
> > > +    cpu->id_aa64afr1 = 0x0000000000000000;
> > > +    cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
> > > +    cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
> > > +    cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
> > > +    cpu->isar.id_aa64isar0 = 0x0000000010211120;
> > > +    cpu->isar.id_aa64isar1 = 0x0000000000010001;
> > > +    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
> > > +    cpu->clidr = 0x0000000080000023;
> > > +    cpu->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
> > > +    cpu->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
> > > +    cpu->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
> > > +    cpu->dcz_blocksize = 6; /* 256 bytes */
> > > +    cpu->gic_num_lrs = 4;
> > > +    cpu->gic_vpribits = 5;
> > > +    cpu->gic_vprebits = 5;
> > > +    /* TODO:  Add A64FX specific HPC extension registers */
> > > +
> > > +    aarch64_add_sve_properties(obj);
> > > +    object_property_add(obj, "sve-max-vq", "uint32",
> > cpu_max_get_sve_max_vq,
> > > +                        cpu_max_set_sve_max_vq, NULL, NULL);
> > 
> > I'm not a huge fan of the sve-max-vq property since it's not a good idea to use it
> > with KVM, because it's not explicit enough for migration[1]. I realize the a64fx cpu
> > type will likely never be used with KVM, but since sve-max-vq isn't necessary[2],
> > than I would avoid propagating it to another cpu type. Finally, if you want the a64fx
> > cpu model to represent the current a64fx cpu, then don't you want to explicitly set
> > the supported vector lengths[3] and deny the user the option to change them? You
> > could do that by directly setting the vq map and not adding the sve properties.
> > 
> > [1] With KVM, sve-max-vq only tells you the maximum vq, but it won't tell you that
> > the host doesn't support non-power-of-2 vector lengths. So you don't get an
> > explicit vector length list on the command line. Being explicit is the only safe way
> > to migrate (see docs/system/arm/cpu-features.rst:"SVE CPU Property
> > Recommendations").
> > 
> > [2] If a shorthand is desired for specifying vector lengths, then just use a single
> > sve<N> property. For example, sve-max-vq=4 and sve512=on are identical (but
> > keep [1] in mind).
> > 
> > [3] a64fx only support 128, 256, and 512 bit vector lengths, afaik.
> > 
> > Thanks,
> > drew
> > 
> > > +}
> > > +
> > >  static const ARMCPUInfo aarch64_cpus[] = {
> > >      { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
> > >      { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
> > >      { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
> > > +    { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
> > >      { .name = "max",                .initfn = aarch64_max_initfn },
> > >  };
> > >
> > > --
> > > 2.27.0
> > >
> > >
> 


