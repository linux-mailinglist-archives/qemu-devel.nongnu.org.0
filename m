Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12641EEE4A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 01:37:08 +0200 (CEST)
Received: from localhost ([::1]:43222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgzQ3-0003p8-PK
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 19:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1jgzP7-0002Wf-MY
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 19:36:09 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1jgzP5-000514-U7
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 19:36:09 -0400
Received: by mail-pg1-x542.google.com with SMTP id r10so4207434pgv.8
 for <qemu-devel@nongnu.org>; Thu, 04 Jun 2020 16:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eJfVkMSOd2rAt/mYEDG86M9fkbe8y+LyR/mkRJhKFjo=;
 b=OGj8hzJBinzupQS204vtFacPwuNcCqStIIQT7vCyghsOhKqPeS1ilvcrqxe4teytt3
 Z/zOK5oPGZyeRWJFg0HHHnOgIWsaQcv6EchHCJ3PXjo2/Q+VjCvFxLioGlFk5Y1nVtEE
 q7zJpgZA5WTStOh8XJ5jxKXFp0O7CBFaHqAG5IbeBHO+eXZcq4Sx5NPkhOmgM8FtNTDn
 H4uf0CtopS9ovlWlKLPsp96q9xMRiNs5gzvUEMQK2JTYYHRwkvYhTBnxOUyLHeJbd8Ah
 +jF3M874YOIVdtzSlFX80KrmvddPdI582zfLnnM84KX0zYeQ8H1+YuIbyxJVQQXa1b3E
 r6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eJfVkMSOd2rAt/mYEDG86M9fkbe8y+LyR/mkRJhKFjo=;
 b=LszhUqEHfcEFKK/wO49yBhDfE3qvlF3iG8sNVqo55w+ESO+O+aWIrLliA97/LGPfDy
 3x6lSuFB1QBz0z4ll4i/Olp4TGWv/M9Daj/zzBVHtJ/S7u28d9fcrbxDHYT+V0NJx9l0
 yKc2SJdrBdUxLVSUgiOES1C2G+qgyUsrmm+pYFjUk18QXhGXf5qVFaFb2ByMRHEC7d5t
 4aOS7rzWLOd+76Lam2ye/Wm1pDzVGIhD75rvn/I3+uWDKd2ZaNc+Y6S9mu+OwDqM34QM
 OGfr0BbeGeYpwLcesnif1S1NQRgRNoH+3AB05Md1jOycb5BMdQBmp2PKytKydKo357um
 QEDA==
X-Gm-Message-State: AOAM530amBU7kEzxLNWPQsgndoZYe0wV6d3yWNvF59+sfZCYBkr1S3mZ
 37ZVZfBlj7TdXsHqz9jxgd6/LA/Ryp2+6w2h
X-Google-Smtp-Source: ABdhPJwp3S77pgv6Zu2fE8KxLQhQ599e43Ib8PPhOhDh4tQgYTtQB9uuOpRAIKjaKd9KxV62QJknsQ==
X-Received: by 2002:a63:1c42:: with SMTP id c2mr6447454pgm.296.1591313766223; 
 Thu, 04 Jun 2020 16:36:06 -0700 (PDT)
Received: from localhost (tunnel570486-pt.tunnel.tserv25.sin1.ipv6.he.net.
 [2001:470:35:3d5::2])
 by smtp.gmail.com with ESMTPSA id 140sm5460628pfy.95.2020.06.04.16.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 16:36:05 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 1/4] Allow vu_message_read to be replaced
Date: Fri,  5 Jun 2020 07:35:35 +0800
Message-Id: <20200604233538.256325-2-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604233538.256325-1-coiby.xu@gmail.com>
References: <20200604233538.256325-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=coiby.xu@gmail.com; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, bharatlkmlkvm@gmail.com, Coiby Xu <coiby.xu@gmail.com>,
 stefanha@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow vu_message_read to be replaced by one which will make use of the
