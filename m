Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4676E728C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 14:23:01 +0100 (CET)
Received: from localhost ([::1]:53702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP4z6-0007OK-Cm
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 09:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51108)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iP3xS-0003fo-Vv
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:17:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iP3xQ-0002JG-Nr
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:17:14 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33962
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iP3xQ-0002GT-CO
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:17:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572265028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ks7fqz6OarAeHOWFTI0dVvnz7s3pMBNrIuytG56UVo=;
 b=ElGAE28iwHNJqTONTWXJsVr3s2nisG184tWZsoKioJSFlptNBHZwc2xdSUunbEHO5/r7K3
 W5VXhQe/nooxJZhFr9RnWPxX+y0CxGXclJBeLHQEOfO2H+zwruMrjQufdlship1SDYHWK7
 s90tvG4Kcv/vTLdAeB1jKf7/QyNpoG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-Oaz8i3rFPX2tjNANa0ZOjA-1; Mon, 28 Oct 2019 08:17:04 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 823B0800FF1;
 Mon, 28 Oct 2019 12:17:03 +0000 (UTC)
Received: from localhost (ovpn-117-83.ams2.redhat.com [10.36.117.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26D1926186;
 Mon, 28 Oct 2019 12:17:02 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 58/69] qcow2: Fix v3 snapshot table entry compliancy
Date: Mon, 28 Oct 2019 13:14:50 +0100
Message-Id: <20191028121501.15279-59-mreitz@redhat.com>
In-Reply-To: <20191028121501.15279-1-mreitz@redhat.com>
References: <20191028121501.15279-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Oaz8i3rFPX2tjNANa0ZOjA-1
X-Mimecast-Spam-Score: 0
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qcow2 v3 images require every snapshot table entry to have at least 16
bytes of extra data.  If they do not, let qemu-img check -r all fix it.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20191011152814.14791-15-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2-snapshot.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index dac8a778e4..5ab64da1ec 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -516,6 +516,24 @@ int coroutine_fn qcow2_check_read_snapshot_table(Block=
DriverState *bs,
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
+                sizeof_field(QCowSnapshotExtraData, vm_state_size_large) +
+                sizeof_field(QCowSnapshotExtraData, disk_size))
+            {
+                result->corruptions++;
+                fprintf(stderr, "%s snapshot table entry %i is incomplete\=
n",
+                        fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
+            }
+        }
+    }
+
     return 0;
 }
=20
--=20
2.21.0


