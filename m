Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C84165D4A7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 14:46:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD468-0000nX-6L; Wed, 04 Jan 2023 08:46:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pD45x-0000lM-MZ
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:46:18 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pD45v-0005k2-Qo
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wDW9JK1AgcVGUr+D3xl31PU0Giu2aBKt72xModsfxWY=; b=m9pCK4s9U3w8OtyygtXoZWKau6
 k7vWGdAMnT5hUW1ozkZwF+qyyinKWvUqKpa5kigDeRr6ACG9GooSe+Cz4wKbp9INFmdzKwKrfESWE
 MRxGiC2psQPaTZWjV887IXOiB1tOOH37jFN0H3K2WDudQs3kGSxrcy5qbJBMwe4MACuB7+kn3zgC0
 fbFLmgA4lAXM1w81EN416RXNEiM4m+TcRI3QupxSrMQJzxYlsiW+qLxTu/TXsmMAeOT5u4o9Z8Ma/
 qp2X+BV2loAKzGJu8pj3DM6Wxr5c48aY3TcI77XcBQcj4yN6j3ml8A5A/vL3SWB4jqv60W2SKN2+u
 AMnSi9hJ8ZFy9t8aoDXQ77jWgRPizujX/DY+tYe6ZIA2c31qU9RZTDfn5FN4s6UruraFzicfy9Zfh
 qYKQqdQ1zhsqD9k8CbcoCUpI66Ia8+nsT9JkUXgWfCSAEV7IZVswAk50K+5w0Qa7W54nBmk4t+yuF
 fdQIl+bFxOsHSsw5ZQRabpye5PCKcc8xvuuZYq5opd2M4+EmPdaMSeliB7SlPwUJzWFS7qWaQ9sOn
 H8MTIqF3bezDEj3BCFG6cs9ntj43zGJDS9P0Jauce2HpFkBWb+p0EeVFgLJG9nO18tB9F0sd42oeK
 u4o0CCM2sFFzxaJgAPGc1j7nqeXiCCvMF2w7zyycg=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pD45X-00099q-Ac; Wed, 04 Jan 2023 13:45:55 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Wed,  4 Jan 2023 13:45:53 +0000
Message-Id: <20230104134554.138012-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104134554.138012-1-mark.cave-ayland@ilande.co.uk>
References: <20230104134554.138012-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 3/4] target/m68k: fix FPSR quotient byte for fmod
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


