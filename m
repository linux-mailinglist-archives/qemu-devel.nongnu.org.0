Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0736B36A4C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 05:01:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53432 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYif7-0007CZ-7N
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 23:01:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYidR-0006Ru-Cm
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 23:00:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYidQ-0002N4-0I
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 23:00:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:24911)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hYidP-0002Kp-Nf
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 23:00:11 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA0CD30832C8;
	Thu,  6 Jun 2019 03:00:10 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C04C5648C4;
	Thu,  6 Jun 2019 03:00:09 +0000 (UTC)
Date: Thu, 6 Jun 2019 00:00:08 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Message-ID: <20190606030008.GR22416@habkost.net>
References: <20190518205428.90532-1-like.xu@linux.intel.com>
	<20190518205428.90532-10-like.xu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190518205428.90532-10-like.xu@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 06 Jun 2019 03:00:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 09/10] hw: Replace global smp variables
 with MachineState for all remaining archs
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jia Liu <proljc@gmail.com>,
	Paul Burton <pburton@wavecomp.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Alistair Francis <alistair23@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 19, 2019 at 04:54:27AM +0800, Like Xu wrote:
> The global smp variables in alpha/hppa/mips/openrisc/sparc*/xtensa codes
> are replaced with smp properties from MachineState.
> 
> A local variable of the same name would be introduced in the declaration
> phase if it's used widely in the context OR replace it on the spot if it's
> only used once. No semantic changes.
> 
> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

CCing the maintainers for those machines.  Any objections to merging this
through the Machine Core tree?

> ---
>  hw/alpha/dp264.c           | 1 +
>  hw/hppa/machine.c          | 2 ++
>  hw/mips/boston.c           | 2 +-
>  hw/mips/mips_malta.c       | 2 ++
>  hw/openrisc/openrisc_sim.c | 1 +
>  hw/sparc/sun4m.c           | 2 ++
>  hw/sparc64/sun4u.c         | 4 ++--
>  hw/xtensa/sim.c            | 2 +-
>  hw/xtensa/xtfpga.c         | 1 +
>  9 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
> index 0347eb897c..9dfb835013 100644
> --- a/hw/alpha/dp264.c
> +++ b/hw/alpha/dp264.c
> @@ -63,6 +63,7 @@ static void clipper_init(MachineState *machine)
>      char *palcode_filename;
>      uint64_t palcode_entry, palcode_low, palcode_high;
>      uint64_t kernel_entry, kernel_low, kernel_high;
> +    unsigned int smp_cpus = machine->smp.cpus;
>  
>      /* Create up to 4 cpus.  */
>      memset(cpus, 0, sizeof(cpus));
> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
> index 416e67bab1..662838d83b 100644
> --- a/hw/hppa/machine.c
> +++ b/hw/hppa/machine.c
> @@ -72,6 +72,7 @@ static void machine_hppa_init(MachineState *machine)
>      MemoryRegion *ram_region;
>      MemoryRegion *cpu_region;
>      long i;
> +    unsigned int smp_cpus = machine->smp.cpus;
>  
>      ram_size = machine->ram_size;
>  
> @@ -242,6 +243,7 @@ static void machine_hppa_init(MachineState *machine)
>  
>  static void hppa_machine_reset(MachineState *ms)
>  {
> +    unsigned int smp_cpus = ms->smp.cpus;
>      int i;
>  
>      qemu_devices_reset();
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index a8b29f62f5..ccbfac54ef 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -460,7 +460,7 @@ static void boston_mach_init(MachineState *machine)
>  
>      object_property_set_str(OBJECT(s->cps), machine->cpu_type, "cpu-type",
>                              &err);
> -    object_property_set_int(OBJECT(s->cps), smp_cpus, "num-vp", &err);
> +    object_property_set_int(OBJECT(s->cps), machine->smp.cpus, "num-vp", &err);
>      object_property_set_bool(OBJECT(s->cps), true, "realized", &err);
>  
>      if (err != NULL) {
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index 5fe9512c24..ead5976d1a 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -1095,6 +1095,8 @@ static int64_t load_kernel (void)
>  
>  static void malta_mips_config(MIPSCPU *cpu)
>  {
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    unsigned int smp_cpus = ms->smp.cpus;
>      CPUMIPSState *env = &cpu->env;
>      CPUState *cs = CPU(cpu);
>  
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index 0a906d815e..8d828e78ee 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -131,6 +131,7 @@ static void openrisc_sim_init(MachineState *machine)
>      qemu_irq *cpu_irqs[2];
>      qemu_irq serial_irq;
>      int n;
> +    unsigned int smp_cpus = machine->smp.cpus;
>  
>      for (n = 0; n < smp_cpus; n++) {
>          cpu = OPENRISC_CPU(cpu_create(machine->cpu_type));
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 07d126aea8..5c3739f2ef 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -852,6 +852,8 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
>      FWCfgState *fw_cfg;
>      DeviceState *dev;
>      SysBusDevice *s;
> +    unsigned int smp_cpus = machine->smp.cpus;
> +    unsigned int max_cpus = machine->smp.max_cpus;
>  
>      /* init CPUs */
>      for(i = 0; i < smp_cpus; i++) {
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index 399f2d73c8..0807f274bf 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -678,8 +678,8 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
>                                  &FW_CFG_IO(dev)->comb_iomem);
>  
>      fw_cfg = FW_CFG(dev);
> -    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
> -    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)max_cpus);
> +    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)machine->smp.cpus);
> +    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
>      fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
>      fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, hwdef->machine_id);
>      fw_cfg_add_i64(fw_cfg, FW_CFG_KERNEL_ADDR, kernel_entry);
> diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
> index 12c7437398..a4eef76fbc 100644
> --- a/hw/xtensa/sim.c
> +++ b/hw/xtensa/sim.c
> @@ -60,7 +60,7 @@ static void xtensa_sim_init(MachineState *machine)
>      const char *kernel_filename = machine->kernel_filename;
>      int n;
>  
> -    for (n = 0; n < smp_cpus; n++) {
> +    for (n = 0; n < machine->smp.cpus; n++) {
>          cpu = XTENSA_CPU(cpu_create(machine->cpu_type));
>          env = &cpu->env;
>  
> diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
> index e05ef75a75..f7f3e11e93 100644
> --- a/hw/xtensa/xtfpga.c
> +++ b/hw/xtensa/xtfpga.c
> @@ -238,6 +238,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
>      const unsigned system_io_size = 224 * MiB;
>      uint32_t freq = 10000000;
>      int n;
> +    unsigned int smp_cpus = machine->smp.cpus;
>  
>      if (smp_cpus > 1) {
>          mx_pic = xtensa_mx_pic_init(31);
> -- 
> 2.21.0
> 
> 

-- 
Eduardo

