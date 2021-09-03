Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EADC3FFA88
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 08:44:28 +0200 (CEST)
Received: from localhost ([::1]:58830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM2w6-0003iV-UY
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 02:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1mM2uF-0002Sv-FP
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 02:42:32 -0400
Received: from mga02.intel.com ([134.134.136.20]:17897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1mM2uC-00025E-KU
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 02:42:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="206565061"
X-IronPort-AV: E=Sophos;i="5.85,264,1624345200"; d="scan'208";a="206565061"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 23:42:24 -0700
X-IronPort-AV: E=Sophos;i="5.85,264,1624345200"; d="scan'208";a="533745463"
Received: from jingqili-mobl.ccr.corp.intel.com (HELO [10.254.209.186])
 ([10.254.209.186])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 23:42:21 -0700
Subject: Re: [PATCH v3] hw/i386/acpi-build: Get NUMA information from struct
 NumaState
To: "imammedo@redhat.com" <imammedo@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
References: <20210823011254.28506-1-jingqi.liu@intel.com>
From: "Liu, Jingqi" <jingqi.liu@intel.com>
Message-ID: <4793c8f3-31ba-9aa6-3ffd-db2ff4c1ea26@intel.com>
Date: Fri, 3 Sep 2021 14:42:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210823011254.28506-1-jingqi.liu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=jingqi.liu@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.225,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

Any comments ?

Thanks,
Jingqi

On 8/23/2021 9:12 AM, Liu, Jingqi wrote:
> Since commits aa57020774b ("numa: move numa global variable
> nb_numa_nodes into MachineState") and 7e721e7b10e ("numa: move
> numa global variable numa_info into MachineState"), we can get
> NUMA information completely from MachineState::numa_state.
> 
> Remove PCMachineState::numa_nodes and PCMachineState::node_mem,
> since they are just copied from MachineState::numa_state.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
> ---
>   hw/i386/acpi-build.c | 12 +++++++-----
>   hw/i386/pc.c         |  9 ---------
>   include/hw/i386/pc.h |  4 ----
>   3 files changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 17836149fe..e3c9ad011e 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1902,6 +1902,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>       X86MachineState *x86ms = X86_MACHINE(machine);
>       const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(machine);
>       PCMachineState *pcms = PC_MACHINE(machine);
> +    int nb_numa_nodes = machine->numa_state->num_nodes;
> +    NodeInfo *numa_info = machine->numa_state->nodes;
>       ram_addr_t hotplugabble_address_space_size =
>           object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
>                                   NULL);
> @@ -1945,9 +1947,9 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>       next_base = 0;
>       numa_start = table_data->len;
>   
> -    for (i = 1; i < pcms->numa_nodes + 1; ++i) {
> +    for (i = 1; i < nb_numa_nodes + 1; ++i) {
>           mem_base = next_base;
> -        mem_len = pcms->node_mem[i - 1];
> +        mem_len = numa_info[i - 1].node_mem;
>           next_base = mem_base + mem_len;
>   
>           /* Cut out the 640K hole */
> @@ -1995,7 +1997,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>       }
>   
>       slots = (table_data->len - numa_start) / sizeof *numamem;
> -    for (; slots < pcms->numa_nodes + 2; slots++) {
> +    for (; slots < nb_numa_nodes + 2; slots++) {
>           numamem = acpi_data_push(table_data, sizeof *numamem);
>           build_srat_memory(numamem, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
>       }
> @@ -2011,7 +2013,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>       if (hotplugabble_address_space_size) {
>           numamem = acpi_data_push(table_data, sizeof *numamem);
>           build_srat_memory(numamem, machine->device_memory->base,
> -                          hotplugabble_address_space_size, pcms->numa_nodes - 1,
> +                          hotplugabble_address_space_size, nb_numa_nodes - 1,
>                             MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
>       }
>   
> @@ -2513,7 +2515,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>           }
>       }
>   #endif
> -    if (pcms->numa_nodes) {
> +    if (machine->numa_state->num_nodes) {
>           acpi_add_table(table_offsets, tables_blob);
>           build_srat(tables_blob, tables->linker, machine);
>           if (machine->numa_state->have_numa_distance) {
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c2b9d62a35..adbc348488 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -800,18 +800,9 @@ void pc_machine_done(Notifier *notifier, void *data)
>   
>   void pc_guest_info_init(PCMachineState *pcms)
>   {
> -    int i;
> -    MachineState *ms = MACHINE(pcms);
>       X86MachineState *x86ms = X86_MACHINE(pcms);
>   
>       x86ms->apic_xrupt_override = true;
> -    pcms->numa_nodes = ms->numa_state->num_nodes;
> -    pcms->node_mem = g_malloc0(pcms->numa_nodes *
> -                                    sizeof *pcms->node_mem);
> -    for (i = 0; i < ms->numa_state->num_nodes; i++) {
> -        pcms->node_mem[i] = ms->numa_state->nodes[i].node_mem;
> -    }
> -
>       pcms->machine_done.notify = pc_machine_done;
>       qemu_add_machine_init_done_notifier(&pcms->machine_done);
>   }
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 88dffe7517..31b334e0a4 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -47,10 +47,6 @@ typedef struct PCMachineState {
>       bool default_bus_bypass_iommu;
>       uint64_t max_fw_size;
>   
> -    /* NUMA information: */
> -    uint64_t numa_nodes;
> -    uint64_t *node_mem;
> -
>       /* ACPI Memory hotplug IO base address */
>       hwaddr memhp_io_base;
>   } PCMachineState;
> 

