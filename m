Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8818B64862F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 17:06:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3fsc-0004rJ-Nx; Fri, 09 Dec 2022 11:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p3fsa-0004qm-Uz
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:05:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p3fsY-0000pK-6y
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:05:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670601936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oi/5xvE+2zBPbPDd4hv9iS1csr4rmuc/kzwXP7O+scw=;
 b=G5qECXCucHBdaE/pCjOq/RpGhKUQ8VgcnIxntrfH0lCsYfukv1HOgPpDgAe7h/kDWd3hfR
 GRIISwmSddigdZWTXRQCGUB41iNLPL+0KL6c024mWxpZ5PoWrUkzC1dzBiIHc5OyINFpM3
 gY6zcSkE2uR1lib3zQfUd4sdmoNtzLo=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-444-o54BBpPwPGuI7m7s_Gg3GA-1; Fri, 09 Dec 2022 11:04:29 -0500
X-MC-Unique: o54BBpPwPGuI7m7s_Gg3GA-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-1447ffe6046so86441fac.3
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 08:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oi/5xvE+2zBPbPDd4hv9iS1csr4rmuc/kzwXP7O+scw=;
 b=Rc4MoVdrYEQqPy/05yo9bpOGWxO2MdFeBEdShT3IPf7cBWCk+IZfzI9LiySUyeh+gV
 jyIKevUxDJQFz67NPfG7kGCJbAB9R257BvUQPjYQaMkCNatk6O+zhPVoqlWlFpdnOT2K
 XS59FpLU3lyk/TwK96SMmWtNM6hq5s9yidGOYhUXSsPs7L2j8RwlWUbb+vCarAerV2os
 qS/1kTN0jYWyfEUHf+z4kLPrxqyuXZqC0I69p1akyIX0U2KJUxyG1AhNhCyfUclwLEmN
 tA8R3PymP/aBDlpe9ki5aHOyY224hVkGdu2EDfXDCfFcdqxynqfVvy9anqlwRFPSuS1T
 H4YA==
X-Gm-Message-State: ANoB5pnKph+at6meZjzWfvxX5UC5oDvmcTNm61wYhCfHEdRviVLDcU9w
 XCEhL5HDA+lcoWZ+Sqb1xY5mmGHO9AF/y8AEa3zuveaICOcn4q+XfaACGlQCdnM9nhmj2JEzihf
 NIa3gyXziNXIikVM=
X-Received: by 2002:a05:6358:6f0e:b0:dc:561c:f8be with SMTP id
 r14-20020a0563586f0e00b000dc561cf8bemr174037rwn.11.1670601868247; 
 Fri, 09 Dec 2022 08:04:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6ImlvtxV9iWmzoWEFNFoO1e7UE2CWrC3mILyb9KNCzzJHDxKWte3Gf9ubcMur3xzKM94oghA==
X-Received: by 2002:a05:6358:6f0e:b0:dc:561c:f8be with SMTP id
 r14-20020a0563586f0e00b000dc561cf8bemr174014rwn.11.1670601867778; 
 Fri, 09 Dec 2022 08:04:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 bk24-20020a05620a1a1800b006ee77f1ecc3sm130215qkb.31.2022.12.09.08.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 08:04:27 -0800 (PST)
Message-ID: <37937d3d-5505-91b9-e671-154caa21667e@redhat.com>
Date: Fri, 9 Dec 2022 17:04:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 02/24] vfio-user: add VFIO base abstract class
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <ef2ad700a3ad540febba3f935fedc23a50555d7c.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <ef2ad700a3ad540febba3f935fedc23a50555d7c.1667542066.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.288, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hello John,

On 11/9/22 00:13, John Johnson wrote:
> Add an abstract base class both the kernel driver
> and user socket implementations can use to share code.
> 
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>

I would help the reader if the header files came first. You could use :

   [diff]
	orderFile = /path/to/qemu/scripts/git.orderfile


