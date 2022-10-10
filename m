Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D511B5FA19C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 18:13:46 +0200 (CEST)
Received: from localhost ([::1]:37620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohvPU-0000v5-Ge
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 12:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkundrak@v3.sk>)
 id 1ohuMX-0007IV-7H; Mon, 10 Oct 2022 11:06:42 -0400
Received: from mail.v3.sk ([167.172.186.51]:49626 helo=shell.v3.sk)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkundrak@v3.sk>)
 id 1ohuMU-00038U-Ox; Mon, 10 Oct 2022 11:06:36 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 90B79DF606;
 Mon, 10 Oct 2022 14:53:07 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id BjV_r2k1WQn6; Mon, 10 Oct 2022 14:53:07 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 0F7A3E3124;
 Mon, 10 Oct 2022 14:53:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id j7brzk5aR8jo; Mon, 10 Oct 2022 14:53:06 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 9056DDF606;
 Mon, 10 Oct 2022 14:53:06 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] ide: Add 8-bit data mode
Date: Mon, 10 Oct 2022 17:05:54 +0200
Message-Id: <20221010150554.739601-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.37.3
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
X-Mailman-Approved-At: Mon, 10 Oct 2022 12:05:50 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


