Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4970F3F9035
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:38:11 +0200 (CEST)
Received: from localhost ([::1]:60230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJN4X-0001UH-B9
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mJMnO-0006Jb-L8
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:20:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mJMnM-0003FP-2X
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630012819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1VJhbwoZfoEX/qUOvpVOqjzUcNw33zvAuxlLHDtSvP8=;
 b=VrqSCYosrk2De3nLYKh7k44EwxD9TT8Av2K6et2+EO4BM2OonIcA8Xi3TPc49wuI59FxbC
 sHL+OjAPI60IYptQ4e4TQTFJD2rpanOVd4MtvwIsyCMNYXRQsnrqycmMzhwEtpi/nIjxqR
 yjEnfmTV0FadfC9Ds9WKQQGS0P9nkRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-DtVn6aLcP6mqBH4bihSiSw-1; Thu, 26 Aug 2021 17:20:17 -0400
X-MC-Unique: DtVn6aLcP6mqBH4bihSiSw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39CA8CF98D
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 21:19:47 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.17.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2A016A8F8;
 Thu, 26 Aug 2021 21:19:46 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 876FB2281A9; Thu, 26 Aug 2021 17:19:46 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 2/2] virtiofsd: Add option "block_xattr=" to block certain
 xattrs
Date: Thu, 26 Aug 2021 17:19:37 -0400
Message-Id: <20210826211937.317558-3-vgoyal@redhat.com>
In-Reply-To: <20210826211937.317558-1-vgoyal@redhat.com>
References: <20210826211937.317558-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: dgilbert@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need capability to block security.selinux xattr and return EOPNOTSUPP.
That way guest SELinux thinks filesystem does not support selinux
xattr and falls back to some default label (virtiofs_t) for the
virtiofs filesystem instance.

So add a generic option "-o block_xattr=", which can allow user to
specify a list of xattrs to block. Xattrs should be ":" separated.
For example, "-o block_xattr=security.selinux:user.foo".

Valid xattrs to block should belong to one of of the "security",
"system", "trusted" or "user" xattr namespace.

Ex. -o block_xattr="security.selinux:user.foo"

One can also specify prefix which should be matched against xattr
name and if prefix matches, that xattr will be blocked. Requirement
of xattr belonging to one of the 4 namepsaces still remain in place.

For example -o block_xattr="user.virtiofs*" should block any
xattr name starting with prefix "user.virtiofs".

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 docs/tools/virtiofsd.rst         |  17 ++++++
 tools/virtiofsd/helper.c         |   3 +
 tools/virtiofsd/passthrough_ll.c | 101 ++++++++++++++++++++++++++++---
 3 files changed, 114 insertions(+), 7 deletions(-)

diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index b208f2a6f0..406c1ab721 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -101,6 +101,23 @@ Options
     Enable/disable extended attributes (xattr) on files and directories.  The
     default is ``no_xattr``.
 
+  * block_xattr=<list-of-xattrs> -
+    Block xattrs specified in the colon separated list. When an xattr
+    is blocked getxattr/setxattr/removexattr return error code
+    EOPNOTSUPP, and listxattr removes the xattr from list if there is one.
+
+    xattr name should belong to one of the four namespsaces, namely
+    security, system, trusted and user.
+
+    e.g. -o block_xattr=security.selinux:user.foo
+
+    One could also specify just a xattr name prefix followed by "*" to
+    signify any xattr name matching prefix will be blocked.
+
+    e.g -o block_xattr=user.foo*
+
+    This will block any xattr name starting with "user.foo"
+
   * posix_acl|no_posix_acl -
     Enable/disable posix acl support.  Posix ACLs are disabled by default.
 
diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
index a8295d975a..da674ff70a 100644
--- a/tools/virtiofsd/helper.c
+++ b/tools/virtiofsd/helper.c
@@ -175,6 +175,9 @@ void fuse_cmdline_help(void)
            "    -o xattrmap=<mapping>      Enable xattr mapping (enables xattr)\n"
            "                               <mapping> is a string consists of a series of rules\n"
            "                               e.g. -o xattrmap=:map::user.virtiofs.:\n"
+           "    -o block_xattr=<xattrs>    Block xattrs specified in list\n"
+           "                               <xattrs> is colon separated list of xattrs to block\n"
+           "                               e.g. -o block_xattr=security.selinux:user.*\n"
            "    -o modcaps=CAPLIST         Modify the list of capabilities\n"
            "                               e.g. -o modcaps=+sys_admin:-chown\n"
            "    --rlimit-nofile=<num>      set maximum number of file descriptors\n"
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 9e93bcdbb3..2008e6be55 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -142,6 +142,12 @@ typedef struct xattr_map_entry {
     unsigned int flags;
 } XattrMapEntry;
 
