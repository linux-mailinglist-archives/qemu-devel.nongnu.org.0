Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706FDBC0C4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 05:36:23 +0200 (CEST)
Received: from localhost ([::1]:40522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCbcj-0005H0-UN
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 23:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43731)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iCbbM-0004eH-Si
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 23:34:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iCbbL-0005V2-1Z
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 23:34:56 -0400
Received: from mga07.intel.com ([134.134.136.100]:58312)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>)
 id 1iCbbH-0005S5-8S; Mon, 23 Sep 2019 23:34:51 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 20:34:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,542,1559545200"; d="scan'208";a="203276841"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.93])
 ([10.239.196.93])
 by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2019 20:34:40 -0700
Subject: Re: [PATCH v2] numa: Introduce MachineClass::auto_enable_numa for
 implicit NUMA node
To: "ehabkost@redhat.com" <ehabkost@redhat.com>
References: <20190905083238.1799-1-tao3.xu@intel.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <e84bd22f-fce4-ea39-38a0-0933ff30237b@intel.com>
Date: Tue, 24 Sep 2019 11:34:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190905083238.1799-1-tao3.xu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eduardo,

How about this version of patch? Last month this patch is reverted from 
pull request. And I submitted this version.

Tao

On 9/5/2019 4:32 PM, Xu, Tao3 wrote:
> Add MachineClass::auto_enable_numa field. When it is true, a NUMA node
> is expected to be created implicitly.
> 
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> ---
> 
> Note: Parameter -numa node,mem is deprecated too. So I set
> "numa_info[0].node_mem = ram_size" instead of
> "NumaNodeOptions node = { .mem = ram_size }".
> 
> Changes in v2:
>      - Fix the qtest error, avoid using numa_auto_assign_ram.
> ---
>   hw/core/numa.c      | 10 ++++++++--
>   hw/ppc/spapr.c      |  9 +--------
>   include/hw/boards.h |  1 +
>   3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index 4dfec5c95b..038c96d4ab 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -378,11 +378,17 @@ void numa_complete_configuration(MachineState *ms)
>        *   guest tries to use it with that drivers.
>        *
>        * Enable NUMA implicitly by adding a new NUMA node automatically.
> +     *
> +     * Or if MachineClass::auto_enable_numa is true and no NUMA nodes,
> +     * assume there is just one node with whole RAM.
>        */
> -    if (ms->ram_slots > 0 && ms->numa_state->num_nodes == 0 &&
> -        mc->auto_enable_numa_with_memhp) {
> +    if (ms->numa_state->num_nodes == 0 &&
> +        ((ms->ram_slots > 0 &&
> +        mc->auto_enable_numa_with_memhp) ||
> +        mc->auto_enable_numa)) {
>               NumaNodeOptions node = { };
>               parse_numa_node(ms, &node, &error_abort);
> +            numa_info[0].node_mem = ram_size;
>       }
>   
>       assert(max_numa_nodeid <= MAX_NODES);
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 222a325056..f760e0f5d7 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -405,14 +405,6 @@ static int spapr_populate_memory(SpaprMachineState *spapr, void *fdt)
>       hwaddr mem_start, node_size;
>       int i, nb_nodes = machine->numa_state->num_nodes;
>       NodeInfo *nodes = machine->numa_state->nodes;
> -    NodeInfo ramnode;
> -
> -    /* No NUMA nodes, assume there is just one node with whole RAM */
> -    if (!nb_nodes) {
> -        nb_nodes = 1;
> -        ramnode.node_mem = machine->ram_size;
> -        nodes = &ramnode;
> -    }
>   
>       for (i = 0, mem_start = 0; i < nb_nodes; ++i) {
>           if (!nodes[i].node_mem) {
> @@ -4477,6 +4469,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>        */
>       mc->numa_mem_align_shift = 28;
>       mc->numa_mem_supported = true;
> +    mc->auto_enable_numa = true;
>   
>       smc->default_caps.caps[SPAPR_CAP_HTM] = SPAPR_CAP_OFF;
>       smc->default_caps.caps[SPAPR_CAP_VSX] = SPAPR_CAP_ON;
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 2289536e48..481e69388e 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -221,6 +221,7 @@ struct MachineClass {
>       bool smbus_no_migration_support;
>       bool nvdimm_supported;
>       bool numa_mem_supported;
> +    bool auto_enable_numa;
>   
>       HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
>                                              DeviceState *dev);
> 


