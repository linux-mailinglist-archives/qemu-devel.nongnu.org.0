Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BB467B742
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 17:50:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKixD-00086p-9U; Wed, 25 Jan 2023 11:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKixB-00086S-6S
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 11:48:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKix8-0007W9-B1
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 11:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674665329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hyxy1fIZhIcAzQCQ4+nKqObbOMWVJ4h+wRdsgdTEEPc=;
 b=YlQUXvkQESzDOlb3ZdsUdF28GegeWnIZyZLhpCd1dJmoPdmIP/g+38r4INR/3VwBRFEaf6
 I1dhjwIwXnvkIZ/FThCPtHMSg27mfBSeIYtAuZwZk+w/6BCD5oNq5aKRxp2Fv4JWsDMY/G
 tVaxdy3uiKvyky4KkAhbpcTBNnWNX/o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-BDhTSKEfNpWrqYjILDGSOA-1; Wed, 25 Jan 2023 11:48:47 -0500
X-MC-Unique: BDhTSKEfNpWrqYjILDGSOA-1
Received: by mail-ed1-f72.google.com with SMTP id
 z6-20020aa7cf86000000b0049f95687b88so4356118edx.4
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 08:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hyxy1fIZhIcAzQCQ4+nKqObbOMWVJ4h+wRdsgdTEEPc=;
 b=nM4yy9zWsi6suXEG8A6kdcv+PLw3+Pov6ZGmP7wrXCuR+7xN0pePwhYP5D+bevV4vy
 913wz35jYUeOkTq5dAFwUdbAhptZswNQRU/SiMNtbR48QVDI8auDJAlArkbfW6sH5dce
 iBHNMt9jCmTbirOaQbdqWQXTk3mCbbp1kyb3rnwOO/CBxYcu/nPsRA2rotVOJdM15hZW
 /ne3rwxFFUq8MDgnixzuSdot+BtZwilhjJOoQlPGeZ6GCvTyBlwdrvDJHMyeG95zJE4F
 WeZeiMW88SMcM3M7ugBW9apZ65/Qss0XJdhetezK6rUNQnG35MmuaB7zUhLieVG7sGOn
 gU5A==
X-Gm-Message-State: AFqh2koak8J5B9lUshcF9vk/iN1gfNACcpn0JV7ybOQ313o9tYdR6kuD
 S5EVeFaNkKK621IQozwO5AE1rlG+EQrlECb6evA2hYDl+yn83DBlDdhT8mD7GOC3Q6/RU1l/p2H
 fWUtr5Vo3qhuBGRs=
X-Received: by 2002:a17:907:7da0:b0:86d:67b0:6292 with SMTP id
 oz32-20020a1709077da000b0086d67b06292mr49290126ejc.73.1674665324067; 
 Wed, 25 Jan 2023 08:48:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu7N9ACgoYbEqEs0zIubiYiRlEa5FPZxTqqtoUZZsvKsDFsO0oYCzUvfoSC6GJ7QKcnBBSABg==
X-Received: by 2002:a17:907:7da0:b0:86d:67b0:6292 with SMTP id
 oz32-20020a1709077da000b0086d67b06292mr49290102ejc.73.1674665323778; 
 Wed, 25 Jan 2023 08:48:43 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 sd21-20020a170906ce3500b0084bfd56fb3bsm2574839ejb.162.2023.01.25.08.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 08:48:43 -0800 (PST)
Date: Wed, 25 Jan 2023 17:48:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, Eduardo
 Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>, "Michael S.
 Tsirkin" <mst@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 5/7] hw/acpi/acpi_dev_interface: Factor out
 TYPE_ACPI_CPU_AML_IF
Message-ID: <20230125174842.395fda5d@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230121151941.24120-6-shentey@gmail.com>
References: <20230121151941.24120-1-shentey@gmail.com>
 <20230121151941.24120-6-shentey@gmail.com>
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

On Sat, 21 Jan 2023 16:19:39 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> This class attribute was always set to pc_madt_cpu_entry().
> pc_madt_cpu_entry() is architecture dependent and was assigned to the
> attribute even in architecture agnostic code such as in hw/acpi/piix4.c
> and hw/isa/lpc_ich9. Not having to set madt_cpu there resolves the
> assumption that these device models are only ever used with ACPI on x86
> targets.

While it would work, I don't see a compelling reason to drop
AcpiDeviceIf::madt_cpu and cause all this churn and extra code.

Simple pc_madt_cpu_entry() stub works just fine for targets
that don't need madt_cpu (it's not elegant but, it's the way
such issues a typically dealt with).

If goal is to clean up piix4 from *all* x86 extensions and have
pure pixx4 and make sure other targets do not pull in not needed
ACPI dependencies, then this patch should be a part of a series
that does all of that to demonstrate that achievable without
breaking migration.

