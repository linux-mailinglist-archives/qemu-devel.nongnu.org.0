Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134F22BB51E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:21:17 +0100 (CET)
Received: from localhost ([::1]:36774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgBy8-0005Xo-4Q
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBbC-00009J-HW
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:57:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBb8-00006K-PE
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:57:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605898648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7NFTh5Kxb25Zit2Z09Dwayle5qrijF2SdCF72+OTF/8=;
 b=RT45NiFtEwtJYp6ul1BBomD8AI8Vo3w3Qeeyyxs/lyHAWCLzbRCRogw7h7tDB24dWp2i+a
 GgqZm52gsb1S7pMGcrolZrF5MDa1G+mNv3zzLR5XVcUxQZFbHktqPRtZeiLUmA+/hFpWyN
 J2QINy6U0yXMOhoAmPFx2B7TxxtatXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-APAVSU7rNfasUb3rHao7YA-1; Fri, 20 Nov 2020 13:57:26 -0500
X-MC-Unique: APAVSU7rNfasUb3rHao7YA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77F0D801B19;
 Fri, 20 Nov 2020 18:57:23 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 571CD5C1D5;
 Fri, 20 Nov 2020 18:57:14 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 25/27] vhost: Do not commit vhost used idx on
 vhost_virtqueue_stop
Date: Fri, 20 Nov 2020 19:51:03 +0100
Message-Id: <20201120185105.279030-26-eperezma@redhat.com>
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

... if sw lm is enabled

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index cb44b9997f..cf000b979f 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1424,17 +1424,22 @@ static void vhost_virtqueue_stop(struct vhost_dev *dev,
     struct vhost_vring_state state = {
         .index = vhost_vq_index,
     };
-    int r;
+    int r = -1;
 
     if (virtio_queue_get_desc_addr(vdev, idx) == 0) {
         /* Don't stop the virtqueue which might have not been started */
         return;
     }
 
-    r = dev->vhost_ops->vhost_get_vring_base(dev, &state);
-    if (r < 0) {
-        VHOST_OPS_DEBUG("vhost VQ %u ring restore failed: %d", idx, r);
-        /* Connection to the backend is broken, so let's sync internal
+    if (!dev->sw_lm_enabled) {
+        r = dev->vhost_ops->vhost_get_vring_base(dev, &state);
+        if (r < 0) {
+            VHOST_OPS_DEBUG("vhost VQ %u ring restore failed: %d", idx, r);
+        }
+    }
+
+    if (!dev->sw_lm_enabled || r < 0) {
+        /* Connection to the backend is unusable, so let's sync internal
          * last avail idx to the device used idx.
          */
         virtio_queue_restore_last_avail_idx(vdev, idx);
-- 
2.18.4


