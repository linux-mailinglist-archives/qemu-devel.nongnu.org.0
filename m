Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5467031567E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:08:01 +0100 (CET)
Received: from localhost ([::1]:49714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YMi-0004Vu-C1
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YIg-0002cD-Tc
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:03:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YIc-0001qp-SZ
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:03:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6i+5rOwQonBwdlwGosx6D2J44wHzpwaETs+74bPCtRI=;
 b=VB/VxoMJl1srefF396r3w3mHXnlcczomIMjhpnz0iAwyP9pTYtdcdHjyUj9BYTG+Z3qIOt
 dCILvihQKzy61UsLx9hvGpU7NMUZnQ6G7dBIBJmmiPv0nrMdFi0mVRTgUWK7c4Rb8+FUHz
 bQY+4RqqVNBsiV8vCbBWPRrdd3obLXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-KZwOcblIMJyT-Ko1_t7dNw-1; Tue, 09 Feb 2021 14:03:41 -0500
X-MC-Unique: KZwOcblIMJyT-Ko1_t7dNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F83818A08BD
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:03:40 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-66.ams2.redhat.com
 [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34E1B60C04;
 Tue,  9 Feb 2021 19:03:06 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com
Subject: [PATCH 04/24] DAX subprojects/libvhost-user: Add virtio-fs slave types
Date: Tue,  9 Feb 2021 19:02:04 +0000
Message-Id: <20210209190224.62827-5-dgilbert@redhat.com>
In-Reply-To: <20210209190224.62827-1-dgilbert@redhat.com>
References: <20210209190224.62827-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Add virtio-fs definitions to libvhost-user

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 41 +++++++++++++++++++++++
 subprojects/libvhost-user/libvhost-user.h | 31 +++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 68eb165755..b35abdd9f9 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -2918,3 +2918,44 @@ vu_queue_push(VuDev *dev, VuVirtq *vq,
     vu_queue_flush(dev, vq, 1);
     vu_queue_inflight_post_put(dev, vq, elem->index);
 }
+
+int64_t vu_fs_cache_request(VuDev *dev, VhostUserSlaveRequest req, int fd,
+                            VhostUserFSSlaveMsg *fsm)
+{
+    int fd_num = 0;
+    bool res;
+    uint64_t payload = 0;
+    VhostUserMsg vmsg = {
+        .request = req,
+        .flags = VHOST_USER_VERSION | VHOST_USER_NEED_REPLY_MASK,
+        .size = sizeof(vmsg.payload.fs),
+        .payload.fs = *fsm,
+    };
+
+    if (fd != -1) {
+        vmsg.fds[fd_num++] = fd;
+    }
+
+    vmsg.fd_num = fd_num;
+
+    if (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD)) {
+        return -EINVAL;
+    }
+
+    pthread_mutex_lock(&dev->slave_mutex);
+    if (!vu_message_write(dev, dev->slave_fd, &vmsg)) {
+        pthread_mutex_unlock(&dev->slave_mutex);
+        return -EIO;
+    }
+
+    /* Also unlocks the slave_mutex */
+    res = vu_process_message_reply(dev, &vmsg, &payload);
+    if (!res) {
+        return -EIO;
+    }
+    /*
+     * Payload is delivered as uint64_t but is actually signed for
+     * errors.
+     */
+    return (int64_t)payload;
+}
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index 330b61c005..e12e9c1532 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -122,6 +122,24 @@ typedef enum VhostUserSlaveRequest {
     VHOST_USER_SLAVE_MAX
 }  VhostUserSlaveRequest;
 
+/* Structures carried over the slave channel back to QEMU */
+#define VHOST_USER_FS_SLAVE_ENTRIES 8
+
+/* For the flags field of VhostUserFSSlaveMsg */
+#define VHOST_USER_FS_FLAG_MAP_R (1ull << 0)
+#define VHOST_USER_FS_FLAG_MAP_W (1ull << 1)
+
+typedef struct {
+    /* Offsets within the file being mapped */
+    uint64_t fd_offset[VHOST_USER_FS_SLAVE_ENTRIES];
+    /* Offsets within the cache */
+    uint64_t c_offset[VHOST_USER_FS_SLAVE_ENTRIES];
+    /* Lengths of sections */
+    uint64_t len[VHOST_USER_FS_SLAVE_ENTRIES];
+    /* Flags, from VHOST_USER_FS_FLAG_* */
+    uint64_t flags[VHOST_USER_FS_SLAVE_ENTRIES];
+} VhostUserFSSlaveMsg;
+
 typedef struct VhostUserMemoryRegion {
     uint64_t guest_phys_addr;
     uint64_t memory_size;
@@ -197,6 +215,7 @@ typedef struct VhostUserMsg {
         VhostUserConfig config;
         VhostUserVringArea area;
         VhostUserInflight inflight;
+        VhostUserFSSlaveMsg fs;
     } payload;
 
     int fds[VHOST_MEMORY_BASELINE_NREGIONS];
@@ -693,4 +712,16 @@ void vu_queue_get_avail_bytes(VuDev *vdev, VuVirtq *vq, unsigned int *in_bytes,
 bool vu_queue_avail_bytes(VuDev *dev, VuVirtq *vq, unsigned int in_bytes,
                           unsigned int out_bytes);
 
+/**
+ * vu_fs_cache_request: Send a slave message for an fs client
+ * @dev: a VuDev context
+ * @req: The request type (map, unmap, sync)
+ * @fd: an fd (only required for map, else must be -1)
+ * @fsm: The body of the message
+ *
+ * Returns: 0 or above for success, nevative errno on error
+ */
+int64_t vu_fs_cache_request(VuDev *dev, VhostUserSlaveRequest req, int fd,
+                            VhostUserFSSlaveMsg *fsm);
+
 #endif /* LIBVHOST_USER_H */
-- 
2.29.2


