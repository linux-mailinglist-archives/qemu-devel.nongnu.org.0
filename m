Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA49036C11F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 10:40:53 +0200 (CEST)
Received: from localhost ([::1]:44266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJH2-00036X-S1
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 04:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbJFA-0002BG-BJ
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:38:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbJF5-0008Cq-RO
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 04:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619512730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z7PDGmBz6Wfwstw5w1CD68HqkyjInjIo8NnSFAgt5vo=;
 b=JkpXk7k0OjJTCSKEtOeRfcO3A1v7STvoRpRDHhSV9sIOrVwh8M8wDf1WPB5KTRThSpmHg2
 mdlrDPvJ5pX24XmCGpDVsG6QCYp+NZsETcV/GJVLnw4Q3f75f2THK7opqaI6iu3PK42X2L
 jftmjLbOFWmIACFaciSHq5NYo2pIUAk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-RZT6HaMhPxSc5RHqkWGnLw-1; Tue, 27 Apr 2021 04:38:48 -0400
X-MC-Unique: RZT6HaMhPxSc5RHqkWGnLw-1
Received: by mail-ed1-f71.google.com with SMTP id
 p16-20020a0564021550b029038522733b66so16478001edx.11
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 01:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z7PDGmBz6Wfwstw5w1CD68HqkyjInjIo8NnSFAgt5vo=;
 b=ST680wNBfU5mKdUKKzoit5459owiRy6dhQnjPMrd1o2xmIoMsvwuIqlak7HCckGAkC
 iOAq/fraXnPfvyXampyc76urXilGflGiTSHO55oK+2nFUAJw5wgNEdyE6VyseJns4CgT
 R32kojOVorMu5gg4QkYumYatlE+UPfPMuM/xnUSQ2eUhOOubXERJ0gHjAh1EBCFUceRw
 HPwgqvcN0yH3hQqfg1Ee5jwKNP+t91SdCBx/B/q5KS2xvrl2upvA3GzjvUsSe3cwE7CU
 LdkYPEHqoL9CaQqtiIc7IaHyB4tzs6Hh38iDc1gdXGcbYmmcjdVvJRG8gYdzrNIjKkpJ
 HsZw==
X-Gm-Message-State: AOAM532MWaLIVojvWir/zXWBPbhzkOyoHITSZXXraJgE6aUzmG/BeDqD
 YGRQmbMayL/2piSIOqpOkrekGHgdp7CS0OsBNX9QGydWBhz/9pp+XvVw+bW1DH1sVGqtrlYGO+T
 +EtKzItdMp10dxvg=
X-Received: by 2002:a17:906:3a45:: with SMTP id
 a5mr22975377ejf.288.1619512727691; 
 Tue, 27 Apr 2021 01:38:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxazEV3qnaiVu2IOn+L5v54k+wVn90qG5bPakDnp6/ogzOh8nMDfHNmWC8rvZrvxx82a5Jotg==
X-Received: by 2002:a17:906:3a45:: with SMTP id
 a5mr22975349ejf.288.1619512727390; 
 Tue, 27 Apr 2021 01:38:47 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id q19sm12833259ejy.50.2021.04.27.01.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 01:38:47 -0700 (PDT)
Date: Tue, 27 Apr 2021 10:38:45 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH RESEND v2 3/6] target/arm/kvm: Add an option to turn
 on/off el2 support
Message-ID: <20210427083845.xlrgpzae7k7g7ahq@gator.home>
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <80d8bac17a21b41b36cde3eec6c9681b93f43d7c.1617281290.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <80d8bac17a21b41b36cde3eec6c9681b93f43d7c.1617281290.git.haibo.xu@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 01, 2021 at 05:55:35AM -0700, Haibo Xu wrote:
> Adds an el2=[on/off] option to enable/disable el2(nested virtualization)
                                                   ^ space, please

