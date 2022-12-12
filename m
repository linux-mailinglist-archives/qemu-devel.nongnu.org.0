Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523066499D7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 09:00:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4dj8-000752-Rc; Mon, 12 Dec 2022 02:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p4dj6-00072k-HE
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:59:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p4dj3-0000m4-Oa
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:59:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670831989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iMEhdAlkBI2Ffv3tlb46L9yVQp2HNhEtS7JwINLLBcQ=;
 b=Hin+qj0WS+L5HCXJbLhxn2gzwvgLIfYizCH3yJ7qGQ1FLhFJnRChyl3WCyzDrlTS4gpL3k
 mz2mtrC0m9YbNUsOXrs+mVoSHZj6g/BVgrPZwBZfXD9WYf0+Jh4tLspMzyT8S58yHz0uM3
 8y/mg3yBPMWCcfaegP+svk2X4zkTOjc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-gvbOsQlZMXywLVc-ONgUTg-1; Mon, 12 Dec 2022 02:59:47 -0500
X-MC-Unique: gvbOsQlZMXywLVc-ONgUTg-1
Received: by mail-qv1-f71.google.com with SMTP id
 w2-20020a0562140b2200b004d66d74f93cso6408549qvj.15
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 23:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iMEhdAlkBI2Ffv3tlb46L9yVQp2HNhEtS7JwINLLBcQ=;
 b=VDIgOgWj10rVL5zC1uR9Ap18uOX/Xk6SyPlsh9dnFtzpZGZm7wdVDWWgZp69ceWlWi
 hFBtWkWznwgzW38Fb6IbOxKGrIarNnPAzPIuUf+F6LsAegat7XHrIeVna8X9Yidk+wBw
 chhiH0mzsG2yMOYVcuyuNHORqYkjan+QrmfT3rfVpae8F3qOUcxA/bCR1bnbC/pZFwyN
 7O2kfisKQsr/ci7RZQgo8DoL2CcBofr+eSkqz2+dpuyE7+XC5azmDCkdYOUyfN+ITFM+
 nr5hYG1nX/b/rnp58TSZ2orvyHuK586O9668zyEbG85KDlaIuw8rc+aAw9g5P7Y4ZRxr
 GESg==
X-Gm-Message-State: ANoB5pmCwRU3u3cqA7yGickbdzxZuiYsiDHi0tJmdbGvV9O37Mc2a1/I
 /jsI7Q9AsLxCTOSh0VDtsdY6ls+Y5BYkFF45GBj4y8JX5QNFR2MBoyJfsr1SGYftEOVUybz+GNM
 z66U2+Lo6h9UpH8E=
X-Received: by 2002:a05:622a:5c94:b0:39c:da20:f7af with SMTP id
 ge20-20020a05622a5c9400b0039cda20f7afmr22061107qtb.12.1670831986614; 
 Sun, 11 Dec 2022 23:59:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4a7iRyyCsAFUmCYGYsxqjycdpZKKrU1wBb8QFF5KwqlefqACHFiAG0sieJ20mpohiPfnEBbA==
X-Received: by 2002:a05:622a:5c94:b0:39c:da20:f7af with SMTP id
 ge20-20020a05622a5c9400b0039cda20f7afmr22061087qtb.12.1670831986001; 
 Sun, 11 Dec 2022 23:59:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 z11-20020ac87cab000000b003a7e4129f83sm5406863qtv.85.2022.12.11.23.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 23:59:45 -0800 (PST)
Message-ID: <3d87f79a-6662-5470-ec6b-4fc5a1b3707c@redhat.com>
Date: Mon, 12 Dec 2022 08:59:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 05/24] vfio-user: add device IO ops vector
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <1f85784fafd1673277b52b7b7c7e567723c1137f.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <1f85784fafd1673277b52b7b7c7e567723c1137f.1667542066.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
> Used for communication with VFIO driver
> (prep work for vfio-user, which will communicate over a socket)
> 
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>


I would keep the short rw handling for a subsequent patch to make
sure the changes do not introduce any functional change.

