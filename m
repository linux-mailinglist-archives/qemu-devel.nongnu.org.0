Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B026A147122
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 19:50:18 +0100 (CET)
Received: from localhost ([::1]:35068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuhYX-0005H5-Ju
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 13:50:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41177)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufdk-0004lT-CS
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufdj-0006RP-8c
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:32 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:32267
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufdj-0006Ql-5x
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lj9ybDQyvN3fBqhUPDkPLVFN9fpotOGLEAZ1wOYsfuk=;
 b=admaxu+09M6CtLE+5GLgi6wp9+L9GHFwsr/+V54L+2bYHosWvbEu/c7LLFJS+NI4z6ofut
 AAU18Lih2wGVZx3CSHgFoGBqaACtWwRUeyuk3uuJsRADl6KrtKlz/aky4bUnJLKSt6CcuA
 Br4KYhVrijwcvoYC8e0WHy6zQ9p7/aU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-QizME4TbN_G1yOSzkC1Fjg-1; Thu, 23 Jan 2020 11:47:28 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 169F192DFF
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:47:27 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6243719C69;
 Thu, 23 Jan 2020 16:47:26 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 032/108] virtiofsd: add --print-capabilities option
Date: Thu, 23 Jan 2020 16:45:14 +0000
Message-Id: <20200123164630.91498-33-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: QizME4TbN_G1yOSzkC1Fjg-1
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

Add the --print-capabilities option as per vhost-user.rst "Backend
programs conventions".  Currently there are no advertised features.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 docs/interop/vhost-user.json     |  4 +++-
 tools/virtiofsd/fuse_lowlevel.h  |  1 +
 tools/virtiofsd/helper.c         |  2 ++
 tools/virtiofsd/passthrough_ll.c | 12 ++++++++++++
 4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/docs/interop/vhost-user.json b/docs/interop/vhost-user.json
index ce0ef74db5..ef8ac5941f 100644
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
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowleve=
l.h
index f6b34700af..0d61df8110 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -1794,6 +1794,7 @@ struct fuse_cmdline_opts {
     int nodefault_subtype;
     int show_version;
     int show_help;
+    int print_capabilities;
     unsigned int max_idle_threads;
 };
=20
diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
index a3645fc807..b8ec5ac8dc 100644
--- a/tools/virtiofsd/helper.c
+++ b/tools/virtiofsd/helper.c
@@ -40,6 +40,7 @@ static const struct fuse_opt fuse_helper_opts[] =3D {
     FUSE_HELPER_OPT("--help", show_help),
     FUSE_HELPER_OPT("-V", show_version),
     FUSE_HELPER_OPT("--version", show_version),
+    FUSE_HELPER_OPT("--print-capabilities", print_capabilities),
     FUSE_HELPER_OPT("-d", debug),
     FUSE_HELPER_OPT("debug", debug),
     FUSE_HELPER_OPT("-d", foreground),
@@ -135,6 +136,7 @@ void fuse_cmdline_help(void)
 {
     printf("    -h   --help                print help\n"
            "    -V   --version             print version\n"
+           "    --print-capabilities       print vhost-user.json\n"
            "    -d   -o debug              enable debug output (implies -f=
)\n"
            "    -f                         foreground operation\n"
            "    --daemonize                run in background\n"
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 037c5d7b26..cd27c09f59 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1298,6 +1298,14 @@ static struct fuse_lowlevel_ops lo_oper =3D {
     .lseek =3D lo_lseek,
 };
=20
+/* Print vhost-user.json backend program capabilities */
+static void print_capabilities(void)
+{
+    printf("{\n");
+    printf("  \"type\": \"fs\"\n");
+    printf("}\n");
+}
+
 int main(int argc, char *argv[])
 {
     struct fuse_args args =3D FUSE_ARGS_INIT(argc, argv);
@@ -1328,6 +1336,10 @@ int main(int argc, char *argv[])
         fuse_lowlevel_version();
         ret =3D 0;
         goto err_out1;
+    } else if (opts.print_capabilities) {
+        print_capabilities();
+        ret =3D 0;
+        goto err_out1;
     }
=20
     if (fuse_opt_parse(&args, &lo, lo_opts, NULL) =3D=3D -1) {
--=20
2.24.1


