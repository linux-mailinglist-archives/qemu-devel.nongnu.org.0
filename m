Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A749638B184
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:16:34 +0200 (CEST)
Received: from localhost ([::1]:34096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjTV-0000Yf-8T
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ljjRe-0008BL-Lw
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:14:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ljjRZ-0000hR-0d
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621520071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ykp7cvZWlVYwWGC4lqmO9AZh4W9aSSKLQezZFx9KaQk=;
 b=Fn1VxgpHPWuVS9g7fd9VwzxK3gmxgQVdVz1pASl5+V0UIv57woDJlkuevUC3oo9VbGpA+g
 Rqm3rlzsmhjDfz+PdII0rxN5lDUkP9BNPum1hdedsW9FNlw6h3VUsGol4fB57l0l0RE4Br
 KEnGAT+blMelXt9aSF0T2tRiocE/BhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-eO1SqCt6Mz--Nt1FsaQT7w-1; Thu, 20 May 2021 10:14:29 -0400
X-MC-Unique: eO1SqCt6Mz--Nt1FsaQT7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E16C1107ACE3
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 14:14:28 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10662608DB;
 Thu, 20 May 2021 14:14:20 +0000 (UTC)
Date: Thu, 20 May 2021 16:14:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [RFC PATCH v4 4/7] hw/pci/pcie: Do not set HPC flag if acpihp
 is used
Message-ID: <20210520161418.67830214@redhat.com>
In-Reply-To: <20210513062642.3027987-5-jusual@redhat.com>
References: <20210513062642.3027987-1-jusual@redhat.com>
 <20210513062642.3027987-5-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 May 2021 08:26:39 +0200
Julia Suvorova <jusual@redhat.com> wrote:

> Instead of changing the hot-plug type in _OSC register, do not
> set the 'Hot-Plug Capable' flag. This way guest will choose ACPI
> hot-plug if it is preferred and leave the option to use SHPC with
> pcie-pci-bridge.
> 
> The ability to control hot-plug for each downstream port is retained,
> while 'hotplug=off' on the port means all hot-plug types are disabled.
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  include/hw/boards.h |  1 +
>  hw/acpi/pcihp.c     |  8 ++++++++
>  hw/core/machine.c   | 19 +++++++++++++++++++
>  hw/i386/pc_q35.c    |  8 ++++++++
>  hw/pci/pcie.c       | 11 ++++++++++-
>  5 files changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 3d55d2bd62..a20ca5ab37 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -334,6 +334,7 @@ struct MachineState {
>      CpuTopology smp;
>      struct NVDIMMState *nvdimms_state;
>      struct NumaState *numa_state;
> +    bool native_pci_hotplug;
>  };
>  
>  #define DEFINE_MACHINE(namestr, machine_initfn) \
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 5355618608..7a6bc1b31e 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -31,6 +31,7 @@
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bridge.h"
>  #include "hw/pci/pci_host.h"
> +#include "hw/pci/pcie_port.h"
>  #include "hw/i386/acpi-build.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/pci/pci_bus.h"
> @@ -332,6 +333,13 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
>              object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
>              PCIBus *sec = pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
>  
> +            /* Remove all hot-plug handlers if hot-plug is disabled on slot */
> +            if (object_dynamic_cast(OBJECT(dev), TYPE_PCIE_SLOT) &&
> +                !PCIE_SLOT(pdev)->hotplug) {
> +                qbus_set_hotplug_handler(BUS(sec), NULL);
> +                return;
> +            }
> +
>              qbus_set_hotplug_handler(BUS(sec), OBJECT(hotplug_dev));
>              /* We don't have to overwrite any other hotplug handler yet */
>              assert(QLIST_EMPTY(&sec->child));
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 1bf0e687b9..a3411f0e04 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -581,6 +581,21 @@ static void machine_set_memdev(Object *obj, const char *value, Error **errp)
>      ms->ram_memdev_id = g_strdup(value);
>  }
>  
> +static void machine_set_native_pci_hotplug(Object *obj, bool value,
> +                                           Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    ms->native_pci_hotplug = value;
> +}
> +
> +static bool machine_get_native_pci_hotplug(Object *obj, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    return ms->native_pci_hotplug;
> +}
> +
>  
>  static void machine_init_notify(Notifier *notifier, void *data)
>  {
> @@ -891,6 +906,10 @@ static void machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_set_description(oc, "confidential-guest-support",
>                                            "Set confidential guest scheme to support");
>  
> +    object_class_property_add_bool(oc, "x-native-pci-hotplug",
> +                                   machine_get_native_pci_hotplug,
> +                                   machine_set_native_pci_hotplug);
> +
>      /* For compatibility */
>      object_class_property_add_str(oc, "memory-encryption",
>          machine_get_memory_encryption, machine_set_memory_encryption);
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 46a0f196f4..1059ebfdc7 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -136,6 +136,7 @@ static void pc_q35_init(MachineState *machine)
>      ram_addr_t lowmem;
>      DriveInfo *hd[MAX_SATA_PORTS];
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
> +    bool acpi_pcihp;
>  
>      /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
>       * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
> @@ -236,6 +237,13 @@ static void pc_q35_init(MachineState *machine)
>      object_property_set_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
>                               OBJECT(lpc), &error_abort);
>  
> +    acpi_pcihp = object_property_get_bool(OBJECT(lpc),
> +                                          "acpi-pci-hotplug-with-bridge-support",
> +                                          NULL);
> +
> +    object_property_set_bool(OBJECT(machine), "x-native-pci-hotplug",
> +                             !acpi_pcihp, NULL);
>      /* irq lines */
>      gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
>  
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index fd0fa157e8..be331310c3 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -517,6 +517,9 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
>  void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
>  {
>      uint32_t pos = dev->exp.exp_cap;
> +    bool native_pcihp_enabled = object_property_get_bool(qdev_get_machine(),
> +                                                         "x-native-pci-hotplug",
> +                                                         NULL);

how about replacing of q35_machine -> machine -> qdev_get_machine() with
PCIESlot::enable_native_hotplug property
and then in pc_q35_init() just adding compat/global property at runtime

  if(acpi_hotplug)
      object_register_sugar_prop(TYPE_PCIE_ROOT_PORT, "enable_native_hotplug",            
                                   "false", true);

after that every port created will have that property set automatically.
or something like this.

It's also hackish but a bit better as you don't have pollute generic machine
code with "x-native-pci-hotplug" and don't have to call qdev_get_machine() for
every port.

>      pci_word_test_and_set_mask(dev->config + pos + PCI_EXP_FLAGS,
>                                 PCI_EXP_FLAGS_SLOT);
> @@ -529,7 +532,13 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
>                                 PCI_EXP_SLTCAP_PIP |
>                                 PCI_EXP_SLTCAP_AIP |
>                                 PCI_EXP_SLTCAP_ABP);
> -    if (s->hotplug) {
> +
> +    /*
> +     * Enable native hot-plug on all hot-plugged bridges unless
> +     * hot-plug is disabled on the slot.
> +     */
> +    if (s->hotplug &&
> +        (native_pcihp_enabled || DEVICE(dev)->hotplugged)) {
>          pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCAP,
>                                     PCI_EXP_SLTCAP_HPS |
>                                     PCI_EXP_SLTCAP_HPC);


