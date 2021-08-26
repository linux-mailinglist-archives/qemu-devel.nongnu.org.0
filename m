Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3703F9031
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:36:17 +0200 (CEST)
Received: from localhost ([::1]:53822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJN2m-0005ZR-9C
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mJMnG-00067s-Ke
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:20:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mJMnD-00038F-88
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:20:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630012809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ej4BQlDyf/RX0fz2OHmOyIXmS6uOAnkuOzgjyfuQIbU=;
 b=EkBhSaVtHPofqMXuxARYfD+rUs+Nw1EZK4/7vWgXV0703wVaC6nZAM0Sm2nPRQaZAY1z4R
 UhVgGY4cB+kfoZlXObj2aWaY3u7RIOZxYkPJJYwNEChfG1q8YPwmNY4r3Bd6JaQIJnEOWw
 XmKOs5OVFgchA9PBJauDqbRSCOhJRKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-PKkFc9YDO7GxFvEi7sxTOg-1; Thu, 26 Aug 2021 17:20:08 -0400
X-MC-Unique: PKkFc9YDO7GxFvEi7sxTOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A6D98031F9
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 21:19:47 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.17.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2AB86A8FB;
 Thu, 26 Aug 2021 21:19:46 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 802D42281A8; Thu, 26 Aug 2021 17:19:46 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 1/2] virtiofsd: Add an array to keep track of blocked xattrs
Date: Thu, 26 Aug 2021 17:19:36 -0400
Message-Id: <20210826211937.317558-2-vgoyal@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
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

Right now we have capability to block "system.posix_acl_access" and
"system.posix_acl_default" xattrs. But we have sort of hardcoded these
two values and its not generic.

Now we want to support blocking of arbitrary xattr as passed in
by user. So let us keep an array of blocked xattrs and consult
that array when deciding whether an attribute is blocked or not.

This should not result any functional change.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 77 ++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 14 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 38b2af8599..9e93bcdbb3 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -176,6 +176,8 @@ struct lo_data {
     /* If set, virtiofsd is responsible for setting umask during creation */
     bool change_umask;
     int user_posix_acl, posix_acl;
+    char **blocked_xattrs;
+    size_t num_blocked_xattrs;
 };
 
 static const struct fuse_opt lo_opts[] = {
@@ -2811,19 +2813,57 @@ static int xattr_map_server(const struct lo_data *lo, const char *server_name,
         assert(fchdir_res == 0);                       \
     } while (0)
 
+/* Returns 0 on success, 1 on failure */
+static int add_blocked_xattr(struct lo_data *lo, const char *name)
+{
+    size_t nr_elems = lo->num_blocked_xattrs + 1;
+
+    lo->blocked_xattrs = reallocarray(lo->blocked_xattrs, nr_elems,
+                                      sizeof(char *));
+    if (!lo->blocked_xattrs) {
+        fuse_log(FUSE_LOG_ERR, "failed to grow blocked xattrs array: %m\n");
+        return 1;
+    }
+
+    lo->blocked_xattrs[nr_elems - 1] = strdup(name);
+    if (!lo->blocked_xattrs[nr_elems - 1]) {
+        fuse_log(FUSE_LOG_ERR, "strdup(%s) failed: %m\n", name);
+        return 1;
+    }
+    lo->num_blocked_xattrs++;
+    return 0;
+}
+
+static void free_blocked_xattrs(struct lo_data *lo)
+{
+    size_t i;
+
+    if (!lo->num_blocked_xattrs) {
+        return;
+    }
+
+    for (i = 0; i < lo->num_blocked_xattrs; i++) {
+        free(lo->blocked_xattrs[i]);
+    }
+
+    free(lo->blocked_xattrs);
+    lo->num_blocked_xattrs = 0;
+    lo->blocked_xattrs = NULL;
+}
+
 static bool block_xattr(struct lo_data *lo, const char *name)
 {
-    /*
-     * If user explicitly enabled posix_acl or did not provide any option,
-     * do not block acl. Otherwise block system.posix_acl_access and
-     * system.posix_acl_default xattrs.
-     */
-    if (lo->user_posix_acl) {
+    size_t i;
+
+    if (!lo->num_blocked_xattrs) {
         return false;
     }
-    if (!strcmp(name, "system.posix_acl_access") ||
-        !strcmp(name, "system.posix_acl_default"))
+
+    for (i = 0; i < lo->num_blocked_xattrs; i++) {
+        if (!strcmp(name, lo->blocked_xattrs[i])) {
             return true;
+        }
+    }
 
     return false;
 }
@@ -2840,12 +2880,7 @@ static int remove_blocked_xattrs(struct lo_data *lo, char *xattr_list,
 {
     size_t out_index, in_index;
 
-    /*
-     * As of now we only filter out acl xattrs. If acls are enabled or
-     * they have not been explicitly disabled, there is nothing to
-     * filter.
-     */
-    if (lo->user_posix_acl) {
+    if (!lo->num_blocked_xattrs) {
         return in_size;
     }
 
@@ -3880,6 +3915,7 @@ static void fuse_lo_data_cleanup(struct lo_data *lo)
     free(lo->xattrmap);
     free_xattrmap(lo);
     free(lo->xattr_security_capability);
+    free_blocked_xattrs(lo);
     free(lo->source);
 }
 
@@ -3920,6 +3956,8 @@ int main(int argc, char *argv[])
     lo.root.fd = -1;
     lo.root.fuse_ino = FUSE_ROOT_ID;
     lo.cache = CACHE_AUTO;
+    lo.num_blocked_xattrs = 0;
+    lo.blocked_xattrs = NULL;
 
     /*
      * Set up the ino map like this:
@@ -4036,6 +4074,17 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
+    if (!lo.user_posix_acl) {
+        /* User disabled posix acl explicitly. Block acl xattrs */
+        if (add_blocked_xattr(&lo, "system.posix_acl_access")) {
+            exit(1);
+        }
+
+        if (add_blocked_xattr(&lo, "system.posix_acl_default")) {
+            exit(1);
+        }
+    }
+
     lo.use_statx = true;
 
     se = fuse_session_new(&args, &lo_oper, sizeof(lo_oper), &lo);
-- 
2.31.1


