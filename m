Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBFD276B0C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 09:43:09 +0200 (CEST)
Received: from localhost ([::1]:54944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLLuG-0004Rc-RB
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 03:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kLLpI-00074z-DV
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 03:38:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kLLpF-000141-7m
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 03:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600933075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MbSt/ya7qXd8FOmHwNRljG3AWe/cZqOw+DXOrZ0XOXs=;
 b=Qq6pPnrw7V0r7/53A3F6iU27+kq93lj0tNCdJ0AEez8qlLuP65KVGwaDnhbDxYhU1Y9f9d
 ZFswx1k7z52bwKytYGRb63ZazP6Uy/6nmgcO1xymOiAYKrFC41pf2VM+ZijXc0ShRZuXpz
 eIRxP4NXXWNhATaJ8O798QbYuPzT4as=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-8kJhGt-rMtePmc0lDO2TXQ-1; Thu, 24 Sep 2020 03:37:53 -0400
X-MC-Unique: 8kJhGt-rMtePmc0lDO2TXQ-1
Received: by mail-wm1-f71.google.com with SMTP id t10so545294wmi.9
 for <qemu-devel@nongnu.org>; Thu, 24 Sep 2020 00:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MbSt/ya7qXd8FOmHwNRljG3AWe/cZqOw+DXOrZ0XOXs=;
 b=aMVPg2zDyegR4bs9azZAuaCldY/rB/LPYJ0hkf7vLKSKJz0ncRnGV/Rr4sXYTGRX3t
 xjUON5hUKutXnM+5DFdJNgNu5ha73rZWwwyik3iRiX5RH0DMWwvrTIB3F0vbSiMqWI1+
 no3JH8aX6F4+/w0ZUSVHDFUrO0W0cgT4pLKKUt4+3wPAFeXPmHh4jkoKGkKdH9JEEEgN
 EWJikkUMSh8I623453kQ7ELNQoiFcekd7HoItc95sw55z+p5kQ8or3RTy5nEvZ04WHDz
 Fp2vKXw71+3z25gyIZiNuuxW3hXl1AsY8AbrAMkqNdOrhIIyEGjFVEJY1MC0/iM4ctq6
 0eVw==
X-Gm-Message-State: AOAM531OdmlKndse+N4xyQeXGuFu28zE0IbvflI2DU2ieVBOtJwG6iXF
 IpEGiF8L6TSmrhyfjS+Gf7k0SoMTjvrg3tZdnEmQ/jAZOxsYe/V4HzaSXmkxmCfRfPMM236V/mf
 67g1t++sBURn6Uu8=
X-Received: by 2002:adf:cf01:: with SMTP id o1mr3535643wrj.421.1600933071879; 
 Thu, 24 Sep 2020 00:37:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIdZBe6DjFuAjcJm/PzzvTHVq2wTnSHxrqUOyWiXozVfVCySp6zRlaTQ/Cx1UQfcNgbCqmNA==
X-Received: by 2002:adf:cf01:: with SMTP id o1mr3535617wrj.421.1600933071579; 
 Thu, 24 Sep 2020 00:37:51 -0700 (PDT)
Received: from redhat.com (bzq-79-179-71-128.red.bezeqint.net. [79.179.71.128])
 by smtp.gmail.com with ESMTPSA id d23sm2256741wmb.6.2020.09.24.00.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 00:37:50 -0700 (PDT)
Date: Thu, 24 Sep 2020 03:37:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [RFC PATCH v3 4/7] hw/acpi/ich9: Enable ACPI PCI hot-plug
Message-ID: <20200924033722-mutt-send-email-mst@kernel.org>
References: <20200924070013.165026-1-jusual@redhat.com>
 <20200924070013.165026-5-jusual@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200924070013.165026-5-jusual@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 24, 2020 at 09:00:10AM +0200, Julia Suvorova wrote:
> Add acpi_pcihp to ich9_pm as part of
> 'acpi-pci-hotplug-with-bridge-support' option. Set default to false.
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  hw/i386/acpi-build.h   |  1 +
>  include/hw/acpi/ich9.h |  3 ++
>  hw/acpi/ich9.c         | 67 ++++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/pcihp.c        |  5 +++-
>  hw/i386/acpi-build.c   |  2 +-
>  5 files changed, 76 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
> index 4c5bfb3d0b..39f143830a 100644
> --- a/hw/i386/acpi-build.h
> +++ b/hw/i386/acpi-build.h
> @@ -10,6 +10,7 @@ extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
>  #define ACPI_PCIHP_BNMR_BASE 0x10
>  
>  void acpi_setup(void);
> +Object *acpi_get_i386_pci_host(void);
>  
>  Object *object_resolve_type_unambiguous(const char *typename);
>  
> diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> index 4d19571ed7..833e62fefe 100644
> --- a/include/hw/acpi/ich9.h
> +++ b/include/hw/acpi/ich9.h
> @@ -24,6 +24,7 @@
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/cpu_hotplug.h"
>  #include "hw/acpi/cpu.h"
> +#include "hw/acpi/pcihp.h"
>  #include "hw/acpi/memory_hotplug.h"
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/acpi/tco.h"
> @@ -55,6 +56,8 @@ typedef struct ICH9LPCPMRegs {
>      AcpiCpuHotplug gpe_cpu;
>      CPUHotplugState cpuhp_state;
>  
> +    bool use_acpi_hotplug_bridge;
> +    AcpiPciHpState acpi_pci_hotplug;
>      MemHotplugState acpi_memory_hotplug;
>  
>      uint8_t disable_s3;
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 6a19070cec..987f23e388 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -218,6 +218,26 @@ static const VMStateDescription vmstate_cpuhp_state = {
>      }
>  };
>  
> +static bool vmstate_test_use_pcihp(void *opaque)
> +{
> +    ICH9LPCPMRegs *s = opaque;
> +
> +    return s->use_acpi_hotplug_bridge;
> +}
> +
> +static const VMStateDescription vmstate_pcihp_state = {
> +    .name = "ich9_pm/pcihp",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = vmstate_test_use_pcihp,
> +    .fields      = (VMStateField[]) {
> +        VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug,
> +                            ICH9LPCPMRegs,
> +                            NULL),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  const VMStateDescription vmstate_ich9_pm = {
>      .name = "ich9_pm",
>      .version_id = 1,
> @@ -239,6 +259,7 @@ const VMStateDescription vmstate_ich9_pm = {
>          &vmstate_memhp_state,
>          &vmstate_tco_io_state,
>          &vmstate_cpuhp_state,
> +        &vmstate_pcihp_state,
>          NULL
>      }
>  };
> @@ -260,6 +281,7 @@ static void pm_reset(void *opaque)
>      }
>      pm->smi_en_wmask = ~0;
>  
> +    acpi_pcihp_reset(&pm->acpi_pci_hotplug, true);
>      acpi_update_sci(&pm->acpi_regs, pm->irq);
>  }
>  
> @@ -298,6 +320,18 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
>      pm->enable_tco = true;
>      acpi_pm_tco_init(&pm->tco_regs, &pm->io);
>  
> +    if (pm->use_acpi_hotplug_bridge) {
> +        acpi_pcihp_init(OBJECT(lpc_pci),
> +                        &pm->acpi_pci_hotplug,
> +                        pci_get_bus(lpc_pci),
> +                        pci_address_space_io(lpc_pci),
> +                        true,
> +                        ACPI_PCIHP_ADDR_ICH9);
> +
> +        qbus_set_hotplug_handler(BUS(pci_get_bus(lpc_pci)),
> +                                 OBJECT(lpc_pci));
> +    }
> +
>      pm->irq = sci_irq;
>      qemu_register_reset(pm_reset, pm);
>      pm->powerdown_notifier.notify = pm_powerdown_req;
> @@ -369,6 +403,20 @@ static void ich9_pm_set_enable_tco(Object *obj, bool value, Error **errp)
>      s->pm.enable_tco = value;
>  }
>  
> +static bool ich9_pm_get_acpi_pci_hotplug(Object *obj, Error **errp)
> +{
> +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> +
> +    return s->pm.use_acpi_hotplug_bridge;
> +}
> +
> +static void ich9_pm_set_acpi_pci_hotplug(Object *obj, bool value,
> +                                               Error **errp)
> +{
> +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> +
> +    s->pm.use_acpi_hotplug_bridge = value;
> +}
>  void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>  {
>      static const uint32_t gpe0_len = ICH9_PMIO_GPE0_LEN;
> @@ -377,6 +425,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>      pm->disable_s3 = 0;
>      pm->disable_s4 = 0;
>      pm->s4_val = 2;
> +    pm->use_acpi_hotplug_bridge = false;
>  
>      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
>                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> @@ -400,6 +449,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>      object_property_add_bool(obj, ACPI_PM_PROP_TCO_ENABLED,
>                               ich9_pm_get_enable_tco,
>                               ich9_pm_set_enable_tco);
> +    object_property_add_bool(obj, "acpi-pci-hotplug-with-bridge-support",
> +                             ich9_pm_get_acpi_pci_hotplug,
> +                             ich9_pm_set_acpi_pci_hotplug);
>  }
>  
>  void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,

