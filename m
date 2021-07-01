Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937F63B8E76
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 09:56:58 +0200 (CEST)
Received: from localhost ([::1]:47898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyrZB-0005sR-Li
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 03:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1lyrY1-00059M-EF
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 03:55:45 -0400
Received: from mga18.intel.com ([134.134.136.126]:31865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1lyrXx-0001QE-Qp
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 03:55:44 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="195780671"
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; d="scan'208";a="195780671"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 00:55:32 -0700
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; d="scan'208";a="457561648"
Received: from jingqili-mobl.ccr.corp.intel.com (HELO [10.238.7.83])
 ([10.238.7.83])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 00:55:28 -0700
Subject: Re: [PATCH] nvdimm: add 'target-node' option
To: Igor Mammedov <imammedo@redhat.com>
References: <20210625022518.29994-1-jingqi.liu@intel.com>
 <20210630170047.2c6cc26b@redhat.com>
From: "Liu, Jingqi" <jingqi.liu@intel.com>
Message-ID: <504e84ac-cb16-d93e-bdc5-ce09ebca8e10@intel.com>
Date: Thu, 1 Jul 2021 15:55:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630170047.2c6cc26b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=jingqi.liu@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi Igor,

Thanks for your comments.

On 6/30/2021 11:00 PM, Igor Mammedov wrote:
> On Fri, 25 Jun 2021 10:25:18 +0800
> Jingqi Liu <jingqi.liu@intel.com> wrote:
> 
>> Linux kernel version 5.1 brings in support for the volatile-use of
>> persistent memory as a hotplugged memory region (KMEM DAX).
>> When this feature is enabled, persistent memory can be seen as a
>> separate memory-only NUMA node(s). This newly-added memory can be
>> selected by its unique NUMA node.
>>
>> Add 'target-node' option for 'nvdimm' device to indicate this NUMA
>> node. It can be extended to a new node after all existing NUMA nodes.
> 
> how dynamic it is?
> can we force it to be 'static' node, would it break something?

In Guest,  the node can only be created after running the command like 
'daxctl reconfigure-device dax0.0 --mode=system-ram'.  This command 
makes the persistent memory be used as a volatile memory.

We can only use QEMU commands like the following to force it to be 
'static' node.

  -numa node,nodeid=1
  -object 
memory-backend-file,id=nvmem0,share=on,mem-path=/dev/dax0.0,size=2G,align=2M 

  -device nvdimm,memdev=nvmem0,id=nv0,label-size=2M,node=1

In Guest, before reconfiguring dax device to volatile memory, the NUMA 
nodes look like:

$ numactl -H
available: 2 nodes (0-1)
node 0 cpus: 0 1 2 3
node 0 size: 5933 MB
node 0 free: 5402 MB
node 1 cpus: 4 5 6 7
node 1 size: 0 MB
node 1 free: 0 MB
node distances:
node   0   1
   0:  10  20
   1:  20  10

It looks unfriendly.

> 
>> The 'node' option of 'pc-dimm' device is to add the DIMM to an
>> existing NUMA node. The 'node' should be in the available NUMA nodes.
>> For KMEM DAX mode, persistent memory can be in a new separate
>> memory-only NUMA node. The new node is created dynamically.
>> So users use 'target-node' to control whether persistent memory
>> is added to an existing NUMA node or a new NUMA node.
> 
> I don't get reasoning behind creating new property instead of reusing
> exiting 'node'.
> 
> 
> Can you provide more context by pointing to relevant kernel series?
> A pointer to a specification?

The relevant kernel series is as follows:
https://patchwork.kernel.org/project/linux-nvdimm/cover/20190225185727.BCBD768C@viggo.jf.intel.com/

For the specification, please refer to the links below.
https://pmem.io/glossary
KMEM DAX
https://pmem.io/2020/01/20/memkind-dax-kmem.html

> 
> and SRAT handling looks a bit sketchy,
> You are saying that it's dynamic and assigned by guest and then
> are trying to put it in static SRAT along with predefined nodes.
> 

The 'target-node' will be stored in the field 'proximity domain' of SRAT 
and NFIT. When creating dax device, the kernel dax driver will set 
'target_node' according to this field.
If the dax device is reconfigured as volatile memory,  it will be 
hot-plugged to the NUMA node specified by this 'target_node'.

>> An example of configuration is as follows.
>>
>> Using the following QEMU command:
>>   -object memory-backend-file,id=nvmem1,share=on,mem-path=/dev/dax0.0,size=3G,align=2M
>>   -device nvdimm,id=nvdimm1,memdev=mem1,label-size=128K,targe-node=2
>>
>> To list DAX devices:
>>   # daxctl list -u
>>   {
>>     "chardev":"dax0.0",
>>     "size":"3.00 GiB (3.22 GB)",
>>     "target_node":2,
>>     "mode":"devdax"
>>   }
>>
>> To create a namespace in Device-DAX mode as a standard memory:
>>   $ ndctl create-namespace --mode=devdax --map=mem
>> To reconfigure DAX device from devdax mode to a system-ram mode:
>>   $ daxctl reconfigure-device dax0.0 --mode=system-ram
>>
>> There are two existing NUMA nodes in Guest. After these operations,
>> persistent memory is configured as a separate Node 2 and
>> can be used as a volatile memory. This NUMA node is dynamically
>> created according to 'target-node'.
>>
>> Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
>> ---
>>   docs/nvdimm.txt         | 93 +++++++++++++++++++++++++++++++++++++++++
>>   hw/acpi/nvdimm.c        | 18 ++++++--
>>   hw/i386/acpi-build.c    | 12 +++++-
>>   hw/mem/nvdimm.c         | 23 +++++++++-
>>   include/hw/mem/nvdimm.h | 15 ++++++-
>>   util/nvdimm-utils.c     | 22 ++++++++++
>>   6 files changed, 175 insertions(+), 8 deletions(-)
>>
>> diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
>> index 0aae682be3..083d954bb4 100644
>> --- a/docs/nvdimm.txt
>> +++ b/docs/nvdimm.txt
>> @@ -107,6 +107,99 @@ Note:
>>      may result guest data corruption (e.g. breakage of guest file
>>      system).
>>   
>> +Target node
>> +-----------
>> +
>> +Linux kernel version 5.1 brings in support for the volatile-use of
>> +persistent memory as a hotplugged memory region (KMEM DAX).
>> +When this feature is enabled, persistent memory can be seen as a
>> +separate memory-only NUMA node(s). This newly-added memory can be
>> +selected by its unique NUMA node.
>> +Add 'target-node' option for nvdimm device to indicate this NUMA node.
>> +It can be extended after all existing NUMA nodes.
>> +
>> +An example of configuration is presented below.
>> +
>> +Using the following QEMU command:
>> + -object memory-backend-file,id=nvmem1,share=on,mem-path=/dev/dax0.0,size=3G,align=2M
>> + -device nvdimm,id=nvdimm1,memdev=mem1,label-size=128K,targe-node=1
>> +
>> +The below operations are in Guest.
>> +
>> +To list available NUMA nodes using numactl:
>> + # numactl -H
>> + available: 1 nodes (0)
>> + node 0 cpus: 0 1 2 3 4 5 6 7
>> + node 0 size: 5933 MB
>> + node 0 free: 5457 MB
>> + node distances:
>> + node   0
>> +   0:  10
>> +
>> +To create a namespace in Device-DAX mode as a standard memory from
>> +all the available capacity of NVDIMM:
>> +
>> + # ndctl create-namespace --mode=devdax --map=mem
>> + {
>> +   "dev":"namespace0.0",
>> +   "mode":"devdax",
>> +   "map":"mem",
>> +   "size":"3.00 GiB (3.22 GB)",
>> +   "uuid":"4e4d8293-dd3b-4e43-8ad9-7f3d2a8d1680",
>> +   "daxregion":{
>> +     "id":0,
>> +     "size":"3.00 GiB (3.22 GB)",
>> +     "align":2097152,
>> +     "devices":[
>> +       {
>> +         "chardev":"dax0.0",
>> +         "size":"3.00 GiB (3.22 GB)",
>> +         "target_node":1,
>> +         "mode":"devdax"
>> +       }
>> +     ]
>> +   },
>> +   "align":2097152
>> + }
>> +
>> +To list DAX devices:
>> + # daxctl list -u
>> + {
>> +   "chardev":"dax0.0",
>> +   "size":"3.00 GiB (3.22 GB)",
>> +   "target_node":1,
>> +   "mode":"devdax"
>> + }
>> +
>> +To reconfigure DAX device from devdax mode to a system-ram mode:
>> + # daxctl reconfigure-device dax0.0 --mode=system-ram
>> + [
>> +   {
>> +     "chardev":"dax0.0",
>> +     "size":3217031168,
>> +     "target_node":1,
>> +     "mode":"system-ram",
>> +     "movable":false
>> +   }
>> + ]
>> +
>> +After this operation, persistent memory is configured as a separate NUMA node
>> +and can be used as a volatile memory.
>> +The new NUMA node is Node 1:
>> + # numactl -H
>> + available: 2 nodes (0-1)
>> + node 0 cpus: 0 1 2 3 4 5 6 7
>> + node 0 size: 5933 MB
>> + node 0 free: 5339 MB
>> + node 1 cpus:
>> + node 1 size: 2816 MB
>> + node 1 free: 2815 MB
>> + node distances:
>> + node   0   1
>> +   0:  10  20
>> +   1:  20  10
>> +
>> +
>>   Hotplug
>>   -------
>>   
>> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
>> index e3d5fe1939..376ad6fd58 100644
>> --- a/hw/acpi/nvdimm.c
>> +++ b/hw/acpi/nvdimm.c
>> @@ -228,11 +228,13 @@ nvdimm_build_structure_spa(GArray *structures, DeviceState *dev)
>>                                                NULL);
>>       uint64_t size = object_property_get_uint(OBJECT(dev), PC_DIMM_SIZE_PROP,
>>                                                NULL);
>> -    uint32_t node = object_property_get_uint(OBJECT(dev), PC_DIMM_NODE_PROP,
> node id is 32 bit per spec, don't loose it here
> 
Got it.

> 
>> +    int node = object_property_get_int(OBJECT(dev), NVDIMM_TARGET_NODE_PROP,
>>                                                NULL);
>>       int slot = object_property_get_int(OBJECT(dev), PC_DIMM_SLOT_PROP,
>>                                          NULL);
>> -
>> +    if (node < 0) {
>> +        node = object_property_get_uint(OBJECT(dev), PC_DIMM_NODE_PROP, NULL);
>> +    }
> see below about error handling
> 
>>       nfit_spa = acpi_data_push(structures, sizeof(*nfit_spa));
>>   
>>       nfit_spa->type = cpu_to_le16(0 /* System Physical Address Range
>> @@ -1337,8 +1339,9 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
>>       free_aml_allocator();
>>   }
>>   
>> -void nvdimm_build_srat(GArray *table_data)
>> +int nvdimm_build_srat(GArray *table_data)
>>   {
>> +    int max_target_node = nvdimm_check_target_nodes();
>>       GSList *device_list = nvdimm_get_device_list();
>>   
>>       for (; device_list; device_list = device_list->next) {
>> @@ -1348,7 +1351,12 @@ void nvdimm_build_srat(GArray *table_data)
>>           uint64_t addr, size;
>>           int node;
>>   
>> -        node = object_property_get_int(obj, PC_DIMM_NODE_PROP, &error_abort);
>> +        node = object_property_get_int(obj, NVDIMM_TARGET_NODE_PROP,
>> +                                       &error_abort);
>> +        if (node < 0) {
>> +            node = object_property_get_uint(obj, PC_DIMM_NODE_PROP,
>> +                                            &error_abort);
>> +        }
> it should be checked at realize time, with proper error handling.
> Also I'd make both properties mutually exclusive
Good point.
I'll move the checking to realize().

> 
>>           addr = object_property_get_uint(obj, PC_DIMM_ADDR_PROP, &error_abort);
>>           size = object_property_get_uint(obj, PC_DIMM_SIZE_PROP, &error_abort);
>>   
>> @@ -1357,6 +1365,8 @@ void nvdimm_build_srat(GArray *table_data)
>>                             MEM_AFFINITY_ENABLED | MEM_AFFINITY_NON_VOLATILE);
>>       }
>>       g_slist_free(device_list);
>> +
>> +   return max_target_node;
>>   }
>>   
>>   void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 796ffc6f5c..19bf91063f 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -1879,6 +1879,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>>       AcpiSratMemoryAffinity *numamem;
>>   
>>       int i;
>> +    int max_node = 0;
>>       int srat_start, numa_start, slots;
>>       uint64_t mem_len, mem_base, next_base;
>>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>> @@ -1974,7 +1975,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>>       }
>>   
>>       if (machine->nvdimms_state->is_enabled) {
>> -        nvdimm_build_srat(table_data);
>> +        max_node = nvdimm_build_srat(table_data);
>>       }
>>   
>>       slots = (table_data->len - numa_start) / sizeof *numamem;
>> @@ -1992,9 +1993,16 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>>        * providing _PXM method if necessary.
>>        */
>>       if (hotplugabble_address_space_size) {
>> +        if (max_node < 0) {
>> +            max_node = pcms->numa_nodes - 1;
>> +        } else {
>> +            max_node = max_node > pcms->numa_nodes - 1 ?
>> +                       max_node : pcms->numa_nodes - 1;
>> +        }
>>
>>           numamem = acpi_data_push(table_data, sizeof *numamem);
>>           build_srat_memory(numamem, machine->device_memory->base,
>> -                          hotplugabble_address_space_size, pcms->numa_nodes - 1,
>> +                          hotplugabble_address_space_size, max_node,
>>                             MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
>>       }
>>   
>> diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
>> index 7397b67156..a9c27f7ad0 100644
>> --- a/hw/mem/nvdimm.c
>> +++ b/hw/mem/nvdimm.c
>> @@ -27,11 +27,15 @@
>>   #include "qemu/pmem.h"
>>   #include "qapi/error.h"
>>   #include "qapi/visitor.h"
>> +#include "hw/boards.h"
>>   #include "hw/mem/nvdimm.h"
>>   #include "hw/qdev-properties.h"
>>   #include "hw/mem/memory-device.h"
>>   #include "sysemu/hostmem.h"
>>   
>> +unsigned long nvdimm_target_nodes[BITS_TO_LONGS(MAX_NODES)];
>> +int nvdimm_max_target_node;
>> +
>>   static void nvdimm_get_label_size(Object *obj, Visitor *v, const char *name,
>>                                     void *opaque, Error **errp)
>>   {
>> @@ -96,7 +100,6 @@ static void nvdimm_set_uuid(Object *obj, Visitor *v, const char *name,
>>       g_free(value);
>>   }
>>   
>> -
>>   static void nvdimm_init(Object *obj)
>>   {
>>       object_property_add(obj, NVDIMM_LABEL_SIZE_PROP, "int",
>> @@ -181,6 +184,23 @@ static MemoryRegion *nvdimm_md_get_memory_region(MemoryDeviceState *md,
>>   static void nvdimm_realize(PCDIMMDevice *dimm, Error **errp)
>>   {
>>       NVDIMMDevice *nvdimm = NVDIMM(dimm);
> 
>> +    MachineState *ms = MACHINE(qdev_get_machine());
>> +    int nb_numa_nodes = ms->numa_state->num_nodes;
>> +
>> +    if (nvdimm->target_node >= MAX_NODES) {
>> +        error_setg(errp, "'NVDIMM property " NVDIMM_TARGET_NODE_PROP
>> +                   " has value %" PRIu32
>> +                   "' which exceeds the max number of numa nodes: %d",
>> +                   nvdimm->target_node, MAX_NODES);
>> +        return;
>> +    }
>> +
>> +    if (nvdimm->target_node >= nb_numa_nodes) {
>> +        set_bit(nvdimm->target_node, nvdimm_target_nodes);
>> +        if (nvdimm->target_node > nvdimm_max_target_node) {
>> +            nvdimm_max_target_node = nvdimm->target_node;
>> +        }
>> +    }
> 
> 
> device shouldn't poke into Machine,
> use _pre_plug callback for that
> 
Good point.
How about calling nvdimm_pre_plug() in pc_memory_pre_plug() ?

>>   
>>       if (!nvdimm->nvdimm_mr) {
>>           nvdimm_prepare_memory_region(nvdimm, errp);
>> @@ -229,6 +249,7 @@ static void nvdimm_write_label_data(NVDIMMDevice *nvdimm, const void *buf,
>>   
>>   static Property nvdimm_properties[] = {
>>       DEFINE_PROP_BOOL(NVDIMM_UNARMED_PROP, NVDIMMDevice, unarmed, false),
>> +    DEFINE_PROP_INT32(NVDIMM_TARGET_NODE_PROP, NVDIMMDevice, target_node, -1),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>   
>> diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
>> index bcf62f825c..96b609a60e 100644
>> --- a/include/hw/mem/nvdimm.h
>> +++ b/include/hw/mem/nvdimm.h
>> @@ -51,6 +51,7 @@ OBJECT_DECLARE_TYPE(NVDIMMDevice, NVDIMMClass, NVDIMM)
>>   #define NVDIMM_LABEL_SIZE_PROP "label-size"
>>   #define NVDIMM_UUID_PROP       "uuid"
>>   #define NVDIMM_UNARMED_PROP    "unarmed"
>> +#define NVDIMM_TARGET_NODE_PROP "target-node"
>>   
>>   struct NVDIMMDevice {
>>       /* private */
>> @@ -89,6 +90,14 @@ struct NVDIMMDevice {
>>        * The PPC64 - spapr requires each nvdimm device have a uuid.
>>        */
>>       QemuUUID uuid;
>> +
>> +    /*
>> +     * Support for the volatile-use of persistent memory as normal RAM.
>> +     * This newly-added memory can be selected by its unique NUMA node.
>> +     * This node can be extended to a new node after all existing NUMA
>> +     * nodes.
>> +     */
>> +    int target_node;
>>   };
>>   
>>   struct NVDIMMClass {
>> @@ -148,14 +157,18 @@ struct NVDIMMState {
>>   };
>>   typedef struct NVDIMMState NVDIMMState;
>>   
>> +extern unsigned long nvdimm_target_nodes[];
>> +extern int nvdimm_max_target_node;
>> +
>>   void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
>>                               struct AcpiGenericAddress dsm_io,
>>                               FWCfgState *fw_cfg, Object *owner);
>> -void nvdimm_build_srat(GArray *table_data);
>> +int nvdimm_build_srat(GArray *table_data);
>>   void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
>>                          BIOSLinker *linker, NVDIMMState *state,
>>                          uint32_t ram_slots, const char *oem_id,
>>                          const char *oem_table_id);
>>   void nvdimm_plug(NVDIMMState *state);
>>   void nvdimm_acpi_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev);
>> +int nvdimm_check_target_nodes(void);
>>   #endif
>> diff --git a/util/nvdimm-utils.c b/util/nvdimm-utils.c
>> index aa3d199f2d..767f1e4787 100644
>> --- a/util/nvdimm-utils.c
>> +++ b/util/nvdimm-utils.c
>> @@ -1,5 +1,7 @@
>>   #include "qemu/osdep.h"
>>   #include "qemu/nvdimm-utils.h"
>> +#include "qapi/error.h"
>> +#include "hw/boards.h"
>>   #include "hw/mem/nvdimm.h"
>>   
>>   static int nvdimm_device_list(Object *obj, void *opaque)
>> @@ -28,3 +30,23 @@ GSList *nvdimm_get_device_list(void)
>>       object_child_foreach(qdev_get_machine(), nvdimm_device_list, &list);
>>       return list;
>>   }
>> +
>> +int nvdimm_check_target_nodes(void)
>> +{
>> +    MachineState *ms = MACHINE(qdev_get_machine());
>> +    int nb_numa_nodes = ms->numa_state->num_nodes;
>> +    int node;
>> +
>> +    if (!nvdimm_max_target_node) {
>> +        return -1;
>> +    }
>> +
>> +    for (node = nb_numa_nodes; node <= nvdimm_max_target_node; node++) {
>> +        if (!test_bit(node, nvdimm_target_nodes)) {
>> +            error_report("nvdimm target-node: Node ID missing: %d", node);
>> +            exit(1);
>> +        }
>> +    }
>> +
>> +    return nvdimm_max_target_node;
>> +}
> 

