Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA402DB14B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 17:25:41 +0100 (CET)
Received: from localhost ([::1]:59178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpD8u-0002zq-Sf
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 11:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1kpD5J-0006r3-NM
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:21:57 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:36701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1kpD5H-00038w-Od
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:21:57 -0500
Received: by mail-pj1-x1044.google.com with SMTP id l23so9175511pjg.1
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 08:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H52nasZ7BGuO7xuet/cKD9fD7bI69Ap/AdAM6/fVCZw=;
 b=NFIVQ3wJXi5NLtPFuJI2waRd/OCk6kjCZNMuCp/jtzS7y2g0Xu7FBO8jwFk7KJI3uK
 FtkNXy7GhedijGdnYi5DpB+1oa2HTsACMVa1LWIN27f2IaW0NxUd4VYwvz9WaWrziRbt
 +Rl1+jZuxvIbjbEovFxHYi4/XY/TU1NFzFlSZxnE9sW/tZboW1Qn6OUgVUIZDi3sLSUV
 fDyHP1LialgB6cLFdKKlKZzk39NHRUC0Z4BgYy/Vfi+Ec+ojTgE4JW3hyJMvOKfZfb2l
 zPjGNd7geimd3BGSXdMpAxH4BfBjjL4IrKfqddHp7aGfW1ziHEDaxm3oA12t5pHxgDUN
 WJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H52nasZ7BGuO7xuet/cKD9fD7bI69Ap/AdAM6/fVCZw=;
 b=lKvgWrkaCd/YozhdUPj4Ljghy/2clmDJFboGaVdD03d3aIKHb1Wz4tnZtKkSBmLnP9
 naY0pDqz4PxeOwo1pV5olsGa4gu4pgO3iKeZEw+/cvLXCjBfDTjAaPHrLA4ukmiE0Uh1
 wq6zdZn7GUn39OmBRXYnWYJonH+5zfIRp1g9cSH6YqSjAkbVK2sswJAzNJi7tqA7pEBH
 QPZxKXBumiP3SQIBUcKXOaTi7l/0IHYMoUTo4qzQx5FDV/y+OXeyTXki1wrC3JMvKVrw
 1gO+LJ1Le7LA4eaIL+TVxjVHzkRmsqPEnLs1DLrKvbCF9egspzYXGCXsyN1aLzabMdmp
 bqEA==
X-Gm-Message-State: AOAM533F9KjVHmCYLOr5NwP0E8dmBoSBV3gFl6U5mkJBFqXh8CKFevbo
 8lUMJcoF3ucj2jEBXtzEb5kLETld2hcx2gQz
X-Google-Smtp-Source: ABdhPJwHjKZdxBN1tR5swHvZ8BreITVwQSJDsfEeEI+G27qm3gjiG0sTgPSejH5FZ0HifHFbQALMxw==
X-Received: by 2002:a17:902:bc49:b029:db:eb10:c5a1 with SMTP id
 t9-20020a170902bc49b02900dbeb10c5a1mr1991584plz.11.1608049314300; 
 Tue, 15 Dec 2020 08:21:54 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.246])
 by smtp.gmail.com with ESMTPSA id c10sm24273508pfo.159.2020.12.15.08.21.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Dec 2020 08:21:53 -0800 (PST)
From: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
To: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xie Yongji <xieyongji@bytedance.com>
Subject: [RFC PATCH 4/9] libvhost-user: Add vhost-user message types for
 sending shared memory and file fds
Date: Wed, 16 Dec 2020 00:21:14 +0800
Message-Id: <20201215162119.27360-5-zhangjiachen.jaycee@bytedance.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=zhangjiachen.jaycee@bytedance.com;
 helo=mail-pj1-x1044.google.com
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

Add libvhost-user support for the 4 new vhost-user messages types:

    VHOST_USER_SET_SHM
    VHOST_USER_SET_FD
    VHOST_USER_SLAVE_SHM
    VHOST_USER_SLAVE_FD

Signed-off-by: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 contrib/libvhost-user/libvhost-user.c | 88 +++++++++++++++++++++++++++
 contrib/libvhost-user/libvhost-user.h | 70 +++++++++++++++++++++
 2 files changed, 158 insertions(+)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
index bfec8a881a..8c97013e59 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -140,6 +140,8 @@ vu_request_to_string(unsigned int req)
         REQ(VHOST_USER_ADD_MEM_REG),
         REQ(VHOST_USER_REM_MEM_REG),
         REQ(VHOST_USER_MAX),
