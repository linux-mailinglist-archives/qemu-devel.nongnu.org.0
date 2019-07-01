Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EBF36A45
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 04:56:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYiaH-0003Ww-JG
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 22:56:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYiYx-00031A-HN
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 22:55:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYiYq-0000VW-0G
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 22:55:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60902)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hYiYm-0000In-6t; Wed, 05 Jun 2019 22:55:26 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27057859FB;
	Thu,  6 Jun 2019 02:55:01 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D70E6838A;
	Thu,  6 Jun 2019 02:54:57 +0000 (UTC)
Date: Wed, 5 Jun 2019 23:54:56 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Message-ID: <20190606025456.GN22416@habkost.net>
References: <20190518205428.90532-1-like.xu@linux.intel.com>
	<20190518205428.90532-5-like.xu@linux.intel.com>
	<20190606025241.GM22416@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606025241.GM22416@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 06 Jun 2019 02:55:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 04/10] hw/ppc: Replace global smp
 variables with machine smp properties
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Alistair Francis <alistair23@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 05, 2019 at 11:52:41PM -0300, Eduardo Habkost wrote:
> On Sun, May 19, 2019 at 04:54:22AM +0800, Like Xu wrote:
> > The global smp variables in ppc are replaced with smp machine properties.
> > 
> > A local variable of the same name would be introduced in the declaration
> > phase if it's used widely in the context OR replace it on the spot if it's
> > only used once. No semantic changes.
> > 
> > Signed-off-by: Like Xu <like.xu@linux.intel.com>
> 
> Any objections from the ppc maintainers to queueing this through
> the Machine Core tree?

Oops, CCing the ppc maintainers.

