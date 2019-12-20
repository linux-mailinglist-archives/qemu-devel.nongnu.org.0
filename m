Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0F612749E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 05:30:43 +0100 (CET)
Received: from localhost ([::1]:50600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii9w1-0003f1-Qm
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 23:30:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59800)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1ii9o0-0000bk-QS
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 23:22:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1ii9nz-0003OZ-Cu
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 23:22:24 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:34406)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1ii9nz-0001xA-61; Thu, 19 Dec 2019 23:22:23 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id E82152290B; Thu, 19 Dec 2019 23:22:01 -0500 (EST)
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Message-Id: <e764963f2ea1b070e05d99f37de58ef193e5af7b.1576815466.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1576815466.git.fthain@telegraphics.com.au>
References: <cover.1576815466.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v2 01/13] dp8393x: Mask EOL bit from descriptor addresses
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Dec 2019 15:17:46 +1100
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 98.124.60.144
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The LSB of descriptor address registers is used as an EOL flag.
It has to be masked when those registers are to be used as actual
addresses for copying memory around. But when the registers are
to be updated the EOL bit should not be masked.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
Changed since v1:
 - Added macros to name constants as requested by Philippe Mathieu-Daud=C3=
=A9.
---
 hw/net/dp8393x.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 3d991af163..1957bd391e 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -145,6 +145,9 @@ do { printf("sonic ERROR: %s: " fmt, __func__ , ## __=
VA_ARGS__); } while (0)
 #define SONIC_ISR_PINT   0x0800
 #define SONIC_ISR_LCD    0x1000
=20
+#define SONIC_DESC_EOL   0x0001
+#define SONIC_DESC_ADDR  0xFFFE
+
 #define TYPE_DP8393X "dp8393x"
 #define DP8393X(obj) OBJECT_CHECK(dp8393xState, (obj), TYPE_DP8393X)
=20
@@ -197,7 +200,8 @@ static uint32_t dp8393x_crba(dp8393xState *s)
=20
 static uint32_t dp8393x_crda(dp8393xState *s)
 {
-    return (s->regs[SONIC_URDA] << 16) | s->regs[SONIC_CRDA];
+    return (s->regs[SONIC_URDA] << 16) |
+           (s->regs[SONIC_CRDA] & SONIC_DESC_ADDR);
 }
=20
 static uint32_t dp8393x_rbwc(dp8393xState *s)
@@ -217,7 +221,8 @@ static uint32_t dp8393x_tsa(dp8393xState *s)
=20
 static uint32_t dp8393x_ttda(dp8393xState *s)
 {
-    return (s->regs[SONIC_UTDA] << 16) | s->regs[SONIC_TTDA];
+    return (s->regs[SONIC_UTDA] << 16) |
+           (s->regs[SONIC_TTDA] & SONIC_DESC_ADDR);
 }
=20
 static uint32_t dp8393x_wt(dp8393xState *s)
@@ -506,8 +511,8 @@ static void dp8393x_do_transmit_packets(dp8393xState =
*s)
                              sizeof(uint16_t) *
                              (4 + 3 * s->regs[SONIC_TFC]) * width,
                 MEMTXATTRS_UNSPECIFIED, (uint8_t *)s->data, size, 0);
-            s->regs[SONIC_CTDA] =3D dp8393x_get(s, width, 0) & ~0x1;
-            if (dp8393x_get(s, width, 0) & 0x1) {
+            s->regs[SONIC_CTDA] =3D dp8393x_get(s, width, 0);
+            if (s->regs[SONIC_CTDA] & SONIC_DESC_EOL) {
                 /* EOL detected */
                 break;
             }
@@ -763,13 +768,13 @@ static ssize_t dp8393x_receive(NetClientState *nc, =
const uint8_t * buf,
     /* XXX: Check byte ordering */
=20
     /* Check for EOL */
-    if (s->regs[SONIC_LLFA] & 0x1) {
+    if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
         /* Are we still in resource exhaustion? */
         size =3D sizeof(uint16_t) * 1 * width;
         address =3D dp8393x_crda(s) + sizeof(uint16_t) * 5 * width;
         address_space_rw(&s->as, address, MEMTXATTRS_UNSPECIFIED,
                          (uint8_t *)s->data, size, 0);
-        if (dp8393x_get(s, width, 0) & 0x1) {
+        if (dp8393x_get(s, width, 0) & SONIC_DESC_EOL) {
             /* Still EOL ; stop reception */
             return -1;
         } else {
@@ -827,7 +832,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, co=
nst uint8_t * buf,
     address_space_rw(&s->as, dp8393x_crda(s) + sizeof(uint16_t) * 5 * wi=
dth,
         MEMTXATTRS_UNSPECIFIED, (uint8_t *)s->data, size, 0);
     s->regs[SONIC_LLFA] =3D dp8393x_get(s, width, 0);
-    if (s->regs[SONIC_LLFA] & 0x1) {
+    if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
         /* EOL detected */
         s->regs[SONIC_ISR] |=3D SONIC_ISR_RDE;
     } else {
--=20
2.23.0


