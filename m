Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B56D314477
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:05:13 +0100 (CET)
Received: from localhost ([::1]:33238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GWm-0007Dp-H2
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:05:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l9FD6-0005Eb-Ls
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:40:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l9FD1-0006Yj-F2
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612824042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cw/sMGIf/uMCDRvyoAv7IQmxQlDUE/AzW76vvNmKtcI=;
 b=g1F3qbpAolYKG9hVyTyOXxdUCNJ2Yf1xr7lFZ44ZqX47r+MGen1cc2PUZabuZfkJ8aOjYq
 YQlcISCQz4yXJjePKCfagHvdDJVWjNiK2jgRvehtlpn9Vj8lGqHBxo+X89m7ugk/6t3DL+
 fZswd8e6CbSyRIql4jRlm8JOFN6Sp8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-Qw2UNRxvPjeRlew14ud5Rw-1; Mon, 08 Feb 2021 17:40:39 -0500
X-MC-Unique: Qw2UNRxvPjeRlew14ud5Rw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A8E46D4E8;
 Mon,  8 Feb 2021 22:40:38 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-237.rdu2.redhat.com [10.10.115.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4825E19C78;
 Mon,  8 Feb 2021 22:40:32 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id D61AB223D99; Mon,  8 Feb 2021 17:40:31 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v3 2/2] viriofsd: Add support for FUSE_HANDLE_KILLPRIV_V2
Date: Mon,  8 Feb 2021 17:40:24 -0500
Message-Id: <20210208224024.43555-3-vgoyal@redhat.com>
In-Reply-To: <20210208224024.43555-1-vgoyal@redhat.com>
References: <20210208224024.43555-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mszeredi@redhat.com, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com, groug@kaod.org
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

v3:
  - Resolved conflicts due to lo_inode_open() changes.
  - Moved capability code in lo_do_open() so that both lo_open() and
    lo_create() can benefit from common code.
  - Dropped changes to kernel headers as these are part of qemu already.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_common.h    | 15 ++++++
 tools/virtiofsd/fuse_lowlevel.c  | 11 ++++-
 tools/virtiofsd/fuse_lowlevel.h  |  1 +
 tools/virtiofsd/passthrough_ll.c | 84 +++++++++++++++++++++++++++++---
 4 files changed, 103 insertions(+), 8 deletions(-)

diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
index a090040bb2..fa9671872e 100644
--- a/tools/virtiofsd/fuse_common.h
+++ b/tools/virtiofsd/fuse_common.h
@@ -357,6 +357,21 @@ struct fuse_file_info {
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
index e94b71110b..f78692ef66 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -855,7 +855,7 @@ static void do_setattr(fuse_req_t req, fuse_ino_t nodeid,
                       FUSE_SET_ATTR_GID | FUSE_SET_ATTR_SIZE |
                       FUSE_SET_ATTR_ATIME | FUSE_SET_ATTR_MTIME |
                       FUSE_SET_ATTR_ATIME_NOW | FUSE_SET_ATTR_MTIME_NOW |
-                      FUSE_SET_ATTR_CTIME;
+                      FUSE_SET_ATTR_CTIME | FUSE_SET_ATTR_KILL_SUIDGID;
 
         req->se->op.setattr(req, nodeid, &stbuf, arg->valid, fi);
     } else {
@@ -1069,6 +1069,7 @@ static void do_create(fuse_req_t req, fuse_ino_t nodeid,
 
         memset(&fi, 0, sizeof(fi));
         fi.flags = arg->flags;
+        fi.kill_priv = arg->open_flags & FUSE_OPEN_KILL_SUIDGID;
 
         req->ctx.umask = arg->umask;
 
@@ -1092,6 +1093,7 @@ static void do_open(fuse_req_t req, fuse_ino_t nodeid,
 
     memset(&fi, 0, sizeof(fi));
     fi.flags = arg->flags;
+    fi.kill_priv = arg->open_flags & FUSE_OPEN_KILL_SUIDGID;
 
     if (req->se->op.open) {
         req->se->op.open(req, nodeid, &fi);
@@ -1983,6 +1985,9 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     if (arg->flags & FUSE_SUBMOUNTS) {
         se->conn.capable |= FUSE_CAP_SUBMOUNTS;
     }
+    if (arg->flags & FUSE_HANDLE_KILLPRIV_V2) {
+        se->conn.capable |= FUSE_CAP_HANDLE_KILLPRIV_V2;
+    }
 #ifdef HAVE_SPLICE
 #ifdef HAVE_VMSPLICE
     se->conn.capable |= FUSE_CAP_SPLICE_WRITE | FUSE_CAP_SPLICE_MOVE;
@@ -2114,6 +2119,10 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
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
index 0e10a14bc9..3bf786b034 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -143,6 +143,7 @@ struct fuse_forget_data {
 #define FUSE_SET_ATTR_ATIME_NOW (1 << 7)
 #define FUSE_SET_ATTR_MTIME_NOW (1 << 8)
 #define FUSE_SET_ATTR_CTIME (1 << 10)
+#define FUSE_SET_ATTR_KILL_SUIDGID (1 << 11)
 
 /*
  * Request methods and replies
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 5dd6a4a4a6..74ce7b8e26 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -168,6 +168,7 @@ struct lo_data {
 
     /* An O_PATH file descriptor to /proc/self/fd/ */
     int proc_self_fd;
+    int user_killpriv_v2, killpriv_v2;
 };
 
 static const struct fuse_opt lo_opts[] = {
@@ -198,6 +199,8 @@ static const struct fuse_opt lo_opts[] = {
     { "allow_direct_io", offsetof(struct lo_data, allow_direct_io), 1 },
     { "no_allow_direct_io", offsetof(struct lo_data, allow_direct_io), 0 },
     { "announce_submounts", offsetof(struct lo_data, announce_submounts), 1 },
+    { "killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 1 },
+    { "no_killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 0 },
     FUSE_OPT_END
 };
 static bool use_syslog = false;
@@ -630,6 +633,34 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
                  "does not support it\n");
         lo->announce_submounts = false;
     }
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
@@ -714,7 +745,10 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
     }
     if (valid & FUSE_SET_ATTR_SIZE) {
         int truncfd;
+        bool kill_suidgid;
+        bool cap_fsetid_dropped = false;
 
+        kill_suidgid = lo->killpriv_v2 && (valid & FUSE_SET_ATTR_KILL_SUIDGID);
         if (fi) {
             truncfd = fd;
         } else {
@@ -725,8 +759,25 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
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
@@ -1709,11 +1760,27 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
 {
     ssize_t fh;
     int fd = existing_fd;
+    int err;
+    bool cap_fsetid_dropped = false;
+    bool kill_suidgid = lo->killpriv_v2 && fi->kill_priv;
 
     update_open_flags(lo->writeback, lo->allow_direct_io, fi);
 
     if (fd < 0) {
+        if (kill_suidgid) {
+            err = drop_effective_cap("FSETID", &cap_fsetid_dropped);
+            if (err) {
+                return err;
+            }
+        }
+
         fd = lo_inode_open(lo, inode, fi->flags);
+
+        if (cap_fsetid_dropped) {
+            if (gain_effective_cap("FSETID")) {
+                fuse_log(FUSE_LOG_ERR, "Failed to gain CAP_FSETID\n");
+            }
+        }
         if (fd < 0) {
             return -fd;
         }
@@ -1747,8 +1814,8 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
     int err;
     struct lo_cred old = {};
 
-    fuse_log(FUSE_LOG_DEBUG, "lo_create(parent=%" PRIu64 ", name=%s)\n", parent,
-             name);
+    fuse_log(FUSE_LOG_DEBUG, "lo_create(parent=%" PRIu64 ", name=%s)"
+             " kill_priv=%d\n", parent, name, fi->kill_priv);
 
     if (!is_safe_path_component(name)) {
         fuse_reply_err(req, EINVAL);
@@ -1981,8 +2048,8 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
     struct lo_inode *inode = lo_inode(req, ino);
     int err;
 
-    fuse_log(FUSE_LOG_DEBUG, "lo_open(ino=%" PRIu64 ", flags=%d)\n", ino,
-             fi->flags);
+    fuse_log(FUSE_LOG_DEBUG, "lo_open(ino=%" PRIu64 ", flags=%d, kill_priv=%d)"
+             "\n", ino, fi->flags, fi->kill_priv);
 
     if (!inode) {
         fuse_reply_err(req, EBADF);
@@ -2121,12 +2188,14 @@ static void lo_write_buf(fuse_req_t req, fuse_ino_t ino,
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
@@ -3534,6 +3603,7 @@ int main(int argc, char *argv[])
         .posix_lock = 0,
         .allow_direct_io = 0,
         .proc_self_fd = -1,
+        .user_killpriv_v2 = -1,
     };
     struct lo_map_elem *root_elem;
     struct lo_map_elem *reserve_elem;
-- 
2.25.4


