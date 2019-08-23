Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E509AB4B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 11:26:19 +0200 (CEST)
Received: from localhost ([::1]:53228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i15pq-0006Rm-G0
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 05:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51789)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1i15nx-0004ib-C8
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 05:24:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1i15nv-000241-PQ
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 05:24:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46047)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1i15nv-00023p-I7
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 05:24:19 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DE1F3307D915
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 09:24:18 +0000 (UTC)
Received: from localhost (ovpn-117-204.ams2.redhat.com [10.36.117.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBEFA60605;
 Fri, 23 Aug 2019 09:24:15 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 10:24:01 +0100
Message-Id: <20190823092401.11883-3-stefanha@redhat.com>
In-Reply-To: <20190823092401.11883-1-stefanha@redhat.com>
References: <20190823092401.11883-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 23 Aug 2019 09:24:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/2] virtiofsd: replace err(3) and errx(3) with
 fuse_err()
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not use err(3) and errx(3) since they print to stderr.  When --syslog
is used these messages must go to syslog(3) instead.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 contrib/virtiofsd/passthrough_ll.c | 107 +++++++++++++++++++----------
 contrib/virtiofsd/seccomp.c        |  15 ++--
 2 files changed, 81 insertions(+), 41 deletions(-)

diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passt=
hrough_ll.c
index 873e0938a7..f348b0be9d 100644
--- a/contrib/virtiofsd/passthrough_ll.c
+++ b/contrib/virtiofsd/passthrough_ll.c
@@ -47,7 +47,6 @@
 #include <dirent.h>
 #include <assert.h>
 #include <errno.h>
-#include <err.h>
 #include <semaphore.h>
 #include <inttypes.h>
 #include <pthread.h>
@@ -1081,12 +1080,16 @@ static void lo_restore_cred(struct lo_cred *old)
 	int res;
=20
 	res =3D syscall(SYS_setresuid, -1, old->euid, -1);
-	if (res =3D=3D -1)
-		err(1, "seteuid(%u)", old->euid);
+	if (res =3D=3D -1) {
+		fuse_err("seteuid(%u): %m\n", old->euid);
+		exit(1);
+	}
=20
 	res =3D syscall(SYS_setresgid, -1, old->egid, -1);
-	if (res =3D=3D -1)
-		err(1, "setegid(%u)", old->egid);
+	if (res =3D=3D -1) {
+		fuse_err("setegid(%u): %m\n", old->egid);
+		exit(1);
+	}
 }
=20
 static void lo_mknod_symlink(fuse_req_t req, fuse_ino_t parent,
@@ -2660,8 +2663,10 @@ static void setup_shared_versions(struct lo_data *=
lo)
 		return;
=20
 	sock =3D socket(AF_UNIX, SOCK_SEQPACKET, 0);
-	if (sock =3D=3D -1)
-		err(1, "socket(AF_UNIX, SOCK_SEQPACKET, 0)");
+	if (sock =3D=3D -1) {
+		fuse_err("socket(AF_UNIX, SOCK_SEQPACKET, 0): %m\n");
+		exit(1);
+	}
=20
 	strncpy(name.sun_path, socket_name, sizeof(name.sun_path) - 1);
=20
@@ -2677,18 +2682,25 @@ static void setup_shared_versions(struct lo_data =
*lo)
 	lo->ireg_sock =3D sock;
=20
 	fd =3D open(version_path, O_RDWR);
-	if (sock =3D=3D -1)
-		err(1, "open(%s, O_RDWR)", version_path);
+	if (sock =3D=3D -1) {
+		fuse_err("open(%s, O_RDWR): %m\n", version_path);
+		exit(1);
+	}
=20
 	res =3D fstat(fd, &stat);
-	if (res =3D=3D -1)
-		err(1, "fstat(%i, &stat)", fd);
+	if (res =3D=3D -1) {
+		fuse_err("fstat(%i, &stat): %m\n", fd);
+		exit(1);
+	}
=20
 	lo->version_table_size =3D stat.st_size / sizeof(lo->version_table[0]);
=20
 	addr =3D mmap(NULL, stat.st_size, PROT_READ | PROT_WRITE, MAP_SHARED, f=
d, 0);
-	if (addr =3D=3D MAP_FAILED)
-		err(1, "mmap(NULL, %li, PROT_READ | PROT_WRITE, MAP_SHARED, %i, 0", st=
at.st_size, fd);
+	if (addr =3D=3D MAP_FAILED) {
+		fuse_err("mmap(NULL, %li, PROT_READ | PROT_WRITE, MAP_SHARED, %i, 0): =
%m\n",
+			 stat.st_size, fd);
+		exit(1);
+	}
=20
 	lo->version_table =3D addr;
 }
