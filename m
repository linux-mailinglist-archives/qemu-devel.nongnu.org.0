Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7654AE301
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 22:12:22 +0100 (CET)
Received: from localhost ([::1]:47422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHXmf-00006T-Mn
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 16:12:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nHXPb-0002Gh-B4
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:48:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nHXPX-00043u-OP
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:48:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644353306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vx//wF3aPhfSTB6BjlOum3g3OYFNNuZT5pwzk12jrPI=;
 b=MnCWR+WiXgL8uSdEUJXaV6uJRbPXlEBMrUnIiMRrHRjCulXy1MMpb1v+txL5WUVG3x1+10
 QoHNjJTBfuGpGeZUqwdx/ZgGEe0H8wy0JQ/22nuS+3CKOkbCNOQ1TDz8kkZUl/YG9n2VTi
 Vcavn/JcyjjMqWxEBt995uJi2E7f+No=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-V5CavceBO6qyXi-OnkboTA-1; Tue, 08 Feb 2022 15:48:25 -0500
X-MC-Unique: V5CavceBO6qyXi-OnkboTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C591E83DEAB
 for <qemu-devel@nongnu.org>; Tue,  8 Feb 2022 20:48:24 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.18.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90AE55E26C;
 Tue,  8 Feb 2022 20:48:24 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id D4D792256FE; Tue,  8 Feb 2022 15:48:23 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v6 07/10] virtiofsd: Add helpers to work with
 /proc/self/task/tid/attr/fscreate
Date: Tue,  8 Feb 2022 15:48:10 -0500
Message-Id: <20220208204813.682906-8-vgoyal@redhat.com>
In-Reply-To: <20220208204813.682906-1-vgoyal@redhat.com>
References: <20220208204813.682906-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: mszeredi@redhat.com, berrange@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Soon we will be able to create and also set security context on the file
atomically using /proc/self/task/tid/attr/fscreate knob. If this knob
is available on the system, first set the knob with the desired context
and then create the file. It will be created with the context set in
fscreate. This works basically for SELinux and its per thread.

This patch just introduces the helper functions. Subsequent patches will
make use of these helpers.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 92 ++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 82023bf3d4..7762bf0d2c 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -173,10 +173,14 @@ struct lo_data {
 
     /* An O_PATH file descriptor to /proc/self/fd/ */
     int proc_self_fd;
+    /* An O_PATH file descriptor to /proc/self/task/ */
+    int proc_self_task;
     int user_killpriv_v2, killpriv_v2;
     /* If set, virtiofsd is responsible for setting umask during creation */
     bool change_umask;
     int user_posix_acl, posix_acl;
+    /* Keeps track if /proc/<pid>/attr/fscreate should be used or not */
+    bool use_fscreate;
 };
 
 static const struct fuse_opt lo_opts[] = {
@@ -256,6 +260,72 @@ static struct lo_data *lo_data(fuse_req_t req)
     return (struct lo_data *)fuse_req_userdata(req);
 }
 
+/*
+ * Tries to figure out if /proc/<pid>/attr/fscreate is usable or not. With
+ * selinux=0, read from fscreate returns -EINVAL.
+ *
+ * TODO: Link with libselinux and use is_selinux_enabled() instead down
+ * the line. It probably will be more reliable indicator.
+ */
+static bool is_fscreate_usable(struct lo_data *lo)
+{
+    char procname[64];
+    int fscreate_fd;
+    size_t bytes_read;
+
+    sprintf(procname, "%d/attr/fscreate", gettid());
+    fscreate_fd = openat(lo->proc_self_task, procname, O_RDWR);
+    if (fscreate_fd == -1) {
+        return false;
+    }
+
+    bytes_read = read(fscreate_fd, procname, 64);
+    close(fscreate_fd);
+    if (bytes_read == -1) {
+        return false;
+    }
+    return true;
+}
+
+/* Helpers to set/reset fscreate */
+__attribute__((unused))
+static int open_set_proc_fscreate(struct lo_data *lo, const void *ctx,
+                                  size_t ctxlen,int *fd)
+{
+    char procname[64];
+    int fscreate_fd, err = 0;
+    size_t written;
+
+    sprintf(procname, "%d/attr/fscreate", gettid());
+    fscreate_fd = openat(lo->proc_self_task, procname, O_WRONLY);
+    err = fscreate_fd == -1 ? errno : 0;
+    if (err) {
+        return err;
+    }
+
+    written = write(fscreate_fd, ctx, ctxlen);
+    err = written == -1 ? errno : 0;
+    if (err) {
+        goto out;
+    }
+
+    *fd = fscreate_fd;
+    return 0;
+out:
+    close(fscreate_fd);
+    return err;
+}
+
+__attribute__((unused))
+static void close_reset_proc_fscreate(int fd)
+{
+    if ((write(fd, NULL, 0)) == -1) {
+        fuse_log(FUSE_LOG_WARNING, "Failed to reset fscreate. err=%d\n", errno);
+    }
+    close(fd);
+    return;
+}
+
 /*
  * Load capng's state from our saved state if the current thread
  * hadn't previously been loaded.
@@ -3522,6 +3592,15 @@ static void setup_namespaces(struct lo_data *lo, struct fuse_session *se)
         exit(1);
     }
 
+    /* Get the /proc/self/task descriptor */
+    lo->proc_self_task = open("/proc/self/task/", O_PATH);
+    if (lo->proc_self_task == -1) {
+        fuse_log(FUSE_LOG_ERR, "open(/proc/self/task, O_PATH): %m\n");
+        exit(1);
+    }
+
+    lo->use_fscreate = is_fscreate_usable(lo);
+
     /*
      * We only need /proc/self/fd. Prevent ".." from accessing parent
      * directories of /proc/self/fd by bind-mounting it over /proc. Since / was
@@ -3738,6 +3817,14 @@ static void setup_chroot(struct lo_data *lo)
         exit(1);
     }
 
+    lo->proc_self_task = open("/proc/self/task", O_PATH);
+    if (lo->proc_self_fd == -1) {
+        fuse_log(FUSE_LOG_ERR, "open(\"/proc/self/task\", O_PATH): %m\n");
+        exit(1);
+    }
+
+    lo->use_fscreate = is_fscreate_usable(lo);
+
     /*
      * Make the shared directory the file system root so that FUSE_OPEN
      * (lo_open()) cannot escape the shared directory by opening a symlink.
@@ -3923,6 +4010,10 @@ static void fuse_lo_data_cleanup(struct lo_data *lo)
         close(lo->proc_self_fd);
     }
 
+    if (lo->proc_self_task >= 0) {
+        close(lo->proc_self_task);
+    }
+
     if (lo->root.fd >= 0) {
         close(lo->root.fd);
     }
@@ -3950,6 +4041,7 @@ int main(int argc, char *argv[])
         .posix_lock = 0,
         .allow_direct_io = 0,
         .proc_self_fd = -1,
+        .proc_self_task = -1,
         .user_killpriv_v2 = -1,
         .user_posix_acl = -1,
     };
-- 
2.34.1


