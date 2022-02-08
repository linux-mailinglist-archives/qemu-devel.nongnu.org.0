Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9E14AE2AD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:54:44 +0100 (CET)
Received: from localhost ([::1]:55142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHXVb-00014t-S0
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:54:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nHXPg-0002Oy-5A
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:48:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nHXPd-00044k-Pf
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644353311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rLH5lVS6OHbjVoJT6Ug/ghyb33jt9hnXPpWMSJb5+xo=;
 b=ar71HsQ5y5Z1YDBYBrz3JDrDpZSijntlEe0grcsc6t7RFmck7rLQ1Q6xhRX9tBuk/ldI6B
 vyDcqED+QWObqbG7gmPX0pUdPdmkNMFjl6cM85OHTHKlsBO12XbiSVARy58rwPYSNWkGOl
 EIN6Htee1/0z3lywwLv274/BlnNYejQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-L5xuMdX5OwGVDsI6mXnE7Q-1; Tue, 08 Feb 2022 15:48:29 -0500
X-MC-Unique: L5xuMdX5OwGVDsI6mXnE7Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2EE41F7B8
 for <qemu-devel@nongnu.org>; Tue,  8 Feb 2022 20:48:28 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.18.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95C226AB97;
 Tue,  8 Feb 2022 20:48:24 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id CACFD2256FC; Tue,  8 Feb 2022 15:48:23 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v6 05/10] virtiofsd,
 fuse_lowlevel.c: Add capability to parse security context
Date: Tue,  8 Feb 2022 15:48:08 -0500
Message-Id: <20220208204813.682906-6-vgoyal@redhat.com>
In-Reply-To: <20220208204813.682906-1-vgoyal@redhat.com>
References: <20220208204813.682906-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: mszeredi@redhat.com, berrange@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add capability to enable and parse security context as sent by client
and put into fuse_req. Filesystems now can get security context from
request and set it on files during creation.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_common.h   |   5 ++
 tools/virtiofsd/fuse_i.h        |   7 +++
 tools/virtiofsd/fuse_lowlevel.c | 102 +++++++++++++++++++++++++++++++-
 3 files changed, 113 insertions(+), 1 deletion(-)

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
index d91cd9743a..2909122b23 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -886,11 +886,63 @@ static void do_readlink(fuse_req_t req, fuse_ino_t nodeid,
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
+    /* struct fsecctx with zero sized context is not expected */
+    if (!fsecctx->size) {
+        return -EINVAL;
+    }
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
@@ -901,6 +953,14 @@ static void do_mknod(fuse_req_t req, fuse_ino_t nodeid,
 
     req->ctx.umask = arg->umask;
 
+    if (secctx_enabled) {
+        err = parse_secctx_fill_req(req, iter);
+        if (err) {
+            fuse_reply_err(req, -err);
+            return;
+        }
+    }
+
     if (req->se->op.mknod) {
         req->se->op.mknod(req, nodeid, name, arg->mode, arg->rdev);
     } else {
@@ -913,6 +973,8 @@ static void do_mkdir(fuse_req_t req, fuse_ino_t nodeid,
 {
     struct fuse_mkdir_in *arg;
     const char *name;
+    bool secctx_enabled = req->se->conn.want & FUSE_CAP_SECURITY_CTX;
+    int err;
 
     arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
     name = fuse_mbuf_iter_advance_str(iter);
@@ -923,6 +985,14 @@ static void do_mkdir(fuse_req_t req, fuse_ino_t nodeid,
 
     req->ctx.umask = arg->umask;
 
+    if (secctx_enabled) {
+        err = parse_secctx_fill_req(req, iter);
+        if (err) {
+            fuse_reply_err(req, err);
+            return;
+        }
+    }
+
     if (req->se->op.mkdir) {
         req->se->op.mkdir(req, nodeid, name, arg->mode);
     } else {
@@ -969,12 +1039,22 @@ static void do_symlink(fuse_req_t req, fuse_ino_t nodeid,
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
+            return;
+        }
+    }
+
     if (req->se->op.symlink) {
         req->se->op.symlink(req, linkname, nodeid, name);
     } else {
@@ -1048,6 +1128,8 @@ static void do_link(fuse_req_t req, fuse_ino_t nodeid,
 static void do_create(fuse_req_t req, fuse_ino_t nodeid,
                       struct fuse_mbuf_iter *iter)
 {
+    bool secctx_enabled = req->se->conn.want & FUSE_CAP_SECURITY_CTX;
+
     if (req->se->op.create) {
         struct fuse_create_in *arg;
         struct fuse_file_info fi;
@@ -1060,6 +1142,15 @@ static void do_create(fuse_req_t req, fuse_ino_t nodeid,
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
@@ -2015,6 +2106,9 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     if (flags & FUSE_SETXATTR_EXT) {
         se->conn.capable |= FUSE_CAP_SETXATTR_EXT;
     }
+    if (flags & FUSE_SECURITY_CTX) {
+        se->conn.capable |= FUSE_CAP_SECURITY_CTX;
+    }
 #ifdef HAVE_SPLICE
 #ifdef HAVE_VMSPLICE
     se->conn.capable |= FUSE_CAP_SPLICE_WRITE | FUSE_CAP_SPLICE_MOVE;
@@ -2154,8 +2248,14 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
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


