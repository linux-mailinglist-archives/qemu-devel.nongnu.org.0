Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7CD146900
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 14:27:06 +0100 (CET)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iucVk-0001lv-RF
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 08:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iub9M-0002kc-Lk
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iub9L-0005NQ-4O
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:52 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:52549
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iub9L-0005N0-0a
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579780790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HcX+rlmsOnPkAnqht3vH74Z9QoTWqy14xncBYAwsD2g=;
 b=EOj2jTcLk0bEnhPXeJHgaT2AAGgwLTI1zhNK2B6Rr/gN3O9NQrKrSod4MHMOWYQBdpnxsX
 tbt2O3k7rWjIBMQFvNmDUJKEZrgUiQNjSKonlq23ysxFOk5+Fh1jgatkKMa6AXMW022HIi
 yXbpSyDWybYUlb0f/q1J+0n1VPSHAn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-AUIgpl4NPGKWTSep_7z42Q-1; Thu, 23 Jan 2020 06:59:48 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC1AEDB69
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:59:47 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43D6F1CB;
 Thu, 23 Jan 2020 11:59:47 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 051/111] virtiofsd: move to a new pid namespace
Date: Thu, 23 Jan 2020 11:57:41 +0000
Message-Id: <20200123115841.138849-52-dgilbert@redhat.com>
In-Reply-To: <20200123115841.138849-1-dgilbert@redhat.com>
References: <20200123115841.138849-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: AUIgpl4NPGKWTSep_7z42Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

virtiofsd needs access to /proc/self/fd.  Let's move to a new pid
namespace so that a compromised process cannot see another other
processes running on the system.

One wrinkle in this approach: unshare(CLONE_NEWPID) affects *child*
processes and not the current process.  Therefore we need to fork the
pid 1 process that will actually run virtiofsd and leave a parent in
waitpid(2).  This is not the same thing as daemonization and parent
processes should not notice a difference.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 134 ++++++++++++++++++++-----------
 1 file changed, 86 insertions(+), 48 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 27ab328722..0947d14e5b 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -51,7 +51,10 @@
 #include <string.h>
 #include <sys/file.h>
 #include <sys/mount.h>
+#include <sys/prctl.h>
 #include <sys/syscall.h>
+#include <sys/types.h>
+#include <sys/wait.h>
 #include <sys/xattr.h>
 #include <unistd.h>
=20
@@ -1945,24 +1948,95 @@ static void print_capabilities(void)
 }
=20
 /*
- * Called after our UNIX domain sockets have been created, now we can move=
 to
- * an empty network namespace to prevent TCP/IP and other network activity=
 in
- * case this process is compromised.
+ * Move to a new mount, net, and pid namespaces to isolate this process.
  */
