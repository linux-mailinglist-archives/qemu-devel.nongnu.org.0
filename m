Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE823E4238
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:12:58 +0200 (CEST)
Received: from localhost ([::1]:60644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1L7-0005Gn-3t
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mD1CH-0000Lc-EB
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:03:49 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:47568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mD1CC-00033f-V4
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:03:47 -0400
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 3E5FF2E16B0;
 Mon,  9 Aug 2021 12:03:39 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 AkxZ58IurR-3d0CLsMk; Mon, 09 Aug 2021 12:03:39 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1628499819; bh=8zstp4F2UzTPgreG8klHVHb/ak+sB1FZQe0zoEpsfa8=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=MQwTMt88Dtzz1qDdRL1fDKUWdAjGgLrZ6kQfsj0KT79cGzqwUPPlxBBY3CZP/Q44p
 BAE6YXjyOe1Uob4ooc0aI0WKlcBNcgFVwizHPOZ3/ikeWSKEOaaXGGjpjIGHX3rFju
 GBv4JL+RnZvVTrx5/BY9DoHx7GLHb7qVx6o9K94E=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8001::1:27])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 3jNa8BApXr-3c2iFkSr; Mon, 09 Aug 2021 12:03:39 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] vhost: make SET_VRING_ADDR, SET_FEATURES send replies
Date: Mon,  9 Aug 2021 12:03:30 +0300
Message-Id: <20210809090330.86304-1-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yc-core@yandex-team.ru, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On vhost-user-blk migration, qemu normally sends a number of commands
to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
VHOST_USER_SET_VRING_ADDR per each started ring to enable "used ring"
data logging.
The issue is that qemu doesn't wait for reply from the vhost daemon
for these commands which may result in races between qemu expectation
of logging starting and actual login starting in vhost daemon.

The race can appear as follows: on migration setup, qemu enables dirty page
logging by sending VHOST_USER_SET_FEATURES. The command doesn't arrive to a
vhost-user-blk daemon immediately and the daemon needs some time to turn the
logging on internally. If qemu doesn't wait for reply, after sending the
command, qemu may start migrate memory pages to a destination. At this time,
the logging may not be actually turned on in the daemon but some guest pages,
which the daemon is about to write to, may have already been transferred
without logging to the destination. Since the logging wasn't turned on,
those pages won't be transferred again as dirty. So we may end up with
corrupted data on the destination.
The same scenario is applicable for "used ring" data logging, which is
turned on with VHOST_USER_SET_VRING_ADDR command.

To resolve this issue, this patch makes qemu wait for the commands result
explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated and logging enabled.

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>

---
v2 -> v3:
  * send VHOST_USER_GET_FEATURES to flush out outstanding messages [mst]

v1 -> v2:
  * send reply only when logging is enabled [mst]

v0 -> v1:
  * send reply for SET_VRING_ADDR, SET_FEATURES only [mst]
---
 hw/virtio/vhost-user.c | 130 ++++++++++++++++++++++++++++-------------
 1 file changed, 89 insertions(+), 41 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index ee57abe04526..18f685df549f 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1095,23 +1095,6 @@ static int vhost_user_set_mem_table(struct vhost_dev *dev,
     return 0;
 }
 
-static int vhost_user_set_vring_addr(struct vhost_dev *dev,
-                                     struct vhost_vring_addr *addr)
-{
-    VhostUserMsg msg = {
-        .hdr.request = VHOST_USER_SET_VRING_ADDR,
-        .hdr.flags = VHOST_USER_VERSION,
-        .payload.addr = *addr,
-        .hdr.size = sizeof(msg.payload.addr),
-    };
-
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        return -1;
-    }
-
-    return 0;
-}
-
 static int vhost_user_set_vring_endian(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
@@ -1288,72 +1271,137 @@ static int vhost_user_set_vring_call(struct vhost_dev *dev,
     return vhost_set_vring_file(dev, VHOST_USER_SET_VRING_CALL, file);
 }
 
-static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
+
+static int vhost_user_get_u64(struct vhost_dev *dev, int request, uint64_t *u64)
 {
     VhostUserMsg msg = {
         .hdr.request = request,
         .hdr.flags = VHOST_USER_VERSION,
-        .payload.u64 = u64,
-        .hdr.size = sizeof(msg.payload.u64),
     };
 
+    if (vhost_user_one_time_request(request) && dev->vq_index != 0) {
+        return 0;
+    }
+
     if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
         return -1;
     }
 
+    if (vhost_user_read(dev, &msg) < 0) {
+        return -1;
+    }
+
+    if (msg.hdr.request != request) {
+        error_report("Received unexpected msg type. Expected %d received %d",
+                     request, msg.hdr.request);
+        return -1;
+    }
+
+    if (msg.hdr.size != sizeof(msg.payload.u64)) {
+        error_report("Received bad msg size.");
+        return -1;
+    }
+
+    *u64 = msg.payload.u64;
+
     return 0;
 }
 