> ---
>   hw/vfio/ap.c                  |   1 +
>   hw/vfio/ccw.c                 |   1 +
>   hw/vfio/common.c              | 107 +++++++++++++++++++++++++++-----
>   hw/vfio/pci.c                 | 140 ++++++++++++++++++++++++++----------------
>   hw/vfio/platform.c            |   1 +
>   include/hw/vfio/vfio-common.h |  27 ++++++++
>   6 files changed, 209 insertions(+), 68 deletions(-)
> 
> diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
> index e0dd561..7ef42f1 100644
> --- a/hw/vfio/ap.c
> +++ b/hw/vfio/ap.c
> @@ -102,6 +102,7 @@ static void vfio_ap_realize(DeviceState *dev, Error **errp)
>       mdevid = basename(vapdev->vdev.sysfsdev);
>       vapdev->vdev.name = g_strdup_printf("%s", mdevid);
>       vapdev->vdev.dev = dev;
> +    vapdev->vdev.io_ops = &vfio_dev_io_ioctl;
>   
>       /*
>        * vfio-ap devices operate in a way compatible with discarding of
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index 06b588c..cbd1c25 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -614,6 +614,7 @@ static void vfio_ccw_get_device(VFIOGroup *group, VFIOCCWDevice *vcdev,
>       vcdev->vdev.type = VFIO_DEVICE_TYPE_CCW;
>       vcdev->vdev.name = name;
>       vcdev->vdev.dev = &vcdev->cdev.parent_obj.parent_obj;
> +    vcdev->vdev.io_ops = &vfio_dev_io_ioctl;
>   
>       return;
>   
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index dd9104f..c7bf0aa 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -71,7 +71,7 @@ void vfio_disable_irqindex(VFIODevice *vbasedev, int index)
>           .count = 0,
>       };
>   
> -    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> +    VDEV_SET_IRQS(vbasedev, &irq_set);
>   }
>   
>   void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
> @@ -84,7 +84,7 @@ void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
>           .count = 1,
>       };
>   
> -    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> +    VDEV_SET_IRQS(vbasedev, &irq_set);
>   }
>   
>   void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
> @@ -97,7 +97,7 @@ void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
>           .count = 1,
>       };
>   
> -    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> +    VDEV_SET_IRQS(vbasedev, &irq_set);
>   }
>   
>   static inline const char *action_to_str(int action)
> @@ -178,9 +178,7 @@ int vfio_set_irq_signaling(VFIODevice *vbasedev, int index, int subindex,
>       pfd = (int32_t *)&irq_set->data;
>       *pfd = fd;
>   
> -    if (ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irq_set)) {
> -        ret = -errno;
> -    }
> +    ret = VDEV_SET_IRQS(vbasedev, irq_set);
>       g_free(irq_set);
>   
>       if (!ret) {
> @@ -215,6 +213,7 @@ void vfio_region_write(void *opaque, hwaddr addr,
>           uint32_t dword;
>           uint64_t qword;
>       } buf;
> +    int ret;
>   
>       switch (size) {
>       case 1:
> @@ -234,13 +233,15 @@ void vfio_region_write(void *opaque, hwaddr addr,
>           break;
>       }
>   
> -    if (pwrite(vbasedev->fd, &buf, size, region->fd_offset + addr) != size) {
> +    ret = VDEV_REGION_WRITE(vbasedev, region->nr, addr, size, &buf);
> +    if (ret != size) {
> +        const char *err = ret < 0 ? strerror(-ret) : "short write";
> +
>           error_report("%s(%s:region%d+0x%"HWADDR_PRIx", 0x%"PRIx64
> -                     ",%d) failed: %m",
> +                     ",%d) failed: %s",
>                        __func__, vbasedev->name, region->nr,
> -                     addr, data, size);
> +                     addr, data, size, err);
>       }
> -
>       trace_vfio_region_write(vbasedev->name, region->nr, addr, data, size);
>   
>       /*
> @@ -266,13 +267,18 @@ uint64_t vfio_region_read(void *opaque,
>           uint64_t qword;
>       } buf;
>       uint64_t data = 0;
> +    int ret;
> +
> +    ret = VDEV_REGION_READ(vbasedev, region->nr, addr, size, &buf);
> +    if (ret != size) {
> +        const char *err = ret < 0 ? strerror(-ret) : "short read";
>   
> -    if (pread(vbasedev->fd, &buf, size, region->fd_offset + addr) != size) {
> -        error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %m",
> +        error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %s",
>                        __func__, vbasedev->name, region->nr,
> -                     addr, size);
> +                     addr, size, err);
>           return (uint64_t)-1;
>       }
> +
>       switch (size) {
>       case 1:
>           data = buf.byte;
> @@ -2450,6 +2456,7 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
>                            struct vfio_region_info **info)
>   {
>       size_t argsz = sizeof(struct vfio_region_info);
> +    int ret;
>   
>       /* create region cache */
>       if (vbasedev->regions == NULL) {
> @@ -2468,10 +2475,11 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
>   retry:
>       (*info)->argsz = argsz;
>   
> -    if (ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, *info)) {
> +    ret = VDEV_GET_REGION_INFO(vbasedev, *info);
> +    if (ret != 0) {
>           g_free(*info);
>           *info = NULL;
> -        return -errno;
> +        return ret;
>       }
>   
>       if ((*info)->argsz > argsz) {
> @@ -2632,6 +2640,75 @@ int vfio_eeh_as_op(AddressSpace *as, uint32_t op)
>    * Traditional ioctl() based io_ops
>    */
>   
> +static int vfio_io_get_info(VFIODevice *vbasedev, struct vfio_device_info *info)
> +{
> +    int ret;
> +
> +    ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_INFO, info);
> +
> +    return ret < 0 ? -errno : ret;
> +}
> +
> +static int vfio_io_get_region_info(VFIODevice *vbasedev,
> +                                   struct vfio_region_info *info)
> +{
> +    int ret;
> +
> +    ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, info);
> +
> +    return ret < 0 ? -errno : ret;
> +}
> +
> +static int vfio_io_get_irq_info(VFIODevice *vbasedev,
> +                                struct vfio_irq_info *info)
> +{
> +    int ret;
> +
> +    ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_IRQ_INFO, info);
> +
> +    return ret < 0 ? -errno : ret;
> +}
> +
> +static int vfio_io_set_irqs(VFIODevice *vbasedev, struct vfio_irq_set *irqs)
> +{
> +    int ret;
> +
> +    ret = ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irqs);
> +
> +    return ret < 0 ? -errno : ret;
> +}
> +
> +static int vfio_io_region_read(VFIODevice *vbasedev, uint8_t index, off_t off,
> +                               uint32_t size, void *data)
> +{
> +    struct vfio_region_info *info = vbasedev->regions[index];
> +    int ret;
> +
> +    ret = pread(vbasedev->fd, data, size, info->offset + off);
> +
> +    return ret < 0 ? -errno : ret;
> +}
> +
> +static int vfio_io_region_write(VFIODevice *vbasedev, uint8_t index, off_t off,
> +                                uint32_t size, void *data)
> +{
> +    struct vfio_region_info *info = vbasedev->regions[index];
> +    int ret;
> +
> +    ret = pwrite(vbasedev->fd, data, size, info->offset + off);
> +
> +    return ret < 0 ? -errno : ret;
> +}
> +
> +VFIODevIO vfio_dev_io_ioctl = {
> +    .get_info = vfio_io_get_info,
> +    .get_region_info = vfio_io_get_region_info,
> +    .get_irq_info = vfio_io_get_irq_info,
> +    .set_irqs = vfio_io_set_irqs,
> +    .region_read = vfio_io_region_read,
> +    .region_write = vfio_io_region_write,
> +};
> +
>   static int vfio_io_dma_map(VFIOContainer *container,
>                              struct vfio_iommu_type1_dma_map *map)
>   {
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 1c7618d..80b03a2 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -43,6 +43,14 @@
>   #include "migration/blocker.h"
>   #include "migration/qemu-file.h"
>   
> +/* convenience macros for PCI config space */
> +#define VDEV_CONFIG_READ(vbasedev, off, size, data) \
> +    VDEV_REGION_READ((vbasedev), VFIO_PCI_CONFIG_REGION_INDEX, (off), \
> +                     (size), (data))
> +#define VDEV_CONFIG_WRITE(vbasedev, off, size, data) \
> +    VDEV_REGION_WRITE((vbasedev), VFIO_PCI_CONFIG_REGION_INDEX, (off), \
> +                      (size), (data))
> +
>   #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
>   
>   /* Protected by BQL */
> @@ -406,7 +414,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
>           fds[i] = fd;
>       }
>   
> -    ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_set);
> +    ret = VDEV_SET_IRQS(&vdev->vbasedev, irq_set);
>   
>       g_free(irq_set);
>   
> @@ -818,14 +826,16 @@ static void vfio_update_msi(VFIOPCIDevice *vdev)
>   
>   static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
>   {
> +    VFIODevice *vbasedev = &vdev->vbasedev;
>       struct vfio_region_info *reg_info;
>       uint64_t size;
>       off_t off = 0;
>       ssize_t bytes;
> +    int ret;
>   
> -    if (vfio_get_region_info(&vdev->vbasedev,
> -                             VFIO_PCI_ROM_REGION_INDEX, &reg_info)) {
> -        error_report("vfio: Error getting ROM info: %m");
> +    ret = vfio_get_region_info(vbasedev, VFIO_PCI_ROM_REGION_INDEX, &reg_info);
> +    if (ret < 0) {
> +        error_report("vfio: Error getting ROM info: %s", strerror(-ret));
>           return;
>       }
>   
> @@ -850,18 +860,19 @@ static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
>       memset(vdev->rom, 0xff, size);
>   
>       while (size) {
> -        bytes = pread(vdev->vbasedev.fd, vdev->rom + off,
> -                      size, vdev->rom_offset + off);
> +        bytes = VDEV_REGION_READ(vbasedev, VFIO_PCI_ROM_REGION_INDEX, off,
> +                                 size, vdev->rom + off);
>           if (bytes == 0) {
>               break;
>           } else if (bytes > 0) {
>               off += bytes;
>               size -= bytes;
>           } else {
> -            if (errno == EINTR || errno == EAGAIN) {
> +            if (bytes == -EINTR || bytes == -EAGAIN) {
>                   continue;
>               }
> -            error_report("vfio: Error reading device ROM: %m");
> +            error_report("vfio: Error reading device ROM: %s",
> +                         strerror(-bytes));
>               break;
>           }
>       }
> @@ -949,11 +960,10 @@ static const MemoryRegionOps vfio_rom_ops = {
>   
>   static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
>   {
> +    VFIODevice *vbasedev = &vdev->vbasedev;
>       uint32_t orig, size = cpu_to_le32((uint32_t)PCI_ROM_ADDRESS_MASK);
> -    off_t offset = vdev->config_offset + PCI_ROM_ADDRESS;
>       DeviceState *dev = DEVICE(vdev);
>       char *name;
> -    int fd = vdev->vbasedev.fd;
>   
>       if (vdev->pdev.romfile || !vdev->pdev.rom_bar) {
>           /* Since pci handles romfile, just print a message and return */
> @@ -970,11 +980,12 @@ static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
>        * Use the same size ROM BAR as the physical device.  The contents
>        * will get filled in later when the guest tries to read it.
>        */
> -    if (pread(fd, &orig, 4, offset) != 4 ||
> -        pwrite(fd, &size, 4, offset) != 4 ||
> -        pread(fd, &size, 4, offset) != 4 ||
> -        pwrite(fd, &orig, 4, offset) != 4) {
> -        error_report("%s(%s) failed: %m", __func__, vdev->vbasedev.name);
> +    if (VDEV_CONFIG_READ(vbasedev, PCI_ROM_ADDRESS, 4, &orig) != 4 ||
> +        VDEV_CONFIG_WRITE(vbasedev, PCI_ROM_ADDRESS, 4, &size) != 4 ||
> +        VDEV_CONFIG_READ(vbasedev, PCI_ROM_ADDRESS, 4, &size) != 4 ||
> +        VDEV_CONFIG_WRITE(vbasedev, PCI_ROM_ADDRESS, 4, &orig) != 4) {
> +
> +        error_report("%s(%s) ROM access failed", __func__, vbasedev->name);
>           return;
>       }
>   
> @@ -1154,6 +1165,7 @@ static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
>   uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
>   {
>       VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
> +    VFIODevice *vbasedev = &vdev->vbasedev;
>       uint32_t emu_bits = 0, emu_val = 0, phys_val = 0, val;
>   
>       memcpy(&emu_bits, vdev->emulated_config_bits + addr, len);
> @@ -1166,12 +1178,13 @@ uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
>       if (~emu_bits & (0xffffffffU >> (32 - len * 8))) {
>           ssize_t ret;
>   
> -        ret = pread(vdev->vbasedev.fd, &phys_val, len,
> -                    vdev->config_offset + addr);
> +        ret = VDEV_CONFIG_READ(vbasedev, addr, len, &phys_val);
>           if (ret != len) {
> -            error_report("%s(%s, 0x%x, 0x%x) failed: %m",
> -                         __func__, vdev->vbasedev.name, addr, len);
> -            return -errno;
> +            const char *err = ret < 0 ? strerror(-ret) : "short read";
> +
> +            error_report("%s(%s, 0x%x, 0x%x) failed: %s",
> +                         __func__, vbasedev->name, addr, len, err);
> +            return -1;
>           }
>           phys_val = le32_to_cpu(phys_val);
>       }
> @@ -1187,15 +1200,19 @@ void vfio_pci_write_config(PCIDevice *pdev,
>                              uint32_t addr, uint32_t val, int len)
>   {
>       VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
> +    VFIODevice *vbasedev = &vdev->vbasedev;
>       uint32_t val_le = cpu_to_le32(val);
> +    int ret;
>   
>       trace_vfio_pci_write_config(vdev->vbasedev.name, addr, val, len);
>   
>       /* Write everything to VFIO, let it filter out what we can't write */
> -    if (pwrite(vdev->vbasedev.fd, &val_le, len, vdev->config_offset + addr)
> -                != len) {
> -        error_report("%s(%s, 0x%x, 0x%x, 0x%x) failed: %m",
> -                     __func__, vdev->vbasedev.name, addr, val, len);
> +    ret = VDEV_CONFIG_WRITE(vbasedev, addr, len, &val_le);
> +    if (ret != len) {
> +        const char *err = ret < 0 ? strerror(-ret) : "short write";
> +
> +        error_report("%s(%s, 0x%x, 0x%x, 0x%x) failed: %s",
> +                     __func__, vbasedev->name, addr, val, len, err);
>       }
>   
>       /* MSI/MSI-X Enabling/Disabling */
> @@ -1283,10 +1300,13 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
>       int ret, entries;
>       Error *err = NULL;
>   
> -    if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
> -              vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
> -        error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
> -        return -errno;
> +    ret = VDEV_CONFIG_READ(&vdev->vbasedev, pos + PCI_CAP_FLAGS,
> +                           sizeof(ctrl), &ctrl);
> +    if (ret != sizeof(ctrl)) {
> +        const char *err = ret < 0 ? strerror(-ret) : "short read";
> +
> +        error_setg(errp, "failed reading MSI PCI_CAP_FLAGS %s", err);
> +        return ret;
>       }
>       ctrl = le16_to_cpu(ctrl);
>   
> @@ -1488,33 +1508,39 @@ static void vfio_pci_relocate_msix(VFIOPCIDevice *vdev, Error **errp)
>    */
>   static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
>   {
> +    VFIODevice *vbasedev = &vdev->vbasedev;
>       uint8_t pos;
>       uint16_t ctrl;
>       uint32_t table, pba;
> -    int fd = vdev->vbasedev.fd;
>       VFIOMSIXInfo *msix;
> +    int ret;
>   
>       pos = pci_find_capability(&vdev->pdev, PCI_CAP_ID_MSIX);
>       if (!pos) {
>           return;
>       }
>   
> -    if (pread(fd, &ctrl, sizeof(ctrl),
> -              vdev->config_offset + pos + PCI_MSIX_FLAGS) != sizeof(ctrl)) {
> -        error_setg_errno(errp, errno, "failed to read PCI MSIX FLAGS");
> -        return;
> +    ret = VDEV_CONFIG_READ(vbasedev, pos + PCI_MSIX_FLAGS,
> +                           sizeof(ctrl), &ctrl);
> +    if (ret != sizeof(ctrl)) {
> +        const char *err = ret < 0 ? strerror(-ret) : "short read";
> +
> +        error_setg(errp, "failed to read PCI MSIX FLAGS %s", err);
>       }
>   
> -    if (pread(fd, &table, sizeof(table),
> -              vdev->config_offset + pos + PCI_MSIX_TABLE) != sizeof(table)) {
> -        error_setg_errno(errp, errno, "failed to read PCI MSIX TABLE");
> -        return;
> +    ret = VDEV_CONFIG_READ(vbasedev, pos + PCI_MSIX_TABLE,
> +                           sizeof(table), &table);
> +    if (ret != sizeof(table)) {
> +        const char *err = ret < 0 ? strerror(-ret) : "short read";
> +
> +        error_setg(errp, "failed to read PCI MSIX TABLE %s", err);
>       }
>   
> -    if (pread(fd, &pba, sizeof(pba),
> -              vdev->config_offset + pos + PCI_MSIX_PBA) != sizeof(pba)) {
> -        error_setg_errno(errp, errno, "failed to read PCI MSIX PBA");
> -        return;
> +    ret = VDEV_CONFIG_READ(vbasedev, pos + PCI_MSIX_PBA, sizeof(pba), &pba);
> +    if (ret != sizeof(pba)) {
> +        const char *err = ret < 0 ? strerror(-ret) : "short read";
> +
> +        error_setg(errp, "failed to read PCI MSIX PBA %s", err);
>       }
>   
>       ctrl = le16_to_cpu(ctrl);
> @@ -1652,7 +1678,6 @@ static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled)
>   static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
>   {
>       VFIOBAR *bar = &vdev->bars[nr];
> -
>       uint32_t pci_bar;
>       int ret;
>   
> @@ -1662,10 +1687,12 @@ static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
>       }
>   
>       /* Determine what type of BAR this is for registration */
> -    ret = pread(vdev->vbasedev.fd, &pci_bar, sizeof(pci_bar),
> -                vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr));
> +    ret = VDEV_CONFIG_READ(&vdev->vbasedev, PCI_BASE_ADDRESS_0 + (4 * nr),
> +                           sizeof(pci_bar), &pci_bar);
>       if (ret != sizeof(pci_bar)) {
> -        error_report("vfio: Failed to read BAR %d (%m)", nr);
> +        const char *err =  ret < 0 ? strerror(-ret) : "short read";
> +
> +        error_report("vfio: Failed to read BAR %d (%s)", nr, err);
>           return;
>       }
>   
> @@ -2213,8 +2240,9 @@ static void vfio_pci_pre_reset(VFIOPCIDevice *vdev)
>   
>   static void vfio_pci_post_reset(VFIOPCIDevice *vdev)
>   {
> +    VFIODevice *vbasedev = &vdev->vbasedev;
>       Error *err = NULL;
> -    int nr;
> +    int ret, nr;
>   
>       vfio_intx_enable(vdev, &err);
>       if (err) {
> @@ -2222,13 +2250,16 @@ static void vfio_pci_post_reset(VFIOPCIDevice *vdev)
>       }
>   
>       for (nr = 0; nr < PCI_NUM_REGIONS - 1; ++nr) {
> -        off_t addr = vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr);
> +        off_t addr = PCI_BASE_ADDRESS_0 + (4 * nr);
>           uint32_t val = 0;
>           uint32_t len = sizeof(val);
>   
> -        if (pwrite(vdev->vbasedev.fd, &val, len, addr) != len) {
> -            error_report("%s(%s) reset bar %d failed: %m", __func__,
> -                         vdev->vbasedev.name, nr);
> +        ret = VDEV_CONFIG_WRITE(vbasedev, addr, len, &val);
> +        if (ret != len) {
> +            const char *err = ret < 0 ? strerror(-ret) : "short write";
> +
> +            error_report("%s(%s) reset bar %d failed: %s", __func__,
> +                         vbasedev->name, nr, err);
>           }
>       }
>   
> @@ -2675,7 +2706,7 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
>   
>       irq_info.index = VFIO_PCI_ERR_IRQ_INDEX;
>   
> -    ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info);
> +    ret = VDEV_GET_IRQ_INFO(vbasedev, &irq_info);
>       if (ret) {
>           /* This can fail for an old kernel or legacy PCI dev */
>           trace_vfio_populate_device_get_irq_info_failure(strerror(errno));
> @@ -2794,8 +2825,10 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
>           return;
>       }
>   
> -    if (ioctl(vdev->vbasedev.fd,
> -              VFIO_DEVICE_GET_IRQ_INFO, &irq_info) < 0 || irq_info.count < 1) {
> +    if (VDEV_GET_IRQ_INFO(&vdev->vbasedev, &irq_info) < 0) {
> +        return;
> +    }
> +    if (irq_info.count < 1) {
>           return;
>       }
>   
> @@ -2874,6 +2907,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>       vbasedev->ops = &vfio_pci_ops;
>       vbasedev->type = VFIO_DEVICE_TYPE_PCI;
>       vbasedev->dev = DEVICE(vdev);
> +    vbasedev->io_ops = &vfio_dev_io_ioctl;
>   
>       tmp = g_strdup_printf("%s/iommu_group", vbasedev->sysfsdev);
>       len = readlink(tmp, group_path, sizeof(group_path));
> diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
> index 5af73f9..c136b09 100644
> --- a/hw/vfio/platform.c
> +++ b/hw/vfio/platform.c
> @@ -621,6 +621,7 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
>       vbasedev->type = VFIO_DEVICE_TYPE_PLATFORM;
>       vbasedev->dev = dev;
>       vbasedev->ops = &vfio_platform_ops;
> +    vbasedev->io_ops = &vfio_dev_io_ioctl;
>   
>       qemu_mutex_init(&vdev->intp_mutex);
>   
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index a1db165..7713d98 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -124,6 +124,7 @@ typedef struct VFIOHostDMAWindow {
>   } VFIOHostDMAWindow;
>   
>   typedef struct VFIODeviceOps VFIODeviceOps;
> +typedef struct VFIODevIO VFIODevIO;
>   
>   typedef struct VFIODevice {
>       QLIST_ENTRY(VFIODevice) next;
> @@ -139,6 +140,7 @@ typedef struct VFIODevice {
>       bool ram_block_discard_allowed;
>       bool enable_migration;
>       VFIODeviceOps *ops;
> +    VFIODevIO *io_ops;

VFIODeviceIoOps ?

>       unsigned int num_irqs;
>       unsigned int num_regions;
>       unsigned int flags;
> @@ -165,6 +167,30 @@ struct VFIODeviceOps {
>    * through ioctl() to the kernel VFIO driver, but vfio-user
>    * can use a socket to a remote process.
>    */
> +struct VFIODevIO {
> +    int (*get_info)(VFIODevice *vdev, struct vfio_device_info *info);
> +    int (*get_region_info)(VFIODevice *vdev,
> +                           struct vfio_region_info *info);
> +    int (*get_irq_info)(VFIODevice *vdev, struct vfio_irq_info *irq);
> +    int (*set_irqs)(VFIODevice *vdev, struct vfio_irq_set *irqs);
> +    int (*region_read)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
> +                       void *data);
> +    int (*region_write)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
> +                        void *data);
> +};
> +
> +#define VDEV_GET_INFO(vdev, info) \
> +    ((vdev)->io_ops->get_info((vdev), (info)))
> +#define VDEV_GET_REGION_INFO(vdev, info) \
> +    ((vdev)->io_ops->get_region_info((vdev), (info)))
> +#define VDEV_GET_IRQ_INFO(vdev, irq) \
> +    ((vdev)->io_ops->get_irq_info((vdev), (irq)))
> +#define VDEV_SET_IRQS(vdev, irqs) \
> +    ((vdev)->io_ops->set_irqs((vdev), (irqs)))
> +#define VDEV_REGION_READ(vdev, nr, off, size, data) \
> +    ((vdev)->io_ops->region_read((vdev), (nr), (off), (size), (data)))
> +#define VDEV_REGION_WRITE(vdev, nr, off, size, data) \
> +    ((vdev)->io_ops->region_write((vdev), (nr), (off), (size), (data)))


I don't find these macros very usefull.

Thanks,

C.


>   struct VFIOContIO {
>       int (*dma_map)(VFIOContainer *container,
> @@ -184,6 +210,7 @@ struct VFIOContIO {
>   #define CONT_DIRTY_BITMAP(cont, bitmap, range) \
>       ((cont)->io_ops->dirty_bitmap((cont), (bitmap), (range)))
>   
> +extern VFIODevIO vfio_dev_io_ioctl;
>   extern VFIOContIO vfio_cont_io_ioctl;
>   
>   #endif /* CONFIG_LINUX */


