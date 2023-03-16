Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614B06BCEF5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 13:06:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcmMF-0002ig-Si; Thu, 16 Mar 2023 08:05:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pcmMB-0002iF-Fg
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:05:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pcmM9-0002mQ-TB
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678968317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ff6O1LUrjHpdNQA+7OBeBAi0nqNJ5LPOQ5OBs9URK9I=;
 b=UiXAdH56Lwi/lV4ayGEXhxVodXacTuSD51Uf4Dfb0ah0F9j2XmUKKzgJ307gV9ahup1Fk0
 jU+DdTFZjRf9ssO4QNjG5n2QcHyCAohEq5YzaQuqiQMALJd4BjiIBAVscMMzLOoRmuBP3B
 LJ37iDKcu2DigPHJngCuAW1TviwRwMw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-5q3y3QBkM8izghDxNzQlTw-1; Thu, 16 Mar 2023 08:05:16 -0400
X-MC-Unique: 5q3y3QBkM8izghDxNzQlTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99113857FB8;
 Thu, 16 Mar 2023 12:05:15 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.33.36.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EEF0140EBF4;
 Thu, 16 Mar 2023 12:05:13 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>
Subject: [PATCH v2 4/6] virtio-input-pci: add virtio-multitouch-pci
Date: Thu, 16 Mar 2023 13:06:22 +0100
Message-Id: <20230316120624.46410-5-slp@redhat.com>
In-Reply-To: <20230316120624.46410-1-slp@redhat.com>
References: <20230316120624.46410-1-slp@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add virtio-multitouch-pci, a Multitouch-capable input device, to the
list of devices that can be provided by virtio-input-pci.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 hw/virtio/virtio-input-pci.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio-input-pci.c b/hw/virtio/virtio-input-pci.c
index a9d0992389..a53edf46c4 100644
--- a/hw/virtio/virtio-input-pci.c
+++ b/hw/virtio/virtio-input-pci.c
@@ -25,10 +25,11 @@ struct VirtIOInputPCI {
     VirtIOInput vdev;
 };
 
-#define TYPE_VIRTIO_INPUT_HID_PCI "virtio-input-hid-pci"
-#define TYPE_VIRTIO_KEYBOARD_PCI  "virtio-keyboard-pci"
-#define TYPE_VIRTIO_MOUSE_PCI     "virtio-mouse-pci"
-#define TYPE_VIRTIO_TABLET_PCI    "virtio-tablet-pci"
+#define TYPE_VIRTIO_INPUT_HID_PCI  "virtio-input-hid-pci"
+#define TYPE_VIRTIO_KEYBOARD_PCI   "virtio-keyboard-pci"
+#define TYPE_VIRTIO_MOUSE_PCI      "virtio-mouse-pci"
+#define TYPE_VIRTIO_TABLET_PCI     "virtio-tablet-pci"
+#define TYPE_VIRTIO_MULTITOUCH_PCI "virtio-multitouch-pci"
 OBJECT_DECLARE_SIMPLE_TYPE(VirtIOInputHIDPCI, VIRTIO_INPUT_HID_PCI)
 
 struct VirtIOInputHIDPCI {
@@ -102,6 +103,14 @@ static void virtio_tablet_initfn(Object *obj)
                                 TYPE_VIRTIO_TABLET);
 }
 
+static void virtio_multitouch_initfn(Object *obj)
+{
+    VirtIOInputHIDPCI *dev = VIRTIO_INPUT_HID_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VIRTIO_MULTITOUCH);
+}
+
 static const TypeInfo virtio_input_pci_info = {
     .name          = TYPE_VIRTIO_INPUT_PCI,
     .parent        = TYPE_VIRTIO_PCI,
@@ -140,6 +149,13 @@ static const VirtioPCIDeviceTypeInfo virtio_tablet_pci_info = {
     .instance_init = virtio_tablet_initfn,
 };
 
+static const VirtioPCIDeviceTypeInfo virtio_multitouch_pci_info = {
+    .generic_name  = TYPE_VIRTIO_MULTITOUCH_PCI,
+    .parent        = TYPE_VIRTIO_INPUT_HID_PCI,
+    .instance_size = sizeof(VirtIOInputHIDPCI),
+    .instance_init = virtio_multitouch_initfn,
+};
+
 static void virtio_pci_input_register(void)
 {
     /* Base types: */
@@ -150,6 +166,7 @@ static void virtio_pci_input_register(void)
     virtio_pci_types_register(&virtio_keyboard_pci_info);
     virtio_pci_types_register(&virtio_mouse_pci_info);
     virtio_pci_types_register(&virtio_tablet_pci_info);
+    virtio_pci_types_register(&virtio_multitouch_pci_info);
 }
 
 type_init(virtio_pci_input_register)
-- 
2.38.1


