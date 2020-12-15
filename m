Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C632DB15D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 17:28:33 +0100 (CET)
Received: from localhost ([::1]:41034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpDBg-0007N5-NO
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 11:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1kpD5X-00077E-5e
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:22:11 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:39424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1kpD5T-00039u-Et
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:22:10 -0500
Received: by mail-pj1-x1042.google.com with SMTP id hk16so9174773pjb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 08:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oJ7GXe6gbKIcmlxIArgRw2UImT1YFaebERGVudKtuV8=;
 b=ZvdShs9yhjkXtrZIAtcaYxJPRLy1N2TJ6bTycb6hHvwgX7umPDY0SXtv+3x5TtoByd
 7Wf9sx9DYpvz0ZRxXJyWcUdLIXaxBCcDgyn26s+n47k3D8wltLum1RVujUG9MHHac9f1
 YkoE8Ye6CDz6z8VI0p70dhPzlxGIxRiVQjI4qTtFDYHyUwyG2aNbeqFqlTgRoyOwiGe+
 xomLZG/OzVjU9Dow8aUI37woZMghZgiipDNYYW9g4FLfpuOIwl0xWMM0ArA4hd+8xmRn
 BtM6kaMKEcOL8p+yQVIi/Cxuw+uJXdInTupxj2kzOniRtS5tNyVsI2PU1rptMgKEFzTA
 5o7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oJ7GXe6gbKIcmlxIArgRw2UImT1YFaebERGVudKtuV8=;
 b=Szn88zqcXpFP0ED2I3qFjB4GfqeEJHo93dY+6Gn0QEr6aDpjqAZ1t8vdm7n+1T+RnF
 0WLBWqHMVe50B8AZ3fu02YZUVJdLI8PXn6Sv7sb7k+cO04v57rYeJdxzKX29eq5xrTxd
 nLwOl5Gw/UBJQ/1RlJsHHIHWCSMZMSep248WMQI2va5IKQS1V013eu8ELIsBkzLKKhGT
 r7Idhar3sfpNcIJVWHysgcrlVDwurr4VIKebYOh4yyUUMPHHQx2jkFmWNP8E2DueISzG
 OXSBnqnkGLN0U7thpNQDVWIJuNLEAYZyHdNEKUS4mbTtd1DAAe22mW22PisZD6dCLP5X
 ok6w==
X-Gm-Message-State: AOAM530v+4qd7aOerUSa4kLhxEj/eMTjtGXgRuVIiSgR0XH9SbNI74vz
 fikhy+BBj+nXrS/HNYqkS1QJ+A==
X-Google-Smtp-Source: ABdhPJxIy/4NmLb5WHysEDqz5d/k641taeyfS02HLt12z8n7G7prDz7jb7WcoJy/Ob0Z/9Nih/3qAw==
X-Received: by 2002:a17:90a:3841:: with SMTP id
 l1mr11748277pjf.3.1608049326154; 
 Tue, 15 Dec 2020 08:22:06 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.246])
 by smtp.gmail.com with ESMTPSA id c10sm24273508pfo.159.2020.12.15.08.22.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Dec 2020 08:22:05 -0800 (PST)
From: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
To: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xie Yongji <xieyongji@bytedance.com>
Subject: [RFC PATCH 7/9] virtiofsd: Persist/restore lo_map and opened fds
 to/from QEMU
Date: Wed, 16 Dec 2020 00:21:17 +0800
Message-Id: <20201215162119.27360-8-zhangjiachen.jaycee@bytedance.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=zhangjiachen.jaycee@bytedance.com;
 helo=mail-pj1-x1042.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the help of the 4 new vhost-user message types and the previous
commits, this commit enables crash reconnection of virtiofsd.

For the three kinds of lo_maps, INO_MAP, FD_MAP, and DIRP_MAP, a
VHOST_USER_SET_SHM message will be sent from virtiofsd to QEMU when they
are growing. QEMU will send back the lo_map memfd back to virtiofsd when
reconnecting.

