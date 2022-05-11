Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88EA522C79
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 08:41:24 +0200 (CEST)
Received: from localhost ([::1]:56102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nog2C-0006vy-Je
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 02:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1noftm-0004qx-7b
 for qemu-devel@nongnu.org; Wed, 11 May 2022 02:32:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nofth-0005IV-S9
 for qemu-devel@nongnu.org; Wed, 11 May 2022 02:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652250750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M1XgpDibK1kKKgsLAj3vbm9ZouPe7XQGt4osZjnITPs=;
 b=JkErca+8ebKmM8IZSDOXxrZ9kdQeOzJvDmSYwg0c4WUdZu4xQuVjkic+Oscm1qs34CWF2E
 90RzEib4ISFCQDDeDuoQkEPpECGlobPmpkCes138HZP++RDEzgnDhbHZ22OT/UyG877kuL
 P4Mq/Y7WiAPUfV2Jt7EiBWsE+zf3cLY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-ZAh1fTGnN_WKUku0ZgPRTQ-1; Wed, 11 May 2022 02:32:27 -0400
X-MC-Unique: ZAh1fTGnN_WKUku0ZgPRTQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 k13-20020a50ce4d000000b00425e4447e64so699868edj.22
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 23:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M1XgpDibK1kKKgsLAj3vbm9ZouPe7XQGt4osZjnITPs=;
 b=qAh4PZAamM4f7NOAv0eyMwccI9mcUCIuwjiLWIumGD4J8cxzKriuJE3hiOqPqzo/0P
 M7p1AOrWprGBpw8iZ12Yjbv6IQy5+FFnaUGmbIrK4UZCAjDXLB33TxuLZ8rPDZ27sP98
 CK6g0yYAtqH3Puc9ebtkmsMG7VnYn3SsrX4oYJgyXka1yZsnuwJVF4q7eGPohCLa7e/8
 ISgX73HOmTLWHUT1FxHrxJqmayfeFZB0vVnhETQyjtLbNZ1HJVg2jd5nyQ8ILpQTdpzx
 tH9WUN9xz0K9f80yS0ph+qQqwOjMtBFMRMHNZPgBRnuDrt/uSun9RIf3svISN7kO/fR+
 QL4g==
X-Gm-Message-State: AOAM532ms5KVEUoWUWmheIgc7x8HGT8HYYgZOYxmUtt1wzoXNQcYUoDa
 mYWHVaglFQ/LfZ1c4CRJTPIVJWs9VW0TQJBCIVPqeE+8d/N6vFsiu4ymhSl6Lgp33FvyemXrZbW
 C5LdNKBJzuxfpSL8=
X-Received: by 2002:a17:907:720f:b0:6f8:5e72:d8d8 with SMTP id
 dr15-20020a170907720f00b006f85e72d8d8mr17203600ejc.541.1652250745085; 
 Tue, 10 May 2022 23:32:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxapFpWX1CQ9yNte9FV/RwLL6jZeuiBu/sNLDYfz8QlRRGEjHPDdJJz9A/o1AaBNmjs5Metww==
X-Received: by 2002:a17:907:720f:b0:6f8:5e72:d8d8 with SMTP id
 dr15-20020a170907720f00b006f85e72d8d8mr17203586ejc.541.1652250744805; 
 Tue, 10 May 2022 23:32:24 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-106.retail.telecomitalia.it.
 [87.11.6.106]) by smtp.gmail.com with ESMTPSA id
 a22-20020aa7d756000000b0042617ba63bdsm648196eds.71.2022.05.10.23.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 23:32:24 -0700 (PDT)
Date: Wed, 11 May 2022 08:32:19 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: "Longpeng(Mike)" <longpeng2@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, mst <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, pbonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Yechuan <yechuan@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v4 3/4] vdpa: add vdpa-dev support
Message-ID: <20220511063219.yz66aiojd4dlw2mp@sgarzare-redhat>
References: <20220510125834.1815-1-longpeng2@huawei.com>
 <20220510125834.1815-4-longpeng2@huawei.com>
 <CACGkMEsr99zj8kDxK+BY-7cChqThhRESWa9aGP2Mrx=9zuz5YA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACGkMEsr99zj8kDxK+BY-7cChqThhRESWa9aGP2Mrx=9zuz5YA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 11, 2022 at 10:56:02AM +0800, Jason Wang wrote:
