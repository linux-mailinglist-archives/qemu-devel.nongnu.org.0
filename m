Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E225D4CD5FA
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:11:09 +0100 (CET)
Received: from localhost ([::1]:40358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8eC-0000Sl-Vf
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:11:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ88q-0007uf-IQ
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:38:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ88o-0000RV-C6
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OvugmdpxhIxwfz2HUJRV04yMbqV2en4XJ2MBN9Lfiv4=;
 b=NlR1CCnclpgD7qLiwCBL8yGBahFZQSab9HpMgeUtLabXw4PEZ1gUKxxpZhdiaP2t3B3DP4
 x9inBtwAXCpemZLmnFc3jsmYk3gATdWxzokivNdjIArUPKtcjoVclT/XMmBnXEEwks35MO
 MX8ke1IjepnKFUbkb1Lq9/OWmJM/AWE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-dgBe0wGNMRqDchD3MYlUxQ-1; Fri, 04 Mar 2022 08:38:41 -0500
X-MC-Unique: dgBe0wGNMRqDchD3MYlUxQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 e6-20020a5d4e86000000b001f045d4a962so3185997wru.21
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OvugmdpxhIxwfz2HUJRV04yMbqV2en4XJ2MBN9Lfiv4=;
 b=svQf2l9HH75rwOtZ2roXdrFVQEuSx40Dt6MXPAyxNvQDjP488LrGc8D2mmdhAF/gEM
 W+q9GADyIsWmd/hMroMGe6ec6gu2RLAmHph0AwnZwxS/xMBsYoZIQuOG9H35DdvKGjoJ
 mLsBj2eIxh1HShcdduZX2ZrphQ2a2DHwX4ZgK6oYUWqF+93DWEDrmTwnu8ISotkVlXG6
 o8iNKqU08IgXisxQEBmq/ZAPGBW0Pc+foZBcxE1HLpcJK+paJcylIbj4Ja475U6+leRb
 9cSKrD4x/+gEFIUM8dCgo//BC2HfPv8P6tNHlo8w1HJjLV54wZjRFHk5n1PIbZg5Il0x
 l8EQ==
X-Gm-Message-State: AOAM531auRdYA2kECwKctzSjyxb82crADlPgUvCri/fAWX1njs48cylx
 VdvWiggS8usHSi8+xpDEFZo5DvzeFWXE0jk5BCUaHn371peMm3LNVOTbJ6HJ+ZATmJe/1K4SQ/e
 sumBo6Q7uOm+ljoLs/RcJ5TC7G1zQ+Ij3BYkQCTPYcxdoJHmm5oRzPiaLLdEl
X-Received: by 2002:a5d:678a:0:b0:1ef:8e97:363c with SMTP id
 v10-20020a5d678a000000b001ef8e97363cmr22464424wru.617.1646401119342; 
 Fri, 04 Mar 2022 05:38:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDgYCBrEUG2KrlY/kAWNt/vg6OyjIQgcCxkc4E7umdB5moRN1S7ET4OA2dk/adJ7FVa+te1w==
X-Received: by 2002:a5d:678a:0:b0:1ef:8e97:363c with SMTP id
 v10-20020a5d678a000000b001ef8e97363cmr22464405wru.617.1646401119069; 
 Fri, 04 Mar 2022 05:38:39 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 9-20020a1c0209000000b003868897278asm7668597wmc.23.2022.03.04.05.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:38:35 -0800 (PST)
Date: Fri, 4 Mar 2022 08:38:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/45] vhost-user: fix VirtQ notifier cleanup
Message-ID: <20220304133556.233983-11-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 Xueming Li <xuemingl@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xueming Li <xuemingl@nvidia.com>

When vhost-user device cleanup, remove notifier MR and munmaps notifier
address in the event-handling thread, VM CPU thread writing the notifier
in concurrent fails with an error of accessing invalid address. It
happens because MR is still being referenced and accessed in another
thread while the underlying notifier mmap address is being freed and
becomes invalid.

This patch calls RCU and munmap notifiers in the callback after the
memory flatview update finish.

Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
Cc: qemu-stable@nongnu.org
Signed-off-by: Xueming Li <xuemingl@nvidia.com>
Message-Id: <20220207071929.527149-3-xuemingl@nvidia.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user.h |  2 ++
 hw/virtio/vhost-user.c         | 48 ++++++++++++++++++++--------------
 2 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
