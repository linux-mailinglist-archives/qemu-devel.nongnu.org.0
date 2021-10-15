Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D9E42FCF4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 22:23:57 +0200 (CEST)
Received: from localhost ([::1]:49764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbTkC-0001Ud-IB
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 16:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mbTiq-0000Ud-Rd
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 16:22:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mbTim-0006HU-B1
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 16:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634329345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hvsZkG3KnWUYwXWEFaFIkFDP3wi/BuPozxQZo81Gi2M=;
 b=GcJo+OW1nZxYWw4xxkdRK6ToAWZV7imwySPq+5VnFPwdyt5pRqFcF1llCS4lf37b2+XhWI
 k9EWoY8K7gxDYJ+sVJ8TXz63tQZ1o3ThwAYw0eLMM2yJCyA1w08NVCfzysI0GfXHt7ipgh
 3FAdwWOJB8Y3Rpt9JxfmgJ+XZ2+kL9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-CRdNaHQnMAaJIhFrD8Vmzg-1; Fri, 15 Oct 2021 16:22:22 -0400
X-MC-Unique: CRdNaHQnMAaJIhFrD8Vmzg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58E688024C7;
 Fri, 15 Oct 2021 20:22:21 +0000 (UTC)
Received: from localhost (unused-10-15-17-6.yyz.redhat.com [10.15.17.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF2071002D6A;
 Fri, 15 Oct 2021 20:22:20 +0000 (UTC)
Date: Fri, 15 Oct 2021 16:22:20 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH 3/5] target/i386: Enable host pass through of Intel PT
Message-ID: <20211015202220.ghdn6gsdfuh56xq7@habkost.net>
References: <20210909144150.1728418-1-xiaoyao.li@intel.com>
 <20210909144150.1728418-4-xiaoyao.li@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210909144150.1728418-4-xiaoyao.li@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 10:41:48PM +0800, Xiaoyao Li wrote:
> commit e37a5c7fa459 ("i386: Add Intel Processor Trace feature support")
> added the support of Intel PT by making CPUID[14] of PT as fixed feature
> set (from ICX) for any CPU model on any host.
> 
> This truly breaks the PT exposing on Intel SPR platform because SPR has
> less supported bitmap CPUID(0x14,1):EBX[15:0] than ICX.
> 
> This patch enables passing through host's PT capabilities for the case
> "-cpu host/max" while ensure named CPU model still has the fixed
> PT feature set to not break the live migration.
> 
> It introduces @has_specific_intel_pt_feature_set field for name CPU
> model. If a named CPU model has this field as false, it will use fixed
> PT feature set of ICX. Besides same to previous behavior, if fixed PT
> feature set of ICX cannot be satisfied/supported by host, it disables PT
> instead of adjusting the feature set based on host's capabilities.
> 
> In the future, new named CPU model, e.g., Sapphire Rapids, can define
> its own PT feature set by setting @has_specific_intel_pt_feature_set to
> true and defines it's own FEAT_14_0_EBX, FEAT_14_0_ECX, FEAT_14_1_EAX
> and FEAT_14_1_EBX.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  target/i386/cpu.c | 106 ++++++++++++++++++++--------------------------
>  target/i386/cpu.h |   1 +
>  2 files changed, 47 insertions(+), 60 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 58e98210f219..00c4ad23110d 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -543,34 +543,24 @@ static CPUCacheInfo legacy_l3_cache = {
>  #define L2_ITLB_4K_ASSOC       4
>  #define L2_ITLB_4K_ENTRIES   512
>  
> -/* CPUID Leaf 0x14 constants: */
> -#define INTEL_PT_MAX_SUBLEAF     0x1
> -/*
> - * bit[00]: IA32_RTIT_CTL.CR3 filter can be set to 1 and IA32_RTIT_CR3_MATCH
> - *          MSR can be accessed;
> - * bit[01]: Support Configurable PSB and Cycle-Accurate Mode;
> - * bit[02]: Support IP Filtering, TraceStop filtering, and preservation
> - *          of Intel PT MSRs across warm reset;
> - * bit[03]: Support MTC timing packet and suppression of COFI-based packets;
> - */
> -#define INTEL_PT_MINIMAL_EBX     0xf
> -/*
> - * bit[00]: Tracing can be enabled with IA32_RTIT_CTL.ToPA = 1 and
> - *          IA32_RTIT_OUTPUT_BASE and IA32_RTIT_OUTPUT_MASK_PTRS MSRs can be
> - *          accessed;
> - * bit[01]: ToPA tables can hold any number of output entries, up to the
> - *          maximum allowed by the MaskOrTableOffset field of
> - *          IA32_RTIT_OUTPUT_MASK_PTRS;
> - * bit[02]: Support Single-Range Output scheme;
> - */
> -#define INTEL_PT_MINIMAL_ECX     0x7
> -/* generated packets which contain IP payloads have LIP values */
> -#define INTEL_PT_IP_LIP          (1 << 31)
> -#define INTEL_PT_ADDR_RANGES_NUM 0x2 /* Number of configurable address ranges */
> -#define INTEL_PT_ADDR_RANGES_NUM_MASK 0x7
> -#define INTEL_PT_MTC_BITMAP      (0x0249 << 16) /* Support ART(0,3,6,9) */
> -#define INTEL_PT_CYCLE_BITMAP    0x1fff         /* Support 0,2^(0~11) */
> -#define INTEL_PT_PSB_BITMAP      (0x003f << 16) /* Support 2K,4K,8K,16K,32K,64K */
> +#define INTEL_PT_MAX_SUBLEAF                0x1
> +#define INTEL_PT_DEFAULT_ADDR_RANGES_NUM    0x2
> +#define INTEL_PT_ADDR_RANGES_NUM_MASK       0x7
> +/* Support ART(0,3,6,9) */
> +#define INTEL_PT_DEFAULT_MTC_BITMAP         0x0249
> +/* Support 0,2^(0~11) */
> +#define INTEL_PT_DEFAULT_CYCLE_BITMAP       0x1fff
> +/* Support 2K,4K,8K,16K,32K,64K */
> +#define INTEL_PT_DEFAULT_PSB_BITMAP         0x003f
> +
> +#define INTEL_PT_DEFAULT_0_EBX  (CPUID_14_0_EBX_CR3_FILTER | \
> +            CPUID_14_0_EBX_PSB | CPUID_14_0_EBX_IP_FILTER | CPUID_14_0_EBX_MTC)
> +#define INTEL_PT_DEFAULT_0_ECX  (CPUID_14_0_ECX_TOPA | \
> +            CPUID_14_0_ECX_MULTI_ENTRIES | CPUID_14_0_ECX_SINGLE_RANGE)
> +#define INTEL_PT_DEFAULT_1_EAX  (INTEL_PT_DEFAULT_MTC_BITMAP << 16 | \
> +                                 INTEL_PT_DEFAULT_ADDR_RANGES_NUM)
> +#define INTEL_PT_DEFAULT_1_EBX  (INTEL_PT_DEFAULT_PSB_BITMAP << 16 | \
> +                                 INTEL_PT_DEFAULT_CYCLE_BITMAP)

