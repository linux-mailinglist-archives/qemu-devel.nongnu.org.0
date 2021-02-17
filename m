Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F46431E306
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:34:49 +0100 (CET)
Received: from localhost ([::1]:58394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWLI-0005iA-7w
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lCWHq-0003K3-Cv
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:31:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lCWHn-0001wk-7V
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613604669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sYPS8Pue36yR43T8dgX+RjLt/Zf5JUp8lUWCh2alLbw=;
 b=AvUYdc6XmKW1D0rxW8dnAOwmhkg1hl3tPqdCJ8U5Kyn57Gn2oOBLozj5vz90QIc4SsA3QO
 qpBNC2x8SaV/+VbPeXu5DV9H95z89GUDHBEcFTVJn7iijC6pSmOzCN+16zuGKXZd5JapNS
 tKryvI/zhXn3NIXMp6UbQci6Dm5Yl+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-U25HV5WgOoKALheem2RKdw-1; Wed, 17 Feb 2021 18:31:06 -0500
X-MC-Unique: U25HV5WgOoKALheem2RKdw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB6D880402C;
 Wed, 17 Feb 2021 23:31:04 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-123.rdu2.redhat.com [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D6CA6F440;
 Wed, 17 Feb 2021 23:30:58 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id E922C223D98; Wed, 17 Feb 2021 18:30:57 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v2 1/3] virtiofsd: Add an option to enable/disable posix acls
Date: Wed, 17 Feb 2021 18:30:44 -0500
Message-Id: <20210217233046.81418-2-vgoyal@redhat.com>
In-Reply-To: <20210217233046.81418-1-vgoyal@redhat.com>
References: <20210217233046.81418-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: lhenriques@suse.de, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com, miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fuse has an option FUSE_POSIX_ACL which needs to be opted in by fuse
server to enable posix acls.

Add virtiofsd option "-o posix_acl/no_posix_acl" to let users enable/disable
posix acl support. By default it is disabled as of now.

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

v2: block system.posix_acl_access and system.posix_acl_default xattrs
    if user explicitly disabled acls. (Miklos)

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 95 +++++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 58d24c0010..26cdfbd1f0 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -169,6 +169,7 @@ struct lo_data {
     /* An O_PATH file descriptor to /proc/self/fd/ */
     int proc_self_fd;
     int user_killpriv_v2, killpriv_v2;
+    int user_posix_acl;
 };
 
 static const struct fuse_opt lo_opts[] = {
@@ -201,6 +202,8 @@ static const struct fuse_opt lo_opts[] = {
     { "announce_submounts", offsetof(struct lo_data, announce_submounts), 1 },
     { "killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 1 },
     { "no_killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 0 },
+    { "posix_acl", offsetof(struct lo_data, user_posix_acl), 1 },
+    { "no_posix_acl", offsetof(struct lo_data, user_posix_acl), 0 },
     FUSE_OPT_END
 };
 static bool use_syslog = false;
@@ -661,6 +664,23 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
         conn->want &= ~FUSE_CAP_HANDLE_KILLPRIV_V2;
         lo->killpriv_v2 = 0;
     }
+
+    if (lo->user_posix_acl == 1) {
+        /*
+         * User explicitly asked for this option. Enable it unconditionally.
+         * If connection does not have this capability, it should fail
+         * in fuse_lowlevel.c
+         */
+        fuse_log(FUSE_LOG_DEBUG, "lo_init: enabling posix acl\n");
+        conn->want |= FUSE_CAP_POSIX_ACL;
+    } else {
+        /*
+         * Either user specified to disable posix_acl, or did not specify
+         * anything. In both the cases do not enable posix acl.
+         */
+        fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling posix_acl\n");
+        conn->want &= ~FUSE_CAP_POSIX_ACL;
+    }
 }
 
 static void lo_getattr(fuse_req_t req, fuse_ino_t ino,
@@ -2612,6 +2632,63 @@ static int xattr_map_server(const struct lo_data *lo, const char *server_name,
     return -ENODATA;
 }
 
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
@@ -2625,6 +2702,11 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
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
@@ -2766,7 +2848,6 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
         if (ret == 0) {
             goto out;
         }
-
         if (lo->xattr_map_list) {
             /*
              * Map the names back, some attributes might be dropped,
@@ -2813,6 +2894,12 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
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
@@ -2851,6 +2938,11 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
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
@@ -3604,6 +3696,7 @@ int main(int argc, char *argv[])
         .allow_direct_io = 0,
         .proc_self_fd = -1,
         .user_killpriv_v2 = -1,
+        .user_posix_acl = -1,
     };
     struct lo_map_elem *root_elem;
     struct lo_map_elem *reserve_elem;
-- 
2.25.4


