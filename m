Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1092B44D94C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:40:29 +0100 (CET)
Received: from localhost ([::1]:43958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlCBg-0007XH-73
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:40:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5f-0004WK-F9; Thu, 11 Nov 2021 10:34:15 -0500
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:41016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5b-00042e-CW; Thu, 11 Nov 2021 10:34:15 -0500
Received: from iva8-d2cd82b7433e.qloud-c.yandex.net
 (iva8-d2cd82b7433e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a88e:0:640:d2cd:82b7])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 71BA12E1EB7;
 Thu, 11 Nov 2021 18:34:05 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-d2cd82b7433e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 I6JvOHrCuy-Y4siJOMe; Thu, 11 Nov 2021 18:34:05 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636644845; bh=TT4Sm/vFjkaRPoBaQywz+piJfaKDV/eksDroTYSVfYY=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=ln9WROTY8c0TlhNgqit1367IbyFQBOH8PnJlN+oljqguh6cQzquw/uZigOXahCdki
 E2j7j26YyMiWEpexXCOj1qCLMJU/hwEOLHgx9I6elsrxB3FXeQaecvR/F7zOuflWpb
 9o0PPxiwUMZQuxxC3MZqAnMcL+K3kC2XbcZgX1pY=
Authentication-Results: iva8-d2cd82b7433e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8830::1:2d])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 WgGv8YbvMJ-Y4wCA2Qo; Thu, 11 Nov 2021 18:34:04 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/10] vhost-user: stick to -errno error return convention
Date: Thu, 11 Nov 2021 18:33:52 +0300
Message-Id: <20211111153354.18807-9-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111153354.18807-1-rvkagan@yandex-team.ru>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 yc-core@yandex-team.ru,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VhostOps methods in user_ops are not very consistent in their error
returns: some return negated errno while others just -1.

Make sure all of them consistently return negated errno.  This also
helps error propagation from the functions being called inside.
Besides, this synchronizes the error return convention with the other
two vhost backends, kernel and vdpa, and will therefore allow for
consistent error propagation in the generic vhost code (in a followup
patch).

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 hw/virtio/vhost-user.c | 401 +++++++++++++++++++++++------------------
 1 file changed, 223 insertions(+), 178 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index bf6e50223c..662853513e 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -280,9 +280,10 @@ static int vhost_user_read_header(struct vhost_dev *dev, VhostUserMsg *msg)
 
     r = qemu_chr_fe_read_all(chr, p, size);
     if (r != size) {
+        int saved_errno = errno;
         error_report("Failed to read msg header. Read %d instead of %d."
                      " Original request %d.", r, size, msg->hdr.request);
-        return -1;
+        return r < 0 ? -saved_errno : -EIO;
     }
 
     /* validate received flags */
@@ -290,7 +291,7 @@ static int vhost_user_read_header(struct vhost_dev *dev, VhostUserMsg *msg)
         error_report("Failed to read msg header."
                 " Flags 0x%x instead of 0x%x.", msg->hdr.flags,
                 VHOST_USER_REPLY_MASK | VHOST_USER_VERSION);
-        return -1;
+        return -EPROTO;
     }
 
     return 0;
