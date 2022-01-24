Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82267499767
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 22:28:02 +0100 (CET)
Received: from localhost ([::1]:57750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC6sb-00075D-4P
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 16:28:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nC6qA-0004G4-88
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 16:25:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nC6q3-0005Jh-FB
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 16:25:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643059519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kFcgd/2gIAoIm3xoEkN3Q63FBEKnQnxm5gacAq198Zw=;
 b=eUTTgGG0J51BuGdlKN96aNHaltuwpz6Y8KijxVWYljiBlY0X2n1cH14IyjZMsjdnqiBvfv
 OqQe4RyuqAMrTMrc/LW4u8n0geRtW6tW7qW2ksCxTP+e9CtYZbWZOe8midnIq1tfTQZkQF
 DllEAKTocbx/wzrSyxsEM1dJJD4Xe5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-Kjsddh6dOCyRnI2b2uxZPg-1; Mon, 24 Jan 2022 16:25:16 -0500
X-MC-Unique: Kjsddh6dOCyRnI2b2uxZPg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 172F98145ED
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 21:25:15 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2A375DB8C;
 Mon, 24 Jan 2022 21:25:14 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id DCFF62241CA; Mon, 24 Jan 2022 16:25:13 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v4 9/9] virtiofsd: Add an option to enable/disable security
 label
Date: Mon, 24 Jan 2022 16:24:55 -0500
Message-Id: <20220124212455.83968-10-vgoyal@redhat.com>
In-Reply-To: <20220124212455.83968-1-vgoyal@redhat.com>
References: <20220124212455.83968-1-vgoyal@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mszeredi@redhat.com, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com
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
index 4505c0c363..4334885619 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -180,6 +180,7 @@ struct lo_data {
     int user_posix_acl, posix_acl;
     /* Keeps track if /proc/<pid>/attr/fscreate should be used or not */
     bool use_fscreate;
+    int user_security_label;
 };
 
 static const struct fuse_opt lo_opts[] = {
@@ -214,6 +215,8 @@ static const struct fuse_opt lo_opts[] = {
     { "no_killpriv_v2", offsetof(struct lo_data, user_killpriv_v2), 0 },
     { "posix_acl", offsetof(struct lo_data, user_posix_acl), 1 },
     { "no_posix_acl", offsetof(struct lo_data, user_posix_acl), 0 },
+    { "security_label", offsetof(struct lo_data, user_security_label), 1 },
+    { "no_security_label", offsetof(struct lo_data, user_security_label), 0 },
     FUSE_OPT_END
 };
 static bool use_syslog = false;
@@ -770,6 +773,17 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
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
@@ -4254,6 +4268,7 @@ int main(int argc, char *argv[])
         .proc_self_task = -1,
         .user_killpriv_v2 = -1,
         .user_posix_acl = -1,
+        .user_security_label = -1,
     };
     struct lo_map_elem *root_elem;
     struct lo_map_elem *reserve_elem;
-- 
2.31.1


