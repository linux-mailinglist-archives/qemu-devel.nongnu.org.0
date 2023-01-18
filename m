Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA03672068
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 16:01:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI9uI-0001iD-0u; Wed, 18 Jan 2023 09:59:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pI9uG-0001hw-Sh
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 09:59:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pI9uE-0006aM-Ag
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 09:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674053953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oSC5b3szYLq4SknYQypdFcGvcpQdVNywcCvZ62d7Lvk=;
 b=KJbyA4y81ww0hPeE5Y8d+lb2X0Sug//+T2iCC7sl+qSudAG2zMu1eroYz934rDD+mEXLto
 ZxVBYEnVMOEoOnD4X8o4u5/qW15qD4UGLQdVP7GdhfyMHR6sGZGVqdntpJ8ew4hf3AN7/o
 l1UZNymMPPzM8GLVaOzKynfJib4GseA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-348-Djmc331DPgOn1lNvPtmguw-1; Wed, 18 Jan 2023 09:59:09 -0500
X-MC-Unique: Djmc331DPgOn1lNvPtmguw-1
Received: by mail-ed1-f70.google.com with SMTP id
 q20-20020a056402519400b0049e5b8c71b3so385068edd.17
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 06:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oSC5b3szYLq4SknYQypdFcGvcpQdVNywcCvZ62d7Lvk=;
 b=VmgX1ZwuhExNvTl2j4UM5eg5RepvEzKtoFMcrM9G8oGAoDTm7qAWXiuMvvd2so66Rp
 /wmcKZkY5HuXmB1qkFONw/BGvvtHXO8vmXQjCmIWlH2OEtgq2vLhHhpAmPePRQn9/kwq
 cnzXwywamwKmQsDZ/3cGe4znWs4CF+i0Lo+EYPgDyHRFY2eRUmVt5NeXCTv+HLVsClRP
 6SMrCCIV8ivKzR/2hn4G/a/8Q60SLS2mIGW/jWLBDjUdKhYaEEZGG6trfyCVQJUdZgI2
 iaXL5KT/N9XRqlQsB+EmeMizPF5BKezQFBb4eZoX9kpf+181sNkhTDfluvsGkdgjuOyb
 iPvQ==
X-Gm-Message-State: AFqh2ko7rxG9By9JBjDy2wdcI4+esGFqhwmPUwN5PpjIvtZnonin2OXO
 e7XF8hvDO2oHr0om3gxAMIPryh9gvvJfD5xjlojok9Lxaq1fgKFhGfZaqJcDcv7tjrwSirQWgdx
 MHrHBeYqZ1GO5K1s=
X-Received: by 2002:a05:6402:cf:b0:45c:835c:1ecc with SMTP id
 i15-20020a05640200cf00b0045c835c1eccmr18706217edu.26.1674053947168; 
 Wed, 18 Jan 2023 06:59:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsn+DG8VURtSarSfwLjmrC9eCp28YOmC5g5YjAHfnv2JGk/ugSsC373UBDUiBfq0yd/Pq+lSQ==
X-Received: by 2002:a05:6402:cf:b0:45c:835c:1ecc with SMTP id
 i15-20020a05640200cf00b0045c835c1eccmr18706195edu.26.1674053946842; 
 Wed, 18 Jan 2023 06:59:06 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 bc25-20020a056402205900b0046b00a9eeb5sm14229700edb.49.2023.01.18.06.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 06:59:06 -0800 (PST)
Date: Wed, 18 Jan 2023 15:59:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH v3 2/7] hw/acpi/acpi_dev_interface: Resolve
 AcpiDeviceIfClass::madt_cpu
Message-ID: <20230118155905.0e1c4b21@imammedo.users.ipa.redhat.com>
In-Reply-To: <C4C9B55E-6723-4143-8F5E-CE9F9FB0CCB6@gmail.com>
References: <20230116152908.147275-1-shentey@gmail.com>
 <20230116152908.147275-3-shentey@gmail.com>
 <20230116172930.462a792d@imammedo.users.ipa.redhat.com>
 <C4C9B55E-6723-4143-8F5E-CE9F9FB0CCB6@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 17 Jan 2023 00:30:23 +0000
Bernhard Beschow <shentey@gmail.com> wrote:

