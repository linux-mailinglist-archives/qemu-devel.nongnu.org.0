Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F39494D91
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 21:09:10 +0200 (CEST)
Received: from localhost ([::1]:56718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzn1h-0000f6-3Z
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 15:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32925)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1hzmpn-0002WD-Ik
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 14:56:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hzmpm-0002Fl-FL
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 14:56:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58656)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hzmpk-0002EF-4y; Mon, 19 Aug 2019 14:56:48 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7D2DD106E973;
 Mon, 19 Aug 2019 18:56:47 +0000 (UTC)
Received: from localhost (ovpn-204-64.brq.redhat.com [10.40.204.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A8E81EA;
 Mon, 19 Aug 2019 18:56:46 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 19 Aug 2019 20:56:00 +0200
Message-Id: <20190819185602.4267-15-mreitz@redhat.com>
In-Reply-To: <20190819185602.4267-1-mreitz@redhat.com>
References: <20190819185602.4267-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Mon, 19 Aug 2019 18:56:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 14/16] qcow2: Fix v3 snapshot table entry
 compliancy
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

qcow2 v3 images require every snapshot table entry to have at least 16
bytes of extra data.  If they do not, let qemu-img check -r all fix it.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2-snapshot.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index dac8a778e4..5ab64da1ec 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -516,6 +516,24 @@ int coroutine_fn qcow2_check_read_snapshot_table(Blo=
ckDriverState *bs,
         result->corruptions -=3D nb_clusters_reduced;
     }
=20
+    /*
+     * All of v3 images' snapshot table entries need to have at least
+     * 16 bytes of extra data.
+     */
+    if (s->qcow_version >=3D 3) {
+        int i;
+        for (i =3D 0; i < s->nb_snapshots; i++) {
+            if (s->snapshots[i].extra_data_size <
+                sizeof_field(QCowSnapshotExtraData, vm_state_size_large)=
 +
+                sizeof_field(QCowSnapshotExtraData, disk_size))
+            {
+                result->corruptions++;
+                fprintf(stderr, "%s snapshot table entry %i is incomplet=
e\n",
+                        fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i=
);
+            }
+        }
+    }
+
     return 0;
 }
=20
--=20
2.21.0


