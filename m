Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96604939AA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 12:38:15 +0100 (CET)
Received: from localhost ([::1]:53106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA9I6-0007MN-QT
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 06:38:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nA94U-0006PX-RL
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:24:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nA94R-00039F-Ho
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642591446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l+WFm7gLJSifKWCG6y5qc9nMyPUVrc0q+yPxQ1W4/zU=;
 b=a4vccs62BHGxtY4hEn96tX4txZlUd5lCX/hQc+l1ZmBvKpeGiP7dPHFuAztFZ9L1B5R69p
 3zeHoDvfNiEHzaRioObpQEitGJq/HJD7Gx61ycXVnxp0+fuBygBCvr3km40xAOMt4KVZrE
 H0JLWmxaVxYc67rnuA5JHmV7TGgHryI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-kejrwqDKOU6F2I1dQnrlUQ-1; Wed, 19 Jan 2022 06:23:51 -0500
X-MC-Unique: kejrwqDKOU6F2I1dQnrlUQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 e23-20020ac80117000000b002c92228f95eso1319947qtg.1
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 03:23:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l+WFm7gLJSifKWCG6y5qc9nMyPUVrc0q+yPxQ1W4/zU=;
 b=JXoJNO9idDLmJSKR40yolDnvWnVMmMGIYEzyO22UOyPZC3odQyYybMFKPSVvd7U1SJ
 z0qIjC461mZpZSw8Fk9FBzcDoJrRDpZ7+9LdpBaoZWTSnu0x3bHlAK5f9wE2oBclq3EG
 iqF/aprQ6LDcjOAO9PjNIS6ivRYa4qQPPEyWNpWqBD86f6hfIz49Ggdzjbd/yp0m4R51
 hoQCT5c9J8iWQVSBinCb3nWDTzDNtii+vvWF1jQA5i4vb94WzgIbMbVKQ0R1zF3XfdiY
 Xu5hVb9uO5oh832Ut6ePeaGkXM3RmimUfiJJc6rx4vGNtOJ0zjErvlevZio8h+hh6cmC
 AQeA==
X-Gm-Message-State: AOAM533HfnRInhFw5D0kmXbk9WDeGBPNmGT2TBoIN2hyXjoxpWwt+ALX
 okWWI7r7JvfvAY6ts0e7oWkBXgo8K4Y+MC1aVWDxUeT0pkYwy4vsZ86lsBPNxhQU2STs5l4F5xl
 mWvSFIu5C5KXIco4=
X-Received: by 2002:a05:6214:1d22:: with SMTP id
 f2mr25759916qvd.54.1642591431472; 
 Wed, 19 Jan 2022 03:23:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIsLMueQUT3bRjqgu7kkxxQEyMAhuMSga/KqkY68OlK4yR6E/tk8VRjCTXfGlNG17370n/rA==
X-Received: by 2002:a05:6214:1d22:: with SMTP id
 f2mr25759900qvd.54.1642591431229; 
 Wed, 19 Jan 2022 03:23:51 -0800 (PST)
Received: from steredhat (host-95-238-125-214.retail.telecomitalia.it.
 [95.238.125.214])
 by smtp.gmail.com with ESMTPSA id de38sm4937406qkb.5.2022.01.19.03.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 03:23:50 -0800 (PST)
Date: Wed, 19 Jan 2022 12:23:44 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH v2 04/10] vdpa-dev: implement the
 instance_init/class_init interface
Message-ID: <20220119112344.5tj3ccnoeotc5abb@steredhat>
References: <20220117124331.1642-1-longpeng2@huawei.com>
 <20220117124331.1642-5-longpeng2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220117124331.1642-5-longpeng2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mst@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 yechuan@huawei.com, arei.gonglei@huawei.com, huangzhichao@huawei.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 08:43:25PM +0800, Longpeng(Mike) via wrote:
