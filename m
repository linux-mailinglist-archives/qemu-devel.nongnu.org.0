Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BD14E2D16
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:03:31 +0100 (CET)
Received: from localhost ([::1]:36164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKVF-0000td-UZ
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:03:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWK4y-0001Gt-TP
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:36:20 -0400
Received: from [2a00:1450:4864:20::629] (port=40747
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWK4w-0007XO-F6
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:36:20 -0400
Received: by mail-ej1-x629.google.com with SMTP id p15so30635903ejc.7
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=raaxpzIdeBT/n2nl9tGh0q/m+IcWdnaJflW/U+Dniz8=;
 b=wo5qgBj1e5hc1Jay9vkN8k4DT1QbWzzQDGwybMvtMtw/kBNdzn4Mz1e38FCvN73LU/
 wHMBBA0dxt7ZnK8RY/119nDu9iJGFi6ADfbTZT9HVnf4CD1VKshMWv1xtcYQWXF+aUwn
 j40bYe7/qkYSQq3tIKRkBA0LfSyhABqPoCaL1LDIANIdGAow2zK8TY92wmQoTK5k6PRt
 ndORNXzKa636OICYQn2hqHyckD+hmq4ELia9NJMNGxGu1EF4A4V3VJtmuylkDN3TrKJ6
 XgOUVKDdvJwn3RhJrZL5ehxVx2nybumoIbDsU4/Kv7AZOlHIGpNGZxrsEFfNTTS7BmdR
 83KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=raaxpzIdeBT/n2nl9tGh0q/m+IcWdnaJflW/U+Dniz8=;
 b=YT6WfZa7+49Na+JboX6AkXaU/sYg4cpwzYJidpfR+ZfRqoSeN84kohNk/62H40Vmw5
 cIY7yaum6YFHOOcNaCb3Uq098ZkELB9aQWo52XMncRWT/VgjL/JZZAP91xnfC6a2M1MU
 ThJv07wkpOyQwng1FS7CwBDjqK8QEy6/jcSPmarBuiTKe5/D29lAupQ0CP9J4dOjj2ir
 TonNtfNlp59xdiHBqdpBTotQ2S63c4fJ3egkHWAkwefKNjG2bGtm6t735ayqWeWfp3Hp
 cLA3BHEWd0gFH+zpHNyB/vXLvKLGEHWMpI7KsdQBbAw7GUCmlf96yJMjQMfEeEy3JSi/
 bDAA==
X-Gm-Message-State: AOAM532AQnlwhq1NT25/O4cU7rRLtYbEZqPx9+csFuwmcwZQ722EKFFe
 PqX3RMs9WsMT4SUSGvZWlvy/sQ==
X-Google-Smtp-Source: ABdhPJy6MafKv946urZle3V6SLXXgSyiTVyxBbxhhCUG6RWD4K/oi6B4HkCYuTKpsRwqV919vRHS9w==
X-Received: by 2002:a17:907:2d93:b0:6db:ab5e:7e0b with SMTP id
 gt19-20020a1709072d9300b006dbab5e7e0bmr21117818ejc.262.1647876977004; 
 Mon, 21 Mar 2022 08:36:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a170906774e00b006d5b915f27dsm7004057ejn.169.2022.03.21.08.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 08:36:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D141A1FFC5;
 Mon, 21 Mar 2022 15:30:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 13/13] virtio/vhost-user: dynamically assign
 VhostUserHostNotifiers
Date: Mon, 21 Mar 2022 15:30:37 +0000
Message-Id: <20220321153037.3622127-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220321153037.3622127-1-alex.bennee@linaro.org>
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At a couple of hundred bytes per notifier allocating one for every
potential queue is very wasteful as most devices only have a few
queues. Instead of having this handled statically dynamically assign
them and track in a GPtrArray.

[AJB: it's hard to trigger the vhost notifiers code, I assume as it
requires a KVM guest with appropriate backend]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/virtio/vhost-user.h | 42 ++++++++++++++++-
 hw/virtio/vhost-user.c         | 83 +++++++++++++++++++++++++++-------
 hw/virtio/trace-events         |  1 +
 3 files changed, 108 insertions(+), 18 deletions(-)

diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
index 6e0e8a71a3..c6e693cd3f 100644
--- a/include/hw/virtio/vhost-user.h
+++ b/include/hw/virtio/vhost-user.h
@@ -11,21 +11,61 @@
 #include "chardev/char-fe.h"
 #include "hw/virtio/virtio.h"
 
+/**
+ * VhostUserHostNotifier - notifier information for one queue
+ * @rcu: rcu_head for cleanup
+ * @mr: memory region of notifier
+ * @addr: current mapped address
+ * @unmap_addr: address to be un-mapped
+ * @idx: virtioqueue index
+ *
+ * The VhostUserHostNotifier entries are re-used. When an old mapping
+ * is to be released it is moved to @unmap_addr and @addr is replaced.
+ * Once the RCU process has completed the unmap @unmap_addr is
+ * cleared.
+ */
 typedef struct VhostUserHostNotifier {
     struct rcu_head rcu;
     MemoryRegion mr;
     void *addr;
     void *unmap_addr;
+    int idx;
 } VhostUserHostNotifier;
 
+/**
+ * VhostUserState - shared state for all vhost-user devices
+ * @chr: the character backend for the socket
+ * @notifiers: GPtrArray of @VhostUserHostnotifier
+ * @memory_slots:
+ */
 typedef struct VhostUserState {
     CharBackend *chr;
-    VhostUserHostNotifier notifier[VIRTIO_QUEUE_MAX];
+    GPtrArray *notifiers;
     int memory_slots;
     bool supports_config;
 } VhostUserState;
 
+/**
+ * vhost_user_init() - initialise shared vhost_user state
+ * @user: allocated area for storing shared state
+ * @chr: the chardev for the vhost socket
+ * @errp: error handle
+ *
+ * User can either directly g_new() space for the state or embed
+ * VhostUserState in their larger device structure and just point to
+ * it.
+ *
+ * Return: true on success, false on error while setting errp.
+ */
 bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp);
