Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197054BA743
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 18:37:18 +0100 (CET)
Received: from localhost ([::1]:50678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKkiT-0002Qt-6y
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 12:37:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKkZZ-0006SJ-Ij
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:28:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKkZV-0004C6-Gh
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:28:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645118878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8IV8umSWpt4PcAeLbZo5gTVWdKX4UXNQkOAhmao9P2M=;
 b=WbPmgnkTzuUI9B7vUncEdkRqsWIbNlLnxYd3XWde0EUmn+8DnjqUB1ogyLgW+1U8VrYs77
 uPpSXBW+Ou6dE7Y5fqVtuPnmmy+ijaU+TfzGVD2jGLAqaFdiJH3JxoNBdkDq5xHdQzdfXL
 RsdGlFd0dUHT1AWJnpRL24Td3rZcZl0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-m4MzlpFaNCmTVUPHwg-0NQ-1; Thu, 17 Feb 2022 12:27:55 -0500
X-MC-Unique: m4MzlpFaNCmTVUPHwg-0NQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A805F801AC5;
 Thu, 17 Feb 2022 17:27:54 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.194.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80B318463A;
 Thu, 17 Feb 2022 17:27:48 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, groug@kaod.org,
 sebastian.hasler@stuvus.uni-stuttgart.de
Subject: [PULL 07/12] virtiofsd: Move core file creation code in separate
 function
Date: Thu, 17 Feb 2022 17:24:55 +0000
Message-Id: <20220217172500.60500-8-dgilbert@redhat.com>
In-Reply-To: <20220217172500.60500-1-dgilbert@redhat.com>
References: <20220217172500.60500-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

From: Vivek Goyal <vgoyal@redhat.com>

Move core file creation bits in a separate function. Soon this is going
to get more complex as file creation need to set security context also.
And there will be multiple modes of file creation in next patch.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <20220208204813.682906-7-vgoyal@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 36 ++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 3e56d1cd95..e27479f1c9 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2001,6 +2001,30 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
     return 0;
 }
 
+static int do_lo_create(fuse_req_t req, struct lo_inode *parent_inode,
+                        const char *name, mode_t mode,
+                        struct fuse_file_info *fi, int* open_fd)
+{
+    int err = 0, fd;
+    struct lo_cred old = {};
+    struct lo_data *lo = lo_data(req);
+
+    err = lo_change_cred(req, &old, lo->change_umask);
+    if (err) {
+        return err;
+    }
+
+    /* Try to create a new file but don't open existing files */
+    fd = openat(parent_inode->fd, name, fi->flags | O_CREAT | O_EXCL, mode);
+    if (fd == -1) {
+        err = errno;
+    } else {
+        *open_fd = fd;
+    }
+    lo_restore_cred(&old, lo->change_umask);
+    return err;
+}
+
 static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
                       mode_t mode, struct fuse_file_info *fi)
 {
@@ -2010,7 +2034,6 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
     struct lo_inode *inode = NULL;
     struct fuse_entry_param e;
     int err;
-    struct lo_cred old = {};
 
     fuse_log(FUSE_LOG_DEBUG, "lo_create(parent=%" PRIu64 ", name=%s)"
              " kill_priv=%d\n", parent, name, fi->kill_priv);
@@ -2026,18 +2049,9 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
         return;
     }
 
-    err = lo_change_cred(req, &old, lo->change_umask);
-    if (err) {
-        goto out;
-    }
-
     update_open_flags(lo->writeback, lo->allow_direct_io, fi);
 
-    /* Try to create a new file but don't open existing files */
-    fd = openat(parent_inode->fd, name, fi->flags | O_CREAT | O_EXCL, mode);
-    err = fd == -1 ? errno : 0;
-
-    lo_restore_cred(&old, lo->change_umask);
+    err = do_lo_create(req, parent_inode, name, mode, fi, &fd);
 
     /* Ignore the error if file exists and O_EXCL was not given */
     if (err && (err != EEXIST || (fi->flags & O_EXCL))) {
-- 
2.35.1


