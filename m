Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC89A40D4DC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 10:46:26 +0200 (CEST)
Received: from localhost ([::1]:49526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQn2H-00032D-UA
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 04:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQmx8-000483-Sr
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:41:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQmx7-00043v-8u
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 04:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631781664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Aa3s0DVFlM7JNUvl5FXoaHREIoYI6Yg29qn6jJ1Zg4=;
 b=V3pO26KQPTiiTTvjB8jkmXxWTWsSz7UkJYp6I4UPkeJiMx6HK/amKyPKpvSFCs97TKbBV6
 0v8b/JHoPgkfwLxSFUiQEsv6NS3GBz2YEHtDorHtljtvIPk1etGIQUHupp2RofvbP4dVvH
 XxRB8uAMVTXGO/uUDSusRHzxwztlc9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-Gv9Tw8RDMZKh__W4DyV9SA-1; Thu, 16 Sep 2021 04:41:03 -0400
X-MC-Unique: Gv9Tw8RDMZKh__W4DyV9SA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46F89835DE3
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:41:02 +0000 (UTC)
Received: from localhost (unknown [10.39.192.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F3AF6A91B;
 Thu, 16 Sep 2021 08:40:56 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v4 01/12] virtiofsd: Keep /proc/self/mountinfo open
Date: Thu, 16 Sep 2021 10:40:34 +0200
Message-Id: <20210916084045.31684-2-hreitz@redhat.com>
In-Reply-To: <20210916084045.31684-1-hreitz@redhat.com>
References: <20210916084045.31684-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

File handles are specific to mounts, and so name_to_handle_at() returns
the respective mount ID.  However, open_by_handle_at() is not content
with an ID, it wants a file descriptor for some inode on the mount,
which we have to open.

We want to use /proc/self/mountinfo to find the mounts' root directories
so we can open them and pass the respective FDs to open_by_handle_at().
(We need to use the root directory, because we want the inode belonging
to every mount FD be deletable.  Before the root directory can be
deleted, all entries within must have been closed, and so when it is
deleted, there should not be any file handles left that need its FD as
their mount FD.  Thus, we can then close that FD and the inode can be
deleted.[1])

That is why we need to open /proc/self/mountinfo so that we can use it
to translate mount IDs into root directory paths.  We have to open it
after setup_mounts() was called, because if we try to open it before, it
will appear as an empty file after setup_mounts().

[1] Note that in practice, you still cannot delete the mount root
directory.  It is a mount point on the host, after all, and mount points
cannot be deleted.  But by using the mount point as the mount FD, we
will at least not hog any actually deletable inodes.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 38b2af8599..6511a6acb4 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -172,6 +172,8 @@ struct lo_data {
 
     /* An O_PATH file descriptor to /proc/self/fd/ */
     int proc_self_fd;
+    /* A read-only FILE pointer for /proc/self/mountinfo */
+    FILE *mountinfo_fp;
     int user_killpriv_v2, killpriv_v2;
     /* If set, virtiofsd is responsible for setting umask during creation */
     bool change_umask;
@@ -3718,6 +3720,19 @@ static void setup_chroot(struct lo_data *lo)
 static void setup_sandbox(struct lo_data *lo, struct fuse_session *se,
                           bool enable_syslog)
 {
+    int proc_self, mountinfo_fd;
+    int saverr;
+
+    /*
+     * Open /proc/self before we pivot to the new root so we can still
+     * open /proc/self/mountinfo afterwards
+     */
+    proc_self = open("/proc/self", O_PATH);
+    if (proc_self < 0) {
+        fuse_log(FUSE_LOG_WARNING, "Failed to open /proc/self: %m; "
+                 "will not be able to use file handles\n");
+    }
+
     if (lo->sandbox == SANDBOX_NAMESPACE) {
         setup_namespaces(lo, se);
         setup_mounts(lo->source);
@@ -3725,6 +3740,31 @@ static void setup_sandbox(struct lo_data *lo, struct fuse_session *se,
         setup_chroot(lo);
     }
 
+    /*
+     * Opening /proc/self/mountinfo before the umount2() call in
+     * setup_mounts() leads to the file appearing empty.  That is why
+     * we defer opening it until here.
+     */
+    lo->mountinfo_fp = NULL;
+    if (proc_self >= 0) {
+        mountinfo_fd = openat(proc_self, "mountinfo", O_RDONLY);
+        if (mountinfo_fd < 0) {
+            saverr = errno;
+        } else if (mountinfo_fd >= 0) {
+            lo->mountinfo_fp = fdopen(mountinfo_fd, "r");
+            if (!lo->mountinfo_fp) {
+                saverr = errno;
+                close(mountinfo_fd);
+            }
+        }
+        if (!lo->mountinfo_fp) {
+            fuse_log(FUSE_LOG_WARNING, "Failed to open /proc/self/mountinfo: "
+                     "%s; will not be able to use file handles\n",
+                     strerror(saverr));
+        }
+        close(proc_self);
+    }
+
     setup_seccomp(enable_syslog);
     setup_capabilities(g_strdup(lo->modcaps));
 }
-- 
2.31.1