-static void setup_net_namespace(void)
+static void setup_namespaces(struct lo_data *lo, struct fuse_session *se)
 {
-    if (unshare(CLONE_NEWNET) !=3D 0) {
-        fuse_log(FUSE_LOG_ERR, "unshare(CLONE_NEWNET): %m\n");
+    pid_t child;
+
+    /*
+     * Create a new pid namespace for *child* processes.  We'll have to
+     * fork in order to enter the new pid namespace.  A new mount namespac=
e
+     * is also needed so that we can remount /proc for the new pid
+     * namespace.
+     *
+     * Our UNIX domain sockets have been created.  Now we can move to
+     * an empty network namespace to prevent TCP/IP and other network
+     * activity in case this process is compromised.
+     */
+    if (unshare(CLONE_NEWPID | CLONE_NEWNS | CLONE_NEWNET) !=3D 0) {
+        fuse_log(FUSE_LOG_ERR, "unshare(CLONE_NEWPID | CLONE_NEWNS): %m\n"=
);
+        exit(1);
+    }
+
+    child =3D fork();
+    if (child < 0) {
+        fuse_log(FUSE_LOG_ERR, "fork() failed: %m\n");
+        exit(1);
+    }
+    if (child > 0) {
+        pid_t waited;
+        int wstatus;
+
+        /* The parent waits for the child */
+        do {
+            waited =3D waitpid(child, &wstatus, 0);
+        } while (waited < 0 && errno =3D=3D EINTR && !se->exited);
+
+        /* We were terminated by a signal, see fuse_signals.c */
+        if (se->exited) {
+            exit(0);
+        }
+
+        if (WIFEXITED(wstatus)) {
+            exit(WEXITSTATUS(wstatus));
+        }
+
+        exit(1);
+    }
+
+    /* Send us SIGTERM when the parent thread terminates, see prctl(2) */
+    prctl(PR_SET_PDEATHSIG, SIGTERM);
+
+    /*
+     * If the mounts have shared propagation then we want to opt out so ou=
r
+     * mount changes don't affect the parent mount namespace.
+     */
+    if (mount(NULL, "/", NULL, MS_REC | MS_SLAVE, NULL) < 0) {
+        fuse_log(FUSE_LOG_ERR, "mount(/, MS_REC|MS_SLAVE): %m\n");
+        exit(1);
+    }
+
+    /* The child must remount /proc to use the new pid namespace */
+    if (mount("proc", "/proc", "proc",
+              MS_NODEV | MS_NOEXEC | MS_NOSUID | MS_RELATIME, NULL) < 0) {
+        fuse_log(FUSE_LOG_ERR, "mount(/proc): %m\n");
+        exit(1);
+    }
+
+    /* Now we can get our /proc/self/fd directory file descriptor */
+    lo->proc_self_fd =3D open("/proc/self/fd", O_PATH);
+    if (lo->proc_self_fd =3D=3D -1) {
+        fuse_log(FUSE_LOG_ERR, "open(/proc/self/fd, O_PATH): %m\n");
         exit(1);
     }
 }
=20
-/* This magic is based on lxc's lxc_pivot_root() */
-static void setup_pivot_root(const char *source)
+/*
+ * Make the source directory our root so symlinks cannot escape and no oth=
er
+ * files are accessible.  Assumes unshare(CLONE_NEWNS) was already called.
+ */
+static void setup_mounts(const char *source)
 {
     int oldroot;
     int newroot;
=20
+    if (mount(source, source, NULL, MS_BIND, NULL) < 0) {
+        fuse_log(FUSE_LOG_ERR, "mount(%s, %s, MS_BIND): %m\n", source, sou=
rce);
+        exit(1);
+    }
+
+    /* This magic is based on lxc's lxc_pivot_root() */
     oldroot =3D open("/", O_DIRECTORY | O_RDONLY | O_CLOEXEC);
     if (oldroot < 0) {
         fuse_log(FUSE_LOG_ERR, "open(/): %m\n");
@@ -2009,47 +2083,14 @@ static void setup_pivot_root(const char *source)
     close(oldroot);
 }
=20
-static void setup_proc_self_fd(struct lo_data *lo)
-{
-    lo->proc_self_fd =3D open("/proc/self/fd", O_PATH);
-    if (lo->proc_self_fd =3D=3D -1) {
-        fuse_log(FUSE_LOG_ERR, "open(/proc/self/fd, O_PATH): %m\n");
-        exit(1);
-    }
-}
-
-/*
- * Make the source directory our root so symlinks cannot escape and no oth=
er
- * files are accessible.
- */
-static void setup_mount_namespace(const char *source)
-{
-    if (unshare(CLONE_NEWNS) !=3D 0) {
-        fuse_log(FUSE_LOG_ERR, "unshare(CLONE_NEWNS): %m\n");
-        exit(1);
-    }
-
-    if (mount(NULL, "/", NULL, MS_REC | MS_SLAVE, NULL) < 0) {
-        fuse_log(FUSE_LOG_ERR, "mount(/, MS_REC|MS_PRIVATE): %m\n");
-        exit(1);
-    }
-
-    if (mount(source, source, NULL, MS_BIND, NULL) < 0) {
-        fuse_log(FUSE_LOG_ERR, "mount(%s, %s, MS_BIND): %m\n", source, sou=
rce);
-        exit(1);
-    }
-
-    setup_pivot_root(source);
-}
-
 /*
  * Lock down this process to prevent access to other processes or files ou=
tside
  * source directory.  This reduces the impact of arbitrary code execution =
bugs.
  */
-static void setup_sandbox(struct lo_data *lo)
+static void setup_sandbox(struct lo_data *lo, struct fuse_session *se)
 {
-    setup_net_namespace();
-    setup_mount_namespace(lo->source);
+    setup_namespaces(lo, se);
+    setup_mounts(lo->source);
 }
=20
 int main(int argc, char *argv[])
@@ -2173,10 +2214,7 @@ int main(int argc, char *argv[])
=20
     fuse_daemonize(opts.foreground);
=20
-    /* Must be after daemonize to get the right /proc/self/fd */
-    setup_proc_self_fd(&lo);
-
-    setup_sandbox(&lo);
+    setup_sandbox(&lo, se);
=20
     /* Block until ctrl+c or fusermount -u */
     ret =3D virtio_loop(se);
--=20
2.24.1


