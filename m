Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809E92DB14D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 17:25:50 +0100 (CET)
Received: from localhost ([::1]:60100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpD93-0003QJ-Ip
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 11:25:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1kpD5R-0006zJ-3v
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:22:05 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:39279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1kpD5O-00039V-UZ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:22:04 -0500
Received: by mail-pl1-x644.google.com with SMTP id x18so5192030pln.6
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 08:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=31S5+f8dwsso9OndOrxakIf/1jOOz+jIZXJdlzrod04=;
 b=DWtl1tIssyOypHqtQ+S69tVsBmwn8GM4pDAT4i8lwhPAdlz8SBNNRp7CYQW2u1PMJ+
 k2uO/I7XoFdOTQQGIVkfUFQBIK9IQoKgjSM3lcP42nKjPR5wGPWk0RulSjfKlB+IbfUm
 ik6iV8Fi8Hxj/s01bdgyilqtwQ1tHLGjHaZnTZEzoxdT1i1k87ZwVi0AQuC85XcoUesj
 BNtfj0ZzVxqjwXFq/VFiQttHWdiUcs4q3ujdNi7tws+xdfvW/0h9Rb7Z1XjGmOSun10d
 3GOcRh1cRzpBPLB571T4ckNHiS0UZv8Txd1YDtcuHVM8+WoPhvEpwW+1/4ilfrJzLwf6
 5OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=31S5+f8dwsso9OndOrxakIf/1jOOz+jIZXJdlzrod04=;
 b=fnO/GRNXo3bSL7t5i2c6A1IOTWnotgI6UFl1d//H3GVo1kV7gA8g7jY+FHaehk3BAP
 abKjPHi0qUAo7sbsGMhcADAjgeRV5F0scB6TqyWV0b3R8YvSNAEvGxOab4M6Fn6/NncG
 Eq6sdnchngtjooUlVwEbXTKrMu72aQ1p2FAwcckVEz0ztv8crlhF2MyG1D9RfsI0337O
 zXOYjb0XROcuy6jrGKQ1FAi4axtttzody+DJq0f4cxsmakBUCqj208LMOCrjxix2JvQT
 CxkosC7VJ3CfmfGTi3TLpuHOX1rBEU69RENpYN6EiWnw4G3/ofAadOvEDkRVDFXUtnhA
 x9SA==
X-Gm-Message-State: AOAM5308ifrMp3ikgNavJgFoyL1+f8zjoehGjRGpMLvO1yJs18o+JOTk
 RU7evSUt72Ir/50M3QScwnfDKg==
X-Google-Smtp-Source: ABdhPJy80HbzUKautX0fWQFY50ds2NqYLgLO2A9Mh5nODAbIGMIsm6h7/0JLCMUinHM1gwSLgi1leQ==
X-Received: by 2002:a17:90a:df81:: with SMTP id
 p1mr31841719pjv.158.1608049321559; 
 Tue, 15 Dec 2020 08:22:01 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.246])
 by smtp.gmail.com with ESMTPSA id c10sm24273508pfo.159.2020.12.15.08.21.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Dec 2020 08:22:00 -0800 (PST)
From: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
To: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xie Yongji <xieyongji@bytedance.com>
Subject: [RFC PATCH 6/9] virtiofsd: Add two new options for crash reconnection
Date: Wed, 16 Dec 2020 00:21:16 +0800
Message-Id: <20201215162119.27360-7-zhangjiachen.jaycee@bytedance.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=zhangjiachen.jaycee@bytedance.com; helo=mail-pl1-x644.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: virtio-fs@redhat.com, Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We add two options for virtiofsd crash reconnection: reconnect |
no_reconnect(default) and

User of virtiofsd should set "-o reconnect" for crash reconnection. Note
that, when "-o reconnect" is set, some options will not be supported and we
need to disable them:

  - mount namespace: When mount namespace is enabled, reconnected
    virtiofsd will failed to link/rename for EXDEV. The reason is, when
    virtiofsd is sandboxed by mount namespace, attempts to link/rename
    the fds opened before crashing (also recovered from QEMU) will be
    considered as across mount operations between mounts, which is not
    allowed by host kernel.

    So we introduce another option "-o mount_ns|no_mount_ns" (mount_ns
    by default, and takes no effect when sandbox=chroot is specified).
    The option "-o no_mount_ns" should be used with "-o reconnect".

  - remote locking: As it is hard to determine wether a file is locked or
    not when handling inflight locking requests, we should specify "-o
    no_posix_lock" (default) and "-o no_flock" (default).

  - extended attributes: When handling inflight removexattr requests after
    reconnecting, it is hard to determine wether a attr is already removed
    or not. Therefore, we should also use "-o noxattr" (default) with "-o
    reconnect".