@@ -2701,36 +2713,44 @@ static void setup_pivot_root(const char *source)
=20
 	oldroot =3D open("/", O_DIRECTORY | O_RDONLY | O_CLOEXEC);
 	if (oldroot < 0) {
-		err(1, "open(/)");
+		fuse_err("open(/): %m\n");
+		exit(1);
 	}
=20
 	newroot =3D open(source, O_DIRECTORY | O_RDONLY | O_CLOEXEC);
 	if (newroot < 0) {
-		err(1, "open(%s)", source);
+		fuse_err("open(%s): %m\n", source);
+		exit(1);
 	}
=20
 	if (fchdir(newroot) < 0) {
-		err(1, "fchdir(newroot)");
+		fuse_err("fchdir(newroot): %m\n");
+		exit(1);
 	}
=20
 	if (syscall(__NR_pivot_root, ".", ".") < 0){
-		err(1, "pivot_root(., .)");
+		fuse_err("pivot_root(., .): %m\n");
+		exit(1);
 	}
=20
 	if (fchdir(oldroot) < 0) {
-		err(1, "fchdir(oldroot)");
+		fuse_err("fchdir(oldroot): %m\n");
+		exit(1);
 	}
=20
 	if (mount("", ".", "", MS_SLAVE | MS_REC, NULL) < 0) {
-		err(1, "mount(., MS_SLAVE | MS_REC)");
+		fuse_err("mount(., MS_SLAVE | MS_REC): %m\n");
+		exit(1);
 	}
=20
 	if (umount2(".", MNT_DETACH) < 0) {
-		err(1, "umount2(., MNT_DETACH)");
+		fuse_err("umount2(., MNT_DETACH): %m\n");
+		exit(1);
 	}
=20
 	if (fchdir(newroot) < 0) {
-		err(1, "fchdir(newroot)");
+		fuse_err("fchdir(newroot): %m\n");
+		exit(1);
 	}
=20
 	close(newroot);
@@ -2744,15 +2764,18 @@ static void setup_pivot_root(const char *source)
 static void setup_mount_namespace(const char *source)
 {
 	if (unshare(CLONE_NEWNS) !=3D 0) {
-		err(1, "unshare(CLONE_NEWNS)");
+		fuse_err("unshare(CLONE_NEWNS): %m\n");
+		exit(1);
 	}
=20
 	if (mount(NULL, "/", NULL, MS_REC|MS_SLAVE, NULL) < 0) {
-		err(1, "mount(/, MS_REC|MS_PRIVATE)");
+		fuse_err("mount(/, MS_REC|MS_PRIVATE): %m\n");
+		exit(1);
 	}
=20
 	if (mount(source, source, NULL, MS_BIND, NULL) < 0) {
-		err(1, "mount(%s, %s, MS_BIND)", source, source);
+		fuse_err("mount(%s, %s, MS_BIND): %m\n", source, source);
+		exit(1);
 	}
=20
 	setup_pivot_root(source);
@@ -2774,12 +2797,15 @@ static void setup_root(struct lo_data *lo, struct=
 lo_inode *root)
 	struct stat stat;
=20
 	fd =3D open("/", O_PATH);
-	if (fd =3D=3D -1)
-		err(1, "open(%s, O_PATH)", lo->source);
+	if (fd =3D=3D -1) {
+		fuse_err("open(%s, O_PATH): %m\n", lo->source);
+	}
=20
 	res =3D fstatat(fd, "", &stat, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
-	if (res =3D=3D -1)
-		err(1, "fstatat(%s)", lo->source);
+	if (res =3D=3D -1) {
+		fuse_err("fstatat(%s): %m\n", lo->source);
+		exit(1);
+	}
=20
 	root->fd =3D fd;
 	root->key.ino =3D stat.st_ino;
@@ -2792,7 +2818,8 @@ static void setup_proc_self_fd(struct lo_data *lo)
 {
 	lo->proc_self_fd =3D open("/proc/self/fd", O_PATH);
 	if (lo->proc_self_fd =3D=3D -1) {
-		err(1, "open(/proc/self/fd, O_PATH)");
+		fuse_err("open(/proc/self/fd, O_PATH): %m\n");
+		exit(1);
 	}
 }
=20
@@ -2811,14 +2838,16 @@ static void setup_nofile_rlimit(void)
 	errno =3D 0;
 	max =3D strtoll(nr_open, NULL, 0);
 	if (errno) {
-		err(1, "strtoll(%s)", nr_open);
+		fuse_err("strtoll(%s): %m\n", nr_open);
+		exit(1);
 	}
=20
 	rlim.rlim_cur =3D max;
 	rlim.rlim_max =3D max;
=20
 	if (setrlimit(RLIMIT_NOFILE, &rlim) < 0) {
-		err(1, "setrlimit(RLIMIT_NOFILE)");
+		fuse_err("setrlimit(RLIMIT_NOFILE): %m\n");
+		exit(1);
 	}
=20
 	g_free(nr_open);
@@ -2934,10 +2963,15 @@ int main(int argc, char *argv[])
 		int res;
=20
 		res =3D lstat(lo.source, &stat);
-		if (res =3D=3D -1)
-			err(1, "failed to stat source (\"%s\")", lo.source);
-		if (!S_ISDIR(stat.st_mode))
-			errx(1, "source is not a directory");
+		if (res =3D=3D -1) {
+			fuse_err("failed to stat source (\"%s\"): %m\n",
+				 lo.source);
+			exit(1);
+		}
+		if (!S_ISDIR(stat.st_mode)) {
+			fuse_err("source is not a directory\n");
+			exit(1);
+		}
 	} else {
 		lo.source =3D strdup("/");
 	}
@@ -2957,7 +2991,8 @@ int main(int argc, char *argv[])
 			break;
 		}
 	} else if (lo.timeout < 0) {
-		errx(1, "timeout is negative (%lf)", lo.timeout);
+		fuse_err("timeout is negative (%lf)\n", lo.timeout);
+		exit(1);
 	}
