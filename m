Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC61307914
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:08:05 +0100 (CET)
Received: from localhost ([::1]:48880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58tw-0002Br-Vd
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:08:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l58pe-00080M-IQ
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:03:38 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:48616
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l58pc-0006u2-2Q
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:03:38 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id 9196D123395; Thu, 28 Jan 2021 07:03:34 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 41C32122C5B;
 Thu, 28 Jan 2021 07:03:20 -0800 (PST)
Date: Thu, 28 Jan 2021 07:03:18 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [RFC PATCH v2 24/32] hw/cxl/device: Add a memory device (8.2.8.5)
Message-ID: <20210128150318.ujl2uzyzbygqnlg2@mail.bwidawsk.net>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
 <20210105165323.783725-25-ben.widawsky@intel.com>
 <20210127220312.6850abe2@redhat.com>
 <20210127212645.ztuxaopjnwtm7u2i@intel.com>
 <20210128102538.000066ff@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128102538.000066ff@Huawei.com>
Received-SPF: none client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Chris Browy <cbrowy@avery-design.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Prashant V Agarwal <agpr123@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-28 10:25:38, Jonathan Cameron wrote:
> On Wed, 27 Jan 2021 13:26:45 -0800
> Ben Widawsky <ben.widawsky@intel.com> wrote:
> 
> > On 21-01-27 22:03:12, Igor Mammedov wrote:
> > > On Tue,  5 Jan 2021 08:53:15 -0800
> > > Ben Widawsky <ben.widawsky@intel.com> wrote:
> > >   
> > > > A CXL memory device (AKA Type 3) is a CXL component that contains some
> > > > combination of volatile and persistent memory. It also implements the
> > > > previously defined mailbox interface as well as the memory device
> > > > firmware interface.
> > > > 
> > > > The following example will create a 256M device in a 512M window:
> > > > 
> > > > -object "memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M"
> > > > -device "cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0,size=256M"  
> > > 
> > > I'd expect whole backend used by frontend, so one would not need "size" property
> > > on frontend (like we do with memory devices).
> > > So question is why it partially uses memdev?  
> > 
> > Answered in a separate thread...
> 
> One possible suggestion inline.
> 
> > > > +
> > > > +static void cxl_setup_memory(CXLType3Dev *ct3d, Error **errp)
> > > > +{
> > > > +    MemoryRegionSection mrs;
> > > > +    MemoryRegion *mr;
> > > > +    uint64_t offset = 0;
> > > > +    size_t remaining_size;
> > > > +
> > > > +    if (!ct3d->hostmem) {
> > > > +        error_setg(errp, "memdev property must be set");
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    /* FIXME: need to check mr is the host bridge's MR */
> > > > +    mr = host_memory_backend_get_memory(ct3d->hostmem);
> > > > +
> > > > +    /* Create our new subregion */
> > > > +    ct3d->cxl_dstate.pmem = g_new(MemoryRegion, 1);
> > > > +
> > > > +    /* Find the first free space in the window */
> > > > +    WITH_RCU_READ_LOCK_GUARD()
> > > > +    {
> > > > +        mrs = memory_region_find(mr, offset, 1);
> > > > +        while (mrs.mr && mrs.mr != mr) {
> > > > +            offset += memory_region_size(mrs.mr);
> > > > +            mrs = memory_region_find(mr, offset, 1);
> > > > +        }
> > > > +    }
> > > > +
> > > > +    remaining_size = memory_region_size(mr) - offset;
> > > > +    if (remaining_size < ct3d->size) {
> > > > +        g_free(ct3d->cxl_dstate.pmem);
> > > > +        error_setg(errp,
> > > > +                   "Not enough free space (%zd) required for device (%" PRId64  ")",
> > > > +                   remaining_size, ct3d->size);
> > > > +    }
> > > > +
> > > > +    /* Register our subregion as non-volatile */
> > > > +    memory_region_init_ram(ct3d->cxl_dstate.pmem, OBJECT(ct3d),
> > > > +                           "cxl_type3-memory", ct3d->size, errp);  
> > > this allocates ct3d->size of anon RAM, was this an intention?
> > > If yes, can you clarify why extra RAM is used instead of using what
> > > backend provides?  
> > 
> > It sounds like I'm doing the wrong thing then. There should be one chunk of
> > memory which is a subset of the full memory backend object. Could you please
> > advise on what I should be doing instead? Is add_subregion() sufficient?
> 
> Taking inspiration from nvdimm I'm carrying a patch that uses
> memory_region_init_alias(ct3d->cxl_dstate.pmem, OBJECT(qct3d)q,
> 			 "cxl_type3-memory", mr, offset, ct3d->size);
> 
> I 'think' that's doing the right thing, but haven't fully tested it yet
> so may be completely wrong :)
> 
> Then for the pmem addr, call memory_region_set_address() to put it
> in a particular location.
> 

Yes - this is what I'd like to do and what I initially tried, and I also believe
it's right, but it doesn't work.

range_invariant: Assertion `range->lob <= range->upb || range->lob == range->upb + 1' failed.

I was digging into this yesterday, but opted to start a new thread on the
matter.

> > 
> > 
> > >   
> > > > +    memory_region_set_nonvolatile(ct3d->cxl_dstate.pmem, true);  
> > >   
> > > > +#ifdef SET_PMEM_PADDR
> > > > +    memory_region_add_subregion(mr, offset, ct3d->cxl_dstate.pmem);
> > > > +#endif  
> > > What this hunk is supposed to do, why it's ifdef-ed?  
> > 
> > In general, the BIOS or OS should program the physical address of the device via
> > a piece of hardware called the HDM (host defined memory) decoder. That is hooked
> > up in the code in a later patch. For debug, I set the address internally in
> > QEMU, mimicking what might be done by BIOS.
> > 
> > > 
> > >   
> > > > +}
> > > > +
> > > > +static MemoryRegion *cxl_md_get_memory_region(MemoryDeviceState *md,
> > > > +                                              Error **errp)
> > > > +{
> > > > +    CXLType3Dev *ct3d = CT3(md);
> > > > +
> > > > +    if (!ct3d->cxl_dstate.pmem) {
> > > > +        cxl_setup_memory(ct3d, errp);
> > > > +    }
> > > > +
> > > > +    return ct3d->cxl_dstate.pmem;
> > > > +}
> > > > +
> > > > +static void ct3_realize(PCIDevice *pci_dev, Error **errp)
> > > > +{
> > > > +    CXLType3Dev *ct3d = CT3(pci_dev);
> > > > +    CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
> > > > +    ComponentRegisters *regs = &cxl_cstate->crb;
> > > > +    MemoryRegion *mr = &regs->component_registers;
> > > > +    uint8_t *pci_conf = pci_dev->config;
> > > > +
> > > > +    if (!ct3d->cxl_dstate.pmem) {
> > > > +        cxl_setup_memory(ct3d, errp);
> > > > +    }
> > > > +
> > > > +    pci_config_set_prog_interface(pci_conf, 0x10);
> > > > +    pci_config_set_class(pci_conf, PCI_CLASS_MEMORY_CXL);
> > > > +
> > > > +    pcie_endpoint_cap_init(pci_dev, 0x80);
> > > > +    cxl_cstate->dvsec_offset = 0x100;
> > > > +
> > > > +    ct3d->cxl_cstate.pdev = pci_dev;
> > > > +    build_dvsecs(ct3d);
> > > > +
> > > > +    cxl_component_register_block_init(OBJECT(pci_dev), cxl_cstate,
> > > > +                                      TYPE_CXL_TYPE3_DEV);
> > > > +
> > > > +    pci_register_bar(
> > > > +        pci_dev, COMPONENT_REG_BAR_IDX,
> > > > +        PCI_BASE_ADDRESS_SPACE_MEMORY | PCI_BASE_ADDRESS_MEM_TYPE_64, mr);
> > > > +
> > > > +    cxl_device_register_block_init(OBJECT(pci_dev), &ct3d->cxl_dstate);
> > > > +    pci_register_bar(pci_dev, DEVICE_REG_BAR_IDX,
> > > > +                     PCI_BASE_ADDRESS_SPACE_MEMORY |
> > > > +                         PCI_BASE_ADDRESS_MEM_TYPE_64,
> > > > +                     &ct3d->cxl_dstate.device_registers);
> > > > +}
> > > > +
> > > > +static uint64_t cxl_md_get_addr(const MemoryDeviceState *md)
> > > > +{
> > > > +    CXLType3Dev *ct3d = CT3(md);
> > > > +
> > > > +    return memory_region_get_ram_addr(ct3d->cxl_dstate.pmem);
> > > > +}
> > > > +
> > > > +static void cxl_md_set_addr(MemoryDeviceState *md, uint64_t addr, Error **errp)
> > > > +{
> > > > +    object_property_set_uint(OBJECT(md), "paddr", addr, errp);
> > > > +}
> > > > +
> > > > +static void ct3d_reset(DeviceState *dev)
> > > > +{
> > > > +    CXLType3Dev *ct3d = CT3(dev);
> > > > +    uint32_t *reg_state = ct3d->cxl_cstate.crb.cache_mem_registers;
> > > > +
> > > > +    cxl_component_register_init_common(reg_state, CXL2_TYPE3_DEVICE);
> > > > +    cxl_device_register_init_common(&ct3d->cxl_dstate);
> > > > +}
> > > > +
> > > > +static Property ct3_props[] = {
> > > > +    DEFINE_PROP_SIZE("size", CXLType3Dev, size, -1),
> > > > +    DEFINE_PROP_LINK("memdev", CXLType3Dev, hostmem, TYPE_MEMORY_BACKEND,
> > > > +                     HostMemoryBackend *),
> > > > +    DEFINE_PROP_END_OF_LIST(),
> > > > +};
> > > > +
> > > > +static void pc_dimm_md_fill_device_info(const MemoryDeviceState *md,
> > > > +                                        MemoryDeviceInfo *info)
> > > > +{
> > > > +    PCDIMMDeviceInfo *di = g_new0(PCDIMMDeviceInfo, 1);
> > > > +    const DeviceClass *dc = DEVICE_GET_CLASS(md);
> > > > +    const DeviceState *dev = DEVICE(md);
> > > > +    CXLType3Dev *ct3d = CT3(md);
> > > > +
> > > > +    if (dev->id) {
> > > > +        di->has_id = true;
> > > > +        di->id = g_strdup(dev->id);
> > > > +    }
> > > > +    di->hotplugged = dev->hotplugged;
> > > > +    di->hotpluggable = dc->hotpluggable;
> > > > +    di->addr = cxl_md_get_addr(md);
> > > > +    di->slot = 0;
> > > > +    di->node = 0;
> > > > +    di->size = memory_device_get_region_size(md, NULL);
> > > > +    di->memdev = object_get_canonical_path(OBJECT(ct3d->hostmem));
> > > > +
> > > > +
> > > > +    info->u.cxl.data = di;
> > > > +    info->type = MEMORY_DEVICE_INFO_KIND_CXL;
> > > > +}
> > > > +
> > > > +static void ct3_class_init(ObjectClass *oc, void *data)
> > > > +{
> > > > +    DeviceClass *dc = DEVICE_CLASS(oc);
> > > > +    PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
> > > > +    MemoryDeviceClass *mdc = MEMORY_DEVICE_CLASS(oc);
> > > > +
> > > > +    pc->realize = ct3_realize;
> > > > +    pc->class_id = PCI_CLASS_STORAGE_EXPRESS;
> > > > +    pc->vendor_id = PCI_VENDOR_ID_INTEL;
> > > > +    pc->device_id = 0xd93; /* LVF for now */
> > > > +    pc->revision = 1;
> > > > +
> > > > +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> > > > +    dc->desc = "CXL PMEM Device (Type 3)";
> > > > +    dc->reset = ct3d_reset;
> > > > +    device_class_set_props(dc, ct3_props);
> > > > +
> > > > +    mdc->get_memory_region = cxl_md_get_memory_region;
> > > > +    mdc->get_addr = cxl_md_get_addr;
> > > > +    mdc->fill_device_info = pc_dimm_md_fill_device_info;
> > > > +    mdc->get_plugged_size = memory_device_get_region_size;
> > > > +    mdc->set_addr = cxl_md_set_addr;
> > > > +}
> > > > +
> > > > +static const TypeInfo ct3d_info = {
> > > > +    .name = TYPE_CXL_TYPE3_DEV,
> > > > +    .parent = TYPE_PCI_DEVICE,
> > > > +    .class_init = ct3_class_init,
> > > > +    .instance_size = sizeof(CXLType3Dev),
> > > > +    .instance_init = ct3_instance_init,
> > > > +    .instance_finalize = ct3_finalize,
> > > > +    .interfaces = (InterfaceInfo[]) {
> > > > +        { TYPE_MEMORY_DEVICE },
> > > > +        { INTERFACE_CXL_DEVICE },
> > > > +        { INTERFACE_PCIE_DEVICE },
> > > > +        {}
> > > > +    },
> > > > +};
> > > > +
> > > > +static void ct3d_registers(void)
> > > > +{
> > > > +    type_register_static(&ct3d_info);
> > > > +}
> > > > +
> > > > +type_init(ct3d_registers);
> > > > diff --git a/hw/mem/meson.build b/hw/mem/meson.build
> > > > index 0d22f2b572..d13c3ed117 100644
> > > > --- a/hw/mem/meson.build
> > > > +++ b/hw/mem/meson.build
> > > > @@ -3,5 +3,6 @@ mem_ss.add(files('memory-device.c'))
> > > >  mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
> > > >  mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
> > > >  mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
> > > > +mem_ss.add(when: 'CONFIG_CXL_MEM_DEVICE', if_true: files('cxl_type3.c'))
> > > >  
> > > >  softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
> > > > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > > > index d4010cf8f3..1ecf6f6a55 100644
> > > > --- a/hw/pci/pcie.c
> > > > +++ b/hw/pci/pcie.c
> > > > @@ -20,6 +20,7 @@
> > > >  
> > > >  #include "qemu/osdep.h"
> > > >  #include "qapi/error.h"
> > > > +#include "hw/mem/memory-device.h"
> > > >  #include "hw/pci/pci_bridge.h"
> > > >  #include "hw/pci/pcie.h"
> > > >  #include "hw/pci/msix.h"
> > > > @@ -27,6 +28,8 @@
> > > >  #include "hw/pci/pci_bus.h"
> > > >  #include "hw/pci/pcie_regs.h"
> > > >  #include "hw/pci/pcie_port.h"
> > > > +#include "hw/cxl/cxl.h"
> > > > +#include "hw/boards.h"
> > > >  #include "qemu/range.h"
> > > >  
> > > >  //#define DEBUG_PCIE
> > > > @@ -419,6 +422,28 @@ void pcie_cap_slot_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> > > >      }
> > > >  
> > > >      pcie_cap_slot_plug_common(PCI_DEVICE(hotplug_dev), dev, errp);
> > > > +
> > > > +#ifdef CXL_MEM_DEVICE
> > > > +    /*
> > > > +     * FIXME:
> > > > +     * if (object_dynamic_cast(OBJECT(dev), TYPE_CXL_TYPE3_DEV)) {
> > > > +     *    HotplugHandler *hotplug_ctrl;
> > > > +     *   Error *local_err = NULL;
> > > > +     *  hotplug_ctrl = qdev_get_hotplug_handler(dev);
> > > > +     *  if (hotplug_ctrl) {
> > > > +     *      hotplug_handler_pre_plug(hotplug_ctrl, dev, &local_err);
> > > > +     *      if (local_err) {
> > > > +     *          error_propagate(errp, local_err);
> > > > +     *          return;
> > > > +     *      }
> > > > +     *  }
> > > > +     */
> > > > +    if (object_dynamic_cast(OBJECT(dev), TYPE_CXL_TYPE3_DEV)) {
> > > > +        memory_device_pre_plug(MEMORY_DEVICE(dev), MACHINE(qdev_get_machine()),
> > > > +                               NULL, errp);
> > > > +    }  
> > > 
> > > why use MEMORY_DEVICE interface instead of exposing memory as PCI BAR?
> > >   
> > 
> > A CXL memory device adds memory to a system that is physically addressable in
> > the same way an NVDIMM device would be.
> > 
> > > > +#endif
> > > >  }
> > > >  
> > > >  void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> > > > @@ -455,6 +480,11 @@ void pcie_cap_slot_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> > > >          pcie_cap_slot_event(hotplug_pdev,
> > > >                              PCI_EXP_HP_EV_PDC | PCI_EXP_HP_EV_ABP);
> > > >      }
> > > > +
> > > > +#ifdef CXL_MEM_DEVICE
> > > > +    if (object_dynamic_cast(OBJECT(dev), TYPE_CXL_TYPE3_DEV))
> > > > +        memory_device_plug(MEMORY_DEVICE(dev), MACHINE(qdev_get_machine()));
> > > > +#endif
> > > >  }
> > > >  
> > > >  void pcie_cap_slot_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> > > > diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
> > > > index b1e5f4a8fa..809ed7de60 100644
> > > > --- a/include/hw/cxl/cxl.h
> > > > +++ b/include/hw/cxl/cxl.h
> > > > @@ -17,6 +17,8 @@
> > > >  #define COMPONENT_REG_BAR_IDX 0
> > > >  #define DEVICE_REG_BAR_IDX 2
> > > >  
> > > > +#define TYPE_CXL_TYPE3_DEV "cxl-type3"
> > > > +
> > > >  #define CXL_HOST_BASE 0xD0000000
> > > >  #define CXL_WINDOW_MAX 10
> > > >  
> > > > diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
> > > > index a53c2e5ae7..9ec28c9feb 100644
> > > > --- a/include/hw/cxl/cxl_pci.h
> > > > +++ b/include/hw/cxl/cxl_pci.h
> > > > @@ -64,6 +64,28 @@ _Static_assert(sizeof(struct dvsec_header) == 10,
> > > >   * CXL 2.0 Downstream Port: 3, 4, 7, 8
> > > >   */
> > > >  
> > > > +/* CXL 2.0 - 8.1.3 (ID 0001) */
> > > > +struct dvsec_device {
> > > > +    struct dvsec_header hdr;
> > > > +    uint16_t cap;
> > > > +    uint16_t ctrl;
> > > > +    uint16_t status;
> > > > +    uint16_t ctrl2;
> > > > +    uint16_t status2;
> > > > +    uint16_t lock;
> > > > +    uint16_t cap2;
> > > > +    uint32_t range1_size_hi;
> > > > +    uint32_t range1_size_lo;
> > > > +    uint32_t range1_base_hi;
> > > > +    uint32_t range1_base_lo;
> > > > +    uint32_t range2_size_hi;
> > > > +    uint32_t range2_size_lo;
> > > > +    uint32_t range2_base_hi;
> > > > +    uint32_t range2_base_lo;
> > > > +};
> > > > +_Static_assert(sizeof(struct dvsec_device) == 0x38,
> > > > +               "dvsec device size incorrect");
> > > > +
> > > >  /* CXL 2.0 - 8.1.5 (ID 0003) */
> > > >  struct extensions_dvsec_port {
> > > >      struct dvsec_header hdr;
> > > > diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
> > > > index 11f8ab7149..76bf3ed590 100644
> > > > --- a/include/hw/pci/pci_ids.h
> > > > +++ b/include/hw/pci/pci_ids.h
> > > > @@ -53,6 +53,7 @@
> > > >  #define PCI_BASE_CLASS_MEMORY            0x05
> > > >  #define PCI_CLASS_MEMORY_RAM             0x0500
> > > >  #define PCI_CLASS_MEMORY_FLASH           0x0501
> > > > +#define PCI_CLASS_MEMORY_CXL             0x0502
> > > >  #define PCI_CLASS_MEMORY_OTHER           0x0580
> > > >  
> > > >  #define PCI_BASE_CLASS_BRIDGE            0x06
> > > > diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> > > > index 0dd594f92b..0f67bc61ce 100644
> > > > --- a/monitor/hmp-cmds.c
> > > > +++ b/monitor/hmp-cmds.c
> > > > @@ -1887,6 +1887,21 @@ void hmp_info_memory_devices(Monitor *mon, const QDict *qdict)
> > > >                  monitor_printf(mon, "  hotpluggable: %s\n",
> > > >                                 di->hotpluggable ? "true" : "false");
> > > >                  break;
> > > > +            case MEMORY_DEVICE_INFO_KIND_CXL:
> > > > +                di = value->u.cxl.data;
> > > > +                monitor_printf(mon, "Memory device [%s]: \"%s\"\n",
> > > > +                               MemoryDeviceInfoKind_str(value->type),
> > > > +                               di->id ? di->id : "");
> > > > +                monitor_printf(mon, "  addr: 0x%" PRIx64 "\n", di->addr);
> > > > +                monitor_printf(mon, "  slot: %" PRId64 "\n", di->slot);
> > > > +                monitor_printf(mon, "  node: %" PRId64 "\n", di->node);
> > > > +                monitor_printf(mon, "  size: %" PRIu64 "\n", di->size);
> > > > +                monitor_printf(mon, "  memdev: %s\n", di->memdev);
> > > > +                monitor_printf(mon, "  hotplugged: %s\n",
> > > > +                               di->hotplugged ? "true" : "false");
> > > > +                monitor_printf(mon, "  hotpluggable: %s\n",
> > > > +                               di->hotpluggable ? "true" : "false");
> > > > +                break;
> > > >              case MEMORY_DEVICE_INFO_KIND_VIRTIO_PMEM:
> > > >                  vpi = value->u.virtio_pmem.data;
> > > >                  monitor_printf(mon, "Memory device [%s]: \"%s\"\n",
> > > > diff --git a/qapi/machine.json b/qapi/machine.json
> > > > index 330189efe3..aa96d662bd 100644
> > > > --- a/qapi/machine.json
> > > > +++ b/qapi/machine.json
> > > > @@ -1394,6 +1394,7 @@
> > > >  { 'union': 'MemoryDeviceInfo',
> > > >    'data': { 'dimm': 'PCDIMMDeviceInfo',
> > > >              'nvdimm': 'PCDIMMDeviceInfo',
> > > > +            'cxl': 'PCDIMMDeviceInfo',
> > > >              'virtio-pmem': 'VirtioPMEMDeviceInfo',
> > > >              'virtio-mem': 'VirtioMEMDeviceInfo'
> > > >            }  
> > >   
> 
> 

