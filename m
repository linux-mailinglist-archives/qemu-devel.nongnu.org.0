Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEF64753E
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jun 2019 16:40:18 +0200 (CEST)
Received: from localhost ([::1]:40376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcWKP-0004cX-Kd
	for lists+qemu-devel@lfdr.de; Sun, 16 Jun 2019 10:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36353)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hcW9X-0005KG-Qp
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 10:29:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hcW9W-0002Mn-Lq
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 10:29:03 -0400
Received: from mail01.asahi-net.or.jp ([202.224.55.13]:54570)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hcW9W-00028b-CY
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 10:29:02 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail01.asahi-net.or.jp (Postfix) with ESMTPA id 05423125F47;
 Sun, 16 Jun 2019 23:28:49 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id AA596240085;
 Sun, 16 Jun 2019 23:28:48 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Date: Sun, 16 Jun 2019 23:28:24 +0900
Message-Id: <20190616142836.10614-13-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190616142836.10614-1-ysato@users.sourceforge.jp>
References: <20190616142836.10614-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.13
Subject: [Qemu-devel] [PATCH v20 12/24] target/rx: Dump bytes for each insn
 during disassembly
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

There are so many different forms of each RX instruction
that it will be very useful to be able to look at the bytes
to see on which path a bug may lie.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20190607091116.49044-24-ysato@users.sourceforge.jp>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/disas.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/target/rx/disas.c b/target/rx/disas.c
index 5a32a87534..d73b53db44 100644
--- a/target/rx/disas.c
+++ b/target/rx/disas.c
@@ -102,7 +102,21 @@ static int bdsp_s(DisasContext *ctx, int d)
 /* Include the auto-generated decoder.  */
 #include "decode.inc.c"
=20
-#define prt(...) (ctx->dis->fprintf_func)((ctx->dis->stream), __VA_ARGS_=
_)
+static void dump_bytes(DisasContext *ctx)
+{
+    int i, len =3D ctx->len;
+
+    for (i =3D 0; i < len; ++i) {
+        ctx->dis->fprintf_func(ctx->dis->stream, "%02x ", ctx->bytes[i])=
;
+    }
+    ctx->dis->fprintf_func(ctx->dis->stream, "%*c", (8 - i) * 3, '\t');
+}
+
+#define prt(...) \
+    do {                                                        \
+        dump_bytes(ctx);                                        \
+        ctx->dis->fprintf_func(ctx->dis->stream, __VA_ARGS__);  \
+    } while (0)
=20
 #define RX_MEMORY_BYTE 0
 #define RX_MEMORY_WORD 1
--=20
2.11.0


