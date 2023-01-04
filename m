Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAD465D4A6
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 14:46:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD469-0000p4-FL; Wed, 04 Jan 2023 08:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pD462-0000nY-2Z
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:46:24 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pD45z-0005kb-VM
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:46:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zhFt+h2CfwgWS9+FNozC5b0VslIsJOgYuuoZXaWwYJA=; b=wyPKR0SZ/FYfzgKZVnoNKvk1kh
 e08UKKntbERbN8POlkbK2nGvs+b47MZGOEu1JUgql9mdb73lUfIK22USczpqWEoHlPRFURmWpaa4o
 GEPBK/2iksOUqEzh+EnJOvDgMK1VZ3InX8J+Rxm3jVYQ7w5Pb1fQCpRIQcOfHMr4zulrIVI4RW7+m
 LxLhz/bD0iBWJAI3DYETNw7IFxR9IRyrQoyTJqq2U+e0isQYkKtG5nviQOegM5Ds578fSRqO08UB2
 YgyfiF0qIDb36f0xAZaosy+qcXeaI33qZnPe/KS96ynG90BSUQwzOMQtjj+sAaveR5NX8XYoZbTRt
 UsNs2kPsdqtVYXmZlbgrUJCCWa3/cxgSDITbM291H28oOHQhGJlW0s1PzDoKMfOQ8CVtPxbFdfrgr
 BaFYiZliOFevvQzjwIbryBZo6UfH1y3wPAwTXIp8/I1FlgijTGrw1BIzGzWTRHisWfhJDqQRPSGKe
 0G3lY3GgdDS2YY+WBwMxXRABZP56MO0Z61PqR0886WkFMbQw4vtfpswEl0X/f8tMPG11J3VmkmYfj
 DkrseEpIWF0+l4coyzzrF0sKrDuXX9XOgaD7ydeihJ3txe42H123bDggh8S/RxZgRTTiVzXudCctq
 VMBN4MOh+7Yg+kH80BoQfqZbQRvjccLFOW568gkRA=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pD45b-00099q-GM; Wed, 04 Jan 2023 13:45:59 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Wed,  4 Jan 2023 13:45:54 +0000
Message-Id: <20230104134554.138012-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104134554.138012-1-mark.cave-ayland@ilande.co.uk>
References: <20230104134554.138012-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 4/4] target/m68k: fix FPSR quotient byte for frem
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
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/fpu_helper.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index 5fd094a33c..56f7400140 100644
--- a/target/m68k/fpu_helper.c
+++ b/target/m68k/fpu_helper.c
@@ -538,17 +538,25 @@ void HELPER(fmod)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 
 void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
+    float_status fp_status;
+    FPReg fp_quot;
     uint32_t quotient;
     int sign;
 
+    /* Calculate quotient directly using round to nearest mode */
+    set_float_rounding_mode(float_round_nearest_even, &fp_status);
+    set_floatx80_rounding_precision(
+        get_floatx80_rounding_precision(&env->fp_status), &fp_status);
+    fp_quot.d = floatx80_div(val1->d, val0->d, &fp_status);
+
     res->d = floatx80_rem(val1->d, val0->d, &env->fp_status);
 
-    if (floatx80_is_any_nan(res->d)) {
+    if (floatx80_is_any_nan(fp_quot.d)) {
         return;
     }
 
-    sign = extractFloatx80Sign(res->d);
-    quotient = floatx80_to_int32(floatx80_abs(res->d), &env->fp_status);
+    sign = extractFloatx80Sign(fp_quot.d);
+    quotient = floatx80_to_int32(floatx80_abs(fp_quot.d), &env->fp_status);
     make_quotient(env, sign, quotient);
 }
 
-- 
2.30.2


