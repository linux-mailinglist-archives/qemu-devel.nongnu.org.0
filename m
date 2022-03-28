Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4434E9A5E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 17:07:05 +0200 (CEST)
Received: from localhost ([::1]:56134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqxU-00046h-DK
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 11:07:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nYqqo-0008SA-Je
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:00:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nYqqi-0005cK-Ni
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648479602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X0VThcGb39A6n/JlbMuJeVvU7POEoZkCmQrp8YusecU=;
 b=GlonwBH8EijfMom4Hvb1o4OVz3cmfa8i06Qr8lAHWu/MBQCnfDbCLd93D4/1TZJ9348wgt
 suH6Cj94ZvW9xLU61oYj1Xszq+xco2kfDKEWK/zq700aiZQ4r/6GHynFa031UREpTzggo2
 M9L1eTi9izCwwn/bbO5VrTwoMEupOac=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-zeF6J4jdNRqFN-pEiNOwww-1; Mon, 28 Mar 2022 11:00:00 -0400
X-MC-Unique: zeF6J4jdNRqFN-pEiNOwww-1
Received: by mail-qk1-f197.google.com with SMTP id
 q24-20020a05620a0c9800b0060d5d0b7a90so8565556qki.11
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 08:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X0VThcGb39A6n/JlbMuJeVvU7POEoZkCmQrp8YusecU=;
 b=t5W4p1a8J2wSINongCGwUL5Ws99+m5E7Jg/klq69ORk88wm4NytlVdTvoNmgo+HhbF
 /kNHV5wxfQCqvJUg6o03iSUD0vKq+VTIfQYoT/EOaq9EPYSva2v+hOb5+QYQ0qVarICB
 VtMq04RSz0cPF9AD61Xv9CnWx3ZTNH/KTZu4DAZmLnFJIi/ScgfmkDWV3RslsPg8v96s
 ljM4HmR+6APcNpeKs9l049QxiA8zJbdFdYDvXgqT4wYQgY++QnOl2UCCkNN9FUksct29
 S1W2VUcVHssC7e1BUvCF+B6i3TpzNUpyYxncjZ4XNq8623dGotd6uT2N8brvljOBveqo
 sxyQ==
X-Gm-Message-State: AOAM531741wzmnWXOhJQIZDU821HlWkcP6ew/g8Fc1K8FyxZbzCm2xTz
 woBVnDwCV2xmjWT3dYMG+Laa2xJtodC9l2UdzTHqHLLQiInAfQjSTTZCJ230PNZHr6P/0jDX49m
 fHNIpSLi6Avm1ziI=
X-Received: by 2002:a05:620a:125a:b0:67e:ce2e:f2bd with SMTP id
 a26-20020a05620a125a00b0067ece2ef2bdmr16213269qkl.336.1648479599402; 
 Mon, 28 Mar 2022 07:59:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcieIc/PGNONshKvAyJJSJ1Pz8RZh4FYHU30ybIjr6PRKcq76fnKKuoO3l80RPO2wHDVdYVg==
X-Received: by 2002:a05:620a:125a:b0:67e:ce2e:f2bd with SMTP id
 a26-20020a05620a125a00b0067ece2ef2bdmr16213243qkl.336.1648479599118; 
 Mon, 28 Mar 2022 07:59:59 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-67.retail.telecomitalia.it.
 [79.46.200.67]) by smtp.gmail.com with ESMTPSA id
 y24-20020a37e318000000b0067d43d76184sm7806376qki.97.2022.03.28.07.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 07:59:58 -0700 (PDT)
Date: Mon, 28 Mar 2022 16:59:53 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH v3 05/10] vdpa-dev: implement the realize interface
Message-ID: <CAGxU2F5PTOdZtZPpb4q65=dh9omrAMridfOvpAEktBOF1EVnFA@mail.gmail.com>
References: <20220319072012.525-1-longpeng2@huawei.com>
 <20220319072012.525-6-longpeng2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220319072012.525-6-longpeng2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Michael Tsirkin <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 Gonglei <arei.gonglei@huawei.com>, Huangzhichao <huangzhichao@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 19, 2022 at 03:20:07PM +0800, Longpeng(Mike) wrote:
>From: Longpeng <longpeng2@huawei.com>
>
>Implements the .realize interface.
>
>Signed-off-by: Longpeng <longpeng2@huawei.com>
>---
> hw/virtio/vdpa-dev-pci.c     |  18 ++++-
> hw/virtio/vdpa-dev.c         | 132 +++++++++++++++++++++++++++++++++++
> include/hw/virtio/vdpa-dev.h |  10 +++
> 3 files changed, 159 insertions(+), 1 deletion(-)
>
>diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
>index 9eb590ce8c..31bd17353a 100644
>--- a/hw/virtio/vdpa-dev-pci.c
>+++ b/hw/virtio/vdpa-dev-pci.c
>@@ -51,10 +51,26 @@ static Property vhost_vdpa_device_pci_properties[] = {
>     DEFINE_PROP_END_OF_LIST(),
> };
>
>+static int vhost_vdpa_device_pci_post_init(VhostVdpaDevice *v, Error **errp)
>+{
>+    VhostVdpaDevicePCI *dev = container_of(v, VhostVdpaDevicePCI, vdev);
>+    VirtIOPCIProxy *vpci_dev = &dev->parent_obj;
>+
>+    vpci_dev->class_code = virtio_pci_get_class_id(v->vdev_id);
>+    vpci_dev->trans_devid = virtio_pci_get_trans_devid(v->vdev_id);
>+    /* one for config vector */
>+    vpci_dev->nvectors = v->num_queues + 1;
>+
>+    return 0;
>+}
>+
> static void
> vhost_vdpa_device_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> {
>-    return;
>+    VhostVdpaDevicePCI *dev = VHOST_VDPA_DEVICE_PCI(vpci_dev);
>+
>+    dev->vdev.post_init = vhost_vdpa_device_pci_post_init;
>+    qdev_realize(DEVICE(&dev->vdev), BUS(&vpci_dev->bus), errp);
> }
>
> static void vhost_vdpa_device_pci_class_init(ObjectClass *klass, void *data)
>diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
>index 993cbc7d11..4defe6c33d 100644
>--- a/hw/virtio/vdpa-dev.c
>+++ b/hw/virtio/vdpa-dev.c
>@@ -29,9 +29,140 @@
> #include "sysemu/sysemu.h"
> #include "sysemu/runstate.h"
>
>+static void
>+vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>+{
>+    /* Nothing to do */
>+}
>+
>+static uint32_t
>+vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error **errp)
>+{
>+    uint32_t val = (uint32_t)-1;
>+
>+    if (ioctl(fd, cmd, &val) < 0) {
>+        error_setg(errp, "vhost-vdpa-device: cmd 0x%lx failed: %s",
>+                   cmd, strerror(errno));
>+    }
>+
>+    return val;
>+}
>+
> static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
> {
>+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>+    VhostVdpaDevice *v = VHOST_VDPA_DEVICE(vdev);
>+    uint32_t max_queue_size;
>+    struct vhost_virtqueue *vqs;
>+    int i, ret;
>+
>+    if (!v->vdpa_dev || v->vdpa_dev_fd == -1) {
                        ^
Should we use && operator here?

I can't start QEMU, how did you test this series?

$ ./qemu-system-x86_64 -m 512M -smp 2 -M q35,accel=kvm \
   ...
   -device vhost-vdpa-device-pci,vdpa-dev=/dev/vhost-vdpa-0
qemu-system-x86_64: -device
vhost-vdpa-device-pci,vdpa-dev=/dev/vhost-vdpa-0: both vpda-dev and
vpda-dev-fd are missing

>+        error_setg(errp, "both vpda-dev and vpda-dev-fd are missing");

Typo s/vpda/vdpa

>+        return;
>+    }
>+
>+    if (v->vdpa_dev && v->vdpa_dev_fd != -1) {
>+        error_setg(errp, "both vpda-dev and vpda-dev-fd are set");

Ditto

>+        return;
>+    }
>+
>+    if (v->vdpa_dev_fd == -1) {
>+        v->vdpa_dev_fd = qemu_open(v->vdpa_dev, O_RDWR, errp);
>+        if (*errp) {
>+            return;
>+        }
>+    }
>+    v->vdpa.device_fd = v->vdpa_dev_fd;
>+
>+    v->vdev_id = vhost_vdpa_device_get_u32(v->vdpa_dev_fd,
>+                                           VHOST_VDPA_GET_DEVICE_ID, errp);
>+    if (*errp) {
>+        goto out;
>+    }
>+
>+    max_queue_size = vhost_vdpa_device_get_u32(v->vdpa_dev_fd,
>+                                               VHOST_VDPA_GET_VRING_NUM, errp);
>+    if (*errp) {
>+        goto out;
>+    }
>+
>+    if (v->queue_size > max_queue_size) {
>+        error_setg(errp, "vhost-vdpa-device: invalid queue_size: %u (max:%u)",
>+                   v->queue_size, max_queue_size);
>+        goto out;
>+    } else if (!v->queue_size) {
>+        v->queue_size = max_queue_size;
>+    }
>+
>+    v->num_queues = vhost_vdpa_device_get_u32(v->vdpa_dev_fd,
>+                                              VHOST_VDPA_GET_VQS_COUNT, errp);
>+    if (*errp) {
>+        goto out;
>+    }
>+
>+    if (!v->num_queues || v->num_queues > VIRTIO_QUEUE_MAX) {
>+        error_setg(errp, "invalid number of virtqueues: %u (max:%u)",
>+                   v->num_queues, VIRTIO_QUEUE_MAX);
>+        goto out;
>+    }
>+
>+    v->dev.nvqs = v->num_queues;
>+    vqs = g_new0(struct vhost_virtqueue, v->dev.nvqs);
>+    v->dev.vqs = vqs;
>+    v->dev.vq_index = 0;
>+    v->dev.vq_index_end = v->dev.nvqs;
>+    v->dev.backend_features = 0;
>+    v->started = false;
>+
>+    ret = vhost_dev_init(&v->dev, &v->vdpa, VHOST_BACKEND_TYPE_VDPA, 0, NULL);
>+    if (ret < 0) {
>+        error_setg(errp, "vhost-vdpa-device: vhost initialization failed: %s",
>+                   strerror(-ret));
>+        goto free_vqs;
>+    }
>+
>+    v->config_size = vhost_vdpa_device_get_u32(v->vdpa_dev_fd,
>+                                               VHOST_VDPA_GET_CONFIG_SIZE, errp);
>+    if (*errp) {
>+        goto vhost_cleanup;
>+    }
>+    v->config = g_malloc0(v->config_size);
>+
>+    ret = vhost_dev_get_config(&v->dev, v->config, v->config_size, NULL);
>+    if (ret < 0) {
>+        error_setg(errp, "vhost-vdpa-device: get config failed");
>+        goto free_config;
>+    }
>+
>+    virtio_init(vdev, "vhost-vdpa", v->vdev_id, v->config_size);
>+
>+    v->virtqs = g_new0(VirtQueue *, v->dev.nvqs);
>+    for (i = 0; i < v->dev.nvqs; i++) {
>+        v->virtqs[i] = virtio_add_queue(vdev, v->queue_size,
>+                                        vhost_vdpa_device_dummy_handle_output);
>+    }
>+
>+    if (v->post_init && v->post_init(v, errp) < 0) {
>+        goto free_virtio;
>+    }
>+
>     return;
>+
>+free_virtio:
>+    for (i = 0; i < v->num_queues; i++) {
>+        virtio_delete_queue(v->virtqs[i]);
>+    }
>+    g_free(v->virtqs);
>+    virtio_cleanup(vdev);
>+free_config:
>+    g_free(v->config);
>+vhost_cleanup:
>+    vhost_dev_cleanup(&v->dev);
>+free_vqs:
>+    g_free(vqs);
>+out:
>+    qemu_close(v->vdpa_dev_fd);
>+    v->vdpa_dev_fd = -1;
> }
>
> static void vhost_vdpa_device_unrealize(DeviceState *dev)
>@@ -66,6 +197,7 @@ static void vhost_vdpa_device_set_status(VirtIODevice *vdev, uint8_t status)
> static Property vhost_vdpa_device_properties[] = {
>     DEFINE_PROP_STRING("vdpa-dev", VhostVdpaDevice, vdpa_dev),
>     DEFINE_PROP_INT32("vdpa-dev-fd", VhostVdpaDevice, vdpa_dev_fd, -1),

Other vhost devices use the `vhostfd` property, maybe we should use the
same name.

If we go for this change, then maybe we also need to change `vdpa-dev`
to `vhostpath` or something like that

Thanks,
Stefano

>+    DEFINE_PROP_UINT16("queue-size", VhostVdpaDevice, queue_size, 0),
>     DEFINE_PROP_END_OF_LIST(),
> };
>
>diff --git a/include/hw/virtio/vdpa-dev.h b/include/hw/virtio/vdpa-dev.h
>index 476bda0873..cf11abd0f7 100644
>--- a/include/hw/virtio/vdpa-dev.h
>+++ b/include/hw/virtio/vdpa-dev.h
>@@ -28,6 +28,16 @@ struct VhostVdpaDevice {
>     char *vdpa_dev;
>     int vdpa_dev_fd;
>     int32_t bootindex;
>+    uint32_t vdev_id;
>+    uint32_t num_queues;
>+    struct vhost_dev dev;
>+    struct vhost_vdpa vdpa;
>+    VirtQueue **virtqs;
>+    uint8_t *config;
>+    int config_size;
>+    uint16_t queue_size;
>+    bool started;
>+    int (*post_init)(VhostVdpaDevice *v, Error **errp);
> };
>
> #endif
>--
>2.23.0
>


