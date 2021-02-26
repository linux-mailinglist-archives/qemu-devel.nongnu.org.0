Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE51F325BAB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 03:28:30 +0100 (CET)
Received: from localhost ([::1]:34214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFSrl-0006s4-TB
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 21:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFSqR-0006Gi-HU; Thu, 25 Feb 2021 21:27:07 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFSqL-00028Z-CV; Thu, 25 Feb 2021 21:27:07 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DmtmH3BYtzjS7M;
 Fri, 26 Feb 2021 10:25:19 +0800 (CST)
Received: from [10.174.186.67] (10.174.186.67) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Feb 2021 10:26:49 +0800
Subject: Re: [RFC PATCH 5/5] hw/arm/virt-acpi-build: add PPTT table
To: Andrew Jones <drjones@redhat.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
 <20210225085627.2263-6-fangying1@huawei.com>
 <20210225113817.xdctmgp3icrhjhrf@kamzik.brq.redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <8ff55a13-e072-9e90-d689-6fb26383e1f2@huawei.com>
Date: Fri, 26 Feb 2021 10:26:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210225113817.xdctmgp3icrhjhrf@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.435,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, salil.mehta@huawei.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com, Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/25/2021 7:38 PM, Andrew Jones wrote:
> 
> This is just [*] with some minor code changes
> 
> [*] https://github.com/rhdrjones/qemu/commit/439b38d67ca1f2cbfa5b9892a822b651ebd05c11
> 
> so it's disappointing that my name is nowhere to be found on it.
> 
> Also, the explanation of the DT and ACPI differences has been
> dropped from the commit message of [*]. I'm not sure why.
> 

Will fix that. I will add SOB of you then you can help to comment on it.

> Thanks,
> drew
> 
> On Thu, Feb 25, 2021 at 04:56:27PM +0800, Ying Fang wrote:
>> Add the Processor Properties Topology Table (PPTT) to present
>> CPU topology information to the guest. A three-level cpu
>> topology is built in accord with the linux kernel currently does.
>>
>> Tested-by: Jiajie Li <lijiajie11@huawei.com>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 50 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index bb91152fe2..38d50ce66c 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -436,6 +436,50 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>                    vms->oem_table_id);
>>   }
>>   
>> +static void
>> +build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>> +{
>> +    int pptt_start = table_data->len;
>> +    int uid = 0, cpus = 0, socket = 0;
>> +    MachineState *ms = MACHINE(vms);
>> +    unsigned int smp_cores = ms->smp.cores;
>> +    unsigned int smp_threads = ms->smp.threads;
>> +
>> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
>> +
>> +    for (socket = 0; cpus < ms->possible_cpus->len; socket++) {
>> +        uint32_t socket_offset = table_data->len - pptt_start;
>> +        int core;
>> +
>> +        build_socket_hierarchy(table_data, 0, socket);
>> +
>> +        for (core = 0; core < smp_cores; core++) {
>> +            uint32_t core_offset = table_data->len - pptt_start;
>> +            int thread;
>> +
>> +            if (smp_threads <= 1) {
>> +                build_processor_hierarchy(table_data,
>> +                                          ACPI_PPTT_ACPI_PROCESSOR_ID_VALID |
>> +                                          ACPI_PPTT_ACPI_LEAF_NODE,
>> +                                          socket_offset, uid++);
>> +             } else {
>> +                build_processor_hierarchy(table_data,
>> +                                          ACPI_PPTT_ACPI_PROCESSOR_ID_VALID,
>> +                                          socket_offset, core);
>> +                for (thread = 0; thread < smp_threads; thread++) {
>> +                    build_thread_hierarchy(table_data, core_offset, uid++);
>> +                }
>> +             }
>> +        }
>> +        cpus += smp_cores * smp_threads;
>> +    }
>> +
>> +    build_header(linker, table_data,
>> +                 (void *)(table_data->data + pptt_start), "PPTT",
>> +                 table_data->len - pptt_start, 2,
>> +                 vms->oem_id, vms->oem_table_id);
>> +}
>> +
>>   /* GTDT */
>>   static void
>>   build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>> @@ -688,6 +732,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>       unsigned dsdt, xsdt;
>>       GArray *tables_blob = tables->table_data;
>>       MachineState *ms = MACHINE(vms);
>> +    bool cpu_topology_enabled = !vmc->no_cpu_topology;
>>   
>>       table_offsets = g_array_new(false, true /* clear */,
>>                                           sizeof(uint32_t));
>> @@ -707,6 +752,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>       acpi_add_table(table_offsets, tables_blob);
>>       build_madt(tables_blob, tables->linker, vms);
>>   
>> +    if (ms->smp.cpus > 1 && cpu_topology_enabled) {
>> +        acpi_add_table(table_offsets, tables_blob);
>> +        build_pptt(tables_blob, tables->linker, vms);
>> +    }
>> +
>>       acpi_add_table(table_offsets, tables_blob);
>>       build_gtdt(tables_blob, tables->linker, vms);
>>   
>> -- 
>> 2.23.0
>>
>>
> 
> .
> 