+        REQ(VHOST_USER_SET_SHM),
+        REQ(VHOST_USER_SET_FD),
     };
 #undef REQ
 
@@ -1718,6 +1720,77 @@ vu_set_inflight_fd(VuDev *dev, VhostUserMsg *vmsg)
     return false;
 }
 
+bool vu_slave_send_shm(VuDev *dev, int memfd, uint64_t size, int map_type)
+{
+    VhostUserMsg vmsg = {
+        .request = VHOST_USER_SLAVE_SHM,
+        .flags = VHOST_USER_VERSION,
+        .size = sizeof(VhostUserShm),
+        .payload.shm = {
+            .id = map_type,
+            .size = size,
+            .offset = 0,
+        },
+    };
+
+    vmsg.fd_num = 1;
+    vmsg.fds[0] = memfd;
+
+    if (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD)) {
+        return false;
+    }
+
+    pthread_mutex_lock(&dev->slave_mutex);
+    if (!vu_message_write(dev, dev->slave_fd, &vmsg)) {
+        pthread_mutex_unlock(&dev->slave_mutex);
+        return false;
+    }
+
+    /* Also unlocks the slave_mutex */
+    return vu_process_message_reply(dev, &vmsg);
+}
+
+static bool vu_slave_send_fd(VuDev *dev, int fd, int fd_key, int flag)
+{
+    VhostUserMsg vmsg = {
+        .request = VHOST_USER_SLAVE_FD,
+        .flags = VHOST_USER_VERSION,
+        .size = sizeof(vmsg.payload.fdinfo),
+    };
+
+    vmsg.payload.fdinfo.key = fd_key;
+    vmsg.payload.fdinfo.flag = flag;
+    if (flag == VU_FD_FLAG_ADD) {
+        vmsg.fds[0] = fd;
+    }
+    vmsg.fd_num = 1;
+
+    if (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD)) {
+        return false;
+    }
+
+    pthread_mutex_lock(&dev->slave_mutex);
+    if (!vu_message_write(dev, dev->slave_fd, &vmsg)) {
+        pthread_mutex_unlock(&dev->slave_mutex);
+        return false;
+    }
+
+    /* Also unlocks the slave_mutex */
+    bool ret =
+    vu_process_message_reply(dev, &vmsg);
+    return ret;
+}
+
+bool vu_slave_send_fd_add(VuDev *dev, int fd, int fd_key)
+{
+    return vu_slave_send_fd(dev, fd, fd_key, VU_FD_FLAG_ADD);
+}
+
+bool vu_slave_send_fd_del(VuDev *dev, int fd_key)
+{
+    return vu_slave_send_fd(dev, -1, fd_key, VU_FD_FLAG_DEL);
+}
+
 static bool
 vu_handle_vring_kick(VuDev *dev, VhostUserMsg *vmsg)
 {
@@ -1762,6 +1835,9 @@ static bool vu_handle_get_max_memslots(VuDev *dev, VhostUserMsg *vmsg)
     return false;
 }
 
