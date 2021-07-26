Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730163D5C8D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:01:31 +0200 (CEST)
Received: from localhost ([::1]:33054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m826j-000550-PT
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m825I-00048z-I0
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:00:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m825F-0008UX-UW
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627311596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+TMkjXKifNiTH2nEc+YKSzjsJ4iOCFuIXSjXyPBo+4I=;
 b=KaJo9f4ylDm9UJQMxVKmxgIIH/NMzuiwvgCc+NbwbE7ZVeLwsglB8QI8X4lanIEpv7yr5E
 7cjl8m3xrnLU35ho9QsXl3zI0xmzqo9TSwpbsdCuExDva1HaMz/vC794AHPRMfpnWuWjNU
 /m89/obbpNTR75HX+2fwH3Xo3R3UJ+M=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-ULcNAe37OPyx52kCxn1oAA-1; Mon, 26 Jul 2021 10:59:55 -0400
X-MC-Unique: ULcNAe37OPyx52kCxn1oAA-1
Received: by mail-qk1-f199.google.com with SMTP id
 x12-20020a05620a14acb02903b8f9d28c19so9132037qkj.23
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 07:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+TMkjXKifNiTH2nEc+YKSzjsJ4iOCFuIXSjXyPBo+4I=;
 b=SB7xi1PoJxPUI0qu/tbuxSRMgJc9JLnuBvqehac2+D4D/uQ8JOo6YTsvSa6IeOidDU
 94Q214pbENjymIrhTsR14FC5HnmJXJuiT28Z/YYsJtZcWHihX3+SAOTM7WHN31uSdeFh
 UaCMCk0Q2RsUvmV+bAkott6XKTwACFZ64QeNN7PFRLuirvTsiB/ANOOpy4nChO/CFlVT
 6c90HKrabaeenJzgq5Gc88xQYR+WYyvvdU+N2KyuiipvC3W4Sp48EVx8uet1D2hepZkX
 UxqxexF96dhniSBeyXi8e+xWi+zoyZciRQkxwDwrUVQnTBdJa2C1sBWimSLI07/YgMms
 yDPA==
X-Gm-Message-State: AOAM5307YGiF0zXGEObzCPufjDJp4imAUN7E6wsBlJqW9DULOYOajFQR
 A1yDwRuqOGqEX47XCq5YIdC25EPpi7axVW6xrrkwcr09bs+dzcZzOvUr16iVQuINXsVOrvImdKP
 Cnv5UbCAQmiRhRVA=
X-Received: by 2002:a0c:ff01:: with SMTP id w1mr18316372qvt.28.1627311595152; 
 Mon, 26 Jul 2021 07:59:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTsjk4jMTKpbNHwc9AzsgE7x9HQ2PRh/tNqLcgkxwl2DHQJEYeaA3Ow3lZTgniQIJWywafQg==
X-Received: by 2002:a0c:ff01:: with SMTP id w1mr18316358qvt.28.1627311594881; 
 Mon, 26 Jul 2021 07:59:54 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id u19sm96584qtx.48.2021.07.26.07.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:59:54 -0700 (PDT)
Date: Mon, 26 Jul 2021 16:59:51 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 3/3] target/arm: Add sve-default-vector-length cpu
 property
Message-ID: <20210726145951.g3ywwhcfstmsi7vi@gator>
References: <20210723203344.968563-1-richard.henderson@linaro.org>
 <20210723203344.968563-4-richard.henderson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210723203344.968563-4-richard.henderson@linaro.org>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 10:33:44AM -1000, Richard Henderson wrote:
> Mirror the behavour of /proc/sys/abi/sve_default_vector_length
> under the real linux kernel.  We have no way of passing along
> a real default across exec like the kernel can, but this is a
> decent way of adjusting the startup vector length of a process.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/482
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  docs/system/arm/cpu-features.rst | 11 ++++++
>  target/arm/cpu.h                 |  5 +++
>  target/arm/cpu.c                 | 14 ++++++--
>  target/arm/cpu64.c               | 60 ++++++++++++++++++++++++++++++++
>  4 files changed, 88 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index c455442eaf..4ff36cc83f 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -376,3 +376,14 @@ verbose command lines.  However, the recommended way to select vector
>  lengths is to explicitly enable each desired length.  Therefore only
>  example's (1), (4), and (6) exhibit recommended uses of the properties.
>  
> +SVE User-mode Default Vector Length Property
> +--------------------------------------------
> +
> +For qemu-aarch64, the cpu property `sve-default-vector-length=N` is
> +defined to mirror the Linux kernel parameter file
> +`/proc/sys/abi/sve_default_vector_length`.  The default length, `N`,
> +is in units of bytes and must be between 16 and 8192.  

Hmm. If a user inputs anything greater than 256, then won't it get
silently reduced to 256?

