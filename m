Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C3231E86E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 11:21:40 +0100 (CET)
Received: from localhost ([::1]:51146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCgRG-0006aZ-NL
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 05:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1lCgPg-0005bi-SY; Thu, 18 Feb 2021 05:20:00 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1lCgPd-0004vX-4V; Thu, 18 Feb 2021 05:20:00 -0500
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Dh9cW1vR2zWBnN;
 Thu, 18 Feb 2021 18:17:15 +0800 (CST)
Received: from dggpemm500011.china.huawei.com (7.185.36.110) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 18 Feb 2021 18:19:41 +0800
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 dggpemm500011.china.huawei.com (7.185.36.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Feb 2021 18:19:40 +0800
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.2106.006; Thu, 18 Feb 2021 10:19:39 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
 <eric.auger.pro@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>
Subject: RE: [RFC v7 26/26] vfio/pci: Implement return_page_response page
 response callback
Thread-Topic: [RFC v7 26/26] vfio/pci: Implement return_page_response page
 response callback
Thread-Index: AQHWvEUTUiE9WTe+7E+ovBX+zyeIRqpeRGbw
Date: Thu, 18 Feb 2021 10:19:38 +0000
Message-ID: <494e4bdf5ecd4b528a016d4545d45f71@huawei.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
 <20201116181349.11908-27-eric.auger@redhat.com>
In-Reply-To: <20201116181349.11908-27-eric.auger@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.95.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=shameerali.kolothum.thodi@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jacob.jun.pan@linux.intel.com" <jacob.jun.pan@linux.intel.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "tn@semihalf.com" <tn@semihalf.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "vivek.gautam@arm.com" <vivek.gautam@arm.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 "zhangfei.gao@gmail.com" <zhangfei.gao@gmail.com>,
 yuzenghui <yuzenghui@huawei.com>, qubingbing <qubingbing@hisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

> -----Original Message-----
> From: Eric Auger [mailto:eric.auger@redhat.com]
> Sent: 16 November 2020 18:14
> To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
> qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> alex.williamson@redhat.com
> Cc: peter.maydell@linaro.org; jean-philippe@linaro.org; peterx@redhat.com=
;
> jacob.jun.pan@linux.intel.com; yi.l.liu@intel.com; Shameerali Kolothum Th=
odi
> <shameerali.kolothum.thodi@huawei.com>; tn@semihalf.com;
> nicoleotsuka@gmail.com; yuzenghui <yuzenghui@huawei.com>;
> zhangfei.gao@gmail.com; vivek.gautam@arm.com
> Subject: [RFC v7 26/26] vfio/pci: Implement return_page_response page
> response callback
>=20
> This patch implements the page response path. The
> response s written into the page response ring buffer and then
> update header's head index is updated. This path is not used
> by this series. It is introduced here as a POC for vSVA/ARM
> integration.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/vfio/pci.h |   2 +
>  hw/vfio/pci.c | 121
> ++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 123 insertions(+)
>=20
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 350e9e9005..ce0472611e 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -147,6 +147,8 @@ struct VFIOPCIDevice {
>      VFIOPCIExtIRQ *ext_irqs;
>      VFIORegion dma_fault_region;
>      uint32_t fault_tail_index;
> +    VFIORegion dma_fault_response_region;
> +    uint32_t fault_response_head_index;
>      int (*resetfn)(struct VFIOPCIDevice *);
>      uint32_t vendor_id;
>      uint32_t device_id;
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 4e3495bb60..797acd9c73 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -2631,6 +2631,61 @@ out:
>      g_free(fault_region_info);
>  }
>=20
> +static void vfio_init_fault_response_regions(VFIOPCIDevice *vdev, Error
> **errp)
> +{
> +    struct vfio_region_info *fault_region_info =3D NULL;
> +    struct vfio_region_info_cap_fault *cap_fault;
> +    VFIODevice *vbasedev =3D &vdev->vbasedev;
> +    struct vfio_info_cap_header *hdr;
> +    char *fault_region_name;
> +    int ret;
> +
> +    ret =3D vfio_get_dev_region_info(&vdev->vbasedev,
> +                                   VFIO_REGION_TYPE_NESTED,
> +
> VFIO_REGION_SUBTYPE_NESTED_DMA_FAULT_RESPONSE,
> +                                   &fault_region_info);
> +    if (ret) {
> +        goto out;
> +    }
> +
> +    hdr =3D vfio_get_region_info_cap(fault_region_info,
> +
> VFIO_REGION_INFO_CAP_DMA_FAULT);

VFIO_REGION_INFO_CAP_DMA_FAULT_RESPONSE ?=20

> +    if (!hdr) {
> +        error_setg(errp, "failed to retrieve DMA FAULT RESPONSE
> capability");
> +        goto out;
> +    }
> +    cap_fault =3D container_of(hdr, struct vfio_region_info_cap_fault,
> +                             header);
> +    if (cap_fault->version !=3D 1) {
> +        error_setg(errp, "Unsupported DMA FAULT RESPONSE API
> version %d",
> +                   cap_fault->version);
> +        goto out;
> +    }
> +
> +    fault_region_name =3D g_strdup_printf("%s DMA FAULT RESPONSE %d",
> +                                        vbasedev->name,
> +                                        fault_region_info->index);
> +
> +    ret =3D vfio_region_setup(OBJECT(vdev), vbasedev,
> +                            &vdev->dma_fault_response_region,
> +                            fault_region_info->index,
> +                            fault_region_name);
> +    g_free(fault_region_name);
> +    if (ret) {
> +        error_setg_errno(errp, -ret,
> +                         "failed to set up the DMA FAULT RESPONSE
> region %d",
> +                         fault_region_info->index);
> +        goto out;
> +    }
> +
> +    ret =3D vfio_region_mmap(&vdev->dma_fault_response_region);
> +    if (ret) {
> +        error_setg_errno(errp, -ret, "Failed to mmap the DMA FAULT
> RESPONSE queue");
> +    }
> +out:
> +    g_free(fault_region_info);
> +}
> +
>  static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
>  {
>      VFIODevice *vbasedev =3D &vdev->vbasedev;
> @@ -2706,6 +2761,12 @@ static void vfio_populate_device(VFIOPCIDevice
> *vdev, Error **errp)
>          return;
>      }
>=20
> +    vfio_init_fault_response_regions(vdev, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
>      irq_info.index =3D VFIO_PCI_ERR_IRQ_INDEX;
>=20
>      ret =3D ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info=
);
> @@ -2884,8 +2945,68 @@ static int vfio_iommu_set_pasid_table(PCIBus
> *bus, int32_t devfn,
>      return ioctl(container->fd, VFIO_IOMMU_SET_PASID_TABLE, &info);
>  }
>=20
> +static int vfio_iommu_return_page_response(PCIBus *bus, int32_t devfn,
> +                                           IOMMUPageResponse
> *resp)
> +{
> +    PCIDevice *pdev =3D bus->devices[devfn];
> +    VFIOPCIDevice *vdev =3D DO_UPCAST(VFIOPCIDevice, pdev, pdev);
> +    struct iommu_page_response *response =3D &resp->resp;
> +    struct vfio_region_dma_fault_response header;
> +    struct iommu_page_response *queue;
> +    char *queue_buffer =3D NULL;
> +    ssize_t bytes;
> +
> +    if (!vdev->dma_fault_response_region.mem) {
> +        return -EINVAL;
> +    }
> +
> +    /* read the header */
> +    bytes =3D pread(vdev->vbasedev.fd, &header, sizeof(header),
> +                  vdev->dma_fault_response_region.fd_offset);
> +    if (bytes !=3D sizeof(header)) {
> +        error_report("%s unable to read the fault region header (0x%lx)"=
,
> +                     __func__, bytes);
> +        return -1;
> +    }
> +
> +    /* Normally the fault queue is mmapped */
> +    queue =3D (struct iommu_page_response
> *)vdev->dma_fault_response_region.mmaps[0].mmap;
> +    if (!queue) {
> +        size_t queue_size =3D header.nb_entries * header.entry_size;
> +
> +        error_report("%s: fault queue not mmapped: slower fault handling=
",
> +                     vdev->vbasedev.name);
> +
> +        queue_buffer =3D g_malloc(queue_size);
> +        bytes =3D pread(vdev->vbasedev.fd, queue_buffer, queue_size,
> +                      vdev->dma_fault_response_region.fd_offset +
> header.offset);
> +        if (bytes !=3D queue_size) {
> +            error_report("%s unable to read the fault queue (0x%lx)",
> +                         __func__, bytes);
> +            return -1;
> +        }
> +
> +        queue =3D (struct iommu_page_response *)queue_buffer;
> +    }
> +    /* deposit the new response in the queue and increment the head */
> +    memcpy(queue + header.head, response, header.entry_size);
> +
> +    vdev->fault_response_head_index =3D
> +        (vdev->fault_response_head_index + 1) % header.nb_entries;
> +    bytes =3D pwrite(vdev->vbasedev.fd, &vdev->fault_response_head_index=
,
> 4,
> +                   vdev->dma_fault_response_region.fd_offset);
> +    if (bytes !=3D 4) {
> +        error_report("%s unable to write the fault response region head
> index (0x%lx)",
> +                     __func__, bytes);
> +    }
> +    g_free(queue_buffer);
> +
> +    return 0;
> +}
> +
>  static PCIPASIDOps vfio_pci_pasid_ops =3D {
>      .set_pasid_table =3D vfio_iommu_set_pasid_table,
> +    .return_page_response =3D vfio_iommu_return_page_response,
>  };
>=20
>  static void vfio_dma_fault_notifier_handler(void *opaque)

Also, I just noted that this patch breaks the dev hot add/del functionality=
.
device_add works fine but device_del is not removing the dev cleanly.

The below one fixes it. Please check.

Thanks,
Shameer

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 797acd9c73..92c1d48316 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3470,6 +3470,7 @@ static void vfio_instance_finalize(Object *obj)
     vfio_display_finalize(vdev);
     vfio_bars_finalize(vdev);
     vfio_region_finalize(&vdev->dma_fault_region);
+    vfio_region_finalize(&vdev->dma_fault_response_region);
     g_free(vdev->emulated_config_bits);
     g_free(vdev->rom);
     /*
@@ -3491,6 +3492,7 @@ static void vfio_exitfn(PCIDevice *pdev)
     vfio_unregister_err_notifier(vdev);
     vfio_unregister_ext_irq_notifiers(vdev);
     vfio_region_exit(&vdev->dma_fault_region);
+    vfio_region_exit(&vdev->dma_fault_response_region);
     pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
     if (vdev->irqchip_change_notifier.notify) {
         kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_not



