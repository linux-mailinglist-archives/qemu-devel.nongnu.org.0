Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453B369772B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 08:09:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSBu0-0006M2-SO; Wed, 15 Feb 2023 02:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSBtx-0006Lp-Ko
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:08:25 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1pSBtu-0007An-JA
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:08:25 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PGpxz10xbzRs4f;
 Wed, 15 Feb 2023 15:05:43 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Wed, 15 Feb 2023 15:08:15 +0800
Message-ID: <bc0b434d-b8dc-0777-6578-05d3278187c3@huawei.com>
Date: Wed, 15 Feb 2023 15:08:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND 05/18] i386/cpu: Consolidate the use of topo_info
 in cpu_x86_cpuid()
To: Zhao Liu <zhao1.liu@linux.intel.com>
CC: Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, "Michael S . Tsirkin" <mst@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, <qemu-devel@nongnu.org>, Zhenyu Wang
 <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>, Zhuocheng Ding
 <zhuocheng.ding@intel.com>, Robert Hoo <robert.hu@linux.intel.com>, Xiaoyao
 Li <xiaoyao.li@intel.com>, Like Xu <like.xu.linux@gmail.com>, Zhao Liu
 <zhao1.liu@intel.com>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-6-zhao1.liu@linux.intel.com>
 <2110e5ec-68b0-185d-70dc-c2ea478a5b2c@huawei.com>
 <Y+yFdu4oW4bMLYVg@liuzhao-OptiPlex-7080>
In-Reply-To: <Y+yFdu4oW4bMLYVg@liuzhao-OptiPlex-7080>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

