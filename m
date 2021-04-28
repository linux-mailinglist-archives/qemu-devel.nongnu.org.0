Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586B736D625
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:11:19 +0200 (CEST)
Received: from localhost ([::1]:50492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbi6A-0006Dg-FR
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhwn-00063d-Mf
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:01:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhwl-0004xq-K1
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZsIubKkscOkYRtVZDP8h2iieOrBYRcPrJcS/17jYeLU=;
 b=gtGUb2/r9GV1WzpVUnU+ABV421Yp/5sp7bxlIKMTysVAodl79D+3UxB0E9DAL7RCduiO2q
 yffg0dIOydQ7j6y+s8XKUwXxSmSYZ+FWWqr4TkfPxY6yxRvH1w7IWm70Uv7RN7VfaZloLK
 jjrDyCp1yl/qteU+I0IFuwTs7Yo7ig0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-4Ma5by0ZM7OjMB5OAOaXCQ-1; Wed, 28 Apr 2021 07:01:32 -0400
X-MC-Unique: 4Ma5by0ZM7OjMB5OAOaXCQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ACC2803635;
 Wed, 28 Apr 2021 11:01:32 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-35.ams2.redhat.com
 [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B28B81001B2C;
 Wed, 28 Apr 2021 11:01:30 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 groug@kaod.org
Subject: [PATCH v3 06/26] DAX subprojects/libvhost-user: Add virtio-fs slave
 types
Date: Wed, 28 Apr 2021 12:00:40 +0100
Message-Id: <20210428110100.27757-7-dgilbert@redhat.com>
In-Reply-To: <20210428110100.27757-1-dgilbert@redhat.com>
References: <20210428110100.27757-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: virtio-fs@redhat.com
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


