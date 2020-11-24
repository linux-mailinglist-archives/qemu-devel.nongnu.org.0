Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7BF2C3443
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 23:59:34 +0100 (CET)
Received: from localhost ([::1]:59460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khhHX-00062E-1h
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 17:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1khhGW-0005Zz-7a
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 17:58:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1khhGT-0008Fa-7O
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 17:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606258702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/GATtHNDQeMebO9zPMgrVytGKAKZUK2W72RqL2jgBYw=;
 b=X5o1qMAZpGqBu8p1RoR4fyUnjN4jtfTA/h8Fc26Qaon1Rh80X4POIuT/udlOEizA05E09O
 HeggLqSWisTzhaCZZxzdjyv27kQ/TJ3jhvaVsEw+6DoJ+ePuPORT2uEvTicOAai+pFXrdF
 qSL4GWpOwOxVNA1A7S/QqNJysF5EBso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-lTa96a99MBCtT5geAhNMbA-1; Tue, 24 Nov 2020 17:58:20 -0500
X-MC-Unique: lTa96a99MBCtT5geAhNMbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CE438B94E0;
 Tue, 24 Nov 2020 22:58:19 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-25.ams2.redhat.com
 [10.36.112.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8ABE05D9C0;
 Tue, 24 Nov 2020 22:58:18 +0000 (UTC)
Subject: Re: [RFC] ich9:cpuhp: add support for cpu hot-unplug with SMI
 broadcast enabled
To: Igor Mammedov <imammedo@redhat.com>, ankur.a.arora@oracle.com
References: <20201124122507.1014839-1-imammedo@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <6e0deb27-a94a-9d35-e9bf-28c28b80bde0@redhat.com>
Date: Tue, 24 Nov 2020 23:58:17 +0100
MIME-Version: 1.0
In-Reply-To: <20201124122507.1014839-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/20 13:25, Igor Mammedov wrote:
> If firmware negotiates ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT feature,
> OSPM on CPU eject will set bit #4 in CPU hotplug block for to be
> ejected CPU to mark it for removal by firmware and trigger SMI
> upcall to let firmware do actual eject.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> PS:
>   - abuse 5.1 machine type for now to turn off unplug feature
>     (it will be moved to 5.2 machine type once new merge window is open)
> ---
>  include/hw/acpi/cpu.h           |  2 ++
>  docs/specs/acpi_cpu_hotplug.txt | 11 +++++++++--
>  hw/acpi/cpu.c                   | 18 ++++++++++++++++--
>  hw/i386/acpi-build.c            |  5 +++++
>  hw/i386/pc.c                    |  1 +
>  hw/isa/lpc_ich9.c               |  2 +-
>  6 files changed, 34 insertions(+), 5 deletions(-)

Thanks -- I've tagged this for later; I can't tell when I'll come to it.
I'll have to re-read the previous discussion, from start of October, first.

Ankur -- please feel free to comment!

Thanks
Laszlo

> 
> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> index 0eeedaa491..999caaf510 100644
> --- a/include/hw/acpi/cpu.h
> +++ b/include/hw/acpi/cpu.h
> @@ -22,6 +22,7 @@ typedef struct AcpiCpuStatus {
>      uint64_t arch_id;
>      bool is_inserting;
>      bool is_removing;
> +    bool fw_remove;
>      uint32_t ost_event;
>      uint32_t ost_status;
>  } AcpiCpuStatus;
> @@ -50,6 +51,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
>  typedef struct CPUHotplugFeatures {
>      bool acpi_1_compatible;
>      bool has_legacy_cphp;
> +    bool fw_unplugs_cpu;
>      const char *smi_path;
>  } CPUHotplugFeatures;
>  
> diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hotplug.txt
> index 9bb22d1270..f68ef6e06c 100644
> --- a/docs/specs/acpi_cpu_hotplug.txt
> +++ b/docs/specs/acpi_cpu_hotplug.txt
> @@ -57,7 +57,11 @@ read access:
>                It's valid only when bit 0 is set.
>             2: Device remove event, used to distinguish device for which
>                no device eject request to OSPM was issued.
> -           3-7: reserved and should be ignored by OSPM
> +           3: reserved and should be ignored by OSPM
> +           4: if set to 1, OSPM requests firmware to perform device eject,
> +              firmware shall clear this event by writing 1 into it before
> +              performing device eject.
> +           5-7: reserved and should be ignored by OSPM
>      [0x5-0x7] reserved
>      [0x8] Command data: (DWORD access)
>            contains 0 unless value last stored in 'Command field' is one of:
> @@ -82,7 +86,10 @@ write access:
>                 selected CPU device
>              3: if set to 1 initiates device eject, set by OSPM when it
>                 triggers CPU device removal and calls _EJ0 method
> -            4-7: reserved, OSPM must clear them before writing to register
> +            4: if set to 1 OSPM hands over device eject to firmware,
> +               Firmware shall issue device eject request as described above
> +               (bit #3) and OSPM should not touch device eject bit (#3),
> +            5-7: reserved, OSPM must clear them before writing to register
>      [0x5] Command field: (1 byte access)
>            value:
>              0: selects a CPU device with inserting/removing events and
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index f099b50927..09d2f20dae 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -71,6 +71,7 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr addr, unsigned size)
>          val |= cdev->cpu ? 1 : 0;
>          val |= cdev->is_inserting ? 2 : 0;
>          val |= cdev->is_removing  ? 4 : 0;
> +        val |= cdev->fw_remove  ? 16 : 0;
>          trace_cpuhp_acpi_read_flags(cpu_st->selector, val);
>          break;
>      case ACPI_CPU_CMD_DATA_OFFSET_RW:
> @@ -148,6 +149,8 @@ static void cpu_hotplug_wr(void *opaque, hwaddr addr, uint64_t data,
>              hotplug_ctrl = qdev_get_hotplug_handler(dev);
>              hotplug_handler_unplug(hotplug_ctrl, dev, NULL);
>              object_unparent(OBJECT(dev));
> +        } else if (data & 16) {
> +            cdev->fw_remove = !cdev->fw_remove;
>          }
>          break;
>      case ACPI_CPU_CMD_OFFSET_WR:
> @@ -332,6 +335,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
>  #define CPU_INSERT_EVENT  "CINS"
>  #define CPU_REMOVE_EVENT  "CRMV"
>  #define CPU_EJECT_EVENT   "CEJ0"
> +#define CPU_FW_EJECT_EVENT "CEJF"
>  
>  void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>                      hwaddr io_base,
> @@ -384,7 +388,10 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>          aml_append(field, aml_named_field(CPU_REMOVE_EVENT, 1));
>          /* initiates device eject, write only */
>          aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));
> -        aml_append(field, aml_reserved_field(4));
> +        aml_append(field, aml_reserved_field(1));
> +        /* tell firmware to do device eject, write only */
> +        aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
> +        aml_append(field, aml_reserved_field(2));
>          aml_append(field, aml_named_field(CPU_COMMAND, 8));
>          aml_append(cpu_ctrl_dev, field);
>  
> @@ -419,6 +426,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>          Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
>          Aml *rm_evt = aml_name("%s.%s", cphp_res_path, CPU_REMOVE_EVENT);
>          Aml *ej_evt = aml_name("%s.%s", cphp_res_path, CPU_EJECT_EVENT);
> +        Aml *fw_ej_evt = aml_name("%s.%s", cphp_res_path, CPU_FW_EJECT_EVENT);
>  
>          aml_append(cpus_dev, aml_name_decl("_HID", aml_string("ACPI0010")));
>          aml_append(cpus_dev, aml_name_decl("_CID", aml_eisaid("PNP0A05")));
> @@ -461,7 +469,13 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>  
>              aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
>              aml_append(method, aml_store(idx, cpu_selector));
> -            aml_append(method, aml_store(one, ej_evt));
> +            if (opts.fw_unplugs_cpu) {
> +                aml_append(method, aml_store(one, fw_ej_evt));
> +                aml_append(method, aml_store(aml_int(OVMF_CPUHP_SMI_CMD),
> +                           aml_name("%s", opts.smi_path)));
> +            } else {
> +                aml_append(method, aml_store(one, ej_evt));
> +            }
>              aml_append(method, aml_release(ctrl_lock));
>          }
>          aml_append(cpus_dev, method);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 1f5c211245..475e76f514 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -96,6 +96,7 @@ typedef struct AcpiPmInfo {
>      bool s4_disabled;
>      bool pcihp_bridge_en;
>      bool smi_on_cpuhp;
> +    bool smi_on_cpu_unplug;
>      bool pcihp_root_en;
>      uint8_t s4_val;
>      AcpiFadtData fadt;
> @@ -197,6 +198,7 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
>      pm->pcihp_io_base = 0;
>      pm->pcihp_io_len = 0;
>      pm->smi_on_cpuhp = false;
> +    pm->smi_on_cpu_unplug = false;
>  
>      assert(obj);
>      init_common_fadt_data(machine, obj, &pm->fadt);
> @@ -220,6 +222,8 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
>          pm->cpu_hp_io_base = ICH9_CPU_HOTPLUG_IO_BASE;
>          pm->smi_on_cpuhp =
>              !!(smi_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT));
> +        pm->smi_on_cpu_unplug =
> +            !!(smi_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT));
>      }
>  
>      /* The above need not be conditional on machine type because the reset port
> @@ -1582,6 +1586,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          CPUHotplugFeatures opts = {
>              .acpi_1_compatible = true, .has_legacy_cphp = true,
>              .smi_path = pm->smi_on_cpuhp ? "\\_SB.PCI0.SMI0.SMIC" : NULL,
> +            .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
>          };
>          build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
>                         "\\_SB.PCI0", "\\_GPE._E02");
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 17b514d1da..2952a00fe6 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -99,6 +99,7 @@
>  
>  GlobalProperty pc_compat_5_1[] = {
>      { "ICH9-LPC", "x-smi-cpu-hotplug", "off" },
> +    { "ICH9-LPC", "x-smi-cpu-hotunplug", "off" },
>  };
>  const size_t pc_compat_5_1_len = G_N_ELEMENTS(pc_compat_5_1);
>  
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index 087a18d04d..8c667b7166 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -770,7 +770,7 @@ static Property ich9_lpc_properties[] = {
>      DEFINE_PROP_BIT64("x-smi-cpu-hotplug", ICH9LPCState, smi_host_features,
>                        ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT, true),
>      DEFINE_PROP_BIT64("x-smi-cpu-hotunplug", ICH9LPCState, smi_host_features,
> -                      ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT, false),
> +                      ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> 