QIOChannel functions. Thus reading vhost-user message won't stall the
guest.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 contrib/libvhost-user/libvhost-user-glib.c |  2 +-
 contrib/libvhost-user/libvhost-user.c      | 11 ++++++-----
 contrib/libvhost-user/libvhost-user.h      | 21 +++++++++++++++++++++
 tests/vhost-user-bridge.c                  |  2 ++
 tools/virtiofsd/fuse_virtio.c              |  4 ++--
 5 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user-glib.c b/contrib/libvhost-user/libvhost-user-glib.c
index 53f1ca4cdd..0df2ec9271 100644
--- a/contrib/libvhost-user/libvhost-user-glib.c
+++ b/contrib/libvhost-user/libvhost-user-glib.c
@@ -147,7 +147,7 @@ vug_init(VugDev *dev, uint16_t max_queues, int socket,
     g_assert(dev);
     g_assert(iface);
 
-    if (!vu_init(&dev->parent, max_queues, socket, panic, set_watch,
+    if (!vu_init(&dev->parent, max_queues, socket, panic, NULL, set_watch,
                  remove_watch, iface)) {
         return false;
     }
diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
index 3bca996c62..0c7368baa2 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -67,8 +67,6 @@
 /* The version of inflight buffer */
 #define INFLIGHT_VERSION 1
 
-#define VHOST_USER_HDR_SIZE offsetof(VhostUserMsg, payload.u64)
-
 /* The version of the protocol we support */
 #define VHOST_USER_VERSION 1
 #define LIBVHOST_USER_DEBUG 0
@@ -412,7 +410,7 @@ vu_process_message_reply(VuDev *dev, const VhostUserMsg *vmsg)
         goto out;
     }
 
-    if (!vu_message_read(dev, dev->slave_fd, &msg_reply)) {
+    if (!dev->read_msg(dev, dev->slave_fd, &msg_reply)) {
         goto out;
     }
 
@@ -647,7 +645,7 @@ vu_set_mem_table_exec_postcopy(VuDev *dev, VhostUserMsg *vmsg)
     /* Wait for QEMU to confirm that it's registered the handler for the
      * faults.
      */
-    if (!vu_message_read(dev, dev->sock, vmsg) ||
+    if (!dev->read_msg(dev, dev->sock, vmsg) ||
         vmsg->size != sizeof(vmsg->payload.u64) ||
         vmsg->payload.u64 != 0) {
         vu_panic(dev, "failed to receive valid ack for postcopy set-mem-table");
@@ -1653,7 +1651,7 @@ vu_dispatch(VuDev *dev)
     int reply_requested;
     bool need_reply, success = false;
 
-    if (!vu_message_read(dev, dev->sock, &vmsg)) {
+    if (!dev->read_msg(dev, dev->sock, &vmsg)) {
         goto end;
     }
 
@@ -1704,6 +1702,7 @@ vu_deinit(VuDev *dev)
         }
 
         if (vq->kick_fd != -1) {
+            dev->remove_watch(dev, vq->kick_fd);
             close(vq->kick_fd);
             vq->kick_fd = -1;
         }
@@ -1751,6 +1750,7 @@ vu_init(VuDev *dev,
         uint16_t max_queues,
         int socket,
         vu_panic_cb panic,
+        vu_read_msg_cb read_msg,
         vu_set_watch_cb set_watch,
         vu_remove_watch_cb remove_watch,
         const VuDevIface *iface)
@@ -1768,6 +1768,7 @@ vu_init(VuDev *dev,
 
     dev->sock = socket;
     dev->panic = panic;
+    dev->read_msg = read_msg ? read_msg : vu_message_read;
     dev->set_watch = set_watch;
     dev->remove_watch = remove_watch;
     dev->iface = iface;
diff --git a/contrib/libvhost-user/libvhost-user.h b/contrib/libvhost-user/libvhost-user.h
index f30394fab6..d756da8548 100644
--- a/contrib/libvhost-user/libvhost-user.h
+++ b/contrib/libvhost-user/libvhost-user.h
@@ -30,6 +30,8 @@
 
 #define VHOST_MEMORY_MAX_NREGIONS 8
 
+#define VHOST_USER_HDR_SIZE offsetof(VhostUserMsg, payload.u64)
+
 typedef enum VhostSetConfigType {
     VHOST_SET_CONFIG_TYPE_MASTER = 0,
     VHOST_SET_CONFIG_TYPE_MIGRATION = 1,
@@ -205,6 +207,7 @@ typedef uint64_t (*vu_get_features_cb) (VuDev *dev);
 typedef void (*vu_set_features_cb) (VuDev *dev, uint64_t features);
 typedef int (*vu_process_msg_cb) (VuDev *dev, VhostUserMsg *vmsg,
                                   int *do_reply);
+typedef bool (*vu_read_msg_cb) (VuDev *dev, int sock, VhostUserMsg *vmsg);
 typedef void (*vu_queue_set_started_cb) (VuDev *dev, int qidx, bool started);
 typedef bool (*vu_queue_is_processed_in_order_cb) (VuDev *dev, int qidx);
 typedef int (*vu_get_config_cb) (VuDev *dev, uint8_t *config, uint32_t len);
@@ -373,6 +376,23 @@ struct VuDev {
     bool broken;
     uint16_t max_queues;
 
+    /* @read_msg: custom method to read vhost-user message
+     *
+     * Read data from vhost_user socket fd and fill up
+     * the passed VhostUserMsg *vmsg struct.
+     *
+     * If reading fails, it should close the received set of file
+     * descriptors as socket message's auxiliary data.
+     *
+     * For the details, please refer to vu_message_read in libvhost-user.c
+     * which will be used by default if not custom method is provided when
+     * calling vu_init
+     *
+     * Returns: true if vhost-user message successfully received,
+     *          otherwise return false.
+     *
+     */
+    vu_read_msg_cb read_msg;
     /* @set_watch: add or update the given fd to the watch set,
      * call cb when condition is met */
     vu_set_watch_cb set_watch;
@@ -416,6 +436,7 @@ bool vu_init(VuDev *dev,
              uint16_t max_queues,
              int socket,
              vu_panic_cb panic,
+             vu_read_msg_cb read_msg,
              vu_set_watch_cb set_watch,
              vu_remove_watch_cb remove_watch,
              const VuDevIface *iface);
diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
index 6c3d490611..bd43607a4d 100644
--- a/tests/vhost-user-bridge.c
+++ b/tests/vhost-user-bridge.c
@@ -520,6 +520,7 @@ vubr_accept_cb(int sock, void *ctx)
                  VHOST_USER_BRIDGE_MAX_QUEUES,
                  conn_fd,
                  vubr_panic,
+                 NULL,
                  vubr_set_watch,
                  vubr_remove_watch,
                  &vuiface)) {
@@ -573,6 +574,7 @@ vubr_new(const char *path, bool client)
                      VHOST_USER_BRIDGE_MAX_QUEUES,
                      dev->sock,
                      vubr_panic,
+                     NULL,
                      vubr_set_watch,
                      vubr_remove_watch,
                      &vuiface)) {
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 3b6d16a041..666945c897 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -980,8 +980,8 @@ int virtio_session_mount(struct fuse_session *se)
     se->vu_socketfd = data_sock;
     se->virtio_dev->se = se;
     pthread_rwlock_init(&se->virtio_dev->vu_dispatch_rwlock, NULL);
-    vu_init(&se->virtio_dev->dev, 2, se->vu_socketfd, fv_panic, fv_set_watch,
-            fv_remove_watch, &fv_iface);
+    vu_init(&se->virtio_dev->dev, 2, se->vu_socketfd, fv_panic, NULL,
+            fv_set_watch, fv_remove_watch, &fv_iface);
 
     return 0;
 }
-- 
2.26.2


