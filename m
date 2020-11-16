Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531A62B4B91
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:46:47 +0100 (CET)
Received: from localhost ([::1]:36264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keheQ-0006Ab-D1
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kehc7-0004zE-MA
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:44:23 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1kehc4-00038k-Pf
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:44:23 -0500
Received: from fraeml737-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4CZZcR1g7Rz67DX4;
 Tue, 17 Nov 2020 00:42:31 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml737-chm.china.huawei.com (10.206.15.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 16 Nov 2020 17:44:17 +0100
Received: from localhost (10.52.125.36) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1913.5; Mon, 16 Nov
 2020 16:44:17 +0000
Date: Mon, 16 Nov 2020 16:44:09 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH 11/25] hw/pxb: Allow creation of a CXL PXB (host
 bridge)
Message-ID: <20201116164409.00005f3b@Huawei.com>
In-Reply-To: <20201111054724.794888-12-ben.widawsky@intel.com>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201111054724.794888-12-ben.widawsky@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.125.36]
X-ClientProxiedBy: lhreml702-chm.china.huawei.com (10.201.108.51) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 11:37:31
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Dan
 Williams <dan.j.williams@intel.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 21:47:10 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> This works like adding a typical pxb device, except the name is
> 'pxb-cxl' instead of 'pxb-pcie'. An example command line would be as
> follows:
>   -device pxb-cxl,id=cxl.0,bus="pcie.0",bus_nr=1
> 
> A CXL PXB is backward compatible with PCIe. What this means in practice
> is that an operating system that is unaware of CXL should still be able
> to enumerate this topology as if it were PCIe.
> 
> One can create multiple CXL PXB host bridges, but a host bridge can only
> be connected to the main root bus. Host bridges cannot appear elsewhere
> in the topology.
> 
> Note that as of this patch, the ACPI tables needed for the host bridge
> (specifically, an ACPI object in _SB named ACPI0016 and the CEDT) aren't
> created. So while this patch internally creates it, it cannot be
> properly used by an operating system or other system software.
> 
> Upcoming patches will allow creating multiple host bridges.
> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Hi Ben,

Few minor things inline.

Jonathan

> ---
>  hw/pci-bridge/pci_expander_bridge.c | 67 ++++++++++++++++++++++++++++-
>  hw/pci/pci.c                        |  7 +++
>  include/hw/pci/pci.h                |  6 +++
>  3 files changed, 78 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> index 88c45dc3b5..3a8d815231 100644
> --- a/hw/pci-bridge/pci_expander_bridge.c
> +++ b/hw/pci-bridge/pci_expander_bridge.c
> @@ -56,6 +56,10 @@ DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
>  DECLARE_INSTANCE_CHECKER(PXBDev, PXB_PCIE_DEV,
>                           TYPE_PXB_PCIE_DEVICE)
>  
> +#define TYPE_PXB_CXL_DEVICE "pxb-cxl"
> +DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
> +                         TYPE_PXB_CXL_DEVICE)
> +
>  struct PXBDev {
>      /*< private >*/
>      PCIDevice parent_obj;
> @@ -67,6 +71,11 @@ struct PXBDev {
>  
>  static PXBDev *convert_to_pxb(PCIDevice *dev)
>  {
> +    /* A CXL PXB's parent bus is PCIe, so the normal check won't work */
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PXB_CXL_DEVICE)) {
> +        return PXB_CXL_DEV(dev);
> +    }
> +
>      return pci_bus_is_express(pci_get_bus(dev))
>          ? PXB_PCIE_DEV(dev) : PXB_DEV(dev);
>  }
> @@ -111,11 +120,20 @@ static const TypeInfo pxb_pcie_bus_info = {
>      .class_init    = pxb_bus_class_init,
>  };
>  
> +static const TypeInfo pxb_cxl_bus_info = {
> +    .name          = TYPE_PXB_CXL_BUS,
> +    .parent        = TYPE_CXL_BUS,
> +    .instance_size = sizeof(PXBBus),
> +    .class_init    = pxb_bus_class_init,
> +};
> +
>  static const char *pxb_host_root_bus_path(PCIHostState *host_bridge,
>                                            PCIBus *rootbus)
>  {
> -    PXBBus *bus = pci_bus_is_express(rootbus) ?
> -                  PXB_PCIE_BUS(rootbus) : PXB_BUS(rootbus);
> +    PXBBus *bus = pci_bus_is_cxl(rootbus) ?
> +                      PXB_CXL_BUS(rootbus) :
> +                      pci_bus_is_express(rootbus) ? PXB_PCIE_BUS(rootbus) :
> +                                                    PXB_BUS(rootbus);

There comes a point where if / else is much more readable.

>  
>      snprintf(bus->bus_path, 8, "0000:%02x", pxb_bus_num(rootbus));
>      return bus->bus_path;
> @@ -380,13 +398,58 @@ static const TypeInfo pxb_pcie_dev_info = {
>      },
>  };
>  
> +static void pxb_cxl_dev_realize(PCIDevice *dev, Error **errp)
> +{
> +    /* A CXL PXB's parent bus is still PCIe */
> +    if (!pci_bus_is_express(pci_get_bus(dev))) {
> +        error_setg(errp, "pxb-cxl devices cannot reside on a PCI bus");
> +        return;
> +    }
> +
> +    pxb_dev_realize_common(dev, CXL, errp);
> +}
> +
> +static void pxb_cxl_dev_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc   = DEVICE_CLASS(klass);
> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +
> +    k->realize             = pxb_cxl_dev_realize;
> +    k->exit                = pxb_dev_exitfn;
> +    k->vendor_id           = PCI_VENDOR_ID_INTEL;
> +    k->device_id           = 0xabcd;

