Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B072938D060
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 23:58:06 +0200 (CEST)
Received: from localhost ([::1]:50638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkD9h-0007s6-A8
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 17:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lkD8J-0007AZ-4G
 for qemu-devel@nongnu.org; Fri, 21 May 2021 17:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lkD8F-00083y-UT
 for qemu-devel@nongnu.org; Fri, 21 May 2021 17:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621634194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aHmWjTIpFZarhUnqwlGSwS9dJ8Cb2YPPUb5h8iwmVjA=;
 b=VnIBWXkNT1bse6UR+gy/EDM0mDr7IiBAEzekKFyPW90UAM3vm29Fj70BY5YjApzcPYNo/K
 ztvB7l3J8ilWDdAVqeexLYA5nSnd8X6cgVbTIA67Jb7E0URSMGLHfyF1kYzv4QQ78m/ZA4
 IDZe5C/m9stLgdsmQX2V5qHu+Ekj9vA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-72CcbnzCMy6i4a_-n-99yg-1; Fri, 21 May 2021 17:56:32 -0400
X-MC-Unique: 72CcbnzCMy6i4a_-n-99yg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D218E501E1
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 21:56:31 +0000 (UTC)
Received: from localhost (ovpn-115-27.rdu2.redhat.com [10.10.115.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BF825D705;
 Fri, 21 May 2021 21:56:31 +0000 (UTC)
Date: Fri, 21 May 2021 17:56:30 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 16/19] i386: kill off hv_cpuid_check_and_set()
Message-ID: <20210521215630.stikpaxjenl5oyut@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-17-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210422161130.652779-17-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 06:11:27PM +0200, Vitaly Kuznetsov wrote:
> hv_cpuid_check_and_set() does too much:
> - Checks if the feature is supported by KVM;
> - Checks if all dependencies are enabled;
> - Sets the feature bit in cpu->hyperv_features for 'passthrough' mode.
> 
> To reduce the complexity, move all the logic except for dependencies
> check out of it. Also, in 'passthrough' mode we don't really need to
> check dependencies because KVM is supposed to provide a consistent
> set anyway.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  target/i386/kvm/kvm.c | 105 +++++++++++++++---------------------------
>  1 file changed, 36 insertions(+), 69 deletions(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index d5551c4ab5cf..2c1a77f9b00f 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1144,16 +1144,12 @@ static bool hyperv_feature_supported(CPUState *cs, int feature)
>      return true;
>  }
>  
> -static int hv_cpuid_check_and_set(CPUState *cs, int feature, Error **errp)
> +/* Checks that all feature dependencies are enabled */
> +static void hv_feature_check_deps(X86CPU *cpu, int feature, Error **errp)

Same suggestion as in patch 11/19: also returning a value to
indicate error is preferred.  I would return a boolean.

(I don't think this alone should block the series, though)


>  {
> -    X86CPU *cpu = X86_CPU(cs);
>      uint64_t deps;
>      int dep_feat;
>  
> -    if (!hyperv_feat_enabled(cpu, feature) && !cpu->hyperv_passthrough) {
> -        return 0;
> -    }
> -
>      deps = kvm_hyperv_properties[feature].dependencies;
>      while (deps) {
>          dep_feat = ctz64(deps);
> @@ -1161,26 +1157,10 @@ static int hv_cpuid_check_and_set(CPUState *cs, int feature, Error **errp)
>              error_setg(errp, "Hyper-V %s requires Hyper-V %s",
>                         kvm_hyperv_properties[feature].desc,
>                         kvm_hyperv_properties[dep_feat].desc);
> -            return 1;
> +            return;
>          }
>          deps &= ~(1ull << dep_feat);
>      }
> -
> -    if (!hyperv_feature_supported(cs, feature)) {
> -        if (hyperv_feat_enabled(cpu, feature)) {
> -            error_setg(errp, "Hyper-V %s is not supported by kernel",
> -                       kvm_hyperv_properties[feature].desc);
> -            return 1;
> -        } else {
> -            return 0;
> -        }
> -    }
> -
> -    if (cpu->hyperv_passthrough) {
> -        cpu->hyperv_features |= BIT(feature);
> -    }
> -
> -    return 0;
>  }
>  
>  static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t func, int reg)
> @@ -1219,6 +1199,8 @@ static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t func, int reg)
>  void kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
>  {
>      CPUState *cs = CPU(cpu);
> +    Error *local_err = NULL;
> +    int feat;
>  
>      if (!hyperv_enabled(cpu))
>          return;
> @@ -1274,53 +1256,38 @@ void kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
>  
>          cpu->hyperv_spinlock_attempts =
>              hv_cpuid_get_host(cs, HV_CPUID_ENLIGHTMENT_INFO, R_EBX);
> -    }
>  
> -    /* Features */
> -    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_RELAXED, errp)) {
> -        return;
> -    }
> -    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_VAPIC, errp)) {
> -        return;
> -    }
> -    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_TIME, errp)) {
> -        return;
> -    }
> -    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_CRASH, errp)) {
> -        return;
> -    }
> -    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_RESET, errp)) {
> -        return;
> -    }
> -    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_VPINDEX, errp)) {
> -        return;
> -    }
> -    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_RUNTIME, errp)) {
> -        return;
> -    }
> -    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_SYNIC, errp)) {
> -        return;
> -    }
> -    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_STIMER, errp)) {
> -        return;
> -    }
> -    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_FREQUENCIES, errp)) {
> -        return;
> -    }
> -    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_REENLIGHTENMENT, errp)) {
> -        return;
> -    }
> -    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_TLBFLUSH, errp)) {
> -        return;
> -    }
> -    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_EVMCS, errp)) {
> -        return;
> -    }
> -    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_IPI, errp)) {
> -        return;
> -    }
> -    if (hv_cpuid_check_and_set(cs, HYPERV_FEAT_STIMER_DIRECT, errp)) {
> -        return;
> +        /*
> +         * Mark feature as enabled in 'cpu->hyperv_features' as
> +         * hv_build_cpuid_leaf() uses this info to build guest CPUIDs.
> +         */
> +        for (feat = 0; feat < ARRAY_SIZE(kvm_hyperv_properties); feat++) {
> +            if (hyperv_feature_supported(cs, feat)) {
> +                cpu->hyperv_features |= BIT(feat);
> +            }
> +        }
> +    } else {
> +        /* Check features availability and dependencies */
> +        for (feat = 0; feat < ARRAY_SIZE(kvm_hyperv_properties); feat++) {
> +            /* If the feature was not requested skip it. */
> +            if (!hyperv_feat_enabled(cpu, feat)) {
> +                continue;
> +            }

That's the loop I suggested in patch 11/19.  Nice.  :)

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

> +
> +            /* Check if the feature is supported by KVM */
> +            if (!hyperv_feature_supported(cs, feat)) {
> +                error_setg(errp, "Hyper-V %s is not supported by kernel",
> +                           kvm_hyperv_properties[feat].desc);
> +                return;
> +            }
> +
> +            /* Check dependencies */
> +            hv_feature_check_deps(cpu, feat, &local_err);
> +            if (local_err != NULL) {
> +                error_propagate(errp, local_err);
> +                return;
> +            }
> +        }
>      }
>  
>      /* Additional dependencies not covered by kvm_hyperv_properties[] */
> -- 
> 2.30.2
> 

-- 
Eduardo


