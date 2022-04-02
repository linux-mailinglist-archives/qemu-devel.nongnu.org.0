Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EB94EFDF4
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 04:29:27 +0200 (CEST)
Received: from localhost ([::1]:45110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naTW2-0005HB-6j
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 22:29:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1naTTw-0003er-2w; Fri, 01 Apr 2022 22:27:16 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:5141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1naTTt-0000fU-Eg; Fri, 01 Apr 2022 22:27:15 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KVgq94J4wzDqCc;
 Sat,  2 Apr 2022 10:24:53 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Sat, 2 Apr 2022 10:27:08 +0800
Subject: Re: [PATCH v3 1/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: Igor Mammedov <imammedo@redhat.com>, Gavin Shan <gshan@redhat.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <drjones@redhat.com>,
 <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <zhenyzha@redhat.com>, <shan.gavin@gmail.com>
References: <20220323072438.71815-1-gshan@redhat.com>
 <20220323072438.71815-2-gshan@redhat.com>
 <20220325141949.66fc0083@redhat.com>
 <e46061b3-cebf-c4be-758e-c465cf7879c1@redhat.com>
 <20220330145046.175de97b@redhat.com>
Message-ID: <0de9dab3-83ee-95b9-b211-3677838ec8b0@huawei.com>
Date: Sat, 2 Apr 2022 10:27:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220330145046.175de97b@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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

On 2022/3/30 20:50, Igor Mammedov wrote:
> On Sat, 26 Mar 2022 02:49:59 +0800
> Gavin Shan <gshan@redhat.com> wrote:
>
>> Hi Igor,
>>
>> On 3/25/22 9:19 PM, Igor Mammedov wrote:
>>> On Wed, 23 Mar 2022 15:24:35 +0800
>>> Gavin Shan <gshan@redhat.com> wrote:
>>>> Currently, the SMP configuration isn't considered when the CPU
>>>> topology is populated. In this case, it's impossible to provide
>>>> the default CPU-to-NUMA mapping or association based on the socket
>>>> ID of the given CPU.
>>>>
>>>> This takes account of SMP configuration when the CPU topology
>>>> is populated. The die ID for the given CPU isn't assigned since
>>>> it's not supported on arm/virt machine yet. Besides, the cluster
>>>> ID for the given CPU is assigned because it has been supported
>>>> on arm/virt machine.
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>    hw/arm/virt.c     | 11 +++++++++++
>>>>    qapi/machine.json |  6 ++++--
>>>>    2 files changed, 15 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index d2e5ecd234..064eac42f7 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>>>        int n;
>>>>        unsigned int max_cpus = ms->smp.max_cpus;
>>>>        VirtMachineState *vms = VIRT_MACHINE(ms);
>>>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>>>>    
>>>>        if (ms->possible_cpus) {
>>>>            assert(ms->possible_cpus->len == max_cpus);
>>>> @@ -2518,6 +2519,16 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>>>            ms->possible_cpus->cpus[n].type = ms->cpu_type;
>>>>            ms->possible_cpus->cpus[n].arch_id =
>>>>                virt_cpu_mp_affinity(vms, n);
>>>> +
>>>> +        assert(!mc->smp_props.dies_supported);
>>>> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
>>>> +        ms->possible_cpus->cpus[n].props.socket_id =
>>>> +            n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
>>>> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
>>>> +        ms->possible_cpus->cpus[n].props.cluster_id =
>>>> +            n / (ms->smp.cores * ms->smp.threads);
>>> are there any relation cluster values here and number of clusters with
>>> what virt_cpu_mp_affinity() calculates?
>>>    
>> They're different clusters. The cluster returned by virt_cpu_mp_affinity()
>> is reflected to MPIDR_EL1 system register, which is mainly used by VGIC2/3
>> interrupt controller to send send group interrupts to the CPU cluster. It's
>> notable that the value returned from virt_cpu_mp_affinity() is always
>> overrided by KVM. It means this value is only used by TCG for the emulated
>> GIC2/GIC3.
>>
>> The cluster in 'ms->possible_cpus' is passed to ACPI PPTT table to populate
>> the CPU topology.
>>
>>
>>>> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
>>>> +        ms->possible_cpus->cpus[n].props.core_id = n / ms->smp.threads;
>>>    
>>>>            ms->possible_cpus->cpus[n].props.has_thread_id = true;
>>>>            ms->possible_cpus->cpus[n].props.thread_id = n;
>>> of cause target has the right to decide how to allocate IDs, and mgmt
>>> is supposed to query these IDs before using them.
>>> But:
>>>    * IDs within 'props' are supposed to be arch defined.
>>>      (on x86 IDs in range [0-smp.foo_id), on ppc it something different)
>>>      Question is what real hardware does here in ARM case (i.e.
>>>      how .../cores/threads are described on bare-metal)?
>>>     
>> On ARM64 bare-metal machine, the core/cluster ID assignment is pretty arbitrary.
>> I checked the CPU topology on my bare-metal machine, which has following SMP
>> configurations.
>>
>>       # lscpu
>>         :
>>       Thread(s) per core: 4
>>       Core(s) per socket: 28
>>       Socket(s):          2
>>
>>       smp.sockets  = 2
>>       smp.clusters = 1
>>       smp.cores    = 56   (28 per socket)
>>       smp.threads  = 4
>>
>>       // CPU0-111 belongs to socket0 or package0
>>       // CPU112-223 belongs to socket1 or package1
>>       # cat /sys/devices/system/cpu/cpu0/topology/package_cpus
>>       00000000,00000000,00000000,0000ffff,ffffffff,ffffffff,ffffffff
>>       # cat /sys/devices/system/cpu/cpu111/topology/package_cpus
>>       00000000,00000000,00000000,0000ffff,ffffffff,ffffffff,ffffffff
>>       # cat /sys/devices/system/cpu/cpu112/topology/package_cpus
>>       ffffffff,ffffffff,ffffffff,ffff0000,00000000,00000000,00000000
>>       # cat /sys/devices/system/cpu/cpu223/topology/package_cpus
>>       ffffffff,ffffffff,ffffffff,ffff0000,00000000,00000000,00000000
>>
>>       // core/cluster ID spans from 0 to 27 on socket0
>>       # for i in `seq 0 27`; do cat /sys/devices/system/cpu/cpu$i/topology/core_id; done
>>       0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
>>       # for i in `seq 28 55`; do cat /sys/devices/system/cpu/cpu$i/topology/core_id; done
>>       0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
>>       # for i in `seq 0 27`; do cat /sys/devices/system/cpu/cpu$i/topology/cluster_id; done
>>       0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
>>       # for i in `seq 28 55`; do cat /sys/devices/system/cpu/cpu$i/topology/cluster_id; done
>>       0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
>>       
>>       // However, core/cluster ID starts from 256 on socket1
>>       # for i in `seq 112 139`; do cat /sys/devices/system/cpu/cpu$i/topology/core_id; done
>>       256 257 258 259 260 261 262 263 264 265 266 267 268 269
>>       270 271 272 273 274 275 276 277 278 279 280 281 282 283
>>       # for i in `seq 140 167`; do cat /sys/devices/system/cpu/cpu$i/topology/core_id; done
>>       256 257 258 259 260 261 262 263 264 265 266 267 268 269
>>       270 271 272 273 274 275 276 277 278 279 280 281 282 283
>>       # for i in `seq 112 139`; do cat /sys/devices/system/cpu/cpu$i/topology/cluster_id; done
>>       256 257 258 259 260 261 262 263 264 265 266 267 268 269
>>       270 271 272 273 274 275 276 277 278 279 280 281 282 283
>>       # for i in `seq 140 167`; do cat /sys/devices/system/cpu/cpu$i/topology/cluster_id; done
>>       256 257 258 259 260 261 262 263 264 265 266 267 268 269
>>       270 271 272 273 274 275 276 277 278 279 280 281 282 283
> so it seems that IDs are repeatable within a socket.
> If there no arch defined way or other objections it might be better
> to stick to what x86 does for consistency reasons  (i.e. socket/die/
> cluster/core/thread are in range [0..x) including thread-id being
> in range [0..threads) ) instead of inventing arm/virt specific scheme.
Agreed.
>>      
>>>    * maybe related: looks like build_pptt() and build_madt() diverge on
>>>      the meaning of 'ACPI Processor ID' and how it's generated.
>>>      My understanding of 'ACPI Processor ID' is that it should match
>>>      across all tables. So UIDs generated in build_pptt() look wrong to me.
>>>
>>>    * maybe related: build_pptt() looks broken wrt core/thread where it
>>>      may create at the same time a  leaf core with a leaf thread underneath it,
>>>      is such description actually valid?
>>>    
>> Yes, the UIDs in MADT/PPTT should match. I'm not sure if I missed anything here.
>> I don't see how the UID in MADT and PPTT table are diverged. In both functions,
>> 'thread_id' is taken as UID.
>>
>> In build_pptt(), when the entries for the cores becomes leaf, nothing will be
>> pushed into @list, @length becomes zero for the loop to create entries for
>> the threads. In this case, we won't have any entries created for threads.
>>
>>>    
>>>>        }
>>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>>> index 42fc68403d..99c945f258 100644
>>>> --- a/qapi/machine.json
>>>> +++ b/qapi/machine.json
>>>> @@ -868,10 +868,11 @@
>>>>    # @node-id: NUMA node ID the CPU belongs to
>>>>    # @socket-id: socket number within node/board the CPU belongs to
>>>>    # @die-id: die number within socket the CPU belongs to (since 4.1)
>>>> -# @core-id: core number within die the CPU belongs to
>>>> +# @cluster-id: cluster number within die the CPU belongs to
>>>> +# @core-id: core number within cluster the CPU belongs to
>>> s:cluster:cluster/die:
>>>    
>> Ok. I will amend it like below in next respin:
>>
>>       # @core-id: core number within cluster/die the CPU belongs to
>>
>> I'm not sure if we need make similar changes for 'cluster_id' like below?
>>
>>      # @cluster-id: cluster number within die/socket the CPU belongs to
>>                                            ^^^^^^^^^^
> maybe postpone it till die is supported?
>
>>>>    # @thread-id: thread number within core the CPU belongs to
>>>>    #
>>>> -# Note: currently there are 5 properties that could be present
>>>> +# Note: currently there are 6 properties that could be present
>>>>    #       but management should be prepared to pass through other
>>>>    #       properties with device_add command to allow for future
>>>>    #       interface extension. This also requires the filed names to be kept in
>>>> @@ -883,6 +884,7 @@
>>>>      'data': { '*node-id': 'int',
>>>>                '*socket-id': 'int',
>>>>                '*die-id': 'int',
>>>> +            '*cluster-id': 'int',
>>>>                '*core-id': 'int',
>>>>                '*thread-id': 'int'
>>>>      }
>> Thanks,
>> Gavin
>>
> .


