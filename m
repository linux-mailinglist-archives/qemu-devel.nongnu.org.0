Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6910E143D5C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 13:56:43 +0100 (CET)
Received: from localhost ([::1]:53404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itt5F-0003YX-NC
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 07:56:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51433)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itscZ-0007L0-EP
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:27:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itscY-0002W3-9j
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:27:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52030
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itscX-0002TZ-JE
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:27:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pMB/gysStOUT7aMThUEsaX2Hh/mPauxInlHSSSFPREk=;
 b=Ke0GHmu1TkRFq0A1pEZEzEG9qvwSl9C+9e5o9jTBEpiX0qYum06EY6eya9IvPTtcDJQ1EK
 cOmVRliYlvN+t4ul/uLubr013FznkQiCFsUGdpdOQxvAcgAJSD2R2THO0DvvOFSz+Wn0Ck
 bOvuWxUwZ8kEV8Jxm7Ll0/wxw7Mw290=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-yd20M6NZMXiZsxJA_bq_Nw-1; Tue, 21 Jan 2020 07:26:59 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC41DA0CBF;
 Tue, 21 Jan 2020 12:26:58 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEDE860BE0;
 Tue, 21 Jan 2020 12:26:54 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 031/109] virtiofsd: add --print-capabilities option
Date: Tue, 21 Jan 2020 12:23:15 +0000
Message-Id: <20200121122433.50803-32-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: yd20M6NZMXiZsxJA_bq_Nw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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

Add the --print-capabilities option as per vhost-user.rst "Backend
programs conventions".  Currently there are no advertised features.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
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
index 46c97edbe2..a95bc641fa 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -1826,6 +1826,7 @@ struct fuse_cmdline_opts {
     int nodefault_subtype;
     int show_version;
     int show_help;
+    int print_capabilities;
     unsigned int max_idle_threads;
 };
=20
diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
index bb35b90e75..8d66be46f8 100644
--- a/tools/virtiofsd/helper.c
+++ b/tools/virtiofsd/helper.c
@@ -39,6 +39,7 @@ static const struct fuse_opt fuse_helper_opts[] =3D {
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
index fcb588f370..53ed56f2a9 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1297,6 +1297,14 @@ static struct fuse_lowlevel_ops lo_oper =3D {
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
@@ -1327,6 +1335,10 @@ int main(int argc, char *argv[])
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