-static int vhost_user_set_features(struct vhost_dev *dev,
-                                   uint64_t features)
+static int vhost_user_get_features(struct vhost_dev *dev, uint64_t *features)
 {
-    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features);
+    return vhost_user_get_u64(dev, VHOST_USER_GET_FEATURES, features);
 }
 
-static int vhost_user_set_protocol_features(struct vhost_dev *dev,
-                                            uint64_t features)
+static int enforce_reply(struct vhost_dev *dev)
 {
-    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features);
+   /*
+    * we need a reply but can't get it from some command directly,
+    * so send the command which must send a reply to make sure
+    * the command we sent before is actually completed.
+    */
+    uint64_t dummy;
+    return vhost_user_get_features(dev, &dummy);
 }
 
-static int vhost_user_get_u64(struct vhost_dev *dev, int request, uint64_t *u64)
+static int vhost_user_set_vring_addr(struct vhost_dev *dev,
+                                     struct vhost_vring_addr *addr)
 {
     VhostUserMsg msg = {
-        .hdr.request = request,
+        .hdr.request = VHOST_USER_SET_VRING_ADDR,
         .hdr.flags = VHOST_USER_VERSION,
+        .payload.addr = *addr,
+        .hdr.size = sizeof(msg.payload.addr),
     };
 
-    if (vhost_user_one_time_request(request) && dev->vq_index != 0) {
-        return 0;
+    bool reply_supported = virtio_has_feature(dev->protocol_features,
+                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
+
+    /* we need a reply anyway if logging is enabled */
+    bool need_reply = !!(addr->flags & (1 << VHOST_VRING_F_LOG));
+
+    if (reply_supported && need_reply) {
+        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
     }
 
     if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
         return -1;
     }
 
-    if (vhost_user_read(dev, &msg) < 0) {
-        return -1;
+    if (msg.hdr.flags & VHOST_USER_NEED_REPLY_MASK) {
+        return process_message_reply(dev, &msg);
+    } else if (need_reply) {
+        return enforce_reply(dev);
     }
 
-    if (msg.hdr.request != request) {
-        error_report("Received unexpected msg type. Expected %d received %d",
-                     request, msg.hdr.request);
-        return -1;
+    return 0;
+}
+
+static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
+                              bool need_reply)
+{
+    VhostUserMsg msg = {
+        .hdr.request = request,
+        .hdr.flags = VHOST_USER_VERSION,
+        .payload.u64 = u64,
+        .hdr.size = sizeof(msg.payload.u64),
+    };
+
+    if (need_reply) {
+        bool reply_supported = virtio_has_feature(dev->protocol_features,
+                                          VHOST_USER_PROTOCOL_F_REPLY_ACK);
+        if (reply_supported) {
+            msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
+        }
     }
 
-    if (msg.hdr.size != sizeof(msg.payload.u64)) {
-        error_report("Received bad msg size.");
+    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
         return -1;
     }
 
-    *u64 = msg.payload.u64;
+    if (msg.hdr.flags & VHOST_USER_NEED_REPLY_MASK) {
+        return process_message_reply(dev, &msg);
+    } else if (need_reply) {
+        return enforce_reply(dev);
+    }
 
     return 0;
 }
 
-static int vhost_user_get_features(struct vhost_dev *dev, uint64_t *features)
+static int vhost_user_set_features(struct vhost_dev *dev,
+                                   uint64_t features)
 {
-    return vhost_user_get_u64(dev, VHOST_USER_GET_FEATURES, features);
+    /* we need a reply anyway if logging is enabled */
+    bool log_enabled = !!(features & (0x1ULL << VHOST_F_LOG_ALL));
+
+    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
+                              log_enabled);
+}
+
+static int vhost_user_set_protocol_features(struct vhost_dev *dev,
+                                            uint64_t features)
+{
+    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features,
+                              false);
 }
 
 static int vhost_user_set_owner(struct vhost_dev *dev)
-- 
2.25.1


