Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6987A8C78F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 04:25:14 +0200 (CEST)
Received: from localhost ([::1]:56766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxiyP-0002Zw-8a
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 22:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1hxixQ-00029d-3a
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 22:24:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1hxixN-0002tj-QB
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 22:24:11 -0400
Received: from mga03.intel.com ([134.134.136.65]:16685)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1hxixN-0002sy-HQ
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 22:24:09 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 19:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,382,1559545200"; d="scan'208";a="167243568"
Received: from unknown (HELO [10.239.196.241]) ([10.239.196.241])
 by orsmga007.jf.intel.com with ESMTP; 13 Aug 2019 19:24:03 -0700
To: Igor Mammedov <imammedo@redhat.com>
References: <20190809065731.9097-1-tao3.xu@intel.com>
 <20190809065731.9097-6-tao3.xu@intel.com>
 <20190813170027.0617b129@redhat.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <24976688-d8f1-4de0-870d-73b96c20c300@intel.com>
Date: Wed, 14 Aug 2019 10:24:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813170027.0617b129@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-devel] [PATCH v9 05/11] numa: Extend CLI to provide
 initiator information for numa nodes
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
Cc: ehabkost@redhat.com, jingqi.liu@intel.com, fan.du@intel.com,
 qemu-devel@nongnu.org, daniel@linux.ibm.com, jonathan.cameron@huawei.com,
 dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/13/2019 11:00 PM, Igor Mammedov wrote:
> On Fri,  9 Aug 2019 14:57:25 +0800
> Tao <tao3.xu@intel.com> wrote:
> 
>> From: Tao Xu <tao3.xu@intel.com>
>>
>> In ACPI 6.3 chapter 5.2.27 Heterogeneous Memory Attribute Table (HMAT),
>> The initiator represents processor which access to memory. And in 5.2.27.3
>> Memory Proximity Domain Attributes Structure, the attached initiator is
>> defined as where the memory controller responsible for a memory proximity
>> domain. With attached initiator information, the topology of heterogeneous
>> memory can be described.
>>
>> Extend CLI of "-numa node" option to indicate the initiator numa node-id.
>> In the linux kernel, the codes in drivers/acpi/hmat/hmat.c parse and report
>> the platform's HMAT tables.
>>
>> Reviewed-by: Jingqi Liu <Jingqi.liu@intel.com>
>> Suggested-by: Dan Williams <dan.j.williams@intel.com>
>> Signed-off-by: Tao Xu <tao3.xu@intel.com>
>> ---
>>
>> No changes in v9
>> ---
[...]
>> +
>> +    for (i = 0; i < machine->numa_state->num_nodes; i++) {
>> +        if (numa_info[i].initiator_valid &&
>> +            !numa_info[numa_info[i].initiator].has_cpu) {
>                            ^^^^^^^^^^^^^^^^^^^^^^ possible out of bounds read, see bellow
> 
I will add a error "if (numa_info[i].initiator >= MAX_NODES)" when input.
>> +            error_report("The initiator-id %"PRIu16 " of NUMA node %d"
>> +                         " does not exist.", numa_info[i].initiator, i);
>> +            error_printf("\n");
>> +
>> +            exit(1);
>> +        }
> it takes care only about nodes that have cpus or memory-only ones that have
> initiator explicitly provided on CLI. And leaves possibility to have
> memory-only nodes without initiator mixed with nodes that have initiator.
> Is it valid to have mixed configuration?
> Should we forbid it?
> 
Mixed configuration may indeed trigger bug in the future. Because in 
this patches we default generate HMAT. But mixed configuration situation 
or without initiator setting will let mem-only node "Flags" field 0, 
then the Proximity Domain for the Attached Initiator field is not
valid.

List are three situations:

1) full configuration, just like
-object memory-backend-ram,size=1G,id=m0 \
-object memory-backend-ram,size=1G,id=m1 \
-object memory-backend-ram,size=1G,id=m2 \
-numa node,nodeid=0,memdev=m0 \
-numa node,nodeid=1,memdev=m1,initiator=0 \
-numa node,nodeid=2,memdev=m2,initiator=0

2) mixed configuration, just like
-object memory-backend-ram,size=1G,id=m0 \
-object memory-backend-ram,size=1G,id=m1 \
-object memory-backend-ram,size=1G,id=m2 \
-numa node,nodeid=0,memdev=m0 \
-numa node,nodeid=1,memdev=m1,initiator=0 \
-numa node,nodeid=2,memdev=m2

3) no configuration, just like
-object memory-backend-ram,size=1G,id=m0 \
-object memory-backend-ram,size=1G,id=m1 \
-object memory-backend-ram,size=1G,id=m2 \
-numa node,nodeid=0,memdev=m0 \
-numa node,nodeid=1,memdev=m1 \
-numa node,nodeid=2,memdev=m2

I have 3 ideas:

1. HMAT option. Add a machine option like "-machine,hmat=yes", then qemu 
can have HMAT.

2. Default setting. The numa without initiator default set numa node 
which has cpu 0 as initiator.

3. Auto setting. intelligent auto configuration like 
numa_default_auto_assign_ram, auto set initiator of the memory-only 
nodes averagely.

Therefore, there are 2 different solution:

1) HMAT option + Default setting

2) HMAT option + Auto setting