index f6012b2078..e44a41bb70 100644
--- a/include/hw/virtio/vhost-user.h
+++ b/include/hw/virtio/vhost-user.h
@@ -12,8 +12,10 @@
 #include "hw/virtio/virtio.h"
 
 typedef struct VhostUserHostNotifier {
+    struct rcu_head rcu;
     MemoryRegion mr;
     void *addr;
+    void *unmap_addr;
 } VhostUserHostNotifier;
 
 typedef struct VhostUserState {
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index ebe9bd58d0..6abbc9da32 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -25,6 +25,7 @@
 #include "migration/migration.h"
 #include "migration/postcopy-ram.h"
 #include "trace.h"
+#include "exec/ramblock.h"
 
 #include <sys/ioctl.h>
 #include <sys/socket.h>
@@ -1162,15 +1163,26 @@ static int vhost_user_set_vring_num(struct vhost_dev *dev,
     return vhost_set_vring(dev, VHOST_USER_SET_VRING_NUM, ring);
 }
 
-static void vhost_user_host_notifier_remove(struct vhost_dev *dev,
-                                            int queue_idx)
+static void vhost_user_host_notifier_free(VhostUserHostNotifier *n)
 {
-    struct vhost_user *u = dev->opaque;
-    VhostUserHostNotifier *n = &u->user->notifier[queue_idx];
-    VirtIODevice *vdev = dev->vdev;
+    assert(n && n->unmap_addr);
+    munmap(n->unmap_addr, qemu_real_host_page_size);
+    n->unmap_addr = NULL;
+}
+
+static void vhost_user_host_notifier_remove(VhostUserState *user,
+                                            VirtIODevice *vdev, int queue_idx)
+{
+    VhostUserHostNotifier *n = &user->notifier[queue_idx];
 
     if (n->addr) {
-        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
+        if (vdev) {
+            virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
+        }
+        assert(!n->unmap_addr);
+        n->unmap_addr = n->addr;
+        n->addr = NULL;
+        call_rcu(n, vhost_user_host_notifier_free, rcu);
     }
 }
 
@@ -1219,8 +1231,9 @@ static int vhost_user_get_vring_base(struct vhost_dev *dev,
         .payload.state = *ring,
         .hdr.size = sizeof(msg.payload.state),
     };
+    struct vhost_user *u = dev->opaque;
 
-    vhost_user_host_notifier_remove(dev, ring->index);
+    vhost_user_host_notifier_remove(u->user, dev->vdev, ring->index);
 
     ret = vhost_user_write(dev, &msg, NULL, 0);
     if (ret < 0) {
@@ -1506,12 +1519,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
 
     n = &user->notifier[queue_idx];
 
-    if (n->addr) {
-        virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
-        object_unparent(OBJECT(&n->mr));
-        munmap(n->addr, page_size);
-        n->addr = NULL;
-    }
+    vhost_user_host_notifier_remove(user, vdev, queue_idx);
 
     if (area->u64 & VHOST_USER_VRING_NOFD_MASK) {
         return 0;
@@ -1530,9 +1538,12 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
 
     name = g_strdup_printf("vhost-user/host-notifier@%p mmaps[%d]",
                            user, queue_idx);
-    if (!n->mr.ram) /* Don't init again after suspend. */
+    if (!n->mr.ram) { /* Don't init again after suspend. */
         memory_region_init_ram_device_ptr(&n->mr, OBJECT(vdev), name,
                                           page_size, addr);
+    } else {
+        n->mr.ram_block->host = addr;
+    }
     g_free(name);
 
     if (virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true)) {
@@ -2505,17 +2516,16 @@ bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp)
 void vhost_user_cleanup(VhostUserState *user)
 {
     int i;
+    VhostUserHostNotifier *n;
 
     if (!user->chr) {
         return;
     }
     memory_region_transaction_begin();
     for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
-        if (user->notifier[i].addr) {
-            object_unparent(OBJECT(&user->notifier[i].mr));
-            munmap(user->notifier[i].addr, qemu_real_host_page_size);
-            user->notifier[i].addr = NULL;
-        }
+        n = &user->notifier[i];
+        vhost_user_host_notifier_remove(user, NULL, i);
+        object_unparent(OBJECT(&n->mr));
     }
     memory_region_transaction_commit();
     user->chr = NULL;
-- 
MST