> support in KVM guest vCPU.
> 
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/cpu.c   | 11 ++++++++++
>  target/arm/cpu.h   |  4 ++++
>  target/arm/cpu64.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index ae04884408..30cc330f50 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1349,6 +1349,17 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>                  return;
>              }
>          }
> +
> +        /*
> +         * Currently, vCPU feature 'el2' only supported in KVM mode.
> +         */
> +        if (kvm_enabled()) {
> +            arm_cpu_el2_finalize(cpu, &local_err);
> +            if (local_err != NULL) {
> +                error_propagate(errp, local_err);
> +                return;
> +            }
> +        }

nit: We could tie this 'if (kvm_enabled())' block to the
'if (!kvm_enabled())' block above it by turning one or the other
into an else clause.

>      }
>  
>      if (kvm_enabled()) {
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 193a49ec7f..19fa9cfbfd 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -203,10 +203,12 @@ typedef struct {
>  # define ARM_MAX_VQ    16
>  void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
>  void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
> +void arm_cpu_el2_finalize(ARMCPU *cpu, Error **errp);
>  #else
>  # define ARM_MAX_VQ    1
>  static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
>  static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
> +static inline void arm_cpu_el2_finalize(ARMCPU *cpu, Error **errp) { }
>  #endif
>  
>  typedef struct ARMVectorReg {
> @@ -1058,6 +1060,7 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
>  void aarch64_sve_change_el(CPUARMState *env, int old_el,
>                             int new_el, bool el0_a64);
>  void aarch64_add_sve_properties(Object *obj);
> +void aarch64_add_el2_properties(Object *obj);
>  
>  /*
>   * SVE registers are encoded in KVM's memory in an endianness-invariant format.
> @@ -1089,6 +1092,7 @@ static inline void aarch64_sve_change_el(CPUARMState *env, int o,
>                                           int n, bool a)
>  { }
>  static inline void aarch64_add_sve_properties(Object *obj) { }
> +static inline void aarch64_add_el2_properties(Object *obj) { }
>  #endif
>  
>  void aarch64_sync_32_to_64(CPUARMState *env);
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index f0a9e968c9..3f3f2c5495 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -603,6 +603,58 @@ static Property arm_cpu_pauth_property =
>  static Property arm_cpu_pauth_impdef_property =
>      DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
>  
> +void arm_cpu_el2_finalize(ARMCPU *cpu, Error **errp)
> +{
> +    if (cpu->has_el2) {
> +        if (!kvm_enabled() || !kvm_arm_el2_supported()) {
> +            error_setg(errp, "'el2' cannot be enabled on this host");
> +            return;
> +        }
> +    }
> +
> +    if (cpu->has_el2) {
> +        set_feature(&cpu->env, ARM_FEATURE_EL2);
> +    } else {
> +        unset_feature(&cpu->env, ARM_FEATURE_EL2);
> +    }
> +}
> +
> +static bool arm_get_el2(Object *obj, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    return cpu->has_el2;
> +}
> +
> +static void arm_set_el2(Object *obj, bool value, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    if (value) {
> +        if (!kvm_enabled() || !kvm_arm_el2_supported()) {
> +            error_setg(errp, "'el2' cannot be enabled on this host");
> +            return;
> +        }
> +        set_feature(&cpu->env, ARM_FEATURE_EL2);
> +    } else {
> +        unset_feature(&cpu->env, ARM_FEATURE_EL2);
> +    }
> +
> +    cpu->has_el2 = value;
> +}
> +
> +void aarch64_add_el2_properties(Object *obj)
> +{
> +    /*
> +     * vCPU feature 'el2' is only available in KVM mode, and is
> +     * disabled by default to keep in line with that in TCG mode.
> +     */
> +    ARM_CPU(obj)->has_el2 = false;
> +    object_property_add_bool(obj, "el2", arm_get_el2, arm_set_el2);
> +    object_property_set_description(obj, "el2", "Set off to disable "
> +                                    "nested virtulization.");

Since the default is 'off', it seems like the description should be
instructing one to set 'on to enable' instead. Or both, like the
description of the 'aarch64' property does.

> +}
> +
>  /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
>   * otherwise, a CPU with as many features enabled as our emulation supports.
>   * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
> -- 
> 2.17.1
> 
>

Thanks,
drew 