> 
> > ---
> >  hw/ppc/e500.c         |  3 +++
> >  hw/ppc/mac_newworld.c |  3 ++-
> >  hw/ppc/mac_oldworld.c |  3 ++-
> >  hw/ppc/pnv.c          |  6 ++++--
> >  hw/ppc/prep.c         |  4 ++--
> >  hw/ppc/spapr.c        | 34 ++++++++++++++++++++++++++--------
> >  hw/ppc/spapr_rtas.c   |  4 +++-
> >  7 files changed, 42 insertions(+), 15 deletions(-)
> > 
> > diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> > index beb2efd694..5e42e5a059 100644
> > --- a/hw/ppc/e500.c
> > +++ b/hw/ppc/e500.c
> > @@ -307,6 +307,7 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
> >                                      bool dry_run)
> >  {
> >      MachineState *machine = MACHINE(pms);
> > +    unsigned int smp_cpus = machine->smp.cpus;
> >      const PPCE500MachineClass *pmc = PPCE500_MACHINE_GET_CLASS(pms);
> >      CPUPPCState *env = first_cpu->env_ptr;
> >      int ret = -1;
> > @@ -734,6 +735,7 @@ static DeviceState *ppce500_init_mpic_qemu(PPCE500MachineState *pms,
> >      SysBusDevice *s;
> >      int i, j, k;
> >      MachineState *machine = MACHINE(pms);
> > +    unsigned int smp_cpus = machine->smp.cpus;
> >      const PPCE500MachineClass *pmc = PPCE500_MACHINE_GET_CLASS(pms);
> >  
> >      dev = qdev_create(NULL, TYPE_OPENPIC);
> > @@ -846,6 +848,7 @@ void ppce500_init(MachineState *machine)
> >      struct boot_info *boot_info;
> >      int dt_size;
> >      int i;
> > +    unsigned int smp_cpus = machine->smp.cpus;
> >      /* irq num for pin INTA, INTB, INTC and INTD is 1, 2, 3 and
> >       * 4 respectively */
> >      unsigned int pci_irq_nrs[PCI_NUM_PINS] = {1, 2, 3, 4};
> > diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> > index 02d8559621..257b26ee24 100644
> > --- a/hw/ppc/mac_newworld.c
> > +++ b/hw/ppc/mac_newworld.c
> > @@ -135,6 +135,7 @@ static void ppc_core99_init(MachineState *machine)
> >      DeviceState *dev, *pic_dev;
> >      hwaddr nvram_addr = 0xFFF04000;
> >      uint64_t tbfreq;
> > +    unsigned int smp_cpus = machine->smp.cpus;
> >  
> >      linux_boot = (kernel_filename != NULL);
> >  
> > @@ -464,7 +465,7 @@ static void ppc_core99_init(MachineState *machine)
> >      sysbus_mmio_map(s, 1, CFG_ADDR + 2);
> >  
> >      fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
> > -    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)max_cpus);
> > +    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
> >      fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
> >      fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, machine_arch);
> >      fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, kernel_base);
> > diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> > index 460cbc7923..1968f05a6c 100644
> > --- a/hw/ppc/mac_oldworld.c
> > +++ b/hw/ppc/mac_oldworld.c
> > @@ -99,6 +99,7 @@ static void ppc_heathrow_init(MachineState *machine)
> >      DeviceState *dev, *pic_dev;
> >      BusState *adb_bus;
> >      int bios_size;
> > +    unsigned int smp_cpus = machine->smp.cpus;
> >      uint16_t ppc_boot_device;
> >      DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
> >      void *fw_cfg;
> > @@ -322,7 +323,7 @@ static void ppc_heathrow_init(MachineState *machine)
> >      sysbus_mmio_map(s, 1, CFG_ADDR + 2);
> >  
> >      fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
> > -    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)max_cpus);
> > +    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
> >      fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
> >      fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, ARCH_HEATHROW);
> >      fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, kernel_base);
> > diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> > index 1e8c505936..3bb15338de 100644
> > --- a/hw/ppc/pnv.c
> > +++ b/hw/ppc/pnv.c
> > @@ -678,7 +678,8 @@ static void pnv_init(MachineState *machine)
> >          object_property_add_child(OBJECT(pnv), chip_name, chip, &error_fatal);
> >          object_property_set_int(chip, PNV_CHIP_HWID(i), "chip-id",
> >                                  &error_fatal);
> > -        object_property_set_int(chip, smp_cores, "nr-cores", &error_fatal);
> > +        object_property_set_int(chip, machine->smp.cores,
> > +                                "nr-cores", &error_fatal);
> >          object_property_set_bool(chip, true, "realized", &error_fatal);
> >      }
> >      g_free(chip_typename);
> > @@ -1134,6 +1135,7 @@ static void pnv_chip_instance_init(Object *obj)
> >  
> >  static void pnv_chip_core_realize(PnvChip *chip, Error **errp)
> >  {
> > +    MachineState *ms = MACHINE(qdev_get_machine());
> >      Error *error = NULL;
> >      PnvChipClass *pcc = PNV_CHIP_GET_CLASS(chip);
> >      const char *typename = pnv_chip_core_typename(chip);
> > @@ -1168,7 +1170,7 @@ static void pnv_chip_core_realize(PnvChip *chip, Error **errp)
> >          snprintf(core_name, sizeof(core_name), "core[%d]", core_hwid);
> >          object_property_add_child(OBJECT(chip), core_name, OBJECT(pnv_core),
> >                                    &error_fatal);
> > -        object_property_set_int(OBJECT(pnv_core), smp_threads, "nr-threads",
> > +        object_property_set_int(OBJECT(pnv_core), ms->smp.threads, "nr-threads",
> >                                  &error_fatal);
> >          object_property_set_int(OBJECT(pnv_core), core_hwid,
> >                                  CPU_CORE_PROP_CORE_ID, &error_fatal);
> > diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
> > index b7f459d475..968fd3ade2 100644
> > --- a/hw/ppc/prep.c
> > +++ b/hw/ppc/prep.c
> > @@ -428,7 +428,7 @@ static void ppc_prep_init(MachineState *machine)
> >      linux_boot = (kernel_filename != NULL);
> >  
> >      /* init CPUs */
> > -    for (i = 0; i < smp_cpus; i++) {
> > +    for (i = 0; i < machine->smp.cpus; i++) {
> >          cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
> >          env = &cpu->env;
> >  
> > @@ -765,7 +765,7 @@ static void ibm_40p_init(MachineState *machine)
> >          boot_device = machine->boot_order[0];
> >      }
> >  
> > -    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)max_cpus);
> > +    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
> >      fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
> >      fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, ARCH_PREP);
> >  
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index 7fb34decb9..25da337f84 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -105,6 +105,9 @@
> >   */
> >  static int spapr_vcpu_id(SpaprMachineState *spapr, int cpu_index)
> >  {
> > +    MachineState *ms = MACHINE(spapr);
> > +    unsigned int smp_threads = ms->smp.threads;
> > +
> >      assert(spapr->vsmt);
> >      return
> >          (cpu_index / smp_threads) * spapr->vsmt + cpu_index % smp_threads;
> > @@ -152,8 +155,10 @@ static void pre_2_10_vmstate_unregister_dummy_icp(int i)
> >  
> >  int spapr_max_server_number(SpaprMachineState *spapr)
> >  {
> > +    MachineState *ms = MACHINE(spapr);
> > +
> >      assert(spapr->vsmt);
> > -    return DIV_ROUND_UP(max_cpus * spapr->vsmt, smp_threads);
> > +    return DIV_ROUND_UP(ms->smp.max_cpus * spapr->vsmt, ms->smp.threads);
> >  }
> >  
> >  static int spapr_fixup_cpu_smt_dt(void *fdt, int offset, PowerPCCPU *cpu,
> > @@ -286,6 +291,7 @@ static void spapr_populate_pa_features(SpaprMachineState *spapr,
> >  
> >  static int spapr_fixup_cpu_dt(void *fdt, SpaprMachineState *spapr)
> >  {
> > +    MachineState *ms = MACHINE(spapr);
> >      int ret = 0, offset, cpus_offset;
> >      CPUState *cs;
> >      char cpu_model[32];
> > @@ -295,7 +301,7 @@ static int spapr_fixup_cpu_dt(void *fdt, SpaprMachineState *spapr)
> >          PowerPCCPU *cpu = POWERPC_CPU(cs);
> >          DeviceClass *dc = DEVICE_GET_CLASS(cs);
> >          int index = spapr_get_vcpu_id(cpu);
> > -        int compat_smt = MIN(smp_threads, ppc_compat_max_vthreads(cpu));
> > +        int compat_smt = MIN(ms->smp.threads, ppc_compat_max_vthreads(cpu));
> >  
> >          if (!spapr_is_thread0_in_vcore(spapr, cpu)) {
> >              continue;
> > @@ -441,6 +447,7 @@ static int spapr_populate_memory(SpaprMachineState *spapr, void *fdt)
> >  static void spapr_populate_cpu_dt(CPUState *cs, void *fdt, int offset,
> >                                    SpaprMachineState *spapr)
> >  {
> > +    MachineState *ms = MACHINE(spapr);
> >      PowerPCCPU *cpu = POWERPC_CPU(cs);
> >      CPUPPCState *env = &cpu->env;
> >      PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cs);
> > @@ -452,7 +459,8 @@ static void spapr_populate_cpu_dt(CPUState *cs, void *fdt, int offset,
> >      uint32_t cpufreq = kvm_enabled() ? kvmppc_get_clockfreq() : 1000000000;
> >      uint32_t page_sizes_prop[64];
> >      size_t page_sizes_prop_size;
> > -    uint32_t vcpus_per_socket = smp_threads * smp_cores;
> > +    unsigned int smp_threads = ms->smp.threads;
> > +    uint32_t vcpus_per_socket = smp_threads * ms->smp.cores;
> >      uint32_t pft_size_prop[] = {0, cpu_to_be32(spapr->htab_shift)};
> >      int compat_smt = MIN(smp_threads, ppc_compat_max_vthreads(cpu));
> >      SpaprDrc *drc;
> > @@ -1022,6 +1030,7 @@ int spapr_h_cas_compose_response(SpaprMachineState *spapr,
> >  
> >  static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
> >  {
> > +    MachineState *ms = MACHINE(spapr);
> >      int rtas;
> >      GString *hypertas = g_string_sized_new(256);
> >      GString *qemu_hypertas = g_string_sized_new(256);
> > @@ -1032,7 +1041,7 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
> >          cpu_to_be32(max_device_addr >> 32),
> >          cpu_to_be32(max_device_addr & 0xffffffff),
> >          0, cpu_to_be32(SPAPR_MEMORY_BLOCK_SIZE),
> > -        cpu_to_be32(max_cpus / smp_threads),
> > +        cpu_to_be32(ms->smp.max_cpus / ms->smp.threads),
> >      };
> >      uint32_t maxdomain = cpu_to_be32(spapr->gpu_numa_id > 1 ? 1 : 0);
> >      uint32_t maxdomains[] = {
> > @@ -2540,7 +2549,7 @@ static void spapr_validate_node_memory(MachineState *machine, Error **errp)
> >  /* find cpu slot in machine->possible_cpus by core_id */
> >  static CPUArchId *spapr_find_cpu_slot(MachineState *ms, uint32_t id, int *idx)
> >  {
> > -    int index = id / smp_threads;
> > +    int index = id / ms->smp.threads;
> >  
> >      if (index >= ms->possible_cpus->len) {
> >          return NULL;
> > @@ -2553,10 +2562,12 @@ static CPUArchId *spapr_find_cpu_slot(MachineState *ms, uint32_t id, int *idx)
> >  
> >  static void spapr_set_vsmt_mode(SpaprMachineState *spapr, Error **errp)
> >  {
> > +    MachineState *ms = MACHINE(spapr);
> >      Error *local_err = NULL;
> >      bool vsmt_user = !!spapr->vsmt;
> >      int kvm_smt = kvmppc_smt_threads();
> >      int ret;
> > +    unsigned int smp_threads = ms->smp.threads;
> >  
> >      if (!kvm_enabled() && (smp_threads > 1)) {
> >          error_setg(&local_err, "TCG cannot support more than 1 thread/core "
> > @@ -2630,6 +2641,9 @@ static void spapr_init_cpus(SpaprMachineState *spapr)
> >      SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
> >      const char *type = spapr_get_cpu_core_type(machine->cpu_type);
> >      const CPUArchIdList *possible_cpus;
> > +    unsigned int smp_cpus = machine->smp.cpus;
> > +    unsigned int smp_threads = machine->smp.threads;
> > +    unsigned int max_cpus = machine->smp.max_cpus;
> >      int boot_cores_nr = smp_cpus / smp_threads;
> >      int i;
> >  
> > @@ -3856,6 +3870,7 @@ static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
> >      const char *type = object_get_typename(OBJECT(dev));
> >      CPUArchId *core_slot;
> >      int index;
> > +    unsigned int smp_threads = machine->smp.threads;
> >  
> >      if (dev->hotplugged && !mc->has_hotpluggable_cpus) {
> >          error_setg(&local_err, "CPU hotplug not supported for this machine");
> > @@ -4110,14 +4125,16 @@ spapr_cpu_index_to_props(MachineState *machine, unsigned cpu_index)
> >  
> >  static int64_t spapr_get_default_cpu_node_id(const MachineState *ms, int idx)
> >  {
> > -    return idx / smp_cores % nb_numa_nodes;
> > +    return idx / ms->smp.cores % nb_numa_nodes;
> >  }
> >  
> >  static const CPUArchIdList *spapr_possible_cpu_arch_ids(MachineState *machine)
> >  {
> >      int i;
> > +    unsigned int smp_threads = machine->smp.threads;
> > +    unsigned int smp_cpus = machine->smp.cpus;
> >      const char *core_type;
> > -    int spapr_max_cores = max_cpus / smp_threads;
> > +    int spapr_max_cores = machine->smp.max_cpus / smp_threads;
> >      MachineClass *mc = MACHINE_GET_CLASS(machine);
> >  
> >      if (!mc->has_hotpluggable_cpus) {
> > @@ -4240,6 +4257,7 @@ int spapr_get_vcpu_id(PowerPCCPU *cpu)
> >  void spapr_set_vcpu_id(PowerPCCPU *cpu, int cpu_index, Error **errp)
> >  {
> >      SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
> > +    MachineState *ms = MACHINE(spapr);
> >      int vcpu_id;
> >  
> >      vcpu_id = spapr_vcpu_id(spapr, cpu_index);
> > @@ -4248,7 +4266,7 @@ void spapr_set_vcpu_id(PowerPCCPU *cpu, int cpu_index, Error **errp)
> >          error_setg(errp, "Can't create CPU with id %d in KVM", vcpu_id);
> >          error_append_hint(errp, "Adjust the number of cpus to %d "
> >                            "or try to raise the number of threads per core\n",
> > -                          vcpu_id * smp_threads / spapr->vsmt);
> > +                          vcpu_id * ms->smp.threads / spapr->vsmt);
> >          return;
> >      }
> >  
> > diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> > index ee24212765..c9ffe9786c 100644
> > --- a/hw/ppc/spapr_rtas.c
> > +++ b/hw/ppc/spapr_rtas.c
> > @@ -231,6 +231,8 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU *cpu,
> >                                            target_ulong args,
> >                                            uint32_t nret, target_ulong rets)
> >  {
> > +    MachineState *ms = MACHINE(qdev_get_machine());
> > +    unsigned int max_cpus = ms->smp.max_cpus;
> >      target_ulong parameter = rtas_ld(args, 0);
> >      target_ulong buffer = rtas_ld(args, 1);
> >      target_ulong length = rtas_ld(args, 2);
> > @@ -244,7 +246,7 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU *cpu,
> >                                            "MaxPlatProcs=%d",
> >                                            max_cpus,
> >                                            current_machine->ram_size / MiB,
> > -                                          smp_cpus,
> > +                                          ms->smp.cpus,
> >                                            max_cpus);
> >          ret = sysparm_st(buffer, length, param_val, strlen(param_val) + 1);
> >          g_free(param_val);
> > -- 
> > 2.21.0
> > 
> > 
> 
> -- 
> Eduardo

-- 
Eduardo

