Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC00341E82A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 09:16:22 +0200 (CEST)
Received: from localhost ([::1]:56578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWCmL-0001vy-N4
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 03:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWCeJ-0004p7-4p
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:08:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mWCeG-0001Xz-6H
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 03:08:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633072079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fe5PwWm1Kl1k0v6vrZBQCaXgqjhoQkQLDRjOdghm7BA=;
 b=WeK7mPxESjN7eNm945ja5v77F1GOeErViiJ1prfU7v6nj1j/xH3Ymsi1uJTMmnvOZWyFsG
 Bwf2VizZRI5iRb03y2lTbw5FidHFWAbDJVhxjMwcafjMGv9CI2K1+IOa2BVwPVI0LzAJyq
 x7lg7IGtU1AnXUqUja1DAuTrDvdHE+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-IbTRIXAFMnCK9WYahj7GSg-1; Fri, 01 Oct 2021 03:07:57 -0400
X-MC-Unique: IbTRIXAFMnCK9WYahj7GSg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DFA9100C611;
 Fri,  1 Oct 2021 07:07:56 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDBF6652A3;
 Fri,  1 Oct 2021 07:07:17 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 02/20] virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
Date: Fri,  1 Oct 2021 09:05:45 +0200
Message-Id: <20211001070603.307037-3-eperezma@redhat.com>
In-Reply-To: <20211001070603.307037-1-eperezma@redhat.com>
References: <20211001070603.307037-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So the guest can stop and start net device. It freely implements the RFC
https://lists.oasis-open.org/archives/virtio-comment/202012/msg00027.html

To stop (as "pause") the device is required to migrate status and vring
addresses between device and SVQ. Once the device is stopped, the driver
can request avail_idx, so it can be assigned to SVQ.

This is a WIP commit: as with VIRTIO_F_QUEUE_STATE, is introduced in
virtio_config.h before of even proposing for the kernel, with no feature
flag, and, with no checking in the device. It also needs a modified
vp_vdpa driver that supports to set and retrieve status.

For virtio-net with qemu device there is no need to restore avail
state: Since every tx and rx operation is entirely done in BQL
regarding virtio, it would be enough with restore last_avail_idx with
used_idx. Doing this way test the vq state part of the rest of the
series.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/standard-headers/linux/virtio_config.h | 2 ++
 hw/net/virtio-net.c                            | 6 ++++--
 hw/virtio/virtio-pci.c                         | 7 +++++--
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/standard-headers/linux/virtio_config.h b/include/standard-headers/linux/virtio_config.h
index 59fad3eb45..b3f6b1365d 100644
--- a/include/standard-headers/linux/virtio_config.h
+++ b/include/standard-headers/linux/virtio_config.h
@@ -40,6 +40,8 @@
 #define VIRTIO_CONFIG_S_DRIVER_OK	4
 /* Driver has finished configuring features */
 #define VIRTIO_CONFIG_S_FEATURES_OK	8
+/* Device is stopped */
+#define VIRTIO_CONFIG_S_DEVICE_STOPPED 32
 /* Device entered invalid state, driver must reset it */
 #define VIRTIO_CONFIG_S_NEEDS_RESET	0x40
 /* We've given up on this device. */
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index bd7958b9f0..e8f55cdeba 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -198,6 +198,7 @@ static bool virtio_net_started(VirtIONet *n, uint8_t status)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     return (status & VIRTIO_CONFIG_S_DRIVER_OK) &&
+        (!(status & VIRTIO_CONFIG_S_DEVICE_STOPPED)) &&
         (n->status & VIRTIO_NET_S_LINK_UP) && vdev->vm_running;
 }
 
@@ -385,7 +386,7 @@ static void virtio_net_set_status(struct VirtIODevice *vdev, uint8_t status)
             qemu_flush_queued_packets(ncs);
         }
 
-        if (!q->tx_waiting) {
+        if (!q->tx_waiting && !(status & VIRTIO_CONFIG_S_DEVICE_STOPPED)) {
             continue;
         }
 
@@ -1503,7 +1504,8 @@ static bool virtio_net_can_receive(NetClientState *nc)
     }
 
     if (!virtio_queue_ready(q->rx_vq) ||
-        !(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
+        !(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK) ||
+        vdev->status == VIRTIO_CONFIG_S_DEVICE_STOPPED) {
         return false;
     }
 
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 6f30118c4e..9ed0f62222 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -326,13 +326,15 @@ static void virtio_ioport_write(void *opaque, uint32_t addr, uint32_t val)
         }
         break;
     case VIRTIO_PCI_STATUS:
-        if (!(val & VIRTIO_CONFIG_S_DRIVER_OK)) {
+        if (!(val & VIRTIO_CONFIG_S_DRIVER_OK) ||
+            val & VIRTIO_CONFIG_S_DEVICE_STOPPED) {
             virtio_pci_stop_ioeventfd(proxy);
         }
 
         virtio_set_status(vdev, val & 0xFF);
 
-        if (val & VIRTIO_CONFIG_S_DRIVER_OK) {
+        if (val & VIRTIO_CONFIG_S_DRIVER_OK &&
+            !(val & VIRTIO_CONFIG_S_DEVICE_STOPPED)) {
             virtio_pci_start_ioeventfd(proxy);
         }
 
@@ -1303,6 +1305,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
                        proxy->vqs[vdev->queue_sel].used[0]);
             virtio_queue_set_last_avail_idx(vdev, vdev->queue_sel,
                         proxy->vqs[vdev->queue_sel].state);
+            virtio_queue_update_used_idx(vdev, vdev->queue_sel);
             proxy->vqs[vdev->queue_sel].enabled = 1;
         } else {
             virtio_error(vdev, "wrong value for queue_enable %"PRIx64, val);
-- 
2.27.0


