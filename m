Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6EA34EA3E
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 16:22:42 +0200 (CEST)
Received: from localhost ([::1]:55344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRFGU-0000kQ-2K
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 10:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lRF4D-00034a-1w
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:10:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lRF3x-00056T-2k
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:10:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617113384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtS/g0OGOClDMjnADvuymU2io8u8AE6nWPE506Ug4tA=;
 b=XjBYjFFK2LLDDBgKi0PjK7ZfQNH6zVxd7F0t7KBUVhQHcwx+NeKl/1RNXLmcyvv1p1IdkP
 sPRX6KFSneMVZjGe/mAZvY9f8MLiWV7jor9YIEwMPN5CD5wge+NlfeifL+YxLC/h8LimLk
 CTiqwv6GpUjM9hLTpaYEDenbvxaqxk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-3E4893LePjCqhMioXZXDOw-1; Tue, 30 Mar 2021 10:09:42 -0400
X-MC-Unique: 3E4893LePjCqhMioXZXDOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9E011B18BC3;
 Tue, 30 Mar 2021 14:09:39 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-118.rdu2.redhat.com [10.10.116.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79D645D9CC;
 Tue, 30 Mar 2021 14:09:36 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 371FC225FCF; Tue, 30 Mar 2021 10:09:34 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v6 5/5] virtiofsd: Switch creds,
 drop FSETID for system.posix_acl_access xattr
Date: Tue, 30 Mar 2021 10:09:25 -0400
Message-Id: <20210330140925.730449-6-vgoyal@redhat.com>
In-Reply-To: <20210330140925.730449-1-vgoyal@redhat.com>
References: <20210330140925.730449-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
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

When posix access acls are set on a file, it can lead to adjusting file
permissions (mode) as well. If caller does not have CAP_FSETID and it
also does not have membership of owner group, this will lead to clearing
SGID bit in mode.

Current fuse code is written in such a way that it expects file server
to take care of chaning file mode (permission), if there is a need.
Right now, host kernel does not clear SGID bit because virtiofsd is
running as root and has CAP_FSETID. For host kernel to clear SGID,
virtiofsd need to switch to gid of caller in guest and also drop
CAP_FSETID (if caller did not have it to begin with).

If SGID needs to be cleared, client will set the flag
FUSE_SETXATTR_ACL_KILL_SGID in setxattr request. In that case server
should kill sgid.

Currently just switch to uid/gid of the caller and drop CAP_FSETID
and that should do it.

This should fix the xfstest generic/375 test case.

We don't have to switch uid for this to work. That could be one optimization
that pass a parameter to lo_change_cred() to only switch gid and not uid.

Also this will not work whenever (if ever) we support idmapped mounts. In
that case it is possible that uid/gid in request are 0/0 but still we
need to clear SGID. So we will have to pick a non-root sgid and switch
to that instead. That's an TODO item for future when idmapped mount
support is introduced.

Reported-by: Luis Henriques <lhenriques@suse.de>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 include/standard-headers/linux/fuse.h |  7 ++++
 tools/virtiofsd/passthrough_ll.c      | 50 ++++++++++++++++++++++++---
 2 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/include/standard-headers/linux/fuse.h b/include/standard-headers/linux/fuse.h
index cc87ff27d0..4eb79399d4 100644
--- a/include/standard-headers/linux/fuse.h
+++ b/include/standard-headers/linux/fuse.h
@@ -180,6 +180,7 @@
  *  - add FUSE_HANDLE_KILLPRIV_V2, FUSE_WRITE_KILL_SUIDGID, FATTR_KILL_SUIDGID
  *  - add FUSE_OPEN_KILL_SUIDGID
  *  - add FUSE_SETXATTR_V2
+ *  - add FUSE_SETXATTR_ACL_KILL_SGID
  */
 
 #ifndef _LINUX_FUSE_H
@@ -450,6 +451,12 @@ struct fuse_file_lock {
  */
 #define FUSE_OPEN_KILL_SUIDGID	(1 << 0)
 
+/**
+ * setxattr flags
+ * FUSE_SETXATTR_ACL_KILL_SGID: Clear SGID when system.posix_acl_access is set
+ */
+#define FUSE_SETXATTR_ACL_KILL_SGID    (1 << 0)
+
 enum fuse_opcode {
 	FUSE_LOOKUP		= 1,
 	FUSE_FORGET		= 2,  /* no reply */
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index c5a589441d..a968dc4e61 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -175,7 +175,7 @@ struct lo_data {
     int user_killpriv_v2, killpriv_v2;
     /* If set, virtiofsd is responsible for setting umask during creation */
     bool change_umask;
-    int user_posix_acl;
+    int user_posix_acl, posix_acl;
 };
 
 static const struct fuse_opt lo_opts[] = {
@@ -716,16 +716,19 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
          * now. It will fail later in fuse_lowlevel.c
          */
         if (!(conn->capable & FUSE_CAP_POSIX_ACL) ||
-            !(conn->capable & FUSE_CAP_DONT_MASK)) {
+            !(conn->capable & FUSE_CAP_DONT_MASK) ||
+            !(conn->capable & FUSE_CAP_SETXATTR_V2)) {
             fuse_log(FUSE_LOG_ERR, "lo_init: Can not enable posix acl."
-                     " kernel does not support FUSE_POSIX_ACL or FUSE_DONT_MASK"
-                     " capability.\n");
+                     " kernel does not support FUSE_POSIX_ACL, FUSE_DONT_MASK"
+                     " or FUSE_SETXATTR_V2 capability.\n");
         } else {
             fuse_log(FUSE_LOG_DEBUG, "lo_init: enabling posix acl\n");
         }
 
-        conn->want |= FUSE_CAP_POSIX_ACL | FUSE_CAP_DONT_MASK;
+        conn->want |= FUSE_CAP_POSIX_ACL | FUSE_CAP_DONT_MASK |
+                      FUSE_CAP_SETXATTR_V2;
         lo->change_umask = true;
+        lo->posix_acl = true;
     } else {
         /* User either did not specify anything or wants it disabled */
         fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling posix_acl\n");
@@ -3100,12 +3103,49 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
 
     sprintf(procname, "%i", inode->fd);
     if (S_ISREG(inode->filetype) || S_ISDIR(inode->filetype)) {
+        bool switched_creds = false;
+        struct lo_cred old = {};
+
         fd = openat(lo->proc_self_fd, procname, O_RDONLY);
         if (fd < 0) {
             saverr = errno;
             goto out;
         }
+
+        /*
+         * If we are setting posix access acl and if SGID needs to be
+         * cleared, then switch to caller's gid and drop CAP_FSETID
+         * and that should make sure host kernel clears SGID.
+         *
+         * This probably will not work when we support idmapped mounts.
+         * In that case we will need to find a non-root gid and switch
+         * to it. (Instead of gid in request). Fix it when we support
+         * idmapped mounts.
+         */
+        if (lo->posix_acl && !strcmp(name, "system.posix_acl_access")
+            && (extra_flags & FUSE_SETXATTR_ACL_KILL_SGID)) {
+            ret = lo_change_cred(req, &old, false);
+            if (ret) {
+                saverr = ret;
+                goto out;
+            }
+            ret = drop_effective_cap("FSETID", NULL);
+            if (ret != 0) {
+                lo_restore_cred(&old, false);
+                saverr = ret;
+                goto out;
+            }
+            switched_creds = true;
+        }
+
         ret = fsetxattr(fd, name, value, size, flags);
+
+        if (switched_creds) {
+            if (gain_effective_cap("FSETID")) {
+                fuse_log(FUSE_LOG_ERR, "Failed to gain CAP_FSETID\n");
+            }
+            lo_restore_cred(&old, false);
+        }
     } else {
         /* fchdir should not fail here */
         assert(fchdir(lo->proc_self_fd) == 0);
-- 
2.25.4