+struct xattr_block_entry {
+    /* true if name is prefix otherwise false */
+    bool prefix;
+    char *name;
+};
+
 struct lo_data {
     pthread_mutex_t mutex;
     int sandbox;
@@ -176,8 +182,9 @@ struct lo_data {
     /* If set, virtiofsd is responsible for setting umask during creation */
     bool change_umask;
     int user_posix_acl, posix_acl;
-    char **blocked_xattrs;
+    struct xattr_block_entry *blocked_xattrs;
     size_t num_blocked_xattrs;
+    char *block_xattr_str;
 };
 
 static const struct fuse_opt lo_opts[] = {
@@ -212,6 +219,7 @@ static const struct fuse_opt lo_opts[] = {
     { "no_killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 0 },
     { "posix_acl", offsetof(struct lo_data, user_posix_acl), 1 },
     { "no_posix_acl", offsetof(struct lo_data, user_posix_acl), 0 },
+    { "block_xattr=%s", offsetof(struct lo_data, block_xattr_str), 0 },
     FUSE_OPT_END
 };
 static bool use_syslog = false;
@@ -2817,23 +2825,88 @@ static int xattr_map_server(const struct lo_data *lo, const char *server_name,
 static int add_blocked_xattr(struct lo_data *lo, const char *name)
 {
     size_t nr_elems = lo->num_blocked_xattrs + 1;
+    struct xattr_block_entry *xbe;
+    char *ptr;
 
     lo->blocked_xattrs = reallocarray(lo->blocked_xattrs, nr_elems,
-                                      sizeof(char *));
+                                      sizeof(struct xattr_block_entry));
     if (!lo->blocked_xattrs) {
         fuse_log(FUSE_LOG_ERR, "failed to grow blocked xattrs array: %m\n");
         return 1;
     }
 
-    lo->blocked_xattrs[nr_elems - 1] = strdup(name);
-    if (!lo->blocked_xattrs[nr_elems - 1]) {
+    xbe = &lo->blocked_xattrs[nr_elems - 1];
+    xbe->prefix = false;
+
+    ptr = strchr(name, '*');
+    if (ptr) {
+        xbe->prefix = true;
+        *ptr = '\0';
+    }
+
+    xbe->name = strdup(name);
+    if (!xbe->name) {
         fuse_log(FUSE_LOG_ERR, "strdup(%s) failed: %m\n", name);
         return 1;
     }
+
     lo->num_blocked_xattrs++;
     return 0;
 }
 
+/* Returns true on success, false on error */
+static bool valid_block_xattr(char *name)
+{
+    char *ptr;
+
+    if (!g_str_has_prefix(name, "user.") &&
+        !g_str_has_prefix(name, "system.") &&
+        !g_str_has_prefix(name, "security.") &&
+        !g_str_has_prefix(name, "trusted.")) {
+        return false;
+    }
+
+    ptr = strchr(name, '*');
+    if (!ptr) {
+        return true;
+    }
+
+    /* if there is a '*' in name, it should be last char */
+    if (*++ptr != '\0') {
+        return false;
+    }
+    return true;
+}
+
+/* Returns 0 on success, 1 on error */
+static int parse_block_xattr(struct lo_data *lo, char *block_xattr_str)
+{
+    char *token, *parse_str;
+
+    /* strtok() modifies the string passed. So work on the copy */
+    parse_str = strdup(block_xattr_str);
+    if (!parse_str) {
+        fuse_log(FUSE_LOG_ERR, "Failed strdup(%s):%m\n", block_xattr_str);
+        return 1;
+    }
+
+    while ((token = strtok(parse_str, ":"))) {
+        parse_str = NULL;
+        if (!valid_block_xattr(token)) {
+            fuse_log(FUSE_LOG_ERR, "Invalid xattr to block: %s\n", token);
+            return 1;
+        }
+        if (add_blocked_xattr(lo, token)) {
+            fuse_log(FUSE_LOG_ERR, "Failed to add blocked xattr %s\n",
+                     token);
+            free(parse_str);
+            return 1;
+        }
+    }
+    free(parse_str);
+    return 0;
+}
+
 static void free_blocked_xattrs(struct lo_data *lo)
 {
     size_t i;
@@ -2843,7 +2916,7 @@ static void free_blocked_xattrs(struct lo_data *lo)
     }
 
     for (i = 0; i < lo->num_blocked_xattrs; i++) {
-        free(lo->blocked_xattrs[i]);
+        free(lo->blocked_xattrs[i].name);
     }
 
     free(lo->blocked_xattrs);
@@ -2854,14 +2927,22 @@ static void free_blocked_xattrs(struct lo_data *lo)
 static bool block_xattr(struct lo_data *lo, const char *name)
 {
     size_t i;
+    struct xattr_block_entry *xbe;
 
     if (!lo->num_blocked_xattrs) {
         return false;
     }
 
     for (i = 0; i < lo->num_blocked_xattrs; i++) {
-        if (!strcmp(name, lo->blocked_xattrs[i])) {
-            return true;
+        xbe = &lo->blocked_xattrs[i];
+        if (xbe->prefix) {
+            if (g_str_has_prefix(name, xbe->name)) {
+                return true;
+            }
+        } else {
+            if (!strcmp(name, xbe->name)) {
+                return true;
+            }
         }
     }
 
@@ -4068,6 +4149,12 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
+    if (lo.block_xattr_str) {
+        if (parse_block_xattr(&lo, lo.block_xattr_str)) {
+            exit(1);
+        }
+    }
+
     if (lo.user_posix_acl == 1 && !lo.xattr) {
         fuse_log(FUSE_LOG_ERR, "Can't enable posix ACLs. xattrs are disabled."
                  "\n");
-- 
2.31.1


