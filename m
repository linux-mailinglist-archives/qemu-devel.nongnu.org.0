Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119072C52C4
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:19:09 +0100 (CET)
Received: from localhost ([::1]:35622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFIq-000313-4P
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kiFHN-0002Fc-4l
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:17:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kiFHK-0001aF-53
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:17:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606389453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvEN6f5rITVpP6jGup2+x79Fcv67oaPE1sw+VfKSvEM=;
 b=cLFpLlnzLt2psaOvQKJZ1Ol+nu6M69Q1oNItI6GzFwlA+X6FmpRMcaaLB6cH7Cs6Ku4MLb
 3iI86n4/igJ7wDeB6ZZXVc6Mq/HxpC00uyaOWjEFpyrcTJDhyhxf8905chA7cgDOhT3frm
 THNs1GHAOMvva08vsBvXdh69bhmXb8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-tDYpWEmqNWu3p_VI8BKM3A-1; Thu, 26 Nov 2020 06:17:30 -0500
X-MC-Unique: tDYpWEmqNWu3p_VI8BKM3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 348A51005D5C;
 Thu, 26 Nov 2020 11:17:29 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-34.ams2.redhat.com
 [10.36.113.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16B9619C71;
 Thu, 26 Nov 2020 11:17:27 +0000 (UTC)
Subject: Re: [RFC] ich9:cpuhp: add support for cpu hot-unplug with SMI
 broadcast enabled
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20201124122507.1014839-1-imammedo@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <bf87cef4-cac9-1c1b-5bd4-c6bc97dff994@redhat.com>
Date: Thu, 26 Nov 2020 12:17:27 +0100
MIME-Version: 1.0
In-Reply-To: <20201124122507.1014839-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: ankur.a.arora@oracle.com
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

(1) s/clear this event/clear this event bit/

> +              performing device eject.

(2) move the second and third lines ("firmware shall clear....") over to
the write documentation, below? In particular:

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

(3) it would be clearer if we documented the exact bit writing order
here:
- clear bit#4, *then* set bit#3 (two write accesses)
- versus clear bit#4 *and* set bit#3 (single access)



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

hm... so I guess the ACPI code will first write bit#4 to flip
"fw_remove" from "off" to "on". Then the firmware will write bit#4 to
flip "fw_remove" back  to "off". And finally, the firmware will write
bit#3 (strictly as a separate access) to unplug the CPU.

(4) But anyway, taking a step back: what do we need the new bit for?

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

Hmmm, OK, let me parse this.

Assume there is a big bunch of device_del QMP commands, QEMU marks the
"remove" event pending on the corresponding set of CPUs, plus also makes
the ACPI interrupt pending. The ACPI interrupt handler in the OS runs,
and calls CSCN. CSCN runs a loop, and for each CPU where the remove
event is pending, notifies the OS one by one. The OS in turn forgets
about the subject CPU, and calls the _EJ0 method on the affected CPU
ACPI object. The _EJ0 method on the CPU ACPI object calls CEJ0, passing
in the affected CPU's identifier.

The above hunk modifies the CEJ0 method.

(5) Question: pre-patch, both the CSCN method and the CEJ0 method
acquire the CPLK lock, but CEJ0 is actually called within CSCN
(indirectly, with the OS's cooperation). Is CPLK a recursive lock?

Anyway, let's see the CEJ0 modification. After the OS is done forgetting
about the CPU, the CEJ0 method no longer unplugs the CPU, instead it
sets the new bit#4 in the register block, and raises an SMI.

(6) So that's one SMI per CPU being removed. Is that OK?

(7) What if there are asynchronous plugs going on, and the firmware
notices them in the register block? ... Hm, I hope that should be OK,
because ultimately the CSCN method will learn about those too, and
inform the OS. On plug, the firmware doesn't modify the register block.

Ah! OK. I think I understand why bit#4 is important. The firmware may
notice pending remove events, but it must not act upon them -- it must
simply ignore them -- unless bit#4 is also set. Bit#2 set with bit#4
clear means the event is pending (QEMU got a device_del), but the OS has
not forgotten about the CPU yet -- so the firmware must not unplug it
yet. When the modified CEJ0 method runs, it sets bit#4 in addition to
the already set bit#2, advertising that the OS has *already* abandoned
the CPU.

This means we'll have to modify the QemuCpuhpCollectApicIds() function
in OVMF as well -- for collecting a CPU for unplug, just bit#2
(QEMU_CPUHP_STAT_REMOVE) is insufficient -- on such CPUs, the OS may
still be executing threads.

OK, this approach sounds plausible to me.

(8) Please extend the description of bit#2 in the "status flags read
access" section: "firmware must ignore bit#2 unless bit#4 is set".



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

(9) You have to extend smi_features_ok_callback() as well -- it is
invalid for the firmware to negotiate unplug, without negotiating plug.

In fact, as far as I can tell, that would even crash QEMU, given this
patch. Because, "opts.smi_path" would be set to NULL, but
"opts.fw_unplugs_cpu" would be set to "true". As a consequence, the
CPU_EJECT_METHOD change above would call aml_name("%s", NULL).

So something like the following looks necessary:

> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index 8c667b7166c7..5bc3f212fe77 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -366,6 +366,7 @@ static void smi_features_ok_callback(void *opaque)
>  {
>      ICH9LPCState *lpc = opaque;
>      uint64_t guest_features;
> +    uint64_t guest_cpu_hotplug_features;
>
>      if (lpc->smi_features_ok) {
>          /* negotiation already complete, features locked */
> @@ -378,9 +379,11 @@ static void smi_features_ok_callback(void *opaque)
>          /* guest requests invalid features, leave @features_ok at zero */
>          return;
>      }
> +    guest_cpu_hotplug_features = guest_features &
> +                                 (BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT) |
> +                                  BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT));
>      if (!(guest_features & BIT_ULL(ICH9_LPC_SMI_F_BROADCAST_BIT)) &&
> -        guest_features & (BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT) |
> -                          BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT))) {
> +        guest_cpu_hotplug_features) {
>          /*
>           * cpu hot-[un]plug with SMI requires SMI broadcast,
>           * leave @features_ok at zero
> @@ -388,6 +391,12 @@ static void smi_features_ok_callback(void *opaque)
>          return;
>      }
>
> +    if (guest_cpu_hotplug_features ==
> +        BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT)) {
> +        /* cpu hot-unplug is unsupported without cpu-hotplug */
> +        return;
> +    }
> +
>      /* valid feature subset requested, lock it down, report success */
>      lpc->smi_negotiated_features = guest_features;
>      lpc->smi_features_ok = 1;


