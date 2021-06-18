Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9F53ACB3F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 14:41:30 +0200 (CEST)
Received: from localhost ([::1]:33876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luDoP-0002K6-1S
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 08:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1luDmQ-0000gu-Rh
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 08:39:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1luDmN-0003fQ-96
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 08:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624019961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EVTNbHKU0Ap5W1lWRc2C8ayn4p7co3MaUxL4d+Bomh0=;
 b=AABmuY3FpRkK7hnSs1NbUI2IxFhXZhHjZax3m652r+7MfCyzwT8kaZRXRUlMowA7/zv9A+
 WqtMIpq0zfFPmIvllgeBzNxPjRWfMb/e5IcscPAnPUo94agyfY9luZ7VEyg6txed9qY8Kk
 c4VY+JGr3b4nqBcyWAju20EijkKO9vo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-ZpfCkocCNg2Otfs94-wm3w-1; Fri, 18 Jun 2021 08:39:20 -0400
X-MC-Unique: ZpfCkocCNg2Otfs94-wm3w-1
Received: by mail-wr1-f69.google.com with SMTP id
 h17-20020adff4d10000b029011a7b7961dbso2105190wrp.15
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 05:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EVTNbHKU0Ap5W1lWRc2C8ayn4p7co3MaUxL4d+Bomh0=;
 b=fbOTN1kALbPQqnX86wCoBr6EqF/zmNShIPxijvVjCFskCZxXYdOQhQdbHDULgnZus7
 WPxDiUaaJWR4myzisO6weOEZLtVF7dpHAhWzLMqH8QyBk4eFORSgq2sCNPeEHiZfc45a
 KyDXFzUh+lV+UigP0QktS1R9nc437sWm4hklDGnsfe0yg4BZzSZ1uk97LiuLRfBjH19/
 ++qrxLaN1jWcNwAexWVtsqVsQRGxyHETzgjTP7XMA5zF8dtPj+bQ+lt1H8z/Sf8Ban8k
 HQpT6APwx90UNV8SxiXW+hgK8CABGQ4oJc4rUIfTQKDxj1mjyl0EkWlVEOx9YkLyMA/Q
 MCAQ==
X-Gm-Message-State: AOAM532RLroDRn1iOCFVVrhl055aQ8TlK+t9YpLrtjNDtSE8g31xNeI7
 qSlGl4NLjTLOnChiOnznEMiTcQ4MN5uRDnqQfqIqKGK8XiEfLOHfkBzW/nsHpdEdKA75zUltuMW
 FyT6VdWhZ1On7onc=
X-Received: by 2002:a1c:28a:: with SMTP id 132mr11223339wmc.120.1624019958949; 
 Fri, 18 Jun 2021 05:39:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytp3cDTDK1UibVDA1j/c4PVcojFPL6rtuoJyv3BXzsfTc1UnsjiwyMS7wmhGMdu5hmoggKCg==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr11223317wmc.120.1624019958738; 
 Fri, 18 Jun 2021 05:39:18 -0700 (PDT)
Received: from redhat.com ([77.126.22.11])
 by smtp.gmail.com with ESMTPSA id o7sm8718988wro.76.2021.06.18.05.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 05:39:18 -0700 (PDT)
Date: Fri, 18 Jun 2021 08:39:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v5 4/7] hw/pci/pcie: Do not set HPC flag if acpihp is used
Message-ID: <20210618083843-mutt-send-email-mst@kernel.org>
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-5-jusual@redhat.com>
 <20210618135440.5fcaaeae@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210618135440.5fcaaeae@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 18, 2021 at 01:54:40PM +0200, Igor Mammedov wrote:
