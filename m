Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1708365AA31
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 15:45:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBzZL-0005at-7Q; Sun, 01 Jan 2023 09:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pBzZ9-0005YU-7g
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 09:44:02 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pBzZ6-0003mv-Sp
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 09:43:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zSEuUxxH1qQyLUFuP2gnwCWsAUW/+hcdBsLLkJ/exF8=; b=xtFxf5ELCgGO+Dm1qO+FJg9aPg
 zQxa+8wkB4O+2bRvKJY0a1Yk+dIB1AueRXP8C7kEIcqlmzODw/0WAr+Iw5hee1Py5OAs9S21pkfDt
 NI5GUDm/ahgbaToqbCx9DXAFVGoH72K/lua3Ewksrjtb39NTw6TnHnz6jHv5UvpEwmCZrXjC5w4dk
 ODYoaGHqn56UM7C9QOEt1SVHFGFXBvByLppBd7GYpGaF9/84qTunjERs3vO8hjSm11aZ7/Za1lJe9
 NaTGMZGTRj1rjgEdTCpY24KpQQYzrfWl0WIUUewQS5K55BHMjGq8YwavyIekfsUwyk9fM8dkdJSBs
 eV/1vgsG5UQKuiBPOLDNoeyGmBf5c+gLrQPf2jjPvhifKQXEfcJHFrw7y1n+XOam+VprD4Rx51UTw
 Sz4xAOPpCKg5hHImqD+LRdcz2324JUX4zz7OYLGFUpUz1Ml8vzFiJrl4KxX1JGuOFSmpBvR+BQu0b
 1sw5lHIbCpNSKOSAj7yEKaBvr1jQvukje2r8omn59hBb6gpnMTHjFEHjB0R+epRXnlCHttQ1nkOqc
 R+tYfpHKe28LTWf7YSgidGVfi1nMNrqrEPby+falc0tjgDIDCDdbuqRRfb8v/8A+BlcfObWSYS93n
 VKdVVcwRQnUGKq/SpCUkASey7/XU2NY3qrnWtDXMU=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pBzYj-0001W3-9s; Sun, 01 Jan 2023 14:43:37 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sun,  1 Jan 2023 14:43:36 +0000
Message-Id: <20230101144339.60307-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230101144339.60307-1-mark.cave-ayland@ilande.co.uk>
References: <20230101144339.60307-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/4] target/m68k: pass sign directly into make_quotient()
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
---
 target/m68k/fpu_helper.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index 0932c464fd..ae839785fa 100644
--- a/target/m68k/fpu_helper.c
+++ b/target/m68k/fpu_helper.c
@@ -515,15 +515,8 @@ uint32_t HELPER(fmovemd_ld_postinc)(CPUM68KState *env, uint32_t addr,
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
@@ -536,7 +529,8 @@ void HELPER(fmod)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
         return;
     }
 
-    make_quotient(env, floatx80_to_int32(res->d, &env->fp_status));
+    make_quotient(env, extractFloatx80Sign(res->d),
+                  floatx80_to_int32(res->d, &env->fp_status));
 }
 
 void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
@@ -547,7 +541,8 @@ void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
         return;
     }
 
-    make_quotient(env, floatx80_to_int32(res->d, &env->fp_status));
+    make_quotient(env, extractFloatx80Sign(res->d),
+                  floatx80_to_int32(res->d, &env->fp_status));
 }
 
 void HELPER(fgetexp)(CPUM68KState *env, FPReg *res, FPReg *val)
-- 
2.30.2


