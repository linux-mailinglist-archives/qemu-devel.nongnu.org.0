Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9FD151F1E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 18:18:02 +0100 (CET)
Received: from localhost ([::1]:34838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iz1pp-00007w-2Y
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 12:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53321)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iz1hp-0003YQ-MF
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:09:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iz1hn-0003C6-At
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:09:45 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40352
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iz1hn-00034b-5s
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580836175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dCX+9t4/tHVPG6bRmHDj+t1JxTrD4LOgUiqD37gTGuo=;
 b=YNWPwfmYHzUF2EAVA3ye5ModrcDJ54ZpaPPmKqO4MXXzzVOjL4WPTgg5RBdevAwUTOSI4V
 oCBVO6UJoHC70meICjySojBfKzZ8KZAL/a/Rbz50yeqRAUgUnJSRr3W3okwmsuaVRQ7LM6
 TybGUcRGavgnfzNbLeI8DeNlvEEdRXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-8xRNcMUtNImeEaVQHQzcfQ-1; Tue, 04 Feb 2020 12:09:31 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38B558010EF;
 Tue,  4 Feb 2020 17:09:30 +0000 (UTC)
Received: from localhost (ovpn-117-98.ams2.redhat.com [10.36.117.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EEC97FB79;
 Tue,  4 Feb 2020 17:09:29 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 13/33] block: Add child_of_bds
Date: Tue,  4 Feb 2020 18:08:28 +0100
Message-Id: <20200204170848.614480-14-mreitz@redhat.com>
In-Reply-To: <20200204170848.614480-1-mreitz@redhat.com>
References: <20200204170848.614480-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 8xRNcMUtNImeEaVQHQzcfQ-1
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Any current user of child_file, child_format, and child_backing can and
should use this generic BdrvChildClass instead, as it can handle all of
these cases.  However, to be able to do so, the users must pass the
appropriate BdrvChildRole when the child is created/attached.  (The
following commits will take care of that.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c                   | 27 +++++++++++++++++++++++++++
 include/block/block_int.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/block.c b/block.c
index 46fc08e227..1816e92674 100644
--- a/block.c
+++ b/block.c
@@ -1072,6 +1072,33 @@ static void bdrv_inherited_options(BdrvChildRole rol=
e, bool parent_is_format,
     *child_flags =3D flags;
 }
=20
+static int bdrv_backing_update_filename(BdrvChild *c, BlockDriverState *ba=
se,
+                                        const char *filename, Error **errp=
);
+
+static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState *b=
ase,
+                                         const char *filename, Error **err=
p)
+{
+    if (c->role & BDRV_CHILD_COW) {
+        return bdrv_backing_update_filename(c, base, filename, errp);
+    }
+    return 0;
+}
+
+const BdrvChildClass child_of_bds =3D {
+    .parent_is_bds   =3D true,
+    .get_parent_desc =3D bdrv_child_get_parent_desc,
+    .inherit_options =3D bdrv_inherited_options,
+    .drained_begin   =3D bdrv_child_cb_drained_begin,
+    .drained_poll    =3D bdrv_child_cb_drained_poll,
+    .drained_end     =3D bdrv_child_cb_drained_end,
+    .attach          =3D bdrv_child_cb_attach,
+    .detach          =3D bdrv_child_cb_detach,
+    .inactivate      =3D bdrv_child_cb_inactivate,
+    .can_set_aio_ctx =3D bdrv_child_cb_can_set_aio_ctx,
+    .set_aio_ctx     =3D bdrv_child_cb_set_aio_ctx,
+    .update_filename =3D bdrv_child_cb_update_filename,
+};
+
 /*
  * Returns the options and flags that bs->file should get if a protocol dr=
iver
  * is expected, based on the given options and flags for the parent BDS
diff --git a/include/block/block_int.h b/include/block/block_int.h
index f4c673620f..91883c1e80 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -740,6 +740,7 @@ struct BdrvChildClass {
     void (*set_aio_ctx)(BdrvChild *child, AioContext *ctx, GSList **ignore=
);
 };
=20
+extern const BdrvChildClass child_of_bds;
 extern const BdrvChildClass child_file;
 extern const BdrvChildClass child_format;
 extern const BdrvChildClass child_backing;
--=20
2.24.1


