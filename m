Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDE94B8FA9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:48:47 +0100 (CET)
Received: from localhost ([::1]:49142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOQ2-0003Xf-88
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:48:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKOGT-00018X-Jl
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:38:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKOGR-0008Ni-8B
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:38:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645033130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8IV8umSWpt4PcAeLbZo5gTVWdKX4UXNQkOAhmao9P2M=;
 b=CAaOWat18jXVaVdJAaqiKXD7ibs47qrqB2q4jdo2+SNcbRqrVb83EXgRRSwR1VSOZ1uutC
 DkExgqmp8a2KTi23jPcUhiUidFNf8A1EzKQG+Ky1BP5ils0+2eUIQuoTNLmUS6kDzdSd84
 Um+9kvfD4i303bj9yocOUCA2huLMJbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-LqHWIYeqMQ2rFKNrBY4orw-1; Wed, 16 Feb 2022 12:38:47 -0500
X-MC-Unique: LqHWIYeqMQ2rFKNrBY4orw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42D9E1F2DA;
 Wed, 16 Feb 2022 17:38:46 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5F5575747;
 Wed, 16 Feb 2022 17:38:04 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, groug@kaod.org,
 sebastian.hasler@stuvus.uni-stuttgart.de
Subject: [PULL 07/12] virtiofsd: Move core file creation code in separate
 function
Date: Wed, 16 Feb 2022 17:36:20 +0000
Message-Id: <20220216173625.128109-8-dgilbert@redhat.com>
In-Reply-To: <20220216173625.128109-1-dgilbert@redhat.com>
References: <20220216173625.128109-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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


