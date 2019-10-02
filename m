Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AAEC8CBF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 17:21:44 +0200 (CEST)
Received: from localhost ([::1]:56526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFgRj-0003FT-1H
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 11:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47639)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iFgMe-0000Cr-SM
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 11:16:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iFgMc-0007K9-EA
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 11:16:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39458)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iFgMa-0007IR-Nx
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 11:16:25 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EA89A30073EB;
 Wed,  2 Oct 2019 15:16:22 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2998519D70;
 Wed,  2 Oct 2019 15:16:21 +0000 (UTC)
Date: Wed, 2 Oct 2019 17:16:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Tao Xu <tao3.xu@intel.com>
Subject: Re: [PATCH v12 06/11] numa: Extend CLI to provide memory latency
 and bandwidth information
Message-ID: <20191002171619.04a11347@redhat.com>
In-Reply-To: <20190920074349.2616-7-tao3.xu@intel.com>
References: <20190920074349.2616-1-tao3.xu@intel.com>
 <20190920074349.2616-7-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 02 Oct 2019 15:16:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 qemu-devel@nongnu.org, jonathan.cameron@huawei.com, dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Sep 2019 15:43:44 +0800
Tao Xu <tao3.xu@intel.com> wrote:

> From: Liu Jingqi <jingqi.liu@intel.com>
> 
> Add -numa hmat-lb option to provide System Locality Latency and
> Bandwidth Information. These memory attributes help to build
> System Locality Latency and Bandwidth Information Structure(s)
> in ACPI Heterogeneous Memory Attribute Table (HMAT).
> 
> Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> ---
> 
> No changes in v12.
> 
> Changes in v11:
>     - Move numa option patches forward.
>     - Add num_initiator in Numa_state to record the number of
>       initiators.
>     - Simplify struct HMAT_LB_Info, use uint64_t array to store data.
>     - Drop hmat_get_base().
> 
> Changes in v10:
>     - use new builtin type 'time' as qapi input.
> ---
>  hw/core/numa.c        | 114 ++++++++++++++++++++++++++++++++++++++++++
>  include/sysemu/numa.h |  44 ++++++++++++++++
>  qapi/machine.json     |  95 ++++++++++++++++++++++++++++++++++-
>  qemu-options.hx       |  49 +++++++++++++++++-
>  4 files changed, 299 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index eff5491f6f..f5a1c9e909 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -199,6 +199,100 @@ void parse_numa_distance(MachineState *ms, NumaDistOptions *dist, Error **errp)
>      ms->numa_state->have_numa_distance = true;
>  }
>  
> +void parse_numa_hmat_lb(NumaState *nstat, NumaHmatLBOptions *node,
> +                        Error **errp)
> +{
> +    int i;

> +    int init = node->initiator;
> +    int targ = node->target;
above acronyms are vague, it would be better to use node->initiator/target
as is within this function.

> +    int nb_nodes = nstat->num_nodes;
you are using both local var and  argument within the same function,
pls be consistent and use only one of them for consistency.

> +    NodeInfo *numa_info = nstat->nodes;
> +    HMAT_LB_Info *hmat_lb = nstat->hmat_lb[node->hierarchy][node->data_type];
> +
> +    /* Error checking */
> +    if (init >= nb_nodes) {
> +        error_setg(errp, "Invalid initiator=%d, it should be less than %d.",
> +                   init, nb_nodes);
> +        return;
> +    }
> +    if (targ >= nb_nodes) {
> +        error_setg(errp, "Invalid target=%d, it should be less than %d.",
> +                   targ, nb_nodes);
> +        return;
> +    }
> +    if (!numa_info[init].has_cpu) {
> +        error_setg(errp, "Invalid initiator=%d, it isn't an "
> +                   "initiator proximity domain.", init);
> +        return;
> +    }
> +    if (!numa_info[targ].present) {
> +        error_setg(errp, "Invalid target=%d, it hasn't a valid NUMA node.",
> +                   targ);
> +        return;
> +    }
> +
> +    /* HMAT latency and bandwidth data initialization */
> +    if (nstat->num_initiator == 0) {
> +        for (i = 0; i < nstat->num_nodes; i++) {
> +            if (numa_info[i].has_cpu) {
> +                nstat->num_initiator++;
> +            }
> +        }
> +    }
> +
> +    if (!hmat_lb) {
> +        int size = nstat->num_initiator * nb_nodes * sizeof(uint64_t);
> +        hmat_lb = g_malloc0(sizeof(*hmat_lb));
> +        nstat->hmat_lb[node->hierarchy][node->data_type] = hmat_lb;
> +        hmat_lb->latency = g_malloc0(size);
> +        hmat_lb->bandwidth = g_malloc0(size);

during CLI parsing  nb_nodes and nstat->num_initiator would be a moving target
(
ex possible CLI that would break your code:
 -numa node,nodeid=0 -numa hmat-lb,initiator=0... -numa node,nodeid=1)
}

and I don't see a nice way to enforce options order on CLI in this case.

Instead of manually calculating sizes and keeping num_initiator in state,
you could drop num_initiator field and reuse GArray structure which will
do allocation mgmt for you and won't be affected by options ordering.

and then later 9/11 in hmat_build_table_structs()
you can calculate num_initiator at the same time you fill in initiator_list[]
or if initiator_list were GArray, it would be calculated for you automatically.


> +    }
> +    hmat_lb->hierarchy = node->hierarchy;
> +    hmat_lb->data_type = node->data_type;
> +
> +    /* Input latency data */
> +    if (node->data_type <= HMATLB_DATA_TYPE_WRITE_LATENCY) {
> +        if (!node->has_latency) {
> +            error_setg(errp, "Missing 'latency' option.");
> +            return;
> +        }
> +        if (node->has_bandwidth) {
> +            error_setg(errp, "Invalid option 'bandwidth' since "
> +                       "the data type is latency.");
> +            return;
> +        }
> +        if (hmat_lb->latency[init * nb_nodes + targ]) {
> +            error_setg(errp, "Duplicate configuration of the latency for "
> +                        "initiator=%d and target=%d.", init, targ);
> +            return;
> +        }
> +
> +        hmat_lb->latency[init * nb_nodes + targ] = node->latency;
> +    }
> +
> +    /* Input bandwidth data */
> +    if (node->data_type >= HMATLB_DATA_TYPE_ACCESS_BANDWIDTH) {
> +        if (!node->has_bandwidth) {
> +            error_setg(errp, "Missing 'bandwidth' option.");
> +            return;
> +        }
> +        if (node->has_latency) {
> +            error_setg(errp, "Invalid option 'latency' since "
> +                       "the data type is bandwidth.");
> +            return;
> +        }
> +        if (hmat_lb->bandwidth[init * nb_nodes + targ]) {
> +            error_setg(errp, "Duplicate configuration of the bandwidth for "
> +                        "initiator=%d and target=%d.", init, targ);
> +            return;
> +        }
> +
> +        /* Convert Byte to Megabyte */
> +        hmat_lb->bandwidth[init * nb_nodes + targ] =
> +            node->bandwidth / 1024 / 1024;

if node->bandwidth (size type) is not multiple of 1MB,
you will loose user provided value here.

check for that and error out instead of ignoring not suitable value

also replace "1024 / 1024" with MiB

> +    }
> +}
> +
>  void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp)
>  {
>      Error *err = NULL;
> @@ -237,6 +331,19 @@ void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp)
>          machine_set_cpu_numa_node(ms, qapi_NumaCpuOptions_base(&object->u.cpu),
>                                    &err);
>          break;
> +    case NUMA_OPTIONS_TYPE_HMAT_LB:
> +        if (!ms->numa_state->hmat_enabled) {
> +            error_setg(errp, "ACPI Heterogeneous Memory Attribute Table "
> +                       "(HMAT) is disabled, use -machine hmat=on before "
s/use/enable it with/

> +                       "set initiator of NUMA");
s/set initiator of NUMA/using any of hmat specific options/

> +            return;
> +        }
> +
> +        parse_numa_hmat_lb(ms->numa_state, &object->u.hmat_lb, &err);
> +        if (err) {
> +            goto end;
> +        }
> +        break;
>      default:
>          abort();
>      }
> @@ -264,6 +371,13 @@ static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
>          qemu_strtosz_MiB(mem_str, NULL, &object->u.node.mem);
>      }
>  
> +    /* Set up suffix-less bandwidth as megabytes */
> +    if ((object->type == NUMA_OPTIONS_TYPE_HMAT_LB) &&
> +        object->u.hmat_lb.has_bandwidth) {
> +        const char *bw_str = qemu_opt_get(opts, "bandwidth");
> +        qemu_strtosz_MiB(bw_str, NULL, &object->u.hmat_lb.bandwidth);
> +    }
Don't do fixups on behalf of user, if user provided nonsense values
error out instead.

