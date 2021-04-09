Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF48359518
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 08:04:04 +0200 (CEST)
Received: from localhost ([::1]:42982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUkFO-0006dQ-RK
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 02:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lUkE5-0006Ck-5B
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 02:02:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lUkDz-00062o-Lk
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 02:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617948153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FdJvcXZfEgPxiAudaup2O0N1AaTHHHGLC2D3EOEnWsc=;
 b=eJnTzMfKn02e9XFjxNaQjpWNnLop2isNSEVWejE5anPS//Rpa/91GT+GjGjMkx+F6g4/BD
 XZthY5NukqsWado56Y9WJ/Y23vcHZG6qmZ8hPZQIQE9G/GqQ/FrKCE9MIEwSgFwOzvwIil
 gjhOzY9H8yze1bWfkJ0mB/EmgD+Ucz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-tw_GUov3OKqyqaMQRiFNfg-1; Fri, 09 Apr 2021 02:02:31 -0400
X-MC-Unique: tw_GUov3OKqyqaMQRiFNfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 139718030B5;
 Fri,  9 Apr 2021 06:02:30 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-155.pek2.redhat.com
 [10.72.13.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EF2110013C1;
 Fri,  9 Apr 2021 06:02:18 +0000 (UTC)
Subject: Re: [PATCH 3/3] vhost-vdpa-blk: Introduce vhost-vdpa-blk host device
To: Xie Yongji <xieyongji@bytedance.com>, mst@redhat.com,
 stefanha@redhat.com, sgarzare@redhat.com, raphael.norwitz@nutanix.com,
 lingshan.zhu@intel.com, changpeng.liu@intel.com, kwolf@redhat.com,
 mreitz@redhat.com
References: <20210408101252.552-1-xieyongji@bytedance.com>
 <20210408101252.552-4-xieyongji@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bb1af0e4-de0d-fb84-0e8c-d725bfaf921c@redhat.com>
Date: Fri, 9 Apr 2021 14:02:16 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408101252.552-4-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/4/8 ÏÂÎç6:12, Xie Yongji Ð´µÀ:
> This commit introduces a new vhost-vdpa block device, which
> will set up a vDPA device specified by a "vdpa-dev" parameter,
> something like:
>
> qemu-system-x86_64 \
>      -device vhost-vdpa-blk-pci,vdpa-dev=/dev/vhost-vdpa-0
>
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>   hw/block/Kconfig                   |   5 +
>   hw/block/meson.build               |   1 +
>   hw/block/vhost-vdpa-blk.c          | 227 +++++++++++++++++++++++++++++
>   hw/virtio/meson.build              |   1 +
>   hw/virtio/vhost-vdpa-blk-pci.c     | 101 +++++++++++++
>   include/hw/virtio/vhost-vdpa-blk.h |  30 ++++
>   6 files changed, 365 insertions(+)
>   create mode 100644 hw/block/vhost-vdpa-blk.c
>   create mode 100644 hw/virtio/vhost-vdpa-blk-pci.c
>   create mode 100644 include/hw/virtio/vhost-vdpa-blk.h
>
> diff --git a/hw/block/Kconfig b/hw/block/Kconfig
> index 4fcd152166..4615a2c116 100644
> --- a/hw/block/Kconfig
> +++ b/hw/block/Kconfig
> @@ -41,5 +41,10 @@ config VHOST_USER_BLK
>       default y if VIRTIO_PCI
>       depends on VIRTIO && VHOST_USER && LINUX
>   
> +config VHOST_VDPA_BLK
> +    bool
> +    default y if VIRTIO_PCI
> +    depends on VIRTIO && VHOST_VDPA && LINUX
> +
>   config SWIM
>       bool
> diff --git a/hw/block/meson.build b/hw/block/meson.build
> index 5862bda4cb..98f1fc330a 100644
> --- a/hw/block/meson.build
> +++ b/hw/block/meson.build
> @@ -17,5 +17,6 @@ softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('nvme.c', 'nvme-ns.c', 'n
>   
>   specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
>   specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-blk-common.c', 'vhost-user-blk.c'))
> +specific_ss.add(when: 'CONFIG_VHOST_VDPA_BLK', if_true: files('vhost-blk-common.c', 'vhost-vdpa-blk.c'))
>   
>   subdir('dataplane')
> diff --git a/hw/block/vhost-vdpa-blk.c b/hw/block/vhost-vdpa-blk.c
> new file mode 100644
> index 0000000000..d5cbbbba10
> --- /dev/null
> +++ b/hw/block/vhost-vdpa-blk.c
> @@ -0,0 +1,227 @@
> +/*
> + * vhost-vdpa-blk host device
> + *
> + * Copyright (C) 2021 Bytedance Inc. and/or its affiliates. All rights reserved.
> + *
> + * Author:
> + *   Xie Yongji <xieyongji@bytedance.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "qemu/cutils.h"
> +#include "hw/qdev-core.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-properties-system.h"
> +#include "hw/virtio/vhost.h"
> +#include "hw/virtio/vhost-vdpa-blk.h"
> +#include "hw/virtio/virtio.h"
> +#include "hw/virtio/virtio-bus.h"
> +#include "hw/virtio/virtio-access.h"
> +#include "sysemu/sysemu.h"
> +#include "sysemu/runstate.h"
> +
> +static const int vdpa_feature_bits[] = {
> +    VIRTIO_BLK_F_SIZE_MAX,
> +    VIRTIO_BLK_F_SEG_MAX,
> +    VIRTIO_BLK_F_GEOMETRY,
> +    VIRTIO_BLK_F_BLK_SIZE,
> +    VIRTIO_BLK_F_TOPOLOGY,
> +    VIRTIO_BLK_F_MQ,
> +    VIRTIO_BLK_F_RO,
> +    VIRTIO_BLK_F_FLUSH,
> +    VIRTIO_BLK_F_CONFIG_WCE,
> +    VIRTIO_BLK_F_DISCARD,
> +    VIRTIO_BLK_F_WRITE_ZEROES,
> +    VIRTIO_F_VERSION_1,
> +    VIRTIO_RING_F_INDIRECT_DESC,
> +    VIRTIO_RING_F_EVENT_IDX,
> +    VIRTIO_F_NOTIFY_ON_EMPTY,
> +    VHOST_INVALID_FEATURE_BIT
> +};
> +
> +static void vhost_vdpa_blk_set_status(VirtIODevice *vdev, uint8_t status)
> +{
> +    VHostVdpaBlk *s = VHOST_VDPA_BLK(vdev);
> +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
> +    bool should_start = virtio_device_started(vdev, status);
> +    int ret;
> +
> +    if (!vdev->vm_running) {
> +        should_start = false;
> +    }
> +
> +    if (vbc->dev.started == should_start) {
> +        return;
> +    }
> +
> +    if (should_start) {
> +        ret = vhost_blk_common_start(vbc);
> +        if (ret < 0) {
> +            error_report("vhost-vdpa-blk: vhost start failed: %s",
> +                         strerror(-ret));
> +        }
> +    } else {
> +        vhost_blk_common_stop(vbc);
> +    }
> +
> +}
> +
> +static void vhost_vdpa_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> +{
> +    VHostVdpaBlk *s = VHOST_VDPA_BLK(vdev);
> +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
> +    int i, ret;


I believe we should never reach here, the backend should poll the 
notifier and trigger vq handler there after DRIVER_OK?


> +
> +    if (!vdev->start_on_kick) {
> +        return;
> +    }
> +
> +    if (vbc->dev.started) {
> +        return;
> +    }
> +
> +    ret = vhost_blk_common_start(vbc);
> +    if (ret < 0) {
> +        error_report("vhost-vdpa-blk: vhost start failed: %s",
> +                     strerror(-ret));
> +        return;
> +    }
> +
> +    /* Kick right away to begin processing requests already in vring */
> +    for (i = 0; i < vbc->dev.nvqs; i++) {
> +        VirtQueue *kick_vq = virtio_get_queue(vdev, i);
> +
> +        if (!virtio_queue_get_desc_addr(vdev, i)) {
> +            continue;
> +        }
> +        event_notifier_set(virtio_queue_get_host_notifier(kick_vq));
> +    }
> +}
> +
> +static void vhost_vdpa_blk_device_realize(DeviceState *dev, Error **errp)
> +{
> +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> +    VHostVdpaBlk *s = VHOST_VDPA_BLK(vdev);
> +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
> +    Error *err = NULL;
> +    int ret;
> +
> +    s->vdpa.device_fd = qemu_open_old(s->vdpa_dev, O_RDWR);
> +    if (s->vdpa.device_fd == -1) {
> +        error_setg(errp, "vhost-vdpa-blk: open %s failed: %s",
> +                   s->vdpa_dev, strerror(errno));
> +        return;
> +    }
> +
> +    vhost_blk_common_realize(vbc, vhost_vdpa_blk_handle_output, &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        goto blk_err;
> +    }
> +
> +    vbc->vhost_vqs = g_new0(struct vhost_virtqueue, vbc->num_queues);
> +    vbc->dev.nvqs = vbc->num_queues;
> +    vbc->dev.vqs = vbc->vhost_vqs;
> +    vbc->dev.vq_index = 0;
> +    vbc->dev.backend_features = 0;
> +    vbc->started = false;
> +
> +    vhost_dev_set_config_notifier(&vbc->dev, &blk_ops);
> +
> +    ret = vhost_dev_init(&vbc->dev, &s->vdpa, VHOST_BACKEND_TYPE_VDPA, 0);
> +    if (ret < 0) {
> +        error_setg(errp, "vhost-vdpa-blk: vhost initialization failed: %s",
> +                   strerror(-ret));
> +        goto init_err;
> +    }
> +
> +    ret = vhost_dev_get_config(&vbc->dev, (uint8_t *)&vbc->blkcfg,
> +                               sizeof(struct virtio_blk_config));
> +    if (ret < 0) {
> +        error_setg(errp, "vhost-vdpa-blk: get block config failed");
> +        goto config_err;
> +    }
> +
> +    return;
> +config_err:
> +    vhost_dev_cleanup(&vbc->dev);
> +init_err:
> +    vhost_blk_common_unrealize(vbc);
> +blk_err:
> +    close(s->vdpa.device_fd);
> +}
> +
> +static void vhost_vdpa_blk_device_unrealize(DeviceState *dev)
> +{
> +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> +    VHostVdpaBlk *s = VHOST_VDPA_BLK(dev);
> +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(s);
> +
> +    virtio_set_status(vdev, 0);
> +    vhost_dev_cleanup(&vbc->dev);
> +    vhost_blk_common_unrealize(vbc);
> +    close(s->vdpa.device_fd);
> +}
> +
> +static void vhost_vdpa_blk_instance_init(Object *obj)
> +{
> +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(obj);
> +
> +    vbc->feature_bits = vdpa_feature_bits;
> +
> +    device_add_bootindex_property(obj, &vbc->bootindex, "bootindex",
> +                                  "/disk@0,0", DEVICE(obj));
> +}
> +
> +static const VMStateDescription vmstate_vhost_vdpa_blk = {
> +    .name = "vhost-vdpa-blk",
> +    .minimum_version_id = 1,
> +    .version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_VIRTIO_DEVICE,
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +static Property vhost_vdpa_blk_properties[] = {
> +    DEFINE_PROP_STRING("vdpa-dev", VHostVdpaBlk, vdpa_dev),
> +    DEFINE_PROP_UINT16("num-queues", VHostBlkCommon, num_queues,
> +                       VHOST_BLK_AUTO_NUM_QUEUES),
> +    DEFINE_PROP_UINT32("queue-size", VHostBlkCommon, queue_size, 256),
> +    DEFINE_PROP_BIT("config-wce", VHostBlkCommon, config_wce, 0, true),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void vhost_vdpa_blk_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, vhost_vdpa_blk_properties);
> +    dc->vmsd = &vmstate_vhost_vdpa_blk;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> +    vdc->realize = vhost_vdpa_blk_device_realize;
> +    vdc->unrealize = vhost_vdpa_blk_device_unrealize;
> +    vdc->set_status = vhost_vdpa_blk_set_status;
> +}
> +
> +static const TypeInfo vhost_vdpa_blk_info = {
> +    .name = TYPE_VHOST_VDPA_BLK,
> +    .parent = TYPE_VHOST_BLK_COMMON,
> +    .instance_size = sizeof(VHostVdpaBlk),
> +    .instance_init = vhost_vdpa_blk_instance_init,
> +    .class_init = vhost_vdpa_blk_class_init,
> +};
> +
> +static void virtio_register_types(void)
> +{
> +    type_register_static(&vhost_vdpa_blk_info);
> +}
> +
> +type_init(virtio_register_types)
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index fbff9bc9d4..f02bea65a2 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -30,6 +30,7 @@ virtio_pci_ss = ss.source_set()
>   virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
>   virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock-pci.c'))
>   virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk-pci.c'))
> +virtio_pci_ss.add(when: 'CONFIG_VHOST_VDPA_BLK', if_true: files('vhost-vdpa-blk-pci.c'))
>   virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_INPUT', if_true: files('vhost-user-input-pci.c'))
>   virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCSI', if_true: files('vhost-user-scsi-pci.c'))
>   virtio_pci_ss.add(when: 'CONFIG_VHOST_SCSI', if_true: files('vhost-scsi-pci.c'))
> diff --git a/hw/virtio/vhost-vdpa-blk-pci.c b/hw/virtio/vhost-vdpa-blk-pci.c
> new file mode 100644
> index 0000000000..976c47fb4f
> --- /dev/null
> +++ b/hw/virtio/vhost-vdpa-blk-pci.c
> @@ -0,0 +1,101 @@
> +/*
> + * vhost-vdpa-blk PCI Bindings
> + *
> + * Copyright (C) 2021 Bytedance Inc. and/or its affiliates. All rights reserved.
> + *
> + * Author:
> + *   Xie Yongji <xieyongji@bytedance.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "standard-headers/linux/virtio_pci.h"
> +#include "hw/virtio/virtio.h"
> +#include "hw/virtio/vhost-vdpa-blk.h"
> +#include "hw/pci/pci.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "qemu/module.h"
> +#include "virtio-pci.h"
> +#include "qom/object.h"
> +
> +typedef struct VHostVdpaBlkPCI VHostVdpaBlkPCI;
> +
> +#define TYPE_VHOST_VDPA_BLK_PCI "vhost-vdpa-blk-pci-base"
> +DECLARE_INSTANCE_CHECKER(VHostVdpaBlkPCI, VHOST_VDPA_BLK_PCI,
> +                         TYPE_VHOST_VDPA_BLK_PCI)
> +
> +struct VHostVdpaBlkPCI {
> +    VirtIOPCIProxy parent_obj;
> +    VHostVdpaBlk vdev;
> +};
> +
> +static Property vhost_vdpa_blk_pci_properties[] = {
> +    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
> +    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
> +                       DEV_NVECTORS_UNSPECIFIED),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void vhost_vdpa_blk_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> +{
> +    VHostVdpaBlkPCI *dev = VHOST_VDPA_BLK_PCI(vpci_dev);
> +    DeviceState *vdev = DEVICE(&dev->vdev);
> +    VHostBlkCommon *vbc = VHOST_BLK_COMMON(&dev->vdev);
> +
> +    if (vbc->num_queues == VHOST_BLK_AUTO_NUM_QUEUES) {
> +        vbc->num_queues = virtio_pci_optimal_num_queues(0);
> +    }
> +
> +    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
> +        vpci_dev->nvectors = vbc->num_queues + 1;
> +    }
> +
> +    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> +}
> +
> +static void vhost_vdpa_blk_pci_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
> +    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
> +
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> +    device_class_set_props(dc, vhost_vdpa_blk_pci_properties);
> +    k->realize = vhost_vdpa_blk_pci_realize;
> +    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
> +    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_BLOCK;
> +    pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
> +    pcidev_k->class_id = PCI_CLASS_STORAGE_SCSI;
> +}
> +
> +static void vhost_vdpa_blk_pci_instance_init(Object *obj)
> +{
> +    VHostVdpaBlkPCI *dev = VHOST_VDPA_BLK_PCI(obj);
> +
> +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> +                                TYPE_VHOST_VDPA_BLK);
> +    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
> +                              "bootindex");
> +}
> +
> +static const VirtioPCIDeviceTypeInfo vhost_vdpa_blk_pci_info = {
> +    .base_name               = TYPE_VHOST_VDPA_BLK_PCI,
> +    .generic_name            = "vhost-vdpa-blk-pci",
> +    .transitional_name       = "vhost-vdpa-blk-pci-transitional",
> +    .non_transitional_name   = "vhost-vdpa-blk-pci-non-transitional",
> +    .instance_size  = sizeof(VHostVdpaBlkPCI),
> +    .instance_init  = vhost_vdpa_blk_pci_instance_init,
> +    .class_init     = vhost_vdpa_blk_pci_class_init,
> +};
> +
> +static void vhost_vdpa_blk_pci_register(void)
> +{
> +    virtio_pci_types_register(&vhost_vdpa_blk_pci_info);
> +}


I wonder how could we use virtio-mmio for vDPA block here.

Thanks


> +
> +type_init(vhost_vdpa_blk_pci_register)
> diff --git a/include/hw/virtio/vhost-vdpa-blk.h b/include/hw/virtio/vhost-vdpa-blk.h
> new file mode 100644
> index 0000000000..80712f6dae
> --- /dev/null
> +++ b/include/hw/virtio/vhost-vdpa-blk.h
> @@ -0,0 +1,30 @@
> +/*
> + * vhost-vdpa-blk host device
> + *
> + * Copyright (C) 2021 Bytedance Inc. and/or its affiliates. All rights reserved.
> + *
> + * Author:
> + *   Xie Yongji <xieyongji@bytedance.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef VHOST_VDPA_BLK_H
> +#define VHOST_VDPA_BLK_H
> +
> +#include "hw/virtio/vhost-vdpa.h"
> +#include "hw/virtio/vhost-blk-common.h"
> +#include "qom/object.h"
> +
> +#define TYPE_VHOST_VDPA_BLK "vhost-vdpa-blk"
> +OBJECT_DECLARE_SIMPLE_TYPE(VHostVdpaBlk, VHOST_VDPA_BLK)
> +
> +struct VHostVdpaBlk {
> +    VHostBlkCommon parent_obj;
> +    char *vdpa_dev;
> +    struct vhost_vdpa vdpa;
> +};
> +
> +#endif