>From: Longpeng <longpeng2@huawei.com>
>
>Implements the .instance_init and the .class_init interface.
>
>Signed-off-by: Longpeng <longpeng2@huawei.com>
>---
> hw/virtio/vdpa-dev-pci.c     | 52 ++++++++++++++++++++++-
> hw/virtio/vdpa-dev.c         | 81 +++++++++++++++++++++++++++++++++++-
> include/hw/virtio/vdpa-dev.h |  5 +++
> 3 files changed, 134 insertions(+), 4 deletions(-)
>
>diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
>index a5a7b528a9..257538dbdd 100644
>--- a/hw/virtio/vdpa-dev-pci.c
>+++ b/hw/virtio/vdpa-dev-pci.c
>@@ -25,12 +25,60 @@ struct VhostVdpaDevicePCI {
>
> static void vhost_vdpa_device_pci_instance_init(Object *obj)
> {
>-    return;
>+    VhostVdpaDevicePCI *dev = VHOST_VDPA_DEVICE_PCI(obj);
>+
>+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
>+                                TYPE_VHOST_VDPA_DEVICE);
>+    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
>+                              "bootindex");
>+}
>+
>+static Property vhost_vdpa_device_pci_properties[] = {
>+    DEFINE_PROP_END_OF_LIST(),
>+};
>+
>+static void
>+vhost_vdpa_device_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>+{
>+    VhostVdpaDevicePCI *dev = VHOST_VDPA_DEVICE_PCI(vpci_dev);
>+    DeviceState *vdev = DEVICE(&dev->vdev);
>+    uint32_t vdev_id;
>+    uint32_t num_queues;
>+    int fd;
>+
>+    fd = qemu_open(dev->vdev.vdpa_dev, O_RDWR, errp);

We should use `vdpa_dev_fd` if the user set it, and I think we should 
also check that `vdpa_dev` is not null.

>+    if (*errp) {
>+        return;
>+    }
>+
>+    vdev_id = vhost_vdpa_device_get_u32(fd, VHOST_VDPA_GET_DEVICE_ID, errp);
>+    if (*errp) {
>+        qemu_close(fd);
>+        return;
>+    }
>+
>+    num_queues = vhost_vdpa_device_get_u32(fd, VHOST_VDPA_GET_VQS_NUM, errp);
                                                  ^
The build fails here, I think this should be VHOST_VDPA_GET_VQS_COUNT

>+    if (*errp) {
>+        qemu_close(fd);
>+        return;
>+    }
>+
>+    dev->vdev.vdpa_dev_fd = fd;
>+    vpci_dev->class_code = virtio_pci_get_class_id(vdev_id);
>+    vpci_dev->trans_devid = virtio_pci_get_trans_devid(vdev_id);
>+    /* one for config interrupt, one per vq */
>+    vpci_dev->nvectors = num_queues + 1;
>+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> }
>
> static void vhost_vdpa_device_pci_class_init(ObjectClass *klass, void 
> *data)
> {
>-    return;
>+    DeviceClass *dc = DEVICE_CLASS(klass);
>+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
>+
>+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>+    device_class_set_props(dc, vhost_vdpa_device_pci_properties);
>+    k->realize = vhost_vdpa_device_pci_realize;
> }
>
> static const VirtioPCIDeviceTypeInfo vhost_vdpa_device_pci_info = {
>diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
>index f4f92b90b0..b103768f33 100644
>--- a/hw/virtio/vdpa-dev.c
>+++ b/hw/virtio/vdpa-dev.c
>@@ -15,16 +15,93 @@
> #include "sysemu/sysemu.h"
> #include "sysemu/runstate.h"
>
>-static void vhost_vdpa_device_class_init(ObjectClass *klass, void *data)
>+uint32_t vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error **errp)
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
>+static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
> {
>     return;
> }
>
>-static void vhost_vdpa_device_instance_init(Object *obj)
>+static void vhost_vdpa_device_unrealize(DeviceState *dev)
>+{
>+    return;
>+}
>+
>+static void
>+vhost_vdpa_device_get_config(VirtIODevice *vdev, uint8_t *config)
>+{
>+    return;
>+}
>+
>+static void
>+vhost_vdpa_device_set_config(VirtIODevice *vdev, const uint8_t *config)
>+{
>+    return;
>+}
>+
>+static uint64_t vhost_vdpa_device_get_features(VirtIODevice *vdev,
>+                                               uint64_t features,
>+                                               Error **errp)
>+{
>+    return (uint64_t)-1;
>+}
>+
>+static void vhost_vdpa_device_set_status(VirtIODevice *vdev, uint8_t status)
> {
>     return;
> }
>
>+static Property vhost_vdpa_device_properties[] = {
>+    DEFINE_PROP_STRING("vdpa-dev", VhostVdpaDevice, vdpa_dev),
>+    DEFINE_PROP_INT32("vdpa-dev-fd", VhostVdpaDevice, vdpa_dev_fd,
>-1),
>+    DEFINE_PROP_END_OF_LIST(),
>+};
>+
>+static const VMStateDescription vmstate_vhost_vdpa_device = {
>+    .name = "vhost-vdpa-device",
>+    .minimum_version_id = 1,
>+    .version_id = 1,
>+    .fields = (VMStateField[]) {
>+        VMSTATE_VIRTIO_DEVICE,
>+        VMSTATE_END_OF_LIST()
>+    },
>+};
>+
>+static void vhost_vdpa_device_class_init(ObjectClass *klass, void *data)
>+{
>+    DeviceClass *dc = DEVICE_CLASS(klass);
>+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
>+
>+    device_class_set_props(dc, vhost_vdpa_device_properties);
>+    dc->desc = "VDPA-based generic device assignment";
>+    dc->vmsd = &vmstate_vhost_vdpa_device;
>+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>+    vdc->realize = vhost_vdpa_device_realize;
>+    vdc->unrealize = vhost_vdpa_device_unrealize;
>+    vdc->get_config = vhost_vdpa_device_get_config;
>+    vdc->set_config = vhost_vdpa_device_set_config;
>+    vdc->get_features = vhost_vdpa_device_get_features;
>+    vdc->set_status = vhost_vdpa_device_set_status;
>+}
>+
>+static void vhost_vdpa_device_instance_init(Object *obj)
>+{
>+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(obj);
>+
>+    device_add_bootindex_property(obj, &s->bootindex, "bootindex",
>+                                  NULL, DEVICE(obj));
>+}
>+
> static const TypeInfo vhost_vdpa_device_info = {
>     .name = TYPE_VHOST_VDPA_DEVICE,
>     .parent = TYPE_VIRTIO_DEVICE,
>diff --git a/include/hw/virtio/vdpa-dev.h b/include/hw/virtio/vdpa-dev.h
>index dd94bd74a2..e7ad349113 100644
>--- a/include/hw/virtio/vdpa-dev.h
>+++ b/include/hw/virtio/vdpa-dev.h
>@@ -11,6 +11,11 @@ OBJECT_DECLARE_SIMPLE_TYPE(VhostVdpaDevice, VHOST_VDPA_DEVICE)
>
> struct VhostVdpaDevice {
>     VirtIODevice parent_obj;
>+    char *vdpa_dev;
>+    int vdpa_dev_fd;
>+    int32_t bootindex;
> };
>
>+uint32_t vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error **errp);
>+
> #endif
>-- 
>2.23.0
>
>


