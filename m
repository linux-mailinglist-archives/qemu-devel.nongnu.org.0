Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6F731D30B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 00:39:05 +0100 (CET)
Received: from localhost ([::1]:57912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC9vs-0004kr-Vq
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 18:39:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lC9tX-0002xI-3p
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 18:36:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lC9tT-0002FF-CP
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 18:36:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613518594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Ju3wwRU2KI0P5XAy04Kxw6gLp4WGBGW2slJkOkzBRs=;
 b=cwrkeF25kKFS0Vzs16aU/WaW9ZYcGWiTRgBRpfbn5NrBhCHep5zmWmBOwdGvCWNffVfxOR
 QaCjRaurbhPaPujJ52q3DsUCmhdxZyCZjjdOhK503Q3KJATZJM/4qz1UQUSlIgiqkBg8Zz
 +6pFKLKYBninDPr2RZ5umOtq2pHgSzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-sp7Q_FogPd-CHrPwtuIWHQ-1; Tue, 16 Feb 2021 18:36:32 -0500
X-MC-Unique: sp7Q_FogPd-CHrPwtuIWHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B904280364B;
 Tue, 16 Feb 2021 23:36:31 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-123.rdu2.redhat.com [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFBE110016FD;
 Tue, 16 Feb 2021 23:36:25 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 3B5C4225FCD; Tue, 16 Feb 2021 18:36:25 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 3/3] virtiofsd: Change umask if posix acls are enabled
Date: Tue, 16 Feb 2021 18:36:11 -0500
Message-Id: <20210216233611.33400-4-vgoyal@redhat.com>
In-Reply-To: <20210216233611.33400-1-vgoyal@redhat.com>
References: <20210216233611.33400-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: miklos@szeredi.hu, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com, lhenriques@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When parent directory has default acl and a file is created in that
directory, then umask is ignored and final file permissions are
determined using default acl instead. (man 2 umask).

Currently, fuse applies the umask and sends modified mode in create
request accordingly. fuse server can set FUSE_DONT_MASK and tell
fuse client to not apply umask and fuse server will take care of
it as needed.

With posix acls enabled, requirement will be that we want umask
to determine final file mode if parent directory does not have
default acl.

So if posix acls are enabled, opt in for FUSE_DONT_MASK. virtiofsd
will set umask of the thread doing file creation. And host kernel
should use that umask if parent directory does not have default
acls, otherwise umask does not take affect.

Miklos mentioned that we already call unshare(CLONE_FS) for
every thread. That means umask has now become property of per
thread and it should be ok to manipulate it in file creation path.

So this patch opts in for FUSE_DONT_MASK if posix acls are enabled
and changes umask to caller umask before file creation and restores
original umask after file creation is done.

This should fix fstest generic/099.

Reported-by: Luis Henriques <lhenriques@suse.de>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 34b2848e61..84691571d2 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -120,6 +120,7 @@ struct lo_inode {
 struct lo_cred {
     uid_t euid;
     gid_t egid;
+    mode_t umask;
 };
 
 enum {
@@ -169,6 +170,8 @@ struct lo_data {
     /* An O_PATH file descriptor to /proc/self/fd/ */
     int proc_self_fd;
     int user_posix_acl;
+    /* If set, virtiofsd is responsible for setting umask during creation */
+    bool change_umask;
 };
 
 static const struct fuse_opt lo_opts[] = {
@@ -641,7 +644,8 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
          * in fuse_lowlevel.c
          */
         fuse_log(FUSE_LOG_DEBUG, "lo_init: enabling posix acl\n");
-        conn->want |= FUSE_CAP_POSIX_ACL;
+        conn->want |= FUSE_CAP_POSIX_ACL | FUSE_CAP_DONT_MASK;
+        lo->change_umask = true;
     } else {
         /*
          * Either user specified to disable posix_acl, or did not specify
@@ -649,6 +653,7 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
          */
         fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling posix_acl\n");
         conn->want &= ~FUSE_CAP_POSIX_ACL;
+        lo->change_umask = false;
     }
 }
 
@@ -1043,7 +1048,8 @@ static void lo_lookup(fuse_req_t req, fuse_ino_t parent, const char *name)
  * ownership of caller.
  * TODO: What about selinux context?
  */
-static int lo_change_cred(fuse_req_t req, struct lo_cred *old)
+static int lo_change_cred(fuse_req_t req, struct lo_cred *old,
+                          bool change_umask)
 {
     int res;
 
@@ -1063,11 +1069,14 @@ static int lo_change_cred(fuse_req_t req, struct lo_cred *old)
         return errno_save;
     }
 
+    if (change_umask)
+        old->umask = umask(req->ctx.umask);
+
     return 0;
 }
 
 /* Regain Privileges */
-static void lo_restore_cred(struct lo_cred *old)
+static void lo_restore_cred(struct lo_cred *old, bool restore_umask)
 {
     int res;
 
@@ -1082,6 +1091,9 @@ static void lo_restore_cred(struct lo_cred *old)
         fuse_log(FUSE_LOG_ERR, "setegid(%u): %m\n", old->egid);
         exit(1);
     }
+
+    if (restore_umask)
+        umask(old->umask);
 }
 
 static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
@@ -1106,7 +1118,7 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
         return;
     }
 
-    saverr = lo_change_cred(req, &old);
+    saverr = lo_change_cred(req, &old, lo->change_umask && !S_ISLNK(mode));
     if (saverr) {
         goto out;
     }
@@ -1115,7 +1127,7 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
 
     saverr = errno;
 
-    lo_restore_cred(&old);
+    lo_restore_cred(&old, lo->change_umask && !S_ISLNK(mode));
 
     if (res == -1) {
         goto out;
@@ -1780,7 +1792,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
         return;
     }
 
-    err = lo_change_cred(req, &old);
+    err = lo_change_cred(req, &old, lo->change_umask);
     if (err) {
         goto out;
     }
@@ -1791,7 +1803,7 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
     fd = openat(parent_inode->fd, name, fi->flags | O_CREAT | O_EXCL, mode);
     err = fd == -1 ? errno : 0;
 
-    lo_restore_cred(&old);
+    lo_restore_cred(&old, lo->change_umask);
 
     /* Ignore the error if file exists and O_EXCL was not given */
     if (err && (err != EEXIST || (fi->flags & O_EXCL))) {
-- 
2.25.4


