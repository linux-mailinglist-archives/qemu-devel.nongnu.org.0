Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EEA421263
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 17:12:23 +0200 (CEST)
Received: from localhost ([::1]:35436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXPdc-00025a-Ph
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 11:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mXPZL-0006aJ-RZ; Mon, 04 Oct 2021 11:07:55 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:50956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mXPZH-0003zz-BB; Mon, 04 Oct 2021 11:07:55 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 69D5E2E0A28;
 Mon,  4 Oct 2021 18:07:43 +0300 (MSK)
Received: from myt6-76f0a6db1a7e.qloud-c.yandex.net
 (2a02:6b8:c12:422d:0:640:76f0:a6db [2a02:6b8:c12:422d:0:640:76f0:a6db])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 UbWJuImLp9-7gt8LOaA; Mon, 04 Oct 2021 18:07:43 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1633360063; bh=+uHd/9XSz/fGL4Gdt06LdRMN09AiVnaVecGnUykUMRM=;
 h=Message-Id:References:Date:Subject:To:From:In-Reply-To:Cc;
 b=FIdmwKQ1fZenzVMYzVlIv6HVdcgt0CpIrG3Xgp5wAkVwAwg6Y4U3tZyZMCHam7OE1
 kr1b8yg7YCzgJ+xSJx3o3W/8HQq/rotxl6rRAueLuaBO0ej1ePM5f2az6HYqSUU4v9
 LjVLgNH4XFIX/P6tsYzP7O3offYAQLnxDVz1IKhw=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from den-plotnikov-w.yandex-team.ru (2a02:6b8:b081:8009::1:11
 [2a02:6b8:b081:8009::1:11])
 by myt6-76f0a6db1a7e.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 AnWxZOr920-7g0a0w3j; Mon, 04 Oct 2021 18:07:42 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v0 2/2] vhost-user-blk-pci: add new pci device type to support
 vhost-user-virtio-blk
Date: Mon,  4 Oct 2021 18:07:31 +0300
Message-Id: <20211004150731.191270-3-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004150731.191270-1-den-plotnikov@yandex-team.ru>
References: <20211004150731.191270-1-den-plotnikov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, mst@redhat.com, yc-core@yandex-team.ru,
 qemu-block@nongnu.org, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To allow the recently added vhost-user-virtio-blk work via virtio-pci.

This patch refactors the vhost-user-blk-pci object model to reuse
the existing code.

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
---
 hw/virtio/vhost-user-blk-pci.c | 43 +++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-user-blk-pci.c b/hw/virtio/vhost-user-blk-pci.c
index 33b404d8a225..2f68296af22f 100644
--- a/hw/virtio/vhost-user-blk-pci.c
+++ b/hw/virtio/vhost-user-blk-pci.c
@@ -34,10 +34,18 @@ typedef struct VHostUserBlkPCI VHostUserBlkPCI;
 /*
  * vhost-user-blk-pci: This extends VirtioPCIProxy.
  */
+#define TYPE_VHOST_USER_BLK_PCI_ABSTRACT "vhost-user-blk-pci-abstract-base"
+#define VHOST_USER_BLK_PCI_ABSTRACT(obj) \
+        OBJECT_CHECK(VHostUserBlkPCI, (obj), TYPE_VHOST_USER_BLK_PCI_ABSTRACT)
+
 #define TYPE_VHOST_USER_BLK_PCI "vhost-user-blk-pci-base"
 DECLARE_INSTANCE_CHECKER(VHostUserBlkPCI, VHOST_USER_BLK_PCI,
                          TYPE_VHOST_USER_BLK_PCI)
 
+#define TYPE_VHOST_USER_VIRTIO_BLK_PCI "vhost-user-virtio-blk-pci-base"
+#define VHOST_USER_VIRTIO_BLK_PCI(obj) \
+        OBJECT_CHECK(VHostUserBlkPCI, (obj), TYPE_VHOST_USER_VIRTIO_BLK_PCI)
+
 struct VHostUserBlkPCI {
     VirtIOPCIProxy parent_obj;
     VHostUserBlk vdev;
@@ -52,7 +60,7 @@ static Property vhost_user_blk_pci_properties[] = {
 
 static void vhost_user_blk_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
-    VHostUserBlkPCI *dev = VHOST_USER_BLK_PCI(vpci_dev);
+    VHostUserBlkPCI *dev = VHOST_USER_BLK_PCI_ABSTRACT(vpci_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
 
     if (dev->vdev.num_queues == VHOST_USER_BLK_AUTO_NUM_QUEUES) {
@@ -66,7 +74,8 @@ static void vhost_user_blk_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
-static void vhost_user_blk_pci_class_init(ObjectClass *klass, void *data)
+static void vhost_user_blk_pci_abstract_class_init(ObjectClass *klass,
+                                                   void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
@@ -81,6 +90,12 @@ static void vhost_user_blk_pci_class_init(ObjectClass *klass, void *data)
     pcidev_k->class_id = PCI_CLASS_STORAGE_SCSI;
 }
 
+static const VirtioPCIDeviceTypeInfo vhost_user_blk_pci_abstract_info = {
+    .base_name      = TYPE_VHOST_USER_BLK_PCI_ABSTRACT,
+    .instance_size  = sizeof(VHostUserBlkPCI),
+    .class_init     = vhost_user_blk_pci_abstract_class_init,
+};
+
 static void vhost_user_blk_pci_instance_init(Object *obj)
 {
     VHostUserBlkPCI *dev = VHOST_USER_BLK_PCI(obj);
@@ -92,18 +107,40 @@ static void vhost_user_blk_pci_instance_init(Object *obj)
 }
 
 static const VirtioPCIDeviceTypeInfo vhost_user_blk_pci_info = {
+    .parent                  = TYPE_VHOST_USER_BLK_PCI_ABSTRACT,
     .base_name               = TYPE_VHOST_USER_BLK_PCI,
     .generic_name            = "vhost-user-blk-pci",
     .transitional_name       = "vhost-user-blk-pci-transitional",
     .non_transitional_name   = "vhost-user-blk-pci-non-transitional",
     .instance_size  = sizeof(VHostUserBlkPCI),
     .instance_init  = vhost_user_blk_pci_instance_init,
-    .class_init     = vhost_user_blk_pci_class_init,
+};
+
+static void vhost_user_virtio_blk_pci_instance_init(Object *obj)
+{
+    VHostUserBlkPCI *dev = VHOST_USER_VIRTIO_BLK_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VHOST_USER_VIRTIO_BLK);
+    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
+                              "bootindex");
+}
+
+static const VirtioPCIDeviceTypeInfo vhost_user_virtio_blk_pci_info = {
+    .parent                  = TYPE_VHOST_USER_BLK_PCI_ABSTRACT,
+    .base_name               = TYPE_VHOST_USER_VIRTIO_BLK_PCI,
+    .generic_name            = "vhost-user-virtio-blk-pci",
+    .transitional_name       = "vhost-user-virtio-blk-pci-transitional",
+    .non_transitional_name   = "vhost-user-virtio-blk-pci-non-transitional",
+    .instance_size  = sizeof(VHostUserBlkPCI),
+    .instance_init  = vhost_user_virtio_blk_pci_instance_init,
 };
 
 static void vhost_user_blk_pci_register(void)
 {
+    virtio_pci_types_register(&vhost_user_blk_pci_abstract_info);
     virtio_pci_types_register(&vhost_user_blk_pci_info);
+    virtio_pci_types_register(&vhost_user_virtio_blk_pci_info);
 }
 
 type_init(vhost_user_blk_pci_register)
-- 
2.25.1


