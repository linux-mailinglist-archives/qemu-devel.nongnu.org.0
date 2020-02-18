Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E7116265A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 13:45:02 +0100 (CET)
Received: from localhost ([::1]:33860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j42FJ-00079A-5p
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 07:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39145)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j42Dv-00054c-H7
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:43:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j42Du-0001Lb-Hj
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:43:35 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49355
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j42Du-0001LN-DR
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:43:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582029814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Svr+RtKi3pCVX6eLWUCWA7YmRroPmrE7+yEhrpkVpHk=;
 b=bXvRFQ6m6gDZUwLq/qa5eHpV1OYCeKS6pGEVPkBC80MDH7vOl/RH3dl2ufvCb3ILdKzNAH
 hKAMnwJI11UNxT8wHtUfLsTMUTCbD+1Lm4kcYjEuQkJz3NDsh0uso27PlclyfuxbhlwZdU
 xvhvzXLYiIVIqyC0IPA8EPDrJ43SoOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-tSSk4OHgP3KupRWauk98EQ-1; Tue, 18 Feb 2020 07:43:32 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74144108442A;
 Tue, 18 Feb 2020 12:43:31 +0000 (UTC)
Received: from localhost (unknown [10.36.118.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF4735DA76;
 Tue, 18 Feb 2020 12:43:30 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 14/33] block: Distinguish paths in *_format_default_perms
Date: Tue, 18 Feb 2020 13:42:23 +0100
Message-Id: <20200218124242.584644-15-mreitz@redhat.com>
In-Reply-To: <20200218124242.584644-1-mreitz@redhat.com>
References: <20200218124242.584644-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: tSSk4OHgP3KupRWauk98EQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_format_default_perms() has one code path for backing files, and one
for storage files.  We want to pull them out into own functions, so
make sure they are completely distinct before so the next patches will
be a bit cleaner.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index 1d33f58ff8..982785b15a 100644
--- a/block.c
+++ b/block.c
@@ -2331,6 +2331,13 @@ void bdrv_format_default_perms(BlockDriverState *bs,=
 BdrvChild *c,
             perm |=3D BLK_PERM_CONSISTENT_READ;
         }
         shared &=3D ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
+
+        if (bs->open_flags & BDRV_O_INACTIVE) {
+            shared |=3D BLK_PERM_WRITE | BLK_PERM_RESIZE;
+        }
+
+        *nperm =3D perm;
+        *nshared =3D shared;
     } else {
         /* We want consistent read from backing files if the parent needs =
it.
          * No other operations are performed on backing files. */
@@ -2347,14 +2354,14 @@ void bdrv_format_default_perms(BlockDriverState *bs=
, BdrvChild *c,
=20
         shared |=3D BLK_PERM_CONSISTENT_READ | BLK_PERM_GRAPH_MOD |
                   BLK_PERM_WRITE_UNCHANGED;
-    }
=20
-    if (bs->open_flags & BDRV_O_INACTIVE) {
-        shared |=3D BLK_PERM_WRITE | BLK_PERM_RESIZE;
-    }
+        if (bs->open_flags & BDRV_O_INACTIVE) {
+            shared |=3D BLK_PERM_WRITE | BLK_PERM_RESIZE;
+        }
=20
-    *nperm =3D perm;
-    *nshared =3D shared;
+        *nperm =3D perm;
+        *nshared =3D shared;
+    }
 }
=20
 uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
--=20
2.24.1