=20
 	setup_shared_versions(&lo);
diff --git a/contrib/virtiofsd/seccomp.c b/contrib/virtiofsd/seccomp.c
index 3b92c6ee13..c4d9cd6fab 100644
--- a/contrib/virtiofsd/seccomp.c
+++ b/contrib/virtiofsd/seccomp.c
@@ -7,10 +7,10 @@
  */
=20
 #include <stdlib.h>
-#include <err.h>
 #include <errno.h>
 #include <seccomp.h>
 #include <glib.h>
+#include "fuse_log.h"
 #include "seccomp.h"
=20
 static const int syscall_whitelist[] =3D {
@@ -97,7 +97,9 @@ static void add_whitelist(scmp_filter_ctx ctx, const in=
t syscalls[],
 	for (i =3D 0; i < len; i++) {
 		if (seccomp_rule_add(ctx, SCMP_ACT_ALLOW,
 				     syscalls[i], 0) !=3D 0) {
-			err(1, "seccomp_rule_add syscall %d", syscalls[i]);
+			fuse_err("seccomp_rule_add syscall %d failed\n",
+				 syscalls[i]);
+			exit(1);
 		}
 	}
 }
@@ -112,7 +114,8 @@ void setup_seccomp(bool enable_syslog)
 	ctx =3D seccomp_init(SCMP_ACT_KILL);
 #endif
 	if (!ctx) {
-		err(1, "seccomp_init()");
+		fuse_err("seccomp_init() failed\n");
+		exit(1);
 	}
=20
 	add_whitelist(ctx, syscall_whitelist, G_N_ELEMENTS(syscall_whitelist));
@@ -123,11 +126,13 @@ void setup_seccomp(bool enable_syslog)
=20
 	/* libvhost-user calls this for post-copy migration, we don't need it *=
/
 	if (seccomp_rule_add(ctx, SCMP_ACT_ERRNO(ENOSYS), SCMP_SYS(userfaultfd)=
, 0) !=3D 0) {
-		err(1, "seccomp_rule_add userfaultfd");
+		fuse_err("seccomp_rule_add userfaultfd failed\n");
+		exit(1);
 	}
=20
 	if (seccomp_load(ctx) < 0) {
-		err(1, "seccomp_load()");
+		fuse_err("seccomp_load() failed\n");
+		exit(1);
 	}
=20
 	seccomp_release(ctx);
--=20
2.21.0