Signed-off-by: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 tools/virtiofsd/helper.c         |   9 +++
 tools/virtiofsd/passthrough_ll.c | 112 ++++++++++++++++++++++---------
 2 files changed, 88 insertions(+), 33 deletions(-)

diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
index 75ac48dec2..e0d6525b1a 100644
--- a/tools/virtiofsd/helper.c
+++ b/tools/virtiofsd/helper.c
@@ -174,6 +174,10 @@ void fuse_cmdline_help(void)
            "                               - chroot: chroot(2) into shared\n"
            "                                 directory (use in containers)\n"
            "                               default: namespace\n"
+           "    -o mount_ns|no_mount_ns    enable/disable mount namespace\n"
+           "                               default: mount_ns\n"
+           "                               note: if chroot sandbox mode is used,\n"
+           "                               mount_ns will not take effect.\n"
            "    -o timeout=<number>        I/O timeout (seconds)\n"
            "                               default: depends on cache= option.\n"
            "    -o writeback|no_writeback  enable/disable writeback cache\n"
@@ -191,6 +195,11 @@ void fuse_cmdline_help(void)
            "                               to virtiofsd from guest applications.\n"
            "                               default: no_allow_direct_io\n"
            "    -o announce_submounts      Announce sub-mount points to the guest\n"
