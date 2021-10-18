Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EC8430EF7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 06:38:49 +0200 (CEST)
Received: from localhost ([::1]:55524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcKQB-0005x2-VB
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 00:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mcJcE-0003HB-A5
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:47:10 -0400
Received: from mga05.intel.com ([192.55.52.43]:54969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mcJc9-0007of-02
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:47:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="314359795"
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="314359795"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 20:47:01 -0700
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="493414914"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.239.13.123])
 ([10.239.13.123])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 20:47:00 -0700
Message-ID: <ebd46603-d3dc-c7ba-1ab7-40d7881b83ed@intel.com>
Date: Mon, 18 Oct 2021 11:46:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 3/5] target/i386: Enable host pass through of Intel PT
Content-Language: en-US
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20210909144150.1728418-1-xiaoyao.li@intel.com>
 <20210909144150.1728418-4-xiaoyao.li@intel.com>
 <20211015202220.ghdn6gsdfuh56xq7@habkost.net>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20211015202220.ghdn6gsdfuh56xq7@habkost.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=xiaoyao.li@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.999,
 HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
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

On 10/16/2021 4:22 AM, Eduardo Habkost wrote:
> On Thu, Sep 09, 2021 at 10:41:48PM +0800, Xiaoyao Li wrote:
>> commit e37a5c7fa459 ("i386: Add Intel Processor Trace feature support")
>> added the support of Intel PT by making CPUID[14] of PT as fixed feature
>> set (from ICX) for any CPU model on any host.
>>
>> This truly breaks the PT exposing on Intel SPR platform because SPR has
>> less supported bitmap CPUID(0x14,1):EBX[15:0] than ICX.
>>
>> This patch enables passing through host's PT capabilities for the case
>> "-cpu host/max" while ensure named CPU model still has the fixed
>> PT feature set to not break the live migration.
>>
>> It introduces @has_specific_intel_pt_feature_set field for name CPU
>> model. If a named CPU model has this field as false, it will use fixed
>> PT feature set of ICX. Besides same to previous behavior, if fixed PT
>> feature set of ICX cannot be satisfied/supported by host, it disables PT
>> instead of adjusting the feature set based on host's capabilities.
>>
>> In the future, new named CPU model, e.g., Sapphire Rapids, can define
>> its own PT feature set by setting @has_specific_intel_pt_feature_set to
>> true and defines it's own FEAT_14_0_EBX, FEAT_14_0_ECX, FEAT_14_1_EAX
>> and FEAT_14_1_EBX.
>>
>> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> ---
>>   target/i386/cpu.c | 106 ++++++++++++++++++++--------------------------
>>   target/i386/cpu.h |   1 +
>>   2 files changed, 47 insertions(+), 60 deletions(-)
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 58e98210f219..00c4ad23110d 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -543,34 +543,24 @@ static CPUCacheInfo legacy_l3_cache = {
>>   #define L2_ITLB_4K_ASSOC       4
>>   #define L2_ITLB_4K_ENTRIES   512
>>   
>> -/* CPUID Leaf 0x14 constants: */
>> -#define INTEL_PT_MAX_SUBLEAF     0x1
>> -/*
>> - * bit[00]: IA32_RTIT_CTL.CR3 filter can be set to 1 and IA32_RTIT_CR3_MATCH
>> - *          MSR can be accessed;
>> - * bit[01]: Support Configurable PSB and Cycle-Accurate Mode;
>> - * bit[02]: Support IP Filtering, TraceStop filtering, and preservation
>> - *          of Intel PT MSRs across warm reset;
>> - * bit[03]: Support MTC timing packet and suppression of COFI-based packets;
>> - */
>> -#define INTEL_PT_MINIMAL_EBX     0xf
>> -/*
>> - * bit[00]: Tracing can be enabled with IA32_RTIT_CTL.ToPA = 1 and
>> - *          IA32_RTIT_OUTPUT_BASE and IA32_RTIT_OUTPUT_MASK_PTRS MSRs can be
>> - *          accessed;
>> - * bit[01]: ToPA tables can hold any number of output entries, up to the
>> - *          maximum allowed by the MaskOrTableOffset field of
>> - *          IA32_RTIT_OUTPUT_MASK_PTRS;
>> - * bit[02]: Support Single-Range Output scheme;
>> - */
>> -#define INTEL_PT_MINIMAL_ECX     0x7
>> -/* generated packets which contain IP payloads have LIP values */
>> -#define INTEL_PT_IP_LIP          (1 << 31)
>> -#define INTEL_PT_ADDR_RANGES_NUM 0x2 /* Number of configurable address ranges */
>> -#define INTEL_PT_ADDR_RANGES_NUM_MASK 0x7
>> -#define INTEL_PT_MTC_BITMAP      (0x0249 << 16) /* Support ART(0,3,6,9) */
>> -#define INTEL_PT_CYCLE_BITMAP    0x1fff         /* Support 0,2^(0~11) */
>> -#define INTEL_PT_PSB_BITMAP      (0x003f << 16) /* Support 2K,4K,8K,16K,32K,64K */
>> +#define INTEL_PT_MAX_SUBLEAF                0x1
>> +#define INTEL_PT_DEFAULT_ADDR_RANGES_NUM    0x2
>> +#define INTEL_PT_ADDR_RANGES_NUM_MASK       0x7
>> +/* Support ART(0,3,6,9) */
>> +#define INTEL_PT_DEFAULT_MTC_BITMAP         0x0249
>> +/* Support 0,2^(0~11) */
>> +#define INTEL_PT_DEFAULT_CYCLE_BITMAP       0x1fff
>> +/* Support 2K,4K,8K,16K,32K,64K */
>> +#define INTEL_PT_DEFAULT_PSB_BITMAP         0x003f
>> +
>> +#define INTEL_PT_DEFAULT_0_EBX  (CPUID_14_0_EBX_CR3_FILTER | \
>> +            CPUID_14_0_EBX_PSB | CPUID_14_0_EBX_IP_FILTER | CPUID_14_0_EBX_MTC)
>> +#define INTEL_PT_DEFAULT_0_ECX  (CPUID_14_0_ECX_TOPA | \
>> +            CPUID_14_0_ECX_MULTI_ENTRIES | CPUID_14_0_ECX_SINGLE_RANGE)
>> +#define INTEL_PT_DEFAULT_1_EAX  (INTEL_PT_DEFAULT_MTC_BITMAP << 16 | \
>> +                                 INTEL_PT_DEFAULT_ADDR_RANGES_NUM)
>> +#define INTEL_PT_DEFAULT_1_EBX  (INTEL_PT_DEFAULT_PSB_BITMAP << 16 | \
>> +                                 INTEL_PT_DEFAULT_CYCLE_BITMAP)
> 
> I like these new macros because they make the code at
> x86_cpu_filter_features() clearer.  Can we do this in a separate
> patch, to be applied before "Introduce FeatureWordInfo for Intel
> PT CPUID leaf 0xD"?
> 

Before?

These macros needs the individual CPUID_14_0_* definitions defined in 
"Introduce FeatureWordInfo for Intel PT CPUID leaf 0xD".

1) I can split the definitions of the CPUID bit from that patch and 
merge with the macros into a new patch.

2) create a new patch to introduce those macros after "Introduce 
FeatureWordInfo for Intel PT CPUID leaf 0xD"

which do you prefer?