> Am 16. Januar 2023 16:29:30 UTC schrieb Igor Mammedov <imammedo@redhat.com>:
> >On Mon, 16 Jan 2023 16:29:03 +0100
> >Bernhard Beschow <shentey@gmail.com> wrote:
> >  
> >> This class attribute was always set to pc_madt_cpu_entry().
> >> pc_madt_cpu_entry() is architecture dependent and was assigned to the
> >> attribute even in architecture agnostic code such as in hw/acpi/piix4.c
> >> and hw/isa/lpc_ich9. Not having to set madt_cpu there resolves the
> >> assumption that these device models are only ever used with ACPI on x86
> >> targets.
> >> 
> >> The only target independent location where madt_cpu was called was hw/
> >> acpi/cpu.c. Here a function pointer can be passed via an argument
> >> instead. The other locations where it was called was in x86-specific code
> >> where pc_madt_cpu_entry() can be used directly.
> >>
> >> While at it, move pc_madt_cpu_entry() from the public include/hw/i386/
> >> pc.h to the private hw/i386/acpi-common where it is also implemented.  
> >
> >I'm not sure about this approach,
> >the callback is intend to be used not only by x86 but also in
> >the end by ARM (it's just that arm/virt CPU hotplug patches are
> >still work in progress and haven't been merged).  
> 
> IIUC one would call the target-independent build_cpus_aml() from the ARM-specific build_madt(). There, one could pass a function pointer to an ARM-specific madt_cpu_fn. Shouldn't that get us covered?

it will work in this case, but I don't like going back to random
function pointer argument approach instead of using QOM and
interfaces which is much better in describing expectations/contract 
for interfaces adn objects it's attached to.

Howver that is not the reason why I'm against this approach, see bellow.

> >So I'd prefer to keep AcpiDeviceIfClass::madt_cpu.
> >
> >What's the end goal you are trying to achieve by getting
> >rid of this callback?  
> 
> ACPI controllers are in principle not x86-specific, yet our PIIX4 and ICH9 device models always assign an x86-specific function to AcpiDeviceIfClass::madt_cpu. That doesn't seem right because the device models make assumptions about their usage contexts which they ideally shouldn't.
> 
> In addition, it seems to me that ACPI controllers and AML generation should not be mixed: An ACPI controller deals with (hardware) events while AML generation is usually a BIOS task to inject code into an OS. Therefore, ACPI controllers don't seem to be the right place to assign AML-generating functions because that doesn't match how reality works.

It would be nice to have pristine hardware-only device models
and firmware composing ACPI tables like baremetal systems do
(they have a luxury of fixed hardware which makes it way simpler),
however it was not practical nor sustainable in mainstream virt case.
That's the reason why ACPI tables (firmware) were moved into QEMU (hardware).

> To solve both issues, one could factor out e.g. an AmlDeviceIf from AcpiDeviceIf, so one would't force the device models to provide an madt_cpu. 
> Then one could assign a target-specific AmlDeviceIfClass::madt_cpu e.g. in board code.
ACPI tables in QEMU started this way, It stopped being maintainable
at certain point, see below for more.

>At the moment I don't see a need for a new interface, however, since the function pointer works just fine: It frees the device models from having to provide it and it is used in code which already deals with AML generation.
When the move happened, the bulk of ACPI code was as you suggest made
as machine specific and it's still the case for the most of it.
Then, with ease of adding new related features, it exploded into
I would say hard to maintain mess. Hence before adding more and
making it worse, I introduced  call_dev_aml_func()/AcpiDevAmlIf
and started refactoring PCI AML code. That simplified main PCI bus
enumeration quite a bit.

The new interface however does exactly opposite of what you are doing,
i.e. it pushes device specific AML generation into corresponding device
model. It's not ideal as we have to provide stubs for targets where it's
not needed. But stubs for target independent code is typical and proven
approach we use in QEMU for such cases and is relatively easy to maintain.
So I'd call it a reasonable compromise.

Recently posted series (that untangles generic PCI slots AML from
ACPI PCI hotplug frankenstein) continues with AcpiDevAmlIf approach 
and pushes more AML into target in-depended device models.

And there is more coming on top of it (with the goal to make most
of what we accumulated in PC/Q35 PCI ACPI code become generic enough
to replace most of PCI related AML elsewhere (microvm, arm/virt,
whatever else that is interested in ACPI tables support).
My ambition with this refactoring stops at making qdev device tree
self-describable at PCI boundary but AcpiDevAmlIf can be applied
to other devices described in DSDT, that hang off the board.
 
> My end goal is to make the VT82xx south bridges compatible with x86 and to bring them to feature parity with PIIX. For this, I need to implement the VIA ACPI controller proper, and since these south bridges are currently only used in MIPS and PowerPC contexts I'm feeling a bit uncomfortable having to drag in x86 assumptions into these devices.

basic ACPI hardware (GPE/PM registers) code is relatively isolated,
so you probably can implement that without touching piix much.
(with little to no stubs).

If you want to cleanup piix and free other targets from
unfortunate ACPI/x86 specific dependencies, it would probably
need another approach than presented here.

ex:
Isolating core(pristine) piix code in piix-basic class
for PPC/MIPS use, and then branching/inheriting of it
current piix class with all extra x86 'features' might
work without breaking migration. (/me assuming cross
version migration should work in this arrangement, 
though I won't bet on it)

> Best regards,
> Bernhard
> 
> >  
> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >> ---
> >>  hw/i386/acpi-common.h                |  7 +++++--
> >>  include/hw/acpi/acpi_dev_interface.h |  2 --
> >>  include/hw/acpi/cpu.h                |  6 +++++-
> >>  include/hw/i386/pc.h                 |  4 ----
> >>  hw/acpi/acpi-x86-stub.c              |  6 ------
> >>  hw/acpi/cpu.c                        | 10 ++++------
> >>  hw/acpi/piix4.c                      |  2 --
> >>  hw/i386/acpi-build.c                 |  5 ++---
> >>  hw/i386/acpi-common.c                |  5 ++---
> >>  hw/i386/acpi-microvm.c               |  3 +--
> >>  hw/i386/generic_event_device_x86.c   |  9 ---------
> >>  hw/isa/lpc_ich9.c                    |  1 -
> >>  12 files changed, 19 insertions(+), 41 deletions(-)
> >> 
> >> diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
> >> index a68825acf5..968d625d88 100644
> >> --- a/hw/i386/acpi-common.h
> >> +++ b/hw/i386/acpi-common.h
> >> @@ -1,15 +1,18 @@
> >>  #ifndef HW_I386_ACPI_COMMON_H
> >>  #define HW_I386_ACPI_COMMON_H
> >>  
> >> -#include "hw/acpi/acpi_dev_interface.h"
> >>  #include "hw/acpi/bios-linker-loader.h"
> >>  #include "hw/i386/x86.h"
> >> +#include "hw/boards.h"
> >>  
> >>  /* Default IOAPIC ID */
> >>  #define ACPI_BUILD_IOAPIC_ID 0x0
> >>  
> >> +void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids, GArray *entry,
> >> +                       bool force_enabled);
> >> +
> >>  void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
> >> -                     X86MachineState *x86ms, AcpiDeviceIf *adev,
> >> +                     X86MachineState *x86ms,
> >>                       const char *oem_id, const char *oem_table_id);
> >>  
> >>  #endif
> >> diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
> >> index a1648220ff..ca92928124 100644
> >> --- a/include/hw/acpi/acpi_dev_interface.h
> >> +++ b/include/hw/acpi/acpi_dev_interface.h
> >> @@ -52,7 +52,5 @@ struct AcpiDeviceIfClass {
> >>      /* <public> */
> >>      void (*ospm_status)(AcpiDeviceIf *adev, ACPIOSTInfoList ***list);
> >>      void (*send_event)(AcpiDeviceIf *adev, AcpiEventStatusBits ev);
> >> -    void (*madt_cpu)(int uid, const CPUArchIdList *apic_ids, GArray *entry,
> >> -                     bool force_enabled);
> >>  };
> >>  #endif
> >> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> >> index 999caaf510..25b25bb594 100644
> >> --- a/include/hw/acpi/cpu.h
> >> +++ b/include/hw/acpi/cpu.h
> >> @@ -15,6 +15,7 @@
> >>  #include "hw/qdev-core.h"
> >>  #include "hw/acpi/acpi.h"
> >>  #include "hw/acpi/aml-build.h"
> >> +#include "hw/boards.h"
> >>  #include "hw/hotplug.h"
> >>  
> >>  typedef struct AcpiCpuStatus {
> >> @@ -55,8 +56,11 @@ typedef struct CPUHotplugFeatures {
> >>      const char *smi_path;
> >>  } CPUHotplugFeatures;
> >>  
> >> +typedef void (*madt_cpu_fn)(int uid, const CPUArchIdList *apic_ids,
> >> +                            GArray *entry, bool force_enabled);
> >> +
> >>  void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> >> -                    hwaddr io_base,
> >> +                    hwaddr io_base, madt_cpu_fn madt_cpu,
> >>                      const char *res_root,
> >>                      const char *event_handler_method);
> >>  
> >> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> >> index a0647165d1..a5cce88653 100644
> >> --- a/include/hw/i386/pc.h
> >> +++ b/include/hw/i386/pc.h
> >> @@ -191,10 +191,6 @@ bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
> >>                                 int *data_len);
> >>  void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
> >>  
> >> -/* hw/i386/acpi-common.c */
> >> -void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
> >> -                       GArray *entry, bool force_enabled);
> >> -
> >>  /* sgx.c */
> >>  void pc_machine_init_sgx_epc(PCMachineState *pcms);
> >>  
> >> diff --git a/hw/acpi/acpi-x86-stub.c b/hw/acpi/acpi-x86-stub.c
> >> index d0d399d26b..9662a594ad 100644
> >> --- a/hw/acpi/acpi-x86-stub.c
> >> +++ b/hw/acpi/acpi-x86-stub.c
> >> @@ -1,12 +1,6 @@
> >>  #include "qemu/osdep.h"
> >> -#include "hw/i386/pc.h"
> >>  #include "hw/i386/acpi-build.h"
> >>  
> >> -void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
> >> -                       GArray *entry, bool force_enabled)
> >> -{
> >> -}
> >> -
> >>  Object *acpi_get_i386_pci_host(void)
> >>  {
> >>         return NULL;
> >> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> >> index 19c154d78f..db15f9278d 100644
> >> --- a/hw/acpi/cpu.c
> >> +++ b/hw/acpi/cpu.c
> >> @@ -338,7 +338,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
> >>  #define CPU_FW_EJECT_EVENT "CEJF"
> >>  
> >>  void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> >> -                    hwaddr io_base,
> >> +                    hwaddr io_base, madt_cpu_fn madt_cpu,
> >>                      const char *res_root,
> >>                      const char *event_handler_method)
> >>  {
> >> @@ -353,8 +353,8 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> >>      MachineClass *mc = MACHINE_GET_CLASS(machine);
> >>      const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(machine);
> >>      char *cphp_res_path = g_strdup_printf("%s." CPUHP_RES_DEVICE, res_root);
> >> -    Object *obj = object_resolve_path_type("", TYPE_ACPI_DEVICE_IF, NULL);
> >> -    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(obj);
> >> +
> >> +    assert(madt_cpu);
> >>  
> >>      cpu_ctrl_dev = aml_device("%s", cphp_res_path);
> >>      {
> >> @@ -664,9 +664,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> >>              aml_append(dev, method);
> >>  
> >>              /* build _MAT object */
> >> -            assert(adevc && adevc->madt_cpu);
> >> -            adevc->madt_cpu(i, arch_ids, madt_buf,
> >> -                            true); /* set enabled flag */
> >> +            madt_cpu(i, arch_ids, madt_buf, true /* set enabled flag */);
> >>              aml_append(dev, aml_name_decl("_MAT",
> >>                  aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)));
> >>              g_array_free(madt_buf, true);
> >> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> >> index 0a81f1ad93..4d0d4fdeeb 100644
> >> --- a/hw/acpi/piix4.c
> >> +++ b/hw/acpi/piix4.c
> >> @@ -20,7 +20,6 @@
> >>   */
> >>  
> >>  #include "qemu/osdep.h"
> >> -#include "hw/i386/pc.h"
> >>  #include "hw/southbridge/piix.h"
> >>  #include "hw/irq.h"
> >>  #include "hw/isa/apm.h"
> >> @@ -643,7 +642,6 @@ static void piix4_pm_class_init(ObjectClass *klass, void *data)
> >>      hc->unplug = piix4_device_unplug_cb;
> >>      adevc->ospm_status = piix4_ospm_status;
> >>      adevc->send_event = piix4_send_gpe;
> >> -    adevc->madt_cpu = pc_madt_cpu_entry;
> >>  }
> >>  
> >>  static const TypeInfo piix4_pm_info = {
> >> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> >> index 127c4e2d50..0be3960a37 100644
> >> --- a/hw/i386/acpi-build.c
> >> +++ b/hw/i386/acpi-build.c
> >> @@ -1440,7 +1440,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >>              .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
> >>          };
> >>          build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
> >> -                       "\\_SB.PCI0", "\\_GPE._E02");
> >> +                       pc_madt_cpu_entry, "\\_SB.PCI0", "\\_GPE._E02");
> >>      }
> >>  
> >>      if (pcms->memhp_io_base && nr_mem) {
> >> @@ -2424,8 +2424,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
> >>  
> >>      acpi_add_table(table_offsets, tables_blob);
> >>      acpi_build_madt(tables_blob, tables->linker, x86ms,
> >> -                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
> >> -                    x86ms->oem_table_id);
> >> +                    x86ms->oem_id, x86ms->oem_table_id);
> >>  
> >>  #ifdef CONFIG_ACPI_ERST
> >>      {
> >> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> >> index 52e5c1439a..aabf78092e 100644
> >> --- a/hw/i386/acpi-common.c
> >> +++ b/hw/i386/acpi-common.c
> >> @@ -94,14 +94,13 @@ build_xrupt_override(GArray *entry, uint8_t src, uint32_t gsi, uint16_t flags)
> >>   * 5.2.8 Multiple APIC Description Table
> >>   */
> >>  void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
> >> -                     X86MachineState *x86ms, AcpiDeviceIf *adev,
> >> +                     X86MachineState *x86ms,
> >>                       const char *oem_id, const char *oem_table_id)
> >>  {
> >>      int i;
> >>      bool x2apic_mode = false;
> >>      MachineClass *mc = MACHINE_GET_CLASS(x86ms);
> >>      const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
> >> -    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
> >>      AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
> >>                          .oem_table_id = oem_table_id };
> >>  
> >> @@ -111,7 +110,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
> >>      build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Flags */
> >>  
> >>      for (i = 0; i < apic_ids->len; i++) {
> >> -        adevc->madt_cpu(i, apic_ids, table_data, false);
> >> +        pc_madt_cpu_entry(i, apic_ids, table_data, false);
> >>          if (apic_ids->cpus[i].arch_id > 254) {
> >>              x2apic_mode = true;
> >>          }
> >> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> >> index fb09185cbd..d8a444d06c 100644
> >> --- a/hw/i386/acpi-microvm.c
> >> +++ b/hw/i386/acpi-microvm.c
> >> @@ -213,8 +213,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
> >>  
> >>      acpi_add_table(table_offsets, tables_blob);
> >>      acpi_build_madt(tables_blob, tables->linker, X86_MACHINE(machine),
> >> -                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
> >> -                    x86ms->oem_table_id);
> >> +                    x86ms->oem_id, x86ms->oem_table_id);
> >>  
> >>  #ifdef CONFIG_ACPI_ERST
> >>      {
> >> diff --git a/hw/i386/generic_event_device_x86.c b/hw/i386/generic_event_device_x86.c
> >> index e26fb02a2e..8fc233e1f1 100644
> >> --- a/hw/i386/generic_event_device_x86.c
> >> +++ b/hw/i386/generic_event_device_x86.c
> >> @@ -8,19 +8,10 @@
> >>  
> >>  #include "qemu/osdep.h"
> >>  #include "hw/acpi/generic_event_device.h"
> >> -#include "hw/i386/pc.h"
> >> -
> >> -static void acpi_ged_x86_class_init(ObjectClass *class, void *data)
> >> -{
> >> -    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_CLASS(class);
> >> -
> >> -    adevc->madt_cpu = pc_madt_cpu_entry;
> >> -}
> >>  
> >>  static const TypeInfo acpi_ged_x86_info = {
> >>      .name          = TYPE_ACPI_GED_X86,
> >>      .parent        = TYPE_ACPI_GED,
> >> -    .class_init    = acpi_ged_x86_class_init,
> >>      .interfaces = (InterfaceInfo[]) {
> >>          { TYPE_HOTPLUG_HANDLER },
> >>          { TYPE_ACPI_DEVICE_IF },
> >> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> >> index 8d541e2b54..0ab0a341be 100644
> >> --- a/hw/isa/lpc_ich9.c
> >> +++ b/hw/isa/lpc_ich9.c
> >> @@ -870,7 +870,6 @@ static void ich9_lpc_class_init(ObjectClass *klass, void *data)
> >>      hc->unplug = ich9_pm_device_unplug_cb;
> >>      adevc->ospm_status = ich9_pm_ospm_status;
> >>      adevc->send_event = ich9_send_gpe;
> >> -    adevc->madt_cpu = pc_madt_cpu_entry;
> >>      amldevc->build_dev_aml = build_ich9_isa_aml;
> >>  }
> >>    
> >  
> 


