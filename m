Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340E194D82
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 21:07:16 +0200 (CEST)
Received: from localhost ([::1]:56684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzmzq-0006V9-Tx
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 15:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32886)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1hzmpk-0002Rn-TT
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 14:56:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hzmpj-0002EL-RV
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 14:56:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51430)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hzmph-0002Ch-OB; Mon, 19 Aug 2019 14:56:45 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 121D13018ED8;
 Mon, 19 Aug 2019 18:56:45 +0000 (UTC)
Received: from localhost (ovpn-204-64.brq.redhat.com [10.40.204.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C6A310013A1;
 Mon, 19 Aug 2019 18:56:44 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 19 Aug 2019 20:55:59 +0200
Message-Id: <20190819185602.4267-14-mreitz@redhat.com>
In-Reply-To: <20190819185602.4267-1-mreitz@redhat.com>
References: <20190819185602.4267-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 19 Aug 2019 18:56:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 13/16] qcow2: Repair snapshot table with too
 many entries
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

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2-snapshot.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index 366d9f574c..dac8a778e4 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -444,6 +444,14 @@ int coroutine_fn qcow2_check_read_snapshot_table(Blo=
ckDriverState *bs,
     s->snapshots_offset =3D be64_to_cpu(snapshot_table_pointer.snapshots=
_offset);
     s->nb_snapshots =3D be32_to_cpu(snapshot_table_pointer.nb_snapshots)=
;
=20
+    if (s->nb_snapshots > QCOW_MAX_SNAPSHOTS && (fix & BDRV_FIX_ERRORS))=
 {
+        fprintf(stderr, "Discarding %u overhanging snapshots\n",
+                s->nb_snapshots - QCOW_MAX_SNAPSHOTS);
+
+        nb_clusters_reduced +=3D s->nb_snapshots - QCOW_MAX_SNAPSHOTS;
+        s->nb_snapshots =3D QCOW_MAX_SNAPSHOTS;
+    }
+
     ret =3D qcow2_validate_table(bs, s->snapshots_offset, s->nb_snapshot=
s,
                                sizeof(QCowSnapshotHeader),
                                sizeof(QCowSnapshotHeader) * QCOW_MAX_SNA=
PSHOTS,
@@ -452,6 +460,12 @@ int coroutine_fn qcow2_check_read_snapshot_table(Blo=
ckDriverState *bs,
         result->check_errors++;
         error_reportf_err(local_err, "ERROR ");
=20
+        if (s->nb_snapshots > QCOW_MAX_SNAPSHOTS) {
+            fprintf(stderr, "You can force-remove all %u overhanging sna=
pshots "
+                    "with qemu-img check -r all\n",
+                    s->nb_snapshots - QCOW_MAX_SNAPSHOTS);
+        }
+
         /* We did not read the snapshot table, so invalidate this inform=
ation */
         s->snapshots_offset =3D 0;
         s->nb_snapshots =3D 0;
--=20
2.21.0


