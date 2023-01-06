Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA526600E8
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 14:02:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDmKn-0000fH-8t; Fri, 06 Jan 2023 08:00:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDmKf-0000Z0-JT
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 08:00:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDmKd-0000jR-GQ
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 08:00:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673010022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sR6um4BbjBj20kfzemMVQ0ZkaqRAHLWQBhrjILhwaG4=;
 b=FF21OvSn+vBsZjrYnpUYCMZ8kMPyuAnP9+g8pNCVmj6dSXWtvhvJPQ3yy+4zepYtL8tyrY
 BkbE9p9M5fQhPeVoHlIOwelFOqyvPw30nuosSI9qpag0BlbVXM3YOx+6VHyL0ps0EU7eAV
 umSz9eZy/VS/N980qomhtpgXz7uucqM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670-dOjzagYQPU2K9SrWy8dI6g-1; Fri, 06 Jan 2023 08:00:19 -0500
X-MC-Unique: dOjzagYQPU2K9SrWy8dI6g-1
Received: by mail-wm1-f69.google.com with SMTP id
 t24-20020a1c7718000000b003d1fd0b866fso457521wmi.3
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 05:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sR6um4BbjBj20kfzemMVQ0ZkaqRAHLWQBhrjILhwaG4=;
 b=v3SRTfNUJyhCESsTp0vr0gBTa5O4BMoq8j+WDenoiOWQb6kFA5vPYn3/jvsRVbbo4S
 lSedmG274CZpo/9bGL78lXGOT3aZIkT3hBCQnOPZrpJl/mYmIEKwpiig8Y1jqTnezjaE
 bjDccYYmrNlE6TPgzqCcQyY+WP3AcxDRGNO1MUqgxQja3VV5BwWalix3LNisB+UbiiPq
 ZeEe90nGek9nhxoZtnxyUkNbILL8umreN8/m5z61Mgj8lsWFiiJIbIdctRbmlGabMAQD
 8OBNWh9nXdHERHmEubHXCHeINIAqJfE2b9zszXBegx+Pkl0ECK90B8uP1BD390RJyDCY
 6vKA==
X-Gm-Message-State: AFqh2kpE6rYSGyfFLI6PPk3iXkUfCYHxhJMi3I+960FePNdoaHNezLDo
 O7Hl0TmQqrsxNgek4P0BNqUdKQBEBWQk4yHFsmgr+6+3SHC8nPFk4qO+i8LsMXoCXJhGzD9zJ4z
 RoP9WtYtOaDMnSZw=
X-Received: by 2002:a05:600c:4d25:b0:3d3:5b7a:1791 with SMTP id
 u37-20020a05600c4d2500b003d35b7a1791mr48498779wmp.41.1673010018145; 
 Fri, 06 Jan 2023 05:00:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuk957aN9qRhSS4mlPMbpT2Ktb2g/2MsJT1cShsyRoFBbX7cRz0ybSLDVX1tt7CCv5iHeOHqA==
X-Received: by 2002:a05:600c:4d25:b0:3d3:5b7a:1791 with SMTP id
 u37-20020a05600c4d2500b003d35b7a1791mr48498757wmp.41.1673010017758; 
 Fri, 06 Jan 2023 05:00:17 -0800 (PST)
Received: from redhat.com ([2.52.141.223]) by smtp.gmail.com with ESMTPSA id
 bi22-20020a05600c3d9600b003d208eb17ecsm1610633wmb.26.2023.01.06.05.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 05:00:16 -0800 (PST)
Date: Fri, 6 Jan 2023 08:00:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <20230106064838-mutt-send-email-mst@kernel.org>
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Sun, Jan 01, 2023 at 06:52:03PM -0500, Chuck Zmudzinski wrote:
> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
> as noted in docs/igd-assign.txt in the Qemu source code.
> 
> Currently, when the xl toolstack is used to configure a Xen HVM guest with
> Intel IGD passthrough to the guest with the Qemu upstream device model,
> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
> a different slot. This problem often prevents the guest from booting.
> 
> The only available workaround is not good: Configure Xen HVM guests to use
> the old and no longer maintained Qemu traditional device model available
> from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
> 
> To implement this feature in the Qemu upstream device model for Xen HVM
> guests, introduce the following new functions, types, and macros:
> 
> * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
> * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
> * typedef XenPTQdevRealize function pointer
> * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
> * xen_igd_reserve_slot and xen_igd_clear_slot functions
> 
> The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
> member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
> the xl toolstack with the gfx_passthru option enabled, which sets the
> igd-passthru=on option to Qemu for the Xen HVM machine type.
> 
> The new xen_igd_reserve_slot function also needs to be implemented in
> hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
> when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
> in which case it does nothing.
> 
> The new xen_igd_clear_slot function overrides qdev->realize of the parent
> PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
> since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
> created in hw/i386/pc_piix.c for the case when igd-passthru=on.
> 
> Move the call to xen_host_pci_device_get, and the associated error
> handling, from xen_pt_realize to the new xen_igd_clear_slot function to
> initialize the device class and vendor values which enables the checks for
> the Intel IGD to succeed. The verification that the host device is an
> Intel IGD to be passed through is done by checking the domain, bus, slot,
> and function values as well as by checking that gfx_passthru is enabled,
> the device class is VGA, and the device vendor in Intel.
> 
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>

