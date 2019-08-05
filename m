Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7FC80FE4
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 02:57:48 +0200 (CEST)
Received: from localhost ([::1]:50078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huRJq-0007Bs-Vo
	for lists+qemu-devel@lfdr.de; Sun, 04 Aug 2019 20:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43775)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tao3.xu@intel.com>) id 1huRIy-0006VN-0H
 for qemu-devel@nongnu.org; Sun, 04 Aug 2019 20:56:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1huRIw-0002o4-ML
 for qemu-devel@nongnu.org; Sun, 04 Aug 2019 20:56:51 -0400
Received: from mga05.intel.com ([192.55.52.43]:50370)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>)
 id 1huRIt-0002mW-EV; Sun, 04 Aug 2019 20:56:47 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Aug 2019 17:56:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,347,1559545200"; d="scan'208";a="185158893"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.216])
 ([10.239.196.216])
 by orsmga002.jf.intel.com with ESMTP; 04 Aug 2019 17:56:41 -0700
To: David Gibson <david@gibson.dropbear.id.au>
References: <20190801075258.19070-1-tao3.xu@intel.com>
 <20190802065538.GA2031@umbus.fritz.box>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <27846884-9bf4-7729-7a9e-0392280ee67f@intel.com>
Date: Mon, 5 Aug 2019 08:56:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802065538.GA2031@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
Subject: Re: [Qemu-devel] [RFC PATCH] numa: add auto_enable_numa to fix
 broken check in spapr
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
Cc: imammedo@redhat.com, qemu-ppc@nongnu.org, ehabkost@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/2/2019 2:55 PM, David Gibson wrote:
> On Thu, Aug 01, 2019 at 03:52:58PM +0800, Tao Xu wrote:
>> Introduce MachineClass::auto_enable_numa for one implicit NUMA node,
>> and enable it to fix broken check in spapr_validate_node_memory(), when
>> spapr_populate_memory() creates a implicit node and info then use
>> nb_numa_nodes which is 0.
>>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
>> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> 
> The change here looks fine so,
> 
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> 
> However, I'm not following what check in spapr is broken and why.
> 
Sorry, may be I should update the commit message.

Because in spapr_populate_memory(), if numa node is 0

     if (!nb_nodes) {
         nb_nodes = 1;
         ramnode.node_mem = machine->ram_size;
         nodes = &ramnode;
     }

it use a local 'nb_nodes' as 1 and update global nodes info, but 
inpapr_validate_node_memory(), use the global nb_numa_nodes

     for (i = 0; i < nb_numa_nodes; i++) {
     	if (numa_info[i].node_mem % SPAPR_MEMORY_BLOCK_SIZE) {

so the global is 0 and skip the node_mem check.
>> ---
>>
>> This patch has a dependency on
>> https://patchwork.kernel.org/cover/11063235/
>> ---
>>   hw/core/numa.c      | 9 +++++++--
>>   hw/ppc/spapr.c      | 9 +--------
>>   include/hw/boards.h | 1 +
>>   3 files changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/core/numa.c b/hw/core/numa.c
>> index 75db35ac19..756d243d3f 100644
>> --- a/hw/core/numa.c
>> +++ b/hw/core/numa.c
>> @@ -580,9 +580,14 @@ void numa_complete_configuration(MachineState *ms)
>>        *   guest tries to use it with that drivers.
>>        *
>>        * Enable NUMA implicitly by adding a new NUMA node automatically.
>> +     *
>> +     * Or if MachineClass::auto_enable_numa is true and no NUMA nodes,
>> +     * assume there is just one node with whole RAM.
>>        */
>> -    if (ms->ram_slots > 0 && ms->numa_state->num_nodes == 0 &&
>> -        mc->auto_enable_numa_with_memhp) {
>> +    if (ms->numa_state->num_nodes == 0 &&
>> +        ((ms->ram_slots > 0 &&
>> +        mc->auto_enable_numa_with_memhp) ||
>> +        mc->auto_enable_numa)) {
>>               NumaNodeOptions node = { };
>>               parse_numa_node(ms, &node, &error_abort);
>>       }
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index f607ca567b..e50343f326 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -400,14 +400,6 @@ static int spapr_populate_memory(SpaprMachineState *spapr, void *fdt)
>>       hwaddr mem_start, node_size;
>>       int i, nb_nodes = machine->numa_state->num_nodes;
>>       NodeInfo *nodes = machine->numa_state->nodes;
>> -    NodeInfo ramnode;
>> -
>> -    /* No NUMA nodes, assume there is just one node with whole RAM */
>> -    if (!nb_nodes) {
>> -        nb_nodes = 1;
>> -        ramnode.node_mem = machine->ram_size;
>> -        nodes = &ramnode;
>> -    }
>>   
>>       for (i = 0, mem_start = 0; i < nb_nodes; ++i) {
>>           if (!nodes[i].node_mem) {
>> @@ -4369,6 +4361,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>>        */
>>       mc->numa_mem_align_shift = 28;
>>       mc->numa_mem_supported = true;
>> +    mc->auto_enable_numa = true;
>>   
>>       smc->default_caps.caps[SPAPR_CAP_HTM] = SPAPR_CAP_OFF;
>>       smc->default_caps.caps[SPAPR_CAP_VSX] = SPAPR_CAP_ON;
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index 2eb9a0b4e0..4a350b87d2 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -220,6 +220,7 @@ struct MachineClass {
>>       bool smbus_no_migration_support;
>>       bool nvdimm_supported;
>>       bool numa_mem_supported;
>> +    bool auto_enable_numa;
>>   
>>       HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
>>                                              DeviceState *dev);
> 


