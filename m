Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF510331DDA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 05:24:40 +0100 (CET)
Received: from localhost ([::1]:35332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJTvD-0002Ks-Si
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 23:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lJTu9-0001vO-Mm
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 23:23:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lJTu7-0002LX-7F
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 23:23:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615263808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OfRUE4LCefTkOXIOevKpR1ItTWl/4t1ZzUofK3Ks0Ws=;
 b=WIavX9sF2qlny8KAW8RxiUqPy19YGU4MZdYqT/npqjxRlngTXocSLAAdHh4foIzDfD0Q58
 D7jyAewWK4JVzZUJxbczI7EOCLYkpFITZjG6Br63E9wH2LgqJuiYCR+hLxM33aviJZQ58X
 Y00jcthKQKdkuCk/JW+xqAkVRJUX7sY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-FYxE7R1bMA-WKyjGSoM8gw-1; Mon, 08 Mar 2021 23:23:27 -0500
X-MC-Unique: FYxE7R1bMA-WKyjGSoM8gw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E239557;
 Tue,  9 Mar 2021 04:23:25 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-195.pek2.redhat.com
 [10.72.12.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3B415D9D3;
 Tue,  9 Mar 2021 04:23:16 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 jasowang@redhat.com
Subject: [PATCH V2] virtio-net: calculating proper msix vectors on init
Date: Tue,  9 Mar 2021 12:23:14 +0800
Message-Id: <20210309042314.45817-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the default msix vectors for virtio-net-pci is 3 which is
obvious not suitable for multiqueue guest, so we depends on the user
or management tools to pass a correct vectors parameter. In fact, we
can simplifying this by calculating the number of vectors on realize.

Consider we have N queues, the number of vectors needed is 2*N + 2
(#queue pairs + plus one config interrupt and control vq). We didn't
check whether or not host support control vq because it was added
unconditionally by qemu to avoid breaking legacy guests such as Minix.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
Changes since v1:
- Fix typo in the commit log
- Explain the magic number during vectors calculation
---
 hw/core/machine.c          |  1 +
 hw/virtio/virtio-net-pci.c | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 4386f57b5c..979133f8b7 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -39,6 +39,7 @@
 GlobalProperty hw_compat_5_2[] = {
     { "ICH9-LPC", "smm-compat", "on"},
     { "PIIX4_PM", "smm-compat", "on"},
+    { "virtio-net-pci", "vectors", "3"},
 };
 const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
 
diff --git a/hw/virtio/virtio-net-pci.c b/hw/virtio/virtio-net-pci.c
index 292d13d278..aa0b3caecb 100644
--- a/hw/virtio/virtio-net-pci.c
+++ b/hw/virtio/virtio-net-pci.c
@@ -41,7 +41,8 @@ struct VirtIONetPCI {
 static Property virtio_net_properties[] = {
     DEFINE_PROP_BIT("ioeventfd", VirtIOPCIProxy, flags,
                     VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT, true),
-    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors, 3),
+    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
+                       DEV_NVECTORS_UNSPECIFIED),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -50,6 +51,13 @@ static void virtio_net_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     DeviceState *qdev = DEVICE(vpci_dev);
     VirtIONetPCI *dev = VIRTIO_NET_PCI(vpci_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
+    VirtIONet *net = VIRTIO_NET(vdev);
+
+    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
+        vpci_dev->nvectors = 2 * MAX(net->nic_conf.peers.queues, 1)
+            + 1 /* Config interrupt */
+            + 1 /* Control vq */;
+    }
 
     virtio_net_set_netclient_name(&dev->vdev, qdev->id,
                                   object_get_typename(OBJECT(qdev)));
-- 
2.24.3 (Apple Git-128)