+bool (*vu_set_shm_cb)(VuDev *dev, VhostUserMsg *vmsg);
+bool (*vu_set_fd_cb)(VuDev *dev, VhostUserMsg *vmsg);
+
 static bool
 vu_process_message(VuDev *dev, VhostUserMsg *vmsg)
 {
@@ -1852,6 +1928,18 @@ vu_process_message(VuDev *dev, VhostUserMsg *vmsg)
         return vu_add_mem_reg(dev, vmsg);
     case VHOST_USER_REM_MEM_REG:
         return vu_rem_mem_reg(dev, vmsg);
+    case VHOST_USER_SET_SHM:
+        if (vu_set_shm_cb) {
+            return vu_set_shm_cb(dev, vmsg);
+        } else  {
+            return false;
+        }
+    case VHOST_USER_SET_FD:
+        if (vu_set_fd_cb) {
+            return vu_set_fd_cb(dev, vmsg);
+        } else  {
+            return false;
+        }
     default:
         vmsg_close_fds(vmsg);
         vu_panic(dev, "Unhandled request: %d", vmsg->request);
diff --git a/contrib/libvhost-user/libvhost-user.h b/contrib/libvhost-user/libvhost-user.h
index a1539dbb69..5448dc5818 100644
--- a/contrib/libvhost-user/libvhost-user.h
+++ b/contrib/libvhost-user/libvhost-user.h
@@ -64,6 +64,7 @@ enum VhostUserProtocolFeature {
     VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
     VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
     VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
+    VHOST_USER_PROTOCOL_F_MAP_SHMFD = 17,
 
     VHOST_USER_PROTOCOL_F_MAX
 };
@@ -109,6 +110,8 @@ typedef enum VhostUserRequest {
     VHOST_USER_GET_MAX_MEM_SLOTS = 36,
     VHOST_USER_ADD_MEM_REG = 37,
     VHOST_USER_REM_MEM_REG = 38,
+    VHOST_USER_SET_SHM = 41,
+    VHOST_USER_SET_FD = 42,
     VHOST_USER_MAX
 } VhostUserRequest;
 
@@ -119,6 +122,8 @@ typedef enum VhostUserSlaveRequest {
     VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG = 3,
     VHOST_USER_SLAVE_VRING_CALL = 4,
     VHOST_USER_SLAVE_VRING_ERR = 5,
+    VHOST_USER_SLAVE_SHM = 6,
+    VHOST_USER_SLAVE_FD = 7,
     VHOST_USER_SLAVE_MAX
 }  VhostUserSlaveRequest;
 
@@ -170,6 +175,29 @@ typedef struct VhostUserInflight {
     uint16_t queue_size;
 } VhostUserInflight;
 
+#ifndef VU_PERSIST_STRUCTS
+#define VU_PERSIST_STRUCTS
+
+typedef struct VhostUserShm {
+    int id;
+    uint64_t size;
+    uint64_t offset;
+} VhostUserShm;
+
+typedef enum VhostUserFdFlag {
+    VU_FD_FLAG_ADD = 0,
+    VU_FD_FLAG_DEL = 1,
+    VU_FD_FLAG_RESTORE = 2,
+    VU_FD_FLAG_MAX
+} VhostUserFdFlag;
+
+typedef struct VhostUserFd {
+    int key;
+    VhostUserFdFlag flag;
+} VhostUserFd;
+#endif
+
+
 #if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
 # define VU_PACKED __attribute__((gcc_struct, packed))
 #else
@@ -197,6 +225,8 @@ typedef struct VhostUserMsg {
         VhostUserConfig config;
         VhostUserVringArea area;
         VhostUserInflight inflight;
+        VhostUserShm shm;
+        VhostUserFd fdinfo;
     } payload;
 
     int fds[VHOST_MEMORY_BASELINE_NREGIONS];
@@ -687,4 +717,44 @@ void vu_queue_get_avail_bytes(VuDev *vdev, VuVirtq *vq, unsigned int *in_bytes,
 bool vu_queue_avail_bytes(VuDev *dev, VuVirtq *vq, unsigned int in_bytes,
                           unsigned int out_bytes);
 
+/**
+ * vu_slave_send_shm:
+ * @dev: a VuDev context
+ * @memfd: the shared memory fd to sync with QEMU
+ * @size: shared memory lenth
+ * @map_type: the lo_map type number
+ *
+ * Sync the map_type region that shared with QEMU when memfd or its size
+ * is changed.
+ *
+ * Returns: true on success.
+ */
+bool vu_slave_send_shm(VuDev *dev, int memfd, uint64_t size, int map_type);
+
+/**
+ * vu_slave_send_fd_add:
+ * @dev: a VuDev context
+ * @fd: the fd to send to QEMU
+ * @fd_key: the fingerprint of the fd
+ *
+ * Send a opened file fd to QEMU.
+ *
+ * Returns: true on success.
+ */
+bool vu_slave_send_fd_add(VuDev *dev, int fd, int fd_key);
+
+/**
+ * vu_slave_send_fd_del:
+ * @dev: a VuDev context
+ * @fd_key: the fingerprint of the fd
+ *
+ * Remove a file fd from QEMU.
+ *
+ * Returns: true on success.
+ */
+bool vu_slave_send_fd_del(VuDev *dev, int fd_key);
+
+extern bool (*vu_set_shm_cb)(VuDev *dev, VhostUserMsg *vmsg);
+extern bool (*vu_set_fd_cb)(VuDev *dev, VhostUserMsg *vmsg);
+
 #endif /* LIBVHOST_USER_H */
-- 
2.20.1


