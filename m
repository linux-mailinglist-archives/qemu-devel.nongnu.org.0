Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AB53E2204
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 05:02:13 +0200 (CEST)
Received: from localhost ([::1]:52452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBq7g-00037a-Fw
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 23:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1mBq6S-0001bA-WF
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 23:00:57 -0400
Received: from mga02.intel.com ([134.134.136.20]:38642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1mBq6P-0001CB-CR
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 23:00:56 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="201469972"
X-IronPort-AV: E=Sophos;i="5.84,299,1620716400"; d="scan'208";a="201469972"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 20:00:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,299,1620716400"; d="scan'208";a="513035633"
Received: from jingqili-mobl.ccr.corp.intel.com (HELO [10.238.6.254])
 ([10.238.6.254])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 20:00:45 -0700
Subject: Re: [PATCH] hw/i386/acpi-build: Get NUMA information from struct
 NumaState
To: Igor Mammedov <imammedo@redhat.com>
References: <20210803063005.72770-1-jingqi.liu@intel.com>
 <20210805112610.5c86dfaf@redhat.com>
From: "Liu, Jingqi" <jingqi.liu@intel.com>
Message-ID: <7d6b89fb-4843-7b95-b63f-c3c320edd80d@intel.com>
Date: Fri, 6 Aug 2021 11:00:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805112610.5c86dfaf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=jingqi.liu@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.132,
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/5/2021 5:26 PM, Igor Mammedov wrote:
> On Tue,  3 Aug 2021 14:30:05 +0800
> Jingqi Liu <jingqi.liu@intel.com> wrote:
> 
>> The NUMA information in PCMachineState is copied from MachineState.
>> We get this information uniformly from struct NumaState in MachineState.
> Is there a another reason behind this patch?
> 
> As cleanup it's not complete, why do you keep
> PCMachineState::numa_nodes & co around?
> I'd suggest to remove it completely and use data from
> MachineState everywhere.
> 
Thanks for your confirmation.
I think so too.
We can get NUMA information completely from MachineState::numa_state.

Actually, MachineState::numa_state is used everywhere except for 
pc_guest_info_init(), which just copies NUMA information to 
PCMachineState::numa_nodes and PCMachineState::node_mem.

I'll remove them completely.

Thanks,
Jingqi

>> Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
>> ---
>>   hw/i386/acpi-build.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 17836149fe..e3c9ad011e 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -1902,6 +1902,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>>       X86MachineState *x86ms = X86_MACHINE(machine);
>>       const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(machine);
>>       PCMachineState *pcms = PC_MACHINE(machine);
>> +    int nb_numa_nodes = machine->numa_state->num_nodes;
>> +    NodeInfo *numa_info = machine->numa_state->nodes;
>>       ram_addr_t hotplugabble_address_space_size =
>>           object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
>>                                   NULL);
>> @@ -1945,9 +1947,9 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>>       next_base = 0;
>>       numa_start = table_data->len;
>>   
>> -    for (i = 1; i < pcms->numa_nodes + 1; ++i) {
>> +    for (i = 1; i < nb_numa_nodes + 1; ++i) {
>>           mem_base = next_base;
>> -        mem_len = pcms->node_mem[i - 1];
>> +        mem_len = numa_info[i - 1].node_mem;
>>           next_base = mem_base + mem_len;
>>   
>>           /* Cut out the 640K hole */
>> @@ -1995,7 +1997,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>>       }
>>   
>>       slots = (table_data->len - numa_start) / sizeof *numamem;
>> -    for (; slots < pcms->numa_nodes + 2; slots++) {
>> +    for (; slots < nb_numa_nodes + 2; slots++) {
>>           numamem = acpi_data_push(table_data, sizeof *numamem);
>>           build_srat_memory(numamem, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
>>       }
>> @@ -2011,7 +2013,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>>       if (hotplugabble_address_space_size) {
>>           numamem = acpi_data_push(table_data, sizeof *numamem);
>>           build_srat_memory(numamem, machine->device_memory->base,
>> -                          hotplugabble_address_space_size, pcms->numa_nodes - 1,
>> +                          hotplugabble_address_space_size, nb_numa_nodes - 1,
>>                             MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
>>       }
>>   
>> @@ -2513,7 +2515,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>>           }
>>       }
>>   #endif
>> -    if (pcms->numa_nodes) {
>> +    if (machine->numa_state->num_nodes) {
>>           acpi_add_table(table_offsets, tables_blob);
>>           build_srat(tables_blob, tables->linker, machine);
>>           if (machine->numa_state->have_numa_distance) {
> 

