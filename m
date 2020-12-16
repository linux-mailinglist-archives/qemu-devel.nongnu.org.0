Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9635B2DBD41
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:07:43 +0100 (CET)
Received: from localhost ([::1]:37218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpSmc-00029v-Jl
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kpSgz-0006hV-CQ; Wed, 16 Dec 2020 04:01:53 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kpSgp-0004CN-LC; Wed, 16 Dec 2020 04:01:52 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Cwpxw6j6hz79S7;
 Wed, 16 Dec 2020 17:00:52 +0800 (CST)
Received: from [10.174.186.67] (10.174.186.67) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 17:01:24 +0800
Subject: Re: [PATCH] hw/arm/virt: Remove virt machine state 'smp_cpus'
To: Andrew Jones <drjones@redhat.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
References: <20201215174815.51520-1-drjones@redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <c5cb536d-d293-cff8-1bae-c80d513d4b69@huawei.com>
Date: Wed, 16 Dec 2020 17:01:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201215174815.51520-1-drjones@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=fangying1@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, salil.mehta@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/16/2020 1:48 AM, Andrew Jones wrote:
> virt machine's 'smp_cpus' and machine->smp.cpus must always have the
> same value. And, anywhere we have virt machine state we have machine
> state. So let's remove the redundancy. Also, to make it easier to see
> that machine->smp is the true source for "smp_cpus" and "max_cpus",
> avoid passing them in function parameters, preferring instead to get
> them from the state.
> 
> No functional change intended.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Reviewed-by: Ying Fang <fangying1@huawei.com>

> ---
>   hw/arm/virt-acpi-build.c |  9 +++++----
>   hw/arm/virt.c            | 24 +++++++++++-------------
>   include/hw/arm/virt.h    |  3 +--
>   3 files changed, 17 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 711cf2069fe8..9d9ee2405345 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -59,11 +59,12 @@
>   
>   #define ACPI_BUILD_TABLE_SIZE             0x20000
>   
> -static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
> +static void acpi_dsdt_add_cpus(Aml *scope, VirtMachineState *vms)
>   {
> +    MachineState *ms = MACHINE(vms);
>       uint16_t i;
>   
> -    for (i = 0; i < smp_cpus; i++) {
> +    for (i = 0; i < ms->smp.cpus; i++) {
>           Aml *dev = aml_device("C%.03X", i);
>           aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
>           aml_append(dev, aml_name_decl("_UID", aml_int(i)));
> @@ -484,7 +485,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>       gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
>       gicd->version = vms->gic_version;
>   
> -    for (i = 0; i < vms->smp_cpus; i++) {
> +    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
>           AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
>                                                              sizeof(*gicc));
>           ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
> @@ -603,7 +604,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>        * the RTC ACPI device at all when using UEFI.
>        */
>       scope = aml_scope("\\_SB");
> -    acpi_dsdt_add_cpus(scope, vms->smp_cpus);
> +    acpi_dsdt_add_cpus(scope, vms);
>       acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                          (irqmap[VIRT_UART] + ARM_SPI_BASE));
>       if (vmc->acpi_expose_flash) {
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 556592012ee0..534d306f3104 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -323,7 +323,7 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
>       if (vms->gic_version == VIRT_GIC_VERSION_2) {
>           irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
>                                GIC_FDT_IRQ_PPI_CPU_WIDTH,
> -                             (1 << vms->smp_cpus) - 1);
> +                             (1 << MACHINE(vms)->smp.cpus) - 1);
>       }
>   
>       qemu_fdt_add_subnode(vms->fdt, "/timer");
> @@ -347,9 +347,9 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
>   
>   static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>   {
> -    int cpu;
> -    int addr_cells = 1;
>       const MachineState *ms = MACHINE(vms);
> +    int smp_cpus = ms->smp.cpus, cpu;
> +    int addr_cells = 1;
>   
>       /*
>        * From Documentation/devicetree/bindings/arm/cpus.txt
> @@ -364,7 +364,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>        *  The simplest way to go is to examine affinity IDs of all our CPUs. If
>        *  at least one of them has Aff3 populated, we set #address-cells to 2.
>        */
> -    for (cpu = 0; cpu < vms->smp_cpus; cpu++) {
> +    for (cpu = 0; cpu < smp_cpus; cpu++) {
>           ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
>   
>           if (armcpu->mp_affinity & ARM_AFF3_MASK) {
> @@ -377,7 +377,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>       qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#address-cells", addr_cells);
>       qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#size-cells", 0x0);
>   
> -    for (cpu = vms->smp_cpus - 1; cpu >= 0; cpu--) {
> +    for (cpu = smp_cpus - 1; cpu >= 0; cpu--) {
>           char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
>           ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
>           CPUState *cs = CPU(armcpu);
> @@ -387,8 +387,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>           qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
>                                       armcpu->dtb_compatible);
>   
> -        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED
> -            && vms->smp_cpus > 1) {
> +        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED && smp_cpus > 1) {
>               qemu_fdt_setprop_string(vms->fdt, nodename,
>                                           "enable-method", "psci");
>           }
> @@ -534,7 +533,7 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
>       if (vms->gic_version == VIRT_GIC_VERSION_2) {
>           irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
>                                GIC_FDT_IRQ_PPI_CPU_WIDTH,
> -                             (1 << vms->smp_cpus) - 1);
> +                             (1 << MACHINE(vms)->smp.cpus) - 1);
>       }
>   
>       qemu_fdt_add_subnode(vms->fdt, "/pmu");
> @@ -1673,9 +1672,9 @@ static void finalize_gic_version(VirtMachineState *vms)
>    * virt_cpu_post_init() must be called after the CPUs have
>    * been realized and the GIC has been created.
>    */
> -static void virt_cpu_post_init(VirtMachineState *vms, int max_cpus,
> -                               MemoryRegion *sysmem)
> +static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
>   {
> +    int max_cpus = MACHINE(vms)->smp.max_cpus;
>       bool aarch64, pmu, steal_time;
>       CPUState *cpu;
>   
> @@ -1828,8 +1827,6 @@ static void machvirt_init(MachineState *machine)
>           exit(1);
>       }
>   
> -    vms->smp_cpus = smp_cpus;
> -
>       if (vms->virt && kvm_enabled()) {
>           error_report("mach-virt: KVM does not support providing "
>                        "Virtualization extensions to the guest CPU");
> @@ -1845,6 +1842,7 @@ static void machvirt_init(MachineState *machine)
>       create_fdt(vms);
>   
>       possible_cpus = mc->possible_cpu_arch_ids(machine);
> +    assert(possible_cpus->len == max_cpus);
>       for (n = 0; n < possible_cpus->len; n++) {
>           Object *cpuobj;
>           CPUState *cs;
> @@ -1965,7 +1963,7 @@ static void machvirt_init(MachineState *machine)
>   
>       create_gic(vms);
>   
> -    virt_cpu_post_init(vms, possible_cpus->len, sysmem);
> +    virt_cpu_post_init(vms, sysmem);
>   
>       fdt_add_pmu_nodes(vms);
>   
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index abf54fab4981..e4a2d216420f 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -151,7 +151,6 @@ struct VirtMachineState {
>       MemMapEntry *memmap;
>       char *pciehb_nodename;
>       const int *irqmap;
> -    int smp_cpus;
>       void *fdt;
>       int fdt_size;
>       uint32_t clock_phandle;
> @@ -182,7 +181,7 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
>   
>       assert(vms->gic_version == VIRT_GIC_VERSION_3);
>   
> -    return vms->smp_cpus > redist0_capacity ? 2 : 1;
> +    return MACHINE(vms)->smp.cpus > redist0_capacity ? 2 : 1;
>   }
>   
>   #endif /* QEMU_ARM_VIRT_H */
> 

