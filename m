Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A36550D5B8
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:25:14 +0200 (CEST)
Received: from localhost ([::1]:35046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikfJ-0004Zq-6Z
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikT0-0001jH-11
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:37 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikSw-0002ra-QW
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:12:28 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ9-0001ea-6b; Sun, 24 Apr 2022 23:02:19 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 22/42] i386: Update ops_sse_helper.h ready for 256 bit AVX
Date: Sun, 24 Apr 2022 23:01:44 +0100
Message-Id: <20220424220204.2493824-23-paul@nowt.org>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220418173904.3746036-1-paul@nowt.org>
References: <20220418173904.3746036-1-paul@nowt.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41c8:51:832:fcff:ff:fe00:46dd;
 envelope-from=paul@nowt.org; helo=nowt.default.pbrook.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Paul Brook <paul@nowt.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update ops_sse_helper.h ready for 256 bit AVX helpers

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse_header.h | 67 +++++++++++++++++++++---------------
 1 file changed, 40 insertions(+), 27 deletions(-)

diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 203afbb5a1..63b63eb532 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -105,7 +105,7 @@ SSE_HELPER_L(pcmpeql, FCMPEQ)
 
 SSE_HELPER_W(pmullw, FMULLW)
 #if SHIFT == 0
-DEF_HELPER_3(glue(pmulhrw, SUFFIX), FMULHRW)
+DEF_HELPER_3(glue(pmulhrw, SUFFIX), void, env, Reg, Reg)
 #endif
 SSE_HELPER_W(pmulhuw, FMULHUW)
 SSE_HELPER_W(pmulhw, FMULHW)
@@ -137,23 +137,39 @@ DEF_HELPER_3(glue(pshufhw, SUFFIX), void, Reg, Reg, int)
 /* FPU ops */
 /* XXX: not accurate */
 
-DEF_HELPER_3(glue(shufps, SUFFIX), void, Reg, Reg, int)
-DEF_HELPER_3(glue(shufpd, SUFFIX), void, Reg, Reg, int)
+#define SSE_HELPER_P4(name)                                             \
+    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)         \
+    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg)
+
+#define SSE_HELPER_P3(name, ...)                                        \
+    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)         \
+    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg)
 
-#define SSE_HELPER_S(name, F)                            \
-    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)        \
-    DEF_HELPER_3(name ## ss, void, env, Reg, Reg)        \
-    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg)        \
+#if SHIFT == 1
+#define SSE_HELPER_S4(name)                                             \
+    SSE_HELPER_P4(name)                                                 \
+    DEF_HELPER_3(name ## ss, void, env, Reg, Reg)                       \
     DEF_HELPER_3(name ## sd, void, env, Reg, Reg)
+#define SSE_HELPER_S3(name)                                             \
+    SSE_HELPER_P3(name)                                                 \
+    DEF_HELPER_3(name ## ss, void, env, Reg, Reg)                       \
+    DEF_HELPER_3(name ## sd, void, env, Reg, Reg)
+#else
+#define SSE_HELPER_S4(name, ...) SSE_HELPER_P4(name)
+#define SSE_HELPER_S3(name, ...) SSE_HELPER_P3(name)
+#endif
+
+DEF_HELPER_3(glue(shufps, SUFFIX), void, Reg, Reg, int)
+DEF_HELPER_3(glue(shufpd, SUFFIX), void, Reg, Reg, int)
 
-SSE_HELPER_S(add, FPU_ADD)
-SSE_HELPER_S(sub, FPU_SUB)
-SSE_HELPER_S(mul, FPU_MUL)
-SSE_HELPER_S(div, FPU_DIV)
-SSE_HELPER_S(min, FPU_MIN)
-SSE_HELPER_S(max, FPU_MAX)
-SSE_HELPER_S(sqrt, FPU_SQRT)
+SSE_HELPER_S4(add)
+SSE_HELPER_S4(sub)
+SSE_HELPER_S4(mul)
+SSE_HELPER_S4(div)
+SSE_HELPER_S4(min)
+SSE_HELPER_S4(max)
 
+SSE_HELPER_S3(sqrt)
 
 DEF_HELPER_3(glue(cvtps2pd, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(cvtpd2ps, SUFFIX), void, env, Reg, Reg)
@@ -208,18 +224,12 @@ DEF_HELPER_4(extrq_i, void, env, ZMMReg, int, int)
 DEF_HELPER_3(insertq_r, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_4(insertq_i, void, env, ZMMReg, int, int)
 #endif
-DEF_HELPER_3(glue(haddps, SUFFIX), void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(glue(haddpd, SUFFIX), void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(glue(hsubps, SUFFIX), void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(glue(hsubpd, SUFFIX), void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(glue(addsubps, SUFFIX), void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(glue(addsubpd, SUFFIX), void, env, ZMMReg, ZMMReg)
-
-#define SSE_HELPER_CMP(name, F)                           \
-    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)         \
-    DEF_HELPER_3(name ## ss, void, env, Reg, Reg)         \
-    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg)         \
-    DEF_HELPER_3(name ## sd, void, env, Reg, Reg)
+
+SSE_HELPER_P4(hadd)
+SSE_HELPER_P4(hsub)
+SSE_HELPER_P4(addsub)
+
+#define SSE_HELPER_CMP(name, F) SSE_HELPER_S4(name)
 
 SSE_HELPER_CMP(cmpeq, FPU_CMPEQ)
 SSE_HELPER_CMP(cmplt, FPU_CMPLT)
@@ -381,6 +391,9 @@ DEF_HELPER_4(glue(pclmulqdq, SUFFIX), void, env, Reg, Reg, i32)
 #undef SSE_HELPER_W
 #undef SSE_HELPER_L
 #undef SSE_HELPER_Q
-#undef SSE_HELPER_S
+#undef SSE_HELPER_S3
+#undef SSE_HELPER_S4
+#undef SSE_HELPER_P3
+#undef SSE_HELPER_P4
 #undef SSE_HELPER_CMP
 #undef UNPCK_OP
-- 
2.36.0