So far I'm not convinced that this patch has merit on its own.
I suggest to drop it for now.

> The only target independent location where madt_cpu was called was hw/
> acpi/cpu.c. Here a function pointer can be passed via an argument
> instead. The other locations where it was called was in x86-specific code
> where pc_madt_cpu_entry() can be used directly.
this part diverged from what this patch does.

> While at it, move pc_madt_cpu_entry() from the public include/hw/i386/
> pc.h to the private hw/i386/acpi-common where it is also implemented.

PS:
  usage of 'ifdef's is not welcome in new code,
  unless *there is no other way* around that.
 

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> 
> TYPE_ACPI_CPU_IF
> ---
>  hw/i386/acpi-common.h                |  3 +--
>  include/hw/acpi/acpi_cpu_interface.h | 26 ++++++++++++++++++++++++++
>  include/hw/acpi/acpi_dev_interface.h |  2 --
>  hw/acpi/acpi_interface.c             |  8 +++++++-
>  hw/acpi/cpu.c                        | 11 ++++++-----
>  hw/acpi/piix4.c                      |  2 --
>  hw/i386/acpi-build.c                 |  3 +--
>  hw/i386/acpi-common.c                |  8 +++++---
>  hw/i386/acpi-microvm.c               |  3 +--
>  hw/i386/generic_event_device_x86.c   |  9 ---------
>  hw/isa/lpc_ich9.c                    |  1 -
>  target/i386/cpu.c                    | 13 +++++++++++++
>  12 files changed, 60 insertions(+), 29 deletions(-)
>  create mode 100644 include/hw/acpi/acpi_cpu_interface.h
> 
> diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
> index a68825acf5..b3c56ee014 100644
> --- a/hw/i386/acpi-common.h
> +++ b/hw/i386/acpi-common.h
> @@ -1,7 +1,6 @@
>  #ifndef HW_I386_ACPI_COMMON_H
>  #define HW_I386_ACPI_COMMON_H
>  
> -#include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/i386/x86.h"
>  
> @@ -9,7 +8,7 @@
>  #define ACPI_BUILD_IOAPIC_ID 0x0
>  
>  void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
> -                     X86MachineState *x86ms, AcpiDeviceIf *adev,
> +                     X86MachineState *x86ms,
>                       const char *oem_id, const char *oem_table_id);
>  
>  #endif
> diff --git a/include/hw/acpi/acpi_cpu_interface.h b/include/hw/acpi/acpi_cpu_interface.h
> new file mode 100644
> index 0000000000..600f0b68cd
> --- /dev/null
> +++ b/include/hw/acpi/acpi_cpu_interface.h
> @@ -0,0 +1,26 @@
> +#ifndef ACPI_CPU_INTERFACE_H
> +#define ACPI_CPU_INTERFACE_H
> +
> +#include "qom/object.h"
> +#include "hw/boards.h"
> +#include "hw/qdev-core.h"
> +
> +#define TYPE_ACPI_CPU_AML_IF "acpi-cpu-aml-interface"
> +
> +typedef struct AcpiCpuAmlIfClass AcpiCpuAmlIfClass;
> +DECLARE_CLASS_CHECKERS(AcpiCpuAmlIfClass, ACPI_CPU_AML_IF,
> +                       TYPE_ACPI_CPU_AML_IF)
> +#define ACPI_CPU_AML_IF(obj) \
> +    INTERFACE_CHECK(AcpiCpuAmlIf, (obj), TYPE_ACPI_CPU_AML_IF)
> +
> +typedef struct AcpiCpuAmlIf AcpiCpuAmlIf;
> +
> +struct AcpiCpuAmlIfClass {
> +    /* <private> */
> +    InterfaceClass parent_class;
> +
> +    /* <public> */
> +    void (*madt_cpu)(int uid, const CPUArchIdList *apic_ids, GArray *entry,
> +                     bool force_enabled);
> +};
> +#endif
> diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
> index a1648220ff..ca92928124 100644
> --- a/include/hw/acpi/acpi_dev_interface.h
> +++ b/include/hw/acpi/acpi_dev_interface.h
> @@ -52,7 +52,5 @@ struct AcpiDeviceIfClass {
>      /* <public> */
>      void (*ospm_status)(AcpiDeviceIf *adev, ACPIOSTInfoList ***list);
>      void (*send_event)(AcpiDeviceIf *adev, AcpiEventStatusBits ev);
> -    void (*madt_cpu)(int uid, const CPUArchIdList *apic_ids, GArray *entry,
> -                     bool force_enabled);
>  };
>  #endif
> diff --git a/hw/acpi/acpi_interface.c b/hw/acpi/acpi_interface.c
> index 8637ff18fc..11a57e2154 100644
> --- a/hw/acpi/acpi_interface.c
> +++ b/hw/acpi/acpi_interface.c
> @@ -1,4 +1,5 @@
>  #include "qemu/osdep.h"
> +#include "hw/acpi/acpi_cpu_interface.h"
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/acpi/acpi_aml_interface.h"
>  #include "qemu/module.h"
> @@ -34,10 +35,15 @@ static void register_types(void)
>          .parent        = TYPE_INTERFACE,
>          .class_size = sizeof(AcpiDevAmlIfClass),
>      };
> -
> +    static const TypeInfo acpi_cpu_aml_if_info = {
> +        .name          = TYPE_ACPI_CPU_AML_IF,
> +        .parent        = TYPE_INTERFACE,
> +        .class_size = sizeof(AcpiCpuAmlIfClass),
> +    };
>  
>      type_register_static(&acpi_dev_if_info);
>      type_register_static(&acpi_dev_aml_if_info);
> +    type_register_static(&acpi_cpu_aml_if_info);
>  }
>  
>  type_init(register_types)
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 19c154d78f..f6647e99b1 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -1,5 +1,6 @@
>  #include "qemu/osdep.h"
>  #include "migration/vmstate.h"
> +#include "hw/acpi/acpi_cpu_interface.h"
>  #include "hw/acpi/cpu.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-events-acpi.h"
> @@ -353,8 +354,6 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>      const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(machine);
>      char *cphp_res_path = g_strdup_printf("%s." CPUHP_RES_DEVICE, res_root);
> -    Object *obj = object_resolve_path_type("", TYPE_ACPI_DEVICE_IF, NULL);
> -    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(obj);
>  
>      cpu_ctrl_dev = aml_device("%s", cphp_res_path);
>      {
> @@ -648,6 +647,8 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>          for (i = 0; i < arch_ids->len; i++) {
>              Aml *dev;
>              Aml *uid = aml_int(i);
> +            ObjectClass *oc = object_class_by_name(arch_ids->cpus[i].type);
> +            AcpiCpuAmlIfClass *acpuac = ACPI_CPU_AML_IF_CLASS(oc);
>              GArray *madt_buf = g_array_new(0, 1, 1);
>              int arch_id = arch_ids->cpus[i].arch_id;
>  
> @@ -664,9 +665,9 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>              aml_append(dev, method);
>  
>              /* build _MAT object */
> -            assert(adevc && adevc->madt_cpu);
> -            adevc->madt_cpu(i, arch_ids, madt_buf,
> -                            true); /* set enabled flag */
> +            assert(acpuac && acpuac->madt_cpu);
> +            acpuac->madt_cpu(i, arch_ids, madt_buf,
> +                             true); /* set enabled flag */
>              aml_append(dev, aml_name_decl("_MAT",
>                  aml_buffer(madt_buf->len, (uint8_t *)madt_buf->data)));
>              g_array_free(madt_buf, true);
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 2ab4930f11..2e19a55526 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -20,7 +20,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "hw/i386/pc.h"
>  #include "hw/irq.h"
>  #include "hw/isa/apm.h"
>  #include "hw/i2c/pm_smbus.h"
> @@ -642,7 +641,6 @@ static void piix4_pm_class_init(ObjectClass *klass, void *data)
>      hc->unplug = piix4_device_unplug_cb;
>      adevc->ospm_status = piix4_ospm_status;
>      adevc->send_event = piix4_send_gpe;
> -    adevc->madt_cpu = pc_madt_cpu_entry;
>  }
>  
>  static const TypeInfo piix4_pm_info = {
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 8c333973f9..b12a843447 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2422,8 +2422,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>  
>      acpi_add_table(table_offsets, tables_blob);
>      acpi_build_madt(tables_blob, tables->linker, x86ms,
> -                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
> -                    x86ms->oem_table_id);
> +                    x86ms->oem_id, x86ms->oem_table_id);
>  
>  #ifdef CONFIG_ACPI_ERST
>      {
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index 52e5c1439a..0d1a2bb8aa 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -25,6 +25,7 @@
>  
>  #include "exec/memory.h"
>  #include "hw/acpi/acpi.h"
> +#include "hw/acpi/acpi_cpu_interface.h"
>  #include "hw/acpi/aml-build.h"
>  #include "hw/acpi/utils.h"
>  #include "hw/i386/pc.h"
> @@ -94,14 +95,13 @@ build_xrupt_override(GArray *entry, uint8_t src, uint32_t gsi, uint16_t flags)
>   * 5.2.8 Multiple APIC Description Table
>   */
>  void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
> -                     X86MachineState *x86ms, AcpiDeviceIf *adev,
> +                     X86MachineState *x86ms,
>                       const char *oem_id, const char *oem_table_id)
>  {
>      int i;
>      bool x2apic_mode = false;
>      MachineClass *mc = MACHINE_GET_CLASS(x86ms);
>      const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
> -    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
>      AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
>                          .oem_table_id = oem_table_id };
>  
> @@ -111,7 +111,9 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>      build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Flags */
>  
>      for (i = 0; i < apic_ids->len; i++) {
> -        adevc->madt_cpu(i, apic_ids, table_data, false);
> +        ObjectClass *oc = object_class_by_name(apic_ids->cpus[i].type);
> +        AcpiCpuAmlIfClass *acpuac = ACPI_CPU_AML_IF_CLASS(oc);
> +        acpuac->madt_cpu(i, apic_ids, table_data, false);
>          if (apic_ids->cpus[i].arch_id > 254) {
>              x2apic_mode = true;
>          }
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index a075360d85..fec22d85c1 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -214,8 +214,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>  
>      acpi_add_table(table_offsets, tables_blob);
>      acpi_build_madt(tables_blob, tables->linker, X86_MACHINE(machine),
> -                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
> -                    x86ms->oem_table_id);
> +                    x86ms->oem_id, x86ms->oem_table_id);
>  
>  #ifdef CONFIG_ACPI_ERST
>      {
> diff --git a/hw/i386/generic_event_device_x86.c b/hw/i386/generic_event_device_x86.c
> index e26fb02a2e..8fc233e1f1 100644
> --- a/hw/i386/generic_event_device_x86.c
> +++ b/hw/i386/generic_event_device_x86.c
> @@ -8,19 +8,10 @@
>  
>  #include "qemu/osdep.h"
>  #include "hw/acpi/generic_event_device.h"
> -#include "hw/i386/pc.h"
> -
> -static void acpi_ged_x86_class_init(ObjectClass *class, void *data)
> -{
> -    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_CLASS(class);
> -
> -    adevc->madt_cpu = pc_madt_cpu_entry;
> -}
>  
>  static const TypeInfo acpi_ged_x86_info = {
>      .name          = TYPE_ACPI_GED_X86,
>      .parent        = TYPE_ACPI_GED,
> -    .class_init    = acpi_ged_x86_class_init,
>      .interfaces = (InterfaceInfo[]) {
>          { TYPE_HOTPLUG_HANDLER },
>          { TYPE_ACPI_DEVICE_IF },
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index 1fba3c210c..d5d4b0f177 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -867,7 +867,6 @@ static void ich9_lpc_class_init(ObjectClass *klass, void *data)
>      hc->unplug = ich9_pm_device_unplug_cb;
>      adevc->ospm_status = ich9_pm_ospm_status;
>      adevc->send_event = ich9_send_gpe;
> -    adevc->madt_cpu = pc_madt_cpu_entry;
>      amldevc->build_dev_aml = build_ich9_isa_aml;
>  }
>  
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 4d2b8d0444..6ac50506a7 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -37,7 +37,9 @@
>  #include "hw/i386/topology.h"
>  #ifndef CONFIG_USER_ONLY
>  #include "exec/address-spaces.h"
> +#include "hw/acpi/acpi_cpu_interface.h"
>  #include "hw/boards.h"
> +#include "hw/i386/pc.h"
>  #include "hw/i386/sgx-epc.h"
>  #endif
>  
> @@ -7114,6 +7116,9 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>      CPUClass *cc = CPU_CLASS(oc);
>      DeviceClass *dc = DEVICE_CLASS(oc);
>      ResettableClass *rc = RESETTABLE_CLASS(oc);
> +#ifndef CONFIG_USER_ONLY
> +    AcpiCpuAmlIfClass *acpuac = ACPI_CPU_AML_IF_CLASS(oc);
> +#endif
>      FeatureWord w;
>  
>      device_class_set_parent_realize(dc, x86_cpu_realizefn,
> @@ -7138,6 +7143,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>  
>  #ifndef CONFIG_USER_ONLY
>      cc->sysemu_ops = &i386_sysemu_ops;
> +    acpuac->madt_cpu = pc_madt_cpu_entry;
>  #endif /* !CONFIG_USER_ONLY */
>  
>      cc->gdb_arch_name = x86_gdb_arch_name;
> @@ -7203,6 +7209,13 @@ static const TypeInfo x86_cpu_type_info = {
>      .abstract = true,
>      .class_size = sizeof(X86CPUClass),
>      .class_init = x86_cpu_common_class_init,
> +
> +#ifndef CONFIG_USER_ONLY
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_ACPI_CPU_AML_IF },
> +        { }
> +    }
> +#endif
>  };
>  
>  /* "base" CPU model, used by query-cpu-model-expansion */