(10) It would be nice to separate this work into multiple patches. I
propose:

- [PATCH 1/5] x86: ich9: factor out "guest_cpu_hotplug_features"

>  hw/isa/lpc_ich9.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index 087a18d04de4..c46eefd13fd4 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -366,6 +366,7 @@ static void smi_features_ok_callback(void *opaque)
>  {
>      ICH9LPCState *lpc = opaque;
>      uint64_t guest_features;
> +    uint64_t guest_cpu_hotplug_features;
>
>      if (lpc->smi_features_ok) {
>          /* negotiation already complete, features locked */
> @@ -378,9 +379,11 @@ static void smi_features_ok_callback(void *opaque)
>          /* guest requests invalid features, leave @features_ok at zero */
>          return;
>      }
> +    guest_cpu_hotplug_features = guest_features &
> +                                 (BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT) |
> +                                  BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT));
>      if (!(guest_features & BIT_ULL(ICH9_LPC_SMI_F_BROADCAST_BIT)) &&
> -        guest_features & (BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT) |
> -                          BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT))) {
> +        guest_cpu_hotplug_features) {
>          /*
>           * cpu hot-[un]plug with SMI requires SMI broadcast,
>           * leave @features_ok at zero


- [PATCH 2/5] x86: ich9: let firmware negotiate 'CPU hot-unplug with SMI' feature

>  hw/i386/pc.c      | 1 +
>  hw/isa/lpc_ich9.c | 8 +++++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 17b514d1da50..2952a00fe694 100644
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
> index c46eefd13fd4..5bc3f212fe77 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -391,6 +391,12 @@ static void smi_features_ok_callback(void *opaque)
>          return;
>      }
>
> +    if (guest_cpu_hotplug_features ==
> +        BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT)) {
> +        /* cpu hot-unplug is unsupported without cpu-hotplug */
> +        return;
> +    }
> +
>      /* valid feature subset requested, lock it down, report success */
>      lpc->smi_negotiated_features = guest_features;
>      lpc->smi_features_ok = 1;
> @@ -773,7 +779,7 @@ static Property ich9_lpc_properties[] = {
>      DEFINE_PROP_BIT64("x-smi-cpu-hotplug", ICH9LPCState, smi_host_features,
>                        ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT, true),
>      DEFINE_PROP_BIT64("x-smi-cpu-hotunplug", ICH9LPCState, smi_host_features,
> -                      ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT, false),
> +                      ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>


- [PATCH 3/5] x86: acpi: introduce AcpiPmInfo::smi_on_cpu_unplug

>  hw/i386/acpi-build.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 1f5c2112452a..9036e5594c92 100644
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


- [PATCH 4/5] acpi: cpuhp: introduce 'firmware performs eject' status/control bits

>  docs/specs/acpi_cpu_hotplug.txt | 11 +++++++++--
>  include/hw/acpi/cpu.h           |  1 +
>  hw/acpi/cpu.c                   |  3 +++
>  3 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hotplug.txt
> index 9bb22d1270a9..f68ef6e06c7a 100644
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
> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> index 0eeedaa491c1..d71edde456f2 100644
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
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index f099b5092730..3dc83d73e20b 100644
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


- [PATCH 5/5] x86: acpi: let the firmware handle pending "CPU remove" events in SMM

>  include/hw/acpi/cpu.h |  1 +
>  hw/acpi/cpu.c         | 15 +++++++++++++--
>  hw/i386/acpi-build.c  |  1 +
>  3 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> index d71edde456f2..999caaf51060 100644
> --- a/include/hw/acpi/cpu.h
> +++ b/include/hw/acpi/cpu.h
> @@ -51,6 +51,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
>  typedef struct CPUHotplugFeatures {
>      bool acpi_1_compatible;
>      bool has_legacy_cphp;
> +    bool fw_unplugs_cpu;
>      const char *smi_path;
>  } CPUHotplugFeatures;
>
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 3dc83d73e20b..09d2f20daec0 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -335,6 +335,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
>  #define CPU_INSERT_EVENT  "CINS"
>  #define CPU_REMOVE_EVENT  "CRMV"
>  #define CPU_EJECT_EVENT   "CEJ0"
> +#define CPU_FW_EJECT_EVENT "CEJF"
>
>  void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>                      hwaddr io_base,
> @@ -387,7 +388,10 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
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
> @@ -422,6 +426,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>          Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
>          Aml *rm_evt = aml_name("%s.%s", cphp_res_path, CPU_REMOVE_EVENT);
>          Aml *ej_evt = aml_name("%s.%s", cphp_res_path, CPU_EJECT_EVENT);
> +        Aml *fw_ej_evt = aml_name("%s.%s", cphp_res_path, CPU_FW_EJECT_EVENT);
>
>          aml_append(cpus_dev, aml_name_decl("_HID", aml_string("ACPI0010")));
>          aml_append(cpus_dev, aml_name_decl("_CID", aml_eisaid("PNP0A05")));
> @@ -464,7 +469,13 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
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
> index 9036e5594c92..475e76f514ff 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1586,6 +1586,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          CPUHotplugFeatures opts = {
>              .acpi_1_compatible = true, .has_legacy_cphp = true,
>              .smi_path = pm->smi_on_cpuhp ? "\\_SB.PCI0.SMI0.SMIC" : NULL,
> +            .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
>          };
>          build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
>                         "\\_SB.PCI0", "\\_GPE._E02");

Thanks!
Laszlo