在 2023/2/15 15:10, Zhao Liu 写道:
> On Wed, Feb 15, 2023 at 11:28:25AM +0800, wangyanan (Y) wrote:
>> Date: Wed, 15 Feb 2023 11:28:25 +0800
>> From: "wangyanan (Y)" <wangyanan55@huawei.com>
>> Subject: Re: [PATCH RESEND 05/18] i386/cpu: Consolidate the use of
>>   topo_info in cpu_x86_cpuid()
>>
>> 在 2023/2/13 17:36, Zhao Liu 写道:
>>> From: Zhao Liu <zhao1.liu@intel.com>
>>>
>>> In cpu_x86_cpuid(), there are many variables in representing the cpu
>>> topology, e.g., topo_info, cs->nr_cores/cs->nr_threads.
>>>
>>> Since the names of cs->nr_cores/cs->nr_threads does not accurately
>>> represent its meaning, the use of cs->nr_cores/cs->nr_threads is prone
>>> to confusion and mistakes.
>>>
>>> And the structure X86CPUTopoInfo names its memebers clearly, thus the
>>> variable "topo_info" should be preferred.
>>>
>>> Suggested-by: Robert Hoo <robert.hu@linux.intel.com>
>>> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
>>> ---
>>>    target/i386/cpu.c | 30 ++++++++++++++++++------------
>>>    1 file changed, 18 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>>> index 7833505092d8..4cda84eb96f1 100644
>>> --- a/target/i386/cpu.c
>>> +++ b/target/i386/cpu.c
>>> @@ -5215,11 +5215,15 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>>>        uint32_t limit;
>>>        uint32_t signature[3];
>>>        X86CPUTopoInfo topo_info;
>>> +    uint32_t cpus_per_pkg;
>>>        topo_info.dies_per_pkg = env->nr_dies;
>>>        topo_info.cores_per_die = cs->nr_cores / env->nr_dies;
>>>        topo_info.threads_per_core = cs->nr_threads;
>>> +    cpus_per_pkg = topo_info.dies_per_pkg * topo_info.cores_per_die *
>>> +                   topo_info.threads_per_core;
>>> +
>>>        /* Calculate & apply limits for different index ranges */
>>>        if (index >= 0xC0000000) {
>>>            limit = env->cpuid_xlevel2;
>>> @@ -5255,8 +5259,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>>>                *ecx |= CPUID_EXT_OSXSAVE;
>>>            }
>>>            *edx = env->features[FEAT_1_EDX];
>>> -        if (cs->nr_cores * cs->nr_threads > 1) {
>>> -            *ebx |= (cs->nr_cores * cs->nr_threads) << 16;
>>> +        if (cpus_per_pkg > 1) {
>>> +            *ebx |= cpus_per_pkg << 16;
>>>                *edx |= CPUID_HT;
>>>            }
>>>            if (!cpu->enable_pmu) {
>>> @@ -5293,10 +5297,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>>>                 */
>>>                if (*eax & 31) {
>>>                    int host_vcpus_per_cache = 1 + ((*eax & 0x3FFC000) >> 14);
>>> -                int vcpus_per_socket = cs->nr_cores * cs->nr_threads;
>>> -                if (cs->nr_cores > 1) {
>>> +                int vcpus_per_socket = cpus_per_pkg;
>> Would it make sense to directly use cpus_per_pkg here
>>> +                int cores_per_socket = topo_info.cores_per_die *
>>> +                                       topo_info.dies_per_pkg;
>> There are other places in cpu_x86_cpuid where cs->nr_cores is used
>> separately, why not make a global "cores_per_pkg" like cpus_per_pkg
>> and also tweak the other places?
> Yeah, good idea.
>
>>> +                if (cores_per_socket > 1) {
>>>                        *eax &= ~0xFC000000;
>>> -                    *eax |= (pow2ceil(cs->nr_cores) - 1) << 26;
>>> +                    *eax |= (pow2ceil(cores_per_socket) - 1) << 26;
>>>                    }
>>>                    if (host_vcpus_per_cache > vcpus_per_socket) {
>>>                        *eax &= ~0x3FFC000;
>>> @@ -5436,12 +5442,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>>>            switch (count) {
>>>            case 0:
>>>                *eax = apicid_core_offset(&topo_info);
>>> -            *ebx = cs->nr_threads;
>>> +            *ebx = topo_info.threads_per_core;
>> There are many other places in cpu_x86_cpuid where cs->nr_threads
>> is used separately, such as encode_cache_cpuid4(***), should we
>> replace them all?
> In a previous patch [1], I replaced the use of cs->nr_threads/nr_cores in
> the call of encode_cache_cpuid4().
>
> The cleanest way is to pass topo_info to encode_cache_cpuid4(), but this
> involves the modification of the interface format and the use of the
> cache topo level, so I included it in a follow-up patch [2].
Ok, I see. I have not reached there.😉
>
> [1]: [PATCH RESEND 04/18] i386/cpu: Fix number of addressable IDs in
>       CPUID.04,
>       https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03188.html
> [2]: [PATCH RESEND 15/18] i386: Use CPUCacheInfo.share_level to encode
>       CPUID[4].EAX[bits 25:14],
>       https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03199.html
>
>>>                *ecx |= CPUID_TOPOLOGY_LEVEL_SMT;
>>>                break;
>>>            case 1:
>>>                *eax = apicid_pkg_offset(&topo_info);
>>> -            *ebx = cs->nr_cores * cs->nr_threads;
>>> +            *ebx = cpus_per_pkg;
>>>                *ecx |= CPUID_TOPOLOGY_LEVEL_CORE;
>>>                break;
>>>            default:
>>> @@ -5472,7 +5478,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>>>            switch (count) {
>>>            case 0:
>>>                *eax = apicid_core_offset(&topo_info);
>>> -            *ebx = cs->nr_threads;
>>> +            *ebx = topo_info.threads_per_core;
>>>                *ecx |= CPUID_TOPOLOGY_LEVEL_SMT;
>>>                break;
>>>            case 1:
>>> @@ -5482,7 +5488,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>>>                break;
>>>            case 2:
>>>                *eax = apicid_pkg_offset(&topo_info);
>>> -            *ebx = cs->nr_cores * cs->nr_threads;
>>> +            *ebx = cpus_per_pkg;
>>>                *ecx |= CPUID_TOPOLOGY_LEVEL_DIE;
>>>                break;
>>>            default:
>>> @@ -5707,7 +5713,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>>>             * discards multiple thread information if it is set.
>>>             * So don't set it here for Intel to make Linux guests happy.
>>>             */
>>> -        if (cs->nr_cores * cs->nr_threads > 1) {
>>> +        if (cpus_per_pkg > 1) {
>>>                if (env->cpuid_vendor1 != CPUID_VENDOR_INTEL_1 ||
>>>                    env->cpuid_vendor2 != CPUID_VENDOR_INTEL_2 ||
>>>                    env->cpuid_vendor3 != CPUID_VENDOR_INTEL_3) {
>>> @@ -5769,7 +5775,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>>>                 *eax |= (cpu_x86_virtual_addr_width(env) << 8);
>>>            }
>>>            *ebx = env->features[FEAT_8000_0008_EBX];
>>> -        if (cs->nr_cores * cs->nr_threads > 1) {
>>> +        if (cpus_per_pkg > 1) {
>>>                /*
>>>                 * Bits 15:12 is "The number of bits in the initial
>>>                 * Core::X86::Apic::ApicId[ApicId] value that indicate
>>> @@ -5777,7 +5783,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>>>                 * Bits 7:0 is "The number of threads in the package is NC+1"
>>>                 */
>>>                *ecx = (apicid_pkg_offset(&topo_info) << 12) |
>>> -                   ((cs->nr_cores * cs->nr_threads) - 1);
>>> +                   (cpus_per_pkg - 1);
>>>            } else {
>>>                *ecx = 0;
>>>            }
>> Thanks,
>> Yanan


