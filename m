Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA9263D52F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 13:05:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Lo9-00077y-JU; Wed, 30 Nov 2022 07:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkundrak@v3.sk>)
 id 1p0Lo5-00076z-RC; Wed, 30 Nov 2022 07:03:18 -0500
Received: from mail.v3.sk ([167.172.186.51] helo=shell.v3.sk)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkundrak@v3.sk>)
 id 1p0Lo0-0005Jh-Cp; Wed, 30 Nov 2022 07:03:14 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id BE8A6DCFDC;
 Wed, 30 Nov 2022 11:50:30 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id lwRdfU_COp87; Wed, 30 Nov 2022 11:50:29 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id CCE8ADD024;
 Wed, 30 Nov 2022 11:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id C8GA1nTjk-x8; Wed, 30 Nov 2022 11:50:29 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 7B23DDCFDC;
 Wed, 30 Nov 2022 11:50:29 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Lubomir Rintel <lkundrak@v3.sk>
Subject: [RESEND PATCH] ide: Add 8-bit data mode
Date: Wed, 30 Nov 2022 13:02:38 +0100
Message-Id: <20221130120238.706717-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=167.172.186.51; envelope-from=lkundrak@v3.sk;
 helo=shell.v3.sk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

CompactFlash uses features 0x01 and 0x81 to enable/disable 8-bit data
path. Implement them.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 hw/ide/core.c             | 43 ++++++++++++++++++++++++++++++---------
 include/hw/ide/internal.h |  1 +
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 39afdc0006..5d1039378f 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1648,6 +1648,13 @@ static bool cmd_set_features(IDEState *s, uint8_t =
cmd)
=20
     /* XXX: valid for CDROM ? */
     switch (s->feature) {
+    case 0x01: /* 8-bit I/O enable (CompactFlash) */
+    case 0x81: /* 8-bit I/O disable (CompactFlash) */
+        if (s->drive_kind !=3D IDE_CFATA) {
+            goto abort_cmd;
+        }
+        s->io8 =3D !(s->feature & 0x80);
+        return true;
     case 0x02: /* write cache enable */
         blk_set_enable_write_cache(s->blk, true);
         identify_data =3D (uint16_t *)s->identify_data;
@@ -2374,12 +2381,20 @@ void ide_data_writew(void *opaque, uint32_t addr,=
 uint32_t val)
     }
=20
     p =3D s->data_ptr;
-    if (p + 2 > s->data_end) {
-        return;
-    }
+    if (s->io8) {
+        if (p + 1 > s->data_end) {
+            return;
+        }
+
+        *p++ =3D val;
+    } else {
+        if (p + 2 > s->data_end) {
+            return;
+        }
=20
-    *(uint16_t *)p =3D le16_to_cpu(val);
-    p +=3D 2;
+        *(uint16_t *)p =3D le16_to_cpu(val);
+        p +=3D 2;
+    }
     s->data_ptr =3D p;
     if (p >=3D s->data_end) {
         s->status &=3D ~DRQ_STAT;
@@ -2401,12 +2416,20 @@ uint32_t ide_data_readw(void *opaque, uint32_t ad=
dr)
     }
=20
     p =3D s->data_ptr;
-    if (p + 2 > s->data_end) {
-        return 0;
-    }
+    if (s->io8) {
+        if (p + 1 > s->data_end) {
+            return 0;
+        }
=20
-    ret =3D cpu_to_le16(*(uint16_t *)p);
-    p +=3D 2;
+        ret =3D *p++;
+    } else {
+        if (p + 2 > s->data_end) {
+            return 0;
+        }
+
+        ret =3D cpu_to_le16(*(uint16_t *)p);
+        p +=3D 2;
+    }
     s->data_ptr =3D p;
     if (p >=3D s->data_end) {
         s->status &=3D ~DRQ_STAT;
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index b17f36df95..fc0aa81a88 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -402,6 +402,7 @@ struct IDEState {
     uint8_t select;
     uint8_t status;
=20
+    bool io8;
     bool reset_reverts;
=20
     /* set for lba48 access */
--=20
2.37.3


