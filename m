Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A4D3C23CD
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 14:56:42 +0200 (CEST)
Received: from localhost ([::1]:55628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1q3d-0004Nc-BQ
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 08:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyt-0004Qh-FV
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyr-0003bB-Jg
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3FsnUTo2knoZegyATT09VourLx4faeCo0xhc1vtdU/8=;
 b=OGyGsHnwmBU0T14G4cuNni4uYj32fB0Y+aIapXJSEg0Rwt7yugDP2ALAL1deE9w5ARdSkG
 z/xpzaOzwWhRZhAcQow3p6RP2aBj0HG32OCUxEUzJNCjyHbn64GBr5tMxT6cQIFAEnI+au
 7AuuBmOEDHcqFhE10Ct28tTC+o5jG0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-QfOzEItePHy0yqt-soO9JQ-1; Fri, 09 Jul 2021 08:51:43 -0400
X-MC-Unique: QfOzEItePHy0yqt-soO9JQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57C951084F57;
 Fri,  9 Jul 2021 12:51:42 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 385B260843;
 Fri,  9 Jul 2021 12:51:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/28] export/fuse: Let permissions be adjustable
Date: Fri,  9 Jul 2021 14:50:20 +0200
Message-Id: <20210709125035.191321-14-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Allow changing the file mode, UID, and GID through SETATTR.

Without allow_other, UID and GID are not allowed to be changed, because
it would not make sense.  Also, changing group or others' permissions
is not allowed either.

For read-only exports, +w cannot be set.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210625142317.271673-5-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/fuse.c | 73 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 62 insertions(+), 11 deletions(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 26ad644cd7..ada9e263eb 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -48,6 +48,10 @@ typedef struct FuseExport {
     bool growable;
     /* Whether allow_other was used as a mount option or not */
     bool allow_other;
+
+    mode_t st_mode;
+    uid_t st_uid;
+    gid_t st_gid;
 } FuseExport;
 
 static GHashTable *exports;
@@ -125,6 +129,13 @@ static int fuse_export_create(BlockExport *blk_exp,
         args->allow_other = FUSE_EXPORT_ALLOW_OTHER_AUTO;
     }
 
+    exp->st_mode = S_IFREG | S_IRUSR;
+    if (exp->writable) {
+        exp->st_mode |= S_IWUSR;
+    }
+    exp->st_uid = getuid();
+    exp->st_gid = getgid();
+
     if (args->allow_other == FUSE_EXPORT_ALLOW_OTHER_AUTO) {
         /* Ignore errors on our first attempt */
         ret = setup_fuse_export(exp, args->mountpoint, true, NULL);
@@ -338,7 +349,6 @@ static void fuse_getattr(fuse_req_t req, fuse_ino_t inode,
     int64_t length, allocated_blocks;
     time_t now = time(NULL);
     FuseExport *exp = fuse_req_userdata(req);
-    mode_t mode;
 
     length = blk_getlength(exp->common.blk);
     if (length < 0) {
@@ -353,17 +363,12 @@ static void fuse_getattr(fuse_req_t req, fuse_ino_t inode,
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
@@ -409,19 +414,52 @@ static int fuse_do_truncate(const FuseExport *exp, int64_t size,
 }
 
 /**
- * Let clients set file attributes.  Only resizing is supported.
+ * Let clients set file attributes.  Only resizing and changing
+ * permissions (st_mode, st_uid, st_gid) is allowed.
+ * Changing permissions is only allowed as far as it will actually
+ * permit access: Read-only exports cannot be given +w, and exports
+ * without allow_other cannot be given a different UID or GID, and
+ * they cannot be given non-owner access.
  */
 static void fuse_setattr(fuse_req_t req, fuse_ino_t inode, struct stat *statbuf,
                          int to_set, struct fuse_file_info *fi)
 {
     FuseExport *exp = fuse_req_userdata(req);
+    int supported_attrs;
     int ret;
 
-    if (to_set & ~FUSE_SET_ATTR_SIZE) {
+    supported_attrs = FUSE_SET_ATTR_SIZE | FUSE_SET_ATTR_MODE;
+    if (exp->allow_other) {
+        supported_attrs |= FUSE_SET_ATTR_UID | FUSE_SET_ATTR_GID;
+    }
+
+    if (to_set & ~supported_attrs) {
         fuse_reply_err(req, ENOTSUP);
         return;
     }
 
+    /* Do some argument checks first before committing to anything */
+    if (to_set & FUSE_SET_ATTR_MODE) {
+        /*
+         * Without allow_other, non-owners can never access the export, so do
+         * not allow setting permissions for them
+         */
+        if (!exp->allow_other &&
+            (statbuf->st_mode & (S_IRWXG | S_IRWXO)) != 0)
+        {
+            fuse_reply_err(req, EPERM);
+            return;
+        }
+
+        /* +w for read-only exports makes no sense, disallow it */
+        if (!exp->writable &&
+            (statbuf->st_mode & (S_IWUSR | S_IWGRP | S_IWOTH)) != 0)
+        {
+            fuse_reply_err(req, EROFS);
+            return;
+        }
+    }
+
     if (to_set & FUSE_SET_ATTR_SIZE) {
         if (!exp->writable) {
             fuse_reply_err(req, EACCES);
@@ -435,6 +473,19 @@ static void fuse_setattr(fuse_req_t req, fuse_ino_t inode, struct stat *statbuf,
         }
     }
 
+    if (to_set & FUSE_SET_ATTR_MODE) {
+        /* Ignore FUSE-supplied file type, only change the mode */
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


