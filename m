Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B16147121
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 19:50:14 +0100 (CET)
Received: from localhost ([::1]:35066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuhYT-0005F8-9j
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 13:50:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41159)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufdj-0004jr-88
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufdh-0006QO-QT
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35831
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufdh-0006Pl-NZ
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GecZLFNgbt9puS1dpkZtIJjkHeSDvk6GvBLw3x562/s=;
 b=QOzkxU+IBSZU4H+dKdTa3TwzBWpVppDURMophl8bXKj7YrX1m49em8QN/eG6/F4tyJ39S9
 TjT9zgGxAYIXZkIs241QFf4S74Hn9vVK7Hqf0mOfmJW5h5yytFSIFCo9rpTWVzTKKRelnk
 m4jJO993grg7QfHgeSTsnYMkIqOSwVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-Dqtj1luRPZOyxaIbHGWisg-1; Thu, 23 Jan 2020 11:47:26 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1802D80256C
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:47:25 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D16619C69;
 Thu, 23 Jan 2020 16:47:24 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 030/108] virtiofsd: make -f (foreground) the default
Date: Thu, 23 Jan 2020 16:45:12 +0000
Message-Id: <20200123164630.91498-31-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Dqtj1luRPZOyxaIbHGWisg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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

According to vhost-user.rst "Backend program conventions", backend
programs should run in the foregound by default.  Follow the
conventions so libvirt and other management tools can control virtiofsd
in a standard way.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
index 676032e71f..a3645fc807 100644
--- a/tools/virtiofsd/helper.c
+++ b/tools/virtiofsd/helper.c
@@ -29,6 +29,11 @@
     {                                               \
         t, offsetof(struct fuse_cmdline_opts, p), 1 \
     }
+#define FUSE_HELPER_OPT_VALUE(t, p, v)              \
+    {                                               \
+        t, offsetof(struct fuse_cmdline_opts, p), v \
+    }
+
=20
 static const struct fuse_opt fuse_helper_opts[] =3D {
     FUSE_HELPER_OPT("-h", show_help),
@@ -42,6 +47,7 @@ static const struct fuse_opt fuse_helper_opts[] =3D {
     FUSE_OPT_KEY("-d", FUSE_OPT_KEY_KEEP),
     FUSE_OPT_KEY("debug", FUSE_OPT_KEY_KEEP),
     FUSE_HELPER_OPT("-f", foreground),
+    FUSE_HELPER_OPT_VALUE("--daemonize", foreground, 0),
     FUSE_HELPER_OPT("fsname=3D", nodefault_subtype),
     FUSE_OPT_KEY("fsname=3D", FUSE_OPT_KEY_KEEP),
     FUSE_HELPER_OPT("subtype=3D", nodefault_subtype),
@@ -131,6 +137,7 @@ void fuse_cmdline_help(void)
            "    -V   --version             print version\n"
            "    -d   -o debug              enable debug output (implies -f=
)\n"
            "    -f                         foreground operation\n"
+           "    --daemonize                run in background\n"
            "    -o max_idle_threads        the maximum number of idle work=
er "
            "threads\n"
            "                               allowed (default: 10)\n");
@@ -158,6 +165,7 @@ int fuse_parse_cmdline(struct fuse_args *args, struct f=
use_cmdline_opts *opts)
     memset(opts, 0, sizeof(struct fuse_cmdline_opts));
=20
     opts->max_idle_threads =3D 10;
+    opts->foreground =3D 1;
=20
     if (fuse_opt_parse(args, opts, fuse_helper_opts, fuse_helper_opt_proc)=
 =3D=3D
         -1) {
--=20
2.24.1


