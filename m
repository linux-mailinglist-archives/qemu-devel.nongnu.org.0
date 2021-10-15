Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE6942F7B4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 18:09:39 +0200 (CEST)
Received: from localhost ([::1]:58262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbPm5-0000xX-3l
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 12:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mbPgq-0005CT-8a
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 12:04:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mbPgl-0005fc-Rs
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 12:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634313846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y3LJjtoz0uRRFTsQWHc7XMSVvIW1DBXkvuFCX2PL1IE=;
 b=dyDD1SfriYewf9CCcWIH4tdUtmPWjOnbJo6d7+O57Vu5PaOva7PeYQFBKLrwmxc9OU9R/+
 4eUWOCjqShFq7h18YEpsSyqi4Xe4Y7Gyl+d/HIScpgWcEWc1SdAqYSVBo6t6NfsN0AItlt
 fReIUJaMz3ZoiL95X6caoGxqyPlBG4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-tssgWI0TPz2t4-gkufKUhQ-1; Fri, 15 Oct 2021 12:04:03 -0400
X-MC-Unique: tssgWI0TPz2t4-gkufKUhQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1313380363C;
 Fri, 15 Oct 2021 16:04:02 +0000 (UTC)
Received: from localhost (unused-10-15-17-6.yyz.redhat.com [10.15.17.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4AD910016F7;
 Fri, 15 Oct 2021 16:04:01 +0000 (UTC)
Date: Fri, 15 Oct 2021 12:04:01 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH 2/5] target/i386: Introduce FeatureWordInfo for Intel
 PT CPUID leaf 0xD
Message-ID: <20211015160401.ixrglqwnx5i6s6ks@habkost.net>
References: <20210909144150.1728418-1-xiaoyao.li@intel.com>
 <20210909144150.1728418-3-xiaoyao.li@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210909144150.1728418-3-xiaoyao.li@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
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

Hi,

Apologies for the delay.  Comments below:

On Thu, Sep 09, 2021 at 10:41:47PM +0800, Xiaoyao Li wrote:
> CPUID leaf 0x14 subleaf 0x0 and 0x1 enumerate the resource and
> capability of Intel PT.
> 
> Introduce FeatureWord FEAT_14_0_EBX, FEAT_14_1_EAX and FEAT_14_1_EBX,
> and complete FEAT_14_0_ECX. Thus all the features of Intel PT can be
> expanded when "-cpu host/max" and can be configured in named CPU model.
> 
> Regarding FEAT_14_1_EAX and FEAT_14_1_EBX, don't define the name for
> them since each bit of them doesn't represent a standalone sub-feature
> of Intel PT. However, explicitly mark them as migratable. So the
> meaningful bits of them can be autoenabled in x86_cpu_expand_features().
> 
> It has special handling for FEAT_14_1_EAX[2:0], because the 3 bits as a
> whole represents the number of PT ADDRn_CFG ranges. Thus it has special
> handling in mark_unavailable_features() and x86_cpu_filter_features().
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  target/i386/cpu.c | 87 +++++++++++++++++++++++++++++++++++++++++------
>  target/i386/cpu.h | 37 +++++++++++++++++++-
>  2 files changed, 112 insertions(+), 12 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index a06473c9e84c..58e98210f219 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -567,7 +567,7 @@ static CPUCacheInfo legacy_l3_cache = {
>  /* generated packets which contain IP payloads have LIP values */
>  #define INTEL_PT_IP_LIP          (1 << 31)
>  #define INTEL_PT_ADDR_RANGES_NUM 0x2 /* Number of configurable address ranges */
> -#define INTEL_PT_ADDR_RANGES_NUM_MASK 0x3
> +#define INTEL_PT_ADDR_RANGES_NUM_MASK 0x7
>  #define INTEL_PT_MTC_BITMAP      (0x0249 << 16) /* Support ART(0,3,6,9) */
>  #define INTEL_PT_CYCLE_BITMAP    0x1fff         /* Support 0,2^(0~11) */
>  #define INTEL_PT_PSB_BITMAP      (0x003f << 16) /* Support 2K,4K,8K,16K,32K,64K */
> @@ -1161,17 +1161,32 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>          }
>      },
>  
> +    [FEAT_14_0_EBX] = {
> +        .type = CPUID_FEATURE_WORD,
> +        .feat_names = {
> +            [0] = "intel-pt-cr3-filter",
> +            [1] = "intel-pt-PSB",

I suggest using lowercase for all feature names, as it is the
usual convention for QOM property names.

> +            [2] = "intel-pt-ip-filter",
> +            [3] = "intel-pt-mtc",
> +            [4] = "intel-pt-ptwrite",
> +            [5] = "intel-pt-power-event",
> +            [6] = "intel-pt-psb-pmi-preservation",

This has a side effect: live migration with those flags enabled
will become possible.

All bits allow enumerate support for an optional feature to be
enabled by the OS, so it means we can emulate a CPU with bit=0
CPU on a bit=1 host.  So it will be safe as long as there's no
additional state that needs to be live migrated when those
features are used.  Do we have any additional state, or all MSRs
currently being migrated are enough?

> +        },
> +        .cpuid = {
> +            .eax = 0x14,
> +            .needs_ecx = true, .ecx = 0,
> +            .reg = R_EBX,
> +        },
> +    },
> +
>      [FEAT_14_0_ECX] = {
>          .type = CPUID_FEATURE_WORD,
>          .feat_names = {
> -            NULL, NULL, NULL, NULL,
> -            NULL, NULL, NULL, NULL,
> -            NULL, NULL, NULL, NULL,
> -            NULL, NULL, NULL, NULL,
> -            NULL, NULL, NULL, NULL,
> -            NULL, NULL, NULL, NULL,
> -            NULL, NULL, NULL, NULL,
> -            NULL, NULL, NULL, "intel-pt-lip",
> +            [0] = "intel-pt-topa",
> +            [1] = "intel-pt-multi-topa-entries",
> +            [2] = "intel-pt-single-range",
> +            [3] = "intel-pt-trace-transport-subsystem",

All bits above are also optional features to be enabled
explicitly by the OS, so it also seems OK.

> +            [31] = "intel-pt-lip",

This one is trickier because its value must match the host, but
it is already present in the existing code.  We already have an
explicit check for host LIP == guest LIP, so it's OK.

>          },
>          .cpuid = {
>              .eax = 0x14,
> @@ -1181,6 +1196,26 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>          .tcg_features = TCG_14_0_ECX_FEATURES,
>       },
>  
> +    [FEAT_14_1_EAX] = {
> +        .type = CPUID_FEATURE_WORD,
> +        .cpuid = {
> +            .eax = 0x14,
> +            .needs_ecx = true, .ecx = 1,
> +            .reg = R_EAX,
> +        },
> +        .migratable_flags = ~0ull,

This one is trickier.  I see a few potential issues:

* Bits 15:3 are documented as reserved on my version of the Intel
  SDM (June 2021).  If they are reserved, I don't think we should
  make them migratable yet.  If they aren't, do you have a
  pointer to the documentation?

* Bits 2:0 is a number, not a simple boolean flag.  You are
  handling this as a special case in x86_cpu_filter_features()
  below, so it should be OK.

* The flags are migratable but have no names.  The only existing
  case of non-zero .migratable_flags required a special case at
  x86_cpu_feature_name().  I'm pretty sure this might break the
  getter of the "unavailable-features" property.  I think we need
  to make x86_cpu_feature_name() safer, somehow, or (a quicker
  solution) we can add names to all migratable bits here (even if
  they are not intended to be set by end users).

> +    },
> +
> +    [FEAT_14_1_EBX] = {
> +        .type = CPUID_FEATURE_WORD,
> +        .cpuid = {
> +            .eax = 0x14,
> +            .needs_ecx = true, .ecx = 1,
> +            .reg = R_EBX,
> +        },
> +        .migratable_flags = ~0ull,

Same observation above about flags with no names apply here.

> +    },
> +
>  };
>  
>  typedef struct FeatureMask {
> @@ -1253,10 +1288,22 @@ static FeatureDep feature_dependencies[] = {
>          .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_RDSEED },
>          .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_RDSEED_EXITING },
>      },
> +    {
> +        .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INTEL_PT },
> +        .to = { FEAT_14_0_EBX,              ~0ull },
> +    },
>      {
>          .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INTEL_PT },
>          .to = { FEAT_14_0_ECX,              ~0ull },
>      },
> +    {
> +        .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INTEL_PT },
> +        .to = { FEAT_14_1_EAX,              ~0ull },
> +    },
> +    {
> +        .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INTEL_PT },
> +        .to = { FEAT_14_1_EBX,              ~0ull },
> +    },
>      {
>          .from = { FEAT_8000_0001_EDX,       CPUID_EXT2_RDTSCP },
>          .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_RDTSCP },
> @@ -4260,7 +4307,14 @@ static void mark_unavailable_features(X86CPU *cpu, FeatureWord w, uint64_t mask,
>          return;
>      }
>  
> -    for (i = 0; i < 64; ++i) {
> +    if ((w == FEAT_14_1_EAX) && (mask & INTEL_PT_ADDR_RANGES_NUM_MASK)) {
> +        warn_report("%s: CPUID.14H_01H:EAX [bit 2:0]", verbose_prefix);
> +        i = 3;
> +    } else {
> +        i = 0;
> +    }

That's tricky and easy to break.  To be honest, I prefer having
duplicate error messages showing bit 2,1,0 than having this hack.

If you want to make some range of CPUID bits special, I'd prefer
to implement this as a FeatureWordInfo field that indicates that.
This way this function doesn't become a pile of special cases on
top of each other.

In either case, I suggest addressing the duplicate error messages
in a separate patch so this discussion doesn't block the rest.

> +
> +    for (; i < 64; ++i) {
>          if ((1ULL << i) & mask) {
>              g_autofree char *feat_word_str = feature_word_description(f, i);
>              warn_report("%s: %s%s%s [bit %d]",
> @@ -6038,7 +6092,18 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>          uint64_t host_feat =
>              x86_cpu_get_supported_feature_word(w, false);
>          uint64_t requested_features = env->features[w];
> -        uint64_t unavailable_features = requested_features & ~host_feat;
> +        uint64_t unavailable_features;
> +        if (w == FEAT_14_1_EAX) {

I would love to find a way to make this more readable, but it's
simple enough.

Maybe a `switch (w)` statement would be better, to make it easier
to extend in the future, and discourage people from adding
special cases that are more complex than (w == FEAT_...).

Maybe it would be good to create a
  void x86_cpu_filter_feature_word(X86CPU *cpu, FeatureWord w)
function to keep the code complexity under control.

> +            unavailable_features = (requested_features & ~host_feat) &
> +                                   ~INTEL_PT_ADDR_RANGES_NUM_MASK;
> +            if ((requested_features & INTEL_PT_ADDR_RANGES_NUM_MASK) >
> +                (host_feat & INTEL_PT_ADDR_RANGES_NUM_MASK)) {
> +                unavailable_features |= requested_features &
> +                                        INTEL_PT_ADDR_RANGES_NUM_MASK;
> +            }
> +        } else {
> +            unavailable_features = requested_features & ~host_feat;
> +        }
>          mark_unavailable_features(cpu, w, unavailable_features, prefix);
>      }
>  

I miss the cpu_x86_cpuid() changes to actual use the new feature
words, here.  I think a cpu_x86_cpuid() change should be done in
the same patch, or we risk having a QEMU commit where the CPU
properties exist but do absolutely nothing.

> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 6c50d3ab4f1d..f5478a169f9a 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -566,7 +566,10 @@ typedef enum FeatureWord {
>      FEAT_VMX_EPT_VPID_CAPS,
>      FEAT_VMX_BASIC,
>      FEAT_VMX_VMFUNC,
> +    FEAT_14_0_EBX,
>      FEAT_14_0_ECX,
> +    FEAT_14_1_EAX,
> +    FEAT_14_1_EBX,
>      FEATURE_WORDS,
>  } FeatureWord;
>  
> @@ -835,8 +838,40 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
>  /* AVX512 BFloat16 Instruction */
>  #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
>  
> +/*
> + * IA32_RTIT_CTL.CR3 filter can be set to 1 and
> + * IA32_RTIT_CR3_MATCH can be accessed
> + */
> +#define CPUID_14_0_EBX_CR3_FILTER               (1U << 0)
> +/* Support Configurable PSB and Cycle-Accurate Mode */
> +#define CPUID_14_0_EBX_PSB                      (1U << 1)
> +/*
> + * Support IP Filtering, IP TraceStop, and preservation
> + * of Intel PT MSRs across warm reset
> + */
> +#define CPUID_14_0_EBX_IP_FILTER                (1U << 2)
> +/* Support MTC timing packet */
> +#define CPUID_14_0_EBX_MTC                      (1U << 3)
> +/* Support PTWRITE */
> +#define CPUID_14_0_EBX_PTWRITE                  (1U << 4)
> +/* Support Power Event Trace packet generation */
> +#define CPUID_14_0_EBX_POWER_EVENT              (1U << 5)
> +/* Support PSB and PMI Preservation */
> +#define CPUID_14_0_EBX_PSB_PMI_PRESERVATION     (1U << 6)
> +
> +/* Tracing can be enabled with IA32_RTIT_CTL.ToPA = 1 */
> +#define CPUID_14_0_ECX_TOPA                     (1U << 0)
> +/*
> + * ToPA tables can hold any number of output entries, up to the maximum allowed
> + * by the MaskOrTableOffset field of IA32_RTIT_OUTPUT_MASK_PTRS
> + */
> +#define CPUID_14_0_ECX_MULTI_ENTRIES            (1U << 1)
> +/* Support Single-Range Output scheme */
> +#define CPUID_14_0_ECX_SINGLE_RANGE             (1U << 2)
> +/* Support IA32_RTIT_CTL.FabricEn */
> +#define CPUID_14_0_ECX_TRACE_TRANS_SUBSYSTEM    (1U << 3)
>  /* Packets which contain IP payload have LIP values */
> -#define CPUID_14_0_ECX_LIP              (1U << 31)
> +#define CPUID_14_0_ECX_LIP                      (1U << 31)
>  
>  /* CLZERO instruction */
>  #define CPUID_8000_0008_EBX_CLZERO      (1U << 0)
> -- 
> 2.27.0
> 

-- 
Eduardo


