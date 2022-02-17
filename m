Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C04F4BA426
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 16:19:55 +0100 (CET)
Received: from localhost ([::1]:40886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKiZW-0003CV-IE
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 10:19:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKhnM-0001jJ-Kt
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:30:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKhnK-0000jl-CB
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645108205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aN1oLdKWIbE2rGnGc46vposcZVwilYw7QWpvyS9WwRI=;
 b=BdYeb9demxTHNnHl7w0myluPspHNmB7MjiM3kiOXmXMwipgL6DPVkF+KoQjZNY2L/feXgC
 lytQPsHRzxWY+Zl8bllw6Mjn1bojtjEP/Ly3CnF85RRU/kRGJG7NgvoLFD0mZoi/aqBdcv
 i3vHncQ7ba41ACCsa+JYPeiJOEhRjiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-9fcgwZC0Mmi9tJKlUg2U9A-1; Thu, 17 Feb 2022 09:30:02 -0500
X-MC-Unique: 9fcgwZC0Mmi9tJKlUg2U9A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E3CD801B0C;
 Thu, 17 Feb 2022 14:30:01 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.194.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03A87708CC;
 Thu, 17 Feb 2022 14:29:59 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, groug@kaod.org,
 sebastian.hasler@stuvus.uni-stuttgart.de
Subject: [PULL 12/12] virtiofsd: Add basic support for FUSE_SYNCFS request
Date: Thu, 17 Feb 2022 14:24:02 +0000
Message-Id: <20220217142402.52819-13-dgilbert@redhat.com>
In-Reply-To: <20220217142402.52819-1-dgilbert@redhat.com>
References: <20220217142402.52819-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, stefanha@redhat.com, slp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Honor the expected behavior of syncfs() to synchronously flush all data
and metadata to disk on linux systems.

If virtiofsd is started with '-o announce_submounts', the client is
expected to send a FUSE_SYNCFS request for each individual submount.
In this case, we just create a new file descriptor on the submount
inode with lo_inode_open(), call syncfs() on it and close it. The
intermediary file is needed because O_PATH descriptors aren't
backed by an actual file and syncfs() would fail with EBADF.

If virtiofsd is started without '-o announce_submounts' or if the
client doesn't have the FUSE_CAP_SUBMOUNTS capability, the client
only sends a single FUSE_SYNCFS request for the root inode. The
server would thus need to track submounts internally and call
syncfs() on each of them. This will be implemented later.

Note that syncfs() might suffer from a time penalty if the submounts
are being hammered by some unrelated workload on the host. The only
solution to prevent that is to avoid shared mounts.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20220215181529.164070-2-groug@kaod.org>
Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c       | 11 +++++++
 tools/virtiofsd/fuse_lowlevel.h       | 13 ++++++++
 tools/virtiofsd/passthrough_ll.c      | 44 +++++++++++++++++++++++++++
 tools/virtiofsd/passthrough_seccomp.c |  1 +
 4 files changed, 69 insertions(+)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 2909122b23..6a427caa3d 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1967,6 +1967,16 @@ static void do_lseek(fuse_req_t req, fuse_ino_t nodeid,
     }
 }
 
+static void do_syncfs(fuse_req_t req, fuse_ino_t nodeid,
+                      struct fuse_mbuf_iter *iter)
+{
+    if (req->se->op.syncfs) {
+        req->se->op.syncfs(req, nodeid);
+    } else {
+        fuse_reply_err(req, ENOSYS);
+    }
+}
+
 static void do_init(fuse_req_t req, fuse_ino_t nodeid,
                     struct fuse_mbuf_iter *iter)
 {
@@ -2398,6 +2408,7 @@ static struct {
     [FUSE_RENAME2] = { do_rename2, "RENAME2" },
     [FUSE_COPY_FILE_RANGE] = { do_copy_file_range, "COPY_FILE_RANGE" },
     [FUSE_LSEEK] = { do_lseek, "LSEEK" },
+    [FUSE_SYNCFS] = { do_syncfs, "SYNCFS" },
 };
 
 #define FUSE_MAXOP (sizeof(fuse_ll_ops) / sizeof(fuse_ll_ops[0]))
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
index c55c0ca2fc..b889dae4de 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -1226,6 +1226,19 @@ struct fuse_lowlevel_ops {
      */
     void (*lseek)(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
                   struct fuse_file_info *fi);
+
+    /**
+     * Synchronize file system content
+     *
+     * If this request is answered with an error code of ENOSYS,
+     * this is treated as success and future calls to syncfs() will
+     * succeed automatically without being sent to the filesystem
+     * process.
+     *
+     * @param req request handle
+     * @param ino the inode number
+     */
+    void (*syncfs)(fuse_req_t req, fuse_ino_t ino);
 };
 
 /**
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index f586df955a..9f6439c405 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3699,6 +3699,49 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
     }
 }
 
+static int lo_do_syncfs(struct lo_data *lo, struct lo_inode *inode)
+{
+    int fd, ret = 0;
+
+    fuse_log(FUSE_LOG_DEBUG, "lo_do_syncfs(ino=%" PRIu64 ")\n",
+             inode->fuse_ino);
+
+    fd = lo_inode_open(lo, inode, O_RDONLY);
+    if (fd < 0) {
+        return -fd;
+    }
+
+    if (syncfs(fd) < 0) {
+        ret = errno;
+    }
+
+    close(fd);
+    return ret;
+}
+
+static void lo_syncfs(fuse_req_t req, fuse_ino_t ino)
+{
+    struct lo_data *lo = lo_data(req);
+    struct lo_inode *inode = lo_inode(req, ino);
+    int err;
+
+    if (!inode) {
+        fuse_reply_err(req, EBADF);
+        return;
+    }
+
+    err = lo_do_syncfs(lo, inode);
+    lo_inode_put(lo, &inode);
+
+    /*
+     * If submounts aren't announced, the client only sends a request to
+     * sync the root inode. TODO: Track submounts internally and iterate
+     * over them as well.
+     */
+
+    fuse_reply_err(req, err);
+}
+
 static void lo_destroy(void *userdata)
 {
     struct lo_data *lo = (struct lo_data *)userdata;
@@ -3759,6 +3802,7 @@ static struct fuse_lowlevel_ops lo_oper = {
     .copy_file_range = lo_copy_file_range,
 #endif
     .lseek = lo_lseek,
+    .syncfs = lo_syncfs,
     .destroy = lo_destroy,
 };
 
diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
index 2bc0127b69..888295c073 100644
--- a/tools/virtiofsd/passthrough_seccomp.c
+++ b/tools/virtiofsd/passthrough_seccomp.c
@@ -111,6 +111,7 @@ static const int syscall_allowlist[] = {
     SCMP_SYS(set_robust_list),
     SCMP_SYS(setxattr),
     SCMP_SYS(symlinkat),
+    SCMP_SYS(syncfs),
     SCMP_SYS(time), /* Rarely needed, except on static builds */
     SCMP_SYS(tgkill),
     SCMP_SYS(unlinkat),
-- 
2.35.1


