Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288715009EF
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 11:32:37 +0200 (CEST)
Received: from localhost ([::1]:39444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nevq8-0001nJ-1j
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 05:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nevna-0000kx-Ov; Thu, 14 Apr 2022 05:29:58 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:5152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nevnY-0000iw-0k; Thu, 14 Apr 2022 05:29:58 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KfDb006RTzCqyn;
 Thu, 14 Apr 2022 17:25:32 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2375.24; Thu, 14 Apr 2022 17:29:50 +0800
Subject: Re: [PATCH v5 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: Gavin Shan <gshan@redhat.com>, <qemu-arm@nongnu.org>
CC: <qemu-devel@nongnu.org>, <imammedo@redhat.com>, <drjones@redhat.com>,
 <richard.henderson@linaro.org>, <peter.maydell@linaro.org>,
 <zhenyzha@redhat.com>, <shan.gavin@gmail.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-3-gshan@redhat.com>
 <6f713fec-71e6-3300-a504-817f45a82a51@huawei.com>
 <27df8771-ebe0-b5fe-39c4-83696e21e3a3@redhat.com>
 <ea5ab7db-1831-83a5-1719-239930b37571@huawei.com>
 <c49d80af-f68b-1b5c-a808-848172d88f89@redhat.com>
 <f02ae2ce-0256-ac85-0bb7-bd34244d9781@huawei.com>
 <503fb329-8f39-eddb-d05a-729279934fa7@redhat.com>
Message-ID: <97e0fa3c-842c-7af9-b92c-a4e77ec7f0e5@huawei.com>
Date: Thu, 14 Apr 2022 17:29:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <503fb329-8f39-eddb-d05a-729279934fa7@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>

On 2022/4/14 15:35, Gavin Shan wrote:
> Hi Yanan,
>
> On 4/14/22 10:49 AM, wangyanan (Y) wrote:
>> On 2022/4/14 10:37, Gavin Shan wrote:
>>> On 4/14/22 10:27 AM, wangyanan (Y) wrote:
>>>> On 2022/4/14 8:08, Gavin Shan wrote:
>>>>> On 4/13/22 8:39 PM, wangyanan (Y) wrote:
>>>>>> On 2022/4/3 22:59, Gavin Shan wrote:
>>>>>>> Currently, the SMP configuration isn't considered when the CPU
>>>>>>> topology is populated. In this case, it's impossible to provide
>>>>>>> the default CPU-to-NUMA mapping or association based on the socket
>>>>>>> ID of the given CPU.
>>>>>>>
>>>>>>> This takes account of SMP configuration when the CPU topology
>>>>>>> is populated. The die ID for the given CPU isn't assigned since
>>>>>>> it's not supported on arm/virt machine yet.
>>>>>>>
>>>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>>>> ---
>>>>>>>   hw/arm/virt.c | 16 +++++++++++++++-
>>>>>>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>>> index d2e5ecd234..3174526730 100644
>>>>>>> --- a/hw/arm/virt.c
>>>>>>> +++ b/hw/arm/virt.c
>>>>>>> @@ -2505,6 +2505,7 @@ static const CPUArchIdList 
>>>>>>> *virt_possible_cpu_arch_ids(MachineState *ms)
>>>>>>>       int n;
>>>>>>>       unsigned int max_cpus = ms->smp.max_cpus;
>>>>>>>       VirtMachineState *vms = VIRT_MACHINE(ms);
>>>>>>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>>>>>>>       if (ms->possible_cpus) {
>>>>>>>           assert(ms->possible_cpus->len == max_cpus);
>>>>>>> @@ -2518,8 +2519,21 @@ static const CPUArchIdList 
>>>>>>> *virt_possible_cpu_arch_ids(MachineState *ms)
>>>>>>>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>>>>>>>           ms->possible_cpus->cpus[n].arch_id =
>>>>>>>               virt_cpu_mp_affinity(vms, n);
>>>>>>> +
>>>>>>> +        assert(!mc->smp_props.dies_supported);
>>>>>>> + ms->possible_cpus->cpus[n].props.has_socket_id = true;
>>>>>>> + ms->possible_cpus->cpus[n].props.socket_id =
>>>>>>> +            (n / (ms->smp.clusters * ms->smp.cores * 
>>>>>>> ms->smp.threads)) %
>>>>>>> +            ms->smp.sockets;
>>>>>> No need for "% ms->smp.sockets".
>>>>>
>>>>> Yeah, lets remove it in v6.
>>>>>
>>>>>>> + ms->possible_cpus->cpus[n].props.has_cluster_id = true;
>>>>>>> + ms->possible_cpus->cpus[n].props.cluster_id =
>>>>>>> +            (n / (ms->smp.cores * ms->smp.threads)) % 
>>>>>>> ms->smp.clusters;
>>>>>>> + ms->possible_cpus->cpus[n].props.has_core_id = true;
>>>>>>> + ms->possible_cpus->cpus[n].props.core_id =
>>>>>>> +            (n / ms->smp.threads) % ms->smp.cores;
>>>>>>> ms->possible_cpus->cpus[n].props.has_thread_id = true;
>>>>>>> - ms->possible_cpus->cpus[n].props.thread_id = n;
>>>>>>> + ms->possible_cpus->cpus[n].props.thread_id =
>>>>>>> +            n % ms->smp.threads;
>>>>>>>       }
>>>>>>>       return ms->possible_cpus;
>>>>>>>   }
>>>>>> Otherwise, looks good to me:
>>>>>> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
>>>>>>
>>>>>
>>>>> Thanks for your time to review :)
>>>>>
>>>>>
>>>> Oh, after further testing this patch breaks numa-test for aarch64,
>>>> which should be checked and fixed. I guess it's because we have
>>>> more IDs supported for ARM. We have to fully running the QEMU
>>>> tests before sending some patches to ensure that they are not
>>>> breaking anything. :)
>>>>
>>>
>>> Thanks for catching the failure and reporting back. I'm not
>>> too much familar with QEMU's test workframe. Could you please
>>> share the detailed commands to reproduce the failure? I will
>>> fix in v6, which will be done in a separate patch :)
>>>
>> There is a reference link: https://wiki.qemu.org/Testing
>> To catch the failure of this patch: "make check" will be enough.
>>
>
> Thanks for the pointer. The issue is caused by 
> ms->possible_cpus->cpus[n].props.thread_id.
> Before this patch, it's value of [0 ... smp.cpus]. However, it's 
> always zero
> after this patch is applied because '%' operation is applied for the 
> thread
> ID.
>
> What we need to do is to specify SMP configuration for the test case. 
> I will
> add PATCH[v6 5/5] for it.
Better to keep the fix together with this patch for good bisection.
>
> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> index 90bf68a5b3..6178ac21a5 100644
> --- a/tests/qtest/numa-test.c
> +++ b/tests/qtest/numa-test.c
> @@ -223,7 +223,7 @@ static void aarch64_numa_cpu(const void *data)
>      QTestState *qts;
>      g_autofree char *cli = NULL;
>
> -    cli = make_cli(data, "-machine smp.cpus=2 "
> +    cli = make_cli(data, "-machine 
> smp.cpus=2,smp.sockets=1,smp.cores=1,smp.threads=2 "
>
Maybe it's better to extend aarch64_numa_cpu() by adding
"socket_id, cluster_id, core_id" configuration to the -numa cpu,
given that we have them for aarch64 now.

Thanks,
Yanan
>
>
>
> .


