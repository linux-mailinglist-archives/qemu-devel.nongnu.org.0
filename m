Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDDA6C4BE
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 03:56:58 +0200 (CEST)
Received: from localhost ([::1]:33676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnvfF-0008VO-9j
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 21:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38758)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tao3.xu@intel.com>) id 1hnvf1-00083z-Q8
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:56:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1hnvf0-0001uJ-Cb
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:56:43 -0400
Received: from mga02.intel.com ([134.134.136.20]:60548)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1hnvf0-0001lg-3H
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:56:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 18:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="343219531"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.101])
 ([10.239.196.101])
 by orsmga005.jf.intel.com with ESMTP; 17 Jul 2019 18:56:33 -0700
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20190717045731.19303-1-tao3.xu@intel.com>
 <54351c2d-0b8a-6877-6fda-dedec8372d00@intel.com>
 <20190717183819.GW26800@habkost.net>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <c12d950d-87a8-2b7f-266e-e4031f779015@intel.com>
Date: Thu, 18 Jul 2019 09:56:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717183819.GW26800@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
Subject: Re: [Qemu-devel] [PATCH v2] target/i386: Introduce Denverton CPU
 model
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Xiaoyao Li <xiaoyao.li@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/18/2019 2:38 AM, Eduardo Habkost wrote:
> On Wed, Jul 17, 2019 at 01:39:01PM +0800, Tao Xu wrote:
>> Hi Eduardo,
>>
>> Could I ask a question about introducing a old CPU model? Maybe not so old
>> because it was launched in 2017. It is the former generation (Atom Server)
>> of Snowridge and if this cpu model be added, qemu may can migrate guest
>> between Denverton CPU and Snowridge CPU.
>>
>> I am wondering which way is more appropriate, because maybe there are a few
>> Denverton machines using old microcodes:
>>
>> 1. Just like this patch, introduce one version cpu cpu model.
>>
>> 2. Introduce multi versions of cpu model, cover old microcodes, may be 3
>> versions.
> 
> What exactly are the differences between the old and new
> microcodes?  Is it always possible to install a new microcode on
> machines that are not up to date?
> 
Denverton Machines with old microcodes didn't have 
CPUID_7_0_EDX_SPEC_CTRL | CPUID_7_0_EDX_SPEC_CTRL_SSBD on host. But user 
can update their machine follow the links below:

SSBD:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00115.html
https://access.redhat.com/articles/3436091

SPEC_CTRL:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00088.html
https://access.redhat.com/articles/3436091


> Both options look good to me.  I think it's OK to just declare
> old microcode versions as not supported by QEMU, but I won't
> complain if you decide to add multiple versions.
> 
Thank you Eduardo, I prefer option 1, just this patch. I think because 
Denverton CPU model will not have compatibility issue and the machines 
with old microcode are very few.
>>
>> On 7/17/2019 12:57 PM, Tao Xu wrote:
>>> Denverton is the Atom Processor of Intel Harrisonville platform.
>>>
>>> For more information:
>>> https://ark.intel.com/content/www/us/en/ark/products/\
>>> codename/63508/denverton.html
>>>
>>> Signed-off-by: Tao Xu <tao3.xu@intel.com>
>>> ---
>>>
>>> Changes in v2:
>>>
>>>       - Renamed as Denverton instead of Denverton-Server, because there
>>>         is only server for Denverton
>>>       - Remove vmx from cpu model
>>> ---
>>>    target/i386/cpu.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 45 insertions(+)
>>>
>>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>>> index 805ce95247..38000dd975 100644
>>> --- a/target/i386/cpu.c
>>> +++ b/target/i386/cpu.c
>>> @@ -2471,6 +2471,51 @@ static X86CPUDefinition builtin_x86_defs[] = {
>>>            .xlevel = 0x80000008,
>>>            .model_id = "Intel Xeon Processor (Icelake)",
>>>        },
>>> +    {
>>> +        .name = "Denverton",
>>> +        .level = 21,
>>> +        .vendor = CPUID_VENDOR_INTEL,
>>> +        .family = 6,
>>> +        .model = 95,
>>> +        .stepping = 1,
>>> +        .features[FEAT_1_EDX] =
>>> +            CPUID_FP87 | CPUID_VME | CPUID_DE | CPUID_PSE | CPUID_TSC |
>>> +            CPUID_MSR | CPUID_PAE | CPUID_MCE | CPUID_CX8 | CPUID_APIC |
>>> +            CPUID_SEP | CPUID_MTRR | CPUID_PGE | CPUID_MCA | CPUID_CMOV |
>>> +            CPUID_PAT | CPUID_PSE36 | CPUID_CLFLUSH | CPUID_MMX | CPUID_FXSR |
>>> +            CPUID_SSE | CPUID_SSE2,
>>> +        .features[FEAT_1_ECX] =
>>> +            CPUID_EXT_SSE3 | CPUID_EXT_PCLMULQDQ | CPUID_EXT_MONITOR |
>>> +            CPUID_EXT_SSSE3 | CPUID_EXT_CX16 | CPUID_EXT_SSE41 |
>>> +            CPUID_EXT_SSE42 | CPUID_EXT_X2APIC | CPUID_EXT_MOVBE |
>>> +            CPUID_EXT_POPCNT | CPUID_EXT_TSC_DEADLINE_TIMER |
>>> +            CPUID_EXT_AES | CPUID_EXT_XSAVE | CPUID_EXT_RDRAND,
>>> +        .features[FEAT_8000_0001_EDX] =
>>> +            CPUID_EXT2_SYSCALL | CPUID_EXT2_NX | CPUID_EXT2_PDPE1GB |
>>> +            CPUID_EXT2_RDTSCP | CPUID_EXT2_LM,
>>> +        .features[FEAT_8000_0001_ECX] =
>>> +            CPUID_EXT3_LAHF_LM | CPUID_EXT3_3DNOWPREFETCH,
>>> +        .features[FEAT_7_0_EBX] =
>>> +            CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_ERMS |
>>> +            CPUID_7_0_EBX_MPX | CPUID_7_0_EBX_RDSEED | CPUID_7_0_EBX_SMAP |
>>> +            CPUID_7_0_EBX_CLFLUSHOPT | CPUID_7_0_EBX_SHA_NI,
>>> +        .features[FEAT_7_0_EDX] =
>>> +            CPUID_7_0_EDX_SPEC_CTRL | CPUID_7_0_EDX_ARCH_CAPABILITIES |
>>> +            CPUID_7_0_EDX_SPEC_CTRL_SSBD,
>>> +        /*
>>> +         * Missing: XSAVES (not supported by some Linux versions,
>>> +         * including v4.1 to v4.12).
>>> +         * KVM doesn't yet expose any XSAVES state save component,
>>> +         * and the only one defined in Skylake (processor tracing)
>>> +         * probably will block migration anyway.
>>> +         */
>>> +        .features[FEAT_XSAVE] =
>>> +            CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC | CPUID_XSAVE_XGETBV1,
>>> +        .features[FEAT_6_EAX] =
>>> +            CPUID_6_EAX_ARAT,
>>> +        .xlevel = 0x80000008,
>>> +        .model_id = "Intel Atom Processor (Denverton)",
>>> +    },
>>>        {
>>>            .name = "SnowRidge-Server",
>>>            .level = 27,
>>> --
>>> 2.20.1
>>>
>>>
>>
> 


