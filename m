Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2052F64CE98
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 18:04:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5V7Y-000874-8v; Wed, 14 Dec 2022 12:00:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p5V7P-00082U-8y
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 12:00:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p5V7M-0002hV-Dk
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 12:00:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671037226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vq/QGYRUbfU2g/ZO5i/wuf/wH4RY6ASPBFeatfBluo0=;
 b=NqxQY9Zumd0/v/a/cUuuR+LEFa8fqKPMp11wBOtLBViLiv9oYNvRNRV5PCainWwL4lB3ld
 wfGfGBaKrQcGYOCt3V5ir5ve+zfWeE55dQ5EH9f2QJBFaQAYvDfrl+nVMys/8+qKtOxo0M
 KcpSVjvzj2Vbdq/ltYSleCIdcUOJTwg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-80ZTn8oVOzS9t3sX9WvK4A-1; Wed, 14 Dec 2022 12:00:24 -0500
X-MC-Unique: 80ZTn8oVOzS9t3sX9WvK4A-1
Received: by mail-qv1-f70.google.com with SMTP id
 nv1-20020a056214360100b004dace6b21c9so173421qvb.18
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 09:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vq/QGYRUbfU2g/ZO5i/wuf/wH4RY6ASPBFeatfBluo0=;
 b=HV5Il7+A9SUHsdkapwLv+K3w6tHYacqBXoclAjPQiu0wNDMY8Amkce7dWl91i/h5XP
 CVha8ElvczNi9fcFsK3bsJOhmfeAuqCQuT3TPr8gdmHXUJyctvsuqxwPr+ceRBX6qg2c
 qPzUZv39RtKmootzQeQniLqyZR2QmEZh7EAEyLwn31bx8cUDzR6wYDViLEkLClDL9Aic
 8O48rTdrXT3H3JP5QEB148QteYFpBI2hVFDXFLOS0A5TzN1usNZagMqu3GL2RJC1voiT
 5aWoL6bUke2EPmiBwuxSqh/JxQmBQi9UAKUktNHIn0aHBGj6z++UuHq5Kfa9HK9O2saz
 +tvQ==
X-Gm-Message-State: ANoB5plO2P9HzR9b1TQi3cQmpFNwpvG6rz9bDxkchPN7s1OkmPjK7GGd
 sQg5LgN7IryFt/dXA7qdiGVYN3xFwDlbTRrgnZSy/MS1U8dEOSreLAS9yzrm81RrtlS2A9YHlEr
 EfiFtBUsvU64UDuY=
X-Received: by 2002:ac8:7081:0:b0:3a8:21a5:d93 with SMTP id
 y1-20020ac87081000000b003a821a50d93mr10517261qto.39.1671037223897; 
 Wed, 14 Dec 2022 09:00:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4gNnpo9wsK3oiSNp4EGP0Zt+nngG2YXImg90csNdGDIlJQ4Sy9K0wHxz0WIgBZoRU142cThw==
X-Received: by 2002:ac8:7081:0:b0:3a8:21a5:d93 with SMTP id
 y1-20020ac87081000000b003a821a50d93mr10517218qto.39.1671037223496; 
 Wed, 14 Dec 2022 09:00:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a05620a0bc100b006bb2cd2f6d1sm10230188qki.127.2022.12.14.09.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 09:00:23 -0800 (PST)
Message-ID: <8a0343ec-5934-3e6d-8f5a-634620930cb7@redhat.com>
Date: Wed, 14 Dec 2022 18:00:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 15/24] vfio-user: forward msix BAR accesses to server
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <440467975afbc80a97caaead3222199397c0698e.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <440467975afbc80a97caaead3222199397c0698e.1667542066.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 11/9/22 00:13, John Johnson wrote:
> Server holds device current device pending state
> Use irq masking commands in socket case
> 
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>

May be use 'can_mask_irq' instead of 'irq_mask_works'

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

One typo below,

