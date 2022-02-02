Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCF34A795A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 21:26:52 +0100 (CET)
Received: from localhost ([::1]:52894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFMDL-0004Fv-Kw
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 15:26:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nFLU1-0004QF-TO
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:40:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nFLU0-00044o-36
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:40:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643830796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Pbf01RDpcSpdpnFrAgDAyRGc1ZzEEOCG1A2PM9mztY=;
 b=bwRawrKZ1E8XZ3oaHXaXR7uKJNDLAxLz5bEJ9o2Tadi/SsSa/jHlhtpombbBmyokC/g+ff
 Yuuz8oQHmyu1iZzXtiBcm+AEDFAMt7cyo+113kKca3AQBK6oiGizfqvZNjJD72CCgBRhqz
 +DONz6BuVumSQn34MrXY/vWKniW1giU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-3T-KpKPfOmeAxYsfhwQglA-1; Wed, 02 Feb 2022 14:39:54 -0500
X-MC-Unique: 3T-KpKPfOmeAxYsfhwQglA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FD42192AB95
 for <qemu-devel@nongnu.org>; Wed,  2 Feb 2022 19:39:54 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.32.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E257F5DB85;
 Wed,  2 Feb 2022 19:39:53 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id DF53E224B40; Wed,  2 Feb 2022 14:39:41 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v5 9/9] virtiofsd: Add an option to enable/disable security
 label
Date: Wed,  2 Feb 2022 14:39:35 -0500
Message-Id: <20220202193935.268777-10-vgoyal@redhat.com>
In-Reply-To: <20220202193935.268777-1-vgoyal@redhat.com>
References: <20220202193935.268777-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Provide an option "-o security_label/no_security_label" to enable/disable
security label functionality. By default these are turned off.

If enabled, server will indicate to client that it is capable of handling
one security label during file creation. Typically this is expected to
be a SELinux label. File server will set this label on the file. It will
try to set it atomically wherever possible. But its not possible in
all the cases.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 docs/tools/virtiofsd.rst         |  7 +++++++
 tools/virtiofsd/helper.c         |  1 +
 tools/virtiofsd/passthrough_ll.c | 15 +++++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index 07ac0be551..a2c005f4a0 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -104,6 +104,13 @@ Options
   * posix_acl|no_posix_acl -
     Enable/disable posix acl support.  Posix ACLs are disabled by default.
 
+  * security_label|no_security_label -
+    Enable/disable security label support. Security labels are disabled by
+    default. This will allow client to send a MAC label of file during
+    file creation. Typically this is expected to be SELinux security
+    label. Server will try to set that label on newly created file
+    atomically wherever possible.
+
 .. option:: --socket-path=PATH
 
   Listen on vhost-user UNIX domain socket at PATH.
diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
index a8295d975a..e226fc590f 100644
--- a/tools/virtiofsd/helper.c
+++ b/tools/virtiofsd/helper.c
@@ -187,6 +187,7 @@ void fuse_cmdline_help(void)
            "                               default: no_allow_direct_io\n"
            "    -o announce_submounts      Announce sub-mount points to the guest\n"
            "    -o posix_acl/no_posix_acl  Enable/Disable posix_acl. (default: disabled)\n"
+           "    -o security_label/no_security_label  Enable/Disable security label. (default: disabled)\n"
            );
 }
 
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 43c9b6dbe5..fe8f3ccbb6 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -181,6 +181,7 @@ struct lo_data {
     int user_posix_acl, posix_acl;
     /* Keeps track if /proc/<pid>/attr/fscreate should be used or not */
     bool use_fscreate;
+    int user_security_label;
 };
 
 static const struct fuse_opt lo_opts[] = {
@@ -215,6 +216,8 @@ static const struct fuse_opt lo_opts[] = {
     { "no_killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 0 },
     { "posix_acl", offsetof(struct lo_data, user_posix_acl), 1 },
     { "no_posix_acl", offsetof(struct lo_data, user_posix_acl), 0 },
+    { "security_label", offsetof(struct lo_data, user_security_label), 1 },
+    { "no_security_label", offsetof(struct lo_data, user_security_label), 0 },
     FUSE_OPT_END
 };
 static bool use_syslog = false;
@@ -771,6 +774,17 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
         fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling posix_acl\n");
         conn->want &= ~FUSE_CAP_POSIX_ACL;
     }
+
+    if (lo->user_security_label == 1) {
+        if (!(conn->capable & FUSE_CAP_SECURITY_CTX)) {
+            fuse_log(FUSE_LOG_ERR, "lo_init: Can not enable security label."
+                     " kernel does not support FUSE_SECURITY_CTX capability.\n");
+        }
+        conn->want |= FUSE_CAP_SECURITY_CTX;
+    } else {
+        fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling security label\n");
+        conn->want &= ~FUSE_CAP_SECURITY_CTX;
+    }
 }
 
 static void lo_getattr(fuse_req_t req, fuse_ino_t ino,
@@ -4279,6 +4293,7 @@ int main(int argc, char *argv[])
         .proc_self_task = -1,
         .user_killpriv_v2 = -1,
         .user_posix_acl = -1,
+        .user_security_label = -1,
     };
     struct lo_map_elem *root_elem;
     struct lo_map_elem *reserve_elem;
-- 
2.34.1