>> +    }
>> +
>>       if (s->len && !qtest_enabled()) {
>>           warn_report("CPU(s) not present in any NUMA nodes: %s",
>>                       s->str);
>> diff --git a/hw/core/numa.c b/hw/core/numa.c
>> index 8fcbba05d6..cfb6339810 100644
>> --- a/hw/core/numa.c
>> +++ b/hw/core/numa.c
>> @@ -128,6 +128,19 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
>>           numa_info[nodenr].node_mem = object_property_get_uint(o, "size", NULL);
>>           numa_info[nodenr].node_memdev = MEMORY_BACKEND(o);
>>       }
>> +
>> +    if (node->has_initiator) {
>> +        if (numa_info[nodenr].initiator_valid &&
>> +            (node->initiator != numa_info[nodenr].initiator)) {
>> +            error_setg(errp, "The initiator of NUMA node %" PRIu16 " has been "
>> +                       "set to node %" PRIu16, nodenr,
>> +                       numa_info[nodenr].initiator);
>> +            return;
>> +        }
>> +
>> +        numa_info[nodenr].initiator_valid = true;
>> +        numa_info[nodenr].initiator = node->initiator;
>                                               ^^^
> not validated  user input? (which could lead to read beyond numa_info[] boundaries
> in previous hunk).
> 
>> +    }
>>       numa_info[nodenr].present = true;
>>       max_numa_nodeid = MAX(max_numa_nodeid, nodenr + 1);
>>       ms->numa_state->num_nodes++;
>> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
>> index 76da3016db..46ad06e000 100644
>> --- a/include/sysemu/numa.h
>> +++ b/include/sysemu/numa.h
>> @@ -10,6 +10,9 @@ struct NodeInfo {
>>       uint64_t node_mem;
>>       struct HostMemoryBackend *node_memdev;
>>       bool present;
>> +    bool has_cpu;
>> +    bool initiator_valid;
>> +    uint16_t initiator;
>>       uint8_t distance[MAX_NODES];
>>   };
>>   
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 6db8a7e2ec..05e367d26a 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -414,6 +414,9 @@
>>   # @memdev: memory backend object.  If specified for one node,
>>   #          it must be specified for all nodes.
>>   #
>> +# @initiator: the initiator numa nodeid that is closest (as in directly
>> +#             attached) to this numa node (since 4.2)
> well, it's pretty unclear what doc comment means (unless reader knows well
> specific part of ACPI spec)
> 
> suggest to rephrase to something more understandable for unaware
> readers (+ possible reference to spec for those who is interested
> in spec definition since this doc is meant for developers).
> 
>> +#
>>   # Since: 2.1
>>   ##
>>   { 'struct': 'NumaNodeOptions',
>> @@ -421,7 +424,8 @@
>>      '*nodeid': 'uint16',
>>      '*cpus':   ['uint16'],
>>      '*mem':    'size',
>> -   '*memdev': 'str' }}
>> +   '*memdev': 'str',
>> +   '*initiator': 'uint16' }}
>>   
>>   ##
>>   # @NumaDistOptions:
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 9621e934c0..c480781992 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -161,14 +161,14 @@ If any on the three values is given, the total number of CPUs @var{n} can be omi
>>   ETEXI
>>   
>>   DEF("numa", HAS_ARG, QEMU_OPTION_numa,
>> -    "-numa node[,mem=size][,cpus=firstcpu[-lastcpu]][,nodeid=node]\n"
>> -    "-numa node[,memdev=id][,cpus=firstcpu[-lastcpu]][,nodeid=node]\n"
>> +    "-numa node[,mem=size][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=node]\n"
>> +    "-numa node[,memdev=id][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=node]\n"
>>       "-numa dist,src=source,dst=destination,val=distance\n"
>>       "-numa cpu,node-id=node[,socket-id=x][,core-id=y][,thread-id=z]\n",
>>       QEMU_ARCH_ALL)
>>   STEXI
>> -@item -numa node[,mem=@var{size}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}]
>> -@itemx -numa node[,memdev=@var{id}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}]
>> +@item -numa node[,mem=@var{size}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}][,initiator=@var{initiator}]
>> +@itemx -numa node[,memdev=@var{id}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}][,initiator=@var{initiator}]
>>   @itemx -numa dist,src=@var{source},dst=@var{destination},val=@var{distance}
>>   @itemx -numa cpu,node-id=@var{node}[,socket-id=@var{x}][,core-id=@var{y}][,thread-id=@var{z}]
>>   @findex -numa
>> @@ -215,6 +215,25 @@ split equally between them.
>>   @samp{mem} and @samp{memdev} are mutually exclusive. Furthermore,
>>   if one node uses @samp{memdev}, all of them have to use it.
>>   
>> +@samp{initiator} indicate the initiator NUMA @var{initiator} that is
>                                    ^^^^^^^       ^^^^^^^^^^^^^^
> above will result in "initiator NUMA initiator", was it your intention?
> 
>> +closest (as in directly attached) to this NUMA @var{node}.
> Again suggest replace spec language with something more user friendly
> (this time without spec reference as it's geared for end user)
> 
>> +For example, the following option assigns 2 NUMA nodes, node 0 has CPU.
> Following example creates a machine with 2 NUMA ...
> 
>> +node 1 has only memory, and its' initiator is node 0. Note that because
>> +node 0 has CPU, by default the initiator of node 0 is itself and must be
>> +itself.
>> +@example
>> +-M pc \
>> +-m 2G,slots=2,maxmem=4G \
>> +-object memory-backend-ram,size=1G,id=m0 \
>> +-object memory-backend-ram,size=1G,id=m1 \
>> +-numa node,nodeid=0,memdev=m0 \
>> +-numa node,nodeid=1,memdev=m1,initiator=0 \
>> +-smp 2,sockets=2,maxcpus=2  \
>> +-numa cpu,node-id=0,socket-id=0 \
>> +-numa cpu,node-id=0,socket-id=1 \
>> +@end example
>> +
>>   @var{source} and @var{destination} are NUMA node IDs.
>>   @var{distance} is the NUMA distance from @var{source} to @var{destination}.
>>   The distance from a node to itself is always 10. If any pair of nodes is
> 


