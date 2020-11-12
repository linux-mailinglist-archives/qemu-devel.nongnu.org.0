Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB162B0C8C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:26:26 +0100 (CET)
Received: from localhost ([::1]:43952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHIf-0007bl-NQ
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kdHGx-0006Pi-11
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:24:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kdHGu-0001Tg-3h
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:24:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605205475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+FPvb0Wl8N4YtKizciqxIb6fenfvVStcg0z+ANgwRg=;
 b=UpL/8ZHKJ+xXebm0iSeiNXkrA8cDDACwmf10Z0o4IL2W4/Uh8Cl8WuK8JfaMGzzT3qYEF1
 sljakUjQbUZQt2+s0i7TjYPA3CDwVXuEwxLuFf36crT1amCItQESDyCJ4ANBcFGHQqFyMa
 KyREakXwBNpP9SEvgN4qI3SaE15kvMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-1KtziR0CODqh7Ez3Heyqzw-1; Thu, 12 Nov 2020 13:24:33 -0500
X-MC-Unique: 1KtziR0CODqh7Ez3Heyqzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 172EA8BE486
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 18:24:32 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-211.rdu2.redhat.com [10.10.116.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB6A71002C16;
 Thu, 12 Nov 2020 18:24:28 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 5EBE82234E4; Thu, 12 Nov 2020 13:24:28 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v2 2/2] viriofsd: Add support for FUSE_HANDLE_KILLPRIV_V2
Date: Thu, 12 Nov 2020 13:24:18 -0500
Message-Id: <20201112182418.25395-3-vgoyal@redhat.com>
In-Reply-To: <20201112182418.25395-1-vgoyal@redhat.com>
References: <20201112182418.25395-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mszeredi@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds basic support for FUSE_HANDLE_KILLPRIV_V2. virtiofsd
can enable/disable this by specifying option "-o killpriv_v2/no_killpriv_v2".
By default this is enabled as long as client supports it

Enabling this option helps with performance in write path. Without this
option, currently every write is first preceeded with a getxattr() operation
to find out if security.capability is set. (Write is supposed to clear
security.capability). With this option enabled, server is signing up for
clearing security.capability on every WRITE and also clearing suid/sgid
subject to certain rules. This gets rid of extra getxattr() call for every
WRITE and improves performance. This is true when virtiofsd is run with
option -o xattr.

What does enabling FUSE_HANDLE_KILLPRIV_V2 mean for file server implementation.
It needs to adhere to following rules. Thanks to Miklos for this summary.

- clear "security.capability" on write, truncate and chown unconditionally
- clear suid/sgid in case of following. Note, sgid is cleared only if
  group executable bit is set.
    o setattr has FATTR_SIZE and FATTR_KILL_SUIDGID set.
    o setattr has FATTR_UID or FATTR_GID
    o open has O_TRUNC and FUSE_OPEN_KILL_SUIDGID
    o create has O_TRUNC and FUSE_OPEN_KILL_SUIDGID flag set.
    o write has FUSE_WRITE_KILL_SUIDGID

From Linux VFS client perspective, here are the requirements.

- caps are always cleared on chown/write/truncate
- suid is always cleared on chown, while for truncate/write it is cleared
  only if caller does not have CAP_FSETID.
- sgid is always cleared on chown, while for truncate/write it is cleared
  only if caller does not have CAP_FSETID as well as file has group execute
  permission.

virtiofsd implementation has not changed much to adhere to above ruls. And
reason being that current assumption is that we are running on Linux
and on top of filesystems like ext4/xfs which already follow above rules.
On write, truncate, chown, seucurity.capability is cleared. And virtiofsd
drops CAP_FSETID if need be and that will lead to clearing of suid/sgid.

But if virtiofsd is running on top a filesystem which breaks above assumptions,
then it will have to take extra actions to emulate above. That's a TODO
for later when need arises.

Note: create normally is supposed to be called only when file does not
      exist. So generally there should not be any question of clearing
      setuid/setgid. But it is possible that after client checks that
      file is not present, some other client creates file on server
      and this race can trigger sending FUSE_CREATE. In that case, if
      O_TRUNC is set, we should clear suid/sgid if FUSE_OPEN_KILL_SUIDGID
      is also set.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 include/standard-headers/linux/fuse.h |  28 ++++++-
 tools/virtiofsd/fuse_common.h         |  15 ++++
 tools/virtiofsd/fuse_lowlevel.c       |  11 ++-
 tools/virtiofsd/fuse_lowlevel.h       |   1 +
 tools/virtiofsd/passthrough_ll.c      | 108 +++++++++++++++++++++++---
 5 files changed, 148 insertions(+), 15 deletions(-)

diff --git a/include/standard-headers/linux/fuse.h b/include/standard-headers/linux/fuse.h
index 82c0a38b59..a233f3ac02 100644
--- a/include/standard-headers/linux/fuse.h
+++ b/include/standard-headers/linux/fuse.h
@@ -175,6 +175,10 @@
  *
  *  7.32
  *  - add flags to fuse_attr, add FUSE_ATTR_SUBMOUNT, add FUSE_SUBMOUNTS
+ *
+ *  7.33
+ *  - add FUSE_HANDLE_KILLPRIV_V2, FUSE_WRITE_KILL_SUIDGID, FATTR_KILL_SUIDGID
+ *  - add FUSE_OPEN_KILL_SUIDGID
  */
 
 #ifndef _LINUX_FUSE_H
@@ -206,7 +210,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 32
+#define FUSE_KERNEL_MINOR_VERSION 33
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -267,6 +271,7 @@ struct fuse_file_lock {
 #define FATTR_MTIME_NOW	(1 << 8)
 #define FATTR_LOCKOWNER	(1 << 9)
 #define FATTR_CTIME	(1 << 10)
+#define FATTR_KILL_SUIDGID	(1 << 11)
 
 /**
  * Flags returned by the OPEN request
@@ -316,6 +321,11 @@ struct fuse_file_lock {
  *		       foffset and moffset fields in struct
  *		       fuse_setupmapping_out and fuse_removemapping_one.
  * FUSE_SUBMOUNTS: kernel supports auto-mounting directory submounts
+ * FUSE_HANDLE_KILLPRIV_V2: fs kills suid/sgid/cap on write/chown/trunc.
+ *			Upon write/truncate suid/sgid is only killed if caller
+ *			does not have CAP_FSETID. Additionally upon
+ *			write/truncate sgid is killed only if file has group
+ *			execute permission. (Same as Linux VFS behavior).
  */
 #define FUSE_ASYNC_READ		(1 << 0)
 #define FUSE_POSIX_LOCKS	(1 << 1)
@@ -345,6 +355,7 @@ struct fuse_file_lock {
 #define FUSE_EXPLICIT_INVAL_DATA (1 << 25)
 #define FUSE_MAP_ALIGNMENT	(1 << 26)
 #define FUSE_SUBMOUNTS		(1 << 27)
+#define FUSE_HANDLE_KILLPRIV_V2	(1 << 28)
 
 /**
  * CUSE INIT request/reply flags
@@ -378,7 +389,10 @@ struct fuse_file_lock {
  */
 #define FUSE_WRITE_CACHE	(1 << 0)
 #define FUSE_WRITE_LOCKOWNER	(1 << 1)
-#define FUSE_WRITE_KILL_PRIV	(1 << 2)
+#define FUSE_WRITE_KILL_SUIDGID	(1 << 2)
+
+/* Obsolete alias; this flag implies killing suid/sgid only. */
+#define FUSE_WRITE_KILL_PRIV	FUSE_WRITE_KILL_SUIDGID
 
 /**
  * Read flags
@@ -427,6 +441,12 @@ struct fuse_file_lock {
  */
 #define FUSE_ATTR_SUBMOUNT      (1 << 0)
 
+/**
+ * Open flags
+ * FUSE_OPEN_KILL_SUIDGID: Kill suid and sgid if executable
+ */
+#define FUSE_OPEN_KILL_SUIDGID	(1 << 0)
+
 enum fuse_opcode {
 	FUSE_LOOKUP		= 1,
 	FUSE_FORGET		= 2,  /* no reply */
@@ -588,14 +608,14 @@ struct fuse_setattr_in {
 
 struct fuse_open_in {
 	uint32_t	flags;
-	uint32_t	unused;
+	uint32_t	open_flags;
 };
 
 struct fuse_create_in {
 	uint32_t	flags;
 	uint32_t	mode;
 	uint32_t	umask;
-	uint32_t	padding;
+	uint32_t	open_flags;	/* FUSE_OPEN_... */
 };
 
 struct fuse_open_out {
diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
index 5aee5193eb..6f4a1ff3a9 100644
--- a/tools/virtiofsd/fuse_common.h
+++ b/tools/virtiofsd/fuse_common.h
@@ -359,6 +359,21 @@ struct fuse_file_info {
  */
 #define FUSE_CAP_SUBMOUNTS (1 << 27)
 
+/**
+ * Indicates that the filesystem is responsible for clearing
+ * security.capability xattr and clearing setuid and setgid bits. Following
+ * are the rules.
+ * - clear "security.capability" on write, truncate and chown unconditionally
+ * - clear suid/sgid if following is true. Note, sgid is cleared only if
+ *   group executable bit is set.
+ *    o setattr has FATTR_SIZE and FATTR_KILL_SUIDGID set.
+ *    o setattr has FATTR_UID or FATTR_GID
+ *    o open has O_TRUNC and FUSE_OPEN_KILL_SUIDGID
+ *    o create has O_TRUNC and FUSE_OPEN_KILL_SUIDGID flag set.
+ *    o write has FUSE_WRITE_KILL_SUIDGID
+ */
+#define FUSE_CAP_HANDLE_KILLPRIV_V2 (1 << 28)
+
 /**
  * Ioctl flags
  *
diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index c70fb16a9a..65f01a3fe3 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -865,7 +865,7 @@ static void do_setattr(fuse_req_t req, fuse_ino_t nodeid,
                       FUSE_SET_ATTR_GID | FUSE_SET_ATTR_SIZE |
                       FUSE_SET_ATTR_ATIME | FUSE_SET_ATTR_MTIME |
                       FUSE_SET_ATTR_ATIME_NOW | FUSE_SET_ATTR_MTIME_NOW |
-                      FUSE_SET_ATTR_CTIME;
+                      FUSE_SET_ATTR_CTIME | FUSE_SET_ATTR_KILL_SUIDGID;
 
         req->se->op.setattr(req, nodeid, &stbuf, arg->valid, fi);
     } else {
@@ -1079,6 +1079,7 @@ static void do_create(fuse_req_t req, fuse_ino_t nodeid,
 
         memset(&fi, 0, sizeof(fi));
         fi.flags = arg->flags;
+        fi.kill_priv = arg->open_flags & FUSE_OPEN_KILL_SUIDGID;
 
         req->ctx.umask = arg->umask;
 
@@ -1102,6 +1103,7 @@ static void do_open(fuse_req_t req, fuse_ino_t nodeid,
 
     memset(&fi, 0, sizeof(fi));
     fi.flags = arg->flags;
+    fi.kill_priv = arg->open_flags & FUSE_OPEN_KILL_SUIDGID;
 
     if (req->se->op.open) {
         req->se->op.open(req, nodeid, &fi);
@@ -1993,6 +1995,9 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     if (arg->flags & FUSE_SUBMOUNTS) {
         se->conn.capable |= FUSE_CAP_SUBMOUNTS;
     }
+    if (arg->flags & FUSE_HANDLE_KILLPRIV_V2) {
+        se->conn.capable |= FUSE_CAP_HANDLE_KILLPRIV_V2;
+    }
 #ifdef HAVE_SPLICE
 #ifdef HAVE_VMSPLICE
     se->conn.capable |= FUSE_CAP_SPLICE_WRITE | FUSE_CAP_SPLICE_MOVE;
@@ -2124,6 +2129,10 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     outarg.congestion_threshold = se->conn.congestion_threshold;
     outarg.time_gran = se->conn.time_gran;
 
+    if (se->conn.want & FUSE_CAP_HANDLE_KILLPRIV_V2) {
+        outarg.flags |= FUSE_HANDLE_KILLPRIV_V2;
+    }
+
     fuse_log(FUSE_LOG_DEBUG, "   INIT: %u.%u\n", outarg.major, outarg.minor);
     fuse_log(FUSE_LOG_DEBUG, "   flags=0x%08x\n", outarg.flags);
     fuse_log(FUSE_LOG_DEBUG, "   max_readahead=0x%08x\n", outarg.max_readahead);
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
index 9c06240f9e..96d10defc8 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -146,6 +146,7 @@ struct fuse_forget_data {
 #define FUSE_SET_ATTR_ATIME_NOW (1 << 7)
 #define FUSE_SET_ATTR_MTIME_NOW (1 << 8)
 #define FUSE_SET_ATTR_CTIME (1 << 10)
+#define FUSE_SET_ATTR_KILL_SUIDGID (1 << 11)
 
 /*
  * Request methods and replies
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 6407b1a2e1..36bdca449a 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -180,6 +180,7 @@ struct lo_data {
 
     /* An O_PATH file descriptor to /proc/self/fd/ */
     int proc_self_fd;
+    int user_killpriv_v2, killpriv_v2;
 };
 
 static const struct fuse_opt lo_opts[] = {
@@ -210,6 +211,8 @@ static const struct fuse_opt lo_opts[] = {
     { "allow_direct_io", offsetof(struct lo_data, allow_direct_io), 1 },
     { "no_allow_direct_io", offsetof(struct lo_data, allow_direct_io), 0 },
     { "announce_submounts", offsetof(struct lo_data, announce_submounts), 1 },
+    { "killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 1 },
+    { "no_killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 0 },
     FUSE_OPT_END
 };
 static bool use_syslog = false;
@@ -618,6 +621,34 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
         lo->announce_submounts = false;
     }
 #endif
+
+    if (lo->user_killpriv_v2 == 1) {
+        /*
+         * User explicitly asked for this option. Enable it unconditionally.
+         * If connection does not have this capability, it should fail
+         * in fuse_lowlevel.c
+         */
+        fuse_log(FUSE_LOG_DEBUG, "lo_init: enabling killpriv_v2\n");
+        conn->want |= FUSE_CAP_HANDLE_KILLPRIV_V2;
+        lo->killpriv_v2 = 1;
+    } else if (lo->user_killpriv_v2 == -1 &&
+               conn->capable & FUSE_CAP_HANDLE_KILLPRIV_V2) {
+        /*
+         * User did not specify a value for killpriv_v2. By default enable it
+         * if connection offers this capability
+         */
+        fuse_log(FUSE_LOG_DEBUG, "lo_init: enabling killpriv_v2\n");
+        conn->want |= FUSE_CAP_HANDLE_KILLPRIV_V2;
+        lo->killpriv_v2 = 1;
+    } else {
+        /*
+         * Either user specified to disable killpriv_v2, or connection does
+         * not offer this capability. Disable killpriv_v2 in both the cases
+         */
+        fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling killpriv_v2\n");
+        conn->want &= ~FUSE_CAP_HANDLE_KILLPRIV_V2;
+        lo->killpriv_v2 = 0;
+    }
 }
 
 static void lo_getattr(fuse_req_t req, fuse_ino_t ino,
@@ -702,7 +733,10 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
     }
     if (valid & FUSE_SET_ATTR_SIZE) {
         int truncfd;
+        bool kill_suidgid;
+        bool cap_fsetid_dropped = false;
 
+        kill_suidgid = lo->killpriv_v2 && (valid & FUSE_SET_ATTR_KILL_SUIDGID);
         if (fi) {
             truncfd = fd;
         } else {
@@ -714,8 +748,25 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
             }
         }
 
+        if (kill_suidgid) {
+            res = drop_effective_cap("FSETID", &cap_fsetid_dropped);
+            if (res != 0) {
+                saverr = res;
+                if (!fi) {
+                    close(truncfd);
+                }
+                goto out_err;
+            }
+        }
+
         res = ftruncate(truncfd, attr->st_size);
         saverr = res == -1 ? errno : 0;
+
+        if (cap_fsetid_dropped) {
+            if (gain_effective_cap("FSETID")) {
+                fuse_log(FUSE_LOG_ERR, "Failed to gain CAP_FSETID\n");
+            }
+        }
         if (!fi) {
             close(truncfd);
         }
@@ -1680,9 +1731,11 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
     struct fuse_entry_param e;
     int err;
     struct lo_cred old = {};
+    bool cap_fsetid_dropped = false;
+    bool kill_suidgid = lo->killpriv_v2 && fi->kill_priv;
 
-    fuse_log(FUSE_LOG_DEBUG, "lo_create(parent=%" PRIu64 ", name=%s)\n", parent,
-             name);
+    fuse_log(FUSE_LOG_DEBUG, "lo_create(parent=%" PRIu64 ", name=%s)"
+             " kill_priv=%d\n", parent, name, fi->kill_priv);
 
     if (!is_safe_path_component(name)) {
         fuse_reply_err(req, EINVAL);
@@ -1702,9 +1755,23 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
 
     update_open_flags(lo->writeback, lo->allow_direct_io, fi);
 
+    if (kill_suidgid) {
+        err = drop_effective_cap("FSETID", &cap_fsetid_dropped);
+        if (err != 0) {
+            lo_restore_cred(&old);
+            goto out;
+        }
+    }
+
     fd = openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_NOFOLLOW,
                 mode);
     err = fd == -1 ? errno : 0;
+
+    if (cap_fsetid_dropped) {
+        if (gain_effective_cap("FSETID")) {
+            fuse_log(FUSE_LOG_ERR, "Failed to gain CAP_FSETID\n");
+        }
+    }
     lo_restore_cred(&old);
 
     if (!err) {
@@ -1902,20 +1969,38 @@ static void lo_fsyncdir(fuse_req_t req, fuse_ino_t ino, int datasync,
 
 static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
 {
-    int fd;
+    int fd, ret;
     ssize_t fh;
     char buf[64];
     struct lo_data *lo = lo_data(req);
+    bool cap_fsetid_dropped = false;
+    bool kill_suidgid = lo->killpriv_v2 && fi->kill_priv;
 
-    fuse_log(FUSE_LOG_DEBUG, "lo_open(ino=%" PRIu64 ", flags=%d)\n", ino,
-             fi->flags);
+    fuse_log(FUSE_LOG_DEBUG, "lo_open(ino=%" PRIu64 ", flags=%d, kill_priv=%d)"
+             "\n", ino, fi->flags, fi->kill_priv);
 
     update_open_flags(lo->writeback, lo->allow_direct_io, fi);
 
     sprintf(buf, "%i", lo_fd(req, ino));
+
+    if (kill_suidgid) {
+        ret = drop_effective_cap("FSETID", &cap_fsetid_dropped);
+        if (ret != 0) {
+            fuse_reply_err(req, ret);
+            return;
+        }
+    }
+
     fd = openat(lo->proc_self_fd, buf, fi->flags & ~O_NOFOLLOW);
-    if (fd == -1) {
-        return (void)fuse_reply_err(req, errno);
+    ret = fd == -1 ? errno : 0;
+    if (cap_fsetid_dropped) {
+        if (gain_effective_cap("FSETID")) {
+            fuse_log(FUSE_LOG_ERR, "Failed to gain CAP_FSETID\n");
+        }
+    }
+
+    if (ret) {
+        return (void)fuse_reply_err(req, ret);
     }
 
     pthread_mutex_lock(&lo->mutex);
@@ -2049,12 +2134,14 @@ static void lo_write_buf(fuse_req_t req, fuse_ino_t ino,
     out_buf.buf[0].pos = off;
 
     fuse_log(FUSE_LOG_DEBUG,
-             "lo_write_buf(ino=%" PRIu64 ", size=%zd, off=%lu)\n", ino,
-             out_buf.buf[0].size, (unsigned long)off);
+             "lo_write_buf(ino=%" PRIu64 ", size=%zd, off=%lu kill_priv=%d)\n",
+             ino, out_buf.buf[0].size, (unsigned long)off, fi->kill_priv);
 
     /*
      * If kill_priv is set, drop CAP_FSETID which should lead to kernel
-     * clearing setuid/setgid on file.
+     * clearing setuid/setgid on file. Note, for WRITE, we need to do
+     * this even if killpriv_v2 is not enabled. fuse direct write path
+     * relies on this.
      */
     if (fi->kill_priv) {
         res = drop_effective_cap("FSETID", &cap_fsetid_dropped);
@@ -3433,6 +3520,7 @@ int main(int argc, char *argv[])
         .posix_lock = 0,
         .allow_direct_io = 0,
         .proc_self_fd = -1,
+        .user_killpriv_v2 = -1,
     };
     struct lo_map_elem *root_elem;
     int ret = -1;
-- 
2.25.4