> ---
>   hw/vfio/ccw.c                 |  1 +
>   hw/vfio/common.c              | 26 +++++++++++++
>   hw/vfio/pci.c                 | 87 ++++++++++++++++++++++++++++++++++++++++++-
>   hw/vfio/pci.h                 |  1 +
>   hw/vfio/platform.c            |  1 +
>   include/hw/vfio/vfio-common.h |  3 ++
>   6 files changed, 118 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index cbd1c25..830ca53 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -615,6 +615,7 @@ static void vfio_ccw_get_device(VFIOGroup *group, VFIOCCWDevice *vcdev,
>       vcdev->vdev.name = name;
>       vcdev->vdev.dev = &vcdev->cdev.parent_obj.parent_obj;
>       vcdev->vdev.io_ops = &vfio_dev_io_ioctl;
> +    vcdev->vdev.irq_mask_works = false;
>   
>       return;
>   
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 87cd1d1..b540195 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -101,6 +101,32 @@ void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
>       VDEV_SET_IRQS(vbasedev, &irq_set);
>   }
>   
> +void vfio_mask_single_irq(VFIODevice *vbasedev, int index, int irq)
> +{
> +    struct vfio_irq_set irq_set = {
> +        .argsz = sizeof(irq_set),
> +        .flags = VFIO_IRQ_SET_DATA_NONE | VFIO_IRQ_SET_ACTION_MASK,
> +        .index = index,
> +        .start = irq,
> +        .count = 1,
> +    };
> +
> +    VDEV_SET_IRQS(vbasedev, &irq_set);
> +}
> +
> +void vfio_unmask_single_irq(VFIODevice *vbasedev, int index, int irq)
> +{
> +    struct vfio_irq_set irq_set = {
> +        .argsz = sizeof(irq_set),
> +        .flags = VFIO_IRQ_SET_DATA_NONE | VFIO_IRQ_SET_ACTION_UNMASK,
> +        .index = index,
> +        .start = irq,
> +        .count = 1,
> +    };
> +
> +    VDEV_SET_IRQS(vbasedev, &irq_set);
> +}
> +
>   static inline const char *action_to_str(int action)
>   {
>       switch (action) {
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index be39a4e..a1ae3fb 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -479,6 +479,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>   {
>       VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
>       VFIOMSIVector *vector;
> +    bool new_vec = false;
>       int ret;
>   
>       trace_vfio_msix_vector_do_use(vdev->vbasedev.name, nr);
> @@ -492,6 +493,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>               error_report("vfio: Error: event_notifier_init failed");
>           }
>           vector->use = true;
> +        new_vec = true;
>           msix_vector_use(pdev, nr);
>       }
>   
> @@ -518,6 +520,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>                   kvm_irqchip_commit_route_changes(&vfio_route_change);
>                   vfio_connect_kvm_msi_virq(vector);
>               }
> +            new_vec = true;
>           }
>       }
>   
> @@ -525,6 +528,8 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>        * We don't want to have the host allocate all possible MSI vectors
>        * for a device if they're not in use, so we shutdown and incrementally
>        * increase them as needed.
> +     * Otherwise, unmask the vector if the vector is already setup (and we can
> +     * do so) or send the fd if not.
>        */
>       if (vdev->nr_vectors < nr + 1) {
>           vdev->nr_vectors = nr + 1;
> @@ -535,6 +540,8 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
>                   error_report("vfio: failed to enable vectors, %d", ret);
>               }
>           }
> +    } else if (vdev->vbasedev.irq_mask_works && !new_vec) {
> +        vfio_unmask_single_irq(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX, nr);
>       } else {
>           Error *err = NULL;
>           int32_t fd;
> @@ -576,6 +583,12 @@ static void vfio_msix_vector_release(PCIDevice *pdev, unsigned int nr)
>   
>       trace_vfio_msix_vector_release(vdev->vbasedev.name, nr);
>   
> +    /* just mask vector if peer supports it */
> +    if (vdev->vbasedev.irq_mask_works) {
> +        vfio_mask_single_irq(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX, nr);
> +        return;
> +    }
> +
>       /*
>        * There are still old guests that mask and unmask vectors on every
>        * interrupt.  If we're using QEMU bypass with a KVM irqfd, leave all of
> @@ -646,7 +659,7 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
>           if (ret) {
>               error_report("vfio: failed to enable vectors, %d", ret);
>           }
> -    } else {
> +    } else if (!vdev->vbasedev.irq_mask_works) {
>           /*
>            * Some communication channels between VF & PF or PF & fw rely on the
>            * physical state of the device and expect that enabling MSI-X from the
> @@ -662,6 +675,13 @@ static void vfio_msix_enable(VFIOPCIDevice *vdev)
>            */
>           vfio_msix_vector_do_use(&vdev->pdev, 0, NULL, NULL);
>           vfio_msix_vector_release(&vdev->pdev, 0);
> +    } else {
> +        /*
> +         * If we can use irq masking, send an invalid fd on vector 0
> +         * to enable MSI-X without any vectors enabled.
> +         */
> +        vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_MSIX_IRQ_INDEX, 0,
> +                               VFIO_IRQ_SET_ACTION_TRIGGER, -1, NULL);
>       }
>   
>       trace_vfio_msix_enable(vdev->vbasedev.name);
> @@ -3042,6 +3062,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>       vbasedev->type = VFIO_DEVICE_TYPE_PCI;
>       vbasedev->dev = DEVICE(vdev);
>       vbasedev->io_ops = &vfio_dev_io_ioctl;
> +    vbasedev->irq_mask_works = false;
>   
>       tmp = g_strdup_printf("%s/iommu_group", vbasedev->sysfsdev);
>       len = readlink(tmp, group_path, sizeof(group_path));
> @@ -3474,6 +3495,62 @@ type_init(register_vfio_pci_dev_type)
>    */
>   
>   /*
> + * The server maintains the device's pending interrupts,
> + * via its MSIX table and PBA, so we treat these acceses

'accesses'

> + * like PCI config space and forward them.
> + */
> +static uint64_t vfio_user_pba_read(void *opaque, hwaddr addr,
> +                                   unsigned size)
> +{
> +    VFIOPCIDevice *vdev = opaque;
> +    VFIORegion *region = &vdev->bars[vdev->msix->pba_bar].region;
> +    uint64_t data;
> +
> +    /* server copy is what matters */
> +    data = vfio_region_read(region, addr + vdev->msix->pba_offset, size);
> +    return data;
> +}
> +
> +static void vfio_user_pba_write(void *opaque, hwaddr addr,
> +                                  uint64_t data, unsigned size)
> +{
> +    /* dropped */
> +}
> +
> +static const MemoryRegionOps vfio_user_pba_ops = {
> +    .read = vfio_user_pba_read,
> +    .write = vfio_user_pba_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static void vfio_user_msix_setup(VFIOPCIDevice *vdev)
> +{
> +    MemoryRegion *vfio_reg, *msix_reg, *pba_reg;
> +
> +    pba_reg = g_new0(MemoryRegion, 1);
> +    vdev->msix->pba_region = pba_reg;
> +
> +    vfio_reg = vdev->bars[vdev->msix->pba_bar].mr;
> +    msix_reg = &vdev->pdev.msix_pba_mmio;
> +    memory_region_init_io(pba_reg, OBJECT(vdev), &vfio_user_pba_ops, vdev,
> +                          "VFIO MSIX PBA", int128_get64(msix_reg->size));
> +    memory_region_add_subregion_overlap(vfio_reg, vdev->msix->pba_offset,
> +                                        pba_reg, 1);
> +}
> +
> +static void vfio_user_msix_teardown(VFIOPCIDevice *vdev)
> +{
> +    MemoryRegion *mr, *sub;
> +
> +    mr = vdev->bars[vdev->msix->pba_bar].mr;
> +    sub = vdev->msix->pba_region;
> +    memory_region_del_subregion(mr, sub);
> +
> +    g_free(vdev->msix->pba_region);
> +    vdev->msix->pba_region = NULL;
> +}
> +
> +/*
>    * Incoming request message callback.
>    *
>    * Runs off main loop, so BQL held.
> @@ -3551,6 +3628,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>       vbasedev->type = VFIO_DEVICE_TYPE_PCI;
>       vbasedev->dev = DEVICE(vdev);
>       vbasedev->io_ops = &vfio_dev_io_sock;
> +    vdev->vbasedev.irq_mask_works = true;
>   
>       ret = VDEV_GET_INFO(vbasedev, &info);
>       if (ret) {
> @@ -3589,6 +3667,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>       if (ret) {
>           goto out_teardown;
>       }
> +    if (vdev->msix != NULL) {
> +        vfio_user_msix_setup(vdev);
> +    }
>   
>       ret = vfio_interrupt_setup(vdev, errp);
>       if (ret) {
> @@ -3612,6 +3693,10 @@ static void vfio_user_instance_finalize(Object *obj)
>       VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
>       VFIODevice *vbasedev = &vdev->vbasedev;
>   
> +    if (vdev->msix != NULL) {
> +        vfio_user_msix_teardown(vdev);
> +    }
> +
>       vfio_put_device(vdev);
>   
>       if (vbasedev->proxy != NULL) {
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index ec17f2e..c04fa58 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -113,6 +113,7 @@ typedef struct VFIOMSIXInfo {
>       uint32_t table_offset;
>       uint32_t pba_offset;
>       unsigned long *pending;
> +    MemoryRegion *pba_region;
>   } VFIOMSIXInfo;
>   
>   /*
> diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
> index c136b09..ccf1df7 100644
> --- a/hw/vfio/platform.c
> +++ b/hw/vfio/platform.c
> @@ -622,6 +622,7 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
>       vbasedev->dev = dev;
>       vbasedev->ops = &vfio_platform_ops;
>       vbasedev->io_ops = &vfio_dev_io_ioctl;
> +    vbasedev->irq_mask_works = false;
>   
>       qemu_mutex_init(&vdev->intp_mutex);
>   
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 6324132..793ca94 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -142,6 +142,7 @@ typedef struct VFIODevice {
>       bool no_mmap;
>       bool ram_block_discard_allowed;
>       bool enable_migration;
> +    bool irq_mask_works;
>       VFIODeviceOps *ops;
>       VFIODevIO *io_ops;
>       unsigned int num_irqs;
> @@ -260,6 +261,8 @@ void vfio_put_base_device(VFIODevice *vbasedev);
>   void vfio_disable_irqindex(VFIODevice *vbasedev, int index);
>   void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index);
>   void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index);
> +void vfio_unmask_single_irq(VFIODevice *vbasedev, int index, int irq);
> +void vfio_mask_single_irq(VFIODevice *vbasedev, int index, int irq);
>   int vfio_set_irq_signaling(VFIODevice *vbasedev, int index, int subindex,
>                              int action, int fd, Error **errp);
>   void vfio_region_write(void *opaque, hwaddr addr,


