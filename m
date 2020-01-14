Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790F513A7FC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 12:09:38 +0100 (CET)
Received: from localhost ([::1]:37022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irK4n-0000zq-9I
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 06:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47778)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1irJwG-00006x-E0
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:00:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1irJwC-0006uW-O8
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:00:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53865
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1irJwC-0006ty-1L
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:00:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578999643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T4C7H8US9C+0o3jOaH4jJKW81pnBF5wlB3cYpsUWEzs=;
 b=Au4+iiE1YVHaXNA0bIBR/aPjjR/mFfj+tO++/g+jU66zdtqTbgIfE++VqHKSnvjvnHCwZi
 U6TxMZ+4bkZPAjZ9OmTlBEhQz3iGhKpEUPFmbFTrpOX2rwYzhgdTNUM3GpTytyF95CkRrP
 NdmTV1vpXZwu2RdJTONuRscENSQEjk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-wat8oZMlNmmDgUA5J8iZJg-1; Tue, 14 Jan 2020 06:00:34 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A9A88024CC;
 Tue, 14 Jan 2020 11:00:33 +0000 (UTC)
Received: from localhost (unknown [10.36.118.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B73B15DA70;
 Tue, 14 Jan 2020 11:00:24 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/15] blockdev: adds bdrv_parse_aio to use io_uring
Date: Tue, 14 Jan 2020 10:59:13 +0000
Message-Id: <20200114105921.131880-8-stefanha@redhat.com>
In-Reply-To: <20200114105921.131880-1-stefanha@redhat.com>
References: <20200114105921.131880-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: wat8oZMlNmmDgUA5J8iZJg-1
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, oleksandr@redhat.com,
 Julia Suvorova <jusual@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aarushi Mehta <mehta.aaru20@gmail.com>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Acked-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block.c               | 22 ++++++++++++++++++++++
 blockdev.c            | 12 ++++--------
 include/block/block.h |  1 +
 3 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/block.c b/block.c
index ecd09dbbfd..6c2b2bd2e2 100644
--- a/block.c
+++ b/block.c
@@ -845,6 +845,28 @@ static BlockdevDetectZeroesOptions bdrv_parse_detect_z=
eroes(QemuOpts *opts,
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
index 8e029e9c01..6523f9551d 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -385,13 +385,9 @@ static void extract_common_blockdev_options(QemuOpts *=
opts, int *bdrv_flags,
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
@@ -4641,7 +4637,7 @@ QemuOptsList qemu_common_drive_opts =3D {
         },{
             .name =3D "aio",
             .type =3D QEMU_OPT_STRING,
-            .help =3D "host AIO implementation (threads, native)",
+            .help =3D "host AIO implementation (threads, native, io_uring)=
",
         },{
             .name =3D BDRV_OPT_CACHE_WB,
             .type =3D QEMU_OPT_BOOL,
diff --git a/include/block/block.h b/include/block/block.h
index ea155da45a..2eba61e750 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -301,6 +301,7 @@ void bdrv_append(BlockDriverState *bs_new, BlockDriverS=
tate *bs_top,
 void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                        Error **errp);
=20
+int bdrv_parse_aio(const char *mode, int *flags);
 int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough=
);
 int bdrv_parse_discard_flags(const char *mode, int *flags);
 BdrvChild *bdrv_open_child(const char *filename,
--=20
2.24.1