I like these new macros because they make the code at
x86_cpu_filter_features() clearer.  Can we do this in a separate
patch, to be applied before "Introduce FeatureWordInfo for Intel
PT CPUID leaf 0xD"?

>  
>  void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
>                                uint32_t vendor2, uint32_t vendor3)
> @@ -1517,6 +1507,7 @@ typedef struct X86CPUDefinition {
>      int family;
>      int model;
>      int stepping;
> +    bool has_specific_intel_pt_feature_set;
>      FeatureWordArray features;
>      const char *model_id;
>      const CPUCaches *const cache_info;
> @@ -5061,6 +5052,14 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
>          env->features[w] = def->features[w];
>      }
>  
> +    if (!def->has_specific_intel_pt_feature_set) {
> +        env->use_default_intel_pt = true;
> +        env->features[FEAT_14_0_EBX] = INTEL_PT_DEFAULT_0_EBX;
> +        env->features[FEAT_14_0_ECX] = INTEL_PT_DEFAULT_0_ECX;
> +        env->features[FEAT_14_1_EAX] = INTEL_PT_DEFAULT_1_EAX;
> +        env->features[FEAT_14_1_EBX] = INTEL_PT_DEFAULT_1_EBX;
> +    }

There's nothing special about intel-pt, and other features might
benefit from having default values set if omitted from the CPU
model definition.  I don't know yet what's the best solution
here, but some possibilities are:

A) The simpler and more obvious solution: just set
  features[FEAT_14_*] explicitly to INTEL_PT_DEFAULT_* on all CPU
  models in builtin_x86_defs.

B) Treat (env->features[FEAT_14_0_EBX] == 0 &&
          env->features[FEAT_14_0_ECX] == 0 &&
          env->features[FEAT_14_1_EAX] == 0 &&
          env->features[FEAT_14_1_EBX] == 0) as a special case
  that indicates that INTEL_PT_DEFAULT_* should be used instead
  of 0.

C) Rework X86CPUDefinition completely and replace
    FeatureWordArray features;
  with something like:
    struct {
      FeatureWord w;
      uint32_t value;
    } *features;
  or:
    struct {
      const char *property, *value;
    } *features;
  so we can have a concept of omitted/default flags in
  builtin_x86_defs.

(A) and (C) are generic but require a lot more work, so we could
keep your solution or just implement (B).

