Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D6831568A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:12:01 +0100 (CET)
Received: from localhost ([::1]:58790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YQa-0008MS-N1
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YJR-0002xU-TB
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:04:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YJP-00022l-2x
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q2BHuaHwyAeHruEDsZi0dteCYPsHDGR868zs0c/yNDs=;
 b=XTlFaaybKN/5aP/xjcHZs6X52mmx6noB0ded8Pwvi1WNKN6dSdU1uZFcgbaSyds7+r0Ccy
 kxVkUpd9CMcvrYbmcrDfXSo25/ur/3FE8vajTceD4dL1/dr1qZfQ880jxgfgASIWljc8PQ
 HNdeZrnip+0fw1IbEpsVNc3ZpN5o3/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-poSY6VNJMXi4pe0pfFs2GQ-1; Tue, 09 Feb 2021 14:04:32 -0500
X-MC-Unique: poSY6VNJMXi4pe0pfFs2GQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F08D79EC7
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:04:31 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-66.ams2.redhat.com
 [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE7D860C04;
 Tue,  9 Feb 2021 19:04:26 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com
Subject: [PATCH 08/24] DAX: virtio-fs: Fill in slave commands for mapping
Date: Tue,  9 Feb 2021 19:02:08 +0000
Message-Id: <20210209190224.62827-9-dgilbert@redhat.com>
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

Fill in definitions for map, unmap and sync commands.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
with fix by misono.tomohiro@fujitsu.com
---
 hw/virtio/vhost-user-fs.c | 115 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 111 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index 78401d2ff1..5f2fca4d82 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -37,15 +37,122 @@
 uint64_t vhost_user_fs_slave_map(struct vhost_dev *dev, VhostUserFSSlaveMsg *sm,
                                  int fd)
 {
-    /* TODO */
-    return (uint64_t)-1;
+    VHostUserFS *fs = VHOST_USER_FS(dev->vdev);
+    if (!fs) {
+        /* Shouldn't happen - but seen on error path */
+        error_report("Bad fs ptr");
+        return (uint64_t)-1;
+    }
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
+    for (i = 0; i < VHOST_USER_FS_SLAVE_ENTRIES; i++) {
+        if (sm->len[i] == 0) {
+            continue;
+        }
+
+        if ((sm->c_offset[i] + sm->len[i]) < sm->len[i] ||
+            (sm->c_offset[i] + sm->len[i]) > cache_size) {
+            error_report("Bad offset/len for map [%d] %" PRIx64 "+%" PRIx64,
+                         i, sm->c_offset[i], sm->len[i]);
+            res = -1;
+            break;
+        }
+
+        if (mmap(cache_host + sm->c_offset[i], sm->len[i],
+                 ((sm->flags[i] & VHOST_USER_FS_FLAG_MAP_R) ? PROT_READ : 0) |
+                 ((sm->flags[i] & VHOST_USER_FS_FLAG_MAP_W) ? PROT_WRITE : 0),
+                 MAP_SHARED | MAP_FIXED,
+                 fd, sm->fd_offset[i]) != (cache_host + sm->c_offset[i])) {
+            res = -errno;
+            error_report("map failed err %d [%d] %" PRIx64 "+%" PRIx64 " from %"
+                         PRIx64, errno, i, sm->c_offset[i], sm->len[i],
+                         sm->fd_offset[i]);
+            break;
+        }
+    }
+
+    if (res) {
+        /* Something went wrong, unmap them all */
+        vhost_user_fs_slave_unmap(dev, sm);
+    }
+    return (uint64_t)res;
 }
 
 uint64_t vhost_user_fs_slave_unmap(struct vhost_dev *dev,
                                    VhostUserFSSlaveMsg *sm)
 {
-    /* TODO */
-    return (uint64_t)-1;
+    VHostUserFS *fs = VHOST_USER_FS(dev->vdev);
+    if (!fs) {
+        /* Shouldn't happen - but seen on error path */
+        error_report("Bad fs ptr");
+        return (uint64_t)-1;
+    }
+    size_t cache_size = fs->conf.cache_size;
+    if (!cache_size) {
+        /*
+         * Since dax cache is disabled, there should be no unmap request.
+         * Howerver we still receives whole range unmap request during umount
+         * for cleanup. Ignore it.
+         */
+        if (sm->len[0] == ~(uint64_t)0) {
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
+    for (i = 0; i < VHOST_USER_FS_SLAVE_ENTRIES; i++) {
+        void *ptr;
+        if (sm->len[i] == 0) {
+            continue;
+        }
+
+        if (sm->len[i] == ~(uint64_t)0) {
+            /* Special case meaning the whole arena */
+            sm->len[i] = cache_size;
+        }
+
+        if ((sm->c_offset[i] + sm->len[i]) < sm->len[i] ||
+            (sm->c_offset[i] + sm->len[i]) > cache_size) {
+            error_report("Bad offset/len for unmap [%d] %" PRIx64 "+%" PRIx64,
+                         i, sm->c_offset[i], sm->len[i]);
+            res = -1;
+            continue;
+        }
+
+        ptr = mmap(cache_host + sm->c_offset[i], sm->len[i], DAX_WINDOW_PROT,
+                   MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
+        if (ptr != (cache_host + sm->c_offset[i])) {
+            res = -errno;
+            error_report("mmap failed (%s) [%d] %" PRIx64 "+%" PRIx64 " from %"
+                         PRIx64 " res: %p", strerror(errno), i, sm->c_offset[i],
+                         sm->len[i], sm->fd_offset[i], ptr);
+        }
+    }
+
+    return (uint64_t)res;
 }
 
 static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
-- 
2.29.2


