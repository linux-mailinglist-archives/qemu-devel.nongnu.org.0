Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59673181CD9
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:50:07 +0100 (CET)
Received: from localhost ([::1]:54602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3cU-0005c7-CL
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59912)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jC3VR-0003Bf-Vy
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jC3VP-0003g5-Sh
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44143
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jC3VP-0003ek-PP
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583941367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/LwV56RNgFYCSdmy8UpKDULA6AtwJDp690fsNSHhS0=;
 b=T1aWor/chYMKNqYSmChtfrDKzCX/Mw19MCFowihRLmkEw5Uo5yuEwXTB5lEFWeXJEEBVin
 hX4CV/gIH/8KrVtl+rFFaqnDBsA40fOVksBTPvYLozNj7sAtBlkQ/1Bip2wpsFkKbI2/e+
 w+DtxpRFP6UVgWj20ZDna9ZXIAEBBQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-G97Tpj47PmSQX6ASoOfI-g-1; Wed, 11 Mar 2020 11:42:42 -0400
X-MC-Unique: G97Tpj47PmSQX6ASoOfI-g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DD98DB62;
 Wed, 11 Mar 2020 15:42:41 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15B6B92D2C;
 Wed, 11 Mar 2020 15:42:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/13] block.c: adding bdrv_co_delete_file
Date: Wed, 11 Mar 2020 16:42:16 +0100
Message-Id: <20200311154218.15532-12-kwolf@redhat.com>
In-Reply-To: <20200311154218.15532-1-kwolf@redhat.com>
References: <20200311154218.15532-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Using the new 'bdrv_co_delete_file' interface, a pure co_routine function
'bdrv_co_delete_file' inside block.c can can be used in a way similar of
the existing bdrv_create_file to to clean up a created file.

We're creating a pure co_routine because the only caller of
'bdrv_co_delete_file' will be already in co_routine context, thus there
is no need to add all the machinery to check for qemu_in_coroutine() and
create a separated co_routine to do the job.

Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20200130213907.2830642-3-danielhb413@gmail.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h |  1 +
 block.c               | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index cd6b5b95aa..e569a4d747 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -363,6 +363,7 @@ bool bdrv_is_backing_chain_frozen(BlockDriverState *bs,=
 BlockDriverState *base,
 int bdrv_freeze_backing_chain(BlockDriverState *bs, BlockDriverState *base=
,
                               Error **errp);
 void bdrv_unfreeze_backing_chain(BlockDriverState *bs, BlockDriverState *b=
ase);
+int coroutine_fn bdrv_co_delete_file(BlockDriverState *bs, Error **errp);
=20
=20
 typedef struct BdrvCheckResult {
diff --git a/block.c b/block.c
index 8fc7b56937..a2542c977b 100644
--- a/block.c
+++ b/block.c
@@ -668,6 +668,32 @@ int bdrv_create_file(const char *filename, QemuOpts *o=
pts, Error **errp)
     }
 }
=20
+int coroutine_fn bdrv_co_delete_file(BlockDriverState *bs, Error **errp)
+{
+    Error *local_err =3D NULL;
+    int ret;
+
+    assert(bs !=3D NULL);
+
+    if (!bs->drv) {
+        error_setg(errp, "Block node '%s' is not opened", bs->filename);
+        return -ENOMEDIUM;
+    }
+
+    if (!bs->drv->bdrv_co_delete_file) {
+        error_setg(errp, "Driver '%s' does not support image deletion",
+                   bs->drv->format_name);
+        return -ENOTSUP;
+    }
+
+    ret =3D bs->drv->bdrv_co_delete_file(bs, &local_err);
+    if (ret < 0) {
+        error_propagate(errp, local_err);
+    }
+
+    return ret;
+}
+
 /**
  * Try to get @bs's logical and physical block size.
  * On success, store them in @bsz struct and return 0.
--=20
2.20.1


