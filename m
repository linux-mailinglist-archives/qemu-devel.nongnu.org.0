Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C75D40D4D8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 10:45:40 +0200 (CEST)
Received: from localhost ([::1]:46974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQn1X-0001JU-Ms
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 04:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQmxI-0004R2-UN
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:41:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQmxG-0004BU-0u
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631781673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/LNdYWdfE7B711WCrLYvyDud7WHfFEqV3dUEWIbBA+E=;
 b=PjPV9i318SagWAZUs2jMKq0AwDgVXOHmqidGgUc0E4E3c2EP4b9FB42SNE4X8fqWvWCxYP
 xERrfmbutx6zviiTjVuYNqUbUs6c4Ta7pJ7qLTcN2XwommDsfr23uNG1NCMqyR2UqD7InR
 ihkqzxkwWugaYUwcOhD4ybJwGKhtmwg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-rXVcPl1FOM6oBR-XnebC4Q-1; Thu, 16 Sep 2021 04:41:12 -0400
X-MC-Unique: rXVcPl1FOM6oBR-XnebC4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D79E81451E
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:41:11 +0000 (UTC)
Received: from localhost (unknown [10.39.192.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0462819736;
 Thu, 16 Sep 2021 08:41:03 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v4 02/12] virtiofsd: Limit setxattr()'s creds-dropped region
Date: Thu, 16 Sep 2021 10:40:35 +0200
Message-Id: <20210916084045.31684-3-hreitz@redhat.com>
In-Reply-To: <20210916084045.31684-1-hreitz@redhat.com>
References: <20210916084045.31684-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We only need to drop/switch our credentials for the (f)setxattr() call
alone, not for the openat() or fchdir() around it.

(Right now, this may not be that big of a problem, but with inodes being
identified by file handles instead of an O_PATH fd, we will need
open_by_handle_at() calls here, which is really fickle when it comes to
credentials being dropped.)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 34 +++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 6511a6acb4..b43afdfbd3 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3123,6 +3123,7 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
     bool switched_creds = false;
     bool cap_fsetid_dropped = false;
     struct lo_cred old = {};
+    bool changed_cwd = false;
 
     if (block_xattr(lo, in_name)) {
         fuse_reply_err(req, EOPNOTSUPP);
@@ -3158,6 +3159,24 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
              ", name=%s value=%s size=%zd)\n", ino, name, value, size);
 
     sprintf(procname, "%i", inode->fd);
+    /*
+     * We can only open regular files or directories.  If the inode is
+     * something else, we have to enter /proc/self/fd and use
+     * setxattr() on the link's filename there.
+     */
+    if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
+        fd = openat(lo->proc_self_fd, procname, O_RDONLY);
+        if (fd < 0) {
+            saverr = errno;
+            goto out;
+        }
+    } else {
+        /* fchdir should not fail here */
+        FCHDIR_NOFAIL(lo->proc_self_fd);
+        /* Set flag so the clean-up path will chdir back */
+        changed_cwd = true;
+    }
+
     /*
      * If we are setting posix access acl and if SGID needs to be
      * cleared, then switch to caller's gid and drop CAP_FSETID
@@ -3178,20 +3197,12 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
         }
         switched_creds = true;
     }
-    if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
-        fd = openat(lo->proc_self_fd, procname, O_RDONLY);
-        if (fd < 0) {
-            saverr = errno;
-            goto out;
-        }
+    if (fd >= 0) {
         ret = fsetxattr(fd, name, value, size, flags);
         saverr = ret == -1 ? errno : 0;
     } else {
-        /* fchdir should not fail here */
-        FCHDIR_NOFAIL(lo->proc_self_fd);
         ret = setxattr(procname, name, value, size, flags);
         saverr = ret == -1 ? errno : 0;
-        FCHDIR_NOFAIL(lo->root.fd);
     }
     if (switched_creds) {
         if (cap_fsetid_dropped)
@@ -3201,6 +3212,11 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
     }
 
 out:
+    if (changed_cwd) {
+        /* Change CWD back, fchdir should not fail here */
+        FCHDIR_NOFAIL(lo->root.fd);
+    }
+
     if (fd >= 0) {
         close(fd);
     }
-- 
2.31.1


