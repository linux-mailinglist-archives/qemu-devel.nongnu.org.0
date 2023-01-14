Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C4966AEC6
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 00:31:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGpys-0006VG-UJ; Sat, 14 Jan 2023 18:30:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pGpym-0006UW-Df
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 18:30:28 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pGpyh-0003y6-CT
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 18:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TjqbDbXwFP2XVcU1Elo5GLxVz+6l6DjlXAhv1W32K2U=; b=DwuMDcQ+ONEnko4ySVcgkHbuZR
 T+5m8Yw23sEONdg92tzXy4w0aYJ54eRmFNYzgnuIjWEGfR0dnhb0tkqCuPXmz8sr2MY758zPeRMQv
 xxaP/9OeX2HS7/e2EXTVnbFUK46IhJhmGrnt9+u2UVDIgRYusSDr7Wj/Q8G/n/TLIwlUQU87KBvwM
 IjbGyMoKva1svyTfz1HbkIkVj34KZYok/biYgZay1060fJNfKOIbGpOyLfEPBpEBF/nKimw1JIkvm
 9f1kEGnSoKO2UXhYt0DFNrQtzk0PsAXFCDt1fD6uMBfK1y6tce8evZidnMhVxzatyJffC9Y3Sti77
 KHdzI3Or6r+7pWHXG34U6BuzgVMWrjW+dxFltLY/I3Rb/P9YSNWgG5Ymwb07RwuKxYBxuRh8HzXN8
 qZizrSDP4thbqU6CSeJhxn0qsr/7OhaK7UkXVDJugPyIzokkXLdATmp88HVVf7GS9oiBESBWz8+fq
 kagdJkKoAAmROSN738l+r4qmkl6axyYn1ARiOvyWUZkhaZcCs66aNLpBvTRbXxTylSQu4rHC6RYEY
 HZ46a0ohet4lPfjEDV2acPEOM9hDxm7oaGLh7LkrOYiOBKwdbQlluUm1j0EO02XfK44ua4dQjrLmw
 UwW2dP+xqLShez09GpGmKZFVcGvt9hTorSxXqT5TU=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pGpyF-0002Ab-U3; Sat, 14 Jan 2023 23:29:59 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sat, 14 Jan 2023 23:29:57 +0000
Message-Id: <20230114232959.118224-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230114232959.118224-1-mark.cave-ayland@ilande.co.uk>
References: <20230114232959.118224-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 2/4] target/m68k: pass sign directly into make_quotient()
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

This enables the quotient parameter to be changed from int32_t to uint32_t and
also allows the extra sign logic in make_quotient() to be removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/fpu_helper.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index 0932c464fd..76b34b8988 100644
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
2.30.2


