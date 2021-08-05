Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FA43E13E4
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 13:27:37 +0200 (CEST)
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBbXE-0004sm-QH
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 07:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mBbUN-0002T1-UM
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 07:24:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mBbUM-000169-9X
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 07:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628162677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VbprFqjcDUoeJtGQ5sTHQvzLtyDFXeKF9/nWQHU6IB4=;
 b=DadWyx90A6+d7FoClO4Nk/KLyytcVWIslgcXqwSAPPdS9u/SLUzkhnttN2yfvWshEiEVyx
 RdYQ0W/1csLbLmcmxoQ0HMZGx1pt4/I02n1Iui+KYJN4wIyPMhhxGeo0uKfJ8/qZhO3igO
 kbglsuyKGR0K6XD0oNs98zeNI7vFBTI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-B5aImtY9OVqy7ML1pPy-zA-1; Thu, 05 Aug 2021 07:24:36 -0400
X-MC-Unique: B5aImtY9OVqy7ML1pPy-zA-1
Received: by mail-ej1-f71.google.com with SMTP id
 z20-20020a1709069454b0290595651dca8eso1923202ejx.23
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 04:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VbprFqjcDUoeJtGQ5sTHQvzLtyDFXeKF9/nWQHU6IB4=;
 b=p8dA2e3uPOKTo1lxTs/8Cf6DkhduOwda9wsWufVgRtdgK5zJO12eOyAFtkpz5W76cZ
 +U6O6UR7lZcN5axihwuI6YgFe3PWzX3lv7MWADTQo8Aid4fiK/AagvFK49wA+pPzncc9
 9XrJe4KiZln3OV58cb5UWWyNAYUSjbQ2EcbRhaNpvnCtI3Q1vuDCfaQlGL0jaxworcTm
 xabTqR6rovlB5oqY25LAp24lJoFPXC5w31h+j/zFcx5Y9oc+EKxmjVhLr8s1aRWV3l2a
 PtFyCieM1/sNDcHKGLhA6xFVmgccek5ULCnrvqoi+TmM+jHW/yLn9HtQac9UZPPOBYV3
 YbDw==
X-Gm-Message-State: AOAM533jOryTJ1tWaisUXSjn4R4NaHJHNXTNAymnPkhqzKYGlmc+egm9
 acEIqtMHpWkd/oeHk0vyBATOKWaTRdif9oFQEukndKtTfgBR72U8OeO7dly4kZYL7okspfEsigv
 5IZ6v3lvtxl6gsF4=
X-Received: by 2002:a17:906:3699:: with SMTP id
 a25mr4265315ejc.452.1628162675435; 
 Thu, 05 Aug 2021 04:24:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6roctSYEH8Xad/3g3ceVog82GrbvMKn9f+Hhwyj2WgoBLvgA+FGPFO3/oc/VWzfsda+f3Dg==
X-Received: by 2002:a17:906:3699:: with SMTP id
 a25mr4265298ejc.452.1628162675222; 
 Thu, 05 Aug 2021 04:24:35 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id gv7sm1600327ejc.5.2021.08.05.04.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 04:24:34 -0700 (PDT)
Date: Thu, 5 Aug 2021 13:24:32 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v3 1/3] target-arm: cpu64: Add support for Fujitsu A64FX
Message-ID: <20210805112432.mjrqizexwyammfm5@gator.home>
References: <20210805073045.916622-1-ishii.shuuichir@fujitsu.com>
 <20210805073045.916622-2-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210805073045.916622-2-ishii.shuuichir@fujitsu.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 05, 2021 at 04:30:43PM +0900, Shuuichirou Ishii wrote:
> Add a definition for the Fujitsu A64FX processor.
> 
> The A64FX processor does not implement the AArch32 Execution state,
> so there are no associated AArch32 Identification registers.
> 
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  target/arm/cpu64.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index c690318a9b..612644941b 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -847,10 +847,54 @@ static void aarch64_max_initfn(Object *obj)
>                          cpu_max_set_sve_max_vq, NULL, NULL);
>  }
>  
> +static void aarch64_a64fx_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cpu->dtb_compatible = "arm,a64fx";
> +    set_feature(&cpu->env, ARM_FEATURE_V8);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> +    cpu->midr = 0x461f0010;
> +    cpu->revidr = 0x00000000;
> +    cpu->ctr = 86668006;
> +    cpu->reset_sctlr = 0x30000180;
> +    cpu->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS Extensions */
> +    cpu->isar.id_aa64pfr1 = 0x0000000000000000;
> +    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
> +    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
> +    cpu->id_aa64afr0 = 0x0000000000000000;
> +    cpu->id_aa64afr1 = 0x0000000000000000;
> +    cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
> +    cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
> +    cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
> +    cpu->isar.id_aa64isar0 = 0x0000000010211120;
> +    cpu->isar.id_aa64isar1 = 0x0000000000010001;
> +    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
> +    cpu->clidr = 0x0000000080000023;
> +    cpu->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
> +    cpu->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
> +    cpu->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
> +    cpu->dcz_blocksize = 6; /* 256 bytes */
> +    cpu->gic_num_lrs = 4;
> +    cpu->gic_vpribits = 5;
> +    cpu->gic_vprebits = 5;
> +    /* TODO:  Add A64FX specific HPC extension registers */
> +
> +    aarch64_add_sve_properties(obj);
> +    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
> +                        cpu_max_set_sve_max_vq, NULL, NULL);

I'm not a huge fan of the sve-max-vq property since it's not a good idea
to use it with KVM, because it's not explicit enough for migration[1]. I
realize the a64fx cpu type will likely never be used with KVM, but since
sve-max-vq isn't necessary[2], than I would avoid propagating it to
another cpu type. Finally, if you want the a64fx cpu model to represent
the current a64fx cpu, then don't you want to explicitly set the supported
vector lengths[3] and deny the user the option to change them? You could
do that by directly setting the vq map and not adding the sve properties.

[1] With KVM, sve-max-vq only tells you the maximum vq, but it won't tell
you that the host doesn't support non-power-of-2 vector lengths. So you
don't get an explicit vector length list on the command line. Being
explicit is the only safe way to migrate (see
docs/system/arm/cpu-features.rst:"SVE CPU Property Recommendations").

[2] If a shorthand is desired for specifying vector lengths, then just
use a single sve<N> property. For example, sve-max-vq=4 and sve512=on
are identical (but keep [1] in mind).

[3] a64fx only support 128, 256, and 512 bit vector lengths, afaik.

Thanks,
drew

> +}
> +
>  static const ARMCPUInfo aarch64_cpus[] = {
>      { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
>      { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
>      { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
> +    { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
>      { .name = "max",                .initfn = aarch64_max_initfn },
>  };
>  
> -- 
> 2.27.0
> 
> 


