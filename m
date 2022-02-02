Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D93A4A79BD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 21:49:07 +0100 (CET)
Received: from localhost ([::1]:39150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFMYs-0000E2-Jw
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 15:49:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nFLU2-0004QG-3w
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:40:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nFLU0-00044v-4U
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:40:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643830796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=347AVU+nfO5M2zmfjbVd3LE8sWE7w+JZ/1hOU0vrQw8=;
 b=e7D+RtUh4eWu5hN5DwqKTnybijJgX5BP43GcKpKRBvgm5nznzIDEtaKZFcbIFydW+mZAYf
 ZMOFcCP2VCCucENS+gLGJZIb6p+9Q1INGc55LSCYdUKXs+EB5QiepU+JiYCbCJft6mMNqb
 viCeeXzxcsFiTQOxtlXfH3P1ljRcA5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-66BHE0WDOoqVUFsiMXn-_w-1; Wed, 02 Feb 2022 14:39:54 -0500
X-MC-Unique: 66BHE0WDOoqVUFsiMXn-_w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4B9C192AB94
 for <qemu-devel@nongnu.org>; Wed,  2 Feb 2022 19:39:53 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.32.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFC1E6107E;
 Wed,  2 Feb 2022 19:39:42 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id CF023224A93; Wed,  2 Feb 2022 14:39:41 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v5 5/9] virtiofsd,
 fuse_lowlevel.c: Add capability to parse security context
Date: Wed,  2 Feb 2022 14:39:31 -0500
Message-Id: <20220202193935.268777-6-vgoyal@redhat.com>
In-Reply-To: <20220202193935.268777-1-vgoyal@redhat.com>
References: <20220202193935.268777-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: mszeredi@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add capability to enable and parse security context as sent by client
and put into fuse_req. Filesystems now can get security context from
request and set it on files during creation.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_common.h   |  5 ++
 tools/virtiofsd/fuse_i.h        |  7 +++
 tools/virtiofsd/fuse_lowlevel.c | 95 ++++++++++++++++++++++++++++++++-
 3 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
index 6f8a988202..bf46954dab 100644
--- a/tools/virtiofsd/fuse_common.h
+++ b/tools/virtiofsd/fuse_common.h
@@ -377,6 +377,11 @@ struct fuse_file_info {
  */
 #define FUSE_CAP_SETXATTR_EXT (1 << 29)
 
+/**
+ * Indicates that file server supports creating file security context
+ */
+#define FUSE_CAP_SECURITY_CTX (1ULL << 32)
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
index 83d29762a4..cd9ef97b3c 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -886,11 +886,59 @@ static void do_readlink(fuse_req_t req, fuse_ino_t nodeid,
     }
 }
 
+static int parse_secctx_fill_req(fuse_req_t req, struct fuse_mbuf_iter *iter)
+{
+    struct fuse_secctx_header *fsecctx_header;
+    struct fuse_secctx *fsecctx;
+    const void *secctx;
+    const char *name;
+
+    fsecctx_header = fuse_mbuf_iter_advance(iter, sizeof(*fsecctx_header));
+    if (!fsecctx_header) {
+        return -EINVAL;
+    }
+
+    /*
+     * As of now maximum of one security context is supported. It can
+     * change in future though.
+     */
+    if (fsecctx_header->nr_secctx > 1) {
+        return -EINVAL;
+    }
+
+    /* No security context sent. Maybe no LSM supports it */
+    if (!fsecctx_header->nr_secctx) {
+        return 0;
+    }
+
+    fsecctx = fuse_mbuf_iter_advance(iter, sizeof(*fsecctx));
+    if (!fsecctx) {
+        return -EINVAL;
+    }
+
+    name = fuse_mbuf_iter_advance_str(iter);
+    if (!name) {
+        return -EINVAL;
+    }
+
+    secctx = fuse_mbuf_iter_advance(iter, fsecctx->size);
+    if (!secctx) {
+        return -EINVAL;
+    }
+
+    req->secctx.name = name;
+    req->secctx.ctx = secctx;
+    req->secctx.ctxlen = fsecctx->size;
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
@@ -901,6 +949,13 @@ static void do_mknod(fuse_req_t req, fuse_ino_t nodeid,
 
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
@@ -913,6 +968,8 @@ static void do_mkdir(fuse_req_t req, fuse_ino_t nodeid,
 {
     struct fuse_mkdir_in *arg;
     const char *name;
+    bool secctx_enabled = req->se->conn.want & FUSE_CAP_SECURITY_CTX;
+    int err;
 
     arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
     name = fuse_mbuf_iter_advance_str(iter);
@@ -923,6 +980,13 @@ static void do_mkdir(fuse_req_t req, fuse_ino_t nodeid,
 
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
@@ -969,12 +1033,21 @@ static void do_symlink(fuse_req_t req, fuse_ino_t nodeid,
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
@@ -1048,6 +1121,8 @@ static void do_link(fuse_req_t req, fuse_ino_t nodeid,
 static void do_create(fuse_req_t req, fuse_ino_t nodeid,
                       struct fuse_mbuf_iter *iter)
 {
+    bool secctx_enabled = req->se->conn.want & FUSE_CAP_SECURITY_CTX;
+
     if (req->se->op.create) {
         struct fuse_create_in *arg;
         struct fuse_file_info fi;
@@ -1060,6 +1135,15 @@ static void do_create(fuse_req_t req, fuse_ino_t nodeid,
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
@@ -2016,6 +2100,9 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     if (flags & FUSE_SETXATTR_EXT) {
         se->conn.capable |= FUSE_CAP_SETXATTR_EXT;
     }
+    if (flags & FUSE_SECURITY_CTX) {
+        se->conn.capable |= FUSE_CAP_SECURITY_CTX;
+    }
 #ifdef HAVE_SPLICE
 #ifdef HAVE_VMSPLICE
     se->conn.capable |= FUSE_CAP_SPLICE_WRITE | FUSE_CAP_SPLICE_MOVE;
@@ -2155,8 +2242,14 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
         outarg.flags |= FUSE_SETXATTR_EXT;
     }
 
+    if (se->conn.want & FUSE_CAP_SECURITY_CTX) {
+        /* bits 32..63 get shifted down 32 bits into the flags2 field */
+        outarg.flags2 |= FUSE_SECURITY_CTX >> 32;
+    }
+
     fuse_log(FUSE_LOG_DEBUG, "   INIT: %u.%u\n", outarg.major, outarg.minor);
-    fuse_log(FUSE_LOG_DEBUG, "   flags=0x%08x\n", outarg.flags);
+    fuse_log(FUSE_LOG_DEBUG, "   flags2=0x%08x flags=0x%08x\n", outarg.flags2,
+             outarg.flags);
     fuse_log(FUSE_LOG_DEBUG, "   max_readahead=0x%08x\n", outarg.max_readahead);
     fuse_log(FUSE_LOG_DEBUG, "   max_write=0x%08x\n", outarg.max_write);
     fuse_log(FUSE_LOG_DEBUG, "   max_background=%i\n", outarg.max_background);
-- 
2.34.1


