Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E7187894
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 05:46:05 +0100 (CET)
Received: from localhost ([::1]:52660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE47A-0002gX-3j
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 00:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52186)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1jE40L-0001GM-5A
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 00:39:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1jE40J-0000XD-Vd
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 00:39:01 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:29987)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1jE40J-0000Wp-Py
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 00:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584419939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JHxH1i/K0GH7hBo2Xl83uRZs9D8rNYlhtL+6rGnwWgY=;
 b=UlUH/jMmz9Ko2VcbbuR1wlzsy5Z0S1rymI9XnyijJOe2MJZSTj8RYIP0wDtS2WctUr9H83
 C3dXlor9iDVTG31B652PP8ySRGhkh57KepJLgWCSBp6ZGq9sQqLVV9LLLcdIc9cwROIeZf
 G8QqnGh6K+HlmsM+Rp9rWPWfIXBv24Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-dMdC7dGiOkOPkypOnnsRzA-1; Tue, 17 Mar 2020 00:38:57 -0400
X-MC-Unique: dMdC7dGiOkOPkypOnnsRzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85DF9107ACC7;
 Tue, 17 Mar 2020 04:38:55 +0000 (UTC)
Received: from probe.redhat.com (ovpn-112-191.rdu2.redhat.com [10.10.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96D9A10016EB;
 Tue, 17 Mar 2020 04:38:53 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 jsnow@redhat.com
Subject: [PULL 10/10] block/qcow2-bitmap: use bdrv_dirty_bitmap_next_dirty
Date: Tue, 17 Mar 2020 00:38:19 -0400
Message-Id: <20200317043819.20197-11-jsnow@redhat.com>
In-Reply-To: <20200317043819.20197-1-jsnow@redhat.com>
References: <20200317043819.20197-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

store_bitmap_data() loop does bdrv_set_dirty_iter() on each iteration,
which means that we actually don't need iterator itself and we can use
simpler bitmap API.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-id: 20200205112041.6003-11-vsementsov@virtuozzo.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 block/qcow2-bitmap.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 8cccc2c9f3..cb06954b4a 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1288,7 +1288,6 @@ static uint64_t *store_bitmap_data(BlockDriverState *=
bs,
     uint64_t bm_size =3D bdrv_dirty_bitmap_size(bitmap);
     const char *bm_name =3D bdrv_dirty_bitmap_name(bitmap);
     uint8_t *buf =3D NULL;
-    BdrvDirtyBitmapIter *dbi;
     uint64_t *tb;
     uint64_t tb_size =3D
             size_to_clusters(s,
@@ -1307,12 +1306,14 @@ static uint64_t *store_bitmap_data(BlockDriverState=
 *bs,
         return NULL;
     }
=20
-    dbi =3D bdrv_dirty_iter_new(bitmap);
     buf =3D g_malloc(s->cluster_size);
     limit =3D bytes_covered_by_bitmap_cluster(s, bitmap);
     assert(DIV_ROUND_UP(bm_size, limit) =3D=3D tb_size);
=20
-    while ((offset =3D bdrv_dirty_iter_next(dbi)) >=3D 0) {
+    offset =3D 0;
+    while ((offset =3D bdrv_dirty_bitmap_next_dirty(bitmap, offset, INT64_=
MAX))
+           >=3D 0)
+    {
         uint64_t cluster =3D offset / limit;
         uint64_t end, write_size;
         int64_t off;
@@ -1355,23 +1356,17 @@ static uint64_t *store_bitmap_data(BlockDriverState=
 *bs,
             goto fail;
         }
=20
-        if (end >=3D bm_size) {
-            break;
-        }
-
-        bdrv_set_dirty_iter(dbi, end);
+        offset =3D end;
     }
=20
     *bitmap_table_size =3D tb_size;
     g_free(buf);
-    bdrv_dirty_iter_free(dbi);
=20
     return tb;
=20
 fail:
     clear_bitmap_table(bs, tb, tb_size);
     g_free(buf);
-    bdrv_dirty_iter_free(dbi);
     g_free(tb);
=20
     return NULL;
--=20
2.21.1


