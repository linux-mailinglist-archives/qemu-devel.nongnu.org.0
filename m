Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318472BB4C9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:11:00 +0100 (CET)
Received: from localhost ([::1]:39880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgBoB-0003HZ-5g
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBX9-0005Ku-HW
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:53:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBWz-0007Gz-HC
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:53:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605898392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qu8CTJiydQcChlxQWTNmkAEwFHT33IJLluEvEtsX/ss=;
 b=X0UqFWHt5Y5UpnjR+b0lXwVdmCbdlm94xDVTuttICwnEHuseS3etSoJRxZ0qMMX/nhUPHG
 V9qfpmvprls5onSjJ+PajPwGl9lprPgYuz3aRhAnmIrBQ021BJr12pNFcPNN81eoYnZXDY
 MHxjGMuW9MyO5B31HkrAlvmwBtk1paA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-_JNmgddUNyaRjjXM5pQgFA-1; Fri, 20 Nov 2020 13:53:10 -0500
X-MC-Unique: _JNmgddUNyaRjjXM5pQgFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10C3C8797E8;
 Fri, 20 Nov 2020 18:53:08 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAD965C1D5;
 Fri, 20 Nov 2020 18:52:48 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 08/27] vhost: Add a flag for software assisted Live
 Migration
Date: Fri, 20 Nov 2020 19:50:46 +0100
Message-Id: <20201120185105.279030-9-eperezma@redhat.com>
In-Reply-To: <20201120185105.279030-1-eperezma@redhat.com>
References: <20201120185105.279030-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/vhost.h |  1 +
 hw/virtio/vhost.c         | 17 +++++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 93cc3f1ae3..ef920a8076 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -84,6 +84,7 @@ struct vhost_dev {
     uint64_t backend_cap;
     bool started;
     bool log_enabled;
+    bool sw_lm_enabled;
     uint64_t log_size;
     VhostShadowVirtqueue *sw_lm_shadow_vq[2];
     VirtIOHandleOutput sw_lm_vq_handler;
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index a55b684b5f..1d55e26d45 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -988,11 +988,16 @@ static int vhost_sw_live_migration_start(struct vhost_dev *dev)
 static int vhost_sw_live_migration_enable(struct vhost_dev *dev,
                                           bool enable_lm)
 {
+    int r;
+
     if (enable_lm) {
-        return vhost_sw_live_migration_start(dev);
+        r = vhost_sw_live_migration_start(dev);
     } else {
-        return vhost_sw_live_migration_stop(dev);
+        r = vhost_sw_live_migration_stop(dev);
     }
+
+    dev->sw_lm_enabled = enable_lm;
+    return r;
 }
 
 static void vhost_sw_lm_global_start(MemoryListener *listener)
@@ -1466,6 +1471,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     hdev->log = NULL;
     hdev->log_size = 0;
     hdev->log_enabled = false;
+    hdev->sw_lm_enabled = false;
     hdev->started = false;
     memory_listener_register(&hdev->memory_listener, &address_space_memory);
     QLIST_INSERT_HEAD(&vhost_devices, hdev, entry);
@@ -1571,6 +1577,13 @@ void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
     int i, r;
 
+    if (hdev->sw_lm_enabled) {
+        /* We've been called after migration is completed, so no need to
+           disable it again
+        */
+        return;
+    }
+
     for (i = 0; i < hdev->nvqs; ++i) {
         r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
                                          false);
-- 
2.18.4