Just to check, is that an officially assigned device_id that we will never
have a clash with?  Nice ID to get if it is :)


> +    k->class_id            = PCI_CLASS_BRIDGE_HOST;
> +    k->subsystem_vendor_id = PCI_VENDOR_ID_INTEL;
> +
> +    dc->desc = "CXL Host Bridge";
> +    device_class_set_props(dc, pxb_dev_properties);
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +
> +    /* Host bridges aren't hotpluggable. FIXME: spec reference */
> +    dc->hotpluggable = false;
> +}
> +
> +static const TypeInfo pxb_cxl_dev_info = {
> +    .name          = TYPE_PXB_CXL_DEVICE,
> +    .parent        = TYPE_PCI_DEVICE,
> +    .instance_size = sizeof(PXBDev),
> +    .class_init    = pxb_cxl_dev_class_init,
> +    .interfaces =
> +        (InterfaceInfo[]){
> +            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> +            {},
> +        },
> +};
> +
>  static void pxb_register_types(void)
>  {
>      type_register_static(&pxb_bus_info);
>      type_register_static(&pxb_pcie_bus_info);
> +    type_register_static(&pxb_cxl_bus_info);
>      type_register_static(&pxb_host_info);
>      type_register_static(&pxb_dev_info);
>      type_register_static(&pxb_pcie_dev_info);
> +    type_register_static(&pxb_cxl_dev_info);
>  }
>  
>  type_init(pxb_register_types)
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index db88788c4b..67eed889a4 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -220,6 +220,12 @@ static const TypeInfo pcie_bus_info = {
>      .class_init = pcie_bus_class_init,
>  };
>  
> +static const TypeInfo cxl_bus_info = {
> +    .name       = TYPE_CXL_BUS,
> +    .parent     = TYPE_PCIE_BUS,
> +    .class_init = pcie_bus_class_init,
> +};
> +
>  static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
>  static void pci_update_mappings(PCIDevice *d);
>  static void pci_irq_handler(void *opaque, int irq_num, int level);
> @@ -2847,6 +2853,7 @@ static void pci_register_types(void)
>  {
>      type_register_static(&pci_bus_info);
>      type_register_static(&pcie_bus_info);
> +    type_register_static(&cxl_bus_info);
>      type_register_static(&conventional_pci_interface_info);
>      type_register_static(&cxl_interface_info);
>      type_register_static(&pcie_interface_info);
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 4e6fd59fdd..52267ff69e 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -405,6 +405,7 @@ typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
>  #define TYPE_PCI_BUS "PCI"
>  OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
>  #define TYPE_PCIE_BUS "PCIE"
> +#define TYPE_CXL_BUS "CXL"
>  
>  bool pci_bus_is_express(PCIBus *bus);
>  
> @@ -753,6 +754,11 @@ static inline void pci_irq_pulse(PCIDevice *pci_dev)
>      pci_irq_deassert(pci_dev);
>  }
>  
> +static inline int pci_is_cxl(const PCIDevice *d)
> +{
> +    return d->cap_present & QEMU_PCIE_CAP_CXL;
> +}
> +
>  static inline int pci_is_express(const PCIDevice *d)
>  {
>      return d->cap_present & QEMU_PCI_CAP_EXPRESS;


