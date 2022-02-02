Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A154A7961
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 21:28:51 +0100 (CET)
Received: from localhost ([::1]:58850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFMFG-0008Q4-CI
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 15:28:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nFLU4-0004Sz-3V
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:40:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nFLU1-00045U-1q
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:40:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643830800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tKH3AEexlSocmySbh6E3vuPIaAbmGSdcwDPl9SSWXCU=;
 b=FDO3FoIArTGlx76/5/nMEwFXNesE4dubGvEVfHeR1VCg1fIc5+g3q6YIYqOmskBBzDuOCr
 79IK0zBaRhCHZ2cw3YOYSF+14r1SJ/yLQmQl0ifjJp1Bkxncp6LS18JvszqIajsukCh9uF
 phM5WWs0h0JXKJzD+LnEv8NsntGqZT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-ed_OfJl3MOOsAF3d70Bm2A-1; Wed, 02 Feb 2022 14:39:59 -0500
X-MC-Unique: ed_OfJl3MOOsAF3d70Bm2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C6C78143EA
 for <qemu-devel@nongnu.org>; Wed,  2 Feb 2022 19:39:58 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.32.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DF2B4BC41;
 Wed,  2 Feb 2022 19:39:42 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id C6F392245B6; Wed,  2 Feb 2022 14:39:41 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v5 3/9] virtiofsd: Parse extended "struct fuse_init_in"
Date: Wed,  2 Feb 2022 14:39:29 -0500
Message-Id: <20220202193935.268777-4-vgoyal@redhat.com>
In-Reply-To: <20220202193935.268777-1-vgoyal@redhat.com>
References: <20220202193935.268777-1-vgoyal@redhat.com>
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

Add some code to parse extended "struct fuse_init_in". And use a local
variable "flag" to represent 64 bit flags. This will make it easier
to add more features without having to worry about two 32bit flags (->flags
and ->flags2) in "fuse_struct_in".

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 62 +++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 22 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index ce29a70253..1f10dcc75b 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1881,11 +1881,15 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
 {
     size_t compat_size = offsetof(struct fuse_init_in, max_readahead);
     size_t compat2_size = offsetof(struct fuse_init_in, flags) + sizeof(uint32_t);
+    /* Fuse structure extended with minor version 36 */
+    size_t compat3_size = offsetof(struct fuse_init_in, unused) +
+                          (11 * sizeof(uint32_t));
     struct fuse_init_in *arg;
     struct fuse_init_out outarg;
     struct fuse_session *se = req->se;
     size_t bufsize = se->bufsize;
     size_t outargsize = sizeof(outarg);
+    uint64_t flags = 0;
 
     (void)nodeid;
 
@@ -1902,11 +1906,25 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
             fuse_reply_err(req, EINVAL);
             return;
         }
+        flags |= arg->flags;
+    }
+
+    /*
+     * fuse_init_in was extended again with minor version 36. Just read
+     * current known size of fuse_init so that future extension and
+     * header rebase does not cause breakage.
+     */
+    if (sizeof(*arg) > compat2_size && (arg->flags & FUSE_INIT_EXT)) {
+        if (!fuse_mbuf_iter_advance(iter, compat3_size - compat2_size)) {
+            fuse_reply_err(req, EINVAL);
+            return;
+        }
+        flags |= (uint64_t) arg->flags2 << 32;
     }
 
     fuse_log(FUSE_LOG_DEBUG, "INIT: %u.%u\n", arg->major, arg->minor);
     if (arg->major == 7 && arg->minor >= 6) {
-        fuse_log(FUSE_LOG_DEBUG, "flags=0x%08x\n", arg->flags);
+        fuse_log(FUSE_LOG_DEBUG, "flags=0x%016llx\n", flags);
         fuse_log(FUSE_LOG_DEBUG, "max_readahead=0x%08x\n", arg->max_readahead);
     }
     se->conn.proto_major = arg->major;
@@ -1934,68 +1952,68 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     if (arg->max_readahead < se->conn.max_readahead) {
         se->conn.max_readahead = arg->max_readahead;
     }
