Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E06B66BA1F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:20:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLeH-0000pQ-07; Mon, 16 Jan 2023 04:19:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pHLeE-0000nG-5D
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:19:22 -0500
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pHLeB-0003CU-2L
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:19:21 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MLyvH-1ozXoQ3aiX-00Hw87; Mon, 16
 Jan 2023 10:19:16 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 4/4] target/m68k: fix FPSR quotient byte for frem instruction
Date: Mon, 16 Jan 2023 10:19:12 +0100
Message-Id: <20230116091912.1882152-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230116091912.1882152-1-laurent@vivier.eu>
References: <20230116091912.1882152-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jV9j+LW0sPg5/X1vogxojXtutHc00qoQwgctwjpMfMIcl2CoXLZ
 pqhgegn8ydc2p2OphKN1f05w8HJl3X/3CSIxKtfgFeavgzq5+U0pvin2yG8WFZaIzuePCNJ
 gQ8/SztqLtDgl+sraxUrznFs3DuNt00KL8ogxnlGnhQH51++6Uz+Wn3Jtz1+cweqRtJWkw3
 OCU77ybN4uLKd16Z0utSA==
UI-OutboundReport: notjunk:1;M01:P0:tGqbjgI6OV8=;vcU2pTwem0YPMHa05ua65qag1MT
 yYY8Yy5QxwWWrQlUc2cCdpNfXp/RngkOwYqJPh/Z7Xnh4BVptu0U0TElmXsxz8y9d3SZvtjOy
 qFqFh3Rb7G8ePuXdwWR1TGsztLVB49dAjrOw1pcE+aej7kDEwhC3DRO1kBU3aR3kpHLObER2c
 5JA/mEUHJq+eVkrtrS45TSZikSX7geL6R7WmemWSORhdqoyBTLQZQfvMDMpABMXWQu09QQ6DL
 MMjk4EZXeN+4GToBX6blYzJRlxSA0kU2sSFTYv41l6PS0zwGOMjrCnJeuQvQrx1+IFfRdzR/Z
 zn7AOj4Lk/6tNqxEbfha508d7mU1/2/FkNRLgWDuoElBcfBWO2JKWieZRcGeLyPKJdlFinYwv
 JR3ezar83UA8vadSk5DDa7AKjOhm1MwW7gHEx9Gi2dQEqxMCb9OfIffzXslvs6MVx2oud4vXC
 IpxidkrPoHePKur2Y/AdIEODs2fVD5SxhNtmM96uF0J/xit+/P1MYo5E1rQ8K2qrmYp1WXpO/
 guyTnGu81WEaB2l6P1Z29wSJ4vQvzjnaiykA/Ow0V99HzPOoAjrUkSMe+jXCZnqYD39qkeYHM
 Y85dlojxfIDPcXP4L7Lm/d83UOs7qqr1DBWEF/ky3iMrMMhyCkkXz65vN5iHapGoT6kJOgIOe
 03CtAmaRZce2IEnBoPSWwZlu4+Ou7ISVq4y9TntCMQ==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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

The FPSR quotient byte should be set to the value of the quotient and not the
result. Manually calculate the quotient in the frem helper in round to nearest
even mode (note this is different from the quotient calculated internally for
fmod), and use it to set the quotient byte accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1314
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230114232959.118224-5-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/fpu_helper.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index 5fd094a33cff..3a37d8f584d6 100644
--- a/target/m68k/fpu_helper.c
+++ b/target/m68k/fpu_helper.c
@@ -538,18 +538,27 @@ void HELPER(fmod)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 
 void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
-    uint32_t quotient;
-    int sign;
-
-    res->d = floatx80_rem(val1->d, val0->d, &env->fp_status);
-
-    if (floatx80_is_any_nan(res->d)) {
-        return;
+    FPReg fp_quot;
+    floatx80 fp_rem;
+
+    fp_rem = floatx80_rem(val1->d, val0->d, &env->fp_status);
+    if (!floatx80_is_any_nan(fp_rem)) {
+        float_status fp_status = { };
+        uint32_t quotient;
+        int sign;
+
+        /* Calculate quotient directly using round to nearest mode */
+        set_float_rounding_mode(float_round_nearest_even, &fp_status);
+        set_floatx80_rounding_precision(
+            get_floatx80_rounding_precision(&env->fp_status), &fp_status);
+        fp_quot.d = floatx80_div(val1->d, val0->d, &fp_status);
+
+        sign = extractFloatx80Sign(fp_quot.d);
+        quotient = floatx80_to_int32(floatx80_abs(fp_quot.d), &env->fp_status);
+        make_quotient(env, sign, quotient);
     }
 
-    sign = extractFloatx80Sign(res->d);
-    quotient = floatx80_to_int32(floatx80_abs(res->d), &env->fp_status);
-    make_quotient(env, sign, quotient);
+    res->d = fp_rem;
 }
 
 void HELPER(fgetexp)(CPUM68KState *env, FPReg *res, FPReg *val)
-- 
2.38.1


