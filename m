Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62785589582
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 02:57:18 +0200 (CEST)
Received: from localhost ([::1]:45562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJPAr-000402-0Q
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 20:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oJP9W-0002bI-0w
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 20:55:54 -0400
Received: from mga04.intel.com ([192.55.52.120]:45599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oJP9S-0008FO-8B
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 20:55:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659574550; x=1691110550;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2IIzPWOk3DqtrWxR6dUAjM0LWxdelKWs6P5Il64ydy0=;
 b=Uulf9zIZ0eRWMo1NJnTI8Rga2hrqFBbgzVDxUwzetFVMpsVdUDjdWCYl
 KdaO0TB7z6nWJX7h5oAq9MxXodTFHe1JNBtKegCc5bBgWAk4Foodukh+n
 7goBPch6RzfpaF0aYqUk4zBQ7zn1ElyS5dnvBkqkx/HgpYsfIgoXWUNQZ
 cpE0Xy9d9bC7+azSWk65ILyVkE7DiWMvTIrOyN3uH8XYEUgClEp73ovH+
 6GIqbpxrhz2LEw/RTqSWbMfV6EwbuphWtF1GEHxDAtgOqMbENhK5iP9CD
 i8p0MbcTFnrX1dKHMS7peSNrHs7531ooG+oVIamYvHy7emmSOT+5xfJXX g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="288567545"
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; d="scan'208";a="288567545"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 17:55:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; d="scan'208";a="578864940"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.170.178])
 ([10.249.170.178])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 17:55:36 -0700
Message-ID: <7ed7eb7b-2b9d-76cb-5d45-63f0e9dbde1c@intel.com>
Date: Thu, 4 Aug 2022 08:55:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v1 08/40] i386/tdx: Adjust the supported CPUID based on
 TDX restrictions
Content-Language: en-US
To: Chenyi Qiang <chenyi.qiang@intel.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Isaku Yamahata <isaku.yamahata@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
 <20220802074750.2581308-9-xiaoyao.li@intel.com>
 <200d5aa2-f1e3-2b8b-7963-e605f9a5731e@intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <200d5aa2-f1e3-2b8b-7963-e605f9a5731e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=xiaoyao.li@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/2022 3:33 PM, Chenyi Qiang wrote:
> 
> 
> On 8/2/2022 3:47 PM, Xiaoyao Li wrote:
>> According to Chapter "CPUID Virtualization" in TDX module spec, CPUID
>> bits of TD can be classified into 6 types:
>>
>> ------------------------------------------------------------------------
>> 1 | As configured | configurable by VMM, independent of native value;
>> ------------------------------------------------------------------------
>> 2 | As configured | configurable by VMM if the bit is supported natively
>>      (if native)   | Otherwise it equals as native(0).
>> ------------------------------------------------------------------------
>> 3 | Fixed         | fixed to 0/1
>> ------------------------------------------------------------------------
>> 4 | Native        | reflect the native value
>> ------------------------------------------------------------------------
>> 5 | Calculated    | calculated by TDX module.
>> ------------------------------------------------------------------------
>> 6 | Inducing #VE  | get #VE exception
>> ------------------------------------------------------------------------
>>
>> Note:
>> 1. All the configurable XFAM related features and TD attributes related
>>     features fall into type #2. And fixed0/1 bits of XFAM and TD
>>     attributes fall into type #3.
>>
>> 2. For CPUID leaves not listed in "CPUID virtualization Overview" table
>>     in TDX module spec. When they are queried, TDX module injects #VE to
>>     TDs. For this case, TDs can request CPUID emulation from VMM via
>>     TDVMCALL and the values are fully controlled by VMM.
>>
>> Due to TDX module has its own virtualization policy on CPUID bits, it 
>> leads
>> to what reported via KVM_GET_SUPPORTED_CPUID diverges from the supported
>> CPUID bits for TDS. In order to keep a consistent CPUID configuration
>> between VMM and TDs. Adjust supported CPUID for TDs based on TDX
>> restrictions.
>>
>> Currently only focus on the CPUID leaves recognized by QEMU's
>> feature_word_info[] that are indexed by a FeatureWord.
>>
>> Introduce a TDX CPUID lookup table, which maintains 1 entry for each
>> FeatureWord. Each entry has below fields:
>>
>>   - tdx_fixed0/1: The bits that are fixed as 0/1;
>>
>>   - vmm_fixup:   The bits that are configurable from the view of TDX 
>> module.
>>                  But they requires emulation of VMM when they are 
>> configured
>>             as enabled. For those, they are not supported if VMM doesn't
>>         report them as supported. So they need be fixed up by
>>         checking if VMM supports them.
>>
>>   - inducing_ve: TD gets #VE when querying this CPUID leaf. The result is
>>                  totally configurable by VMM.
>>
>>   - supported_on_ve: It's valid only when @inducing_ve is true. It 
>> represents
>>             the maximum feature set supported that be emulated
>>             for TDs.
>>
>> By applying TDX CPUID lookup table and TDX capabilities reported from
>> TDX module, the supported CPUID for TDs can be obtained from following
>> steps:
>>
>> - get the base of VMM supported feature set;
>>
>> - if the leaf is not a FeatureWord just return VMM's value without
>>    modification;
>>
>> - if the leaf is an inducing_ve type, applying supported_on_ve mask and
>>    return;
>>
>> - include all native bits, it covers type #2, #4, and parts of type #1.
>>    (it also includes some unsupported bits. The following step will
>>     correct it.)
>>
>> - apply fixed0/1 to it (it covers #3, and rectifies the previous step);
>>
>> - add configurable bits (it covers the other part of type #1);
>>
>> - fix the ones in vmm_fixup;
>>
>> - filter the one has valid .supported field;
> 
> What does .supported field filter mean here?
> 
>>
>> (Calculated type is ignored since it's determined at runtime).
>>
>> Co-developed-by: Chenyi Qiang <chenyi.qiang@intel.com>
>> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
>> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> ---
>>   target/i386/cpu.h     |  16 +++
>>   target/i386/kvm/kvm.c |   4 +
>>   target/i386/kvm/tdx.c | 255 ++++++++++++++++++++++++++++++++++++++++++
>>   target/i386/kvm/tdx.h |   2 +
>>   4 files changed, 277 insertions(+)
>>
>> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>> index 82004b65b944..cc9da9fc4318 100644
>> --- a/target/i386/cpu.h
>> +++ b/target/i386/cpu.h
>> @@ -771,6 +771,8 @@ uint64_t 
>> x86_cpu_get_supported_feature_word(FeatureWord w,
>>   /* Support RDFSBASE/RDGSBASE/WRFSBASE/WRGSBASE */
>>   #define CPUID_7_0_EBX_FSGSBASE          (1U << 0)
>> +/* Support for TSC adjustment MSR 0x3B */
>> +#define CPUID_7_0_EBX_TSC_ADJUST        (1U << 1)
>>   /* Support SGX */
>>   #define CPUID_7_0_EBX_SGX               (1U << 2)
>>   /* 1st Group of Advanced Bit Manipulation Extensions */
>> @@ -789,8 +791,12 @@ uint64_t 
>> x86_cpu_get_supported_feature_word(FeatureWord w,
>>   #define CPUID_7_0_EBX_INVPCID           (1U << 10)
>>   /* Restricted Transactional Memory */
>>   #define CPUID_7_0_EBX_RTM               (1U << 11)
>> +/* Cache QoS Monitoring */
>> +#define CPUID_7_0_EBX_PQM               (1U << 12)
>>   /* Memory Protection Extension */
>>   #define CPUID_7_0_EBX_MPX               (1U << 14)
>> +/* Resource Director Technology Allocation */
>> +#define CPUID_7_0_EBX_RDT_A             (1U << 15)
>>   /* AVX-512 Foundation */
>>   #define CPUID_7_0_EBX_AVX512F           (1U << 16)
>>   /* AVX-512 Doubleword & Quadword Instruction */
>> @@ -846,10 +852,16 @@ uint64_t 
>> x86_cpu_get_supported_feature_word(FeatureWord w,
>>   #define CPUID_7_0_ECX_AVX512VNNI        (1U << 11)
>>   /* Support for VPOPCNT[B,W] and VPSHUFBITQMB */
>>   #define CPUID_7_0_ECX_AVX512BITALG      (1U << 12)
>> +/* Intel Total Memory Encryption */
>> +#define CPUID_7_0_ECX_TME               (1U << 13)
>>   /* POPCNT for vectors of DW/QW */
>>   #define CPUID_7_0_ECX_AVX512_VPOPCNTDQ  (1U << 14)
>> +/* Placeholder for bit 15 */
>> +#define CPUID_7_0_ECX_FZM               (1U << 15)
>>   /* 5-level Page Tables */
>>   #define CPUID_7_0_ECX_LA57              (1U << 16)
>> +/* MAWAU for MPX */
>> +#define CPUID_7_0_ECX_MAWAU             (31U << 17)
>>   /* Read Processor ID */
>>   #define CPUID_7_0_ECX_RDPID             (1U << 22)
>>   /* Bus Lock Debug Exception */
>> @@ -860,6 +872,8 @@ uint64_t 
>> x86_cpu_get_supported_feature_word(FeatureWord w,
>>   #define CPUID_7_0_ECX_MOVDIRI           (1U << 27)
>>   /* Move 64 Bytes as Direct Store Instruction */
>>   #define CPUID_7_0_ECX_MOVDIR64B         (1U << 28)
>> +/* ENQCMD and ENQCMDS instructions */
>> +#define CPUID_7_0_ECX_ENQCMD            (1U << 29)
>>   /* Support SGX Launch Control */
>>   #define CPUID_7_0_ECX_SGX_LC            (1U << 30)
>>   /* Protection Keys for Supervisor-mode Pages */
>> @@ -877,6 +891,8 @@ uint64_t 
>> x86_cpu_get_supported_feature_word(FeatureWord w,
>>   #define CPUID_7_0_EDX_SERIALIZE         (1U << 14)
>>   /* TSX Suspend Load Address Tracking instruction */
>>   #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
>> +/* PCONFIG instruction */
>> +#define CPUID_7_0_EDX_PCONFIG           (1U << 18)
>>   /* Architectural LBRs */
>>   #define CPUID_7_0_EDX_ARCH_LBR          (1U << 19)
>>   /* AVX512_FP16 instruction */
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index 9e30fa9f4eb5..9930902ae890 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -492,6 +492,10 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState 
>> *s, uint32_t function,
>>           ret |= 1U << KVM_HINTS_REALTIME;
>>       }
>> +    if (is_tdx_vm()) {
>> +        tdx_get_supported_cpuid(function, index, reg, &ret);
>> +    }
>> +
>>       return ret;
>>   }
>> diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
>> index fdd6bec58758..e3e9a424512e 100644
>> --- a/target/i386/kvm/tdx.c
>> +++ b/target/i386/kvm/tdx.c
>> @@ -14,11 +14,134 @@
>>   #include "qemu/osdep.h"
>>   #include "qapi/error.h"
>>   #include "qom/object_interfaces.h"
>> +#include "standard-headers/asm-x86/kvm_para.h"
>>   #include "sysemu/kvm.h"
>>   #include "hw/i386/x86.h"
>>   #include "kvm_i386.h"
>>   #include "tdx.h"
>> +#include "../cpu-internal.h"
>> +
>> +#define TDX_SUPPORTED_KVM_FEATURES  ((1U << KVM_FEATURE_NOP_IO_DELAY) 
>> | \
>> +                                     (1U << KVM_FEATURE_PV_UNHALT) | \
>> +                                     (1U << KVM_FEATURE_PV_TLB_FLUSH) 
>> | \
>> +                                     (1U << KVM_FEATURE_PV_SEND_IPI) | \
>> +                                     (1U << KVM_FEATURE_POLL_CONTROL) 
>> | \
>> +                                     (1U << 
>> KVM_FEATURE_PV_SCHED_YIELD) | \
>> +                                     (1U << 
>> KVM_FEATURE_MSI_EXT_DEST_ID))
>> +
>> +typedef struct KvmTdxCpuidLookup {
>> +    uint32_t tdx_fixed0;
>> +    uint32_t tdx_fixed1;
>> +
>> +    /*
>> +     * The CPUID bits that are configurable from the view of TDX module
>> +     * but require VMM emulation if configured to enabled by VMM.
>> +     *
>> +     * For those bits, they cannot be enabled actually if VMM 
>> (KVM/QEMU) cannot
>> +     * virtualize them.
>> +     */
>> +    uint32_t vmm_fixup;
>> +
>> +    bool inducing_ve;
>> +    /*
>> +     * The maximum supported feature set for given inducing-#VE leaf.
>> +     * It's valid only when .inducing_ve is true.
>> +     */
>> +    uint32_t supported_on_ve;
>> +} KvmTdxCpuidLookup;
>> +
>> + /*
>> +  * QEMU maintained TDX CPUID lookup tables, which reflects how 
>> CPUIDs are
>> +  * virtualized for guest TDs based on "CPUID virtualization" of TDX 
>> spec.
>> +  *
>> +  * Note:
>> +  *
>> +  * This table will be updated runtime by tdx_caps reported by platform.
>> +  *
>> +  */
>> +static KvmTdxCpuidLookup tdx_cpuid_lookup[FEATURE_WORDS] = {
>> +    [FEAT_1_EDX] = {
>> +        .tdx_fixed0 =
>> +            BIT(10) | BIT(20) | CPUID_IA64,
>> +        .tdx_fixed1 =
>> +            CPUID_MSR | CPUID_PAE | CPUID_MCE | CPUID_APIC |
>> +            CPUID_MTRR | CPUID_MCA | CPUID_CLFLUSH | CPUID_DTS,
>> +        .vmm_fixup =
>> +            CPUID_ACPI | CPUID_PBE,
>> +    },
>> +    [FEAT_1_ECX] = {
>> +        .tdx_fixed0 =
>> +            CPUID_EXT_MONITOR | CPUID_EXT_VMX | CPUID_EXT_SMX |
>> +            BIT(16),
>> +        .tdx_fixed1 =
>> +            CPUID_EXT_CX16 | CPUID_EXT_PDCM | CPUID_EXT_X2APIC |
>> +            CPUID_EXT_AES | CPUID_EXT_XSAVE | CPUID_EXT_RDRAND |
>> +            CPUID_EXT_HYPERVISOR,
>> +        .vmm_fixup =
>> +            CPUID_EXT_EST | CPUID_EXT_TM2 | CPUID_EXT_XTPR | 
>> CPUID_EXT_DCA,
>> +    },
>> +    [FEAT_8000_0001_EDX] = {
> 
> ...
> 
>> +        .tdx_fixed1 =
>> +            CPUID_EXT2_NX | CPUID_EXT2_PDPE1GB | CPUID_EXT2_RDTSCP |
>> +            CPUID_EXT2_LM,
>> +    },
>> +    [FEAT_7_0_EBX] = {
>> +        .tdx_fixed0 =
>> +            CPUID_7_0_EBX_TSC_ADJUST | CPUID_7_0_EBX_SGX | 
>> CPUID_7_0_EBX_MPX,
>> +        .tdx_fixed1 =
>> +            CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_RTM |
>> +            CPUID_7_0_EBX_RDSEED | CPUID_7_0_EBX_SMAP |
>> +            CPUID_7_0_EBX_CLFLUSHOPT | CPUID_7_0_EBX_CLWB |
>> +            CPUID_7_0_EBX_SHA_NI,
>> +        .vmm_fixup =
>> +            CPUID_7_0_EBX_PQM | CPUID_7_0_EBX_RDT_A,
>> +    },
>> +    [FEAT_7_0_ECX] = {
>> +        .tdx_fixed0 =
>> +            CPUID_7_0_ECX_FZM | CPUID_7_0_ECX_MAWAU |
>> +            CPUID_7_0_ECX_ENQCMD | CPUID_7_0_ECX_SGX_LC,
>> +        .tdx_fixed1 =
>> +            CPUID_7_0_ECX_MOVDIR64B | CPUID_7_0_ECX_BUS_LOCK_DETECT,
>> +        .vmm_fixup =
>> +            CPUID_7_0_ECX_TME,
>> +    },
>> +    [FEAT_7_0_EDX] = {
>> +        .tdx_fixed1 =
>> +            CPUID_7_0_EDX_SPEC_CTRL | CPUID_7_0_EDX_ARCH_CAPABILITIES |
>> +            CPUID_7_0_EDX_CORE_CAPABILITY | 
>> CPUID_7_0_EDX_SPEC_CTRL_SSBD,
>> +        .vmm_fixup =
>> +            CPUID_7_0_EDX_PCONFIG,
>> +    },
>> +    [FEAT_8000_0001_EDX] = {
>> +        .tdx_fixed1 =
>> +            CPUID_EXT2_NX | CPUID_EXT2_PDPE1GB |
>> +            CPUID_EXT2_RDTSCP | CPUID_EXT2_LM,
>> +    },
> 
> duplicated FEAT_8000_0001_EDX item.
> 

fixed.

Thanks,
-Xiaoyao

