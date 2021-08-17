Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B423EEC03
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 13:58:09 +0200 (CEST)
Received: from localhost ([::1]:50176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFxjL-00007t-Mo
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 07:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mFxi0-00070U-Cl
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 07:56:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mFxhx-0003cr-42
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 07:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629201400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=84XyAtvJyFLdp7jlKAii+jMH1a2ynH5yrczc5XEe0uU=;
 b=DKLxlhRphob20wqqgtWuzq4ndf6ifo6v4nhtudgnpe5u7TQjNRWY5Ns6a07qZAd+1BFTwp
 2kXde0tRcoPhnlxdb3MLuJdXPZTf9jqNdCx1gNk1t4U916rKKDQqL0NqS9hRG1usGpD0oW
 L1E6pVchWk7gnruFRoMeoqoBBZI5ToM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-wlI98vu8OTyc_UcOXna1qA-1; Tue, 17 Aug 2021 07:56:39 -0400
X-MC-Unique: wlI98vu8OTyc_UcOXna1qA-1
Received: by mail-ej1-f70.google.com with SMTP id
 v19-20020a170906b013b02905b2f1bbf8f3so5888584ejy.6
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 04:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=84XyAtvJyFLdp7jlKAii+jMH1a2ynH5yrczc5XEe0uU=;
 b=V6+d8SB209mFV6p2lSELJkm5WzEeX8qKL70fLSTVn6dfsDGlekvqyIx5ye4xcq/MfJ
 VrVcXcBU/QE9PtW4bCUcfLGCZxP1R/tthCMQg5+QggVabJl/rVoS3Wx7DIqQPF8HYkh8
 VtAZ5a49n46vs1U38lAfjjC4KS2t9LwduMvGVBa6fQbeHpx2xGOHjtD2b9gE4tBp1EIl
 sOhEIUOhcOmNK/Rd8dZwXfwzVC51Ma8ibm6ZSkYc60BuQzBzSIPYJ9toYrDg8t8zaQk8
 LqJ4TH0R1ZNOHZ4vanz5ho4SctjpvC7n6AqeGZfaGKw/B5lyDm15lcLyZW+3HZuRTyJ3
 xm9w==
X-Gm-Message-State: AOAM532Jm8+fxoxijNwPrAPjVDlxTd7mm35eExX5XKQjy0zIwheGH2GG
 yFdagPY2P2S5LX0yZ1FnU6XQchsZqRPLz0irIVb/uAoCLy8RJ6Qe+X0jig9RmG0D/U/A7poidvJ
 e7kcxwyvXk5wIv54=
X-Received: by 2002:a05:6402:649:: with SMTP id
 u9mr3675626edx.224.1629201398109; 
 Tue, 17 Aug 2021 04:56:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwys5BU+wKMAFiEjh9t0ZGa5uz9w09E9gjEXDJYdxTs5RkqUPZD4BRqZBj/Lb/IUN880EoIvQ==
X-Received: by 2002:a05:6402:649:: with SMTP id
 u9mr3675604edx.224.1629201397850; 
 Tue, 17 Aug 2021 04:56:37 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id hg25sm682427ejc.109.2021.08.17.04.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 04:56:37 -0700 (PDT)
Date: Tue, 17 Aug 2021 13:56:35 +0200
From: Andrew Jones <drjones@redhat.com>
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Message-ID: <20210817115635.d2wxvnvis5kupegh@gator.home>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
 <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
 <20210812092517.mwcfhksoe4cgy3cl@gator.home>
 <TYCPR01MB6160B0A6E08CAE7CB2C6D8F0E9FE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <TYCPR01MB6160B0A6E08CAE7CB2C6D8F0E9FE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

On Tue, Aug 17, 2021 at 06:43:58AM +0000, ishii.shuuichir@fujitsu.com wrote:
> 
> > On Thu, 12 Aug 2021 at 10:25, Andrew Jones <drjones@redhat.com> wrote:
> > > On second thought, do we want the QMP CPU model expansion query to
> > > show that this CPU type has sve,sve128,sve256,sve512? If so, then our
> > > SVE work isn't complete, because we need those properties, set true by
> > > default, but forbidden from changing.
> > 
> > Do we have precedent elsewhere (arm, x86, wherever) for "this CPU object
> > exposes these properties as constant unwriteable" ?
> 
> We have not yet conducted a confirmation of Peter's question, but...
> 
> > On second thought, do we want the QMP CPU model expansion query to show that
> > this CPU type has sve,sve128,sve256,sve512? If so, then our SVE work isn't
> > complete, because we need those properties, set true by default, but forbidden
> > from changing.
> 
> Based on Andrew's comment, 
> We have created a patch based on v4 that works as intended in QMP.
> 
> ----------
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 162e46afc3..2d9f779cb6 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1345,29 +1345,12 @@ static void arm_cpu_finalizefn(Object *obj)
>  #endif
>  }
> 
> -static void a64fx_cpu_set_sve(ARMCPU *cpu)
> -{
> -    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> -    bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ);
> -    bitmap_zero(cpu->sve_vq_init, ARM_MAX_VQ);
> -    set_bit(0, cpu->sve_vq_map); /* 128bit */
> -    set_bit(0, cpu->sve_vq_init);
> -    set_bit(1, cpu->sve_vq_map); /* 256bit */
> -    set_bit(1, cpu->sve_vq_init);
> -    set_bit(3, cpu->sve_vq_map); /* 512bit */
> -    set_bit(3, cpu->sve_vq_init);
> -
> -    cpu->sve_max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
> -}
> -
>  void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>  {
>      Error *local_err = NULL;
> 
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> -        if (arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
> -            a64fx_cpu_set_sve(cpu);
> -        } else {
> +        if (!arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
>              arm_cpu_sve_finalize(cpu, &local_err);
>              if (local_err != NULL) {
>                  error_propagate(errp, local_err);
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 5e7e885f9d..1ec2a7c6da 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -847,6 +847,23 @@ static void aarch64_max_initfn(Object *obj)
>                          cpu_max_set_sve_max_vq, NULL, NULL);
>  }
> 
> +static void a64fx_cpu_set_sve(Object *obj)
> +{
> +    int i;
> +    Error *errp = NULL;
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> +    const char *vl[] = {"sve128", "sve256", "sve512"};
> +
> +    for(i = 0; i <sizeof(vl)/sizeof(vl[0]); i++){
> +        object_property_add(obj, vl[i], "bool", cpu_arm_get_sve_vq,
> +                            cpu_arm_set_sve_vq, NULL, NULL);
> +        object_property_set_bool(obj, vl[i], true, &errp);
> +    }
> +
> +    cpu->sve_max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
> +}
> +
>  static void aarch64_a64fx_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> @@ -885,6 +902,9 @@ static void aarch64_a64fx_initfn(Object *obj)
>      cpu->gic_vpribits = 5;
>      cpu->gic_vprebits = 5;
> 
> +    /* Set SVE properties */
> +    a64fx_cpu_set_sve(obj);
> +
>      /* TODO:  Add A64FX specific HPC extension registers */
>  }
> ----------
> 
> In the case of the patch above,
> it is possible to identify only the SVE vector length supported by A64FX from QMP, 
> as shown in the following result.
> 
> ----------
> Welcome to the QMP low-level shell!
> Connected to QEMU 6.0.93
> 
> (QEMU) query-cpu-model-expansion type=full model={"name":"a64fx"}
> {"return": {"model": {"name": "a64fx", "props": {"sve128": true, "sve256": true, "sve512": true, "aarch64": true, "pmu": true}}}}
> (QEMU)
> ----------
> 
> How about this kind of fix?

This looks reasonable to me, but you also need the 'sve' property that
states sve in supported at all.

> However, by allowing the sve128, sve256, and sve512 properties to be specified, 
> the user can explicitly change the settings (ex: sve128=off), 
> but the only properties that can be set is the vector length supported by A64FX. 
> We personally think this is a no problem.

I guess it's fine. You could easily create a new cpu_arm_set_sve_vq()
which would forbid changing the properties if you wanted to, but then
we need to answer Peter's question in order to see if there's a
precedent for that type of property.

Thanks,
drew

> 
> We would appreciate your comments.
> 
> Best regards.
> 
> > -----Original Message-----
> > From: Andrew Jones <drjones@redhat.com>
> > Sent: Thursday, August 12, 2021 6:25 PM
> > To: Ishii, Shuuichirou/石井 周一郎 <ishii.shuuichir@fujitsu.com>
> > Cc: peter.maydell@linaro.org; qemu-arm@nongnu.org; qemu-devel@nongnu.org
> > Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
> > 
> > On Thu, Aug 12, 2021 at 11:16:50AM +0200, Andrew Jones wrote:
> > > On Thu, Aug 12, 2021 at 03:04:38PM +0900, Shuuichirou Ishii wrote:
> > > > Add a definition for the Fujitsu A64FX processor.
> > > >
> > > > The A64FX processor does not implement the AArch32 Execution state,
> > > > so there are no associated AArch32 Identification registers.
> > > >
> > > > For SVE, the A64FX processor supports only 128,256 and 512bit vector
> > lengths.
> > > >
> > > > Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> > > > ---
> > > >  target/arm/cpu.c   | 27 +++++++++++++++++++++++----
> > > >  target/arm/cpu.h   |  1 +
> > > >  target/arm/cpu64.c | 42
> > ++++++++++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 66 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/target/arm/cpu.c b/target/arm/cpu.c index
> > > > 2866dd7658..162e46afc3 100644
> > > > --- a/target/arm/cpu.c
> > > > +++ b/target/arm/cpu.c
> > > > @@ -1345,15 +1345,34 @@ static void arm_cpu_finalizefn(Object *obj)
> > > > #endif  }
> > > >
> > > > +static void a64fx_cpu_set_sve(ARMCPU *cpu) {
> > > > +    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> > > > +    bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ);
> > > > +    bitmap_zero(cpu->sve_vq_init, ARM_MAX_VQ);
> > > > +    set_bit(0, cpu->sve_vq_map); /* 128bit */
> > > > +    set_bit(0, cpu->sve_vq_init);
> > > > +    set_bit(1, cpu->sve_vq_map); /* 256bit */
> > > > +    set_bit(1, cpu->sve_vq_init);
> > > > +    set_bit(3, cpu->sve_vq_map); /* 512bit */
> > > > +    set_bit(3, cpu->sve_vq_init);
> > > > +
> > > > +    cpu->sve_max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ)
> > +
> > > > +1; }
> > > > +
> > > >  void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)  {
> > > >      Error *local_err = NULL;
> > > >
> > > >      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> > > > -        arm_cpu_sve_finalize(cpu, &local_err);
> > > > -        if (local_err != NULL) {
> > > > -            error_propagate(errp, local_err);
> > > > -            return;
> > > > +        if (arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
> > > > +            a64fx_cpu_set_sve(cpu);
> > > > +        } else {
> > > > +            arm_cpu_sve_finalize(cpu, &local_err);
> > > > +            if (local_err != NULL) {
> > > > +                error_propagate(errp, local_err);
> > > > +                return;
> > > > +            }
> > > >          }
> > > >
> > > >          /*
> > > > diff --git a/target/arm/cpu.h b/target/arm/cpu.h index
> > > > 9f0a5f84d5..84ebca731a 100644
> > > > --- a/target/arm/cpu.h
> > > > +++ b/target/arm/cpu.h
> > > > @@ -2145,6 +2145,7 @@ enum arm_features {
> > > >      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
> > > >      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
> > > >      ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later
> > > > */
> > > > +    ARM_FEATURE_A64FX, /* Fujitsu A64FX processor */
> > > >  };
> > > >
> > > >  static inline int arm_feature(CPUARMState *env, int feature) diff
> > > > --git a/target/arm/cpu64.c b/target/arm/cpu64.c index
> > > > c690318a9b..5e7e885f9d 100644
> > > > --- a/target/arm/cpu64.c
> > > > +++ b/target/arm/cpu64.c
> > > > @@ -847,10 +847,52 @@ static void aarch64_max_initfn(Object *obj)
> > > >                          cpu_max_set_sve_max_vq, NULL, NULL);  }
> > > >
> > > > +static void aarch64_a64fx_initfn(Object *obj) {
> > > > +    ARMCPU *cpu = ARM_CPU(obj);
> > > > +
> > > > +    cpu->dtb_compatible = "arm,a64fx";
> > > > +    set_feature(&cpu->env, ARM_FEATURE_A64FX);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_V8);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> > > > +    cpu->midr = 0x461f0010;
> > > > +    cpu->revidr = 0x00000000;
> > > > +    cpu->ctr = 0x86668006;
> > > > +    cpu->reset_sctlr = 0x30000180;
> > > > +    cpu->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS
> > Extensions */
> > > > +    cpu->isar.id_aa64pfr1 = 0x0000000000000000;
> > > > +    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
> > > > +    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
> > > > +    cpu->id_aa64afr0 = 0x0000000000000000;
> > > > +    cpu->id_aa64afr1 = 0x0000000000000000;
> > > > +    cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
> > > > +    cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
> > > > +    cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
> > > > +    cpu->isar.id_aa64isar0 = 0x0000000010211120;
> > > > +    cpu->isar.id_aa64isar1 = 0x0000000000010001;
> > > > +    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
> > > > +    cpu->clidr = 0x0000000080000023;
> > > > +    cpu->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
> > > > +    cpu->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
> > > > +    cpu->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
> > > > +    cpu->dcz_blocksize = 6; /* 256 bytes */
> > > > +    cpu->gic_num_lrs = 4;
> > > > +    cpu->gic_vpribits = 5;
> > > > +    cpu->gic_vprebits = 5;
> > > > +
> > > > +    /* TODO:  Add A64FX specific HPC extension registers */ }
> > > > +
> > > >  static const ARMCPUInfo aarch64_cpus[] = {
> > > >      { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
> > > >      { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
> > > >      { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
> > > > +    { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
> > > >      { .name = "max",                .initfn = aarch64_max_initfn },
> > > >  };
> > > >
> > > > --
> > > > 2.27.0
> > > >
> > >
> > > For the SVE related bits
> > >
> > > Reviewed-by: Andrew Jones <drjones@redhat.com>
> > 
> > On second thought, do we want the QMP CPU model expansion query to show that
> > this CPU type has sve,sve128,sve256,sve512? If so, then our SVE work isn't
> > complete, because we need those properties, set true by default, but forbidden
> > from changing.
> > 
> > Thanks,
> > drew
> 