>On Tue, May 10, 2022 at 8:59 PM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>>
>> From: Longpeng <longpeng2@huawei.com>
>>
>> Supports vdpa-dev.
>>
>> Signed-off-by: Longpeng <longpeng2@huawei.com>
>> ---
>>  hw/virtio/Kconfig            |   5 +
>>  hw/virtio/meson.build        |   1 +
>>  hw/virtio/vdpa-dev.c         | 385 +++++++++++++++++++++++++++++++++++
>>  include/hw/virtio/vdpa-dev.h |  43 ++++
>>  4 files changed, 434 insertions(+)
>>  create mode 100644 hw/virtio/vdpa-dev.c
>>  create mode 100644 include/hw/virtio/vdpa-dev.h
>>
>> diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
>> index c144d42f9b..2723283382 100644
>> --- a/hw/virtio/Kconfig
>> +++ b/hw/virtio/Kconfig
>> @@ -68,3 +68,8 @@ config VHOST_USER_RNG
>>      bool
>>      default y
>>      depends on VIRTIO && VHOST_USER
>> +
>> +config VHOST_VDPA_DEV
>> +    bool
>> +    default y if VIRTIO_PCI
>
>Do we have the plan to add VIRTIO_MMIO support?
>
>> +    depends on VIRTIO && VHOST_VDPA && LINUX
>> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
>> index 67dc77e00f..8f6f86db71 100644
>> --- a/hw/virtio/meson.build
>> +++ b/hw/virtio/meson.build
>> @@ -29,6 +29,7 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
>>  virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'], if_true: files('vhost-user-i2c-pci.c'))
>>  virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
>>  virtio_ss.add(when: ['CONFIG_VHOST_USER_RNG', 'CONFIG_VIRTIO_PCI'], if_true: files('vhost-user-rng-pci.c'))
>> +virtio_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev.c'))
>>
>>  virtio_pci_ss = ss.source_set()
>>  virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
>> diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
>> new file mode 100644
>> index 0000000000..543b5b4b81
>> --- /dev/null
>> +++ b/hw/virtio/vdpa-dev.c
>> @@ -0,0 +1,385 @@
>> +/*
>> + * Vhost Vdpa Device
>> + *
>> + * Copyright (c) Huawei Technologies Co., Ltd. 2022. All Rights Reserved.
>> + *
>> + * Authors:
>> + *   Longpeng <longpeng2@huawei.com>
>> + *
>> + * Largely based on the "vhost-user-blk-pci.c" and "vhost-user-blk.c" implemented by:
>> + *   Changpeng Liu <changpeng.liu@intel.com>
>> + *
>> + * This work is licensed under the terms of the GNU LGPL, version 2 or later.
>> + * See the COPYING.LIB file in the top-level directory.
>> + */
>> +#include "qemu/osdep.h"
>> +#include <sys/ioctl.h>
>> +#include <linux/vhost.h>
>> +#include "qapi/error.h"
>> +#include "qemu/error-report.h"
>> +#include "qemu/cutils.h"
>> +#include "hw/qdev-core.h"
>> +#include "hw/qdev-properties.h"
>> +#include "hw/qdev-properties-system.h"
>> +#include "hw/virtio/vhost.h"
>> +#include "hw/virtio/virtio.h"
>> +#include "hw/virtio/virtio-bus.h"
>> +#include "hw/virtio/virtio-access.h"
>> +#include "hw/virtio/vdpa-dev.h"
>> +#include "sysemu/sysemu.h"
>> +#include "sysemu/runstate.h"
>> +
>> +static void
>> +vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>> +{
>> +    /* Nothing to do */
>> +}
>> +
>> +static uint32_t
>> +vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error **errp)
>> +{
>> +    uint32_t val = (uint32_t)-1;
>> +
>> +    if (ioctl(fd, cmd, &val) < 0) {
>> +        error_setg(errp, "vhost-vdpa-device: cmd 0x%lx failed: %s",
>> +                   cmd, strerror(errno));
>> +    }
>> +
>> +    return val;
>> +}
>> +
>> +static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
>> +{
>> +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>> +    VhostVdpaDevice *v = VHOST_VDPA_DEVICE(vdev);
>> +    uint16_t max_queue_size;
>> +    struct vhost_virtqueue *vqs;
>> +    int i, ret;
>> +
>> +    if (!v->vhostdev && v->vhostfd == -1) {
>> +        error_setg(errp, "both vhostdev and vhostfd are missing");
>> +        return;
>> +    }
>> +
>> +    if (v->vhostdev && v->vhostfd != -1) {
>> +        error_setg(errp, "both vhostdev and vhostfd are set");
>> +        return;
>> +    }
>> +
>> +    if (v->vhostfd == -1) {
>> +        v->vhostfd = qemu_open(v->vhostdev, O_RDWR, errp);
>> +        if (*errp) {
>
>Is this better to set error messages for all the possible failures
>during realization?
>
>> +            return;
>> +        }
>> +    }
>> +    v->vdpa.device_fd = v->vhostfd;
>> +
>> +    v->vdev_id = vhost_vdpa_device_get_u32(v->vhostfd,
>> +                                           VHOST_VDPA_GET_DEVICE_ID, errp);
>> +    if (*errp) {
>> +        goto out;
>> +    }
>> +
>> +    max_queue_size = vhost_vdpa_device_get_u32(v->vhostfd,
>> +                                               VHOST_VDPA_GET_VRING_NUM, errp);
>> +    if (*errp) {
>> +        goto out;
>> +    }
>> +
>> +    if (v->queue_size > max_queue_size) {
>> +        error_setg(errp, "vhost-vdpa-device: invalid queue_size: %u (max:%u)",
>> +                   v->queue_size, max_queue_size);
>> +        goto out;
>> +    } else if (!v->queue_size) {
>> +        v->queue_size = max_queue_size;
>> +    }
>> +
>> +    v->num_queues = vhost_vdpa_device_get_u32(v->vhostfd,
>> +                                              VHOST_VDPA_GET_VQS_COUNT, errp);
>> +    if (*errp) {
>> +        goto out;
>> +    }
>> +
>> +    if (!v->num_queues || v->num_queues > VIRTIO_QUEUE_MAX) {
>> +        error_setg(errp, "invalid number of virtqueues: %u (max:%u)",
>> +                   v->num_queues, VIRTIO_QUEUE_MAX);
>> +        goto out;
>> +    }
>> +
>> +    v->dev.nvqs = v->num_queues;
>> +    vqs = g_new0(struct vhost_virtqueue, v->dev.nvqs);
>> +    v->dev.vqs = vqs;
>> +    v->dev.vq_index = 0;
>> +    v->dev.vq_index_end = v->dev.nvqs;
>> +    v->dev.backend_features = 0;
>> +    v->started = false;
>> +
>> +    ret = vhost_dev_init(&v->dev, &v->vdpa, VHOST_BACKEND_TYPE_VDPA, 0, NULL);
>> +    if (ret < 0) {
>> +        error_setg(errp, "vhost-vdpa-device: vhost initialization failed: %s",
>> +                   strerror(-ret));
>> +        goto free_vqs;
>> +    }
>> +
>> +    v->config_size = vhost_vdpa_device_get_u32(v->vhostfd,
>> +                                               VHOST_VDPA_GET_CONFIG_SIZE, errp);
>> +    if (*errp) {
>> +        goto vhost_cleanup;
>> +    }
>> +
>> +    if (v->post_init && v->post_init(v, errp) < 0) {
>> +        goto free_virtio;
>> +    }
>> +
>> +    v->config = g_malloc0(v->config_size);
>> +
>> +    ret = vhost_dev_get_config(&v->dev, v->config, v->config_size, NULL);
>> +    if (ret < 0) {
>> +        error_setg(errp, "vhost-vdpa-device: get config failed");
>> +        goto free_config;
>> +    }
>> +
>> +    virtio_init(vdev, "vhost-vdpa", v->vdev_id, v->config_size);
>> +
>> +    v->virtqs = g_new0(VirtQueue *, v->dev.nvqs);
>> +    for (i = 0; i < v->dev.nvqs; i++) {
>> +        v->virtqs[i] = virtio_add_queue(vdev, v->queue_size,
>> +                                        vhost_vdpa_device_dummy_handle_output);
>> +    }
>> +
>> +    return;
>> +
>> +free_virtio:
>> +    for (i = 0; i < v->num_queues; i++) {
>> +        virtio_delete_queue(v->virtqs[i]);
>> +    }
>> +    g_free(v->virtqs);
>> +    virtio_cleanup(vdev);
>> +free_config:
>> +    g_free(v->config);
>> +vhost_cleanup:
>> +    vhost_dev_cleanup(&v->dev);
>> +free_vqs:
>> +    g_free(vqs);
>> +out:
>> +    qemu_close(v->vhostfd);
>> +    v->vhostfd = -1;
>> +}
>> +
>> +static void vhost_vdpa_device_unrealize(DeviceState *dev)
>> +{
>> +    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>> +    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
>> +    int i;
>> +
>> +    virtio_set_status(vdev, 0);
>> +
>> +    for (i = 0; i < s->num_queues; i++) {
>> +        virtio_delete_queue(s->virtqs[i]);
>> +    }
>> +    g_free(s->virtqs);
>> +    virtio_cleanup(vdev);
>> +
>> +    g_free(s->config);
>> +    g_free(s->dev.vqs);
>> +    vhost_dev_cleanup(&s->dev);
>> +    qemu_close(s->vhostfd);
>> +    s->vhostfd = -1;
>> +}
>> +
>> +static void
>> +vhost_vdpa_device_get_config(VirtIODevice *vdev, uint8_t *config)
>> +{
>> +    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
>> +
>> +    memcpy(config, s->config, s->config_size);
>> +}
>> +
>> +static void
>> +vhost_vdpa_device_set_config(VirtIODevice *vdev, const uint8_t *config)
>> +{
>> +    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
>> +    int ret;
>> +
>> +    ret = vhost_dev_set_config(&s->dev, s->config, 0, s->config_size,
>> +                               VHOST_SET_CONFIG_TYPE_MASTER);
>> +    if (ret) {
>> +        error_report("set device config space failed");
>> +        return;
>> +    }
>> +}
>> +
>> +static uint64_t vhost_vdpa_device_get_features(VirtIODevice *vdev,
>> +                                               uint64_t features,
>> +                                               Error **errp)
>> +{
>> +    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
>> +    uint64_t backend_features = s->dev.features;
>> +
>> +    if (!virtio_has_feature(features, VIRTIO_F_IOMMU_PLATFORM)) {
>> +        virtio_clear_feature(&backend_features, VIRTIO_F_IOMMU_PLATFORM);
>> +    }
>> +
>> +    return backend_features;
>> +}
>> +
>> +static int vhost_vdpa_device_start(VirtIODevice *vdev, Error **errp)
>> +{
>> +    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
>> +    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
>> +    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
>> +    int i, ret;
>> +
>> +    if (!k->set_guest_notifiers) {
>> +        error_setg(errp, "binding does not support guest notifiers");
>> +        return -ENOSYS;
>> +    }
>> +
>> +    ret = vhost_dev_enable_notifiers(&s->dev, vdev);
>> +    if (ret < 0) {
>> +        error_setg_errno(errp, -ret, "Error enabling host notifiers");
>> +        return ret;
>> +    }
>> +
>> +    ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, true);
>> +    if (ret < 0) {
>> +        error_setg_errno(errp, -ret, "Error binding guest notifier");
>> +        goto err_host_notifiers;
>> +    }
>> +
>> +    s->dev.acked_features = vdev->guest_features;
>> +
>> +    ret = vhost_dev_start(&s->dev, vdev);
>> +    if (ret < 0) {
>> +        error_setg_errno(errp, -ret, "Error starting vhost");
>> +        goto err_guest_notifiers;
>> +    }
>> +    s->started = true;
>> +
>> +    /*
>> +     * guest_notifier_mask/pending not used yet, so just unmask
>> +     * everything here. virtio-pci will do the right thing by
>> +     * enabling/disabling irqfd.
>> +     */
>> +    for (i = 0; i < s->dev.nvqs; i++) {
>> +        vhost_virtqueue_mask(&s->dev, vdev, i, false);
>> +    }
>> +
>> +    return ret;
>> +
>> +err_guest_notifiers:
>> +    k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
>> +err_host_notifiers:
>> +    vhost_dev_disable_notifiers(&s->dev, vdev);
>> +    return ret;
>> +}
>> +
>> +static void vhost_vdpa_device_stop(VirtIODevice *vdev)
>> +{
>> +    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
>> +    BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
>> +    VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
>> +    int ret;
>> +
>> +    if (!s->started) {
>> +        return;
>> +    }
>> +    s->started = false;
>> +
>> +    if (!k->set_guest_notifiers) {
>> +        return;
>> +    }
>> +
>> +    vhost_dev_stop(&s->dev, vdev);
>> +
>> +    ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
>> +    if (ret < 0) {
>> +        error_report("vhost guest notifier cleanup failed: %d", ret);
>> +        return;
>> +    }
>> +
>> +    vhost_dev_disable_notifiers(&s->dev, vdev);
>> +}
>> +
>> +static void vhost_vdpa_device_set_status(VirtIODevice *vdev, uint8_t status)
>> +{
>> +    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
>> +    bool should_start = virtio_device_started(vdev, status);
>> +    Error *local_err = NULL;
>> +    int ret;
>> +
>> +    if (!vdev->vm_running) {
>> +        should_start = false;
>> +    }
>> +
>> +    if (s->started == should_start) {
>> +        return;
>> +    }
>> +
>> +    if (should_start) {
>> +        ret = vhost_vdpa_device_start(vdev, &local_err);
>> +        if (ret < 0) {
>> +            error_reportf_err(local_err, "vhost-vdpa-device: start failed: ");
>> +        }
>> +    } else {
>> +        vhost_vdpa_device_stop(vdev);
>> +    }
>> +}
>> +
>> +static Property vhost_vdpa_device_properties[] = {
>> +    DEFINE_PROP_STRING("vhostdev", VhostVdpaDevice, vhostdev),
>> +    DEFINE_PROP_INT32("vhostfd", VhostVdpaDevice, vhostfd, -1),
>
>This is probably not needed since we can "abuse" /dev/fd/X for 
>vhostdev.

IIRC for other vhost devices (e.g. vhost-vsock) the management layer 
(e.g. libvirt) opens the device (because I think QEMU has less 
permissions) and then passes the fd to QEMU, could this be useful for 
this scenario as well?

Thanks,
Stefano