> On Thu, 17 Jun 2021 21:07:36 +0200
> Julia Suvorova <jusual@redhat.com> wrote:
> 
> > Instead of changing the hot-plug type in _OSC register, do not
> > set the 'Hot-Plug Capable' flag. This way guest will choose ACPI
> > hot-plug if it is preferred and leave the option to use SHPC with
> > pcie-pci-bridge.
> > 
> > The ability to control hot-plug for each downstream port is retained,
> > while 'hotplug=off' on the port means all hot-plug types are disabled.
> > 
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > ---
> >  include/hw/pci/pcie_port.h |  5 ++++-
> >  hw/acpi/pcihp.c            |  8 ++++++++
> >  hw/core/machine.c          |  1 -
> >  hw/i386/pc_q35.c           | 11 +++++++++++
> >  hw/pci/pcie.c              |  8 +++++++-
> >  hw/pci/pcie_port.c         |  1 +
> >  6 files changed, 31 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
> > index bea8ecad0f..e25b289ce8 100644
> > --- a/include/hw/pci/pcie_port.h
> > +++ b/include/hw/pci/pcie_port.h
> > @@ -57,8 +57,11 @@ struct PCIESlot {
> >      /* Disable ACS (really for a pcie_root_port) */
> >      bool        disable_acs;
> >  
> > -    /* Indicates whether hot-plug is enabled on the slot */
> > +    /* Indicates whether any type of hot-plug is allowed on the slot */
> >      bool        hotplug;
> > +
> > +    bool        native_hotplug;
> > +
> >      QLIST_ENTRY(PCIESlot) next;
> >  };
> >  
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > index 5355618608..7a6bc1b31e 100644
> > --- a/hw/acpi/pcihp.c
> > +++ b/hw/acpi/pcihp.c
> > @@ -31,6 +31,7 @@
> >  #include "hw/pci/pci.h"
> >  #include "hw/pci/pci_bridge.h"
> >  #include "hw/pci/pci_host.h"
> > +#include "hw/pci/pcie_port.h"
> >  #include "hw/i386/acpi-build.h"
> >  #include "hw/acpi/acpi.h"
> >  #include "hw/pci/pci_bus.h"
> > @@ -332,6 +333,13 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
> >              object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
> >              PCIBus *sec = pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
> >  
> > +            /* Remove all hot-plug handlers if hot-plug is disabled on slot */
> > +            if (object_dynamic_cast(OBJECT(dev), TYPE_PCIE_SLOT) &&
> > +                !PCIE_SLOT(pdev)->hotplug) {
> > +                qbus_set_hotplug_handler(BUS(sec), NULL);
> > +                return;
> > +            }
> > +
> >              qbus_set_hotplug_handler(BUS(sec), OBJECT(hotplug_dev));
> >              /* We don't have to overwrite any other hotplug handler yet */
> >              assert(QLIST_EMPTY(&sec->child));
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index 55b9bc7817..6ed0575d81 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -582,7 +582,6 @@ static void machine_set_memdev(Object *obj, const char *value, Error **errp)
> >      ms->ram_memdev_id = g_strdup(value);
> >  }
> >  
> > -
> >  static void machine_init_notify(Notifier *notifier, void *data)
> >  {
> >      MachineState *machine = MACHINE(qdev_get_machine());
> > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > index 46a0f196f4..a0ec7964cc 100644
> > --- a/hw/i386/pc_q35.c
> > +++ b/hw/i386/pc_q35.c
> > @@ -37,6 +37,7 @@
> >  #include "sysemu/kvm.h"
> >  #include "hw/kvm/clock.h"
> >  #include "hw/pci-host/q35.h"
> > +#include "hw/pci/pcie_port.h"
> >  #include "hw/qdev-properties.h"
> >  #include "hw/i386/x86.h"
> >  #include "hw/i386/pc.h"
> > @@ -136,6 +137,7 @@ static void pc_q35_init(MachineState *machine)
> >      ram_addr_t lowmem;
> >      DriveInfo *hd[MAX_SATA_PORTS];
> >      MachineClass *mc = MACHINE_GET_CLASS(machine);
> > +    bool acpi_pcihp;
> >  
> >      /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
> >       * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
> > @@ -236,6 +238,15 @@ static void pc_q35_init(MachineState *machine)
> >      object_property_set_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
> >                               OBJECT(lpc), &error_abort);
> >  
> > +    acpi_pcihp = object_property_get_bool(OBJECT(lpc),
> > +                                          "acpi-pci-hotplug-with-bridge-support",
> > +                                          NULL);
> > +
> > +    if (acpi_pcihp) {
> > +        object_register_sugar_prop(TYPE_PCIE_SLOT, "enable-native-hotplug",
> I'd s/enable-native-hotplug/native-hotplug/
> which is more concise and consistent with other similar properties.
> Perhaps Michael can fix it up on merge.
> 
> [...]

Can be a patch on top - I don't like tweaking code on merge.


> > +    DEFINE_PROP_BOOL("enable-native-hotplug", PCIESlot, native_hotplug, true),
> >      DEFINE_PROP_END_OF_LIST()
> >  };
> >  
> 
> Otherwise looks good to me, so with this or without above nitpicking:
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>