+
+/**
+ * vhost_user_cleanup() - cleanup state
+ * @user: ptr to use state
+ *
+ * Cleans up shared state and notifiers, callee is responsible for
+ * freeing the @VhostUserState memory itself.
+ */
 void vhost_user_cleanup(VhostUserState *user);
 
 #endif
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 6ce082861b..4c0423de55 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1174,14 +1174,16 @@ static void vhost_user_host_notifier_free(VhostUserHostNotifier *n)
     n->unmap_addr = NULL;
 }
 
-static void vhost_user_host_notifier_remove(VhostUserState *user,
-                                            VirtIODevice *vdev, int queue_idx)
+/*
+ * clean-up function for notifier, will finally free the structure
+ * under rcu.
+ */
+static void vhost_user_host_notifier_remove(VhostUserHostNotifier *n,
+                                            VirtIODevice *vdev)
 {
-    VhostUserHostNotifier *n = &user->notifier[queue_idx];
-
     if (n->addr) {
         if (vdev) {
-            virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
+            virtio_queue_set_host_notifier_mr(vdev, n->idx, &n->mr, false);
         }
         assert(!n->unmap_addr);
         n->unmap_addr = n->addr;
@@ -1225,6 +1227,15 @@ static int vhost_user_set_vring_enable(struct vhost_dev *dev, int enable)
     return 0;
 }
 
+static VhostUserHostNotifier *fetch_notifier(VhostUserState *u,
+                                             int idx)
+{
+    if (idx >= u->notifiers->len) {
+        return NULL;
+    }
+    return g_ptr_array_index(u->notifiers, idx);
+}
+
 static int vhost_user_get_vring_base(struct vhost_dev *dev,
                                      struct vhost_vring_state *ring)
 {
@@ -1237,7 +1248,10 @@ static int vhost_user_get_vring_base(struct vhost_dev *dev,
     };
     struct vhost_user *u = dev->opaque;
 
-    vhost_user_host_notifier_remove(u->user, dev->vdev, ring->index);
+    VhostUserHostNotifier *n = fetch_notifier(u->user, ring->index);
+    if (n) {
+        vhost_user_host_notifier_remove(n, dev->vdev);
+    }
 
     ret = vhost_user_write(dev, &msg, NULL, 0);
     if (ret < 0) {
@@ -1502,6 +1516,29 @@ static int vhost_user_slave_handle_config_change(struct vhost_dev *dev)
     return dev->config_ops->vhost_dev_config_notifier(dev);
 }
 
+/*
+ * Fetch or create the notifier for a given idx. Newly created
+ * notifiers are added to the pointer array that tracks them.
+ */
+static VhostUserHostNotifier *fetch_or_create_notifier(VhostUserState *u,
+                                                       int idx)
+{
+    VhostUserHostNotifier *n = NULL;
+    if (idx >= u->notifiers->len) {
+        g_ptr_array_set_size(u->notifiers, idx);
+    }
+
+    n = g_ptr_array_index(u->notifiers, idx);
+    if (!n) {
+        n = g_new0(VhostUserHostNotifier, 1);
+        n->idx = idx;
+        g_ptr_array_insert(u->notifiers, idx, n);
+        trace_vhost_user_create_notifier(idx, n);
+    }
+
+    return n;
+}
+
 static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
                                                        VhostUserVringArea *area,
                                                        int fd)
@@ -1521,9 +1558,12 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
         return -EINVAL;
     }
 
