Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1746A3ABB37
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 20:14:57 +0200 (CEST)
Received: from localhost ([::1]:56370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwXY-0000jn-5g
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 14:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1ltwVP-0006Sp-AF
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:12:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1ltwVM-0001ut-Cf
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 14:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623953559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+5qrICfTB7GphnRT+6zYh+pRY4e8thDeLKyu1/D3TPs=;
 b=YmyO6Rx1nt1MQv1lE+Oji8og5KwuBK5d9LL7uwEKwkisb+yZ+8pFvfFF+m/z9/RVH31I2S
 ZV6SG+C5LLCiTAiFo4revdEnuj37BDflnKXWKl6M+xs1V7TFD6I1i2hQtpzpVYYo9JTsBu
 eBlW28PMzC/ylT94ui1+8FTSX5KVvzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-9pTULrB8M2SG-0EY7123VA-1; Thu, 17 Jun 2021 14:12:36 -0400
X-MC-Unique: 9pTULrB8M2SG-0EY7123VA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 956911084F50;
 Thu, 17 Jun 2021 18:12:35 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-162.rdu2.redhat.com [10.10.116.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6023F60C05;
 Thu, 17 Jun 2021 18:12:35 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 19565225FD4; Thu, 17 Jun 2021 14:12:31 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 8/8] virtiofsd: Add an option to enable/disable posix acls
Date: Thu, 17 Jun 2021 14:12:13 -0400
Message-Id: <20210617181213.1177835-9-vgoyal@redhat.com>
In-Reply-To: <20210617181213.1177835-1-vgoyal@redhat.com>
References: <20210617181213.1177835-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, lhenriques@suse.de, dgilbert@redhat.com,
 vgoyal@redhat.com, miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fuse has an option FUSE_POSIX_ACL which needs to be opted in by fuse
server to enable posix acls. As of now we are not opting in for this,
so posix acls are disabled on virtiofs by default.

Add virtiofsd option "-o posix_acl/no_posix_acl" to let users enable/disable
posix acl support. By default it is disabled as of now due to performance
concerns with cache=none.

Currently even if file server has not opted in for FUSE_POSIX_ACL, user can
still query acl and set acl, and system.posix_acl_access and
system.posix_acl_default xattrs show up listxattr response.

Miklos said this is confusing. So he said lets block and filter
system.posix_acl_access and system.posix_acl_default xattrs in
getxattr/setxattr/listxattr if user has explicitly disabled
posix acls using -o no_posix_acl.

As of now continuing to keeping the existing behavior if user did not
specify any option to disable acl support due to concerns about backward
compatibility.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 docs/tools/virtiofsd.rst         |   3 +
 tools/virtiofsd/helper.c         |   1 +
 tools/virtiofsd/passthrough_ll.c | 115 ++++++++++++++++++++++++++++++-
 3 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index 00554c75bd..a41f934999 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -101,6 +101,9 @@ Options
     Enable/disable extended attributes (xattr) on files and directories.  The
     default is ``no_xattr``.
 
+  * posix_acl|no_posix_acl -
+    Enable/disable posix acl support.  Posix ACLs are disabled by default`.
+
 .. option:: --socket-path=PATH
 
   Listen on vhost-user UNIX domain socket at PATH.
diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
index 5e98ed702b..a8295d975a 100644
--- a/tools/virtiofsd/helper.c
+++ b/tools/virtiofsd/helper.c
@@ -186,6 +186,7 @@ void fuse_cmdline_help(void)
            "                               to virtiofsd from guest applications.\n"
            "                               default: no_allow_direct_io\n"
            "    -o announce_submounts      Announce sub-mount points to the guest\n"
+           "    -o posix_acl/no_posix_acl  Enable/Disable posix_acl. (default: disabled)\n"
            );
 }
 
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index cf7c39b9e4..110eb5a27a 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -175,7 +175,7 @@ struct lo_data {
     int user_killpriv_v2, killpriv_v2;
     /* If set, virtiofsd is responsible for setting umask during creation */
     bool change_umask;
-    int posix_acl;
+    int user_posix_acl, posix_acl;
 };
 
 static const struct fuse_opt lo_opts[] = {
@@ -208,6 +208,8 @@ static const struct fuse_opt lo_opts[] = {
     { "announce_submounts", offsetof(struct lo_data, announce_submounts), 1 },
     { "killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 1 },
     { "no_killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 0 },
+    { "posix_acl", offsetof(struct lo_data, user_posix_acl), 1 },
+    { "no_posix_acl", offsetof(struct lo_data, user_posix_acl), 0 },
     FUSE_OPT_END
 };
 static bool use_syslog = false;
@@ -706,6 +708,32 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
         conn->want &= ~FUSE_CAP_HANDLE_KILLPRIV_V2;
         lo->killpriv_v2 = 0;
     }
+
+    if (lo->user_posix_acl == 1) {
+        /*
+         * User explicitly asked for this option. Enable it unconditionally.
+         * If connection does not have this capability, print error message
+         * now. It will fail later in fuse_lowlevel.c
+         */
+        if (!(conn->capable & FUSE_CAP_POSIX_ACL) ||
+            !(conn->capable & FUSE_CAP_DONT_MASK) ||
+            !(conn->capable & FUSE_CAP_SETXATTR_EXT)) {
+            fuse_log(FUSE_LOG_ERR, "lo_init: Can not enable posix acl."
+                     " kernel does not support FUSE_POSIX_ACL, FUSE_DONT_MASK"
+                     " or FUSE_SETXATTR_EXT capability.\n");
+        } else {
+            fuse_log(FUSE_LOG_DEBUG, "lo_init: enabling posix acl\n");
+        }
+
+        conn->want |= FUSE_CAP_POSIX_ACL | FUSE_CAP_DONT_MASK |
+                      FUSE_CAP_SETXATTR_EXT;
+        lo->change_umask = true;
+        lo->posix_acl = true;
+    } else {
+        /* User either did not specify anything or wants it disabled */
+        fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling posix_acl\n");
+        conn->want &= ~FUSE_CAP_POSIX_ACL;
+    }
 }
 
 static void lo_getattr(fuse_req_t req, fuse_ino_t ino,
@@ -2783,6 +2811,63 @@ static int xattr_map_server(const struct lo_data *lo, const char *server_name,
         assert(fchdir_res == 0);                       \
     } while (0)
 
+static bool block_xattr(struct lo_data *lo, const char *name)
+{
+    /*
+     * If user explicitly enabled posix_acl or did not provide any option,
+     * do not block acl. Otherwise block system.posix_acl_access and
+     * system.posix_acl_default xattrs.
+     */
+    if (lo->user_posix_acl) {
+        return false;
+    }
+    if (!strcmp(name, "system.posix_acl_access") ||
+        !strcmp(name, "system.posix_acl_default"))
+            return true;
+
+    return false;
+}
+
+/*
+ * Returns number of bytes in xattr_list after filtering on success. This
+ * could be zero as well if nothing is left after filtering.
+ *
+ * Returns negative error code on failure.
+ * xattr_list is modified in place.
+ */
+static int remove_blocked_xattrs(struct lo_data *lo, char *xattr_list,
+                                 unsigned in_size)
+{
+    size_t out_index, in_index;
+
+    /*
+     * As of now we only filter out acl xattrs. If acls are enabled or
+     * they have not been explicitly disabled, there is nothing to
+     * filter.
+     */
+    if (lo->user_posix_acl) {
+        return in_size;
+    }
+
+    out_index = 0;
+    in_index = 0;
+    while (in_index < in_size) {
+        char *in_ptr = xattr_list + in_index;
+
+        /* Length of current attribute name */
+        size_t in_len = strlen(xattr_list + in_index) + 1;
+
+        if (!block_xattr(lo, in_ptr)) {
+            if (in_index != out_index) {
+                memmove(xattr_list + out_index, xattr_list + in_index, in_len);
+            }
+            out_index += in_len;
+        }
+        in_index += in_len;
+     }
+    return out_index;
+}
+
 static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
                         size_t size)
 {
@@ -2796,6 +2881,11 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
     int saverr;
     int fd = -1;
 
+    if (block_xattr(lo, in_name)) {
+        fuse_reply_err(req, EOPNOTSUPP);
+        return;
+    }
+
     mapped_name = NULL;
     name = in_name;
     if (lo->xattrmap) {
@@ -2986,6 +3076,12 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
                 goto out;
             }
         }
+
+        ret = remove_blocked_xattrs(lo, value, ret);
+        if (ret <= 0) {
+            saverr = -ret;
+            goto out;
+        }
         fuse_reply_buf(req, value, ret);
     } else {
         /*
@@ -3026,6 +3122,11 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
     bool cap_fsetid_dropped = false;
     struct lo_cred old = {};
 
+    if (block_xattr(lo, in_name)) {
+        fuse_reply_err(req, EOPNOTSUPP);
+        return;
+    }
+
     mapped_name = NULL;
     name = in_name;
     if (lo->xattrmap) {
@@ -3118,6 +3219,11 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
     int saverr;
     int fd = -1;
 
+    if (block_xattr(lo, in_name)) {
+        fuse_reply_err(req, EOPNOTSUPP);
+        return;
+    }
+
     mapped_name = NULL;
     name = in_name;
     if (lo->xattrmap) {
@@ -3812,6 +3918,7 @@ int main(int argc, char *argv[])
         .allow_direct_io = 0,
         .proc_self_fd = -1,
         .user_killpriv_v2 = -1,
+        .user_posix_acl = -1,
     };
     struct lo_map_elem *root_elem;
     struct lo_map_elem *reserve_elem;
@@ -3940,6 +4047,12 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
+    if (lo.user_posix_acl == 1 && !lo.xattr) {
+        fuse_log(FUSE_LOG_ERR, "Can't enable posix ACLs. xattrs are disabled."
+                 "\n");
+        exit(1);
+    }
+
     lo.use_statx = true;
 
     se = fuse_session_new(&args, &lo_oper, sizeof(lo_oper), &lo);
-- 
2.25.4