-    if (arg->flags & FUSE_ASYNC_READ) {
+    if (flags & FUSE_ASYNC_READ) {
         se->conn.capable |= FUSE_CAP_ASYNC_READ;
     }
-    if (arg->flags & FUSE_POSIX_LOCKS) {
+    if (flags & FUSE_POSIX_LOCKS) {
         se->conn.capable |= FUSE_CAP_POSIX_LOCKS;
     }
-    if (arg->flags & FUSE_ATOMIC_O_TRUNC) {
+    if (flags & FUSE_ATOMIC_O_TRUNC) {
         se->conn.capable |= FUSE_CAP_ATOMIC_O_TRUNC;
     }
-    if (arg->flags & FUSE_EXPORT_SUPPORT) {
+    if (flags & FUSE_EXPORT_SUPPORT) {
         se->conn.capable |= FUSE_CAP_EXPORT_SUPPORT;
     }
-    if (arg->flags & FUSE_DONT_MASK) {
+    if (flags & FUSE_DONT_MASK) {
         se->conn.capable |= FUSE_CAP_DONT_MASK;
     }
-    if (arg->flags & FUSE_FLOCK_LOCKS) {
+    if (flags & FUSE_FLOCK_LOCKS) {
         se->conn.capable |= FUSE_CAP_FLOCK_LOCKS;
     }
-    if (arg->flags & FUSE_AUTO_INVAL_DATA) {
+    if (flags & FUSE_AUTO_INVAL_DATA) {
         se->conn.capable |= FUSE_CAP_AUTO_INVAL_DATA;
     }
-    if (arg->flags & FUSE_DO_READDIRPLUS) {
+    if (flags & FUSE_DO_READDIRPLUS) {
         se->conn.capable |= FUSE_CAP_READDIRPLUS;
     }
-    if (arg->flags & FUSE_READDIRPLUS_AUTO) {
+    if (flags & FUSE_READDIRPLUS_AUTO) {
         se->conn.capable |= FUSE_CAP_READDIRPLUS_AUTO;
     }
-    if (arg->flags & FUSE_ASYNC_DIO) {
+    if (flags & FUSE_ASYNC_DIO) {
         se->conn.capable |= FUSE_CAP_ASYNC_DIO;
     }
-    if (arg->flags & FUSE_WRITEBACK_CACHE) {
+    if (flags & FUSE_WRITEBACK_CACHE) {
         se->conn.capable |= FUSE_CAP_WRITEBACK_CACHE;
     }
-    if (arg->flags & FUSE_NO_OPEN_SUPPORT) {
+    if (flags & FUSE_NO_OPEN_SUPPORT) {
         se->conn.capable |= FUSE_CAP_NO_OPEN_SUPPORT;
     }
-    if (arg->flags & FUSE_PARALLEL_DIROPS) {
+    if (flags & FUSE_PARALLEL_DIROPS) {
         se->conn.capable |= FUSE_CAP_PARALLEL_DIROPS;
     }
-    if (arg->flags & FUSE_POSIX_ACL) {
+    if (flags & FUSE_POSIX_ACL) {
         se->conn.capable |= FUSE_CAP_POSIX_ACL;
     }
-    if (arg->flags & FUSE_HANDLE_KILLPRIV) {
+    if (flags & FUSE_HANDLE_KILLPRIV) {
         se->conn.capable |= FUSE_CAP_HANDLE_KILLPRIV;
     }
-    if (arg->flags & FUSE_NO_OPENDIR_SUPPORT) {
+    if (flags & FUSE_NO_OPENDIR_SUPPORT) {
         se->conn.capable |= FUSE_CAP_NO_OPENDIR_SUPPORT;
     }
-    if (!(arg->flags & FUSE_MAX_PAGES)) {
+    if (!(flags & FUSE_MAX_PAGES)) {
         size_t max_bufsize = FUSE_DEFAULT_MAX_PAGES_PER_REQ * getpagesize() +
                              FUSE_BUFFER_HEADER_SIZE;
         if (bufsize > max_bufsize) {
             bufsize = max_bufsize;
         }
     }
-    if (arg->flags & FUSE_SUBMOUNTS) {
+    if (flags & FUSE_SUBMOUNTS) {
         se->conn.capable |= FUSE_CAP_SUBMOUNTS;
     }
-    if (arg->flags & FUSE_HANDLE_KILLPRIV_V2) {
+    if (flags & FUSE_HANDLE_KILLPRIV_V2) {
         se->conn.capable |= FUSE_CAP_HANDLE_KILLPRIV_V2;
     }
-    if (arg->flags & FUSE_SETXATTR_EXT) {
+    if (flags & FUSE_SETXATTR_EXT) {
         se->conn.capable |= FUSE_CAP_SETXATTR_EXT;
     }
 #ifdef HAVE_SPLICE
@@ -2063,7 +2081,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     if (se->conn.max_write < bufsize - FUSE_BUFFER_HEADER_SIZE) {
         se->bufsize = se->conn.max_write + FUSE_BUFFER_HEADER_SIZE;
     }
-    if (arg->flags & FUSE_MAX_PAGES) {
+    if (flags & FUSE_MAX_PAGES) {
         outarg.flags |= FUSE_MAX_PAGES;
         outarg.max_pages = (se->conn.max_write - 1) / getpagesize() + 1;
     }
-- 
2.34.1


