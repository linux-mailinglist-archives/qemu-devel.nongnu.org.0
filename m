Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F612BB4E8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:13:02 +0100 (CET)
Received: from localhost ([::1]:46016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgBq9-0005us-HY
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBZN-0007OC-2m
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:55:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBZL-000819-5T
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605898538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XrOQ1s9JEtCDaxgd6vNOOY/KU2hMoYwe0eOTlPEs1LA=;
 b=XsfvQ946fvsuibV8/03b3I3UksPC3LDRzzL/LnPzHRJS45M8G+z7Sb28OWqmHET3iR5Dl/
 U2Ddm3TcmEfThfGhPku1kRhbqM+tK9RQJw4+jj5HKTTzjuwScYEMdJ37UpxxarA5dPCauk
 RVGYEYDqrfRp21Nnycsscnu++Qj67BY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-3a8sTKaMN8eKwFoqmbXgCw-1; Fri, 20 Nov 2020 13:55:33 -0500
X-MC-Unique: 3a8sTKaMN8eKwFoqmbXgCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF8875B365;
 Fri, 20 Nov 2020 18:55:30 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 798045C1D5;
 Fri, 20 Nov 2020 18:55:21 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 18/27] vhost: add vhost_vring_poll_rcu
Date: Fri, 20 Nov 2020 19:50:56 +0100
Message-Id: <20201120185105.279030-19-eperezma@redhat.com>
In-Reply-To: <20201120185105.279030-1-eperezma@redhat.com>
References: <20201120185105.279030-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 hw/virtio/vhost-sw-lm-ring.h |  2 ++
 hw/virtio/vhost-sw-lm-ring.c | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/hw/virtio/vhost-sw-lm-ring.h b/hw/virtio/vhost-sw-lm-ring.h
index c537500d9e..03257d60c1 100644
--- a/hw/virtio/vhost-sw-lm-ring.h
+++ b/hw/virtio/vhost-sw-lm-ring.h
@@ -22,6 +22,8 @@ int vhost_vring_add(VhostShadowVirtqueue *vq, VirtQueueElement *elem);
 
 /* Called within rcu_read_lock().  */
 void vhost_vring_set_notification_rcu(VhostShadowVirtqueue *vq, bool enable);
+/* Called within rcu_read_lock().  */
+bool vhost_vring_poll_rcu(VhostShadowVirtqueue *vq);
 
 void vhost_vring_write_addr(const VhostShadowVirtqueue *vq,
 	                    struct vhost_vring_addr *addr);
diff --git a/hw/virtio/vhost-sw-lm-ring.c b/hw/virtio/vhost-sw-lm-ring.c
index c3244c550e..3652889d8e 100644
--- a/hw/virtio/vhost-sw-lm-ring.c
+++ b/hw/virtio/vhost-sw-lm-ring.c
@@ -34,6 +34,12 @@ typedef struct VhostShadowVirtqueue {
     /* Next free descriptor */
     uint16_t free_head;
 
+    /* Last seen used idx */
+    uint16_t shadow_used_idx;
+
+    /* Next head to consume from device */
+    uint16_t used_idx;
+
     /* Cache for exposed notification flag */
     bool notification;
 
@@ -83,6 +89,18 @@ void vhost_vring_set_notification_rcu(VhostShadowVirtqueue *vq, bool enable)
     smp_mb();
 }
 
+bool vhost_vring_poll_rcu(VhostShadowVirtqueue *vq)
+{
+    if (vq->used_idx != vq->shadow_used_idx) {
+        return true;
+    }
+
+    smp_rmb();
+    vq->shadow_used_idx = virtio_tswap16(vq->vdev, vq->vring.used->idx);
+
+    return vq->used_idx != vq->shadow_used_idx;
+}
+
 static void vhost_vring_write_descs(VhostShadowVirtqueue *vq,
                                     const struct iovec *iovec,
                                     size_t num, bool more_descs, bool write)
-- 
2.18.4


