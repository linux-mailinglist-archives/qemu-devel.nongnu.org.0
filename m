Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CDC3FB2A3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 10:41:05 +0200 (CEST)
Received: from localhost ([::1]:40434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKcqn-0006U4-0z
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 04:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mKcpR-0005Q0-CP
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 04:39:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mKcpO-0001lm-N2
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 04:39:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630312776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s0eK0yjhDIRV7D3XYtVKl7JDvnVIl6/v5vCUGQjakH8=;
 b=V78/0JPbQtDyzFjCqyOVkKzURdNROHNKQAWIuxIP4DvjRhBV9zlYfYQx72l+JhUwE4gDLf
 tSROLxPiwtlCT1OwDl1umX+2Q0ZkkJSAWyNF5XARrGYXxn/F33fOWVOpuU3w6zmmspKqF+
 7zr4ykYd6SaCIc+7B0PzfI9e5XkK/Hw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-FMe-vpHKNDC6nWJjL0uquA-1; Mon, 30 Aug 2021 04:39:34 -0400
X-MC-Unique: FMe-vpHKNDC6nWJjL0uquA-1
Received: by mail-ej1-f69.google.com with SMTP id
 q19-20020a1709064cd3b02904c5f93c0124so5312803ejt.14
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 01:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s0eK0yjhDIRV7D3XYtVKl7JDvnVIl6/v5vCUGQjakH8=;
 b=YUHfdmzExct/5cggqrKXMD+WxKMDFVe2UrGN0oTRiyyoUxGeLY9ZEJC4BdcFx/Vd59
 MegWTsgPX6FxtQB5/7bhd8NTDTEiyYUQXYEkg6BpnTdOOz4l4EsY6QwmeZD4oTDmpqtM
 tk8tI4hI1y0Icfm83f7BvYHljFWavnZOsrOOLqXwi/2H5ltN3HIkpIlqiurzTXZOa7lx
 nIYgvd1My8xPWo+oXbH8UJMG2Tw9sN380BE4fVmLXISwM2l/dEKdXdrdhOQmo3CMkg00
 M3wL1dugVskuGQHGRTieYUXW3LB/NvOVWGIZGAt6qg6uvTqSTRqqIZ9usLQdz4k16q4j
 Kc1w==
X-Gm-Message-State: AOAM532vQBuiCI3X09YCQrQIOHtxvLE5vzsDHDteA9MqyGw+EVtX39nU
 aTnKwyaGZz64zsGj22GX8ORJjwwBdOnyzPfPABuCIh1csCyCb+bfWMvKjVjywOsdAPRcjfFTEJd
 JFusemSZG0ycmLpc=
X-Received: by 2002:a50:ed09:: with SMTP id j9mr22727206eds.164.1630312773557; 
 Mon, 30 Aug 2021 01:39:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ2Gav6dHY+ntzdjZG3LojFHdqaaVlIBTHUuvB0FXYiOroftI3KzYVbKFSLSe538167dIouw==
X-Received: by 2002:a50:ed09:: with SMTP id j9mr22727180eds.164.1630312773198; 
 Mon, 30 Aug 2021 01:39:33 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id d19sm1923361eja.45.2021.08.30.01.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:39:32 -0700 (PDT)
Date: Mon, 30 Aug 2021 10:39:31 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v5 1/3] target-arm: Add support for Fujitsu A64FX
Message-ID: <20210830083931.4fft4c5cv4c4ysni@gator.home>
References: <20210830082820.2690275-1-ishii.shuuichir@fujitsu.com>
 <20210830082820.2690275-2-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210830082820.2690275-2-ishii.shuuichir@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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

On Mon, Aug 30, 2021 at 05:28:18PM +0900, Shuuichirou Ishii wrote:
> Add a definition for the Fujitsu A64FX processor.
> 
> The A64FX processor does not implement the AArch32 Execution state,
> so there are no associated AArch32 Identification registers.
> 
> For SVE, the A64FX processor supports only 128,256 and 512bit vector lengths.
> 
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  target/arm/cpu64.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 2f0cbddab5..15245a60a8 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -841,10 +841,58 @@ static void aarch64_max_initfn(Object *obj)
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
> +    cpu->ctr = 0x86668006;
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
> +
> +    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> +    aarch64_add_sve_properties(obj);
> +    bitmap_zero(cpu->sve_vq_supported, ARM_MAX_VQ);
> +    set_bit(0, cpu->sve_vq_supported); /* 128bit */
> +    set_bit(1, cpu->sve_vq_supported); /* 256bit */
> +    set_bit(3, cpu->sve_vq_supported); /* 512bit */
> +
> +    /* TODO:  Add A64FX specific HPC extension registers */
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

For the SVE stuff,

Reviewed-by: Andrew Jones <drjones@redhat.com>

Question: For testing, did you dump all the ID registers on this
model and compare them with a dump of ID registers from real
hardware? If so, that would be good info to put in the commit
message or at least the cover letter.

Thanks,
drew


