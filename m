Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1400433AE70
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:16:55 +0100 (CET)
Received: from localhost ([::1]:56208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjLJ-0000LD-OG
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjJH-0007KC-Rb
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:14:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjJG-0007Vi-6T
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615799685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5zEzMfg/wj4Rhh5BSpxXPJCT+SYE/L9MbBTqBoF1i98=;
 b=KC8QVRcClqsMUhILpVP884MNNY6QRsI84xcSoi2KMU3gNf4e7ecn/pszyrDVkYpXwRZ0P+
 Jcq4Yr9EulQ8E9VF8Jq6tR5gDc14WKnJg2knUD61KQNEFGXQCbYKubkDrGuvGm45NIwFL7
 3OH+E1gQWy25bCYMxrpDRy8KdbxvvyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-x-0IsAqJOIyb-4lYW7zG5A-1; Mon, 15 Mar 2021 05:14:44 -0400
X-MC-Unique: x-0IsAqJOIyb-4lYW7zG5A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 108D2107ACCD;
 Mon, 15 Mar 2021 09:14:43 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-105.pek2.redhat.com
 [10.72.13.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5346100164C;
 Mon, 15 Mar 2021 09:14:41 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 01/20] virtio-net: calculating proper msix vectors on init
Date: Mon, 15 Mar 2021 17:14:14 +0800
Message-Id: <1615799673-31549-2-git-send-email-jasowang@redhat.com>
In-Reply-To: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
References: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/core/machine.c          |  1 +
 hw/virtio/virtio-net-pci.c | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 4386f57..979133f 100644
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
index 292d13d..aa0b3ca 100644
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
2.7.4


