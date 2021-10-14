Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9224742DE94
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:47:18 +0200 (CEST)
Received: from localhost ([::1]:57144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb2wv-0001TP-MK
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mb2iB-0005co-3r
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:32:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mb2hu-0003W3-RW
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634225505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AbU3zBpkTZISMheH/ABBF4b9YCeJ+lPJimNymFsSkZM=;
 b=Vr0JKGhHyTeRYmsQJ1fkEhQifQCnXnpb5gAkHcz3Z/i3giWHNol/f8ApPhzA3MyTbZbXFw
 iEEyVfSmcTUt0TatlinpC2U9F+9SBu6vSIIvGQf3zj9mP7zxZNz9Gi1+FYhRCYvCgS/cDx
 QGnnyNIwUuI2gIesJMihEetiO5yudbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-xCSsCeKKPxuosHb_i_diDg-1; Thu, 14 Oct 2021 11:31:44 -0400
X-MC-Unique: xCSsCeKKPxuosHb_i_diDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD2C8101872A;
 Thu, 14 Oct 2021 15:31:42 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACF4B5DA60;
 Thu, 14 Oct 2021 15:31:37 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 4CB852237BF; Thu, 14 Oct 2021 11:31:37 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v2 3/6] virtiofsd: Move core file creation code in separate
 function
Date: Thu, 14 Oct 2021 11:31:23 -0400
Message-Id: <20211014153126.575173-4-vgoyal@redhat.com>
In-Reply-To: <20211014153126.575173-1-vgoyal@redhat.com>
References: <20211014153126.575173-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 dwalsh@redhat.com, dgilbert@redhat.com, omosnace@redhat.com,
 casey@schaufler-ca.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move core file creation bits in a separate function. Soon this is going
to get more complex as file creation need to set security context also.
And there will be multiple modes of file creation in next patch.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 36 ++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 64b5b4fbb1..54978b7fae 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1976,6 +1976,30 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
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
@@ -1985,7 +2009,6 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
     struct lo_inode *inode = NULL;
     struct fuse_entry_param e;
     int err;
-    struct lo_cred old = {};
 
     fuse_log(FUSE_LOG_DEBUG, "lo_create(parent=%" PRIu64 ", name=%s)"
              " kill_priv=%d\n", parent, name, fi->kill_priv);
@@ -2001,18 +2024,9 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
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
2.31.1


