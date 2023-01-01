Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A80E65AA34
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 15:45:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBzZL-0005ao-6T; Sun, 01 Jan 2023 09:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pBzZI-0005aE-4S
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 09:44:08 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pBzZG-0003op-FS
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 09:44:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=llxxRqZFmcvJQubpK2EAAkYoj3msR8RkeocpRunzdn0=; b=XAgXMz+FV+9LaoBNe8EAsiBnyQ
 Pud22zsjn4G5Kv2XwFU+IQH1zsQFVnoI1LQ228Bde5vahSL6HGeiEBquIbIhwixDC7UKbUrREHTiJ
 h0STzap1Rnp+cKDVLM+1bUztcN0LTu1MtceubLrgUD3SKzz6c246FxYZ3pYRjyFwxJl1cj8R6hE4p
 yoLBbIF+O/4QfDwPPk5XvNt1e6+AqQlzcfeE0goPS7RKoPezXsK5F8dygBIkqzo++M5PjjprQoxSc
 44+H8dqysweXi5w3/pA76ubwHjrZG8pZevqsLMGVzHoKHsEPO6lfKLfsVc5d5QEtWZt+J01qfEMSu
 Sl+C4YqahW/APWVkJUUyBiLE0mPbqGziT/hKYWhuvhCDma2REsv5+btRlL5aIpykRcSeMwqNagnXq
 dSE3ZJ318LD8DpFEiB0N7Pp4cYid1GisdRBm5VM8kgZpzoiim4CHcOgQMjO7pN12XEMAHzAYJKC6O
 Mv3yUovldbZsbw8AENvDQuSZYkLXaN3hpmc5YUdJ8BeKVcpJYoFYCFCjFRDGH3l12FwtjJE9ffRu0
 Y0RW/L/e9xOI4ro3VzN+QPzoveQu+XlFaDdCh5Ax4s9ctExPHbtHdsfx4dGItL1e9cfkNKSwhzfxI
 jJXwmcvgZnHCf2zcGD3cWEaURXqAUGu+Is2mxkzj4=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pBzYr-0001W3-II; Sun, 01 Jan 2023 14:43:45 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sun,  1 Jan 2023 14:43:38 +0000
Message-Id: <20230101144339.60307-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230101144339.60307-1-mark.cave-ayland@ilande.co.uk>
References: <20230101144339.60307-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 4/4] target/m68k: fix FPSR quotient byte for frem instruction
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
 target/m68k/fpu_helper.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index 18594a35af..ce6f2cd2b9 100644
--- a/target/m68k/fpu_helper.c
+++ b/target/m68k/fpu_helper.c
@@ -538,14 +538,23 @@ void HELPER(fmod)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 
 void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
+    FPReg fp_quot;
+    float_status fp_status;
+
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
 
-    make_quotient(env, extractFloatx80Sign(res->d),
-                  floatx80_to_int32(res->d, &env->fp_status));
+    make_quotient(env, extractFloatx80Sign(fp_quot.d),
+                  abs(floatx80_to_int32(fp_quot.d, &env->fp_status)));
 }
 
 void HELPER(fgetexp)(CPUM68KState *env, FPReg *res, FPReg *val)
-- 
2.30.2


