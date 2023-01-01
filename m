Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1915265AA32
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 15:45:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBzZM-0005b6-0m; Sun, 01 Jan 2023 09:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pBzZC-0005Yu-MH
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 09:44:02 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pBzZB-0003nk-5o
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 09:44:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nqBx6DlYZmEpLa1SeDYg29MssZayZDw/n2W4dexqTSY=; b=cHHsjZ418c0afiTe7l1n+y8BSd
 Z9PHrv0XeqjJbNPs80E4tRfBk3QiHt0KwqAL9oWj6BRs7qiljUoj+/e7k4MZXM+ngzj/7dGXRPMOP
 GaOCYBdZVxVljynJkNS0RztF/9hozGudYJ1I6dm9m3cOUB9RulJ6r5a4GQTgInKbYmM7hJFAJwEOn
 3AIxB/40uNbhA5CIqUK4/aS1cNfFqGfJu9pIPP+hGiiG2iE0mS3TurOBx60jL6KoD9kwjbF/bD5zU
 ZHIX9nYTNXN0rz4KmytuWW4Y7lzOBb85w8yXgbZMSDSFqYQs3f1y9SVEEWo8a30inyxWpMtaJZNqo
 4nN9XIiQqRDYvFfazp+DF19hExEQC4SrQ9F9D+f+gjNE1eJxYwVA0Ign24mc/zA7YyY6QifXCXyYh
 cvCVyBbE+0l96tnXZKLcicq/a7qjGYz2+RAMoAvSYbKRhzfyRYQf9ksjI9bS9T/l7+tCa+qBGu9fc
 5Oe7xFgRaSEo9OzebFgIWX0qL4kshskOQ0meiZDmma5XN8AV99A9YXAnPzhPdVIPrJNxYXbVZegit
 FK4elUe8gGfVuU/hVFIe6eQt8QRGbateQtpw1QnPI4CHUJltllasPCXWB8HDgV8Xv9Pgx42F22mwo
 WUiz4C6irnRaJFomQSHxmGAIsdRUtymjmILYWd9WY=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pBzYn-0001W3-CS; Sun, 01 Jan 2023 14:43:41 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sun,  1 Jan 2023 14:43:37 +0000
Message-Id: <20230101144339.60307-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230101144339.60307-1-mark.cave-ayland@ilande.co.uk>
References: <20230101144339.60307-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 3/4] target/m68k: fix FPSR quotient byte for fmod instruction
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
---
 target/m68k/fpu_helper.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index ae839785fa..18594a35af 100644
--- a/target/m68k/fpu_helper.c
+++ b/target/m68k/fpu_helper.c
@@ -523,14 +523,17 @@ static void make_quotient(CPUM68KState *env, int sign, uint32_t quotient)
 
 void HELPER(fmod)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
-    res->d = floatx80_mod(val1->d, val0->d, &env->fp_status);
+    uint64_t quotient;
+    int sign = extractFloatx80Sign(val1->d) ^ extractFloatx80Sign(val0->d);
+
+    res->d = floatx80_modrem(val1->d, val0->d, true, &quotient,
+                             &env->fp_status);
 
     if (floatx80_is_any_nan(res->d)) {
         return;
     }
 
-    make_quotient(env, extractFloatx80Sign(res->d),
-                  floatx80_to_int32(res->d, &env->fp_status));
+    make_quotient(env, sign, quotient);
 }
 
 void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
-- 
2.30.2


