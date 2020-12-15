Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3642DB13F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 17:23:45 +0100 (CET)
Received: from localhost ([::1]:51956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpD72-0008T3-KH
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 11:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1kpD5H-0006pX-VR
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:21:55 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:45139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1kpD5E-00038p-1D
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:21:55 -0500
Received: by mail-pl1-x643.google.com with SMTP id e2so4134562plt.12
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 08:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IB+k29zP6M9ZuhdJ/l7Jim5BnTeNatYhCvVUNikRT68=;
 b=pcihtQV+33xGQ7k8w8sI4Ck9P5nbKk6pGh1Dyp/av240t1M7Thz0p/8XjQiK9X/1wu
 Lam4BdOGUrGEqj+d/WO6u61ceFaeOW/CpYqsJD4smECikXHDyr7sDGdGB6j/aiABK1K6
 XH+W0zeoM1X1YYBciONIsE97JuU9ly6rkBANLV9rE49GqlAUsXjCWixnDaAfKBdTjTn7
 uQJbQamoD8dYm0XIVkxyukLqrtDdUiqTtBgr6psnwk6hgzgdeCtluhObh0euyvNyRHnj
 2ywqbq8vHHtoy4+vsGoM+NqELmLimrIsUqtVnDnO6aQpPhINFZyfW9M6Vy6bA+3ewRPp
 jQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IB+k29zP6M9ZuhdJ/l7Jim5BnTeNatYhCvVUNikRT68=;
 b=JHKN9HF0jVA17PEOtwXJftux46tUDYrGFdw2w0cwxBEnIuzufJFaGIKAHCpLqH/MpV
 xRijZ+cWGSwql5SIKzDcbM0JjubmsHI+5YfcHSX7rMFaZWNI6TZ+obuQbc9BEywZ8ReM
 lxh4jSNqCCBq3IHMLrDRanrvR+w6YeWgD8K0eVdKUOOESLA5B9FZhcAl6Mvngyy0cUD3
 06KqIUiopal0xwBdU0Is6ov7PPZfBFw0RWHDljVM0xm51EAaQ1Ev0uD3CmBoCkTQ1dg/
 x31FQ4HsU+mEsBoor1PCjIrcNGUO+5LTwNCtNw2jYDdv0IpEr1lPZqTe0DSOjjDWyFPh
 /P5Q==
X-Gm-Message-State: AOAM53148K+ZbyzsnbwxJAk2jJYADt2RGJkYv5TVnNWlbv6hJbRfnMA/
 FsEd0cSalB4nmHXWZ2PMpaiEDw==
X-Google-Smtp-Source: ABdhPJxJt20bXT0wqr6ZPmxrf4gD6sEe01zmsRxl5/58uzBuTv/YDXN9inATEwPgwqxwHzGGGao5vg==
X-Received: by 2002:a17:90b:19d2:: with SMTP id
 nm18mr31831905pjb.159.1608049310561; 
 Tue, 15 Dec 2020 08:21:50 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.246])
 by smtp.gmail.com with ESMTPSA id c10sm24273508pfo.159.2020.12.15.08.21.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Dec 2020 08:21:50 -0800 (PST)
From: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
To: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xie Yongji <xieyongji@bytedance.com>
Subject: [RFC PATCH 3/9] vhost-user-fs: Support virtiofsd crash reconnection
Date: Wed, 16 Dec 2020 00:21:13 +0800
Message-Id: <20201215162119.27360-4-zhangjiachen.jaycee@bytedance.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=zhangjiachen.jaycee@bytedance.com; helo=mail-pl1-x643.google.com
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

This commit adds vhost-user-fs device-end support for the virtio-fs crash
reconnection, mainly the vhost-user callbacks. The VhostUserFSPersist
structure is also added to save the virtiofsd status at QEMU-side:

    typedef struct {
        bool need_restore;

        /* for persistent of lo_maps */
        VhostUserShm maps[MAP_TYPE_NUM];
        int map_fds[MAP_TYPE_NUM];

        /* for persistent of fds */
        GHashTable *fd_ht;
    } VhostUserFSPersist;

The fd_ht GHashTable is to save the opened file descriptors sent from
virtiofsd, the maps and map_fds are to save the shared memory related
status sent from virtiofsd.

Signed-off-by: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 hw/virtio/vhost-user-fs.c         | 118 +++++++++++++++++++++++++++++-
 include/hw/virtio/vhost-user-fs.h |  14 +++-
 2 files changed, 130 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index ce343101d4..a4f58821b3 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -72,6 +72,18 @@ static int vuf_start(VirtIODevice *vdev)
         }
     }
 
+    ret = vhost_dev_set_shm(&fs->vhost_dev);
+    if (ret < 0) {
+        error_report("Error set fs maps: %d", -ret);
+        goto err_guest_notifiers;
+    }
+
+    ret = vhost_dev_set_fd(&fs->vhost_dev);
+    if (ret < 0) {
+        error_report("Error set fs proc fds: %d", -ret);
+        goto err_guest_notifiers;
+    }
+
     ret = vhost_dev_set_inflight(&fs->vhost_dev, fs->inflight);
     if (ret < 0) {
         error_report("Error set inflight: %d", -ret);
@@ -220,6 +232,102 @@ static void vuf_reset(VirtIODevice *vdev)
     vhost_dev_free_inflight(fs->inflight);
 }
 
