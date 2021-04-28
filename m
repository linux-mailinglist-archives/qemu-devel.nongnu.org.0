Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EBE36D622
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:11:11 +0200 (CEST)
Received: from localhost ([::1]:50182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbi62-00065o-SY
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhx7-0006KF-8T
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:01:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhx2-00053t-JR
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ljfo4oko6rykN3ZDh9ZJHLBPXCNPDpGtckcWAS6rmbk=;
 b=C422kcKOq42eDt0zqW8NNJdz+Bz8CnV17TijMz/6Lr9DhxXzIsXWRQ0TQX+BuE1kR4/5p6
 BMFj+ztZhxufw7GAtncq5LBiXYZi/d0SQLXk/1ZjcZRCb4rH/30XMzlyxpwhCGD7ewFgN8
 xyHerBA509K7omYgeR9Up9b4KY7PspY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-9LmE-bY5NYCbW9nFE0yt-A-1; Wed, 28 Apr 2021 07:01:49 -0400
X-MC-Unique: 9LmE-bY5NYCbW9nFE0yt-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D40D80B71B;
 Wed, 28 Apr 2021 11:01:48 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-35.ams2.redhat.com
 [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFF1610190A7;
 Wed, 28 Apr 2021 11:01:39 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 groug@kaod.org
Subject: [PATCH v3 10/26] DAX: virtio-fs: Fill in slave commands for mapping
Date: Wed, 28 Apr 2021 12:00:44 +0100
Message-Id: <20210428110100.27757-11-dgilbert@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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

Fill in definitions for map, unmap and sync commands.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
with fix by misono.tomohiro@fujitsu.com
---
 hw/virtio/vhost-user-fs.c | 117 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 113 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 169a146e72..963f694435 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -92,23 +92,132 @@ static bool check_slave_message_entries(const VhostUserFSSlaveMsg *sm,
 uint64_t vhost_user_fs_slave_map(struct vhost_dev *dev, int message_size,
                                  VhostUserFSSlaveMsg *sm, int fd)
 {
+    VHostUserFS *fs = (VHostUserFS *)object_dynamic_cast(OBJECT(dev->vdev),
+                          TYPE_VHOST_USER_FS);
+    if (!fs) {
+        error_report("%s: Bad fs ptr", __func__);
+        return (uint64_t)-1;
+    }
     if (!check_slave_message_entries(sm, message_size)) {
         return (uint64_t)-1;
     }
 
-    /* TODO */
-    return (uint64_t)-1;
+    size_t cache_size = fs->conf.cache_size;
+    if (!cache_size) {
+        error_report("map called when DAX cache not present");
+        return (uint64_t)-1;
+    }
+    void *cache_host = memory_region_get_ram_ptr(&fs->cache);
+
+    unsigned int i;
+    int res = 0;
+
+    if (fd < 0) {
+        error_report("Bad fd for map");
+        return (uint64_t)-1;
+    }
+
+    for (i = 0; i < sm->count; i++) {
+        VhostUserFSSlaveMsgEntry *e = &sm->entries[i];
+        if (e->len == 0) {
+            continue;
+        }
+
+        if ((e->c_offset + e->len) < e->len ||
+            (e->c_offset + e->len) > cache_size) {
+            error_report("Bad offset/len for map [%d] %" PRIx64 "+%" PRIx64,
+                         i, e->c_offset, e->len);
+            res = -1;
+            break;
+        }
+
+        if (mmap(cache_host + e->c_offset, e->len,
+                 ((e->flags & VHOST_USER_FS_FLAG_MAP_R) ? PROT_READ : 0) |
+                 ((e->flags & VHOST_USER_FS_FLAG_MAP_W) ? PROT_WRITE : 0),
+                 MAP_SHARED | MAP_FIXED,
+                 fd, e->fd_offset) != (cache_host + e->c_offset)) {
+            res = -errno;
+            error_report("map failed err %d [%d] %" PRIx64 "+%" PRIx64 " from %"
+                         PRIx64, errno, i, e->c_offset, e->len,
+                         e->fd_offset);
+            break;
+        }
+    }
+
+    if (res) {
+        /* Something went wrong, unmap them all */
+        vhost_user_fs_slave_unmap(dev, message_size, sm);
+    }
+    return (uint64_t)res;
 }
 
 uint64_t vhost_user_fs_slave_unmap(struct vhost_dev *dev, int message_size,
                                    VhostUserFSSlaveMsg *sm)
 {
+    VHostUserFS *fs = (VHostUserFS *)object_dynamic_cast(OBJECT(dev->vdev),
+                          TYPE_VHOST_USER_FS);
+    if (!fs) {
+        error_report("%s: Bad fs ptr", __func__);
+        return (uint64_t)-1;
+    }
     if (!check_slave_message_entries(sm, message_size)) {
         return (uint64_t)-1;
     }
 
-    /* TODO */
-    return (uint64_t)-1;
+    size_t cache_size = fs->conf.cache_size;
+    if (!cache_size) {
+        /*
+         * Since dax cache is disabled, there should be no unmap request.
+         * Howerver we still receives whole range unmap request during umount
+         * for cleanup. Ignore it.
+         */
+        if (sm->entries[0].len == ~(uint64_t)0) {
+            return 0;
+        }
+
+        error_report("unmap called when DAX cache not present");
+        return (uint64_t)-1;
+    }
+    void *cache_host = memory_region_get_ram_ptr(&fs->cache);
+
+    unsigned int i;
+    int res = 0;
+
+    /*
+     * Note even if one unmap fails we try the rest, since the effect
+     * is to clean up as much as possible.
+     */
+    for (i = 0; i < sm->count; i++) {
+        VhostUserFSSlaveMsgEntry *e = &sm->entries[i];
+        void *ptr;
+        if (e->len == 0) {
+            continue;
+        }
+
+        if (e->len == ~(uint64_t)0) {
+            /* Special case meaning the whole arena */
+            e->len = cache_size;
+        }
+
+        if ((e->c_offset + e->len) < e->len ||
+            (e->c_offset + e->len) > cache_size) {
+            error_report("Bad offset/len for unmap [%d] %" PRIx64 "+%" PRIx64,
+                         i, e->c_offset, e->len);
+            res = -1;
+            continue;
+        }
+
+        ptr = mmap(cache_host + e->c_offset, e->len, DAX_WINDOW_PROT,
+                   MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
+        if (ptr != (cache_host + e->c_offset)) {
+            res = -errno;
+            error_report("mmap failed (%s) [%d] %" PRIx64 "+%" PRIx64 " from %"
+                         PRIx64 " res: %p", strerror(errno), i, e->c_offset,
+                         e->len, e->fd_offset, ptr);
+        }
+    }
+
+    return (uint64_t)res;
 }
 
 static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
-- 
2.31.1


