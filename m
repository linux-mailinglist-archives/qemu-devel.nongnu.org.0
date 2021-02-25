Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F26325048
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 14:21:02 +0100 (CET)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFGZh-0008Ez-7W
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 08:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFGXc-000703-G6; Thu, 25 Feb 2021 08:18:54 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFGXS-0004zP-9H; Thu, 25 Feb 2021 08:18:51 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DmYG64D4szlPJ8;
 Thu, 25 Feb 2021 21:16:30 +0800 (CST)
Received: from [10.174.186.67] (10.174.186.67) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Feb 2021 21:18:23 +0800
Subject: Re: [RFC PATCH 2/5] hw/arm/virt: Add cpu-map to device tree
To: Andrew Jones <drjones@redhat.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
 <20210225085627.2263-3-fangying1@huawei.com>
 <20210225111610.mejof5pe2y5fe5xr@kamzik.brq.redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <5fc765dd-52fa-2936-f298-d2635c863eb3@huawei.com>
Date: Thu, 25 Feb 2021 21:18:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210225111610.mejof5pe2y5fe5xr@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.435,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, salil.mehta@huawei.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/25/2021 7:16 PM, Andrew Jones wrote:
> Hi Ying Fang,
> 
> The only difference between this and what I have in my tree[*]
> is the removal of the socket node (which has been in the Linux
> docs since June 2019). Any reason why you removed that node? In
> any case, I think I deserve a bit more credit for this patch.

Sorry, you surely deserve it. I forget to add it here.
Should I have a SOB of you here ?

The latest linux kernel use a four level cpu topology defined in

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/cpu/cpu-topology.txt?h=v5.11

ie. socket node, cluster node, core node, thread node.

The linux kernel 4.19 LTS use a three level cpu topology defined in
Documentation/devicetree/bindings/arm/topology.txt

ie. cluster node, core node, thread node.

Currently Qemu x86 has 4 level of cpu topology as: socket, die, core,
thread. Should arm64 active like it here ?

Further more, latest linux kernel define the cpu topology struct as.
So maybe it only cares about the socket, core, thread topology levels.

struct cpu_topology { 

     int thread_id; 

     int core_id; 

     int package_id; 

     int llc_id; 

     cpumask_t thread_sibling; 

     cpumask_t core_sibling; 

     cpumask_t llc_sibling; 

};

> 
> [*] https://github.com/rhdrjones/qemu/commit/35feecdd43475608c8f55973a0c159eac4aafefd
> 
> Thanks,
> drew
> 
> On Thu, Feb 25, 2021 at 04:56:24PM +0800, Ying Fang wrote:
>> Support device tree CPU topology descriptions.
>>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> ---
>>   hw/arm/virt.c         | 38 +++++++++++++++++++++++++++++++++++++-
>>   include/hw/arm/virt.h |  1 +
>>   2 files changed, 38 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 371147f3ae..c133b342b8 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -351,10 +351,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>>       int cpu;
>>       int addr_cells = 1;
>>       const MachineState *ms = MACHINE(vms);
>> +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>       int smp_cpus = ms->smp.cpus;
>>   
>>       /*
>> -     * From Documentation/devicetree/bindings/arm/cpus.txt
>> +     * See Linux Documentation/devicetree/bindings/arm/cpus.yaml
>>        *  On ARM v8 64-bit systems value should be set to 2,
>>        *  that corresponds to the MPIDR_EL1 register size.
>>        *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
>> @@ -407,8 +408,42 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>>                   ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
>>           }
>>   
>> +        if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
>> +            qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle",
>> +                                  qemu_fdt_alloc_phandle(vms->fdt));
>> +        }
>> +
>>           g_free(nodename);
>>       }
>> +
>> +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
>> +        /*
>> +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
>> +         */
>> +        qemu_fdt_add_subnode(vms->fdt, "/cpus/cpu-map");
>> +
>> +        for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
>> +            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
>> +            char *map_path;
>> +
>> +            if (ms->smp.threads > 1) {
>> +                map_path = g_strdup_printf(
>> +                            "/cpus/cpu-map/%s%d/%s%d/%s%d",
>> +                            "cluster", cpu / (ms->smp.cores * ms->smp.threads),

a cluster node may be replaced by socket to keep accord with the latest 
kernel.

>> +                            "core", (cpu / ms->smp.threads) % ms->smp.cores,
>> +                            "thread", cpu % ms->smp.threads);
>> +            } else {
>> +                map_path = g_strdup_printf(
>> +                            "/cpus/cpu-map/%s%d/%s%d",
>> +                            "cluster", cpu / ms->smp.cores,
>> +                            "core", cpu % ms->smp.cores);
>> +            }
>> +            qemu_fdt_add_path(vms->fdt, map_path);
>> +            qemu_fdt_setprop_phandle(vms->fdt, map_path, "cpu", cpu_path);
>> +            g_free(map_path);
>> +            g_free(cpu_path);
>> +        }
>> +    }
>>   }
>>   
>>   static void fdt_add_its_gic_node(VirtMachineState *vms)
>> @@ -2742,6 +2777,7 @@ static void virt_machine_5_2_options(MachineClass *mc)
>>       virt_machine_6_0_options(mc);
>>       compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>>       vmc->no_secure_gpio = true;
>> +    vmc->no_cpu_topology = true;
>>   }
>>   DEFINE_VIRT_MACHINE(5, 2)
>>   
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index ee9a93101e..7ef6d08ac3 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -129,6 +129,7 @@ struct VirtMachineClass {
>>       bool no_kvm_steal_time;
>>       bool acpi_expose_flash;
>>       bool no_secure_gpio;
>> +    bool no_cpu_topology;
>>   };
>>   
>>   struct VirtMachineState {
>> -- 
>> 2.23.0
>>
>>
> 
> .
> 

