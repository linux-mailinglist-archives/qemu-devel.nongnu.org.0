Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C12CFB08BD
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 08:21:12 +0200 (CEST)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8ITf-0007Pi-Jh
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 02:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36898)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1i8IGA-0002Lp-8F
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 02:07:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1i8IG8-00087x-3M
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 02:07:14 -0400
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:45472)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1i8IG7-00085v-NQ
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 02:07:11 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail02.asahi-net.or.jp (Postfix) with ESMTPA id B3E3B6AB53;
 Thu, 12 Sep 2019 15:07:07 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (ae227063.dynamic.ppp.asahi-net.or.jp [14.3.227.63])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 51126240088;
 Thu, 12 Sep 2019 15:07:07 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Date: Thu, 12 Sep 2019 15:06:42 +0900
Message-Id: <20190912060701.4642-4-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190912060701.4642-1-ysato@users.sourceforge.jp>
References: <20190912060701.4642-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.14
Subject: [Qemu-devel] [PATCH v24 03/22] hw/registerfields.h: Add 8bit and
 16bit register macros
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
Cc: peter.maydell@linaro.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 richard.henderson@linaro.org, Alistair Francis <alistair.francis@wdc.com>,
 imammedo@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Some RX peripheral using 8bit and 16bit registers.
Added 8bit and 16bit APIs.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190607091116.49044-11-ysato@users.sourceforge.jp>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/registerfields.h | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index 2659a58737..a0bb0654d6 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -22,6 +22,14 @@
     enum { A_ ## reg =3D (addr) };                                      =
    \
     enum { R_ ## reg =3D (addr) / 4 };
=20
+#define REG8(reg, addr)                                                 =
 \
+    enum { A_ ## reg =3D (addr) };                                      =
    \
+    enum { R_ ## reg =3D (addr) };
+
+#define REG16(reg, addr)                                                =
  \
+    enum { A_ ## reg =3D (addr) };                                      =
    \
+    enum { R_ ## reg =3D (addr) / 2 };
+
 /* Define SHIFT, LENGTH and MASK constants for a field within a register=
 */
=20
 /* This macro will define R_FOO_BAR_MASK, R_FOO_BAR_SHIFT and R_FOO_BAR_=
LENGTH
@@ -34,6 +42,12 @@
                                         MAKE_64BIT_MASK(shift, length)};
=20
 /* Extract a field from a register */
+#define FIELD_EX8(storage, reg, field)                                  =
  \
+    extract8((storage), R_ ## reg ## _ ## field ## _SHIFT,              =
  \
+              R_ ## reg ## _ ## field ## _LENGTH)
+#define FIELD_EX16(storage, reg, field)                                 =
  \
+    extract16((storage), R_ ## reg ## _ ## field ## _SHIFT,             =
  \
+              R_ ## reg ## _ ## field ## _LENGTH)
 #define FIELD_EX32(storage, reg, field)                                 =
  \
     extract32((storage), R_ ## reg ## _ ## field ## _SHIFT,             =
  \
               R_ ## reg ## _ ## field ## _LENGTH)
@@ -49,6 +63,22 @@
  * Assigning values larger then the target field will result in
  * compilation warnings.
  */
+#define FIELD_DP8(storage, reg, field, val) ({                          =
  \
+    struct {                                                            =
  \
+        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;              =
  \
+    } v =3D { .v =3D val };                                             =
      \
+    uint8_t d;                                                          =
  \
+    d =3D deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,       =
    \
+                  R_ ## reg ## _ ## field ## _LENGTH, v.v);             =
  \
+    d; })
+#define FIELD_DP16(storage, reg, field, val) ({                         =
  \
+    struct {                                                            =
  \
+        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;              =
  \
+    } v =3D { .v =3D val };                                             =
      \
+    uint16_t d;                                                         =
  \
+    d =3D deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,       =
    \
+                  R_ ## reg ## _ ## field ## _LENGTH, v.v);             =
  \
+    d; })
 #define FIELD_DP32(storage, reg, field, val) ({                         =
  \
     struct {                                                            =
  \
         unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;              =
  \
@@ -57,7 +87,7 @@
     d =3D deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,       =
    \
                   R_ ## reg ## _ ## field ## _LENGTH, v.v);             =
  \
     d; })
-#define FIELD_DP64(storage, reg, field, val) ({                         =
  \
+#define FIELD_DP64(storage, reg, field, val) ({                         =
\
     struct {                                                            =
  \
         unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;              =
  \
     } v =3D { .v =3D val };                                             =
      \
--=20
2.20.1


