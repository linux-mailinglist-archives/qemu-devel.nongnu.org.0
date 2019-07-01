Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB37A37182
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 12:22:22 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57836 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYpXJ-0006VO-VV
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 06:22:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan.brankovic@rt-rk.com>) id 1hYpRx-0002aM-7I
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 06:16:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan.brankovic@rt-rk.com>) id 1hYpRw-0001yz-6v
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 06:16:49 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:41534 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefan.brankovic@rt-rk.com>)
	id 1hYpRv-0001tf-V5
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 06:16:48 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id BA0D31A1DCB;
	Thu,  6 Jun 2019 12:15:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw870-lin.domain.local (rtrkw870-lin.domain.local
	[10.10.13.132])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 8D0791A2006;
	Thu,  6 Jun 2019 12:15:36 +0200 (CEST)
From: Stefan Brankovic <stefan.brankovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 12:15:27 +0200
Message-Id: <1559816130-17113-6-git-send-email-stefan.brankovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559816130-17113-1-git-send-email-stefan.brankovic@rt-rk.com>
References: <1559816130-17113-1-git-send-email-stefan.brankovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 5/8] target/ppc: Optimize emulation of vclzd
 instruction
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimize Altivec instruction vclzd (Vector Count Leading Zeros Doubleword).
This instruction counts the number of leading zeros of each doubleword element
in source register and places result in the appropriate doubleword element of
destination register.

Using tcg-s count leading zeros instruction two times(once for each
doubleword element of source register vB) and placing result in
appropriate doubleword element of destination register vD.

Signed-off-by: Stefan Brankovic <stefan.brankovic@rt-rk.com>
---
 target/ppc/translate/vmx-impl.inc.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/target/ppc/translate/vmx-impl.inc.c b/target/ppc/translate/vmx-impl.inc.c
index 010f337..1c34908 100644
--- a/target/ppc/translate/vmx-impl.inc.c
+++ b/target/ppc/translate/vmx-impl.inc.c
@@ -877,6 +877,32 @@ static void trans_vgbbd(DisasContext *ctx)
     tcg_temp_free_i64(result2);
 }
 
+/*
+ * vclzd VRT,VRB - Vector Count Leading Zeros Doubleword
+ *
+ * Counting the number of leading zero bits of each doubleword element in source
+ * register and placing result in appropriate doubleword element of destination
+ * register.
+ */
+static void trans_vclzd(DisasContext *ctx)
+{
+    int VT = rD(ctx->opcode);
+    int VB = rB(ctx->opcode);
+    TCGv_i64 avr = tcg_temp_new_i64();
+
+    /* high doubleword */
+    get_avr64(avr, VB, true);
+    tcg_gen_clzi_i64(avr, avr, 64);
+    set_avr64(VT, avr, true);
+
+    /* low doubleword */
+    get_avr64(avr, VB, false);
+    tcg_gen_clzi_i64(avr, avr, 64);
+    set_avr64(VT, avr, false);
+
+    tcg_temp_free_i64(avr);
+}
+
 GEN_VXFORM(vmuloub, 4, 0);
 GEN_VXFORM(vmulouh, 4, 1);
 GEN_VXFORM(vmulouw, 4, 2);
@@ -1388,7 +1414,7 @@ GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23)
 GEN_VXFORM_NOA(vclzb, 1, 28)
 GEN_VXFORM_NOA(vclzh, 1, 29)
 GEN_VXFORM_NOA(vclzw, 1, 30)
-GEN_VXFORM_NOA(vclzd, 1, 31)
+GEN_VXFORM_TRANS(vclzd, 1, 31)
 GEN_VXFORM_NOA_2(vnegw, 1, 24, 6)
 GEN_VXFORM_NOA_2(vnegd, 1, 24, 7)
 GEN_VXFORM_NOA_2(vextsb2w, 1, 24, 16)
-- 
2.7.4