+static int vhost_user_fs_persist_map(struct vhost_dev *dev,
+                                     struct VhostUserShm *shm, int fd)
+{
+    VHostUserFS *fs = container_of(dev, VHostUserFS, vhost_dev);
+    VhostUserFSPersist *persist = &fs->persist;
+
+    if (persist->map_fds[shm->id] != -1) {
+        close(persist->map_fds[shm->id]);
+    }
+
+    persist->need_restore = true;
+    memcpy(&persist->maps[shm->id], shm, sizeof(VhostUserShm));
+    persist->map_fds[shm->id] = dup(fd);
+
+    return 0;
+}
+
+static int vhost_user_fs_map_info(struct vhost_dev *dev, int id,
+                                  uint64_t *size, uint64_t *offset,
+                                  int *memfd)
+{
+    if (!dev) {
+        return -1;
+    }
+
+    if (id >= MAP_TYPE_NUM) {
+        return -1;
+    }
+
+    VHostUserFS *fs = container_of(dev, VHostUserFS, vhost_dev);
+    VhostUserFSPersist *persist = &fs->persist;
+    if (!persist->need_restore || (persist->map_fds[id] == -1)) {
+        return -1;
+    }
+
+    *size = persist->maps[id].size;
+    *offset = persist->maps[id].offset;
+    *memfd = persist->map_fds[id];
+
+    return 0;
+}
+
+static int vhost_user_fs_persist_fd(struct vhost_dev *dev,
+                                    struct VhostUserFd *fdinfo, int fd)
+{
+    VHostUserFS *fs = container_of(dev, VHostUserFS, vhost_dev);
+    VhostUserFSPersist *persist = &fs->persist;
+
+    persist->need_restore = true;
+
+    if (fdinfo->flag == VU_FD_FLAG_ADD) {
+        assert(persist->fd_ht != NULL);
+        int newfd = dup(fd);
+        g_hash_table_insert(persist->fd_ht, GINT_TO_POINTER(fdinfo->key),
+                                                    GINT_TO_POINTER(newfd));
+    } else if (fdinfo->flag == VU_FD_FLAG_DEL) {
+        gpointer fd_p = g_hash_table_lookup(persist->fd_ht,
+                                            GINT_TO_POINTER(fdinfo->key));
+        if (fd_p != NULL) {
+            int fd = GPOINTER_TO_INT(fd_p);
+            close(fd);
+            g_hash_table_remove(persist->fd_ht,
+                                        GINT_TO_POINTER(fdinfo->key));
+        }
+    }
+
+    return 0;
+}
+
+static int vhost_user_fs_fd_info(struct vhost_dev *dev, GHashTable **fd_ht_p)
+{
+    if (!dev) {
+        return -1;
+    }
+
+    VHostUserFS *fs = container_of(dev, VHostUserFS, vhost_dev);
+    VhostUserFSPersist *persist = &fs->persist;
+    if (!persist->need_restore) {
+        return -1;
+    }
+
+    *fd_ht_p = persist->fd_ht;
+    return 0;
+}
+
+
+const VhostDevShmOps fs_shm_ops = {
+        .vhost_dev_slave_shm = vhost_user_fs_persist_map,
+        .vhost_dev_shm_info = vhost_user_fs_map_info,
+};
+
+const VhostDevFdOps fs_fd_ops = {
+        .vhost_dev_slave_fd = vhost_user_fs_persist_fd,
+        .vhost_dev_fd_info = vhost_user_fs_fd_info,
+};
+
 static int vuf_connect(DeviceState *dev)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -242,6 +350,9 @@ static int vuf_connect(DeviceState *dev)
         return ret;
     }
 
+    vhost_dev_set_shm_ops(&fs->vhost_dev, &fs_shm_ops);
+    vhost_dev_set_fd_ops(&fs->vhost_dev, &fs_fd_ops);
+
     /* restore vhost state */
     if (vdev->started) {
         ret = vuf_start(vdev);
@@ -380,7 +491,11 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
     /* init reconnection related variables */
     fs->inflight = g_new0(struct vhost_inflight, 1);
     fs->connected = false;
-
+    fs->persist.need_restore = false;
+    for (i = 0; i < MAP_TYPE_NUM; i++) {
+        fs->persist.map_fds[i] = -1;
+    }
+    fs->persist.fd_ht = g_hash_table_new(NULL, NULL);
     qemu_chr_fe_set_handlers(&fs->conf.chardev,  NULL, NULL, vuf_event,
                                  NULL, (void *)dev, NULL, true);
 
@@ -440,6 +555,7 @@ static void vuf_device_unrealize(DeviceState *dev)
     fs->vhost_dev.vqs = NULL;
     g_free(fs->inflight);
     fs->inflight = NULL;
+    g_hash_table_destroy(fs->persist.fd_ht);
 }
 
 static const VMStateDescription vuf_vmstate = {
diff --git a/include/hw/virtio/vhost-user-fs.h b/include/hw/virtio/vhost-user-fs.h
index 9ef47568e7..c2b77ffc53 100644
--- a/include/hw/virtio/vhost-user-fs.h
+++ b/include/hw/virtio/vhost-user-fs.h
@@ -30,6 +30,18 @@ typedef struct {
     uint16_t queue_size;
 } VHostUserFSConf;
 
+#define MAP_TYPE_NUM 3
+typedef struct {
+    bool need_restore;
+
+    /* for persistent of lo_maps */
+    VhostUserShm maps[MAP_TYPE_NUM];
+    int map_fds[MAP_TYPE_NUM];
+
+    /* for persistent of fds */
+    GHashTable *fd_ht;
+} VhostUserFSPersist;
+
 struct VHostUserFS {
     /*< private >*/
     VirtIODevice parent;
@@ -41,7 +53,7 @@ struct VHostUserFS {
     VirtQueue *hiprio_vq;
     struct vhost_inflight *inflight;
     bool connected;
-
+    VhostUserFSPersist persist;
     /*< public >*/
 };
 
-- 
2.20.1