In either case, I suggest you add a comment explaining why the
boolean flag or special case exists (I believe the answer is:
"because all CPU models have the same default value for
INTEL_PT_* and we don't want to manually copy/paste it to all
entries in builtin_x86_defs").

> +
>      /* legacy-cache defaults to 'off' if CPU model provides cache info */
>      cpu->legacy_cache = !def->cache_info;
>  
> @@ -5465,14 +5464,11 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>  
>          if (count == 0) {
>              *eax = INTEL_PT_MAX_SUBLEAF;
> -            *ebx = INTEL_PT_MINIMAL_EBX;
> -            *ecx = INTEL_PT_MINIMAL_ECX;
> -            if (env->features[FEAT_14_0_ECX] & CPUID_14_0_ECX_LIP) {
> -                *ecx |= CPUID_14_0_ECX_LIP;
> -            }
> +            *ebx = env->features[FEAT_14_0_EBX];
> +            *ecx = env->features[FEAT_14_0_ECX];
>          } else if (count == 1) {
> -            *eax = INTEL_PT_MTC_BITMAP | INTEL_PT_ADDR_RANGES_NUM;
> -            *ebx = INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP;
> +            *eax = env->features[FEAT_14_1_EAX];
> +            *ebx = env->features[FEAT_14_1_EBX];
>          }
>          break;
>      }
> @@ -6081,6 +6077,7 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>      CPUX86State *env = &cpu->env;
>      FeatureWord w;
>      const char *prefix = NULL;
> +    uint64_t host_feat;
>  
>      if (verbose) {
>          prefix = accel_uses_host_cpuid()
> @@ -6089,8 +6086,7 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>      }
>  
>      for (w = 0; w < FEATURE_WORDS; w++) {
> -        uint64_t host_feat =
> -            x86_cpu_get_supported_feature_word(w, false);
> +        host_feat = x86_cpu_get_supported_feature_word(w, false);

This doesn't look right.  The value of host_feat set here is
useless outside this for loop, and there's no reason to change
the scope of this variable.

>          uint64_t requested_features = env->features[w];
>          uint64_t unavailable_features;
>          if (w == FEAT_14_1_EAX) {
> @@ -6107,32 +6103,22 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
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
> +    if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) {
> +        host_feat = x86_cpu_get_supported_feature_word(FEAT_14_0_ECX, false);

This doesn't look right.  You seem to be using the same variable
(host_feat) for two completely different purposes.

>  
> -        if (!eax_0 ||
> -           ((ebx_0 & INTEL_PT_MINIMAL_EBX) != INTEL_PT_MINIMAL_EBX) ||
> -           ((ecx_0 & INTEL_PT_MINIMAL_ECX) != INTEL_PT_MINIMAL_ECX) ||
> -           ((eax_1 & INTEL_PT_MTC_BITMAP) != INTEL_PT_MTC_BITMAP) ||
> -           ((eax_1 & INTEL_PT_ADDR_RANGES_NUM_MASK) <
> -                                           INTEL_PT_ADDR_RANGES_NUM) ||
> -           ((ebx_1 & (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) !=
> -                (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) ||
> -           ((ecx_0 & CPUID_14_0_ECX_LIP) !=
> -                (env->features[FEAT_14_0_ECX] & CPUID_14_0_ECX_LIP))) {
> -            /*
> -             * Processor Trace capabilities aren't configurable, so if the
> -             * host can't emulate the capabilities we report on
> -             * cpu_x86_cpuid(), intel-pt can't be enabled on the current host.
> -             */
> +        if (env->use_default_intel_pt &&
> +            ((env->features[FEAT_14_0_EBX] != INTEL_PT_DEFAULT_0_EBX) ||
> +             ((env->features[FEAT_14_0_ECX] & ~CPUID_14_0_ECX_LIP) !=
> +              INTEL_PT_DEFAULT_0_ECX) ||
> +             (env->features[FEAT_14_1_EAX] != INTEL_PT_DEFAULT_1_EAX) ||
> +             (env->features[FEAT_14_1_EBX] != INTEL_PT_DEFAULT_1_EBX))) {
>              mark_unavailable_features(cpu, FEAT_7_0_EBX, CPUID_7_0_EBX_INTEL_PT, prefix);

Why is use_default_intel_pt necessary?  Why can't this function
simply validate whatever is inside env->features[FEAT_14_*]?

>          }
> +
> +        if ((env->features[FEAT_14_0_ECX] ^ host_feat) & CPUID_14_0_ECX_LIP) {

What if CPUID_7_0_EBX_INTEL_PT is not set?  What should be the
value of host_feat?

> +            warn_report("Cannot configure different Intel PT IP payload format than hardware");
> +            mark_unavailable_features(cpu, FEAT_7_0_EBX, CPUID_7_0_EBX_INTEL_PT, NULL);
> +        }
>      }
>  }
>  
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index f5478a169f9a..e6236c371c4f 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1639,6 +1639,7 @@ typedef struct CPUX86State {
>      uint32_t cpuid_vendor2;
>      uint32_t cpuid_vendor3;
>      uint32_t cpuid_version;
> +    bool use_default_intel_pt;
>      FeatureWordArray features;
>      /* Features that were explicitly enabled/disabled */
>      FeatureWordArray user_features;
> -- 
> 2.27.0
> 

-- 
Eduardo


