Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6843BF6E7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 10:31:00 +0200 (CEST)
Received: from localhost ([::1]:43932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1PQw-0007Zy-Jf
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 04:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1m1POz-0005Xi-LP
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 04:28:57 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:41992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1m1POu-0003Cj-Q1
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 04:28:55 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 9F1202E1A63;
 Thu,  8 Jul 2021 11:28:48 +0300 (MSK)
Received: from iva8-5ba4ca89b0c6.qloud-c.yandex.net
 (iva8-5ba4ca89b0c6.qloud-c.yandex.net [2a02:6b8:c0c:a8ae:0:640:5ba4:ca89])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 I2ruM0l30q-SmxGHcaT; Thu, 08 Jul 2021 11:28:48 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1625732928; bh=JGmbbzZn/6vzhFF35dvUHBHTBbRKlVH32uGPuXzRxdA=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=jT7f3gC2+UmK5aofqChBWtOB4JmqWaZh8GZBu01Nm2B64ox8oE+pAWNqlvdnPaqjU
 Ve6xMnbWCYZyyNi9U4/W2KxVzM1BE+JMzZJUS1qyVX6shXfZHiZePt7EPT1iuyPaF7
 0v0TN1F3AycI9krdV/JMXd2bjyj9gNljuLuYAnHE=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:12::1:3a])
 by iva8-5ba4ca89b0c6.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 bzZkNNhpHP-Sm2mvAgA; Thu, 08 Jul 2021 11:28:48 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] vhost: make SET_VRING_ADDR, SET_FEATURES send replies
Date: Thu,  8 Jul 2021 11:28:40 +0300
Message-Id: <20210708082840.12428-1-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated.

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
---
 hw/virtio/vhost-user.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index ee57abe04526..15b5fac67cf3 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1105,10 +1105,20 @@ static int vhost_user_set_vring_addr(struct vhost_dev *dev,
         .hdr.size = sizeof(msg.payload.addr),
     };
 
+    bool reply_supported = virtio_has_feature(dev->protocol_features,
+                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
+    if (reply_supported) {
+        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
+    }
+
     if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
         return -1;
     }
 
+    if (reply_supported) {
+        return process_message_reply(dev, &msg);
+    }
+
     return 0;
 }
 
@@ -1288,7 +1298,8 @@ static int vhost_user_set_vring_call(struct vhost_dev *dev,
     return vhost_set_vring_file(dev, VHOST_USER_SET_VRING_CALL, file);
 }
 
-static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
+static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
+                              bool need_reply)
 {
     VhostUserMsg msg = {
         .hdr.request = request,
@@ -1297,23 +1308,37 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
         .hdr.size = sizeof(msg.payload.u64),
     };
 
+    if (need_reply) {
+        bool reply_supported = virtio_has_feature(dev->protocol_features,
+                                          VHOST_USER_PROTOCOL_F_REPLY_ACK);
+        if (reply_supported) {
+            msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
+        }
+    }
+
     if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
         return -1;
     }
 
+    if (msg.hdr.flags & VHOST_USER_NEED_REPLY_MASK) {
+        return process_message_reply(dev, &msg);
+    }
+
     return 0;
 }
 
 static int vhost_user_set_features(struct vhost_dev *dev,
                                    uint64_t features)
 {
-    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features);
+    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
+                              true);
 }
 
 static int vhost_user_set_protocol_features(struct vhost_dev *dev,
                                             uint64_t features)
 {
-    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features);
+    return vhost_user_set_u64(dev, VHOST_USER_SET_PROTOCOL_FEATURES, features,
+                              false);
 }
 
 static int vhost_user_get_u64(struct vhost_dev *dev, int request, uint64_t *u64)
-- 
2.25.1


