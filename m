Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B500E66AEC7
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 00:31:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGpys-0006V2-NL; Sat, 14 Jan 2023 18:30:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pGpyn-0006Uq-Is
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 18:30:29 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pGpym-00040r-6D
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 18:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VRRjLKb32BGUpCHS2k+jXf/P2JX1P862ixDSlV7Xkr0=; b=U5QhgZWHWYABDfBJjOBeZGIH5z
 eb48IMjZeSZctjBrgBIAqmev2DOkWw/PvNTQ1ZlFplSZhbbxZ8+08kRzmRyF1tbrzXR4q59+w+Moq
 LKi8xrWF3J5Nsu3Ux33C9WvGRTCg4Sn7WqsL3wBrOBP5nif+cl0hh/CQ68a4KVrvwcgNekNku/SXi
 Hg0juXpZby94QfTsXJNrAujcCysdCgHaKklV+L2FdKOgUx5pgTrh2WKOao9cqD1uk+Q0Oq81xZQaq
 e50mrl1y0psxqNVO9UyZBLQD+CcUwNL9xdz9WhcauxMHAhBRzuGyYLdHGvEjoVcZ/boPl4HXUV6IA
 c0I45pJemTlplYc3l41UigS22maiRDltWysSEcPQFMGUOOdu/Qn5LqcNPasbwxkMoFkQKrGVRbkhQ
 l/h6oyR3Chz1+x2WW4O4Atfq4TWZTyvo7dhQ2CfS8wRPQKPLHYNaS5EtO6Hln58dQhnYBZIfO1sh8
 RiZSrUXs2lDVhqz05SWQXze7bd+/nYmbZ2LPE+0I81Cb2O0o9tGV528ERAIk2LbSDKh99RlvfAH74
 FipQUgcRZGeLBXpHzGCyIBF0lBu0oQGxjWBVsFdlwvIJOFPD4ZdW3z3cUImNmLNl3JtSZlTi+YLtL
 tgPdZqB7aQPWRcOKJQcTOu9Aelbex+2yGk+tWKme8=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pGpyK-0002Ab-0N; Sat, 14 Jan 2023 23:30:04 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sat, 14 Jan 2023 23:29:58 +0000
Message-Id: <20230114232959.118224-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230114232959.118224-1-mark.cave-ayland@ilande.co.uk>
References: <20230114232959.118224-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 3/4] target/m68k: fix FPSR quotient byte for fmod
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
result. Switch from using floatx80_mod() to floatx80_modrem() which returns
the quotient as a uint64_t which can be used for the quotient byte.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/fpu_helper.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index 76b34b8988..5fd094a33c 100644
--- a/target/m68k/fpu_helper.c
+++ b/target/m68k/fpu_helper.c
@@ -523,17 +523,16 @@ static void make_quotient(CPUM68KState *env, int sign, uint32_t quotient)
 
 void HELPER(fmod)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
-    uint32_t quotient;
-    int sign;
+    uint64_t quotient;
+    int sign = extractFloatx80Sign(val1->d) ^ extractFloatx80Sign(val0->d);
 
-    res->d = floatx80_mod(val1->d, val0->d, &env->fp_status);
+    res->d = floatx80_modrem(val1->d, val0->d, true, &quotient,
+                             &env->fp_status);
 
     if (floatx80_is_any_nan(res->d)) {
         return;
     }
 
-    sign = extractFloatx80Sign(res->d);
-    quotient = floatx80_to_int32(floatx80_abs(res->d), &env->fp_status);
     make_quotient(env, sign, quotient);
 }
 
-- 
2.30.2


