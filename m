Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1F29E4FE
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 11:56:54 +0200 (CEST)
Received: from localhost ([::1]:48996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2YDb-0005gN-F9
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 05:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53324)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1i2YC5-0004Vz-LZ
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:55:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1i2YC4-0004yo-B0
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:55:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60280)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1i2YC3-0004xw-Tm
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 05:55:16 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 393093082E57
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 09:55:15 +0000 (UTC)
Received: from localhost (ovpn-116-148.ams2.redhat.com [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8B2E60CC0;
 Tue, 27 Aug 2019 09:55:02 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: virtio-fs@redhat.com,
	qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 10:54:35 +0100
Message-Id: <20190827095437.18819-3-stefanha@redhat.com>
In-Reply-To: <20190827095437.18819-1-stefanha@redhat.com>
References: <20190827095437.18819-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 27 Aug 2019 09:55:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/4] virtiofsd: add --print-capabilities option
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the --print-capabilities option as per vhost-user.rst "Backend
programs conventions".  Currently there are no advertised features.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/interop/vhost-user.json       |  4 +++-
 contrib/virtiofsd/fuse_lowlevel.h  |  1 +
 contrib/virtiofsd/helper.c         |  2 ++
 contrib/virtiofsd/passthrough_ll.c | 12 ++++++++++++
 4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/docs/interop/vhost-user.json b/docs/interop/vhost-user.json
index da6aaf51c8..d4ea1f7ac5 100644
--- a/docs/interop/vhost-user.json
+++ b/docs/interop/vhost-user.json
@@ -31,6 +31,7 @@
 # @rproc-serial: virtio remoteproc serial link
 # @scsi: virtio scsi
 # @vsock: virtio vsock transport
+# @fs: virtio fs (since 4.2)
 #
 # Since: 4.0
 ##
@@ -50,7 +51,8 @@
       'rpmsg',
       'rproc-serial',
       'scsi',
-      'vsock'
+      'vsock',
+      'fs'
   ]
 }
=20
diff --git a/contrib/virtiofsd/fuse_lowlevel.h b/contrib/virtiofsd/fuse_l=
owlevel.h
index b441d3dfed..e3d8747571 100644
--- a/contrib/virtiofsd/fuse_lowlevel.h
+++ b/contrib/virtiofsd/fuse_lowlevel.h
@@ -1796,6 +1796,7 @@ struct fuse_cmdline_opts {
 	int nodefault_subtype;
 	int show_version;
 	int show_help;
+	int print_capabilities;
 	int clone_fd;
 	int syslog;
 	int log_level;
diff --git a/contrib/virtiofsd/helper.c b/contrib/virtiofsd/helper.c
index 8d8bca889b..84bf1c834d 100644
--- a/contrib/virtiofsd/helper.c
+++ b/contrib/virtiofsd/helper.c
@@ -35,6 +35,7 @@ static const struct fuse_opt fuse_helper_opts[] =3D {
 	FUSE_HELPER_OPT("--help",	show_help),
 	FUSE_HELPER_OPT("-V",		show_version),
 	FUSE_HELPER_OPT("--version",	show_version),
+	FUSE_HELPER_OPT("--print-capabilities", print_capabilities),
 	FUSE_HELPER_OPT("-d",		debug),
 	FUSE_HELPER_OPT("debug",	debug),
 	FUSE_HELPER_OPT("-d",		foreground),
@@ -137,6 +138,7 @@ void fuse_cmdline_help(void)
 {
 	printf("    -h   --help                print help\n"
 	       "    -V   --version             print version\n"
+	       "    --print-capabilities       print vhost-user.json\n"
 	       "    -d   -o debug              enable debug output (implies -f)=
\n"
 	       "    --syslog                   log to syslog (default stderr)\n=
"
 	       "    -f                         foreground operation\n"
diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passt=
hrough_ll.c
index 0ef01b7e3f..e2e20f22cd 100644
--- a/contrib/virtiofsd/passthrough_ll.c
+++ b/contrib/virtiofsd/passthrough_ll.c
@@ -2879,6 +2879,14 @@ static void fuse_lo_data_cleanup(struct lo_data *l=
o)
         free((char *)lo->source);
 }
=20
+/* Print vhost-user.json backend program capabilities */
+static void print_capabilities(void)
+{
+	printf("{\n");
+	printf("  \"type\": \"fs\"\n");
+	printf("}\n");
+}
+
 int main(int argc, char *argv[])
 {
 	struct fuse_args args =3D FUSE_ARGS_INIT(argc, argv);
@@ -2931,6 +2939,10 @@ int main(int argc, char *argv[])
 		fuse_lowlevel_version();
 		ret =3D 0;
 		goto err_out1;
+	} else if (opts.print_capabilities) {
+		print_capabilities();
+		ret =3D 0;
+		goto err_out1;
 	}
=20
 	if (fuse_opt_parse(&args, &lo, lo_opts, NULL)=3D=3D -1)
--=20
2.21.0


