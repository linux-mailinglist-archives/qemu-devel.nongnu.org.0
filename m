Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E6430723
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 09:54:44 +0200 (CEST)
Received: from localhost ([::1]:60520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mc10F-0003TK-5h
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 03:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mc0zK-0002lz-RY
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 03:53:46 -0400
Received: from mga14.intel.com ([192.55.52.115]:25423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mc0zH-0005dd-Ap
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 03:53:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10139"; a="228373333"
X-IronPort-AV: E=Sophos;i="5.85,379,1624345200"; d="scan'208";a="228373333"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 00:53:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,379,1624345200"; d="scan'208";a="493168887"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.249.173.133])
 ([10.249.173.133])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 00:53:36 -0700
Message-ID: <faab89c7-3804-13f0-4f95-0658213151c5@intel.com>
Date: Sun, 17 Oct 2021 15:53:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.0
From: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH 2/5] target/i386: Introduce FeatureWordInfo for Intel
 PT CPUID leaf 0xD
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210909144150.1728418-1-xiaoyao.li@intel.com>
 <20210909144150.1728418-3-xiaoyao.li@intel.com>
 <20211015160401.ixrglqwnx5i6s6ks@habkost.net>
Content-Language: en-US
In-Reply-To: <20211015160401.ixrglqwnx5i6s6ks@habkost.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=xiaoyao.li@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.999,
 HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5,
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/16/2021 12:04 AM, Eduardo Habkost wrote:
> Hi,
> 
> Apologies for the delay.  Comments below:
> 
> On Thu, Sep 09, 2021 at 10:41:47PM +0800, Xiaoyao Li wrote:
>> CPUID leaf 0x14 subleaf 0x0 and 0x1 enumerate the resource and
>> capability of Intel PT.
>>
>> Introduce FeatureWord FEAT_14_0_EBX, FEAT_14_1_EAX and FEAT_14_1_EBX,
>> and complete FEAT_14_0_ECX. Thus all the features of Intel PT can be
>> expanded when "-cpu host/max" and can be configured in named CPU model.
>>
>> Regarding FEAT_14_1_EAX and FEAT_14_1_EBX, don't define the name for
>> them since each bit of them doesn't represent a standalone sub-feature
>> of Intel PT. However, explicitly mark them as migratable. So the
>> meaningful bits of them can be autoenabled in x86_cpu_expand_features().
>>
>> It has special handling for FEAT_14_1_EAX[2:0], because the 3 bits as a
>> whole represents the number of PT ADDRn_CFG ranges. Thus it has special
>> handling in mark_unavailable_features() and x86_cpu_filter_features().
>>
>> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> ---
>>   target/i386/cpu.c | 87 +++++++++++++++++++++++++++++++++++++++++------
>>   target/i386/cpu.h | 37 +++++++++++++++++++-
>>   2 files changed, 112 insertions(+), 12 deletions(-)
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index a06473c9e84c..58e98210f219 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -567,7 +567,7 @@ static CPUCacheInfo legacy_l3_cache = {
>>   /* generated packets which contain IP payloads have LIP values */
>>   #define INTEL_PT_IP_LIP          (1 << 31)
>>   #define INTEL_PT_ADDR_RANGES_NUM 0x2 /* Number of configurable address ranges */
>> -#define INTEL_PT_ADDR_RANGES_NUM_MASK 0x3
>> +#define INTEL_PT_ADDR_RANGES_NUM_MASK 0x7
>>   #define INTEL_PT_MTC_BITMAP      (0x0249 << 16) /* Support ART(0,3,6,9) */
>>   #define INTEL_PT_CYCLE_BITMAP    0x1fff         /* Support 0,2^(0~11) */
>>   #define INTEL_PT_PSB_BITMAP      (0x003f << 16) /* Support 2K,4K,8K,16K,32K,64K */
>> @@ -1161,17 +1161,32 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>>           }
>>       },
>>   
>> +    [FEAT_14_0_EBX] = {
>> +        .type = CPUID_FEATURE_WORD,
>> +        .feat_names = {
>> +            [0] = "intel-pt-cr3-filter",
>> +            [1] = "intel-pt-PSB",
> 
> I suggest using lowercase for all feature names, as it is the
> usual convention for QOM property names.

Will do it.

>> +            [2] = "intel-pt-ip-filter",
>> +            [3] = "intel-pt-mtc",
>> +            [4] = "intel-pt-ptwrite",
>> +            [5] = "intel-pt-power-event",
>> +            [6] = "intel-pt-psb-pmi-preservation",
> 
> This has a side effect: live migration with those flags enabled
> will become possible.
> 
> All bits allow enumerate support for an optional feature to be
> enabled by the OS, so it means we can emulate a CPU with bit=0
> CPU on a bit=1 host.  So it will be safe as long as there's no
> additional state that needs to be live migrated when those
> features are used.  Do we have any additional state, or all MSRs
> currently being migrated are enough?

For Intel PT, QEMU already live migration support for it, but only with 
fixed PT feature set for all the CPU models + max/host. No ?

>> +        },
>> +        .cpuid = {
>> +            .eax = 0x14,
>> +            .needs_ecx = true, .ecx = 0,
>> +            .reg = R_EBX,
>> +        },
>> +    },
>> +
>>       [FEAT_14_0_ECX] = {
>>           .type = CPUID_FEATURE_WORD,
>>           .feat_names = {
>> -            NULL, NULL, NULL, NULL,
>> -            NULL, NULL, NULL, NULL,
>> -            NULL, NULL, NULL, NULL,
>> -            NULL, NULL, NULL, NULL,
>> -            NULL, NULL, NULL, NULL,
>> -            NULL, NULL, NULL, NULL,
>> -            NULL, NULL, NULL, NULL,
>> -            NULL, NULL, NULL, "intel-pt-lip",
>> +            [0] = "intel-pt-topa",
>> +            [1] = "intel-pt-multi-topa-entries",
>> +            [2] = "intel-pt-single-range",
>> +            [3] = "intel-pt-trace-transport-subsystem",
> 
> All bits above are also optional features to be enabled
> explicitly by the OS, so it also seems OK.
> 
>> +            [31] = "intel-pt-lip",
> 
> This one is trickier because its value must match the host, but
> it is already present in the existing code.  We already have an
> explicit check for host LIP == guest LIP, so it's OK.
> 
>>           },
>>           .cpuid = {
>>               .eax = 0x14,
>> @@ -1181,6 +1196,26 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>>           .tcg_features = TCG_14_0_ECX_FEATURES,
>>        },
>>   
>> +    [FEAT_14_1_EAX] = {
>> +        .type = CPUID_FEATURE_WORD,
>> +        .cpuid = {
>> +            .eax = 0x14,
>> +            .needs_ecx = true, .ecx = 1,
>> +            .reg = R_EAX,
>> +        },
>> +        .migratable_flags = ~0ull,
> 
> This one is trickier.  I see a few potential issues:
> 
> * Bits 15:3 are documented as reserved on my version of the Intel
>    SDM (June 2021).  If they are reserved, I don't think we should
>    make them migratable yet.  If they aren't, do you have a
>    pointer to the documentation?

you are right that they are reserved.

I was just too lazy to calculate the bitmask. Will fix it.

> * Bits 2:0 is a number, not a simple boolean flag.  You are
>    handling this as a special case in x86_cpu_filter_features()
>    below, so it should be OK.
> 
> * The flags are migratable but have no names.  The only existing
>    case of non-zero .migratable_flags required a special case at
>    x86_cpu_feature_name().  I'm pretty sure this might break the
>    getter of the "unavailable-features" property.  I think we need
>    to make x86_cpu_feature_name() safer, somehow, or (a quicker
>    solution) we can add names to all migratable bits here (even if
>    they are not intended to be set by end users).

I think for the bitmap field (bits 31:16), we can give them a name 
because each bit is independent. e.g.,

[16] = "intel-pt-mtc-period-encoding-0"
[17] = "intel-pt-mtc-period-encoding-1"
...
[31] = "intel-pt-mte-period-encoding-15"

the problem is bits 2:0, they are as a whole to represent one thing.
Maybe name it as

[0] = "intel-pt-addr-range-num-bit0"
[1] = "intel-pt-addr-range-num-bit1"
[2] = "intel-pt-addr-range-num-bit2"

Then, they will be displayed as feature flags when "-cpu ?", is it ok?

>> +    },
>> +
>> +    [FEAT_14_1_EBX] = {
>> +        .type = CPUID_FEATURE_WORD,
>> +        .cpuid = {
>> +            .eax = 0x14,
>> +            .needs_ecx = true, .ecx = 1,
>> +            .reg = R_EBX,
>> +        },
>> +        .migratable_flags = ~0ull,
> 
> Same observation above about flags with no names apply here.

The same as above, we can give each bit a name because they are also the 
bitmap for other fields encoding.

>> +    },
>> +
>>   };
>>   
>>   typedef struct FeatureMask {
>> @@ -1253,10 +1288,22 @@ static FeatureDep feature_dependencies[] = {
>>           .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_RDSEED },
>>           .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_RDSEED_EXITING },
>>       },
>> +    {
>> +        .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INTEL_PT },
>> +        .to = { FEAT_14_0_EBX,              ~0ull },
>> +    },
>>       {
>>           .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INTEL_PT },
>>           .to = { FEAT_14_0_ECX,              ~0ull },
>>       },
>> +    {
>> +        .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INTEL_PT },
>> +        .to = { FEAT_14_1_EAX,              ~0ull },
>> +    },
>> +    {
>> +        .from = { FEAT_7_0_EBX,             CPUID_7_0_EBX_INTEL_PT },
>> +        .to = { FEAT_14_1_EBX,              ~0ull },
>> +    },
>>       {
>>           .from = { FEAT_8000_0001_EDX,       CPUID_EXT2_RDTSCP },
>>           .to = { FEAT_VMX_SECONDARY_CTLS,    VMX_SECONDARY_EXEC_RDTSCP },
>> @@ -4260,7 +4307,14 @@ static void mark_unavailable_features(X86CPU *cpu, FeatureWord w, uint64_t mask,
>>           return;
>>       }
>>   
>> -    for (i = 0; i < 64; ++i) {
>> +    if ((w == FEAT_14_1_EAX) && (mask & INTEL_PT_ADDR_RANGES_NUM_MASK)) {
>> +        warn_report("%s: CPUID.14H_01H:EAX [bit 2:0]", verbose_prefix);
>> +        i = 3;
>> +    } else {
>> +        i = 0;
>> +    }
> 
> That's tricky and easy to break.  To be honest, I prefer having
> duplicate error messages showing bit 2,1,0 than having this hack.
> 
> If you want to make some range of CPUID bits special, I'd prefer
> to implement this as a FeatureWordInfo field that indicates that.

I tried to go this direction. But I didn't think up any good idea. I 
will try to think about it again.

> This way this function doesn't become a pile of special cases on
> top of each other.
> 
> In either case, I suggest addressing the duplicate error messages
> in a separate patch so this discussion doesn't block the rest.

OK. I'll split it into a separate one.

>> +
>> +    for (; i < 64; ++i) {
>>           if ((1ULL << i) & mask) {
>>               g_autofree char *feat_word_str = feature_word_description(f, i);
>>               warn_report("%s: %s%s%s [bit %d]",
>> @@ -6038,7 +6092,18 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>>           uint64_t host_feat =
>>               x86_cpu_get_supported_feature_word(w, false);
>>           uint64_t requested_features = env->features[w];
>> -        uint64_t unavailable_features = requested_features & ~host_feat;
>> +        uint64_t unavailable_features;
>> +        if (w == FEAT_14_1_EAX) {
> 
> I would love to find a way to make this more readable, but it's
> simple enough.
> 
> Maybe a `switch (w)` statement would be better, to make it easier
> to extend in the future, and discourage people from adding
> special cases that are more complex than (w == FEAT_...).
> 
> Maybe it would be good to create a
>    void x86_cpu_filter_feature_word(X86CPU *cpu, FeatureWord w)
> function to keep the code complexity under control.

good suggestion. I will implement it.

>> +            unavailable_features = (requested_features & ~host_feat) &
>> +                                   ~INTEL_PT_ADDR_RANGES_NUM_MASK;
>> +            if ((requested_features & INTEL_PT_ADDR_RANGES_NUM_MASK) >
>> +                (host_feat & INTEL_PT_ADDR_RANGES_NUM_MASK)) {
>> +                unavailable_features |= requested_features &
>> +                                        INTEL_PT_ADDR_RANGES_NUM_MASK;
>> +            }
>> +        } else {
>> +            unavailable_features = requested_features & ~host_feat;
>> +        }
>>           mark_unavailable_features(cpu, w, unavailable_features, prefix);
>>       }
>>   
> 
> I miss the cpu_x86_cpuid() changes to actual use the new feature
> words, here.  I think a cpu_x86_cpuid() change should be done in
> the same patch, or we risk having a QEMU commit where the CPU
> properties exist but do absolutely nothing.

It's intentional.

We cannot assign the new feature words to guest CPUID in cpu_x86_cpuid() 
until special handling for named_CPU_models+PT in next patch. Otherwise 
it generates different INTEL PT CPUID value comparing to old QEMU.

>> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>> index 6c50d3ab4f1d..f5478a169f9a 100644
>> --- a/target/i386/cpu.h
>> +++ b/target/i386/cpu.h
>> @@ -566,7 +566,10 @@ typedef enum FeatureWord {
>>       FEAT_VMX_EPT_VPID_CAPS,
>>       FEAT_VMX_BASIC,
>>       FEAT_VMX_VMFUNC,
>> +    FEAT_14_0_EBX,
>>       FEAT_14_0_ECX,
>> +    FEAT_14_1_EAX,
>> +    FEAT_14_1_EBX,
>>       FEATURE_WORDS,
>>   } FeatureWord;
>>   
>> @@ -835,8 +838,40 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
>>   /* AVX512 BFloat16 Instruction */
>>   #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
>>   
>> +/*
>> + * IA32_RTIT_CTL.CR3 filter can be set to 1 and
>> + * IA32_RTIT_CR3_MATCH can be accessed
>> + */
>> +#define CPUID_14_0_EBX_CR3_FILTER               (1U << 0)
>> +/* Support Configurable PSB and Cycle-Accurate Mode */
>> +#define CPUID_14_0_EBX_PSB                      (1U << 1)
>> +/*
>> + * Support IP Filtering, IP TraceStop, and preservation
>> + * of Intel PT MSRs across warm reset
>> + */
>> +#define CPUID_14_0_EBX_IP_FILTER                (1U << 2)
>> +/* Support MTC timing packet */
>> +#define CPUID_14_0_EBX_MTC                      (1U << 3)
>> +/* Support PTWRITE */
>> +#define CPUID_14_0_EBX_PTWRITE                  (1U << 4)
>> +/* Support Power Event Trace packet generation */
>> +#define CPUID_14_0_EBX_POWER_EVENT              (1U << 5)
>> +/* Support PSB and PMI Preservation */
>> +#define CPUID_14_0_EBX_PSB_PMI_PRESERVATION     (1U << 6)
>> +
>> +/* Tracing can be enabled with IA32_RTIT_CTL.ToPA = 1 */
>> +#define CPUID_14_0_ECX_TOPA                     (1U << 0)
>> +/*
>> + * ToPA tables can hold any number of output entries, up to the maximum allowed
>> + * by the MaskOrTableOffset field of IA32_RTIT_OUTPUT_MASK_PTRS
>> + */
>> +#define CPUID_14_0_ECX_MULTI_ENTRIES            (1U << 1)
>> +/* Support Single-Range Output scheme */
>> +#define CPUID_14_0_ECX_SINGLE_RANGE             (1U << 2)
>> +/* Support IA32_RTIT_CTL.FabricEn */
>> +#define CPUID_14_0_ECX_TRACE_TRANS_SUBSYSTEM    (1U << 3)
>>   /* Packets which contain IP payload have LIP values */
>> -#define CPUID_14_0_ECX_LIP              (1U << 31)
>> +#define CPUID_14_0_ECX_LIP                      (1U << 31)
>>   
>>   /* CLZERO instruction */
>>   #define CPUID_8000_0008_EBX_CLZERO      (1U << 0)
>> -- 
>> 2.27.0
>>
> 


