Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F28316A88C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 15:38:55 +0100 (CET)
Received: from localhost ([::1]:37464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6Eso-0007tN-8N
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 09:38:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50886)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j6ElM-0002IK-49
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 09:31:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j6ElK-0002Ri-7G
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 09:31:11 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:24138
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j6ElI-0002Qz-VU
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 09:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582554668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VLf1ohxhxrG7UCgf08wgp7qss4L3nBVcimNCVx2etEg=;
 b=FX0yYtSW5uX8SH/9ATj7wlhQ8sERRZpgT8zmtE3dqA7x0Dwlu2nQ4t1ZU3PtMulyG+Xbmf
 192imihk8a6lhVpHu1AfJ9OouKgDreLy4uEU0gxJ3lVr9SJHK5R4hl1Ru3WbE/NYbyVqoy
 b+pzwdq5O/2Y9b+8OAmSqT9glVjAMmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-bRF-Sl3PME2D2DDd_am2eg-1; Mon, 24 Feb 2020 09:31:01 -0500
X-MC-Unique: bRF-Sl3PME2D2DDd_am2eg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFF4D800D54;
 Mon, 24 Feb 2020 14:31:00 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-134.ams2.redhat.com
 [10.36.117.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1AE75C114;
 Mon, 24 Feb 2020 14:30:56 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 13/20] qemu-storage-daemon: Add --chardev option
Date: Mon, 24 Feb 2020 15:30:01 +0100
Message-Id: <20200224143008.13362-14-kwolf@redhat.com>
In-Reply-To: <20200224143008.13362-1-kwolf@redhat.com>
References: <20200224143008.13362-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 coiby.xu@gmail.com, mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a --chardev option to the storage daemon that works the same
as the -chardev option of the system emulator.

The syntax of the --chardev option is still considered unstable. We want
to QAPIfy it and will potentially make changes to its syntax while
converting it. However, we haven't decided yet on a design for the
QAPIfication, so QemuOpts will have to do for now.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qemu-storage-daemon.c | 24 ++++++++++++++++++++++++
 Makefile              |  2 +-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/qemu-storage-daemon.c b/qemu-storage-daemon.c
index 14093ac3a0..82fe6cd5f2 100644
--- a/qemu-storage-daemon.c
+++ b/qemu-storage-daemon.c
@@ -29,6 +29,7 @@
=20
 #include "block/block.h"
 #include "block/nbd.h"
+#include "chardev/char.h"
 #include "crypto/init.h"
=20
 #include "qapi/error.h"
@@ -78,6 +79,9 @@ static void help(void)
 "             [,driver specific parameters...]\n"
 "                         configure a block backend\n"
 "\n"
+"  --chardev <options>    configure a character device backend\n"
+"                         (see the qemu(1) man page for possible options)\=
n"
+"\n"
 "  --export [type=3D]nbd,device=3D<node-name>[,name=3D<export-name>]\n"
 "           [,writable=3Don|off][,bitmap=3D<name>]\n"
 "                         export the specified block node over NBD\n"
@@ -104,11 +108,14 @@ QEMU_HELP_BOTTOM "\n",
=20
 enum {
     OPTION_BLOCKDEV =3D 256,
+    OPTION_CHARDEV,
     OPTION_EXPORT,
     OPTION_NBD_SERVER,
     OPTION_OBJECT,
 };
=20
+extern QemuOptsList qemu_chardev_opts;
+
 static QemuOptsList qemu_object_opts =3D {
     .name =3D "object",
     .implied_opt_name =3D "qom-type",
@@ -135,6 +142,7 @@ static void process_options(int argc, char *argv[])
=20
     static const struct option long_options[] =3D {
         {"blockdev", required_argument, NULL, OPTION_BLOCKDEV},
+        {"chardev", required_argument, NULL, OPTION_CHARDEV},
         {"export", required_argument, NULL, OPTION_EXPORT},
         {"help", no_argument, NULL, 'h'},
         {"nbd-server", required_argument, NULL, OPTION_NBD_SERVER},
@@ -182,6 +190,22 @@ static void process_options(int argc, char *argv[])
                 qapi_free_BlockdevOptions(options);
                 break;
             }
+        case OPTION_CHARDEV:
+            {
+                /* TODO This interface is not stable until we QAPIfy it */
+                QemuOpts *opts =3D qemu_opts_parse_noisily(&qemu_chardev_o=
pts,
+                                                         optarg, true);
+                if (opts =3D=3D NULL) {
+                    exit(EXIT_FAILURE);
+                }
+
+                if (!qemu_chr_new_from_opts(opts, NULL, &error_fatal)) {
+                    /* No error, but NULL returned means help was printed =
*/
+                    exit(EXIT_SUCCESS);
+                }
+                qemu_opts_del(opts);
+                break;
+            }
         case OPTION_EXPORT:
             {
                 Visitor *v;
diff --git a/Makefile b/Makefile
index 750cff8d0a..50056faf52 100644
--- a/Makefile
+++ b/Makefile
@@ -576,7 +576,7 @@ qemu-img.o: qemu-img-cmds.h
 qemu-img$(EXESUF): qemu-img.o $(authz-obj-y) $(block-obj-y) $(crypto-obj-y=
) $(io-obj-y) $(qom-obj-y) $(COMMON_LDADDS)
 qemu-nbd$(EXESUF): qemu-nbd.o $(authz-obj-y) $(block-obj-y) $(crypto-obj-y=
) $(io-obj-y) $(qom-obj-y) $(COMMON_LDADDS)
 qemu-io$(EXESUF): qemu-io.o $(authz-obj-y) $(block-obj-y) $(crypto-obj-y) =
$(io-obj-y) $(qom-obj-y) $(COMMON_LDADDS)
-qemu-storage-daemon$(EXESUF): qemu-storage-daemon.o $(authz-obj-y) $(block=
-obj-y) $(crypto-obj-y) $(io-obj-y) $(qom-obj-y) $(storage-daemon-obj-y) $(=
COMMON_LDADDS)
+qemu-storage-daemon$(EXESUF): qemu-storage-daemon.o $(authz-obj-y) $(block=
-obj-y) $(crypto-obj-y) $(chardev-obj-y) $(io-obj-y) $(qom-obj-y) $(storage=
-daemon-obj-y) $(COMMON_LDADDS)
=20
 qemu-bridge-helper$(EXESUF): qemu-bridge-helper.o $(COMMON_LDADDS)
=20
--=20
2.20.1


