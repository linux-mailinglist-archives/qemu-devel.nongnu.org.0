Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C2C90DDC
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Aug 2019 09:38:41 +0200 (CEST)
Received: from localhost ([::1]:34632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hytIO-00006N-5E
	for lists+qemu-devel@lfdr.de; Sat, 17 Aug 2019 03:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40988)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hytGT-0006pa-1X
 for qemu-devel@nongnu.org; Sat, 17 Aug 2019 03:36:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hytGR-0006XO-N8
 for qemu-devel@nongnu.org; Sat, 17 Aug 2019 03:36:40 -0400
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:38511)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hytGR-0006WD-DX
 for qemu-devel@nongnu.org; Sat, 17 Aug 2019 03:36:39 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail02.asahi-net.or.jp (Postfix) with ESMTPA id C08EA58E7B;
 Sat, 17 Aug 2019 16:36:37 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 7B5B4240086;
 Sat, 17 Aug 2019 16:36:37 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Date: Sat, 17 Aug 2019 16:36:16 +0900
Message-Id: <20190817073628.94473-11-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190817073628.94473-1-ysato@users.sourceforge.jp>
References: <20190817073628.94473-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.14
Subject: [Qemu-devel] [PATCH v23 10/22] target/rx: Use prt_ldmi for XCHG_mr
 disassembly
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
Cc: peter.maydell@linaro.org, imammedo@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Note that the ld =3D=3D 3 case handled by prt_ldmi is decoded as
XCHG_rr and cannot appear here.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20190607091116.49044-21-ysato@users.sourceforge.jp>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/disas.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/rx/disas.c b/target/rx/disas.c
index 515b365528..db10385fd0 100644
--- a/target/rx/disas.c
+++ b/target/rx/disas.c
@@ -366,13 +366,7 @@ static bool trans_XCHG_rr(DisasContext *ctx, arg_XCH=
G_rr *a)
 /* xchg dsp[rs].<mi>,rd */
 static bool trans_XCHG_mr(DisasContext *ctx, arg_XCHG_mr *a)
 {
-    static const char msize[][4] =3D {
-        "b", "w", "l", "ub", "uw",
-    };
-    char dsp[8];
-
-    rx_index_addr(ctx, dsp, a->ld, a->mi);
-    prt("xchg\t%s[r%d].%s, r%d", dsp, a->rs, msize[a->mi], a->rd);
+    prt_ldmi(ctx, "xchg", a->ld, a->mi, a->rs, a->rd);
     return true;
 }
=20
--=20
2.11.0


