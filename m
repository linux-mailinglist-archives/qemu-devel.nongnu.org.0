Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6785C66AEC5
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 00:31:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGpyi-0006Tz-95; Sat, 14 Jan 2023 18:30:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pGpye-0006Ta-Rj
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 18:30:22 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pGpyd-0003va-BG
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 18:30:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gqQm2XCWaXtySI0pAar/Iq1SN/NdQR8Bis5Wnetndlk=; b=J1RCNZ995l6Dxe49m8ptFqwrhJ
 mDhXWD5cd3jAb3lstS3G2i6c9lHFCc2NrfkiDaAfwG7bY/g5PRx9mjxTgiwpTuHeX/OR6hbrdNmJZ
 zNHcPB//EoIyeKdvFAIQWuBLrgEJNvsXJl/rk16fYoHmr9DpSjrdOrPCK4MoyLsu7cRtXtmjKsDIg
 q4OKiKyCTVgPh5xUReLl40+kWrZRSJ4Gzu2gsLBrZSicDjFi9SVjnM2botzTF+mB0h/NrfyOBWEXE
 sVUAFPUQJre031Etqb1TWzR5+m/FlQEFKzPfcGmXmX2YdAF1ZBJ8z89G39asFiYIBzIS89cyWfEbx
 rz8pCiLvDRFzxArEUCQi6bqmepojj3KDHFkpGGQXM/Zo5tynaHuBHcT7BaeWVU+2yQfkoquy1ijeM
 w9t1sAYHpCJon9p++9sSb6/B6l996ubwPqg5d3hpidK4aJNJswO4S2RV63k/Ka9skoMvl6UqzIb29
 CA7kg/p24VoxM6/y2BFefaS8VEvBGQNqhK581G3pETnWm5WauClpdeeFTe9cnYs/BTHbXn8jAhFLv
 1t9YqCBYBAnyEu50TvargKu5iTf3HBlwagAnXYimq5pkKEc67dVPl+l3Ym5o/YXuSSHW3TiGCLY60
 YJplgJheX4aTKQOtL1gSm9TkIG4e3Nnom1y4lONxs=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pGpyB-0002Ab-PZ; Sat, 14 Jan 2023 23:29:55 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sat, 14 Jan 2023 23:29:56 +0000
Message-Id: <20230114232959.118224-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230114232959.118224-1-mark.cave-ayland@ilande.co.uk>
References: <20230114232959.118224-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 1/4] target/m68k: pass quotient directly into
 make_quotient()
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/fpu_helper.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index fdc4937e29..0932c464fd 100644
--- a/target/m68k/fpu_helper.c
+++ b/target/m68k/fpu_helper.c
@@ -515,16 +515,10 @@ uint32_t HELPER(fmovemd_ld_postinc)(CPUM68KState *env, uint32_t addr,
     return fmovem_postinc(env, addr, mask, cpu_ld_float64_ra);
 }
 
-static void make_quotient(CPUM68KState *env, floatx80 val)
+static void make_quotient(CPUM68KState *env, int32_t quotient)
 {
-    int32_t quotient;
     int sign;
 
-    if (floatx80_is_any_nan(val)) {
-        return;
-    }
-
-    quotient = floatx80_to_int32(val, &env->fp_status);
     sign = quotient < 0;
     if (sign) {
         quotient = -quotient;
@@ -538,14 +532,22 @@ void HELPER(fmod)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
     res->d = floatx80_mod(val1->d, val0->d, &env->fp_status);
 
-    make_quotient(env, res->d);
+    if (floatx80_is_any_nan(res->d)) {
+        return;
+    }
+
+    make_quotient(env, floatx80_to_int32(res->d, &env->fp_status));
 }
 
 void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
     res->d = floatx80_rem(val1->d, val0->d, &env->fp_status);
 
-    make_quotient(env, res->d);
+    if (floatx80_is_any_nan(res->d)) {
+        return;
+    }
+
+    make_quotient(env, floatx80_to_int32(res->d, &env->fp_status));
 }
 
 void HELPER(fgetexp)(CPUM68KState *env, FPReg *res, FPReg *val)
-- 
2.30.2


