Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4606869DA4E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 06:16:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUKyt-0005TZ-Ie; Tue, 21 Feb 2023 00:14:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pUKyq-0005TK-TS
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 00:14:21 -0500
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1pUKyo-0005oh-3T
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 00:14:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676956458; x=1708492458;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=r5NxBrLxlzfYrU8ZiY2I9orOukvysH0hvluokRcU4Sw=;
 b=RhEKh6vf6fZP69dMWkXuNwcB3ZZlJCrSZgErjSzcxKZISMZ2xpulBazy
 uxL2n64OME+Dms1ZsFoyHOKeSTKLVxqhwnan8nGxkC46eF4Ux6YF4Kb0f
 q9gRTO/fjyyFB6vJSG41Efmyqq0OvYTDpJ/v2hbbeobhhQtsGkQoDOXd+
 zBC66vmD9PNLkQ6DJetOlZ4q6NV7ghe9bAvfNeaJGlfejV2x5HG8tjCUl
 iZqsz2dLAmu+B9iFC+7QrgRUa/aXom8FqFFGEGXsDpAjM13K/NuFuNGkw
 6MtD4zF8x3TBwmsosWqqY2xsXAZT8kNrBnLABVX/MmQ9oSQodzmtajfDM w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="331212087"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; d="scan'208";a="331212087"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 21:14:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="780861213"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; d="scan'208";a="780861213"
Received: from leiwang7-mobl.ccr.corp.intel.com (HELO [10.238.212.107])
 ([10.238.212.107])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 21:14:13 -0800
Message-ID: <219476ab-c8e6-95a8-ee0b-348421362ced@intel.com>
Date: Tue, 21 Feb 2023 13:14:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v3 6/8] target/i386/intel-pt: Enable host pass through of
 Intel PT
To: Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20221208062513.2589476-1-xiaoyao.li@intel.com>
 <20221208062513.2589476-7-xiaoyao.li@intel.com>