I would simply use 'Kernel' instead of 'Kern' in the type definition.
A part from that,

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> ---
>   hw/vfio/pci.c | 106 +++++++++++++++++++++++++++++++++++-----------------------
>   hw/vfio/pci.h |  16 +++++++--
>   2 files changed, 78 insertions(+), 44 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 939dcc3..60acde5 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -235,7 +235,7 @@ static void vfio_intx_update(VFIOPCIDevice *vdev, PCIINTxRoute *route)
>   
>   static void vfio_intx_routing_notifier(PCIDevice *pdev)
>   {
> -    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>       PCIINTxRoute route;
>   
>       if (vdev->interrupt != VFIO_INT_INTx) {
> @@ -467,7 +467,7 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
>   static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>                                      MSIMessage *msg, IOHandler *handler)
>   {
> -    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>       VFIOMSIVector *vector;
>       int ret;
>   
> @@ -561,7 +561,7 @@ static int vfio_msix_vector_use(PCIDevice *pdev,
>   
>   static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
>   {
> -    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>       VFIOMSIVector *vector = &vdev->msi_vectors[nr];
>   
>       trace_vfio_msix_vector_release(vdev->vbasedev.name, nr);
> @@ -1109,7 +1109,7 @@ static const MemoryRegionOps vfio_vga_ops = {
>    */
>   static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
>   {
> -    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>       VFIORegion *region = &vdev->bars[bar].region;
>       MemoryRegion *mmap_mr, *region_mr, *base_mr;
>       PCIIORegion *r;
> @@ -1155,7 +1155,7 @@ static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
>    */
>   uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
>   {
> -    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>       uint32_t emu_bits = 0, emu_val = 0, phys_val = 0, val;
>   
>       memcpy(&emu_bits, vdev->emulated_config_bits + addr, len);
> @@ -1188,7 +1188,7 @@ uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
>   void vfio_pci_write_config(PCIDevice *pdev,
>                              uint32_t addr, uint32_t val, int len)
>   {
> -    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>       uint32_t val_le = cpu_to_le32(val);
>   
>       trace_vfio_pci_write_config(vdev->vbasedev.name, addr, val, len);
> @@ -2845,7 +2845,7 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
>   
>   static void vfio_realize(PCIDevice *pdev, Error **errp)
>   {
> -    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>       VFIODevice *vbasedev = &vdev->vbasedev;
>       VFIODevice *vbasedev_iter;
>       VFIOGroup *group;
> @@ -3169,7 +3169,7 @@ error:
>   
>   static void vfio_instance_finalize(Object *obj)
>   {
> -    VFIOPCIDevice *vdev = VFIO_PCI(obj);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
>       VFIOGroup *group = vdev->vbasedev.group;
>   
>       vfio_display_finalize(vdev);
> @@ -3189,7 +3189,7 @@ static void vfio_instance_finalize(Object *obj)
>   
>   static void vfio_exitfn(PCIDevice *pdev)
>   {
> -    VFIOPCIDevice *vdev = VFIO_PCI(pdev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>   
>       vfio_unregister_req_notifier(vdev);
>       vfio_unregister_err_notifier(vdev);
> @@ -3208,7 +3208,7 @@ static void vfio_exitfn(PCIDevice *pdev)
>   
>   static void vfio_pci_reset(DeviceState *dev)
>   {
> -    VFIOPCIDevice *vdev = VFIO_PCI(dev);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(dev);
>   
>       trace_vfio_pci_reset(vdev->vbasedev.name);
>   
> @@ -3248,7 +3248,7 @@ post_reset:
>   static void vfio_instance_init(Object *obj)
>   {
>       PCIDevice *pci_dev = PCI_DEVICE(obj);
> -    VFIOPCIDevice *vdev = VFIO_PCI(obj);
> +    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
>   
>       device_add_bootindex_property(obj, &vdev->bootindex,
>                                     "bootindex", NULL,
> @@ -3265,24 +3265,12 @@ static void vfio_instance_init(Object *obj)
>       pci_dev->cap_present |= QEMU_PCI_CAP_EXPRESS;
>   }
>   
> -static Property vfio_pci_dev_properties[] = {
> -    DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
> -    DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
> +static Property vfio_pci_base_dev_properties[] = {
>       DEFINE_PROP_ON_OFF_AUTO("x-pre-copy-dirty-page-tracking", VFIOPCIDevice,
>                               vbasedev.pre_copy_dirty_page_tracking,
>                               ON_OFF_AUTO_ON),
> -    DEFINE_PROP_ON_OFF_AUTO("display", VFIOPCIDevice,
> -                            display, ON_OFF_AUTO_OFF),
> -    DEFINE_PROP_UINT32("xres", VFIOPCIDevice, display_xres, 0),
> -    DEFINE_PROP_UINT32("yres", VFIOPCIDevice, display_yres, 0),
>       DEFINE_PROP_UINT32("x-intx-mmap-timeout-ms", VFIOPCIDevice,
>                          intx.mmap_timeout, 1100),
> -    DEFINE_PROP_BIT("x-vga", VFIOPCIDevice, features,
> -                    VFIO_FEATURE_ENABLE_VGA_BIT, false),
> -    DEFINE_PROP_BIT("x-req", VFIOPCIDevice, features,
> -                    VFIO_FEATURE_ENABLE_REQ_BIT, true),
> -    DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
> -                    VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
>       DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
>                        vbasedev.enable_migration, false),
>       DEFINE_PROP_BOOL("x-no-mmap", VFIOPCIDevice, vbasedev.no_mmap, false),
> @@ -3291,8 +3279,6 @@ static Property vfio_pci_dev_properties[] = {
>       DEFINE_PROP_BOOL("x-no-kvm-intx", VFIOPCIDevice, no_kvm_intx, false),
>       DEFINE_PROP_BOOL("x-no-kvm-msi", VFIOPCIDevice, no_kvm_msi, false),
>       DEFINE_PROP_BOOL("x-no-kvm-msix", VFIOPCIDevice, no_kvm_msix, false),
> -    DEFINE_PROP_BOOL("x-no-geforce-quirks", VFIOPCIDevice,
> -                     no_geforce_quirks, false),
>       DEFINE_PROP_BOOL("x-no-kvm-ioeventfd", VFIOPCIDevice, no_kvm_ioeventfd,
>                        false),
>       DEFINE_PROP_BOOL("x-no-vfio-ioeventfd", VFIOPCIDevice, no_vfio_ioeventfd,
> @@ -3303,10 +3289,6 @@ static Property vfio_pci_dev_properties[] = {
>                          sub_vendor_id, PCI_ANY_ID),
>       DEFINE_PROP_UINT32("x-pci-sub-device-id", VFIOPCIDevice,
>                          sub_device_id, PCI_ANY_ID),
> -    DEFINE_PROP_UINT32("x-igd-gms", VFIOPCIDevice, igd_gms, 0),
> -    DEFINE_PROP_UNSIGNED_NODEFAULT("x-nv-gpudirect-clique", VFIOPCIDevice,
> -                                   nv_gpudirect_clique,
> -                                   qdev_prop_nv_gpudirect_clique, uint8_t),
>       DEFINE_PROP_OFF_AUTO_PCIBAR("x-msix-relocation", VFIOPCIDevice, msix_relo,
>                                   OFF_AUTOPCIBAR_OFF),
>       /*
> @@ -3317,28 +3299,25 @@ static Property vfio_pci_dev_properties[] = {
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> -static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
> +static void vfio_pci_base_dev_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
>   
> -    dc->reset = vfio_pci_reset;
> -    device_class_set_props(dc, vfio_pci_dev_properties);
> -    dc->desc = "VFIO-based PCI device assignment";
> +    device_class_set_props(dc, vfio_pci_base_dev_properties);
> +    dc->desc = "VFIO PCI base device";
>       set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> -    pdc->realize = vfio_realize;
>       pdc->exit = vfio_exitfn;
>       pdc->config_read = vfio_pci_read_config;
>       pdc->config_write = vfio_pci_write_config;
>   }
>   
> -static const TypeInfo vfio_pci_dev_info = {
> -    .name = TYPE_VFIO_PCI,
> +static const TypeInfo vfio_pci_base_dev_info = {
> +    .name = TYPE_VFIO_PCI_BASE,
>       .parent = TYPE_PCI_DEVICE,
> -    .instance_size = sizeof(VFIOPCIDevice),
> -    .class_init = vfio_pci_dev_class_init,
> -    .instance_init = vfio_instance_init,
> -    .instance_finalize = vfio_instance_finalize,
> +    .instance_size = 0,
> +    .abstract = true,
> +    .class_init = vfio_pci_base_dev_class_init,
>       .interfaces = (InterfaceInfo[]) {
>           { INTERFACE_PCIE_DEVICE },
>           { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> @@ -3346,6 +3325,48 @@ static const TypeInfo vfio_pci_dev_info = {
>       },
>   };
>   
> +static Property vfio_pci_dev_properties[] = {
> +    DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
> +    DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
> +    DEFINE_PROP_ON_OFF_AUTO("display", VFIOPCIDevice,
> +                            display, ON_OFF_AUTO_OFF),
> +    DEFINE_PROP_UINT32("xres", VFIOPCIDevice, display_xres, 0),
> +    DEFINE_PROP_UINT32("yres", VFIOPCIDevice, display_yres, 0),
> +    DEFINE_PROP_BIT("x-vga", VFIOPCIDevice, features,
> +                    VFIO_FEATURE_ENABLE_VGA_BIT, false),
> +    DEFINE_PROP_BIT("x-req", VFIOPCIDevice, features,
> +                    VFIO_FEATURE_ENABLE_REQ_BIT, true),
> +    DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
> +                    VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
> +    DEFINE_PROP_BOOL("x-no-geforce-quirks", VFIOPCIDevice,
> +                     no_geforce_quirks, false),
> +    DEFINE_PROP_UINT32("x-igd-gms", VFIOPCIDevice, igd_gms, 0),
> +    DEFINE_PROP_UNSIGNED_NODEFAULT("x-nv-gpudirect-clique", VFIOPCIDevice,
> +                                   nv_gpudirect_clique,
> +                                   qdev_prop_nv_gpudirect_clique, uint8_t),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
> +
> +    dc->reset = vfio_pci_reset;
> +    device_class_set_props(dc, vfio_pci_dev_properties);
> +    dc->desc = "VFIO-based PCI device assignment";
> +    pdc->realize = vfio_realize;
> +}
> +
> +static const TypeInfo vfio_pci_dev_info = {
> +    .name = TYPE_VFIO_PCI,
> +    .parent = TYPE_VFIO_PCI_BASE,
> +    .instance_size = sizeof(VFIOKernPCIDevice),
> +    .class_init = vfio_pci_dev_class_init,
> +    .instance_init = vfio_instance_init,
> +    .instance_finalize = vfio_instance_finalize,
> +};
> +
>   static Property vfio_pci_dev_nohotplug_properties[] = {
>       DEFINE_PROP_BOOL("ramfb", VFIOPCIDevice, enable_ramfb, false),
>       DEFINE_PROP_END_OF_LIST(),
> @@ -3362,12 +3383,13 @@ static void vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data)
>   static const TypeInfo vfio_pci_nohotplug_dev_info = {
>       .name = TYPE_VFIO_PCI_NOHOTPLUG,
>       .parent = TYPE_VFIO_PCI,
> -    .instance_size = sizeof(VFIOPCIDevice),
> +    .instance_size = sizeof(VFIOKernPCIDevice),
>       .class_init = vfio_pci_nohotplug_dev_class_init,
>   };
>   
>   static void register_vfio_pci_dev_type(void)
>   {
> +    type_register_static(&vfio_pci_base_dev_info);
>       type_register_static(&vfio_pci_dev_info);
>       type_register_static(&vfio_pci_nohotplug_dev_info);
>   }
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 7c236a5..7c5c8ec 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -115,8 +115,13 @@ typedef struct VFIOMSIXInfo {
>       unsigned long *pending;
>   } VFIOMSIXInfo;
>   
> -#define TYPE_VFIO_PCI "vfio-pci"
> -OBJECT_DECLARE_SIMPLE_TYPE(VFIOPCIDevice, VFIO_PCI)
> +/*
> + * TYPE_VFIO_PCI_BASE is an abstract type used to share code
> + * between VFIO implementations that use a kernel driver
> + * with those that use user sockets.
> + */
> +#define TYPE_VFIO_PCI_BASE "vfio-pci-base"
> +OBJECT_DECLARE_SIMPLE_TYPE(VFIOPCIDevice, VFIO_PCI_BASE)
>   
>   struct VFIOPCIDevice {
>       PCIDevice pdev;
> @@ -177,6 +182,13 @@ struct VFIOPCIDevice {
>       Notifier irqchip_change_notifier;
>   };
>   
> +#define TYPE_VFIO_PCI "vfio-pci"
> +OBJECT_DECLARE_SIMPLE_TYPE(VFIOKernPCIDevice, VFIO_PCI)
> +
> +struct VFIOKernPCIDevice {
> +    VFIOPCIDevice device;
> +};
> +
>   /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
>   static inline bool vfio_pci_is(VFIOPCIDevice *vdev, uint32_t vendor, uint32_t device)
>   {


