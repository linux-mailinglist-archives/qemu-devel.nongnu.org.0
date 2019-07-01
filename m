Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D154E6D4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 13:11:06 +0200 (CEST)
Received: from localhost ([::1]:59392 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heHRg-0002qn-Ai
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 07:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43549)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1heHPI-0000z2-Rq
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:08:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1heHPF-0008Ec-O8
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:08:36 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:48134 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefan.brankovic@rt-rk.com>)
 id 1heHPF-0008DW-D0
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:08:33 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 7EFD91A44F1;
 Fri, 21 Jun 2019 13:07:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw870-lin.domain.local (rtrkw870-lin.domain.local
 [10.10.13.132])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 583511A22A0;
 Fri, 21 Jun 2019 13:07:25 +0200 (CEST)
From: Stefan Brankovic <stefan.brankovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 13:07:10 +0200
Message-Id: <1561115232-17155-7-git-send-email-stefan.brankovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561115232-17155-1-git-send-email-stefan.brankovic@rt-rk.com>
References: <1561115232-17155-1-git-send-email-stefan.brankovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v3 6/8] target/ppc: Optimize emulation of vclzw
 instruction
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
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimize Altivec instruction vclzw (Vector Count Leading Zeros Word).
This instruction counts the number of leading zeros of each word element
in source register and places result in the appropriate word element of
destination register.

Counting is to be performed in four iterations of for loop(one for each
word elemnt of source register vB). Every iteration consists of loading
appropriate word element from source register, counting leading zeros
with tcg_gen_clzi_i32, and saving the result in appropriate word element
of destination register.

Signed-off-by: Stefan Brankovic <stefan.brankovic@rt-rk.com>
---
 target/ppc/helper.h                 |  1 -
 target/ppc/int_helper.c             |  3 ---
 target/ppc/translate/vmx-impl.inc.c | 28 +++++++++++++++++++++++++++-
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 3b92e3b..595241c 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -305,7 +305,6 @@ DEF_HELPER_4(vctsxs, void, env, avr, avr, i32)
 
 DEF_HELPER_2(vclzb, void, avr, avr)
 DEF_HELPER_2(vclzh, void, avr, avr)
-DEF_HELPER_2(vclzw, void, avr, avr)
 DEF_HELPER_2(vctzb, void, avr, avr)
 DEF_HELPER_2(vctzh, void, avr, avr)
 DEF_HELPER_2(vctzw, void, avr, avr)
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 3134798..82cb12e 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1802,15 +1802,12 @@ VUPK(lsw, s64, s32, UPKLO)
 
 #define clzb(v) ((v) ? clz32((uint32_t)(v) << 24) : 8)
 #define clzh(v) ((v) ? clz32((uint32_t)(v) << 16) : 16)
-#define clzw(v) clz32((v))
 
 VGENERIC_DO(clzb, u8)
 VGENERIC_DO(clzh, u16)
-VGENERIC_DO(clzw, u32)
 
 #undef clzb
 #undef clzh
-#undef clzw
 
 #define ctzb(v) ((v) ? ctz32(v) : 8)
 #define ctzh(v) ((v) ? ctz32(v) : 16)
diff --git a/target/ppc/translate/vmx-impl.inc.c b/target/ppc/translate/vmx-impl.inc.c
index 1953c65..9ed2fae 100644
--- a/target/ppc/translate/vmx-impl.inc.c
+++ b/target/ppc/translate/vmx-impl.inc.c
@@ -840,6 +840,32 @@ static void trans_vgbbd(DisasContext *ctx)
 }
 
 /*
+ * vclzw VRT,VRB - Vector Count Leading Zeros Word
+ *
+ * Counting the number of leading zero bits of each word element in source
+ * register and placing result in appropriate word element of destination
+ * register.
+ */
+static void trans_vclzw(DisasContext *ctx)
+{
+    int VT = rD(ctx->opcode);
+    int VB = rB(ctx->opcode);
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    int i;
+
+    /* Perform count for every word element using tcg_gen_clzi_i32. */
+    for (i = 0; i < 4; i++) {
+        tcg_gen_ld_i32(tmp, cpu_env,
+            offsetof(CPUPPCState, vsr[32 + VB].u64[0]) + i * 4);
+        tcg_gen_clzi_i32(tmp, tmp, 32);
+        tcg_gen_st_i32(tmp, cpu_env,
+            offsetof(CPUPPCState, vsr[32 + VT].u64[0]) + i * 4);
+    }
+
+    tcg_temp_free_i32(tmp);
+}
+
+/*
  * vclzd VRT,VRB - Vector Count Leading Zeros Doubleword
  *
  * Counting the number of leading zero bits of each doubleword element in source
@@ -1380,7 +1406,7 @@ GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23)
 
 GEN_VXFORM_NOA(vclzb, 1, 28)
 GEN_VXFORM_NOA(vclzh, 1, 29)
-GEN_VXFORM_NOA(vclzw, 1, 30)
+GEN_VXFORM_TRANS(vclzw, 1, 30)
 GEN_VXFORM_TRANS(vclzd, 1, 31)
 GEN_VXFORM_NOA_2(vnegw, 1, 24, 6)
 GEN_VXFORM_NOA_2(vnegd, 1, 24, 7)
-- 
2.7.4


