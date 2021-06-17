Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829323ABDC2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 23:03:56 +0200 (CEST)
Received: from localhost ([::1]:45106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltzB5-0004YO-1X
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 17:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ltz9n-0003sy-MU
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 17:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ltz9j-0006d9-RV
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 17:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623963749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H/xLw6O9kzSkaE5sOdspKlNPwbv+Oe3sAk7LHZtmuQQ=;
 b=BzmikO68XILeyKIMLotCidKjYmA3tg0QJLGwLsuxlJ7jJSa02HmglBBoazsaM2HTLL/yh2
 ay8rdwOT86WUlS8JG7MW4Y/vrs/pmwNmT1HNwF3Hc9ZFgkVFKRl12+tn50YJKAS4j1p75U
 b2f9RJ/eDqplhvUxHlvvsrcavqKZ1as=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-UhNwKA9MNSGCX-9hIPHZSw-1; Thu, 17 Jun 2021 17:02:28 -0400
X-MC-Unique: UhNwKA9MNSGCX-9hIPHZSw-1
Received: by mail-wr1-f69.google.com with SMTP id
 d5-20020a0560001865b0290119bba6e1c7so3434038wri.20
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 14:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H/xLw6O9kzSkaE5sOdspKlNPwbv+Oe3sAk7LHZtmuQQ=;
 b=qXnbQnkzYKgBwPylAvL2s0XTL60ch33fulwCJWfwW97DMa8slPPD6LJMXWIQdGKl2Z
 lFo07giQeYWuvqMp1BfaXnjWjS5EDFaY484a+rJ1x7orFJBDtOyAtFzhgRd+oOh8QUWw
 21Q/ULnoDrt7fqov27ZFAH9HYAxFb1J2C1pO+HAF1K9yCHXLzi7y8P/rB4Ya/p1lCreN
 j7Q66TvLi6mZe+gZvHLJ2g1RETZDfsdTJ0RDIjcCREiTPR7eBKkL8t96v2sbSegV7VEP
 4+2time8z+d8DF8CE/oZZMRdGkoDE7TnqgBAqtdHQlb5+cU7FAFh338mJPV+gRK3+jgv
 yveQ==
X-Gm-Message-State: AOAM533hbTbrAWjgmbjozR+SCL6TEoRtS3VXEqRJrODEeZDaL6bkS3O4
 LEqCWb/6DR78OyOjTWk+q1YlSTb5Sb+ER2CJCKAoKrIOoWkL6InjVCLzbSGx9hAzLIn9ZHQZlut
 +srmY8hgaGtPrqPk=
X-Received: by 2002:a5d:528d:: with SMTP id c13mr8244833wrv.343.1623963746616; 
 Thu, 17 Jun 2021 14:02:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKeUbWBD6ndxzm3/NHMs+TR7Y8+qTqv/nXbw4k1ixEnf4y2vB6mPXfEHW7bqHLbrFOkPcRqg==
X-Received: by 2002:a5d:528d:: with SMTP id c13mr8244815wrv.343.1623963746365; 
 Thu, 17 Jun 2021 14:02:26 -0700 (PDT)
Received: from redhat.com ([77.126.22.11])
 by smtp.gmail.com with ESMTPSA id a12sm6305431wmj.36.2021.06.17.14.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 14:02:25 -0700 (PDT)
Date: Thu, 17 Jun 2021 17:02:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v5 4/7] hw/pci/pcie: Do not set HPC flag if acpihp is used
Message-ID: <20210617170207-mutt-send-email-mst@kernel.org>
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-5-jusual@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210617190739.3673064-5-jusual@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 09:07:36PM +0200, Julia Suvorova wrote:
> Instead of changing the hot-plug type in _OSC register, do not
> set the 'Hot-Plug Capable' flag. This way guest will choose ACPI
> hot-plug if it is preferred and leave the option to use SHPC with
> pcie-pci-bridge.
> 
> The ability to control hot-plug for each downstream port is retained,
> while 'hotplug=off' on the port means all hot-plug types are disabled.
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>

Marcel want to review this?

> ---
>  include/hw/pci/pcie_port.h |  5 ++++-
>  hw/acpi/pcihp.c            |  8 ++++++++
>  hw/core/machine.c          |  1 -
>  hw/i386/pc_q35.c           | 11 +++++++++++
>  hw/pci/pcie.c              |  8 +++++++-
>  hw/pci/pcie_port.c         |  1 +
>  6 files changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
> index bea8ecad0f..e25b289ce8 100644
> --- a/include/hw/pci/pcie_port.h
> +++ b/include/hw/pci/pcie_port.h
> @@ -57,8 +57,11 @@ struct PCIESlot {
>      /* Disable ACS (really for a pcie_root_port) */
>      bool        disable_acs;
>  
> -    /* Indicates whether hot-plug is enabled on the slot */
> +    /* Indicates whether any type of hot-plug is allowed on the slot */
>      bool        hotplug;
> +
> +    bool        native_hotplug;
> +
>      QLIST_ENTRY(PCIESlot) next;
>  };
>  
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
> index 55b9bc7817..6ed0575d81 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -582,7 +582,6 @@ static void machine_set_memdev(Object *obj, const char *value, Error **errp)
>      ms->ram_memdev_id = g_strdup(value);
>  }
>  
> -
>  static void machine_init_notify(Notifier *notifier, void *data)
>  {
>      MachineState *machine = MACHINE(qdev_get_machine());
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 46a0f196f4..a0ec7964cc 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -37,6 +37,7 @@
>  #include "sysemu/kvm.h"
>  #include "hw/kvm/clock.h"
>  #include "hw/pci-host/q35.h"
> +#include "hw/pci/pcie_port.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/i386/x86.h"
>  #include "hw/i386/pc.h"
> @@ -136,6 +137,7 @@ static void pc_q35_init(MachineState *machine)
>      ram_addr_t lowmem;
>      DriveInfo *hd[MAX_SATA_PORTS];
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
> +    bool acpi_pcihp;
>  
>      /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
>       * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
> @@ -236,6 +238,15 @@ static void pc_q35_init(MachineState *machine)
>      object_property_set_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
>                               OBJECT(lpc), &error_abort);
>  
> +    acpi_pcihp = object_property_get_bool(OBJECT(lpc),
> +                                          "acpi-pci-hotplug-with-bridge-support",
> +                                          NULL);
> +
> +    if (acpi_pcihp) {
> +        object_register_sugar_prop(TYPE_PCIE_SLOT, "enable-native-hotplug",
> +                                  "false", true);
> +    }
> +
>      /* irq lines */
>      gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
>  
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index fd0fa157e8..6e95d82903 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -529,7 +529,13 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
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
> +        (s->native_hotplug || DEVICE(dev)->hotplugged)) {
>          pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCAP,
>                                     PCI_EXP_SLTCAP_HPS |
>                                     PCI_EXP_SLTCAP_HPC);
> diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
> index eb563ad435..a410111825 100644
> --- a/hw/pci/pcie_port.c
> +++ b/hw/pci/pcie_port.c
> @@ -148,6 +148,7 @@ static Property pcie_slot_props[] = {
>      DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
>      DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
>      DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
> +    DEFINE_PROP_BOOL("enable-native-hotplug", PCIESlot, native_hotplug, true),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> -- 
> 2.30.2


