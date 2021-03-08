Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCFC33076F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 06:32:43 +0100 (CET)
Received: from localhost ([::1]:43596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ8VV-0005fp-UQ
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 00:32:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lJ8UF-0004or-FR
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 00:31:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lJ8UC-00083k-6V
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 00:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615181478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VQHFbV/TWv31UBvcFVxFe+9CVzlK9XeqXYwAco0Ct9w=;
 b=iEVHPawkuHdDj52VpU9yx81XlwxFMhrH3X04oUFMZW4QrabMKE9W8y2OUoByR75H9M2rtn
 cDDa4SH/1d0WwNNSgQH0aZgdNxEET+ARNfsT/B36clwHq9DIBsgv+Py5E9NyYRgAzJEhVn
 23Shcy8u0GJ9S57WVzhkRJAqDNUZa3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-84e2spzIOQ2x06Ib2dKReQ-1; Mon, 08 Mar 2021 00:31:15 -0500
X-MC-Unique: 84e2spzIOQ2x06Ib2dKReQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82A281084C95;
 Mon,  8 Mar 2021 05:31:14 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-193.pek2.redhat.com
 [10.72.13.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB7D85D9D3;
 Mon,  8 Mar 2021 05:31:05 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com
Subject: [PATCH] virtio-net: calculating proper msix vectors on init
Date: Mon,  8 Mar 2021 13:30:59 +0800
Message-Id: <20210308053059.28753-1-jasowang@redhat.com>
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Jason Wang <jasowang@redhat.com>, stefanha@redhat.com, ehabkost@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the default msix vectors for virtio-net-pci is 3 which is
obvious not suitable for multiqueue guest, so we depends on the user
or management tools to pass a correct vectors parameter. In fact, we
can simplifying this by calculating the number of vectors on realize.

Consider we have N queues, the number of vectors needed is 2*N + 2
(#queue pais + plus one config interrupt and control vq). We didn't
check whether or not host support control vq because it was added
unconditionally by qemu to avoid breaking legacy guests such as Minix.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/core/machine.c          | 1 +
 hw/virtio/virtio-net-pci.c | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

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
index 292d13d278..2894c46b66 100644
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
 
@@ -50,6 +51,11 @@ static void virtio_net_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     DeviceState *qdev = DEVICE(vpci_dev);
     VirtIONetPCI *dev = VIRTIO_NET_PCI(vpci_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
+    VirtIONet *net = VIRTIO_NET(vdev);
+
+    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
+        vpci_dev->nvectors = 2 * MAX(net->nic_conf.peers.queues, 1) + 2;
+    }
 
     virtio_net_set_netclient_name(&dev->vdev, qdev->id,
                                   object_get_typename(OBJECT(qdev)));
-- 
2.24.3 (Apple Git-128)