+           "    -o reconnect|no_reconnect  enable/disable crash reconnection\n"
+           "                               to enable crash reconnection, the options\n"
+           "                               no_mount_ns, no_flock, no_posix_lock, and\n"
+           "                               no_xattr should also be set.\n"
+           "                               default: no_reconnect\n"
            );
 }
 
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 815b001076..73a50bd7a3 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -170,6 +170,8 @@ struct lo_data {
     pthread_mutex_t mutex;
     int sandbox;
     int debug;
+    int mount_ns;
+    int reconnect;
     int writeback;
     int flock;
     int posix_lock;
@@ -204,8 +206,12 @@ static const struct fuse_opt lo_opts[] = {
     { "sandbox=chroot",
       offsetof(struct lo_data, sandbox),
       SANDBOX_CHROOT },
+    { "reconnect", offsetof(struct lo_data, reconnect), 1 },
+    { "no_reconnect", offsetof(struct lo_data, reconnect), 0 },
     { "writeback", offsetof(struct lo_data, writeback), 1 },
     { "no_writeback", offsetof(struct lo_data, writeback), 0 },
+    { "mount_ns", offsetof(struct lo_data, mount_ns), 1 },
+    { "no_mount_ns", offsetof(struct lo_data, mount_ns), 0 },
     { "source=%s", offsetof(struct lo_data, source), 0 },
     { "flock", offsetof(struct lo_data, flock), 1 },
     { "no_flock", offsetof(struct lo_data, flock), 0 },
@@ -3047,8 +3053,14 @@ static void setup_namespaces(struct lo_data *lo, struct fuse_session *se)
      * an empty network namespace to prevent TCP/IP and other network
      * activity in case this process is compromised.
      */
-    if (unshare(CLONE_NEWPID | CLONE_NEWNS | CLONE_NEWNET) != 0) {
-        fuse_log(FUSE_LOG_ERR, "unshare(CLONE_NEWPID | CLONE_NEWNS): %m\n");
+    int unshare_flag;
+    if (lo->mount_ns) {
+        unshare_flag = CLONE_NEWPID | CLONE_NEWNS | CLONE_NEWNET;
+    } else {
+        unshare_flag = CLONE_NEWPID | CLONE_NEWNET;
+    }
+    if (unshare(unshare_flag) != 0) {
+        fuse_log(FUSE_LOG_ERR, "unshare(): %m\n");
         exit(1);
     }
 
@@ -3083,38 +3095,47 @@ static void setup_namespaces(struct lo_data *lo, struct fuse_session *se)
     /* Send us SIGTERM when the parent thread terminates, see prctl(2) */
     prctl(PR_SET_PDEATHSIG, SIGTERM);
 
-    /*
-     * If the mounts have shared propagation then we want to opt out so our
-     * mount changes don't affect the parent mount namespace.
-     */
-    if (mount(NULL, "/", NULL, MS_REC | MS_SLAVE, NULL) < 0) {
-        fuse_log(FUSE_LOG_ERR, "mount(/, MS_REC|MS_SLAVE): %m\n");
-        exit(1);
-    }
+    if (lo->mount_ns) {
+        /*
+         * If the mounts have shared propagation then we want to opt out so our
+         * mount changes don't affect the parent mount namespace.
+         */
+        if (mount(NULL, "/", NULL, MS_REC | MS_SLAVE, NULL) < 0) {
+            fuse_log(FUSE_LOG_ERR, "mount(/, MS_REC|MS_SLAVE): %m\n");
+            exit(1);
+        }
 
-    /* The child must remount /proc to use the new pid namespace */
-    if (mount("proc", "/proc", "proc",
-              MS_NODEV | MS_NOEXEC | MS_NOSUID | MS_RELATIME, NULL) < 0) {
-        fuse_log(FUSE_LOG_ERR, "mount(/proc): %m\n");
-        exit(1);
-    }
+        /* The child must remount /proc to use the new pid namespace */
+        if (mount("proc", "/proc", "proc",
+                  MS_NODEV | MS_NOEXEC | MS_NOSUID | MS_RELATIME, NULL) < 0) {
+            fuse_log(FUSE_LOG_ERR, "mount(/proc): %m\n");
+            exit(1);
+        }
 
-    /*
-     * We only need /proc/self/fd. Prevent ".." from accessing parent
-     * directories of /proc/self/fd by bind-mounting it over /proc. Since / was
-     * previously remounted with MS_REC | MS_SLAVE this mount change only
-     * affects our process.
-     */
-    if (mount("/proc/self/fd", "/proc", NULL, MS_BIND, NULL) < 0) {
-        fuse_log(FUSE_LOG_ERR, "mount(/proc/self/fd, MS_BIND): %m\n");
-        exit(1);
-    }
+        /*
+         * We only need /proc/self/fd. Prevent ".." from accessing parent
+         * directories of /proc/self/fd by bind-mounting it over /proc. Since
+         * / was previously remounted with MS_REC | MS_SLAVE this mount change
+         * only affects our process.
+         */
+        if (mount("/proc/self/fd", "/proc", NULL, MS_BIND, NULL) < 0) {
+            fuse_log(FUSE_LOG_ERR, "mount(/proc/self/fd, MS_BIND): %m\n");
+            exit(1);
+        }
 
-    /* Get the /proc (actually /proc/self/fd, see above) file descriptor */
-    lo->proc_self_fd = open("/proc", O_PATH);
-    if (lo->proc_self_fd == -1) {
-        fuse_log(FUSE_LOG_ERR, "open(/proc, O_PATH): %m\n");
-        exit(1);
+        /* Get the /proc (actually /proc/self/fd, see above) file descriptor */
+        lo->proc_self_fd = open("/proc", O_PATH);
+        if (lo->proc_self_fd == -1) {
+            fuse_log(FUSE_LOG_ERR, "open(/proc, O_PATH): %m\n");
+            exit(1);
+        }
+    } else {
+        /* Now we can get our /proc/self/fd directory file descriptor */
+        lo->proc_self_fd = open("/proc/self/fd", O_PATH);
+        if (lo->proc_self_fd == -1) {
+            fuse_log(FUSE_LOG_ERR, "open(/proc/self/fd, O_PATH): %m\n");
+            exit(1);
+        }
     }
 }
 
@@ -3347,7 +3368,9 @@ static void setup_sandbox(struct lo_data *lo, struct fuse_session *se,
 {
     if (lo->sandbox == SANDBOX_NAMESPACE) {
         setup_namespaces(lo, se);
-        setup_mounts(lo->source);
+        if (lo->mount_ns) {
+            setup_mounts(lo->source);
+        }
     } else {
         setup_chroot(lo);
     }
@@ -3438,7 +3461,11 @@ static void setup_root(struct lo_data *lo, struct lo_inode *root)
     struct stat stat;
     uint64_t mnt_id;
 
-    fd = open("/", O_PATH);
+    if (lo->mount_ns) {
+        fd = open("/", O_PATH);
+    } else {
+        fd = open(lo->source, O_PATH);
+    }
     if (fd == -1) {
         fuse_log(FUSE_LOG_ERR, "open(%s, O_PATH): %m\n", lo->source);
         exit(1);
@@ -3515,6 +3542,9 @@ int main(int argc, char *argv[])
     lo.allow_direct_io = 0,
     lo.proc_self_fd = -1;
 
+    lo.reconnect = 0;
+    lo.mount_ns = 1;
+
     /* Don't mask creation mode, kernel already did that */
     umask(0);
 
@@ -3577,6 +3607,22 @@ int main(int argc, char *argv[])
         goto err_out1;
     }
 
+    /* For sandbox mode "chroot", set the mount_ns option to 0. */
+    if (lo.sandbox == SANDBOX_CHROOT) {
+        lo.mount_ns = 0;
+    }
+
+    if (lo.reconnect) {
+        if ((lo.sandbox == SANDBOX_NAMESPACE && lo.mount_ns) || lo.flock
+                                               || lo.posix_lock || lo.xattr) {
+            printf("Mount namespace, remote lock, and extended attributes"
+                   " are not supported by reconnection (-o reconnect). Please "
+                   "specify  -o no_mount_ns, -o no_flock (default), -o"
+                   "no_posix_lock (default), and -o no_xattr (default).\n");
+            exit(1);
+        }
+    }
+
     if (opts.log_level != 0) {
         current_log_level = opts.log_level;
     } else {
-- 
2.20.1