For the file descriptors, when virtiofsd is opening or closing a file or
a directory, it will also send a VHOST_USER_SLAVE_FD message to QEMU to
persist the opened fd in the QEMU process. When reconnecting, QEMU will
send back all the fds to virtiofsd with VHOST_USER_SET_FD messages.

Signed-off-by: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 tools/virtiofsd/fuse_lowlevel.c       |  21 ++-
 tools/virtiofsd/fuse_virtio.c         |  16 ++
 tools/virtiofsd/fuse_virtio.h         |   1 +
 tools/virtiofsd/passthrough_helpers.h |   2 +-
 tools/virtiofsd/passthrough_ll.c      | 213 +++++++++++++++++++++++---
 5 files changed, 226 insertions(+), 27 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index c70fb16a9a..f3358561e2 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2136,6 +2136,22 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     send_reply_ok(req, &outarg, outargsize);
 }
 
+static void do_init_reconn(fuse_req_t req, fuse_ino_t nodeid,
+                    struct fuse_mbuf_iter *iter)
+{
+    struct fuse_session *se = req->se;
+
+    (void)nodeid;
+
+    se->got_init = 1;
+    se->got_destroy = 0;
+    if (se->op.init) {
+        se->op.init(se->userdata, &se->conn);
+    }
+
+    fuse_log(FUSE_LOG_DEBUG, "   Virtiofsd reconnected");
+}
+
 static void do_destroy(fuse_req_t req, fuse_ino_t nodeid,
                        struct fuse_mbuf_iter *iter)
 {
@@ -2444,8 +2460,7 @@ void fuse_session_process_buf_int(struct fuse_session *se,
      * requests, FUSE_INIT and FUSE_INIT, FUSE_INIT and FUSE_DESTROY, and
      * FUSE_DESTROY and FUSE_DESTROY.
      */
-    if (in->opcode == FUSE_INIT || in->opcode == CUSE_INIT ||
-        in->opcode == FUSE_DESTROY) {
+    if (!se->got_init || in->opcode == FUSE_DESTROY) {
         pthread_rwlock_wrlock(&se->init_rwlock);
     } else {
         pthread_rwlock_rdlock(&se->init_rwlock);
@@ -2457,7 +2472,7 @@ void fuse_session_process_buf_int(struct fuse_session *se,
 
         expected = se->cuse_data ? CUSE_INIT : FUSE_INIT;
         if (in->opcode != expected) {
-            goto reply_err;
+            do_init_reconn(req, 0, &iter);
         }
     } else if (in->opcode == FUSE_INIT || in->opcode == CUSE_INIT) {
         if (fuse_lowlevel_is_virtio(se)) {
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 83ba07c6cd..03b03ddacf 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -109,6 +109,12 @@ static void fv_set_features(VuDev *dev, uint64_t features)
 {
 }
 
+static uint64_t fv_get_protocol_features(VuDev *dev)
+{
+    return 1ull << VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD |
+            1ull << VHOST_USER_PROTOCOL_F_MAP_SHMFD;
+}
+
 /*
  * Callback from libvhost-user if there's a new fd we're supposed to listen
  * to, typically a queue kick?
@@ -773,6 +779,7 @@ static bool fv_queue_order(VuDev *dev, int qidx)
 static const VuDevIface fv_iface = {
     .get_features = fv_get_features,
     .set_features = fv_set_features,
+    .get_protocol_features = fv_get_protocol_features,
 
     /* Don't need process message, we've not got any at vhost-user level */
     .queue_set_started = fv_queue_set_started,
@@ -1035,3 +1042,12 @@ void virtio_session_close(struct fuse_session *se)
     free(se->virtio_dev);
     se->virtio_dev = NULL;
 }
+
+struct VuDev *virtio_get_dev(struct fuse_session *se)
+{
+    if (se == NULL || se->virtio_dev == NULL) {
+        return NULL;
+    }
+
+    return &se->virtio_dev->dev;
+}
diff --git a/tools/virtiofsd/fuse_virtio.h b/tools/virtiofsd/fuse_virtio.h
index 111684032c..3d9884e894 100644
--- a/tools/virtiofsd/fuse_virtio.h
+++ b/tools/virtiofsd/fuse_virtio.h
@@ -21,6 +21,7 @@ struct fuse_session;
 int virtio_session_mount(struct fuse_session *se);
 void virtio_session_close(struct fuse_session *se);
 int virtio_loop(struct fuse_session *se);
+struct VuDev *virtio_get_dev(struct fuse_session *se);
 
 
 int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
diff --git a/tools/virtiofsd/passthrough_helpers.h b/tools/virtiofsd/passthrough_helpers.h
index 0b98275ed5..aa82990a71 100644
--- a/tools/virtiofsd/passthrough_helpers.h
+++ b/tools/virtiofsd/passthrough_helpers.h
@@ -33,7 +33,7 @@ static int mknod_wrapper(int dirfd, const char *path, const char *link,
     int res;
 
     if (S_ISREG(mode)) {
-        res = openat(dirfd, path, O_CREAT | O_EXCL | O_WRONLY, mode);
+        res = openat(dirfd, path, O_CREAT | O_WRONLY, mode);
         if (res >= 0) {
             res = close(res);
         }
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 73a50bd7a3..8fee635396 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -69,6 +69,20 @@
 #include "passthrough_helpers.h"
 #include "passthrough_seccomp.h"
 #include "qemu/memfd.h"
+#include "contrib/libvhost-user/libvhost-user.h"
+
+static struct fuse_session *se;
+
+struct lo_data lo;
+
+typedef enum {
+    FD_MAP = 0,
+    INO_MAP = 1,
+    DIRP_MAP = 2,
+    MAP_TYPE_NUM = 3
+} map_t;
+/* We have 3 type of lo_maps, 2 bits is enough */
+#define MAP_TYPE_SHIFT 2
 
 /* Keep track of inode posix locks for each owner. */
 struct lo_inode_plock {
@@ -128,7 +142,7 @@ struct lo_map_elem {
 struct lo_map {
     size_t nelems;
     ssize_t freelist;
-    int map_type;
+    map_t map_type;
     int memfd;
     struct lo_map_elem elems[];
 } __attribute__((packed));
@@ -161,11 +175,6 @@ typedef struct xattr_map_entry {
     unsigned int flags;
 } XattrMapEntry;
 
-#define FD_MAP 0
-#define INO_MAP 1
-#define DIRP_MAP 2
-#define MAP_TYPE_NUM 3
-
 struct lo_data {
     pthread_mutex_t mutex;
     int sandbox;
@@ -187,6 +196,7 @@ struct lo_data {
     int allow_direct_io;
     int announce_submounts;
     bool use_statx;
+    int connected;
     struct lo_inode *root;
     GHashTable *inodes; /* protected by lo->mutex */
     struct lo_map *maps[MAP_TYPE_NUM]; /* protected by lo->mutex */
@@ -197,8 +207,6 @@ struct lo_data {
     int proc_self_fd;
 };
 
-static struct lo_data lo;
-
 static const struct fuse_opt lo_opts[] = {
     { "sandbox=namespace",
       offsetof(struct lo_data, sandbox),
@@ -237,6 +245,9 @@ static bool use_syslog = false;
 static int current_log_level;
 static void unref_inode_lolocked(struct lo_data *lo, struct lo_inode *inode,
                                  uint64_t n);
+static void try_reclaim_elems(void);
+static void restore_ino_map(void);
+static void restore_dirp_map(void);
 
 static struct {
     pthread_mutex_t mutex;
@@ -266,7 +277,7 @@ static int is_safe_path_component(const char *path)
 
 static struct lo_data *lo_data(fuse_req_t req)
 {
-    return &lo;
+    return (struct lo_data *)fuse_req_userdata(req);
 }
 
 /*
@@ -386,8 +397,7 @@ out:
     return ret;
 }
 
-
-static void lo_map_init(int map_type)
+static void lo_map_init(map_t map_type)
 {
     int memfd;
     int ret;
@@ -415,21 +425,15 @@ static void lo_map_init(int map_type)
     lo.maps[map_type]->freelist = -1;
     lo.maps[map_type]->map_type = map_type;
     lo.maps[map_type]->memfd = memfd;
-
-    printf("memfd: %d\n", lo.maps[map_type]->memfd);
-    ret = system("ls -lsh /proc/self/fd");
-    fuse_log(FUSE_LOG_DEBUG, "map %s init succeed!\n",
-                             MAP_NAME[lo.maps[map_type]->map_type]);
 }
 
-static void lo_map_destroy(int map_type)
+static void lo_map_destroy(map_t map_type)
 {
     munmap(lo.maps[map_type], sizeof(struct lo_map) +
            lo.maps[map_type]->nelems * sizeof(struct lo_map_elem));
-
 }
 
-static int lo_map_grow(int map_type, size_t new_nelems)
+static int lo_map_grow(map_t map_type, size_t new_nelems)
 {
     size_t i;
     size_t new_size;
@@ -460,10 +464,19 @@ static int lo_map_grow(int map_type, size_t new_nelems)
 
     lo.maps[map_type]->freelist = lo.maps[map_type]->nelems;
     lo.maps[map_type]->nelems = new_nelems;
+
+     if (lo.reconnect && lo.connected) {
+        /* sync the lo_map growing with QEMU */
+        uint64_t map_size = sizeof(struct lo_map) +
+                                sizeof(struct lo_map_elem) * new_nelems;
+        vu_slave_send_shm(virtio_get_dev(se), lo.maps[map_type]->memfd,
+                          map_size, map_type);
+    }
+
     return 1;
 }
 
-static struct lo_map_elem *lo_map_alloc_elem(int map_type)
+static struct lo_map_elem *lo_map_alloc_elem(map_t map_type)
 {
     struct lo_map_elem *elem;
     struct lo_map *map = lo.maps[map_type];
@@ -478,7 +491,7 @@ static struct lo_map_elem *lo_map_alloc_elem(int map_type)
     return elem;
 }
 
-static struct lo_map_elem *lo_map_reserve(int map_type, size_t key)
+static struct lo_map_elem *lo_map_reserve(map_t map_type, size_t key)
 {
     ssize_t *prev;
     struct lo_map *map = lo.maps[map_type];
@@ -531,6 +544,12 @@ static void lo_map_remove(struct lo_map *map, size_t key)
         closedir(elem->dirp.dp);
     }
 
+    if (lo.reconnect) {
+        /* remove the opened fd from QEMU */
+        int fd_key = key << MAP_TYPE_SHIFT | map->map_type;
+        vu_slave_send_fd_del(virtio_get_dev(se), fd_key);
+    }
+
     if (g_atomic_int_get(&elem->refcount) == -1) {
         return;
     }
@@ -539,6 +558,7 @@ static void lo_map_remove(struct lo_map *map, size_t key)
 
     elem->freelist = map->freelist;
     map->freelist = key;
+
 }
 
 /* Assumes lo->mutex is held */
@@ -554,6 +574,17 @@ static ssize_t lo_add_fd_mapping(fuse_req_t req, int fd)
     g_atomic_int_set(&elem->refcount, 1);
 
     elem->fd = fd;
+
+    ssize_t fh = ((unsigned long)elem -
+                 (unsigned long)lo_data(req)->maps[FD_MAP]->elems) /
+                 sizeof(struct lo_map_elem);
+
+    if (lo.reconnect) {
+        /* Send the newly opened fd to QEMU */
+        int key = fh << MAP_TYPE_SHIFT | FD_MAP;
+        vu_slave_send_fd_add(virtio_get_dev(se), fd, key);
+    }
+
     return ((unsigned long)elem -
             (unsigned long)lo_data(req)->maps[FD_MAP]->elems) /
             sizeof(struct lo_map_elem);
@@ -695,6 +726,13 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
                  "does not support it\n");
         lo->announce_submounts = false;
     }
+    /* reinit the root inode when needed */
+    lo->connected = 1;
+
+    /* try to reclaim elems as many as possible */
+    try_reclaim_elems();
+    restore_ino_map();
+    restore_dirp_map();
 }
 
 static void lo_getattr(fuse_req_t req, fuse_ino_t ino,
@@ -1016,6 +1054,12 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
 
         g_hash_table_insert(lo->inodes, &inode->key, inode);
         pthread_mutex_unlock(&lo->mutex);
+
+        if (lo->reconnect) {
+            /* Send the newly opened fd to QEMU */
+            int key = inode->fuse_ino << MAP_TYPE_SHIFT | INO_MAP;
+            vu_slave_send_fd_add(virtio_get_dev(se), newfd, key);
+        }
     }
     e->ino = inode->fuse_ino;
     lo_inode_put(lo, inode);
@@ -1557,6 +1601,13 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t ino,
     }
     g_atomic_int_set(&elem->refcount, 1); /* paired with lo_releasedir() */
     pthread_mutex_unlock(&lo->mutex);
+
+    if (lo->reconnect) {
+        /* Send the newly opened fd to QEMU */
+        int key = fh << MAP_TYPE_SHIFT | DIRP_MAP;
+        vu_slave_send_fd_add(virtio_get_dev(se), fd, key);
+    }
+
     fuse_reply_open(req, fi);
     return;
 
@@ -2972,6 +3023,8 @@ static void lo_destroy(void *userdata)
         unref_inode(lo, inode, inode->nlookup);
     }
     pthread_mutex_unlock(&lo->mutex);
+
+    lo->connected = 0;
 }
 
 static struct fuse_lowlevel_ops lo_oper = {
@@ -3025,6 +3078,113 @@ static void print_capabilities(void)
     printf("}\n");
 }
 
+static void try_reclaim_elems(void)
+{
+    /*
+     * Crash consistency: Check if virtiofsd is crashed in an inconsistent
+     * status when removing, and try to fix it by removing again.
+     */
+    map_t map_type;
+    int i;
+    for (map_type = 0; map_type < MAP_TYPE_NUM; map_type++) {
+        if (map_type == INO_MAP || map_type == DIRP_MAP) {
+            for (i = 0; i < lo.maps[map_type]->nelems; i++) {
+                if (g_atomic_int_get(&lo.maps[map_type]->elems[i].refcount)
+                                                                     == 0) {
+                    pthread_mutex_lock(&lo.mutex);
+                    lo_map_remove(lo.maps[map_type], i);
+                    pthread_mutex_unlock(&lo.mutex);
+                }
+            }
+        }
+    }
+}
+
+static void restore_ino_map(void)
+{
+    int i ;
+
+    lo.root = &lo_map_get(lo.maps[INO_MAP], FUSE_ROOT_ID)->inode;
+    /* Restore the ino_map and lo.inodes hash table */
+    for (i = 0; i < lo.maps[INO_MAP]->nelems; i++) {
+        struct lo_map_elem *elem = &lo.maps[INO_MAP]->elems[i];
+        if (g_atomic_int_get(&elem->refcount) != -1) {
+            struct lo_inode *inode = &elem->inode;
+            pthread_mutex_init(&inode->plock_mutex, NULL);
+            elem->inode.posix_locks = g_hash_table_new_full(
+                g_direct_hash, g_direct_equal, NULL, posix_locks_value_destroy);
+            if (inode->nlookup > 0) {
+                g_hash_table_insert(lo.inodes, &inode->key, inode);
+            }
+            if (i > FUSE_ROOT_ID) {
+                g_atomic_int_set(&elem->refcount, 1);
+            } else {
+                g_atomic_int_set(&elem->refcount, 2);
+            }
+        }
+    }
+}
+
+static void restore_dirp_map(void)
+{
+    int i;
+
+    /* Restore the fields of lo_dirp. */
+    for (i = 0; i < lo.maps[DIRP_MAP]->nelems; i++) {
+        struct lo_map_elem *elem = &lo.maps[DIRP_MAP]->elems[i];
+        if (g_atomic_int_get(&elem->refcount) != -1) {
+            struct lo_dirp *d = &elem->dirp;
+            d->dp = fdopendir(d->fd);
+            d->fd = dirfd(d->dp);
+            d->entry = NULL;
+            g_atomic_int_set(&elem->refcount, 1);
+        }
+    }
+}
+
+static bool vu_set_fs_map(VuDev *dev, VhostUserMsg *vmsg)
+{
+    map_t map_type = vmsg->payload.shm.id;
+    int cur_map_memfd = lo.maps[map_type]->memfd;
+    int tmp_memfd = vmsg->fds[0];
+
+    lo.maps[map_type]->map_type = map_type;
+
+    uint64_t cur_map_size = sizeof(struct lo_map) +
+                    sizeof(struct lo_map_elem) * lo.maps[map_type]->nelems;
+    munmap(lo.maps[map_type], cur_map_size);
+    close(cur_map_memfd);
+    lo.maps[map_type] = mmap(lo.maps[map_type], vmsg->payload.shm.size,
+                        PROT_READ | PROT_WRITE, MAP_SHARED | MAP_FIXED,
+                                                        tmp_memfd, 0);
+    lo.maps[map_type]->memfd = tmp_memfd;
+
+    return false;
+}
+
+static bool vu_set_fs_proc_fd(VuDev *dev, VhostUserMsg *vmsg)
+{
+    int fd_num = vmsg->fd_num;
+    int fd, fd_key;
+
+    assert(fd_num == 1);
+    fd = vmsg->fds[0];
+    fd_key = vmsg->payload.fdinfo.key;
+
+    map_t map_type = fd_key & ((1 << MAP_TYPE_SHIFT) - 1);
+    int key = fd_key >> MAP_TYPE_SHIFT;
+
+    if (map_type == INO_MAP) {
+        lo.maps[INO_MAP]->elems[key].inode.fd = fd;
+    } else if (map_type == DIRP_MAP) {
+        lo.maps[DIRP_MAP]->elems[key].dirp.fd = fd;
+    } else if (map_type == FD_MAP) {
+        lo.maps[FD_MAP]->elems[key].fd = fd;
+    }
+
+    return false;
+}
+
 /*
  * Drop all Linux capabilities because the wait parent process only needs to
  * sit in waitpid(2) and terminate.
@@ -3529,7 +3689,6 @@ static void fuse_lo_data_cleanup(struct lo_data *lo)
 int main(int argc, char *argv[])
 {
     struct fuse_args args = FUSE_ARGS_INIT(argc, argv);
-    struct fuse_session *se;
     struct fuse_cmdline_opts opts;
     struct lo_map_elem *root_elem;
     struct lo_map_elem *reserve_elem;
@@ -3541,7 +3700,7 @@ int main(int argc, char *argv[])
     lo.posix_lock = 1;
     lo.allow_direct_io = 0,
     lo.proc_self_fd = -1;
-
+    lo.connected = 0;
     lo.reconnect = 0;
     lo.mount_ns = 1;
 
@@ -3621,6 +3780,9 @@ int main(int argc, char *argv[])
                    "no_posix_lock (default), and -o no_xattr (default).\n");
             exit(1);
         }
+
+        vu_set_shm_cb = vu_set_fs_map;
+        vu_set_fd_cb = vu_set_fs_proc_fd;
     }
 
     if (opts.log_level != 0) {
@@ -3706,6 +3868,11 @@ int main(int argc, char *argv[])
     /* Block until ctrl+c or fusermount -u */
     ret = virtio_loop(se);
 
+    /* If reconnection is enabled, we directly return without destroy status */
+    if (lo.reconnect) {
+        return 0;
+    }
+
     fuse_session_unmount(se);
     cleanup_capng();
 err_out3:
-- 
2.20.1


