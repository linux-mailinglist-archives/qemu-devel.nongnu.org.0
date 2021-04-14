Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEA135F8B4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:12:12 +0200 (CEST)
Received: from localhost ([::1]:36578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWi7f-0007Vr-4m
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoF-0008Ay-Ei
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWhoD-0000Oa-B6
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618415524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T1Lp37nDTzxhktVKNAkCVWkDxTs+dX1WDirPBWT9+1Q=;
 b=a/lUcNaF4C4JtOJUJexFIs8yJAdjVl6J13xOxwokQnVt4mNGv71QH91m/iXk8J7l39Mchg
 nVZaWkO5EpQSLzgL8yBgv0f7P2eymVa9rcqNHktHgQf+nazDEITbjM4kQU8vZfSojGbBvJ
 kunvJc4gwOE+ganFj7Iwmvj6EspoHrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-AdOgLyivMHCU_YZA69Mz4Q-1; Wed, 14 Apr 2021 11:52:02 -0400
X-MC-Unique: AdOgLyivMHCU_YZA69Mz4Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A14AE1007293
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 15:52:01 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-158.ams2.redhat.com
 [10.36.115.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 950E2610A8;
 Wed, 14 Apr 2021 15:52:00 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 virtio-fs@redhat.com
Subject: [PATCH v2 13/25] DAX: virtiofsd: Wire up passthrough_ll's
 lo_setupmapping
Date: Wed, 14 Apr 2021 16:51:25 +0100
Message-Id: <20210414155137.46522-14-dgilbert@redhat.com>
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

Wire up passthrough_ll's setupmapping to allocate, send to virtio
and then reply OK.

Guest might not pass file pointer. In that case using inode info, open
the file again, mmap() and close fd.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
With fix from:
Signed-off-by: Fotis Xenakis <foxen@windowslive.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c  | 13 ++++++--
 tools/virtiofsd/passthrough_ll.c | 57 ++++++++++++++++++++++++++++++--
 2 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 1a00307879..81c4c2b373 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1899,8 +1899,17 @@ static void do_setupmapping(fuse_req_t req, fuse_ino_t nodeid,
     }
 
     if (req->se->op.setupmapping) {
-        req->se->op.setupmapping(req, nodeid, arg->foffset, arg->len,
-                                 arg->moffset, genflags, &fi);
+        /*
+         * TODO: Add a flag to request which tells if arg->fh is
+         * valid or not.
+         */
+        if (fi.fh == (uint64_t)-1) {
+            req->se->op.setupmapping(req, nodeid, arg->foffset, arg->len,
+                                     arg->moffset, genflags, NULL);
+        } else {
+            req->se->op.setupmapping(req, nodeid, arg->foffset, arg->len,
+                                     arg->moffset, genflags, &fi);
+        }
     } else {
         fuse_reply_err(req, ENOSYS);
     }
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index afa86650c1..bf7a7f3c23 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3148,8 +3148,61 @@ static void lo_setupmapping(fuse_req_t req, fuse_ino_t ino, uint64_t foffset,
                             uint64_t len, uint64_t moffset, uint64_t flags,
                             struct fuse_file_info *fi)
 {
-    /* TODO */
-    fuse_reply_err(req, ENOSYS);
+    struct lo_data *lo = lo_data(req);
+    int ret = 0, fd;
+    VhostUserFSSlaveMsg *msg = g_malloc0(sizeof(VhostUserFSSlaveMsg) +
+                                         sizeof(VhostUserFSSlaveMsgEntry));
+    uint64_t vhu_flags;
+    char *buf;
+    bool writable = flags & O_RDWR;
+
+    fuse_log(FUSE_LOG_DEBUG,
+             "lo_setupmapping(ino=%" PRIu64 ", fi=0x%p,"
+             " foffset=%" PRIu64 ", len=%" PRIu64 ", moffset=%" PRIu64
+             ", flags=%" PRIu64 ")\n",
+             ino, (void *)fi, foffset, len, moffset, flags);
+
+    vhu_flags = VHOST_USER_FS_FLAG_MAP_R;
+    if (writable) {
+        vhu_flags |= VHOST_USER_FS_FLAG_MAP_W;
+    }
+
+    msg->count = 1;
+    msg->entries[0].fd_offset = foffset;
+    msg->entries[0].len = len;
+    msg->entries[0].c_offset = moffset;
+    msg->entries[0].flags = vhu_flags;
+
+    if (fi) {
+        fd = lo_fi_fd(req, fi);
+    } else {
+        ret = asprintf(&buf, "%i", lo_fd(req, ino));
+        if (ret == -1) {
+            g_free(msg);
+            return (void)fuse_reply_err(req, errno);
+        }
+
+        fd = openat(lo->proc_self_fd, buf, flags);
+        free(buf);
+        if (fd == -1) {
+            g_free(msg);
+            return (void)fuse_reply_err(req, errno);
+        }
+    }
+
+    ret = fuse_virtio_map(req, msg, fd);
+    if (ret < 0) {
+        fuse_log(FUSE_LOG_ERR,
+                 "%s: map over virtio failed (ino=%" PRId64
+                 "fd=%d moffset=0x%" PRIx64 "). err = %d\n",
+                 __func__, ino, fd, moffset, ret);
+    }
+
+    if (!fi) {
+        close(fd);
+    }
+    fuse_reply_err(req, -ret);
+    g_free(msg);
 }
 
 static void lo_removemapping(fuse_req_t req, struct fuse_session *se,
-- 
2.31.1