I guess the property name would make sense in pcie.h or something like
this.



> @@ -407,6 +459,11 @@ void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>  {
>      ICH9LPCState *lpc = ICH9_LPC_DEVICE(hotplug_dev);
>  
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_pre_plug_cb(hotplug_dev, dev, errp);
> +        return;
> +    }
> +
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
>          !lpc->pm.acpi_memory_hotplug.is_enabled)
>          error_setg(errp,
> @@ -432,6 +489,9 @@ void ich9_pm_device_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>          } else {
>              acpi_cpu_plug_cb(hotplug_dev, &lpc->pm.cpuhp_state, dev, errp);
>          }
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_plug_cb(hotplug_dev, &lpc->pm.acpi_pci_hotplug,
> +                                  dev, errp);
>      } else {
>          error_setg(errp, "acpi: device plug request for not supported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -452,6 +512,10 @@ void ich9_pm_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>                 !lpc->pm.cpu_hotplug_legacy) {
>          acpi_cpu_unplug_request_cb(hotplug_dev, &lpc->pm.cpuhp_state,
>                                     dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_unplug_request_cb(hotplug_dev,
> +                                            &lpc->pm.acpi_pci_hotplug,
> +                                            dev, errp);
>      } else {
>          error_setg(errp, "acpi: device unplug request for not supported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -469,6 +533,9 @@ void ich9_pm_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU) &&
>                 !lpc->pm.cpu_hotplug_legacy) {
>          acpi_cpu_unplug_cb(&lpc->pm.cpuhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_unplug_cb(hotplug_dev, &lpc->pm.acpi_pci_hotplug,
> +                                    dev, errp);
>      } else {
>          error_setg(errp, "acpi: device unplug for not supported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index bb457bc279..8ab65502ce 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -30,6 +30,8 @@
>  #include "hw/pci-host/i440fx.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bridge.h"
> +#include "hw/pci/pci_host.h"
> +#include "hw/i386/acpi-build.h"
>  #include "hw/acpi/acpi.h"
>  #include "exec/address-spaces.h"
>  #include "hw/pci/pci_bus.h"
> @@ -88,6 +90,7 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
>  static void acpi_set_pci_info(void)
>  {
>      static bool bsel_is_set;
> +    Object *host = acpi_get_i386_pci_host();
>      PCIBus *bus;
>      unsigned bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT;
>  
> @@ -96,7 +99,7 @@ static void acpi_set_pci_info(void)
>      }
>      bsel_is_set = true;
>  
> -    bus = find_i440fx(); /* TODO: Q35 support */
> +    bus = PCI_HOST_BRIDGE(host)->bus;
>      if (bus) {
>          /* Scan all PCI buses. Set property to enable acpi based hotplug. */
>          pci_for_each_bus_depth_first(bus, acpi_set_bsel, NULL, &bsel_alloc);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index b7811a8912..8787b6fb33 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -270,7 +270,7 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
>   * Because of the PXB hosts we cannot simply query TYPE_PCI_HOST_BRIDGE.
>   * On i386 arch we only have two pci hosts, so we can look only for them.
>   */
> -static Object *acpi_get_i386_pci_host(void)
> +Object *acpi_get_i386_pci_host(void)
>  {
>      PCIHostState *host;
>  
> -- 
> 2.25.4


