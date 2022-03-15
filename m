Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F052E4D952D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 08:24:33 +0100 (CET)
Received: from localhost ([::1]:39656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU1Xl-0007eY-3Z
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 03:24:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Jianxian.Wen@verisilicon.com>)
 id 1nU1CU-0003Kr-6L
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 03:02:35 -0400
Received: from shasxm03.verisilicon.com ([101.89.135.44]:15347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Jianxian.Wen@verisilicon.com>)
 id 1nU1CR-0002wM-Ez
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 03:02:33 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1647327042; h=from:subject:to:date:message-id;
 bh=iDmgicFu/tzBLXA2VA9CL81oGF5WoIiKaJ4kKSiN13g=;
 b=SyoD7xDeqRRERV4wPCpELuMZ76fnb03NW+w0WgjPMj08CFG6Y0HYv/dC5e8LL4IZjwxilTOxg60
 fpaoq8679Gw2QM27w3C+K4vwxqehi5oPDLh/0Kp8JbN2PZyIqotS51Z1sDaoNOlkZ/UAL0/M8nRmH
 bg+BrmE6kAyWnRbr29I=
Received: from SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda]) by
 SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa%14]) with mapi id
 14.03.0408.000; Tue, 15 Mar 2022 14:50:37 +0800
From: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>
To: "kraxel@redhat.com" <kraxel@redhat.com>
Subject: [PATCH] ui: avoid unnecessary memory operations in
 vnc_refresh_server_surface()
Thread-Topic: [PATCH] ui: avoid unnecessary memory operations in
 vnc_refresh_server_surface()
Thread-Index: Adg4OPlZnb51yqzsQNCAQREvOkQzEw==
Date: Tue, 15 Mar 2022 06:50:37 +0000
Message-ID: <4C23C17B8E87E74E906A25A3254A03F4FA22100C@SHASXM06.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.166.98]
x-tm-as-product-ver: SMEX-11.0.0.4283-8.100.1062-25628.004
x-tm-as-result: No--1.990800-0.000000-31
x-tm-as-matchedid: 700225-703140-701090-703503-105250-700535-704938-703279-7
 00737-701910-700065-703115-702395-188019-704477-702328-703213-704959-705078
 -702876-701104-188199-63-148004-148133-42000-42003-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.44;
 envelope-from=Jianxian.Wen@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check the dirty bits in advance to avoid unnecessary memory operations.
In the case that guest surface has different format than the server,
but it does not have dirty bits which means no refresh is actually needed,
the memory operations is not necessary.

Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>
Signed-off-by: Lu Gao <lu.gao@verisilicon.com>
---
 ui/vnc.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 3ccd33dedc..310a873c21 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3098,6 +3098,9 @@ static int vnc_refresh_server_surface(VncDisplay *vd)
     VncState *vs;
     int has_dirty =3D 0;
     pixman_image_t *tmpbuf =3D NULL;
+    unsigned long offset;
+    int x;
+    uint8_t *guest_ptr, *server_ptr;
=20
     struct timeval tv =3D { 0, 0 };
=20
@@ -3106,6 +3109,13 @@ static int vnc_refresh_server_surface(VncDisplay *vd=
)
         has_dirty =3D vnc_update_stats(vd, &tv);
     }
=20
+    offset =3D find_next_bit((unsigned long *) &vd->guest.dirty,
+                           height * VNC_DIRTY_BPL(&vd->guest), 0);
+    if (offset =3D=3D height * VNC_DIRTY_BPL(&vd->guest)) {
+        /* no dirty bits in guest surface */
+        return has_dirty;
+    }
+
     /*
      * Walk through the guest dirty map.
      * Check and copy modified bits from guest to server surface.
@@ -3130,15 +3140,6 @@ static int vnc_refresh_server_surface(VncDisplay *vd=
)
     line_bytes =3D MIN(server_stride, guest_ll);
=20
     for (;;) {
-        int x;
-        uint8_t *guest_ptr, *server_ptr;
-        unsigned long offset =3D find_next_bit((unsigned long *) &vd->gues=
t.dirty,
-                                             height * VNC_DIRTY_BPL(&vd->g=
uest),
-                                             y * VNC_DIRTY_BPL(&vd->guest)=
);
-        if (offset =3D=3D height * VNC_DIRTY_BPL(&vd->guest)) {
-            /* no more dirty bits */
-            break;
-        }
         y =3D offset / VNC_DIRTY_BPL(&vd->guest);
         x =3D offset % VNC_DIRTY_BPL(&vd->guest);
=20
@@ -3177,6 +3178,13 @@ static int vnc_refresh_server_surface(VncDisplay *vd=
)
         }
=20
         y++;
+        offset =3D find_next_bit((unsigned long *) &vd->guest.dirty,
+                               height * VNC_DIRTY_BPL(&vd->guest),
+                               y * VNC_DIRTY_BPL(&vd->guest));
+        if (offset =3D=3D height * VNC_DIRTY_BPL(&vd->guest)) {
+            /* no more dirty bits */
+            break;
+        }
     }
     qemu_pixman_image_unref(tmpbuf);
     return has_dirty;
--=20
2.33.0