From: "Wang, Lei" <lei4.wang@intel.com>
Content-Language: en-US
In-Reply-To: <20221208062513.2589476-7-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=lei4.wang@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 12/8/2022 2:25 PM, Xiaoyao Li wrote:
> commit e37a5c7fa459 ("i386: Add Intel Processor Trace feature support")
> added the support of Intel PT by making CPUID[14] of PT as fixed feature
> set (from ICX) for any CPU model on any host. This truly breaks the PT
> exposure on Intel SPR platform because SPR has less supported bitmap of
> CPUID(0x14,1):EBX[15:0] than ICX.
> 
> To fix the problem, enable pass through of host's PT capabilities for
> the cases "-cpu host/max" that it won't use default fixed PT feature set
> of ICX but expand automatically based on get_supported_cpuid reported by
> host. Meanwhile, it needs to ensure named CPU model still has the fixed
> PT feature set to not break the live migration case of
> "-cpu named_cpu_model,+intel-pt"
> 
> Introduces env->use_default_intel_pt flag.
>  - True means it's old CPU model that uses fixed PT feature set of ICX.
>  - False means the named CPU model has its own PT feature set.
> 
> Besides, to keep the same behavior for old CPU models that validate PT
> feature set against default fixed PT feature set of ICX in addition to
> validate from host's capabilities (via get_supported_cpuid) in
> x86_cpu_filter_features().
> 
> In the future, new named CPU model, e.g., Sapphire Rapids, can define
> its own PT feature set by setting @has_specific_intel_pt_feature_set to
> true and defines it's own FEAT_14_0_EBX, FEAT_14_0_ECX, FEAT_14_1_EAX
> and FEAT_14_1_EBX.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  target/i386/cpu.c | 71 ++++++++++++++++++++++++++---------------------
>  target/i386/cpu.h |  1 +
>  2 files changed, 40 insertions(+), 32 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index e302cbbebfc5..24f3c7b06698 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5194,6 +5194,21 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
>          env->features[w] = def->features[w];
>      }
>  
> +    /*
> +     * All (old) named CPU models have the same default values for INTEL_PT_*
> +     *
> +     * Assign the default value here since we don't want to manually copy/paste
> +     * it to all entries in builtin_x86_defs.
> +     */
> +    if (!env->features[FEAT_14_0_EBX] && !env->features[FEAT_14_0_ECX] &&
> +        !env->features[FEAT_14_1_EAX] && !env->features[FEAT_14_1_EBX]) {
> +        env->use_default_intel_pt = true;
> +        env->features[FEAT_14_0_EBX] = INTEL_PT_DEFAULT_0_EBX;
> +        env->features[FEAT_14_0_ECX] = INTEL_PT_DEFAULT_0_ECX;
> +        env->features[FEAT_14_1_EAX] = INTEL_PT_DEFAULT_1_EAX;
> +        env->features[FEAT_14_1_EBX] = INTEL_PT_DEFAULT_1_EBX;
> +    }
> +
>      /* legacy-cache defaults to 'off' if CPU model provides cache info */
>      cpu->legacy_cache = !def->cache_info;
>  
> @@ -5716,14 +5731,11 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>  
>          if (count == 0) {
>              *eax = INTEL_PT_MAX_SUBLEAF;
> -            *ebx = INTEL_PT_DEFAULT_0_EBX;
> -            *ecx = INTEL_PT_DEFAULT_0_ECX;
> -            if (env->features[FEAT_14_0_ECX] & CPUID_14_0_ECX_LIP) {
> -                *ecx |= CPUID_14_0_ECX_LIP;
> -            }
> +            *ebx = env->features[FEAT_14_0_EBX];
> +            *ecx = env->features[FEAT_14_0_ECX];
>          } else if (count == 1) {
> -            *eax = INTEL_PT_DEFAULT_1_EAX;
> -            *ebx = INTEL_PT_DEFAULT_1_EBX;
> +            *eax = env->features[FEAT_14_1_EAX];
> +            *ebx = env->features[FEAT_14_1_EBX];
>          }
>          break;
>      }
> @@ -6425,6 +6437,7 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>      CPUX86State *env = &cpu->env;
>      FeatureWord w;
>      const char *prefix = NULL;
> +    uint64_t host_feat;
>  
>      if (verbose) {
>          prefix = accel_uses_host_cpuid()
> @@ -6433,8 +6446,7 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>      }
>  
>      for (w = 0; w < FEATURE_WORDS; w++) {
> -        uint64_t host_feat =
> -            x86_cpu_get_supported_feature_word(w, false);
> +        host_feat = x86_cpu_get_supported_feature_word(w, false);
>          uint64_t requested_features = env->features[w];
>          uint64_t unavailable_features;
>  
> @@ -6458,31 +6470,26 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>          mark_unavailable_features(cpu, w, unavailable_features, prefix);
>      }
>  
> -    if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) &&
> -        kvm_enabled()) {
> -        KVMState *s = CPU(cpu)->kvm_state;
> -        uint32_t eax_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_EAX);
> -        uint32_t ebx_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_EBX);
> -        uint32_t ecx_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_ECX);
> -        uint32_t eax_1 = kvm_arch_get_supported_cpuid(s, 0x14, 1, R_EAX);
> -        uint32_t ebx_1 = kvm_arch_get_supported_cpuid(s, 0x14, 1, R_EBX);
> -
> -        if (!eax_0 ||
> -           ((ebx_0 & INTEL_PT_DEFAULT_0_EBX) != INTEL_PT_DEFAULT_0_EBX) ||
> -           ((ecx_0 & INTEL_PT_DEFAULT_0_ECX) != INTEL_PT_DEFAULT_0_ECX) ||
> -           ((eax_1 & INTEL_PT_DEFAULT_MTC_BITMAP) != INTEL_PT_DEFAULT_MTC_BITMAP) ||
> -           ((eax_1 & INTEL_PT_ADDR_RANGES_NUM_MASK) <
> -                                      INTEL_PT_DEFAULT_ADDR_RANGES_NUM) ||
> -           ((ebx_1 & INTEL_PT_DEFAULT_1_EBX) != INTEL_PT_DEFAULT_1_EBX) ||
> -           ((ecx_0 & CPUID_14_0_ECX_LIP) !=
> -                (env->features[FEAT_14_0_ECX] & CPUID_14_0_ECX_LIP))) {
> -            /*
> -             * Processor Trace capabilities aren't configurable, so if the
> -             * host can't emulate the capabilities we report on
> -             * cpu_x86_cpuid(), intel-pt can't be enabled on the current host.
> -             */
> +    if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) {
> +        /*
> +         * env->use_default_intel_pt is true means the CPU model doesn't have
> +         * INTEL_PT_* specified. In this case, we need to check it has the
> +         * value of default INTEL_PT to not break live migration
> +         */
> +        if (env->use_default_intel_pt &&
> +            ((env->features[FEAT_14_0_EBX] != INTEL_PT_DEFAULT_0_EBX) ||

When will the env->use_default_intel_pt be true and env->features[FEAT_14_0_EBX]
!= INTEL_PT_DEFAULT_0_EBX? It seems they will always be equal if
env->use_default_intel_pt is true according to your code above.

> +             ((env->features[FEAT_14_0_ECX] & ~CPUID_14_0_ECX_LIP) !=
> +              INTEL_PT_DEFAULT_0_ECX) ||
> +             (env->features[FEAT_14_1_EAX] != INTEL_PT_DEFAULT_1_EAX) ||
> +             (env->features[FEAT_14_1_EBX] != INTEL_PT_DEFAULT_1_EBX))) {
>              mark_unavailable_features(cpu, FEAT_7_0_EBX, CPUID_7_0_EBX_INTEL_PT, prefix);
>          }
> +
> +        host_feat = x86_cpu_get_supported_feature_word(FEAT_14_0_ECX, false);
> +        if ((env->features[FEAT_14_0_ECX] ^ host_feat) & CPUID_14_0_ECX_LIP) {
> +            warn_report("Cannot configure different Intel PT IP payload format than hardware");
> +            mark_unavailable_features(cpu, FEAT_7_0_EBX, CPUID_7_0_EBX_INTEL_PT, NULL);
> +        }
>      }
>  }
>  
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 93fb5a87b40e..91a3971c1c29 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1784,6 +1784,7 @@ typedef struct CPUArchState {
>      uint32_t cpuid_vendor2;
>      uint32_t cpuid_vendor3;
>      uint32_t cpuid_version;
> +    bool use_default_intel_pt;
>      FeatureWordArray features;
>      /* Features that were explicitly enabled/disabled */
>      FeatureWordArray user_features;