If we are to make changes, something that might be generally
useful is a new mask along the lines of slot_reserved_mask,
however
	- only affecting auto-allocated addresses
	- controllable from a command line property

this way one could say "don't allocate any devices to slot 2"
and later "put igd device in slot 2".
And, xenpv machine could set defaults for these using the
compat machinery.


> ---
> Notes that might be helpful to reviewers of patched code in hw/xen:
> 
> The new functions and types are based on recommendations from Qemu docs:
> https://qemu.readthedocs.io/en/latest/devel/qom.html
> 
> Notes that might be helpful to reviewers of patched code in hw/i386:
> 
> The small patch to hw/i386/pc_piix.c is protected by CONFIG_XEN so it does
> not affect builds that do not have CONFIG_XEN defined.
> 
> xen_igd_gfx_pt_enabled() in the patched hw/i386/pc_piix.c file is an
> existing function that is only true when Qemu is built with
> xen-pci-passthrough enabled and the administrator has configured the Xen
> HVM guest with Qemu's igd-passthru=on option.
> 
> v2: Remove From: <email address> tag at top of commit message
> 
> v3: Changed the test for the Intel IGD in xen_igd_clear_slot:
> 
>     if (is_igd_vga_passthrough(&s->real_device) &&
>         (s->real_device.vendor_id == PCI_VENDOR_ID_INTEL)) {
> 
>     is changed to
> 
>     if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
>         && (s->hostaddr.function == 0)) {
> 
>     I hoped that I could use the test in v2, since it matches the
>     other tests for the Intel IGD in Qemu and Xen, but those tests
>     do not work because the necessary data structures are not set with
>     their values yet. So instead use the test that the administrator
>     has enabled gfx_passthru and the device address on the host is
>     02.0. This test does detect the Intel IGD correctly.
> 
> v4: Use brchuckz@aol.com instead of brchuckz@netscape.net for the author's
>     email address to match the address used by the same author in commits
>     be9c61da and c0e86b76
>     
>     Change variable for XEN_PT_DEVICE_CLASS: xptc changed to xpdc
> 
> v5: The patch of xen_pt.c was re-worked to allow a more consistent test
>     for the Intel IGD that uses the same criteria as in other places.
>     This involved moving the call to xen_host_pci_device_get from
>     xen_pt_realize to xen_igd_clear_slot and updating the checks for the
>     Intel IGD in xen_igd_clear_slot:
>     
>     if (xen_igd_gfx_pt_enabled() && (s->hostaddr.slot == 2)
>         && (s->hostaddr.function == 0)) {
> 
>     is changed to
> 
>     if (is_igd_vga_passthrough(&s->real_device) &&
>         s->real_device.domain == 0 && s->real_device.bus == 0 &&
>         s->real_device.dev == 2 && s->real_device.func == 0 &&
>         s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
> 
>     Added an explanation for the move of xen_host_pci_device_get from
>     xen_pt_realize to xen_igd_clear_slot to the commit message.
> 
>     Rebase.
> 
> v6: Fix logging by removing these lines from the move from xen_pt_realize
>     to xen_igd_clear_slot that was done in v5:
> 
>     XEN_PT_LOG(d, "Assigning real physical device %02x:%02x.%d"
>                " to devfn 0x%x\n",
>                s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
>                s->dev.devfn);
> 
>     This log needs to be in xen_pt_realize because s->dev.devfn is not
>     set yet in xen_igd_clear_slot.
> 
>     Sorry for the extra noise.
> 
>  hw/i386/pc_piix.c    |  3 +++
>  hw/xen/xen_pt.c      | 46 +++++++++++++++++++++++++++++++++++---------
>  hw/xen/xen_pt.h      | 16 +++++++++++++++
>  hw/xen/xen_pt_stub.c |  4 ++++
>  4 files changed, 60 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index b48047f50c..bc5efa4f59 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -405,6 +405,9 @@ static void pc_xen_hvm_init(MachineState *machine)
>      }
>  
>      pc_xen_hvm_init_pci(machine);
> +    if (xen_igd_gfx_pt_enabled()) {
> +        xen_igd_reserve_slot(pcms->bus);
> +    }
>      pci_create_simple(pcms->bus, -1, "xen-platform");
>  }
>  #endif
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 0ec7e52183..7fae1e7a6f 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -780,15 +780,6 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
>                 s->hostaddr.bus, s->hostaddr.slot, s->hostaddr.function,
>                 s->dev.devfn);
>  
> -    xen_host_pci_device_get(&s->real_device,
> -                            s->hostaddr.domain, s->hostaddr.bus,
> -                            s->hostaddr.slot, s->hostaddr.function,
> -                            errp);
> -    if (*errp) {
> -        error_append_hint(errp, "Failed to \"open\" the real pci device");
> -        return;
> -    }
> -
>      s->is_virtfn = s->real_device.is_virtfn;
>      if (s->is_virtfn) {
>          XEN_PT_LOG(d, "%04x:%02x:%02x.%d is a SR-IOV Virtual Function\n",
> @@ -950,11 +941,47 @@ static void xen_pci_passthrough_instance_init(Object *obj)
>      PCI_DEVICE(obj)->cap_present |= QEMU_PCI_CAP_EXPRESS;
>  }
>  
> +void xen_igd_reserve_slot(PCIBus *pci_bus)
> +{
> +    XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
> +    pci_bus->slot_reserved_mask |= XEN_PCI_IGD_SLOT_MASK;
> +}
> +
> +static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
> +{
> +    ERRP_GUARD();
> +    PCIDevice *pci_dev = (PCIDevice *)qdev;
> +    XenPCIPassthroughState *s = XEN_PT_DEVICE(pci_dev);
> +    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_GET_CLASS(s);
> +    PCIBus *pci_bus = pci_get_bus(pci_dev);
> +
> +    xen_host_pci_device_get(&s->real_device,
> +                            s->hostaddr.domain, s->hostaddr.bus,
> +                            s->hostaddr.slot, s->hostaddr.function,
> +                            errp);
> +    if (*errp) {
> +        error_append_hint(errp, "Failed to \"open\" the real pci device");
> +        return;
> +    }
> +
> +    if (is_igd_vga_passthrough(&s->real_device) &&
> +        s->real_device.domain == 0 && s->real_device.bus == 0 &&
> +        s->real_device.dev == 2 && s->real_device.func == 0 &&
> +        s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
> +        pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK;
> +        XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
> +    }
> +    xpdc->pci_qdev_realize(qdev, errp);
> +}
> +
>  static void xen_pci_passthrough_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>  
> +    XenPTDeviceClass *xpdc = XEN_PT_DEVICE_CLASS(klass);
> +    xpdc->pci_qdev_realize = dc->realize;
> +    dc->realize = xen_igd_clear_slot;
>      k->realize = xen_pt_realize;
>      k->exit = xen_pt_unregister_device;
>      k->config_read = xen_pt_pci_read_config;
> @@ -977,6 +1004,7 @@ static const TypeInfo xen_pci_passthrough_info = {
>      .instance_size = sizeof(XenPCIPassthroughState),
>      .instance_finalize = xen_pci_passthrough_finalize,
>      .class_init = xen_pci_passthrough_class_init,
> +    .class_size = sizeof(XenPTDeviceClass),
>      .instance_init = xen_pci_passthrough_instance_init,
>      .interfaces = (InterfaceInfo[]) {
>          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
> index e7c4316a7d..40b31b5263 100644
> --- a/hw/xen/xen_pt.h
> +++ b/hw/xen/xen_pt.h
> @@ -3,6 +3,7 @@
>  
>  #include "hw/xen/xen_common.h"
>  #include "hw/pci/pci.h"
> +#include "hw/pci/pci_bus.h"
>  #include "xen-host-pci-device.h"
>  #include "qom/object.h"
>  
> @@ -41,7 +42,20 @@ typedef struct XenPTReg XenPTReg;
>  #define TYPE_XEN_PT_DEVICE "xen-pci-passthrough"
>  OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
>  
> +#define XEN_PT_DEVICE_CLASS(klass) \
> +    OBJECT_CLASS_CHECK(XenPTDeviceClass, klass, TYPE_XEN_PT_DEVICE)
> +#define XEN_PT_DEVICE_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(XenPTDeviceClass, obj, TYPE_XEN_PT_DEVICE)
> +
> +typedef void (*XenPTQdevRealize)(DeviceState *qdev, Error **errp);
> +
> +typedef struct XenPTDeviceClass {
> +    PCIDeviceClass parent_class;
> +    XenPTQdevRealize pci_qdev_realize;
> +} XenPTDeviceClass;
> +
>  uint32_t igd_read_opregion(XenPCIPassthroughState *s);
> +void xen_igd_reserve_slot(PCIBus *pci_bus);
>  void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
>  void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
>                                             XenHostPCIDevice *dev);
> @@ -76,6 +90,8 @@ typedef int (*xen_pt_conf_byte_read)
>  
>  #define XEN_PCI_INTEL_OPREGION 0xfc
>  
> +#define XEN_PCI_IGD_SLOT_MASK 0x4UL /* Intel IGD slot_reserved_mask */
> +
>  typedef enum {
>      XEN_PT_GRP_TYPE_HARDWIRED = 0,  /* 0 Hardwired reg group */
>      XEN_PT_GRP_TYPE_EMU,            /* emul reg group */
> diff --git a/hw/xen/xen_pt_stub.c b/hw/xen/xen_pt_stub.c
> index 2d8cac8d54..5c108446a8 100644
> --- a/hw/xen/xen_pt_stub.c
> +++ b/hw/xen/xen_pt_stub.c
> @@ -20,3 +20,7 @@ void xen_igd_gfx_pt_set(bool value, Error **errp)
>          error_setg(errp, "Xen PCI passthrough support not built in");
>      }
>  }
> +
> +void xen_igd_reserve_slot(PCIBus *pci_bus)
> +{
> +}
> -- 
> 2.39.0