@@ -314,8 +315,9 @@ static gboolean vhost_user_read_cb(void *do_not_use, GIOCondition condition,
     uint8_t *p = (uint8_t *) msg;
     int r, size;
 
-    if (vhost_user_read_header(dev, msg) < 0) {
-        data->ret = -1;
+    r = vhost_user_read_header(dev, msg);
+    if (r < 0) {
+        data->ret = r;
         goto end;
     }
 
@@ -324,7 +326,7 @@ static gboolean vhost_user_read_cb(void *do_not_use, GIOCondition condition,
         error_report("Failed to read msg header."
                 " Size %d exceeds the maximum %zu.", msg->hdr.size,
                 VHOST_USER_PAYLOAD_SIZE);
-        data->ret = -1;
+        data->ret = -EPROTO;
         goto end;
     }
 
@@ -333,9 +335,10 @@ static gboolean vhost_user_read_cb(void *do_not_use, GIOCondition condition,
         size = msg->hdr.size;
         r = qemu_chr_fe_read_all(chr, p, size);
         if (r != size) {
+            int saved_errno = errno;
             error_report("Failed to read msg payload."
                          " Read %d instead of %d.", r, msg->hdr.size);
-            data->ret = -1;
+            data->ret = r < 0 ? -saved_errno : -EIO;
             goto end;
         }
     }
@@ -418,24 +421,26 @@ static int vhost_user_read(struct vhost_dev *dev, VhostUserMsg *msg)
 static int process_message_reply(struct vhost_dev *dev,
                                  const VhostUserMsg *msg)
 {
+    int ret;
     VhostUserMsg msg_reply;
 
     if ((msg->hdr.flags & VHOST_USER_NEED_REPLY_MASK) == 0) {
         return 0;
     }
 
-    if (vhost_user_read(dev, &msg_reply) < 0) {
-        return -1;
+    ret = vhost_user_read(dev, &msg_reply);
+    if (ret < 0) {
+        return ret;
     }
 
     if (msg_reply.hdr.request != msg->hdr.request) {
         error_report("Received unexpected msg type. "
                      "Expected %d received %d",
                      msg->hdr.request, msg_reply.hdr.request);
-        return -1;
+        return -EPROTO;
     }
 
-    return msg_reply.payload.u64 ? -1 : 0;
+    return msg_reply.payload.u64 ? -EIO : 0;
 }
 
 static bool vhost_user_one_time_request(VhostUserRequest request)
@@ -472,14 +477,15 @@ static int vhost_user_write(struct vhost_dev *dev, VhostUserMsg *msg,
 
     if (qemu_chr_fe_set_msgfds(chr, fds, fd_num) < 0) {
         error_report("Failed to set msg fds.");
-        return -1;
+        return -EINVAL;
     }
 
     ret = qemu_chr_fe_write_all(chr, (const uint8_t *) msg, size);
     if (ret != size) {
+        int saved_errno = errno;
         error_report("Failed to write msg."
                      " Wrote %d instead of %d.", ret, size);
-        return -1;
+        return ret < 0 ? -saved_errno : -EIO;
     }
 
     return 0;
@@ -502,6 +508,7 @@ static int vhost_user_set_log_base(struct vhost_dev *dev, uint64_t base,
     size_t fd_num = 0;
     bool shmfd = virtio_has_feature(dev->protocol_features,
                                     VHOST_USER_PROTOCOL_F_LOG_SHMFD);
+    int ret;
     VhostUserMsg msg = {
         .hdr.request = VHOST_USER_SET_LOG_BASE,
         .hdr.flags = VHOST_USER_VERSION,
@@ -514,21 +521,23 @@ static int vhost_user_set_log_base(struct vhost_dev *dev, uint64_t base,
         fds[fd_num++] = log->fd;
     }
 
-    if (vhost_user_write(dev, &msg, fds, fd_num) < 0) {
-        return -1;
+    ret = vhost_user_write(dev, &msg, fds, fd_num);
+    if (ret < 0) {
+        return ret;
     }
 
     if (shmfd) {
         msg.hdr.size = 0;
-        if (vhost_user_read(dev, &msg) < 0) {
-            return -1;
+        ret = vhost_user_read(dev, &msg);
+        if (ret < 0) {
+            return ret;
         }
 
         if (msg.hdr.request != VHOST_USER_SET_LOG_BASE) {
             error_report("Received unexpected msg type. "
                          "Expected %d received %d",
                          VHOST_USER_SET_LOG_BASE, msg.hdr.request);
-            return -1;
+            return -EPROTO;
         }
     }
 
@@ -588,7 +597,7 @@ static int vhost_user_fill_set_mem_table_msg(struct vhost_user *u,
                 u->region_rb[i] = mr->ram_block;
             } else if (*fd_num == VHOST_MEMORY_BASELINE_NREGIONS) {
                 error_report("Failed preparing vhost-user memory table msg");
-                return -1;
+                return -ENOBUFS;
             }
             vhost_user_fill_msg_region(&region_buffer, reg, offset);
             msg->payload.memory.regions[*fd_num] = region_buffer;
@@ -604,14 +613,14 @@ static int vhost_user_fill_set_mem_table_msg(struct vhost_user *u,
     if (!*fd_num) {
         error_report("Failed initializing vhost-user memory map, "
                      "consider using -object memory-backend-file share=on");
-        return -1;
+        return -EINVAL;
     }
 
     msg->hdr.size = sizeof(msg->payload.memory.nregions);
     msg->hdr.size += sizeof(msg->payload.memory.padding);
     msg->hdr.size += *fd_num * sizeof(VhostUserMemoryRegion);
 
-    return 1;
+    return 0;
 }
 
 static inline bool reg_equal(struct vhost_memory_region *shadow_reg,
@@ -741,8 +750,9 @@ static int send_remove_regions(struct vhost_dev *dev,
             vhost_user_fill_msg_region(&region_buffer, shadow_reg, 0);
             msg->payload.mem_reg.region = region_buffer;
 
-            if (vhost_user_write(dev, msg, &fd, 1) < 0) {
-                return -1;
+            ret = vhost_user_write(dev, msg, &fd, 1);
+            if (ret < 0) {
+                return ret;
             }
 
             if (reply_supported) {
@@ -801,15 +811,17 @@ static int send_add_regions(struct vhost_dev *dev,
             vhost_user_fill_msg_region(&region_buffer, reg, offset);
             msg->payload.mem_reg.region = region_buffer;
 
-            if (vhost_user_write(dev, msg, &fd, 1) < 0) {
-                return -1;
+            ret = vhost_user_write(dev, msg, &fd, 1);
+            if (ret < 0) {
+                return ret;
             }
 
             if (track_ramblocks) {
                 uint64_t reply_gpa;
 
-                if (vhost_user_read(dev, &msg_reply) < 0) {
-                    return -1;
+                ret = vhost_user_read(dev, &msg_reply);
+                if (ret < 0) {
+                    return ret;
                 }
 
                 reply_gpa = msg_reply.payload.mem_reg.region.guest_phys_addr;
@@ -819,7 +831,7 @@ static int send_add_regions(struct vhost_dev *dev,
                                  "Expected %d received %d", __func__,
                                  VHOST_USER_ADD_MEM_REG,
                                  msg_reply.hdr.request);
-                    return -1;
+                    return -EPROTO;
                 }
 
                 /*
@@ -830,7 +842,7 @@ static int send_add_regions(struct vhost_dev *dev,
                     error_report("%s: Unexpected size for postcopy reply "
                                  "%d vs %d", __func__, msg_reply.hdr.size,
                                  msg->hdr.size);
-                    return -1;
+                    return -EPROTO;
                 }
 
                 /* Get the postcopy client base from the backend's reply. */
@@ -846,7 +858,7 @@ static int send_add_regions(struct vhost_dev *dev,
                                  "Got guest physical address %" PRIX64 ", expected "
                                  "%" PRIX64, __func__, reply_gpa,
                                  dev->mem->regions[reg_idx].guest_phys_addr);
-                    return -1;
+                    return -EPROTO;
                 }
             } else if (reply_supported) {
                 ret = process_message_reply(dev, msg);
@@ -887,6 +899,7 @@ static int vhost_user_add_remove_regions(struct vhost_dev *dev,
     struct scrub_regions rem_reg[VHOST_USER_MAX_RAM_SLOTS];
     uint64_t shadow_pcb[VHOST_USER_MAX_RAM_SLOTS] = {};
     int nr_add_reg, nr_rem_reg;
+    int ret;
 
     msg->hdr.size = sizeof(msg->payload.mem_reg);
 
@@ -894,16 +907,20 @@ static int vhost_user_add_remove_regions(struct vhost_dev *dev,
     scrub_shadow_regions(dev, add_reg, &nr_add_reg, rem_reg, &nr_rem_reg,
                          shadow_pcb, track_ramblocks);
 
-    if (nr_rem_reg && send_remove_regions(dev, rem_reg, nr_rem_reg, msg,
-                reply_supported) < 0)
-    {
-        goto err;
+    if (nr_rem_reg) {
+        ret = send_remove_regions(dev, rem_reg, nr_rem_reg, msg,
+                                  reply_supported);
+        if (ret < 0) {
+            goto err;
+        }
     }
 
-    if (nr_add_reg && send_add_regions(dev, add_reg, nr_add_reg, msg,
-                shadow_pcb, reply_supported, track_ramblocks) < 0)
-    {
-        goto err;
+    if (nr_add_reg) {
+        ret = send_add_regions(dev, add_reg, nr_add_reg, msg, shadow_pcb,
+                               reply_supported, track_ramblocks);
+        if (ret < 0) {
+            goto err;
+        }
     }
 
     if (track_ramblocks) {
@@ -918,8 +935,9 @@ static int vhost_user_add_remove_regions(struct vhost_dev *dev,
         msg->hdr.size = sizeof(msg->payload.u64);
         msg->payload.u64 = 0; /* OK */
 
-        if (vhost_user_write(dev, msg, NULL, 0) < 0) {
-            return -1;
+        ret = vhost_user_write(dev, msg, NULL, 0);
+        if (ret < 0) {
+            return ret;
         }
     }
 
@@ -931,7 +949,7 @@ err:
                sizeof(uint64_t) * VHOST_USER_MAX_RAM_SLOTS);
     }
 
-    return -1;
+    return ret;
 }
 
 static int vhost_user_set_mem_table_postcopy(struct vhost_dev *dev,
@@ -944,6 +962,7 @@ static int vhost_user_set_mem_table_postcopy(struct vhost_dev *dev,
     size_t fd_num = 0;
     VhostUserMsg msg_reply;
     int region_i, msg_i;
+    int ret;
 
     VhostUserMsg msg = {
         .hdr.flags = VHOST_USER_VERSION,
@@ -961,29 +980,32 @@ static int vhost_user_set_mem_table_postcopy(struct vhost_dev *dev,
     }
 
     if (config_mem_slots) {
-        if (vhost_user_add_remove_regions(dev, &msg, reply_supported,
-                                          true) < 0) {
-            return -1;
+        ret = vhost_user_add_remove_regions(dev, &msg, reply_supported, true);
+        if (ret < 0) {
+            return ret;
         }
     } else {
-        if (vhost_user_fill_set_mem_table_msg(u, dev, &msg, fds, &fd_num,
-                                              true) < 0) {
-            return -1;
+        ret = vhost_user_fill_set_mem_table_msg(u, dev, &msg, fds, &fd_num,
+                                                true);
+        if (ret < 0) {
+            return ret;
         }
 
-        if (vhost_user_write(dev, &msg, fds, fd_num) < 0) {
-            return -1;
+        ret = vhost_user_write(dev, &msg, fds, fd_num);
+        if (ret < 0) {
+            return ret;
         }
 
-        if (vhost_user_read(dev, &msg_reply) < 0) {
-            return -1;
+        ret = vhost_user_read(dev, &msg_reply);
+        if (ret < 0) {
+            return ret;
         }
 
         if (msg_reply.hdr.request != VHOST_USER_SET_MEM_TABLE) {
             error_report("%s: Received unexpected msg type."
                          "Expected %d received %d", __func__,
                          VHOST_USER_SET_MEM_TABLE, msg_reply.hdr.request);
-            return -1;
+            return -EPROTO;
         }
 
         /*
@@ -994,7 +1016,7 @@ static int vhost_user_set_mem_table_postcopy(struct vhost_dev *dev,
             error_report("%s: Unexpected size for postcopy reply "
                          "%d vs %d", __func__, msg_reply.hdr.size,
                          msg.hdr.size);
-            return -1;
+            return -EPROTO;
         }
 
         memset(u->postcopy_client_bases, 0,
@@ -1024,7 +1046,7 @@ static int vhost_user_set_mem_table_postcopy(struct vhost_dev *dev,
             error_report("%s: postcopy reply not fully consumed "
                          "%d vs %zd",
                          __func__, msg_i, fd_num);
-            return -1;
+            return -EIO;
         }
 
         /*
@@ -1035,8 +1057,9 @@ static int vhost_user_set_mem_table_postcopy(struct vhost_dev *dev,
         /* TODO: Use this for failure cases as well with a bad value. */
         msg.hdr.size = sizeof(msg.payload.u64);
         msg.payload.u64 = 0; /* OK */
-        if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-            return -1;
+        ret = vhost_user_write(dev, &msg, NULL, 0);
+        if (ret < 0) {
+            return ret;
         }
     }
 
@@ -1055,6 +1078,7 @@ static int vhost_user_set_mem_table(struct vhost_dev *dev,
     bool config_mem_slots =
         virtio_has_feature(dev->protocol_features,
                            VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS);
+    int ret;
 
     if (do_postcopy) {
         /*
@@ -1074,17 +1098,20 @@ static int vhost_user_set_mem_table(struct vhost_dev *dev,
     }
 
     if (config_mem_slots) {
-        if (vhost_user_add_remove_regions(dev, &msg, reply_supported,
-                                          false) < 0) {
-            return -1;
+        ret = vhost_user_add_remove_regions(dev, &msg, reply_supported, false);
+        if (ret < 0) {
+            return ret;
         }
     } else {
-        if (vhost_user_fill_set_mem_table_msg(u, dev, &msg, fds, &fd_num,
-                                              false) < 0) {
-            return -1;
+        ret = vhost_user_fill_set_mem_table_msg(u, dev, &msg, fds, &fd_num,
+                                                false);
+        if (ret < 0) {
+            return ret;
         }
-        if (vhost_user_write(dev, &msg, fds, fd_num) < 0) {
-            return -1;
+
+        ret = vhost_user_write(dev, &msg, fds, fd_num);
+        if (ret < 0) {
+            return ret;
         }
 
         if (reply_supported) {
@@ -1109,14 +1136,10 @@ static int vhost_user_set_vring_endian(struct vhost_dev *dev,
 
     if (!cross_endian) {
         error_report("vhost-user trying to send unhandled ioctl");
-        return -1;
+        return -ENOTSUP;
     }
 
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        return -1;
-    }
-
-    return 0;
+    return vhost_user_write(dev, &msg, NULL, 0);
 }
 
 static int vhost_set_vring(struct vhost_dev *dev,
@@ -1130,11 +1153,7 @@ static int vhost_set_vring(struct vhost_dev *dev,
         .hdr.size = sizeof(msg.payload.state),
     };
 
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        return -1;
-    }
-
-    return 0;
+    return vhost_user_write(dev, &msg, NULL, 0);
 }
 
 static int vhost_user_set_vring_num(struct vhost_dev *dev,
@@ -1182,16 +1201,25 @@ static int vhost_user_set_vring_enable(struct vhost_dev *dev, int enable)
     int i;
 
     if (!virtio_has_feature(dev->features, VHOST_USER_F_PROTOCOL_FEATURES)) {
-        return -1;
+        return -EINVAL;
     }
 
     for (i = 0; i < dev->nvqs; ++i) {
+        int ret;
         struct vhost_vring_state state = {
             .index = dev->vq_index + i,
             .num   = enable,
         };
 
-        vhost_set_vring(dev, VHOST_USER_SET_VRING_ENABLE, &state);
+        ret = vhost_set_vring(dev, VHOST_USER_SET_VRING_ENABLE, &state);
+        if (ret < 0) {
+            /*
+             * Restoring the previous state is likely infeasible, as well as
+             * proceeding regardless the error, so just bail out and hope for
+             * the device-level recovery.
+             */
+            return ret;
+        }
     }
 
     return 0;
@@ -1200,6 +1228,7 @@ static int vhost_user_set_vring_enable(struct vhost_dev *dev, int enable)
 static int vhost_user_get_vring_base(struct vhost_dev *dev,
                                      struct vhost_vring_state *ring)
 {
+    int ret;
     VhostUserMsg msg = {
         .hdr.request = VHOST_USER_GET_VRING_BASE,
         .hdr.flags = VHOST_USER_VERSION,
@@ -1209,23 +1238,25 @@ static int vhost_user_get_vring_base(struct vhost_dev *dev,
 
     vhost_user_host_notifier_remove(dev, ring->index);
 
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        return -1;
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret < 0) {
+        return ret;
     }
 
-    if (vhost_user_read(dev, &msg) < 0) {
-        return -1;
+    ret = vhost_user_read(dev, &msg);
+    if (ret < 0) {
+        return ret;
     }
 
     if (msg.hdr.request != VHOST_USER_GET_VRING_BASE) {
         error_report("Received unexpected msg type. Expected %d received %d",
                      VHOST_USER_GET_VRING_BASE, msg.hdr.request);
-        return -1;
+        return -EPROTO;
     }
 
     if (msg.hdr.size != sizeof(msg.payload.state)) {
         error_report("Received bad msg size.");
-        return -1;
+        return -EPROTO;
     }
 
     *ring = msg.payload.state;
@@ -1252,11 +1283,7 @@ static int vhost_set_vring_file(struct vhost_dev *dev,
         msg.payload.u64 |= VHOST_USER_VRING_NOFD_MASK;
     }
 
-    if (vhost_user_write(dev, &msg, fds, fd_num) < 0) {
-        return -1;
-    }
-
-    return 0;
+    return vhost_user_write(dev, &msg, fds, fd_num);
 }
 
 static int vhost_user_set_vring_kick(struct vhost_dev *dev,
@@ -1274,6 +1301,7 @@ static int vhost_user_set_vring_call(struct vhost_dev *dev,
 
 static int vhost_user_get_u64(struct vhost_dev *dev, int request, uint64_t *u64)
 {
+    int ret;
     VhostUserMsg msg = {
         .hdr.request = request,
         .hdr.flags = VHOST_USER_VERSION,
@@ -1283,23 +1311,25 @@ static int vhost_user_get_u64(struct vhost_dev *dev, int request, uint64_t *u64)
         return 0;
     }
 
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        return -1;
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret < 0) {
+        return ret;
     }
 
-    if (vhost_user_read(dev, &msg) < 0) {
-        return -1;
+    ret = vhost_user_read(dev, &msg);
+    if (ret < 0) {
+        return ret;
     }
 
     if (msg.hdr.request != request) {
         error_report("Received unexpected msg type. Expected %d received %d",
                      request, msg.hdr.request);
-        return -1;
+        return -EPROTO;
     }
 
     if (msg.hdr.size != sizeof(msg.payload.u64)) {
         error_report("Received bad msg size.");
-        return -1;
+        return -EPROTO;
     }
 
     *u64 = msg.payload.u64;
@@ -1337,6 +1367,7 @@ static int enforce_reply(struct vhost_dev *dev,
 static int vhost_user_set_vring_addr(struct vhost_dev *dev,
                                      struct vhost_vring_addr *addr)
 {
+    int ret;
     VhostUserMsg msg = {
         .hdr.request = VHOST_USER_SET_VRING_ADDR,
         .hdr.flags = VHOST_USER_VERSION,
@@ -1357,8 +1388,9 @@ static int vhost_user_set_vring_addr(struct vhost_dev *dev,
         msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
     }
 
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        return -1;
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret < 0) {
+        return ret;
     }
 
     if (wait_for_reply) {
@@ -1377,6 +1409,7 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
         .payload.u64 = u64,
         .hdr.size = sizeof(msg.payload.u64),
     };
+    int ret;
 
     if (wait_for_reply) {
         bool reply_supported = virtio_has_feature(dev->protocol_features,
@@ -1386,8 +1419,9 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64,
         }
     }
 
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        return -1;
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret < 0) {
+        return ret;
     }
 
     if (wait_for_reply) {
@@ -1424,11 +1458,7 @@ static int vhost_user_set_owner(struct vhost_dev *dev)
         .hdr.flags = VHOST_USER_VERSION,
     };
 
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        return -EPROTO;
-    }
-
-    return 0;
+    return vhost_user_write(dev, &msg, NULL, 0);
 }
 
 static int vhost_user_get_max_memslots(struct vhost_dev *dev,
@@ -1459,26 +1489,16 @@ static int vhost_user_reset_device(struct vhost_dev *dev)
         ? VHOST_USER_RESET_DEVICE
         : VHOST_USER_RESET_OWNER;
 
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        return -1;
-    }
-
-    return 0;
+    return vhost_user_write(dev, &msg, NULL, 0);
 }
 
 static int vhost_user_slave_handle_config_change(struct vhost_dev *dev)
 {
-    int ret = -1;
-
-    if (!dev->config_ops) {
-        return -1;
-    }
-
-    if (dev->config_ops->vhost_dev_config_notifier) {
-        ret = dev->config_ops->vhost_dev_config_notifier(dev);
+    if (!dev->config_ops || !dev->config_ops->vhost_dev_config_notifier) {
+        return -ENOSYS;
     }
 
-    return ret;
+    return dev->config_ops->vhost_dev_config_notifier(dev);
 }
 
 static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
@@ -1497,7 +1517,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
     if (!virtio_has_feature(dev->protocol_features,
                             VHOST_USER_PROTOCOL_F_HOST_NOTIFIER) ||
         vdev == NULL || queue_idx >= virtio_get_num_queues(vdev)) {
-        return -1;
+        return -EINVAL;
     }
 
     n = &user->notifier[queue_idx];
@@ -1515,13 +1535,13 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
 
     /* Sanity check. */
     if (area->size != page_size) {
-        return -1;
+        return -EINVAL;
     }
 
     addr = mmap(NULL, page_size, PROT_READ | PROT_WRITE, MAP_SHARED,
                 fd, area->offset);
     if (addr == MAP_FAILED) {
-        return -1;
+        return -EFAULT;
     }
 
     name = g_strdup_printf("vhost-user/host-notifier@%p mmaps[%d]",
@@ -1534,7 +1554,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
     if (virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true)) {
         object_unparent(OBJECT(&n->mr));
         munmap(addr, page_size);
-        return -1;
+        return -ENXIO;
     }
 
     n->addr = addr;
@@ -1664,14 +1684,15 @@ static int vhost_setup_slave_channel(struct vhost_dev *dev)
     }
 
     if (socketpair(PF_UNIX, SOCK_STREAM, 0, sv) == -1) {
+        int saved_errno = errno;
         error_report("socketpair() failed");
-        return -1;
+        return -saved_errno;
     }
 
     ioc = QIO_CHANNEL(qio_channel_socket_new_fd(sv[0], &local_err));
     if (!ioc) {
         error_report_err(local_err);
-        return -1;
+        return -ECONNREFUSED;
     }
     u->slave_ioc = ioc;
     slave_update_read_handler(dev, NULL);
@@ -1778,35 +1799,38 @@ static int vhost_user_postcopy_advise(struct vhost_dev *dev, Error **errp)
     struct vhost_user *u = dev->opaque;
     CharBackend *chr = u->user->chr;
     int ufd;
+    int ret;
     VhostUserMsg msg = {
         .hdr.request = VHOST_USER_POSTCOPY_ADVISE,
         .hdr.flags = VHOST_USER_VERSION,
     };
 
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret < 0) {
         error_setg(errp, "Failed to send postcopy_advise to vhost");
-        return -1;
+        return ret;
     }
 
-    if (vhost_user_read(dev, &msg) < 0) {
+    ret = vhost_user_read(dev, &msg);
+    if (ret < 0) {
         error_setg(errp, "Failed to get postcopy_advise reply from vhost");
-        return -1;
+        return ret;
     }
 
     if (msg.hdr.request != VHOST_USER_POSTCOPY_ADVISE) {
         error_setg(errp, "Unexpected msg type. Expected %d received %d",
                      VHOST_USER_POSTCOPY_ADVISE, msg.hdr.request);
-        return -1;
+        return -EPROTO;
     }
 
     if (msg.hdr.size) {
         error_setg(errp, "Received bad msg size.");
-        return -1;
+        return -EPROTO;
     }
     ufd = qemu_chr_fe_get_msgfd(chr);
     if (ufd < 0) {
         error_setg(errp, "%s: Failed to get ufd", __func__);
-        return -1;
+        return -EIO;
     }
     qemu_set_nonblock(ufd);
 
@@ -1820,7 +1844,7 @@ static int vhost_user_postcopy_advise(struct vhost_dev *dev, Error **errp)
     return 0;
 #else
     error_setg(errp, "Postcopy not supported on non-Linux systems");
-    return -1;
+    return -ENOSYS;
 #endif
 }
 
@@ -1836,10 +1860,13 @@ static int vhost_user_postcopy_listen(struct vhost_dev *dev, Error **errp)
         .hdr.flags = VHOST_USER_VERSION | VHOST_USER_NEED_REPLY_MASK,
     };
     u->postcopy_listen = true;
+
     trace_vhost_user_postcopy_listen();
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
+
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret < 0) {
         error_setg(errp, "Failed to send postcopy_listen to vhost");
-        return -1;
+        return ret;
     }
 
     ret = process_message_reply(dev, &msg);
@@ -1864,9 +1891,11 @@ static int vhost_user_postcopy_end(struct vhost_dev *dev, Error **errp)
     struct vhost_user *u = dev->opaque;
 
     trace_vhost_user_postcopy_end_entry();
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
+
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret < 0) {
         error_setg(errp, "Failed to send postcopy_end to vhost");
-        return -1;
+        return ret;
     }
 
     ret = process_message_reply(dev, &msg);
@@ -2115,7 +2144,7 @@ static int vhost_user_migration_done(struct vhost_dev *dev, char* mac_addr)
 
         return vhost_user_write(dev, &msg, NULL, 0);
     }
-    return -1;
+    return -ENOTSUP;
 }
 
 static bool vhost_user_can_merge(struct vhost_dev *dev,
@@ -2136,6 +2165,7 @@ static int vhost_user_net_set_mtu(struct vhost_dev *dev, uint16_t mtu)
     VhostUserMsg msg;
     bool reply_supported = virtio_has_feature(dev->protocol_features,
                                               VHOST_USER_PROTOCOL_F_REPLY_ACK);
+    int ret;
 
     if (!(dev->protocol_features & (1ULL << VHOST_USER_PROTOCOL_F_NET_MTU))) {
         return 0;
@@ -2149,8 +2179,9 @@ static int vhost_user_net_set_mtu(struct vhost_dev *dev, uint16_t mtu)
         msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
     }
 
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        return -1;
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret < 0) {
+        return ret;
     }
 
     /* If reply_ack supported, slave has to ack specified MTU is valid */
@@ -2164,6 +2195,7 @@ static int vhost_user_net_set_mtu(struct vhost_dev *dev, uint16_t mtu)
 static int vhost_user_send_device_iotlb_msg(struct vhost_dev *dev,
                                             struct vhost_iotlb_msg *imsg)
 {
+    int ret;
     VhostUserMsg msg = {
         .hdr.request = VHOST_USER_IOTLB_MSG,
         .hdr.size = sizeof(msg.payload.iotlb),
@@ -2171,8 +2203,9 @@ static int vhost_user_send_device_iotlb_msg(struct vhost_dev *dev,
         .payload.iotlb = *imsg,
     };
 
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        return -EFAULT;
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret < 0) {
+        return ret;
     }
 
     return process_message_reply(dev, &msg);
@@ -2187,6 +2220,7 @@ static void vhost_user_set_iotlb_callback(struct vhost_dev *dev, int enabled)
 static int vhost_user_get_config(struct vhost_dev *dev, uint8_t *config,
                                  uint32_t config_len, Error **errp)
 {
+    int ret;
     VhostUserMsg msg = {
         .hdr.request = VHOST_USER_GET_CONFIG,
         .hdr.flags = VHOST_USER_VERSION,
@@ -2203,26 +2237,28 @@ static int vhost_user_get_config(struct vhost_dev *dev, uint8_t *config,
 
     msg.payload.config.offset = 0;
     msg.payload.config.size = config_len;
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        error_setg_errno(errp, EPROTO, "vhost_get_config failed");
-        return -EPROTO;
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "vhost_get_config failed");
+        return ret;
     }
 
-    if (vhost_user_read(dev, &msg) < 0) {
-        error_setg_errno(errp, EPROTO, "vhost_get_config failed");
-        return -EPROTO;
+    ret = vhost_user_read(dev, &msg);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "vhost_get_config failed");
+        return ret;
     }
 
     if (msg.hdr.request != VHOST_USER_GET_CONFIG) {
         error_setg(errp,
                    "Received unexpected msg type. Expected %d received %d",
                    VHOST_USER_GET_CONFIG, msg.hdr.request);
-        return -EINVAL;
+        return -EPROTO;
     }
 
     if (msg.hdr.size != VHOST_USER_CONFIG_HDR_SIZE + config_len) {
         error_setg(errp, "Received bad msg size.");
-        return -EINVAL;
+        return -EPROTO;
     }
 
     memcpy(config, msg.payload.config.region, config_len);
@@ -2233,6 +2269,7 @@ static int vhost_user_get_config(struct vhost_dev *dev, uint8_t *config,
 static int vhost_user_set_config(struct vhost_dev *dev, const uint8_t *data,
                                  uint32_t offset, uint32_t size, uint32_t flags)
 {
+    int ret;
     uint8_t *p;
     bool reply_supported = virtio_has_feature(dev->protocol_features,
                                               VHOST_USER_PROTOCOL_F_REPLY_ACK);
@@ -2245,7 +2282,7 @@ static int vhost_user_set_config(struct vhost_dev *dev, const uint8_t *data,
 
     if (!virtio_has_feature(dev->protocol_features,
                 VHOST_USER_PROTOCOL_F_CONFIG)) {
-        return -1;
+        return -ENOTSUP;
     }
 
     if (reply_supported) {
@@ -2253,7 +2290,7 @@ static int vhost_user_set_config(struct vhost_dev *dev, const uint8_t *data,
     }
 
     if (size > VHOST_USER_MAX_CONFIG_SIZE) {
-        return -1;
+        return -EINVAL;
     }
 
     msg.payload.config.offset = offset,
@@ -2262,8 +2299,9 @@ static int vhost_user_set_config(struct vhost_dev *dev, const uint8_t *data,
     p = msg.payload.config.region;
     memcpy(p, data, size);
 
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        return -1;
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret < 0) {
+        return ret;
     }
 
     if (reply_supported) {
@@ -2277,6 +2315,7 @@ static int vhost_user_crypto_create_session(struct vhost_dev *dev,
                                             void *session_info,
                                             uint64_t *session_id)
 {
+    int ret;
     bool crypto_session = virtio_has_feature(dev->protocol_features,
                                        VHOST_USER_PROTOCOL_F_CRYPTO_SESSION);
     CryptoDevBackendSymSessionInfo *sess_info = session_info;
@@ -2290,7 +2329,7 @@ static int vhost_user_crypto_create_session(struct vhost_dev *dev,
 
     if (!crypto_session) {
         error_report("vhost-user trying to send unhandled ioctl");
-        return -1;
+        return -ENOTSUP;
     }
 
     memcpy(&msg.payload.session.session_setup_data, sess_info,
@@ -2303,31 +2342,35 @@ static int vhost_user_crypto_create_session(struct vhost_dev *dev,
         memcpy(&msg.payload.session.auth_key, sess_info->auth_key,
                sess_info->auth_key_len);
     }
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        error_report("vhost_user_write() return -1, create session failed");
-        return -1;
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret < 0) {
+        error_report("vhost_user_write() return %d, create session failed",
+                     ret);
+        return ret;
     }
 
-    if (vhost_user_read(dev, &msg) < 0) {
-        error_report("vhost_user_read() return -1, create session failed");
-        return -1;
+    ret = vhost_user_read(dev, &msg);
+    if (ret < 0) {
+        error_report("vhost_user_read() return %d, create session failed",
+                     ret);
+        return ret;
     }
 
     if (msg.hdr.request != VHOST_USER_CREATE_CRYPTO_SESSION) {
         error_report("Received unexpected msg type. Expected %d received %d",
                      VHOST_USER_CREATE_CRYPTO_SESSION, msg.hdr.request);
-        return -1;
+        return -EPROTO;
     }
 
     if (msg.hdr.size != sizeof(msg.payload.session)) {
         error_report("Received bad msg size.");
-        return -1;
+        return -EPROTO;
     }
 
     if (msg.payload.session.session_id < 0) {
         error_report("Bad session id: %" PRId64 "",
                               msg.payload.session.session_id);
-        return -1;
+        return -EINVAL;
     }
     *session_id = msg.payload.session.session_id;
 
@@ -2337,6 +2380,7 @@ static int vhost_user_crypto_create_session(struct vhost_dev *dev,
 static int
 vhost_user_crypto_close_session(struct vhost_dev *dev, uint64_t session_id)
 {
+    int ret;
     bool crypto_session = virtio_has_feature(dev->protocol_features,
                                        VHOST_USER_PROTOCOL_F_CRYPTO_SESSION);
     VhostUserMsg msg = {
@@ -2348,12 +2392,14 @@ vhost_user_crypto_close_session(struct vhost_dev *dev, uint64_t session_id)
 
     if (!crypto_session) {
         error_report("vhost-user trying to send unhandled ioctl");
-        return -1;
+        return -ENOTSUP;
     }
 
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        error_report("vhost_user_write() return -1, close session failed");
-        return -1;
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret < 0) {
+        error_report("vhost_user_write() return %d, close session failed",
+                     ret);
+        return ret;
     }
 
     return 0;
@@ -2375,6 +2421,7 @@ static int vhost_user_get_inflight_fd(struct vhost_dev *dev,
 {
     void *addr;
     int fd;
+    int ret;
     struct vhost_user *u = dev->opaque;
     CharBackend *chr = u->user->chr;
     VhostUserMsg msg = {
@@ -2390,24 +2437,26 @@ static int vhost_user_get_inflight_fd(struct vhost_dev *dev,
         return 0;
     }
 
-    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
-        return -1;
+    ret = vhost_user_write(dev, &msg, NULL, 0);
+    if (ret < 0) {
+        return ret;
     }
 
-    if (vhost_user_read(dev, &msg) < 0) {
-        return -1;
+    ret = vhost_user_read(dev, &msg);
+    if (ret < 0) {
+        return ret;
     }
 
     if (msg.hdr.request != VHOST_USER_GET_INFLIGHT_FD) {
         error_report("Received unexpected msg type. "
                      "Expected %d received %d",
                      VHOST_USER_GET_INFLIGHT_FD, msg.hdr.request);
-        return -1;
+        return -EPROTO;
     }
 
     if (msg.hdr.size != sizeof(msg.payload.inflight)) {
         error_report("Received bad msg size.");
-        return -1;
+        return -EPROTO;
     }
 
     if (!msg.payload.inflight.mmap_size) {
@@ -2417,7 +2466,7 @@ static int vhost_user_get_inflight_fd(struct vhost_dev *dev,
     fd = qemu_chr_fe_get_msgfd(chr);
     if (fd < 0) {
         error_report("Failed to get mem fd");
-        return -1;
+        return -EIO;
     }
 
     addr = mmap(0, msg.payload.inflight.mmap_size, PROT_READ | PROT_WRITE,
@@ -2426,7 +2475,7 @@ static int vhost_user_get_inflight_fd(struct vhost_dev *dev,
     if (addr == MAP_FAILED) {
         error_report("Failed to mmap mem fd");
         close(fd);
-        return -1;
+        return -EFAULT;
     }
 
     inflight->addr = addr;
@@ -2456,11 +2505,7 @@ static int vhost_user_set_inflight_fd(struct vhost_dev *dev,
         return 0;
     }
 
-    if (vhost_user_write(dev, &msg, &inflight->fd, 1) < 0) {
-        return -1;
-    }
-
-    return 0;
+    return vhost_user_write(dev, &msg, &inflight->fd, 1);
 }
 
 bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp)
-- 
2.33.1


