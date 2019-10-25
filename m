Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A1DE51AE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 18:55:41 +0200 (CEST)
Received: from localhost ([::1]:34658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iO2sF-0002ry-Oi
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 12:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40602)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iO2id-0004zd-NZ
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 12:45:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iO2iX-0002G2-Ek
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 12:45:43 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:34457 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iO2iX-0002EH-1h
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 12:45:37 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 0819E1A22A5;
 Fri, 25 Oct 2019 18:44:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id C2E981A2290;
 Fri, 25 Oct 2019 18:44:29 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/20] target/mips: Demacro LMI decoder
Date: Fri, 25 Oct 2019 18:44:15 +0200
Message-Id: <1572021862-28273-14-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572021862-28273-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1572021862-28273-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This makes searches for instances of opcode usages easier.

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1571826227-10583-15-git-send-email-aleksandar.markovic@rt-rk.com>
---
 target/mips/translate.c | 248 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 174 insertions(+), 74 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 20c69d2..4bff585 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -5546,78 +5546,181 @@ static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
     gen_load_fpr64(ctx, t0, rs);
     gen_load_fpr64(ctx, t1, rt);
 
-#define LMI_HELPER(UP, LO) \
-    case OPC_##UP: gen_helper_##LO(t0, t0, t1); break
-#define LMI_HELPER_1(UP, LO) \
-    case OPC_##UP: gen_helper_##LO(t0, t0); break
-#define LMI_DIRECT(UP, LO, OP) \
-    case OPC_##UP: tcg_gen_##OP##_i64(t0, t0, t1); break
-
     switch (opc) {
-    LMI_HELPER(PADDSH, paddsh);
-    LMI_HELPER(PADDUSH, paddush);
-    LMI_HELPER(PADDH, paddh);
-    LMI_HELPER(PADDW, paddw);
-    LMI_HELPER(PADDSB, paddsb);
-    LMI_HELPER(PADDUSB, paddusb);
-    LMI_HELPER(PADDB, paddb);
-
-    LMI_HELPER(PSUBSH, psubsh);
-    LMI_HELPER(PSUBUSH, psubush);
-    LMI_HELPER(PSUBH, psubh);
-    LMI_HELPER(PSUBW, psubw);
-    LMI_HELPER(PSUBSB, psubsb);
-    LMI_HELPER(PSUBUSB, psubusb);
-    LMI_HELPER(PSUBB, psubb);
-
-    LMI_HELPER(PSHUFH, pshufh);
-    LMI_HELPER(PACKSSWH, packsswh);
-    LMI_HELPER(PACKSSHB, packsshb);
-    LMI_HELPER(PACKUSHB, packushb);
-
-    LMI_HELPER(PUNPCKLHW, punpcklhw);
-    LMI_HELPER(PUNPCKHHW, punpckhhw);
-    LMI_HELPER(PUNPCKLBH, punpcklbh);
-    LMI_HELPER(PUNPCKHBH, punpckhbh);
-    LMI_HELPER(PUNPCKLWD, punpcklwd);
-    LMI_HELPER(PUNPCKHWD, punpckhwd);
-
-    LMI_HELPER(PAVGH, pavgh);
-    LMI_HELPER(PAVGB, pavgb);
-    LMI_HELPER(PMAXSH, pmaxsh);
-    LMI_HELPER(PMINSH, pminsh);
-    LMI_HELPER(PMAXUB, pmaxub);
-    LMI_HELPER(PMINUB, pminub);
-
-    LMI_HELPER(PCMPEQW, pcmpeqw);
-    LMI_HELPER(PCMPGTW, pcmpgtw);
-    LMI_HELPER(PCMPEQH, pcmpeqh);
-    LMI_HELPER(PCMPGTH, pcmpgth);
-    LMI_HELPER(PCMPEQB, pcmpeqb);
-    LMI_HELPER(PCMPGTB, pcmpgtb);
-
-    LMI_HELPER(PSLLW, psllw);
-    LMI_HELPER(PSLLH, psllh);
-    LMI_HELPER(PSRLW, psrlw);
-    LMI_HELPER(PSRLH, psrlh);
-    LMI_HELPER(PSRAW, psraw);
-    LMI_HELPER(PSRAH, psrah);
-
-    LMI_HELPER(PMULLH, pmullh);
-    LMI_HELPER(PMULHH, pmulhh);
-    LMI_HELPER(PMULHUH, pmulhuh);
-    LMI_HELPER(PMADDHW, pmaddhw);
-
-    LMI_HELPER(PASUBUB, pasubub);
-    LMI_HELPER_1(BIADD, biadd);
-    LMI_HELPER_1(PMOVMSKB, pmovmskb);
-
-    LMI_DIRECT(PADDD, paddd, add);
-    LMI_DIRECT(PSUBD, psubd, sub);
-    LMI_DIRECT(XOR_CP2, xor, xor);
-    LMI_DIRECT(NOR_CP2, nor, nor);
-    LMI_DIRECT(AND_CP2, and, and);
-    LMI_DIRECT(OR_CP2, or, or);
+    case OPC_PADDSH:
+        gen_helper_paddsh(t0, t0, t1);
+        break;
+    case OPC_PADDUSH:
+        gen_helper_paddush(t0, t0, t1);
+        break;
+    case OPC_PADDH:
+        gen_helper_paddh(t0, t0, t1);
+        break;
+    case OPC_PADDW:
+        gen_helper_paddw(t0, t0, t1);
+        break;
+    case OPC_PADDSB:
+        gen_helper_paddsb(t0, t0, t1);
+        break;
+    case OPC_PADDUSB:
+        gen_helper_paddusb(t0, t0, t1);
+        break;
+    case OPC_PADDB:
+        gen_helper_paddb(t0, t0, t1);
+        break;
+
+    case OPC_PSUBSH:
+        gen_helper_psubsh(t0, t0, t1);
+        break;
+    case OPC_PSUBUSH:
+        gen_helper_psubush(t0, t0, t1);
+        break;
+    case OPC_PSUBH:
+        gen_helper_psubh(t0, t0, t1);
+        break;
+    case OPC_PSUBW:
+        gen_helper_psubw(t0, t0, t1);
+        break;
+    case OPC_PSUBSB:
+        gen_helper_psubsb(t0, t0, t1);
+        break;
+    case OPC_PSUBUSB:
+        gen_helper_psubusb(t0, t0, t1);
+        break;
+    case OPC_PSUBB:
+        gen_helper_psubb(t0, t0, t1);
+        break;
+
+    case OPC_PSHUFH:
+        gen_helper_pshufh(t0, t0, t1);
+        break;
+    case OPC_PACKSSWH:
+        gen_helper_packsswh(t0, t0, t1);
+        break;
+    case OPC_PACKSSHB:
+        gen_helper_packsshb(t0, t0, t1);
+        break;
+    case OPC_PACKUSHB:
+        gen_helper_packushb(t0, t0, t1);
+        break;
+
+    case OPC_PUNPCKLHW:
+        gen_helper_punpcklhw(t0, t0, t1);
+        break;
+    case OPC_PUNPCKHHW:
+        gen_helper_punpckhhw(t0, t0, t1);
+        break;
+    case OPC_PUNPCKLBH:
+        gen_helper_punpcklbh(t0, t0, t1);
+        break;
+    case OPC_PUNPCKHBH:
+        gen_helper_punpckhbh(t0, t0, t1);
+        break;
+    case OPC_PUNPCKLWD:
+        gen_helper_punpcklwd(t0, t0, t1);
+        break;
+    case OPC_PUNPCKHWD:
+        gen_helper_punpckhwd(t0, t0, t1);
+        break;
+
+    case OPC_PAVGH:
+        gen_helper_pavgh(t0, t0, t1);
+        break;
+    case OPC_PAVGB:
+        gen_helper_pavgb(t0, t0, t1);
+        break;
+    case OPC_PMAXSH:
+        gen_helper_pmaxsh(t0, t0, t1);
+        break;
+    case OPC_PMINSH:
+        gen_helper_pminsh(t0, t0, t1);
+        break;
+    case OPC_PMAXUB:
+        gen_helper_pmaxub(t0, t0, t1);
+        break;
+    case OPC_PMINUB:
+        gen_helper_pminub(t0, t0, t1);
+        break;
+
+    case OPC_PCMPEQW:
+        gen_helper_pcmpeqw(t0, t0, t1);
+        break;
+    case OPC_PCMPGTW:
+        gen_helper_pcmpgtw(t0, t0, t1);
+        break;
+    case OPC_PCMPEQH:
+        gen_helper_pcmpeqh(t0, t0, t1);
+        break;
+    case OPC_PCMPGTH:
+        gen_helper_pcmpgth(t0, t0, t1);
+        break;
+    case OPC_PCMPEQB:
+        gen_helper_pcmpeqb(t0, t0, t1);
+        break;
+    case OPC_PCMPGTB:
+        gen_helper_pcmpgtb(t0, t0, t1);
+        break;
+
+    case OPC_PSLLW:
+        gen_helper_psllw(t0, t0, t1);
+        break;
+    case OPC_PSLLH:
+        gen_helper_psllh(t0, t0, t1);
+        break;
+    case OPC_PSRLW:
+        gen_helper_psrlw(t0, t0, t1);
+        break;
+    case OPC_PSRLH:
+        gen_helper_psrlh(t0, t0, t1);
+        break;
+    case OPC_PSRAW:
+        gen_helper_psraw(t0, t0, t1);
+        break;
+    case OPC_PSRAH:
+        gen_helper_psrah(t0, t0, t1);
+        break;
+
+    case OPC_PMULLH:
+        gen_helper_pmullh(t0, t0, t1);
+        break;
+    case OPC_PMULHH:
+        gen_helper_pmulhh(t0, t0, t1);
+        break;
+    case OPC_PMULHUH:
+        gen_helper_pmulhuh(t0, t0, t1);
+        break;
+    case OPC_PMADDHW:
+        gen_helper_pmaddhw(t0, t0, t1);
+        break;
+
+    case OPC_PASUBUB:
+        gen_helper_pasubub(t0, t0, t1);
+        break;
+    case OPC_BIADD:
+        gen_helper_biadd(t0, t0);
+        break;
+    case OPC_PMOVMSKB:
+        gen_helper_pmovmskb(t0, t0);
+        break;
+
+    case OPC_PADDD:
+        tcg_gen_add_i64(t0, t0, t1);
+        break;
+    case OPC_PSUBD:
+        tcg_gen_sub_i64(t0, t0, t1);
+        break;
+    case OPC_XOR_CP2:
+        tcg_gen_xor_i64(t0, t0, t1);
+        break;
+    case OPC_NOR_CP2:
+        tcg_gen_nor_i64(t0, t0, t1);
+        break;
+    case OPC_AND_CP2:
+        tcg_gen_and_i64(t0, t0, t1);
+        break;
+    case OPC_OR_CP2:
+        tcg_gen_or_i64(t0, t0, t1);
+        break;
 
     case OPC_PANDN:
         tcg_gen_andc_i64(t0, t1, t0);
@@ -5770,9 +5873,6 @@ static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
         return;
     }
 
-#undef LMI_HELPER
-#undef LMI_DIRECT
-
     gen_store_fpr64(ctx, t0, rd);
 
     tcg_temp_free_i64(t0);
-- 
2.7.4