> +If not specified, the default vector length is 64.
> +
> +If the default length is larger than the maximum vector length enabled
> +with `sve<N>` properties, the actual vector length will be reduced.

Here it's pointed out that the default may be reduced, but it implies that
that only happens if an sve<N> property is also given. Won't users wonder
why they're only getting vectors that are 256 bytes large even when they
ask for more?

Thanks,
drew

> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index be9a4dceae..9f0a5f84d5 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1006,6 +1006,11 @@ struct ARMCPU {
>      /* Used to set the maximum vector length the cpu will support.  */
>      uint32_t sve_max_vq;
>  
> +#ifdef CONFIG_USER_ONLY
> +    /* Used to set the default vector length at process start. */
> +    uint32_t sve_default_vq;
> +#endif
> +
>      /*
>       * In sve_vq_map each set bit is a supported vector length of
>       * (bit-number + 1) * 16 bytes, i.e. each bit number + 1 is the vector
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 752b15bb79..2866dd7658 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -201,7 +201,8 @@ static void arm_cpu_reset(DeviceState *dev)
>          env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 16, 2, 3);
>          /* with reasonable vector length */
>          if (cpu_isar_feature(aa64_sve, cpu)) {
> -            env->vfp.zcr_el[1] = MIN(cpu->sve_max_vq - 1, 3);
> +            env->vfp.zcr_el[1] =
> +                aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
>          }
>          /*
>           * Enable TBI0 but not TBI1.
> @@ -1051,7 +1052,16 @@ static void arm_cpu_initfn(Object *obj)
>      QLIST_INIT(&cpu->pre_el_change_hooks);
>      QLIST_INIT(&cpu->el_change_hooks);
>  
> -#ifndef CONFIG_USER_ONLY
> +#ifdef CONFIG_USER_ONLY
> +# ifdef TARGET_AARCH64
> +    /*
> +     * The linux kernel defaults to 512-bit vectors, when sve is supported.
> +     * See documentation for /proc/sys/abi/sve_default_vector_length, and
> +     * our corresponding sve-default-vector-length cpu property.
> +     */
> +    cpu->sve_default_vq = 4;
> +# endif
> +#else
>      /* Our inbound IRQ and FIQ lines */
>      if (kvm_enabled()) {
>          /* VIRQ and VFIQ are unused with KVM but we add them to maintain
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index c7a1626bec..c690318a9b 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -559,6 +559,59 @@ static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
>      cpu->isar.id_aa64pfr0 = t;
>  }
>  
> +#ifdef CONFIG_USER_ONLY
> +/* Mirror linux /proc/sys/abi/sve_default_vector_length. */
> +static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
> +                                            const char *name, void *opaque,
> +                                            Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    int32_t default_len, default_vq, remainder;
> +
> +    if (!visit_type_int32(v, name, &default_len, errp)) {
> +        return;
> +    }
> +
> +    /* Undocumented, but the kernel allows -1 to indicate "maximum". */
> +    if (default_len == -1) {
> +        cpu->sve_default_vq = ARM_MAX_VQ;
> +        return;
> +    }
> +
> +    default_vq = default_len / 16;
> +    remainder = default_len % 16;
> +
> +    /*
> +     * Note that the 512 max comes from include/uapi/asm/sve_context.h
> +     * and is the maximum architectural width of ZCR_ELx.LEN.
> +     */
> +    if (remainder || default_vq < 1 || default_vq > 512) {
> +        error_setg(errp, "cannot set sve-default-vector-length");
> +        if (remainder) {
> +            error_append_hint(errp, "Vector length not a multiple of 16\n");
> +        } else if (default_vq < 1) {
> +            error_append_hint(errp, "Vector length smaller than 16\n");
> +        } else {
> +            error_append_hint(errp, "Vector length larger than %d\n",
> +                              512 * 16);
> +        }
> +        return;
> +    }
> +
> +    cpu->sve_default_vq = default_vq;
> +}
> +
> +static void cpu_arm_get_sve_default_vec_len(Object *obj, Visitor *v,
> +                                            const char *name, void *opaque,
> +                                            Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    int32_t value = cpu->sve_default_vq * 16;
> +
> +    visit_type_int32(v, name, &value, errp);
> +}
> +#endif
> +
>  void aarch64_add_sve_properties(Object *obj)
>  {
>      uint32_t vq;
> @@ -571,6 +624,13 @@ void aarch64_add_sve_properties(Object *obj)
>          object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
>                              cpu_arm_set_sve_vq, NULL, NULL);
>      }
> +
> +#ifdef CONFIG_USER_ONLY
> +    /* Mirror linux /proc/sys/abi/sve_default_vector_length. */
> +    object_property_add(obj, "sve-default-vector-length", "int32",
> +                        cpu_arm_get_sve_default_vec_len,
> +                        cpu_arm_set_sve_default_vec_len, NULL, NULL);
> +#endif
>  }
>  
>  void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
> -- 
> 2.25.1
> 
> 