>      set_numa_options(ms, object, &err);
>  
>  end:
> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> index a788c3b126..876beaee22 100644
> --- a/include/sysemu/numa.h
> +++ b/include/sysemu/numa.h
> @@ -14,6 +14,27 @@ struct CPUArchId;
>  #define NUMA_DISTANCE_MAX         254
>  #define NUMA_DISTANCE_UNREACHABLE 255
>  
> +/* the value of AcpiHmatLBInfo flags */
> +enum {
> +    HMAT_LB_MEM_MEMORY           = 0,
> +    HMAT_LB_MEM_CACHE_1ST_LEVEL  = 1,
> +    HMAT_LB_MEM_CACHE_2ND_LEVEL  = 2,
> +    HMAT_LB_MEM_CACHE_3RD_LEVEL  = 3,
> +};
> +
> +/* the value of AcpiHmatLBInfo data type */
> +enum {
> +    HMAT_LB_DATA_ACCESS_LATENCY   = 0,
> +    HMAT_LB_DATA_READ_LATENCY     = 1,
> +    HMAT_LB_DATA_WRITE_LATENCY    = 2,
> +    HMAT_LB_DATA_ACCESS_BANDWIDTH = 3,
> +    HMAT_LB_DATA_READ_BANDWIDTH   = 4,
> +    HMAT_LB_DATA_WRITE_BANDWIDTH  = 5,
> +};
> +
> +#define HMAT_LB_LEVELS    (HMAT_LB_MEM_CACHE_3RD_LEVEL + 1)
> +#define HMAT_LB_TYPES     (HMAT_LB_DATA_WRITE_BANDWIDTH + 1)
> +
>  struct NodeInfo {
>      uint64_t node_mem;
>      struct HostMemoryBackend *node_memdev;
> @@ -29,6 +50,21 @@ struct NumaNodeMem {
>      uint64_t node_plugged_mem;
>  };
>  
> +struct HMAT_LB_Info {
> +    /* Indicates it's memory or the specified level memory side cache. */
> +    uint8_t     hierarchy;
> +
> +    /* Present the type of data, access/read/write latency or bandwidth. */
> +    uint8_t     data_type;
> +
> +    /* Array to store the latencies */
specify units it's stored in

> +    uint64_t    *latency;
> +
> +    /* Array to store the bandwidthes */
ditto

> +    uint64_t    *bandwidth;
btw:

what was the reason for picking uint64_t for storing above values?

it seems in this patch you dumb down bandwidth to MB/s above but
store latency as is.

and then in 9/11 build_hmat_lb you divide that on 'base' units,
where are guaranties that value stored here will fit into 2 bytes
used in HMAT to store it in the table?

if this structure should store values in terms on HMAT table it should
probably use uint16_t and check that user provided value won't overflow
at the time of CLI parsing.

> +};
> +typedef struct HMAT_LB_Info HMAT_LB_Info;
> +
>  struct NumaState {
>      /* Number of NUMA nodes */
>      int num_nodes;
> @@ -39,13 +75,21 @@ struct NumaState {
>      /* Detect if HMAT support is enabled. */
>      bool hmat_enabled;
>  
> +    /* Number of Proximity Domains that can initiate memory access requests. */
> +    int num_initiator;
> +
>      /* NUMA nodes information */
>      NodeInfo nodes[MAX_NODES];
> +
> +    /* NUMA nodes HMAT Locality Latency and Bandwidth Information */
> +    HMAT_LB_Info *hmat_lb[HMAT_LB_LEVELS][HMAT_LB_TYPES];
>  };
>  typedef struct NumaState NumaState;
>  
>  void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp);
>  void parse_numa_opts(MachineState *ms);
> +void parse_numa_hmat_lb(NumaState *nstat, NumaHmatLBOptions *node,
> +                        Error **errp);
>  void numa_complete_configuration(MachineState *ms);
>  void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
>  extern QemuOptsList qemu_numa_opts;
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 3c2914cd1c..b6019335e8 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -426,10 +426,12 @@
>  #
>  # @cpu: property based CPU(s) to node mapping (Since: 2.10)
>  #
> +# @hmat-lb: memory latency and bandwidth information (Since: 4.2)
> +#
>  # Since: 2.1
>  ##
>  { 'enum': 'NumaOptionsType',
> -  'data': [ 'node', 'dist', 'cpu' ] }
> +  'data': [ 'node', 'dist', 'cpu', 'hmat-lb' ] }
>  
>  ##
>  # @NumaOptions:
> @@ -444,7 +446,8 @@
>    'data': {
>      'node': 'NumaNodeOptions',
>      'dist': 'NumaDistOptions',
> -    'cpu': 'NumaCpuOptions' }}
> +    'cpu': 'NumaCpuOptions',
> +    'hmat-lb': 'NumaHmatLBOptions' }}
>  
>  ##
>  # @NumaNodeOptions:
> @@ -557,6 +560,94 @@
>     'base': 'CpuInstanceProperties',
>     'data' : {} }
>  
> +##
> +# @HmatLBMemoryHierarchy:
> +#
> +# The memory hierarchy in the System Locality Latency
> +# and Bandwidth Information Structure of HMAT (Heterogeneous
> +# Memory Attribute Table)
> +#
> +# For more information of @HmatLBMemoryHierarchy see
> +# the chapter 5.2.27.4: Table 5-142: Field "Flags" of ACPI 6.3 spec.
> +#
> +# @memory: the structure represents the memory performance
> +#
> +# @first-level: first level memory of memory side cached memory
> +#
> +# @second-level: second level memory of memory side cached memory
> +#
> +# @third-level: third level memory of memory side cached memory
> +#
> +# Since: 4.2
> +##
> +{ 'enum': 'HmatLBMemoryHierarchy',
> +  'data': [ 'memory', 'first-level', 'second-level', 'third-level' ] }
> +
> +##
> +# @HmatLBDataType:
> +#
> +# Data type in the System Locality Latency
> +# and Bandwidth Information Structure of HMAT (Heterogeneous
> +# Memory Attribute Table)
> +#
> +# For more information of @HmatLBDataType see
> +# the chapter 5.2.27.4: Table 5-142:  Field "Data Type" of ACPI 6.3 spec.
> +#
> +# @access-latency: access latency (nanoseconds)
> +#
> +# @read-latency: read latency (nanoseconds)
> +#
> +# @write-latency: write latency (nanoseconds)
> +#
> +# @access-bandwidth: access bandwidth (MB/s)
> +#
> +# @read-bandwidth: read bandwidth (MB/s)
> +#
> +# @write-bandwidth: write bandwidth (MB/s)
> +#
> +# Since: 4.2
> +##
> +{ 'enum': 'HmatLBDataType',
> +  'data': [ 'access-latency', 'read-latency', 'write-latency',
> +            'access-bandwidth', 'read-bandwidth', 'write-bandwidth' ] }
> +
> +##
> +# @NumaHmatLBOptions:
> +#
> +# Set the system locality latency and bandwidth information
> +# between Initiator and Target proximity Domains.
> +#
> +# For more information of @NumaHmatLBOptions see
> +# the chapter 5.2.27.4: Table 5-142 of ACPI 6.3 spec.
> +#
> +# @initiator: the Initiator Proximity Domain.
> +#
> +# @target: the Target Proximity Domain.
> +#
> +# @hierarchy: the Memory Hierarchy. Indicates the performance
> +#             of memory or side cache.
> +#
> +# @data-type: presents the type of data, access/read/write
> +#             latency or hit latency.
> +#
> +# @latency: the value of latency from @initiator to @target proximity domain,
> +#           the latency units are "ps(picosecond)", "ns(nanosecond)" or
> +#           "us(microsecond)".
> +#
> +# @bandwidth: the value of bandwidth between @initiator and @target proximity
> +#             domain, the bandwidth units are "MB(/s)","GB(/s)" or "TB(/s)".
> +#
> +# Since: 4.2
> +##
> +{ 'struct': 'NumaHmatLBOptions',
> +    'data': {
> +    'initiator': 'uint16',
> +    'target': 'uint16',
> +    'hierarchy': 'HmatLBMemoryHierarchy',
> +    'data-type': 'HmatLBDataType',
> +    '*latency': 'time',
> +    '*bandwidth': 'size' }}
> +
>  ##
>  # @HostMemPolicy:
>  #
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 74ccc4d782..129da0cdc3 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -168,16 +168,19 @@ DEF("numa", HAS_ARG, QEMU_OPTION_numa,
>      "-numa node[,mem=size][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=node]\n"
>      "-numa node[,memdev=id][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=node]\n"
>      "-numa dist,src=source,dst=destination,val=distance\n"
> -    "-numa cpu,node-id=node[,socket-id=x][,core-id=y][,thread-id=z]\n",
> +    "-numa cpu,node-id=node[,socket-id=x][,core-id=y][,thread-id=z]\n"
> +    "-numa hmat-lb,initiator=node,target=node,hierarchy=memory|first-level|second-level|third-level,data-type=access-latency|read-latency|write-latency[,latency=lat][,bandwidth=bw]\n",
>      QEMU_ARCH_ALL)
>  STEXI
>  @item -numa node[,mem=@var{size}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}][,initiator=@var{initiator}]
>  @itemx -numa node[,memdev=@var{id}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}][,initiator=@var{initiator}]
>  @itemx -numa dist,src=@var{source},dst=@var{destination},val=@var{distance}
>  @itemx -numa cpu,node-id=@var{node}[,socket-id=@var{x}][,core-id=@var{y}][,thread-id=@var{z}]
> +@itemx -numa hmat-lb,initiator=@var{node},target=@var{node},hierarchy=@var{str},data-type=@var{str}[,latency=@var{lat}][,bandwidth=@var{bw}]
>  @findex -numa
>  Define a NUMA node and assign RAM and VCPUs to it.
>  Set the NUMA distance from a source node to a destination node.
> +Set the ACPI Heterogeneous Memory Attributes for the given nodes.
>  
>  Legacy VCPU assignment uses @samp{cpus} option where
>  @var{firstcpu} and @var{lastcpu} are CPU indexes. Each
> @@ -256,6 +259,50 @@ specified resources, it just assigns existing resources to NUMA
>  nodes. This means that one still has to use the @option{-m},
>  @option{-smp} options to allocate RAM and VCPUs respectively.
>  
> +Use @samp{hmat-lb} to set System Locality Latency and Bandwidth Information
> +between initiator and target NUMA nodes in ACPI Heterogeneous Attribute Memory Table (HMAT).
> +Initiator NUMA node can create memory requests, usually including one or more processors.
> +Target NUMA node contains addressable memory.
> +
> +In @samp{hmat-lb} option, @var{node} are NUMA node IDs. @var{str} of 'hierarchy'
> +is the memory hierarchy of the target NUMA node: if @var{str} is 'memory', the structure
> +represents the memory performance; if @var{str} is 'first-level|second-level|third-level',
> +this structure represents aggregated performance of memory side caches for each domain.
> +@var{str} of 'data-type' is type of data represented by this structure instance:
> +if 'hierarchy' is 'memory', 'data-type' is 'access|read|write' latency(nanoseconds)
> +or 'access|read|write' bandwidth(MB/s) of the target memory; if 'hierarchy' is
> +'first-level|second-level|third-level', 'data-type' is 'access|read|write' hit latency
> +or 'access|read|write' hit bandwidth of the target memory side cache.
> +
> +@var{lat} of 'latency' is latency value, the possible value and units are
> +NUM[ps|ns|us] (picosecond|nanosecond|microsecond), the recommended unit is 'ns'. @var{bw}
> +is bandwidth value, the possible value and units are NUM[M|G|T], mean that
> +the bandwidth value are NUM MB/s, GB/s or TB/s. Note that max NUM is 65534,
> +if NUM is 0, means the corresponding latency or bandwidth information is not provided.
> +And if input numbers without any unit, the latency unit will be 'ps' and the bandwidth
> +will be MB/s.
> +
> +For example, the following option assigns NUMA node 0 and 1. Node 0 has 2 cpus and
> +a ram, node 1 has only a ram. The processors in node 0 access memory in node
> +0 with access-latency 5 nanoseconds, access-bandwidth is 200 MB/s;
> +The processors in NUMA node 0 access memory in NUMA node 1 with access-latency 10
> +nanoseconds, access-bandwidth is 100 MB/s.
> +@example
> +-machine hmat=on \
> +-m 2G \
> +-object memory-backend-ram,size=1G,id=m0 \
> +-object memory-backend-ram,size=1G,id=m1 \
> +-smp 2 \
> +-numa node,nodeid=0,memdev=m0 \
> +-numa node,nodeid=1,memdev=m1,initiator=0 \
> +-numa cpu,node-id=0,socket-id=0 \
> +-numa cpu,node-id=0,socket-id=1 \
> +-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=5ns \
> +-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=200M \
> +-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=10ns \
> +-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M
> +@end example
> +
>  ETEXI
>  
>  DEF("add-fd", HAS_ARG, QEMU_OPTION_add_fd,


