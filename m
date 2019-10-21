Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE31DEAD0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 13:25:37 +0200 (CEST)
Received: from localhost ([::1]:38200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMVod-0005fy-VW
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 07:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46645)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iMVQl-00047g-8D
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:00:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iMVQj-0004LF-7H
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:00:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33544
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iMVQj-0004L2-31
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571655652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KAyR6T6LS+qDjuSW7yw882iDCzQBsfTPYTHOamAxtiE=;
 b=MLtj3suE350ppn09pNDCqycVPe2TftUDHvVQS3ftrbhF3CpYoYhcUWOqDij+jQ0E5fzSrB
 ErQUJ1N10OkCROMENaOxPklY09VRnJ+PkHoDuzAHBX4LYkqQWU91nh9Mgk1S0R1Yjfc2i2
 iLoWdE67a4mDseUQYmCtEfvIlcjnx00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-OK7T6NEsPruL-PB-JVwQRA-1; Mon, 21 Oct 2019 07:00:49 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69380107AD31;
 Mon, 21 Oct 2019 11:00:48 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-232.ams2.redhat.com
 [10.36.117.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6484360A9F;
 Mon, 21 Oct 2019 11:00:44 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com
Subject: [PATCH 27/30] virtiofsd: make -f (foreground) the default
Date: Mon, 21 Oct 2019 11:58:29 +0100
Message-Id: <20191021105832.36574-28-dgilbert@redhat.com>
In-Reply-To: <20191021105832.36574-1-dgilbert@redhat.com>
References: <20191021105832.36574-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: OK7T6NEsPruL-PB-JVwQRA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: piaojun@huawei.com, eguan@linux.alibaba.com, vgoyal@Redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

According to vhost-user.rst "Backend program conventions", backend
programs should run in the foregound by default.  Follow the
conventions so libvirt and other management tools can control virtiofsd
in a standard way.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 contrib/virtiofsd/helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/contrib/virtiofsd/helper.c b/contrib/virtiofsd/helper.c
index f67533f053..ab20810c28 100644
--- a/contrib/virtiofsd/helper.c
+++ b/contrib/virtiofsd/helper.c
@@ -26,6 +26,9 @@
=20
 #define FUSE_HELPER_OPT(t, p) \
 =09{ t, offsetof(struct fuse_cmdline_opts, p), 1 }
+#define FUSE_HELPER_OPT_VALUE(t, p, v) \
+=09{ t, offsetof(struct fuse_cmdline_opts, p), v }
+
=20
 static const struct fuse_opt fuse_helper_opts[] =3D {
 =09FUSE_HELPER_OPT("-h",=09=09show_help),
@@ -39,6 +42,7 @@ static const struct fuse_opt fuse_helper_opts[] =3D {
 =09FUSE_OPT_KEY("-d",=09=09FUSE_OPT_KEY_KEEP),
 =09FUSE_OPT_KEY("debug",=09=09FUSE_OPT_KEY_KEEP),
 =09FUSE_HELPER_OPT("-f",=09=09foreground),
+=09FUSE_HELPER_OPT_VALUE("--daemonize", foreground, 0),
 =09FUSE_HELPER_OPT("-s",=09=09singlethread),
 =09FUSE_HELPER_OPT("fsname=3D",=09nodefault_subtype),
 =09FUSE_OPT_KEY("fsname=3D",=09=09FUSE_OPT_KEY_KEEP),
@@ -130,6 +134,7 @@ void fuse_cmdline_help(void)
 =09       "    -V   --version             print version\n"
 =09       "    -d   -o debug              enable debug output (implies -f)=
\n"
 =09       "    -f                         foreground operation\n"
+=09       "    --daemonize                run in background\n"
 =09       "    -s                         disable multi-threaded operation=
\n"
 =09       "    -o clone_fd                use separate fuse device fd for =
each thread\n"
 =09       "                               (may improve performance)\n"
@@ -160,6 +165,7 @@ int fuse_parse_cmdline(struct fuse_args *args,
 =09memset(opts, 0, sizeof(struct fuse_cmdline_opts));
=20
 =09opts->max_idle_threads =3D 10;
+=09opts->foreground =3D 1;
=20
 =09if (fuse_opt_parse(args, opts, fuse_helper_opts,
 =09=09=09   fuse_helper_opt_proc) =3D=3D -1)
--=20
2.23.0


