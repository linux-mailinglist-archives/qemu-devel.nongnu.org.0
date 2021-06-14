Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965F83A694B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:49:39 +0200 (CEST)
Received: from localhost ([::1]:36932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnuE-0004H6-N7
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lsnpP-0003tB-PH
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:44:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lsnpO-0004bR-3I
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:44:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623681877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hvo5wt/4C8QgqvRFd7e/x5G17WIze7vCdSP12NaNdwk=;
 b=CvcDhOM6jBxYxRMrVT0mrgTC/o0UHKUrlr0WDhyqy0K2f9WUace6+VpSyqHHvTsq0jn4cn
 ZFVdxrI803ecacL1oXkMjwYljzAKVYHuObDdbOpY5LukPEg0lPX8FMTgnne3cDdP8Wm6YO
 DzZpv1jSFe+6Pw2OV9grdVnxb7Emr0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-yWBgPhxzPhugXrYpDg3iLA-1; Mon, 14 Jun 2021 10:44:16 -0400
X-MC-Unique: yWBgPhxzPhugXrYpDg3iLA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA6CC100C660;
 Mon, 14 Jun 2021 14:44:15 +0000 (UTC)
Received: from localhost (ovpn-114-163.ams2.redhat.com [10.36.114.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9541C60C0F;
 Mon, 14 Jun 2021 14:44:15 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/4] export/fuse: Let permissions be adjustable
Date: Mon, 14 Jun 2021 16:44:06 +0200
Message-Id: <20210614144407.134243-4-mreitz@redhat.com>
In-Reply-To: <20210614144407.134243-1-mreitz@redhat.com>
References: <20210614144407.134243-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow changing the file mode, UID, and GID through SETATTR.

This only really makes sense with allow-other, though (because without
it, the effective access mode is fixed to be 0600 (u+rw) with qemu's
user being the file's owner), so changing these stat fields is not
allowed without allow-other.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/export/fuse.c | 48 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 1d54286d90..742e0af657 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -47,6 +47,10 @@ typedef struct FuseExport {
     bool writable;
     bool growable;
     bool allow_other;
+
+    mode_t st_mode;
+    uid_t st_uid;
+    gid_t st_gid;
 } FuseExport;
 
 static GHashTable *exports;
@@ -120,6 +124,13 @@ static int fuse_export_create(BlockExport *blk_exp,
     exp->growable = args->growable;
     exp->allow_other = args->allow_other;
 
+    exp->st_mode = S_IFREG | S_IRUSR;
+    if (exp->writable) {
+        exp->st_mode |= S_IWUSR;
+    }
+    exp->st_uid = getuid();
+    exp->st_gid = getgid();
+
     ret = setup_fuse_export(exp, args->mountpoint, errp);
     if (ret < 0) {
         goto fail;
@@ -329,7 +340,6 @@ static void fuse_getattr(fuse_req_t req, fuse_ino_t inode,
     int64_t length, allocated_blocks;
     time_t now = time(NULL);
     FuseExport *exp = fuse_req_userdata(req);
-    mode_t mode;
 
     length = blk_getlength(exp->common.blk);
     if (length < 0) {
@@ -344,17 +354,12 @@ static void fuse_getattr(fuse_req_t req, fuse_ino_t inode,
         allocated_blocks = DIV_ROUND_UP(allocated_blocks, 512);
     }
 
-    mode = S_IFREG | S_IRUSR;
-    if (exp->writable) {
-        mode |= S_IWUSR;
-    }
-
     statbuf = (struct stat) {
         .st_ino     = inode,
-        .st_mode    = mode,
+        .st_mode    = exp->st_mode,
         .st_nlink   = 1,
-        .st_uid     = getuid(),
-        .st_gid     = getgid(),
+        .st_uid     = exp->st_uid,
+        .st_gid     = exp->st_gid,
         .st_size    = length,
         .st_blksize = blk_bs(exp->common.blk)->bl.request_alignment,
         .st_blocks  = allocated_blocks,
@@ -400,15 +405,23 @@ static int fuse_do_truncate(const FuseExport *exp, int64_t size,
 }
 
 /**
- * Let clients set file attributes.  Only resizing is supported.
+ * Let clients set file attributes.  With allow_other, only resizing and
+ * changing permissions (st_mode, st_uid, st_gid) is allowed.  Without
+ * allow_other, only resizing is supported.
  */
 static void fuse_setattr(fuse_req_t req, fuse_ino_t inode, struct stat *statbuf,
                          int to_set, struct fuse_file_info *fi)
 {
     FuseExport *exp = fuse_req_userdata(req);
+    int supported_attrs;
     int ret;
 
-    if (to_set & ~FUSE_SET_ATTR_SIZE) {
+    supported_attrs = FUSE_SET_ATTR_SIZE;
+    if (exp->allow_other) {
+        supported_attrs |= FUSE_SET_ATTR_MODE | FUSE_SET_ATTR_UID |
+            FUSE_SET_ATTR_GID;
+    }
+    if (to_set & ~supported_attrs) {
         fuse_reply_err(req, ENOTSUP);
         return;
     }
@@ -426,6 +439,19 @@ static void fuse_setattr(fuse_req_t req, fuse_ino_t inode, struct stat *statbuf,
         }
     }
 
+    if (to_set & FUSE_SET_ATTR_MODE) {
+        /* Only allow changing the file mode, not the type */
+        exp->st_mode = (statbuf->st_mode & 07777) | S_IFREG;
+    }
+
+    if (to_set & FUSE_SET_ATTR_UID) {
+        exp->st_uid = statbuf->st_uid;
+    }
+
+    if (to_set & FUSE_SET_ATTR_GID) {
+        exp->st_gid = statbuf->st_gid;
+    }
+
     fuse_getattr(req, inode, fi);
 }
 
-- 
2.31.1


