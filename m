Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4650266AEC3
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 00:31:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGpyu-0006Vs-IA; Sat, 14 Jan 2023 18:30:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pGpyr-0006VL-80
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 18:30:33 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pGpyp-00041Q-KQ
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 18:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XFnXPBkp6LjeJcFaihNrkxQmXNW2mPQHtodLyt3BjIk=; b=KWiuzCIoCta2g+XAGoEYDmPNjA
 Lw7wYGPwc5GFdRdhJOThO2w95o/bJ6pGVWar1X2HX16JBnsyBDCXsnHcmeUccd+JHauYSwbbT3Nty
 u/ksH+VufFlLBRDhVhQZG7KI0oDMwQJ+2Zk7yT4mWrMsgINe/rQglCbb6s0S9gWOo323fFtMJd6UI
 wKRRJhjTrP236VZiJ56obrSAG1KuFbnKwKVDqYNiLzOca36PVR+APMMACm/y0MQrjyj/zRDgmVrCn
 P1HWpAjZQUYUwiiHMXW5uxQTLJnosqYPhv/bDZjT2ouRHS8UCNySfoUbXSbPfSnkXPWScKHP1YczE
 qwxYKUdgAjOVIt7CB/SiTqBohSS2wNwEkd3CmFgSVE2ymvw9I8BOCa7r11rx9YEaNOAvd9SnkblxY
 ddWmGHBwHGOAkPXpu4ulTUjuJCGoatVusAmf1ifJtb1/O4B9lv63Zy8wNS1wUq4yj1UxOaFhox9ZP
 efEyJ0rYTQJnVvVxDi+qVWlb1cwKCJSMysCUatGAAjrQTmfF3PF4TDedy/vTL1UfYFxgE49w4dxuO
 g8hJGP2tx5Gw/ahkFOvPJ8s32LOpwSjvMCS8wmSQY1tPaZ1YgSAdKRSQkg3LchaYV4vTN4jJfhqOQ
 NhqrApVc40URIfC6Z9VT+ImZJ1hYZmhbRq4gB1kE8=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pGpyO-0002Ab-3T; Sat, 14 Jan 2023 23:30:08 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sat, 14 Jan 2023 23:29:59 +0000
Message-Id: <20230114232959.118224-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230114232959.118224-1-mark.cave-ayland@ilande.co.uk>
References: <20230114232959.118224-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 4/4] target/m68k: fix FPSR quotient byte for frem
 instruction
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The FPSR quotient byte should be set to the value of the quotient and not the
result. Manually calculate the quotient in the frem helper in round to nearest
even mode (note this is different from the quotient calculated internally for
fmod), and use it to set the quotient byte accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1314
---
 target/m68k/fpu_helper.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index 5fd094a33c..3a37d8f584 100644
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
2.30.2


