Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4583934EA28
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 16:20:38 +0200 (CEST)
Received: from localhost ([::1]:49856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRFET-0006n7-7q
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 10:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lRF3z-0002tW-7M
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:09:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lRF3v-00054U-4O
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617113380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5gJP52Zqh3kpE6TcUNZWjRxSQ69ELdgT6ZQo2ROocsg=;
 b=ZzZd7c/OLTMMwdN3/u22Yi/v67w23Vwxla7xpsdCZuS8kXl5shPvypy4pUMNp8HMvWyIWY
 qAOR4kETjVYJFEC/GL0InQBYNre56OW6pOQhjFc5P9sjshjggOFCe1Oeh6BR6lXf7ge5kG
 VsGcStcOIedEZNwhFWg6xIfD5870lHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-348H6Ia4P3KvkoaML_k4wA-1; Tue, 30 Mar 2021 10:09:36 -0400
X-MC-Unique: 348H6Ia4P3KvkoaML_k4wA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E830F83DBE2;
 Tue, 30 Mar 2021 14:09:35 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-118.rdu2.redhat.com [10.10.116.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FFBB60938;
 Tue, 30 Mar 2021 14:09:35 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 328E9225FCE; Tue, 30 Mar 2021 10:09:34 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v6 4/5] virtiofsd: Add support for setxattr_v2
Date: Tue, 30 Mar 2021 10:09:24 -0400
Message-Id: <20210330140925.730449-5-vgoyal@redhat.com>
In-Reply-To: <20210330140925.730449-1-vgoyal@redhat.com>
References: <20210330140925.730449-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
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
Cc: lhenriques@suse.de, dgilbert@redhat.com, vgoyal@redhat.com,
 miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the bits to enable support for setxattr_v2 if fuse offers it.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 include/standard-headers/linux/fuse.h | 12 +++++++-
 tools/virtiofsd/fuse_common.h         |  6 ++++
 tools/virtiofsd/fuse_lowlevel.c       | 42 ++++++++++++++++++++++++++-
 tools/virtiofsd/fuse_lowlevel.h       |  3 +-
 tools/virtiofsd/passthrough_ll.c      |  3 +-
 5 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/include/standard-headers/linux/fuse.h b/include/standard-headers/linux/fuse.h
index 950d7edb7e..cc87ff27d0 100644
--- a/include/standard-headers/linux/fuse.h
+++ b/include/standard-headers/linux/fuse.h
@@ -179,6 +179,7 @@
  *  7.33
  *  - add FUSE_HANDLE_KILLPRIV_V2, FUSE_WRITE_KILL_SUIDGID, FATTR_KILL_SUIDGID
  *  - add FUSE_OPEN_KILL_SUIDGID
+ *  - add FUSE_SETXATTR_V2
  */
 
 #ifndef _LINUX_FUSE_H
@@ -210,7 +211,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 33
+#define FUSE_KERNEL_MINOR_VERSION 34
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -326,6 +327,7 @@ struct fuse_file_lock {
  *			does not have CAP_FSETID. Additionally upon
  *			write/truncate sgid is killed only if file has group
  *			execute permission. (Same as Linux VFS behavior).
+ * FUSE_SETXATTR_V2:	Does file server support V2 of struct fuse_setxattr_in
  */
 #define FUSE_ASYNC_READ		(1 << 0)
 #define FUSE_POSIX_LOCKS	(1 << 1)
@@ -356,6 +358,7 @@ struct fuse_file_lock {
 #define FUSE_MAP_ALIGNMENT	(1 << 26)
 #define FUSE_SUBMOUNTS		(1 << 27)
 #define FUSE_HANDLE_KILLPRIV_V2	(1 << 28)
+#define FUSE_SETXATTR_V2	(1 << 29)
 
 /**
  * CUSE INIT request/reply flags
@@ -682,6 +685,13 @@ struct fuse_setxattr_in {
 	uint32_t	flags;
 };
 
+struct fuse_setxattr_in_v2 {
+	uint32_t	size;
+	uint32_t	flags;
+	uint32_t	setxattr_flags;
+	uint32_t	padding;
+};
+
 struct fuse_getxattr_in {
 	uint32_t	size;
 	uint32_t	padding;
diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
index fa9671872e..84e78c2a56 100644
--- a/tools/virtiofsd/fuse_common.h
+++ b/tools/virtiofsd/fuse_common.h
@@ -372,6 +372,12 @@ struct fuse_file_info {
  */
 #define FUSE_CAP_HANDLE_KILLPRIV_V2 (1 << 28)
 
+/**
+ * Indicates that file server will expect "struct fuse_setxattr_in_v2" type
+ * of struct in setxattr requests
+ */
+#define FUSE_CAP_SETXATTR_V2 (1 << 29)
+
 /**
  * Ioctl flags
  *
diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 58e32fc963..72f8252af8 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1420,6 +1420,34 @@ static void do_statfs(fuse_req_t req, fuse_ino_t nodeid,
     }
 }
 
+static void do_setxattr_v2(fuse_req_t req, fuse_ino_t nodeid,
+                           struct fuse_mbuf_iter *iter)
+{
+    struct fuse_setxattr_in_v2 *arg;
+    const char *name;
+    const char *value;
+
+    arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
+    name = fuse_mbuf_iter_advance_str(iter);
+    if (!arg || !name) {
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
+    value = fuse_mbuf_iter_advance(iter, arg->size);
+    if (!value) {
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
+    if (req->se->op.setxattr) {
+        req->se->op.setxattr(req, nodeid, name, value, arg->size, arg->flags,
+                             arg->setxattr_flags);
+    } else {
+        fuse_reply_err(req, ENOSYS);
+    }
+}
+
 static void do_setxattr(fuse_req_t req, fuse_ino_t nodeid,
                         struct fuse_mbuf_iter *iter)
 {
@@ -1427,6 +1455,9 @@ static void do_setxattr(fuse_req_t req, fuse_ino_t nodeid,
     const char *name;
     const char *value;
 
+    if (req->se->conn.want & FUSE_CAP_SETXATTR_V2) {
+        return do_setxattr_v2(req, nodeid, iter);
+    }
     arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
     name = fuse_mbuf_iter_advance_str(iter);
     if (!arg || !name) {
@@ -1441,7 +1472,8 @@ static void do_setxattr(fuse_req_t req, fuse_ino_t nodeid,
     }
 
     if (req->se->op.setxattr) {
-        req->se->op.setxattr(req, nodeid, name, value, arg->size, arg->flags);
+        req->se->op.setxattr(req, nodeid, name, value, arg->size, arg->flags,
+                             0);
     } else {
         fuse_reply_err(req, ENOSYS);
     }
@@ -1988,6 +2020,9 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     if (arg->flags & FUSE_HANDLE_KILLPRIV_V2) {
         se->conn.capable |= FUSE_CAP_HANDLE_KILLPRIV_V2;
     }
+    if (arg->flags & FUSE_SETXATTR_V2) {
+        se->conn.capable |= FUSE_CAP_SETXATTR_V2;
+    }
 #ifdef HAVE_SPLICE
 #ifdef HAVE_VMSPLICE
     se->conn.capable |= FUSE_CAP_SPLICE_WRITE | FUSE_CAP_SPLICE_MOVE;
@@ -2020,6 +2055,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     LL_SET_DEFAULT(se->op.readdirplus, FUSE_CAP_READDIRPLUS);
     LL_SET_DEFAULT(se->op.readdirplus && se->op.readdir,
                    FUSE_CAP_READDIRPLUS_AUTO);
+    LL_SET_DEFAULT(1, FUSE_CAP_SETXATTR_V2);
     se->conn.time_gran = 1;
 
     if (bufsize < FUSE_MIN_READ_BUFFER) {
@@ -2123,6 +2159,10 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
         outarg.flags |= FUSE_HANDLE_KILLPRIV_V2;
     }
 
+    if (se->conn.want & FUSE_CAP_SETXATTR_V2) {
+        outarg.flags |= FUSE_SETXATTR_V2;
+    }
+
     fuse_log(FUSE_LOG_DEBUG, "   INIT: %u.%u\n", outarg.major, outarg.minor);
     fuse_log(FUSE_LOG_DEBUG, "   flags=0x%08x\n", outarg.flags);
     fuse_log(FUSE_LOG_DEBUG, "   max_readahead=0x%08x\n", outarg.max_readahead);
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
index 3bf786b034..4b4e8c9724 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -798,7 +798,8 @@ struct fuse_lowlevel_ops {
      *   fuse_reply_err
      */
     void (*setxattr)(fuse_req_t req, fuse_ino_t ino, const char *name,
-                     const char *value, size_t size, int flags);
+                     const char *value, size_t size, int flags,
+                     uint32_t setxattr_flags);
 
     /**
      * Get an extended attribute
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index fda6b90fb3..c5a589441d 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3053,7 +3053,8 @@ out:
 }
 
 static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
-                        const char *value, size_t size, int flags)
+                        const char *value, size_t size, int flags,
+                        uint32_t extra_flags)
 {
     char procname[64];
     const char *name;
-- 
2.25.4


