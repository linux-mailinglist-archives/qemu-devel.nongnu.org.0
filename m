Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF6366BA20
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:20:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLeG-0000nr-61; Mon, 16 Jan 2023 04:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pHLeD-0000nA-UH
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:19:21 -0500
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pHLeA-0003CM-Kc
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:19:21 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MVMJ7-1p7p1J3Zax-00SLzt; Mon, 16
 Jan 2023 10:19:15 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 2/4] target/m68k: pass sign directly into make_quotient()
Date: Mon, 16 Jan 2023 10:19:10 +0100
Message-Id: <20230116091912.1882152-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230116091912.1882152-1-laurent@vivier.eu>
References: <20230116091912.1882152-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OZadBC+rcuKn/kNj+/VVUkXnBS/k4iqiQluihP4L2B5VEx00fKi
 H98WeMmtDkwc/wyNMKMk8rHOdvOTCQUiDDEez7zTpuVdUq5x3ywU59Wu2Vg1QuFQHS0MNLP
 GuiJiG7l1YLtLiuaMUCVG2stq8wLIftTaDyu3bvx3c4uDUSThbn7prSC8gQv2jVFKth2iA/
 CPnIECwOaS7Pbuc/BYynQ==
UI-OutboundReport: notjunk:1;M01:P0:dAQZHaaW/Is=;JKoWJUDmGpqVXN9ZbcGXgHzd7Ti
 PcY+5oKjJx9lMRAC00bTPupsyPqDnbH46JJDln/X9IYV28LsnU7DOfIuEBNoCOiy1gmWHF55u
 6vFza8Dpi/BsDCjdy9XTPJ/+rwQ0jYwzwYSt1n1L4+vu7bkjlPy103xLXnv8m8JE5aDb6dE7b
 bmBAUduy6oOzmtIos8vL3ECjmzo+A76SlA14Y5hT45F0T9vktGkENgwSU+G0/VDqxwWJd3tr2
 E0eO2lNO4GyMyqhaxaEY6kC1zyfrTHEltIPcy/q4HjW6K/OvDrhixhRxMuRc2SCbVUibyKANs
 T8chpn4YPcfNmjsmv0FVCdZbAu7OaJxnusLzHjOtnRsdyh1ymV0hXG4azOKPFMRNIwCIBbjDN
 FB2QtNf7uWB80FZG2bFE7HrJXXgFOdQUmX6mSihoT/tS6J8h1qlZnsuQ4fELi40HUfks/LHJx
 k7842aSwblBy4QIkdrLa0Kl2IXRkID9kLVIYub8WFVdmuj9knDWA49Y47FkkLHFqrpPqvAi/G
 wQKH2AswkDLJsrfl5y6VBe1dT8Yly0isSyn14b66fLbJjT3laKX0PUwW8WkMdAi4DpQLUpcfV
 P912Jlvax+rSAHtgOT6PYcgIvumJE1m5UbqsjY+XbHPRXaYTGRqXW33uQQEfvSUU79Lg5lq3W
 4DV/WW8uAIhAOWVitWFIv1kxbyd6LQRBMXvKsNWktg==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

This enables the quotient parameter to be changed from int32_t to uint32_t and
also allows the extra sign logic in make_quotient() to be removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20230114232959.118224-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/fpu_helper.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index 0932c464fdae..76b34b898879 100644
--- a/target/m68k/fpu_helper.c
+++ b/target/m68k/fpu_helper.c
@@ -515,39 +515,42 @@ uint32_t HELPER(fmovemd_ld_postinc)(CPUM68KState *env, uint32_t addr,
     return fmovem_postinc(env, addr, mask, cpu_ld_float64_ra);
 }
 
-static void make_quotient(CPUM68KState *env, int32_t quotient)
+static void make_quotient(CPUM68KState *env, int sign, uint32_t quotient)
 {
-    int sign;
-
-    sign = quotient < 0;
-    if (sign) {
-        quotient = -quotient;
-    }
-
     quotient = (sign << 7) | (quotient & 0x7f);
     env->fpsr = (env->fpsr & ~FPSR_QT_MASK) | (quotient << FPSR_QT_SHIFT);
 }
 
 void HELPER(fmod)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
+    uint32_t quotient;
+    int sign;
+
     res->d = floatx80_mod(val1->d, val0->d, &env->fp_status);
 
     if (floatx80_is_any_nan(res->d)) {
         return;
     }
 
-    make_quotient(env, floatx80_to_int32(res->d, &env->fp_status));
+    sign = extractFloatx80Sign(res->d);
+    quotient = floatx80_to_int32(floatx80_abs(res->d), &env->fp_status);
+    make_quotient(env, sign, quotient);
 }
 
 void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
+    uint32_t quotient;
+    int sign;
+
     res->d = floatx80_rem(val1->d, val0->d, &env->fp_status);
 
     if (floatx80_is_any_nan(res->d)) {
         return;
     }
 
-    make_quotient(env, floatx80_to_int32(res->d, &env->fp_status));
+    sign = extractFloatx80Sign(res->d);
+    quotient = floatx80_to_int32(floatx80_abs(res->d), &env->fp_status);
+    make_quotient(env, sign, quotient);
 }
 
 void HELPER(fgetexp)(CPUM68KState *env, FPReg *res, FPReg *val)
-- 
2.38.1


