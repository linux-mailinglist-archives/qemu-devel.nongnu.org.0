Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D834F143D4B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 13:53:49 +0100 (CET)
Received: from localhost ([::1]:53370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itt2S-0000Yk-CM
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 07:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51841)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itse6-0000Ds-Oo
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itse5-0003Gb-G1
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:38 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37479
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itse5-0003GA-CO
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOFOlknFXNqTTzKrDM0deZa/kDBfZ2fQsCSeBBo4drk=;
 b=SiCfSNZK++GOaM3UtorkDyw6nrSTgy5maWdwjArKxulZHmJUv6MDYKGJ/nF4FuIzyMfvQD
 WRNW+c+UvKuKC0PNxs4XznDvudmiUNPWoL/T15QApLXb64wlIlqXBZQcCWVR7s+DFJvTd7
 GJArGHwdSfzCJ9f9Pu67F/iLYz/nFME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-BTTzySorMQ6mJvO1EPElXQ-1; Tue, 21 Jan 2020 07:28:35 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41BC7107ACC7;
 Tue, 21 Jan 2020 12:28:34 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F060F60BE0;
 Tue, 21 Jan 2020 12:28:29 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 048/109] virtiofsd: sandbox mount namespace
Date: Tue, 21 Jan 2020 12:23:32 +0000
Message-Id: <20200121122433.50803-49-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: BTTzySorMQ6mJvO1EPElXQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Use a mount namespace with the shared directory tree mounted at "/" and
no other mounts.

This prevents symlink escape attacks because symlink targets are
resolved only against the shared directory and cannot go outside it.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Peng Tao <tao.peng@linux.alibaba.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 89 ++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 322205ba3a..e6ecf95e31 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -49,6 +49,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <sys/file.h>
+#include <sys/mount.h>
 #include <sys/syscall.h>
 #include <sys/xattr.h>
 #include <unistd.h>
@@ -1942,6 +1943,58 @@ static void print_capabilities(void)
     printf("}\n");
 }
=20
+/* This magic is based on lxc's lxc_pivot_root() */
+static void setup_pivot_root(const char *source)
+{
+    int oldroot;
+    int newroot;
+
+    oldroot =3D open("/", O_DIRECTORY | O_RDONLY | O_CLOEXEC);
+    if (oldroot < 0) {
+        fuse_log(FUSE_LOG_ERR, "open(/): %m\n");
+        exit(1);
+    }
+
+    newroot =3D open(source, O_DIRECTORY | O_RDONLY | O_CLOEXEC);
+    if (newroot < 0) {
+        fuse_log(FUSE_LOG_ERR, "open(%s): %m\n", source);
+        exit(1);
+    }
+
+    if (fchdir(newroot) < 0) {
+        fuse_log(FUSE_LOG_ERR, "fchdir(newroot): %m\n");
+        exit(1);
+    }
+
+    if (syscall(__NR_pivot_root, ".", ".") < 0) {
+        fuse_log(FUSE_LOG_ERR, "pivot_root(., .): %m\n");
+        exit(1);
+    }
+
+    if (fchdir(oldroot) < 0) {
+        fuse_log(FUSE_LOG_ERR, "fchdir(oldroot): %m\n");
+        exit(1);
+    }
+
+    if (mount("", ".", "", MS_SLAVE | MS_REC, NULL) < 0) {
+        fuse_log(FUSE_LOG_ERR, "mount(., MS_SLAVE | MS_REC): %m\n");
+        exit(1);
+    }
+
+    if (umount2(".", MNT_DETACH) < 0) {
+        fuse_log(FUSE_LOG_ERR, "umount2(., MNT_DETACH): %m\n");
+        exit(1);
+    }
+
+    if (fchdir(newroot) < 0) {
+        fuse_log(FUSE_LOG_ERR, "fchdir(newroot): %m\n");
+        exit(1);
+    }
+
+    close(newroot);
+    close(oldroot);
+}
+
 static void setup_proc_self_fd(struct lo_data *lo)
 {
     lo->proc_self_fd =3D open("/proc/self/fd", O_PATH);
@@ -1951,6 +2004,39 @@ static void setup_proc_self_fd(struct lo_data *lo)
     }
 }
=20
+/*
+ * Make the source directory our root so symlinks cannot escape and no oth=
er
+ * files are accessible.
+ */
+static void setup_mount_namespace(const char *source)
+{
+    if (unshare(CLONE_NEWNS) !=3D 0) {
+        fuse_log(FUSE_LOG_ERR, "unshare(CLONE_NEWNS): %m\n");
+        exit(1);
+    }
+
+    if (mount(NULL, "/", NULL, MS_REC | MS_SLAVE, NULL) < 0) {
+        fuse_log(FUSE_LOG_ERR, "mount(/, MS_REC|MS_PRIVATE): %m\n");
+        exit(1);
+    }
+
+    if (mount(source, source, NULL, MS_BIND, NULL) < 0) {
+        fuse_log(FUSE_LOG_ERR, "mount(%s, %s, MS_BIND): %m\n", source, sou=
rce);
+        exit(1);
+    }
+
+    setup_pivot_root(source);
+}
+
+/*
+ * Lock down this process to prevent access to other processes or files ou=
tside
+ * source directory.  This reduces the impact of arbitrary code execution =
bugs.
+ */
+static void setup_sandbox(struct lo_data *lo)
+{
+    setup_mount_namespace(lo->source);
+}
+
 int main(int argc, char *argv[])
 {
     struct fuse_args args =3D FUSE_ARGS_INIT(argc, argv);
@@ -2051,6 +2137,7 @@ int main(int argc, char *argv[])
     }
=20
     lo.root.fd =3D open(lo.source, O_PATH);
+
     if (lo.root.fd =3D=3D -1) {
         fuse_log(FUSE_LOG_ERR, "open(\"%s\", O_PATH): %m\n", lo.source);
         exit(1);
@@ -2074,6 +2161,8 @@ int main(int argc, char *argv[])
     /* Must be after daemonize to get the right /proc/self/fd */
     setup_proc_self_fd(&lo);
=20
+    setup_sandbox(&lo);
+
     /* Block until ctrl+c or fusermount -u */
     ret =3D virtio_loop(se);
=20
--=20
2.24.1


