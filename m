Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702EC308EC7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:57:25 +0100 (CET)
Received: from localhost ([::1]:33594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5apY-0008B4-HF
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5amv-0006oK-Ai
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:54:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5ams-0002bq-AH
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:54:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611953676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FYw67uu67UeVGqqO5hsMiaJ7gjP0eH8hnGSHQzqGieE=;
 b=al31YwSnAAcUDk4w5c0hipwC24+sQNMOJK3e/Np2He2iHPhj9+znsL7y6J3iTxfpKhg54b
 puS1ZVIw0PoM6OWdJvAW5yPyseLiS4BRiKrYoVnb/CQsvr0B/GS/PTDVc4PHWG1uWqLLOB
 nXK4uYEvJVbv5mgf1RbPLCKxpAZ1Vxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-SErmOgIiNSuxpQhYdp-cfA-1; Fri, 29 Jan 2021 15:54:34 -0500
X-MC-Unique: SErmOgIiNSuxpQhYdp-cfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B8B3107AD24;
 Fri, 29 Jan 2021 20:54:33 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-115.ams2.redhat.com
 [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 029D519C66;
 Fri, 29 Jan 2021 20:54:27 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 01/10] virtio: Add virtqueue_set_handler
Date: Fri, 29 Jan 2021 21:54:06 +0100
Message-Id: <20210129205415.876290-2-eperezma@redhat.com>
In-Reply-To: <20210129205415.876290-1-eperezma@redhat.com>
References: <20210129205415.876290-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows qemu to override vq handler.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/virtio.h |  6 +++---
 hw/virtio/virtio.c         | 14 ++++++++++++++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b7ece7a6a8..9b5479e256 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -47,6 +47,8 @@ size_t virtio_feature_get_config_size(VirtIOFeature *features,
                                       uint64_t host_features);
 
 typedef struct VirtQueue VirtQueue;
+typedef void (*VirtIOHandleOutput)(VirtIODevice *, VirtQueue *);
+typedef bool (*VirtIOHandleAIOOutput)(VirtIODevice *, VirtQueue *);
 
 #define VIRTQUEUE_MAX_SIZE 1024
 
@@ -174,9 +176,6 @@ void virtio_error(VirtIODevice *vdev, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
 /* Set the child bus name. */
 void virtio_device_set_child_bus_name(VirtIODevice *vdev, char *bus_name);
 
-typedef void (*VirtIOHandleOutput)(VirtIODevice *, VirtQueue *);
-typedef bool (*VirtIOHandleAIOOutput)(VirtIODevice *, VirtQueue *);
-
 VirtQueue *virtio_add_queue(VirtIODevice *vdev, int queue_size,
                             VirtIOHandleOutput handle_output);
 
@@ -184,6 +183,7 @@ void virtio_del_queue(VirtIODevice *vdev, int n);
 
 void virtio_delete_queue(VirtQueue *vq);
 
+void virtqueue_set_handler(VirtQueue *vq, VirtIOHandleOutput handler);
 void virtqueue_push(VirtQueue *vq, const VirtQueueElement *elem,
                     unsigned int len);
 void virtqueue_flush(VirtQueue *vq, unsigned int count);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index b308026596..ebb780fb42 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1796,6 +1796,20 @@ unsigned int virtqueue_drop_all(VirtQueue *vq)
     }
 }
 
+/*
+ * virtqueue_set_handler:
+ * @vq The #VirtQueue
+ * @handler The handler to call on vq event
+ * Replaces vq handler.
+ *
+ * Note: It takes no protection, so make sure no other calls to the handler
+ * are happening.
+ */
+void virtqueue_set_handler(VirtQueue *vq, VirtIOHandleOutput handler)
+{
+    vq->handle_output = handler;
+}
+
 /* Reading and writing a structure directly to QEMUFile is *awful*, but
  * it is what QEMU has always done by mistake.  We can change it sooner
  * or later by bumping the version number of the affected vm states.
-- 
2.27.0


