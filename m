Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCCC417C04
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 21:55:05 +0200 (CEST)
Received: from localhost ([::1]:58570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTrHl-00033J-21
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 15:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mTrCc-00049p-BR
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mTrCR-0004FS-KY
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632512974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rbuRCJRboLXquzEGjl2ZvdMdNNDTf7EjWG9fB8yspR0=;
 b=BeTzR6e8sIKBpHyzaXPgco8XT61V3zzzf4JHFDqy+vVQ/HsXfrHW47T/fRPwp3Ld9bnxE8
 O5tg3+1nd2FQyfvis2U1LAhnNYGmbPFAsw1oJANK5OVl8xkYBXcof+WM650uNk5jIi2kA2
 idEn6OSAcfmjXv9xqNAazpbI/NCFp2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-WpGDdcI1NF-SJwDKqbhR0A-1; Fri, 24 Sep 2021 15:49:32 -0400
X-MC-Unique: WpGDdcI1NF-SJwDKqbhR0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D9D38C95B8;
 Fri, 24 Sep 2021 19:49:07 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.32.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C70E05BAF4;
 Fri, 24 Sep 2021 19:49:06 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 5808F228281; Fri, 24 Sep 2021 15:49:06 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 2/5] fuse_lowlevel.c: Add capability to parse security context
Date: Fri, 24 Sep 2021 15:48:51 -0400
Message-Id: <20210924194854.919414-3-vgoyal@redhat.com>
In-Reply-To: <20210924194854.919414-1-vgoyal@redhat.com>
References: <20210924194854.919414-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.473, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: miklos@szeredi.hu, chirantan@chromium.org, stephen.smalley.work@gmail.com,
 dwalsh@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add capability to enable and parse security context as sent by client
and put into fuse_req. Filesystems now can get security context from
request and set it on files during creation.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_common.h   |  5 +++
 tools/virtiofsd/fuse_i.h        |  7 ++++
 tools/virtiofsd/fuse_lowlevel.c | 74 +++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)

diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
index 0c2665b977..6f3485d1dc 100644
--- a/tools/virtiofsd/fuse_common.h
+++ b/tools/virtiofsd/fuse_common.h
@@ -377,6 +377,11 @@ struct fuse_file_info {
  */
 #define FUSE_CAP_SETXATTR_EXT (1 << 29)
 
+/**
+ * Indicates that file server supports creating file security context
+ */
+#define FUSE_CAP_SECURITY_CTX (1 << 30)
+
 /**
  * Ioctl flags
  *
diff --git a/tools/virtiofsd/fuse_i.h b/tools/virtiofsd/fuse_i.h
index 492e002181..a5572fa4ae 100644
--- a/tools/virtiofsd/fuse_i.h
+++ b/tools/virtiofsd/fuse_i.h
@@ -15,6 +15,12 @@
 struct fv_VuDev;
 struct fv_QueueInfo;
 
+struct fuse_security_context {
+        const char *name;
+        uint32_t ctxlen;
+        const void *ctx;
+};
+
 struct fuse_req {
     struct fuse_session *se;
     uint64_t unique;
@@ -35,6 +41,7 @@ struct fuse_req {
     } u;
     struct fuse_req *next;
     struct fuse_req *prev;
+    struct fuse_security_context secctx;
 };
 
 struct fuse_notify_req {
diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index e4679c73ab..fae92e0f3f 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -886,11 +886,41 @@ static void do_readlink(fuse_req_t req, fuse_ino_t nodeid,
     }
 }
 
+static int parse_secctx_fill_req(fuse_req_t req, struct fuse_mbuf_iter *iter)
+{
+    struct fuse_secctx *fsecctx;
+    const void *secctx;
+
+    fsecctx = fuse_mbuf_iter_advance(iter, sizeof(*fsecctx));
+    if (!fsecctx) {
+        return -EINVAL;
+    }
+
+    if (fsecctx->size) {
+        const char *name = fuse_mbuf_iter_advance_str(iter);
+        if (!name) {
+            return -EINVAL;
+        }
+
+        secctx = fuse_mbuf_iter_advance(iter, fsecctx->size);
+        if (!secctx) {
+            return -EINVAL;
+        }
+
+        req->secctx.name = name;
+        req->secctx.ctx = secctx;
+        req->secctx.ctxlen = fsecctx->size;
+    }
+    return 0;
+}
+
 static void do_mknod(fuse_req_t req, fuse_ino_t nodeid,
                      struct fuse_mbuf_iter *iter)
 {
     struct fuse_mknod_in *arg;
     const char *name;
+    bool secctx_enabled = req->se->conn.want & FUSE_CAP_SECURITY_CTX;
+    int err;
 
     arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
     name = fuse_mbuf_iter_advance_str(iter);
@@ -901,6 +931,13 @@ static void do_mknod(fuse_req_t req, fuse_ino_t nodeid,
 
     req->ctx.umask = arg->umask;
 
+    if (secctx_enabled) {
+        err = parse_secctx_fill_req(req, iter);
+        if (err) {
+            fuse_reply_err(req, -err);
+        }
+    }
+
     if (req->se->op.mknod) {
         req->se->op.mknod(req, nodeid, name, arg->mode, arg->rdev);
     } else {
@@ -913,6 +950,8 @@ static void do_mkdir(fuse_req_t req, fuse_ino_t nodeid,
 {
     struct fuse_mkdir_in *arg;
     const char *name;
+    bool secctx_enabled = req->se->conn.want & FUSE_CAP_SECURITY_CTX;
+    int err;
 
     arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
     name = fuse_mbuf_iter_advance_str(iter);
@@ -923,6 +962,13 @@ static void do_mkdir(fuse_req_t req, fuse_ino_t nodeid,
 
     req->ctx.umask = arg->umask;
 
+    if (secctx_enabled) {
+        err = parse_secctx_fill_req(req, iter);
+        if (err) {
+            fuse_reply_err(req, err);
+        }
+    }
+
     if (req->se->op.mkdir) {
         req->se->op.mkdir(req, nodeid, name, arg->mode);
     } else {
@@ -969,12 +1015,21 @@ static void do_symlink(fuse_req_t req, fuse_ino_t nodeid,
 {
     const char *name = fuse_mbuf_iter_advance_str(iter);
     const char *linkname = fuse_mbuf_iter_advance_str(iter);
+    bool secctx_enabled = req->se->conn.want & FUSE_CAP_SECURITY_CTX;
+    int err;
 
     if (!name || !linkname) {
         fuse_reply_err(req, EINVAL);
         return;
     }
 
+    if (secctx_enabled) {
+        err = parse_secctx_fill_req(req, iter);
+        if (err) {
+            fuse_reply_err(req, err);
+        }
+    }
+
     if (req->se->op.symlink) {
         req->se->op.symlink(req, linkname, nodeid, name);
     } else {
@@ -1048,6 +1103,8 @@ static void do_link(fuse_req_t req, fuse_ino_t nodeid,
 static void do_create(fuse_req_t req, fuse_ino_t nodeid,
                       struct fuse_mbuf_iter *iter)
 {
+    bool secctx_enabled = req->se->conn.want & FUSE_CAP_SECURITY_CTX;
+
     if (req->se->op.create) {
         struct fuse_create_in *arg;
         struct fuse_file_info fi;
@@ -1060,6 +1117,15 @@ static void do_create(fuse_req_t req, fuse_ino_t nodeid,
             return;
         }
 
+        if (secctx_enabled) {
+            int err;
+            err = parse_secctx_fill_req(req, iter);
+            if (err) {
+                fuse_reply_err(req, err);
+                return;
+            }
+        }
+
         memset(&fi, 0, sizeof(fi));
         fi.flags = arg->flags;
         fi.kill_priv = arg->open_flags & FUSE_OPEN_KILL_SUIDGID;
@@ -1997,6 +2063,9 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     if (arg->flags & FUSE_SETXATTR_EXT) {
         se->conn.capable |= FUSE_CAP_SETXATTR_EXT;
     }
+    if (arg->flags & FUSE_SECURITY_CTX) {
+        se->conn.capable |= FUSE_CAP_SECURITY_CTX;
+    }
 #ifdef HAVE_SPLICE
 #ifdef HAVE_VMSPLICE
     se->conn.capable |= FUSE_CAP_SPLICE_WRITE | FUSE_CAP_SPLICE_MOVE;
@@ -2029,6 +2098,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     LL_SET_DEFAULT(se->op.readdirplus, FUSE_CAP_READDIRPLUS);
     LL_SET_DEFAULT(se->op.readdirplus && se->op.readdir,
                    FUSE_CAP_READDIRPLUS_AUTO);
+    LL_SET_DEFAULT(1, FUSE_CAP_SECURITY_CTX);
     se->conn.time_gran = 1;
 
     if (bufsize < FUSE_MIN_READ_BUFFER) {
@@ -2136,6 +2206,10 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
         outarg.flags |= FUSE_SETXATTR_EXT;
     }
 
+    if (se->conn.want & FUSE_CAP_SECURITY_CTX) {
+        outarg.flags |= FUSE_SECURITY_CTX;
+    }
+
     fuse_log(FUSE_LOG_DEBUG, "   INIT: %u.%u\n", outarg.major, outarg.minor);
     fuse_log(FUSE_LOG_DEBUG, "   flags=0x%08x\n", outarg.flags);
     fuse_log(FUSE_LOG_DEBUG, "   max_readahead=0x%08x\n", outarg.max_readahead);
-- 
2.31.1


