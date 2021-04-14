Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2861B35F84B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 17:59:11 +0200 (CEST)
Received: from localhost ([::1]:39572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWhv4-0004qR-7U
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 11:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWho6-0007nL-CG
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:51:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWho0-0000Ky-N8
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618415512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZsIubKkscOkYRtVZDP8h2iieOrBYRcPrJcS/17jYeLU=;
 b=aoehnxVfFboax3sGmI3f7jVzyzWEZ+ORKcCikuR9MIJ+fCdxE0+eowhLSmDV6iuO3jqdZ/
 Zr+s4hf4VZWJVOFr2RNyqSDcqpV+NvIrgZrb4y3CpuaqNX+bmirqNmI0q8DQDpEqs/3tVh
 nMapEw8ArO7qXK7Ey6t5W2WMKbzWoBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-1rEk8KXTMlCU6VXv2th-Sw-1; Wed, 14 Apr 2021 11:51:50 -0400
X-MC-Unique: 1rEk8KXTMlCU6VXv2th-Sw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 897971074643
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 15:51:49 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-158.ams2.redhat.com
 [10.36.115.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BADA610A8;
 Wed, 14 Apr 2021 15:51:47 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 virtio-fs@redhat.com
Subject: [PATCH v2 05/25] DAX subprojects/libvhost-user: Add virtio-fs slave
 types
Date: Wed, 14 Apr 2021 16:51:17 +0100
Message-Id: <20210414155137.46522-6-dgilbert@redhat.com>
In-Reply-To: <20210414155137.46522-1-dgilbert@redhat.com>
References: <20210414155137.46522-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 48 +++++++++++++++++++++++
 subprojects/libvhost-user/libvhost-user.h | 40 +++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 68eb165755..97c909c6a8 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -2918,3 +2918,51 @@ vu_queue_push(VuDev *dev, VuVirtq *vq,
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
+        .payload.fs = *fsm,
+    };
+
+    if (fsm->count > VHOST_USER_FS_SLAVE_MAX_ENTRIES) {
+        return -EINVAL;
+    }
+
+    vmsg.size = sizeof(VhostUserFSSlaveMsg) +
+                fsm->count * sizeof(VhostUserFSSlaveMsgEntry);
+    memcpy(&vmsg.payload.fs, fsm, vmsg.size);
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
index 330b61c005..70fc61171f 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -122,6 +122,33 @@ typedef enum VhostUserSlaveRequest {
     VHOST_USER_SLAVE_MAX
 }  VhostUserSlaveRequest;
 
+/* Structures carried over the slave channel back to QEMU */
+#define VHOST_USER_FS_SLAVE_MAX_ENTRIES 32
+
+/* For the flags field of VhostUserFSSlaveMsg */
+#define VHOST_USER_FS_FLAG_MAP_R (1u << 0)
+#define VHOST_USER_FS_FLAG_MAP_W (1u << 1)
+
+typedef struct {
+    /* Offsets within the file being mapped */
+    uint64_t fd_offset;
+    /* Offsets within the cache */
+    uint64_t c_offset;
+    /* Lengths of sections */
+    uint64_t len;
+    /* Flags, from VHOST_USER_FS_FLAG_* */
+    uint64_t flags;
+} VhostUserFSSlaveMsgEntry;
+
+typedef struct {
+    /* Number of entries */
+    uint16_t count;
+    /* Spare */
+    uint16_t align;
+
+    VhostUserFSSlaveMsgEntry entries[];
+} VhostUserFSSlaveMsg;
+
 typedef struct VhostUserMemoryRegion {
     uint64_t guest_phys_addr;
     uint64_t memory_size;
@@ -197,6 +224,7 @@ typedef struct VhostUserMsg {
         VhostUserConfig config;
         VhostUserVringArea area;
         VhostUserInflight inflight;
+        VhostUserFSSlaveMsg fs;
     } payload;
 
     int fds[VHOST_MEMORY_BASELINE_NREGIONS];
@@ -693,4 +721,16 @@ void vu_queue_get_avail_bytes(VuDev *vdev, VuVirtq *vq, unsigned int *in_bytes,
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
2.31.1


