Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3B6CE165
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 14:17:13 +0200 (CEST)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHRwu-00079r-3b
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 08:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48077)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iHRqb-0001wC-6V
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 08:10:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iHRqa-00049s-3D
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 08:10:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45260)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1iHRqT-00040e-Lt; Mon, 07 Oct 2019 08:10:33 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D6E8DC04BD48;
 Mon,  7 Oct 2019 12:10:32 +0000 (UTC)
Received: from localhost (unknown [10.36.118.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33353600C1;
 Mon,  7 Oct 2019 12:10:24 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/16] blockdev: adds bdrv_parse_aio to use io_uring
Date: Mon,  7 Oct 2019 13:09:28 +0100
Message-Id: <20191007120937.5862-8-stefanha@redhat.com>
In-Reply-To: <20191007120937.5862-1-stefanha@redhat.com>
References: <20191007120937.5862-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 07 Oct 2019 12:10:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: oleksandr@redhat.com, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Julia Suvorova <jusual@mail.ru>, Julia Suvorova <jusual@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aarushi Mehta <mehta.aaru20@gmail.com>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/block/block.h |  1 +
 block.c               | 22 ++++++++++++++++++++++
 blockdev.c            | 12 ++++--------
 3 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 88a9673734..e8212a75df 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -300,6 +300,7 @@ void bdrv_append(BlockDriverState *bs_new, BlockDrive=
rState *bs_top,
 void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                        Error **errp);
=20
+int bdrv_parse_aio(const char *mode, int *flags);
 int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrou=
gh);
 int bdrv_parse_discard_flags(const char *mode, int *flags);
 BdrvChild *bdrv_open_child(const char *filename,
diff --git a/block.c b/block.c
index 5944124845..28df38ef6c 100644
--- a/block.c
+++ b/block.c
@@ -845,6 +845,28 @@ static BlockdevDetectZeroesOptions bdrv_parse_detect=
_zeroes(QemuOpts *opts,
     return detect_zeroes;
 }
=20
+/**
+ * Set open flags for aio engine
+ *
+ * Return 0 on success, -1 if the engine specified is invalid
+ */
+int bdrv_parse_aio(const char *mode, int *flags)
+{
+    if (!strcmp(mode, "threads")) {
+        /* do nothing, default */
+    } else if (!strcmp(mode, "native")) {
+        *flags |=3D BDRV_O_NATIVE_AIO;
+#ifdef CONFIG_LINUX_IO_URING
+    } else if (!strcmp(mode, "io_uring")) {
+        *flags |=3D BDRV_O_IO_URING;
+#endif
+    } else {
+        return -1;
+    }
+
+    return 0;
+}
+
 /**
  * Set open flags for a given discard mode
  *
diff --git a/blockdev.c b/blockdev.c
index fbef6845c8..d42f72011b 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -385,13 +385,9 @@ static void extract_common_blockdev_options(QemuOpts=
 *opts, int *bdrv_flags,
         }
=20
         if ((aio =3D qemu_opt_get(opts, "aio")) !=3D NULL) {
-            if (!strcmp(aio, "native")) {
-                *bdrv_flags |=3D BDRV_O_NATIVE_AIO;
-            } else if (!strcmp(aio, "threads")) {
-                /* this is the default */
-            } else {
-               error_setg(errp, "invalid aio option");
-               return;
+            if (bdrv_parse_aio(aio, bdrv_flags) < 0) {
+                error_setg(errp, "invalid aio option");
+                return;
             }
         }
     }
@@ -4661,7 +4657,7 @@ QemuOptsList qemu_common_drive_opts =3D {
         },{
             .name =3D "aio",
             .type =3D QEMU_OPT_STRING,
-            .help =3D "host AIO implementation (threads, native)",
+            .help =3D "host AIO implementation (threads, native, io_urin=
g)",
         },{
             .name =3D BDRV_OPT_CACHE_WB,
             .type =3D QEMU_OPT_BOOL,
--=20
2.21.0


