Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069723EA202
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:26:28 +0200 (CEST)
Received: from localhost ([::1]:39312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE6yp-0003lm-39
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mE6xq-0002em-Jo
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:25:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mE6xo-00007M-S7
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628760323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eq5bUhbVDw1gxI6SRv+Y3L72nrh9qHBBu1x7subwXpo=;
 b=ZA6vg/AiNXaBDQJdWs2cvbnpwNXighzrtYhjnHWroEZPeynMCM/WMhcKxVvBW/Wx9efLeS
 TdyycnVYsHvJrtUrgr5whQLQ5J6oCk52bb2Rrjtocl9PLLzm9j6+sg4/d3F+QEKTc4nRGh
 KGpd4j7AdbeuiS/oIDESKyQA75TKjaU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-t-a-qZwQPVuGsSfeado41Q-1; Thu, 12 Aug 2021 05:25:22 -0400
X-MC-Unique: t-a-qZwQPVuGsSfeado41Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 p2-20020a50c9420000b02903a12bbba1ebso2754627edh.6
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eq5bUhbVDw1gxI6SRv+Y3L72nrh9qHBBu1x7subwXpo=;
 b=WJWPJOgZEv5Y4J9JilE5iaUMWvtxw7UfseJsd3d0Zeqf4lrp/RfEUzuEm4nhOzHH7G
 ljwbo0+t7ZVDYq8MGb0RYJlBrMoM8PUnVYKiHJKe6Xp7eB87EUU2P4RQwpkNJdiHfmYC
 a5J+dvPcOqE9RJP8HzmlCOE3ploFvcX2AScb0V5F3BUwSolazeS8ttUJ0IC/Q6p2hYEF
 6I5icLDx2vpzt5AdQDJJAUHkhLXccTYuNuFSlL1SLI5D6Y0mGkr0UTe4nIWdYBY6xDgj
 7EANDZtUi4QddQjqyeXyiNcHqDuuzRiqR19FMMWzfIXJ0qRwYnWgbY7TWeuDVbGZOK9/
 FMhQ==
X-Gm-Message-State: AOAM531RM97OcIioKpQmTKAmd3ziDIdAt6cARNZRDUbD4v881pMM+PNk
 9ofGPt8bLx3d1W8M2iqCpknTo8GRK+uHEqvfWU0io1V6DaZ/lnuPqjjhEDt5/IRPQ3tF3Un0xqS
 oDnlwuR0tKAF/Bx4=
X-Received: by 2002:a17:906:fb91:: with SMTP id
 lr17mr2756331ejb.110.1628760319939; 
 Thu, 12 Aug 2021 02:25:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywt8/D1tBWDOQxUHHvCNTrFt0qXqT7ucjcLp7Ov6PlZ/cvKq2OQ8vLlzeh1ZAwH67iC5DivA==
X-Received: by 2002:a17:906:fb91:: with SMTP id
 lr17mr2756318ejb.110.1628760319692; 
 Thu, 12 Aug 2021 02:25:19 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id q5sm847958edt.50.2021.08.12.02.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:25:19 -0700 (PDT)
Date: Thu, 12 Aug 2021 11:25:17 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Message-ID: <20210812092517.mwcfhksoe4cgy3cl@gator.home>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
 <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
MIME-Version: 1.0
In-Reply-To: <20210812091650.i5np3szvdoelu2cx@gator.home>
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 12, 2021 at 11:16:50AM +0200, Andrew Jones wrote:
> On Thu, Aug 12, 2021 at 03:04:38PM +0900, Shuuichirou Ishii wrote:
> > Add a definition for the Fujitsu A64FX processor.
> > 
> > The A64FX processor does not implement the AArch32 Execution state,
> > so there are no associated AArch32 Identification registers.
> > 
> > For SVE, the A64FX processor supports only 128,256 and 512bit vector lengths.
> > 
> > Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> > ---
> >  target/arm/cpu.c   | 27 +++++++++++++++++++++++----
> >  target/arm/cpu.h   |  1 +
> >  target/arm/cpu64.c | 42 ++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 66 insertions(+), 4 deletions(-)
> > 
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 2866dd7658..162e46afc3 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -1345,15 +1345,34 @@ static void arm_cpu_finalizefn(Object *obj)
> >  #endif
> >  }
> >  
> > +static void a64fx_cpu_set_sve(ARMCPU *cpu)
> > +{
> > +    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> > +    bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ);
> > +    bitmap_zero(cpu->sve_vq_init, ARM_MAX_VQ);
> > +    set_bit(0, cpu->sve_vq_map); /* 128bit */
> > +    set_bit(0, cpu->sve_vq_init);
> > +    set_bit(1, cpu->sve_vq_map); /* 256bit */
> > +    set_bit(1, cpu->sve_vq_init);
> > +    set_bit(3, cpu->sve_vq_map); /* 512bit */
> > +    set_bit(3, cpu->sve_vq_init);
> > +
> > +    cpu->sve_max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
> > +}
> > +
> >  void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
> >  {
> >      Error *local_err = NULL;
> >  
> >      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> > -        arm_cpu_sve_finalize(cpu, &local_err);
> > -        if (local_err != NULL) {
> > -            error_propagate(errp, local_err);
> > -            return;
> > +        if (arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
> > +            a64fx_cpu_set_sve(cpu);
> > +        } else {
> > +            arm_cpu_sve_finalize(cpu, &local_err);
> > +            if (local_err != NULL) {
> > +                error_propagate(errp, local_err);
> > +                return;
> > +            }
> >          }
> >  
> >          /*
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 9f0a5f84d5..84ebca731a 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -2145,6 +2145,7 @@ enum arm_features {
> >      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
> >      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
> >      ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
> > +    ARM_FEATURE_A64FX, /* Fujitsu A64FX processor */
> >  };
> >  
> >  static inline int arm_feature(CPUARMState *env, int feature)
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index c690318a9b..5e7e885f9d 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -847,10 +847,52 @@ static void aarch64_max_initfn(Object *obj)
> >                          cpu_max_set_sve_max_vq, NULL, NULL);
> >  }
> >  
> > +static void aarch64_a64fx_initfn(Object *obj)
> > +{
> > +    ARMCPU *cpu = ARM_CPU(obj);
> > +
> > +    cpu->dtb_compatible = "arm,a64fx";
> > +    set_feature(&cpu->env, ARM_FEATURE_A64FX);
> > +    set_feature(&cpu->env, ARM_FEATURE_V8);
> > +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> > +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> > +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> > +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> > +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> > +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> > +    cpu->midr = 0x461f0010;
> > +    cpu->revidr = 0x00000000;
> > +    cpu->ctr = 0x86668006;
> > +    cpu->reset_sctlr = 0x30000180;
> > +    cpu->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS Extensions */
> > +    cpu->isar.id_aa64pfr1 = 0x0000000000000000;
> > +    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
> > +    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
> > +    cpu->id_aa64afr0 = 0x0000000000000000;
> > +    cpu->id_aa64afr1 = 0x0000000000000000;
> > +    cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
> > +    cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
> > +    cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
> > +    cpu->isar.id_aa64isar0 = 0x0000000010211120;
> > +    cpu->isar.id_aa64isar1 = 0x0000000000010001;
> > +    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
> > +    cpu->clidr = 0x0000000080000023;
> > +    cpu->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
> > +    cpu->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
> > +    cpu->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
> > +    cpu->dcz_blocksize = 6; /* 256 bytes */
> > +    cpu->gic_num_lrs = 4;
> > +    cpu->gic_vpribits = 5;
> > +    cpu->gic_vprebits = 5;
> > +
> > +    /* TODO:  Add A64FX specific HPC extension registers */
> > +}
> > +
> >  static const ARMCPUInfo aarch64_cpus[] = {
> >      { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
> >      { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
> >      { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
> > +    { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
> >      { .name = "max",                .initfn = aarch64_max_initfn },
> >  };
> >  
> > -- 
> > 2.27.0
> >
> 
> For the SVE related bits
> 
> Reviewed-by: Andrew Jones <drjones@redhat.com>

On second thought, do we want the QMP CPU model expansion query to show
that this CPU type has sve,sve128,sve256,sve512? If so, then our SVE work
isn't complete, because we need those properties, set true by default, but
forbidden from changing.

Thanks,
drew


