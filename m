Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D89AE7229
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 13:55:47 +0100 (CET)
Received: from localhost ([::1]:53438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP4Yj-00008C-V0
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 08:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50942)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iP3xH-0003I9-SC
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:17:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iP3xB-00028T-Qb
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:17:00 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29570
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iP3xB-00025q-Jd
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:16:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572265013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S2ttQR79Z06v2c1QVZU1sPgiAUsv2sQpamGH9nr+sA4=;
 b=evb5n8qIPKMx1exji3Ag+u5LSIMikn6ZEDbPwtOtGkldkBF9GP6FvkPdLETyjdYzBks00X
 0QkmCJigVa12vr6pIfgXrJ5OxD8hxTiEnr6RxKD65hduB4RtcWRDRxxa3t8iuc5rmDSiTN
 yHFMAya71ugbT7CaEw9AW0Ov+q3w9Lw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-M675tbriNnOgl9qXxLQR-g-1; Mon, 28 Oct 2019 08:16:49 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0F94180496E;
 Mon, 28 Oct 2019 12:16:48 +0000 (UTC)
Received: from localhost (ovpn-117-83.ams2.redhat.com [10.36.117.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85ADC4D;
 Mon, 28 Oct 2019 12:16:48 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 51/69] qcow2: Write v3-compliant snapshot list on upgrade
Date: Mon, 28 Oct 2019 13:14:43 +0100
Message-Id: <20191028121501.15279-52-mreitz@redhat.com>
In-Reply-To: <20191028121501.15279-1-mreitz@redhat.com>
References: <20191028121501.15279-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: M675tbriNnOgl9qXxLQR-g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qcow2 v3 requires every snapshot table entry to have two extra data
fields: The 64-bit VM state size, and the virtual disk size.  Both are
optional for v2 images, so they may not be present.

qcow2_upgrade() therefore should update the snapshot table to ensure all
entries have these extra data fields.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1727347
Reported-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20191011152814.14791-8-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index af08757055..e3a4c44fb7 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4922,7 +4922,9 @@ static int qcow2_upgrade(BlockDriverState *bs, int ta=
rget_version,
                          Error **errp)
 {
     BDRVQcow2State *s =3D bs->opaque;
+    bool need_snapshot_update;
     int current_version =3D s->qcow_version;
+    int i;
     int ret;
=20
     /* This is qcow2_upgrade(), not qcow2_downgrade() */
@@ -4931,7 +4933,33 @@ static int qcow2_upgrade(BlockDriverState *bs, int t=
arget_version,
     /* There are no other versions (yet) that you can upgrade to */
     assert(target_version =3D=3D 3);
=20
-    status_cb(bs, 0, 1, cb_opaque);
+    status_cb(bs, 0, 2, cb_opaque);
+
+    /*
+     * In v2, snapshots do not need to have extra data.  v3 requires
+     * the 64-bit VM state size and the virtual disk size to be
+     * present.
+     * qcow2_write_snapshots() will always write the list in the
+     * v3-compliant format.
+     */
+    need_snapshot_update =3D false;
+    for (i =3D 0; i < s->nb_snapshots; i++) {
+        if (s->snapshots[i].extra_data_size <
+            sizeof_field(QCowSnapshotExtraData, vm_state_size_large) +
+            sizeof_field(QCowSnapshotExtraData, disk_size))
+        {
+            need_snapshot_update =3D true;
+            break;
+        }
+    }
+    if (need_snapshot_update) {
+        ret =3D qcow2_write_snapshots(bs);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "Failed to update the snapshot ta=
ble");
+            return ret;
+        }
+    }
+    status_cb(bs, 1, 2, cb_opaque);
=20
     s->qcow_version =3D target_version;
     ret =3D qcow2_update_header(bs);
@@ -4940,7 +4968,7 @@ static int qcow2_upgrade(BlockDriverState *bs, int ta=
rget_version,
         error_setg_errno(errp, -ret, "Failed to update the image header");
         return ret;
     }
-    status_cb(bs, 1, 1, cb_opaque);
+    status_cb(bs, 2, 2, cb_opaque);
=20
     return 0;
 }
--=20
2.21.0


