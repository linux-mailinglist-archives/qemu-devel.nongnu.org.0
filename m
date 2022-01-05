Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E5B4851CF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 12:31:26 +0100 (CET)
Received: from localhost ([::1]:42414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n54Vo-00063c-OI
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 06:31:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1n54TZ-0005GS-QS
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:29:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1n54TW-00086a-FV
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 06:29:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641382140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OnF0vTpCvXXUTiMemcruFp3c9DJtXe+0NFUwCf679XE=;
 b=WdMvuXEgxoeDgTbBEU5rUQ2a7sLYWoBbh61wcsgqnCzdvgV8Wvz9BgkZAzJvMENOdMwMzm
 RjRWVcLqr/9PWRhfN8uDISuttTxtMIzVVqvepwK8ineBt8tQaQ7AXVKlONhbqS6YjzqGQP
 YmjcZtJWLDiQfnH8EpSGVhwlKb5AO1E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-0lAWMvQaPWiTw1hdRzcinA-1; Wed, 05 Jan 2022 06:28:59 -0500
X-MC-Unique: 0lAWMvQaPWiTw1hdRzcinA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v15-20020adf8b4f000000b001a24c46d6ceso12495661wra.15
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 03:28:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OnF0vTpCvXXUTiMemcruFp3c9DJtXe+0NFUwCf679XE=;
 b=prMYeMySw9A1uWOWeNjbxi3UjFf9tn4rmRuXLtFfaZQ+w0k9tioL6XyqZw6pmSfuu1
 AMTGLJC4en6/KL4tQdw6kxKBEh4O2laXeJ13tljf4uwp9TVQEajr+EZTj/4Imy6j9MZM
 IMOQU/fsAdaQfL+LzC9Ba4ksqrcSSggMTJXMTGm+QTu18o+bTw24UeLx+OTJZeS/M16c
 7FnOgnu1oKz+bzmeBgOue5W3tl5wGIiKiSlc0zs5/NbpK0HyoGtQ+FKApNdqh4uZ2NpI
 ILf3XZoJYndbxLlXT/bHp5Aurhk79dZ3m0cCxED+0EXtjDGsLT7sHM1ZbRo0UtgGsFFX
 WjxQ==
X-Gm-Message-State: AOAM530mA4Qs9cwCeaCEQb9AhneWQd4VMKkO1aHyTyiDwHQmFjNBlZC4
 O13XgmGYcVOrIHdZHcWnHodkR95TwC3sA6bCm7i+cWYQ17+NTJB35J99nXeIcMTOsT/B3P2Ke4P
 X6MO6Fwv01H7HqWE=
X-Received: by 2002:a5d:6691:: with SMTP id l17mr46716196wru.482.1641382138480; 
 Wed, 05 Jan 2022 03:28:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwD1gra/Opii5UY43pVXvD9v4JIG34ozNh/fyzDOZM08Y6zAHV8ZUG1zkm3YaYU5UZe5/ypBg==
X-Received: by 2002:a5d:6691:: with SMTP id l17mr46716173wru.482.1641382138225; 
 Wed, 05 Jan 2022 03:28:58 -0800 (PST)
Received: from steredhat (host-79-51-11-180.retail.telecomitalia.it.
 [79.51.11.180])
 by smtp.gmail.com with ESMTPSA id q3sm4727528wrr.55.2022.01.05.03.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 03:28:57 -0800 (PST)
Date: Wed, 5 Jan 2022 12:28:54 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [RFC 04/10] vdpa-dev: implement the instance_init/class_init
 interface
Message-ID: <20220105112854.62jwbii2uxg34nur@steredhat>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-5-longpeng2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220105005900.860-5-longpeng2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: mst@redhat.com, jasowang@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, yechuan@huawei.com, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 08:58:54AM +0800, Longpeng(Mike) wrote:
>From: Longpeng <longpeng2@huawei.com>
>
>Implements the .instance_init and the .class_init interface.
>
>Signed-off-by: Longpeng <longpeng2@huawei.com>
>---
> hw/virtio/vdpa-dev-pci.c     | 80 +++++++++++++++++++++++++++++++++++-
> hw/virtio/vdpa-dev.c         | 68 +++++++++++++++++++++++++++++-
> include/hw/virtio/vdpa-dev.h |  2 +
> 3 files changed, 146 insertions(+), 4 deletions(-)
>
>diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
>index a5a7b528a9..0af54a26d4 100644
>--- a/hw/virtio/vdpa-dev-pci.c
>+++ b/hw/virtio/vdpa-dev-pci.c
>@@ -23,14 +23,90 @@ struct VhostVdpaDevicePCI {
>     VhostVdpaDevice vdev;
> };
>
>+static uint32_t
>+vdpa_dev_pci_get_info(const char *name, uint64_t cmd, Error **errp)
>+{
>+    int device_fd;
>+    uint32_t val;
>+    int ret;
>+
>+    device_fd = qemu_open(name, O_RDWR, errp);
>+    if (device_fd == -1) {
>+        return (uint32_t)-1;
>+    }
>+
>+    ret = ioctl(device_fd, cmd, &val);
>+    if (ret < 0) {
>+        error_setg(errp, "vhost-vdpa-device-pci: cmd 0x%lx failed: %s",
>+                   cmd, strerror(errno));
>+        goto out;
>+    }
>+
>+out:
>+    close(device_fd);
>+    return val;
>+}
>+
>+static inline uint32_t
>+vdpa_dev_pci_get_devid(VhostVdpaDevicePCI *dev, Error **errp)
>+{
>+    return vdpa_dev_pci_get_info(dev->vdev.vdpa_dev,
>+                                 VHOST_VDPA_GET_DEVICE_ID, errp);
>+}
>+
>+static inline uint32_t
>+vdpa_dev_pci_get_vectors_num(VhostVdpaDevicePCI *dev, Error **errp)
>+{
>+    return vdpa_dev_pci_get_info(dev->vdev.vdpa_dev,
>+                                 VHOST_VDPA_GET_VECTORS_NUM, errp);
>+}
>+
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
>+    uint32_t devid;
>+    uint32_t vectors;
>+
>+    devid = vdpa_dev_pci_get_devid(dev, errp);
>+    if (*errp) {
>+        return;
>+    }
>+
>+    vectors = vdpa_dev_pci_get_vectors_num(dev, errp);
>+    if (*errp) {
>+        return;
>+    }
>+
>+    vpci_dev->class_code = virtio_pci_get_class_id(devid);
>+    vpci_dev->pdev_id = virtio_pci_get_pci_devid(devid);
>+    vpci_dev->nvectors = vectors;
>+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> }
>
> static void vhost_vdpa_device_pci_class_init(ObjectClass *klass, void *data)
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
>index f4f92b90b0..790117fb3b 100644
>--- a/hw/virtio/vdpa-dev.c
>+++ b/hw/virtio/vdpa-dev.c
>@@ -15,16 +15,80 @@
> #include "sysemu/sysemu.h"
> #include "sysemu/runstate.h"
>
>-static void vhost_vdpa_device_class_init(ObjectClass *klass, void *data)
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
> {
>     return;
> }
>
>+static uint64_t vhost_vdpa_device_get_features(VirtIODevice *vdev,
>+                                               uint64_t features,
>+                                               Error **errp)
>+{
>+    return (uint64_t)-1;
>+}
>+
>+static void vhost_vdpa_device_set_status(VirtIODevice *vdev, uint8_t status)
>+{
>+    return;
>+}
>+
>+static Property vhost_vdpa_device_properties[] = {
>+    DEFINE_PROP_STRING("vdpa-dev", VhostVdpaDevice, vdpa_dev),
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
>+    dc->desc = "VDPA-based generic PCI device assignment";

IIUC, this should be the description of the generic vhost vDPA device, 
not the PCI implementation, right?

Thanks,
Stefano


