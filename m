Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C43144CDC1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 00:23:16 +0100 (CET)
Received: from localhost ([::1]:46772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkwvz-0003bR-LB
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 18:23:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mkwql-0003kH-HL
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 18:17:51 -0500
Received: from usb-smtp-delivery-124.mimecast.com ([170.10.151.124]:42431
 helo=us-smtp-delivery-124.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mkwqg-0001FW-KD
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 18:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636586265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uW5lxn1bHHfc/OHP6BJKdh+0nYCDz46voC85rbxp/us=;
 b=ZcpnNK0viAMswy7Dv5OLhdQ4o2Ul69izEhCwVMuCGFmXYuI/F2ibrpngKhansQ3MT7n8dG
 PKwRpEUgmeBZeqUfac3dDzm0HsxRXe1fWvkZXfgG8VC2ln5aYgkWevrRCy2M3VcQnmnr8b
 ESfytPXsPHqgHiSi5TBERqoHz5z5Qxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-RXnddtZMNIS-WKPhlRjdng-1; Wed, 10 Nov 2021 18:17:42 -0500
X-MC-Unique: RXnddtZMNIS-WKPhlRjdng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A7241966321;
 Wed, 10 Nov 2021 23:17:41 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.10.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43F1860C05;
 Wed, 10 Nov 2021 23:17:41 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 57C932256F3; Wed, 10 Nov 2021 18:17:36 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH v3 6/6] virtiofsd: Add an option to enable/disable security
 label
Date: Wed, 10 Nov 2021 18:17:28 -0500
Message-Id: <20211110231728.50385-7-vgoyal@redhat.com>
In-Reply-To: <20211110231728.50385-1-vgoyal@redhat.com>
References: <20211110231728.50385-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.151.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: chirantan@chromium.org, casey@schaufler-ca.com, omosnace@redhat.com,
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
index cc31402830..54699b2013 100644
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