-    n = &user->notifier[queue_idx];
-
-    vhost_user_host_notifier_remove(user, vdev, queue_idx);
+    /*
+     * Fetch notifier and invalidate any old data before setting up
+     * new mapped address.
+     */
+    n = fetch_or_create_notifier(user, queue_idx);
+    vhost_user_host_notifier_remove(n, vdev);
 
     if (area->u64 & VHOST_USER_VRING_NOFD_MASK) {
         return 0;
@@ -2526,6 +2566,20 @@ static int vhost_user_set_inflight_fd(struct vhost_dev *dev,
     return vhost_user_write(dev, &msg, &inflight->fd, 1);
 }
 
+static void vhost_user_state_destroy(gpointer data)
+{
+    VhostUserHostNotifier *n = (VhostUserHostNotifier *) data;
+    if (n) {
+        vhost_user_host_notifier_remove(n, NULL);
+        object_unparent(OBJECT(&n->mr));
+        /*
+         * We can't free until vhost_user_host_notifier_remove has
+         * done it's thing so schedule the free with RCU.
+         */
+        g_free_rcu(n, rcu);
+    }
+}
+
 bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp)
 {
     if (user->chr) {
@@ -2534,23 +2588,18 @@ bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp)
     }
     user->chr = chr;
     user->memory_slots = 0;
+    user->notifiers = g_ptr_array_new_full(VIRTIO_QUEUE_MAX / 4,
+                                           &vhost_user_state_destroy);
     return true;
 }
 
 void vhost_user_cleanup(VhostUserState *user)
 {
-    int i;
-    VhostUserHostNotifier *n;
-
     if (!user->chr) {
         return;
     }
     memory_region_transaction_begin();
-    for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
-        n = &user->notifier[i];
-        vhost_user_host_notifier_remove(user, NULL, i);
-        object_unparent(OBJECT(&n->mr));
-    }
+    user->notifiers = (GPtrArray *) g_ptr_array_free(user->notifiers, true);
     memory_region_transaction_commit();
     user->chr = NULL;
 }
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index fd213e2a27..b40392a593 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -23,6 +23,7 @@ vhost_user_postcopy_waker_found(uint64_t client_addr) "0x%"PRIx64
 vhost_user_postcopy_waker_nomatch(const char *rb, uint64_t rb_offset) "%s + 0x%"PRIx64
 vhost_user_read(uint32_t req, uint32_t flags) "req:%d flags:0x%"PRIx32""
 vhost_user_write(uint32_t req, uint32_t flags) "req:%d flags:0x%"PRIx32""
+vhost_user_create_notifier(int idx, void *n) "idx:%d n:%p"
 
 # vhost-vdpa.c
 vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
-- 
2.30.2


