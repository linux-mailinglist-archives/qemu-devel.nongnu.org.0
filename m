Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F9DB1B7D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 12:22:26 +0200 (CEST)
Received: from localhost ([::1]:42070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8ihe-0004TT-J9
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 06:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33478)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>) id 1i8idl-0001ug-KH
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:17:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <svens@stackframe.org>) id 1i8idk-00017b-Hc
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:17:21 -0400
Received: from smtp.duncanthrax.net ([2001:470:70c5:1111::170]:37433)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <svens@stackframe.org>)
 id 1i8idk-00016c-4o
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:17:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=rLxnUY3AYptsanaaX1mTCGsmgfgbQ+joD3j3C+qK/Eo=; b=e8aaEhebTI3lacJp0iah/odS41
 ktX1O7fw74vtxLc286L1uN4cfPs1ziGI+gWvW1tjyLxiSwZeiY74Y5nI4T19YEGUJNa8GsvRe2Tpl
 k+8kSeqE8WnxaoOxeQkFIGUQiZqpiYCFo1vAkFvr/RYgqCWde6iauKEcT3/qwF3s/Z8o=;
Received: from hsi-kbw-046-005-233-221.hsi8.kabel-badenwuerttemberg.de
 ([46.5.233.221] helo=x280.stackframe.org)
 by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <svens@stackframe.org>)
 id 1i8idi-00076C-9R; Fri, 13 Sep 2019 12:17:18 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Richard Henderson <richard.henderson@linaro.org>
Date: Fri, 13 Sep 2019 12:17:14 +0200
Message-Id: <20190913101714.29019-3-svens@stackframe.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190913101714.29019-1-svens@stackframe.org>
References: <20190913101714.29019-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:470:70c5:1111::170
Subject: [Qemu-devel] [PATCH 2/2] target/hppa: prevent trashing of temporary
 in do_depw_sar()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>,
 qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

nullify_over() calls brcond which destroys all temporaries.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 target/hppa/translate.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index b12525d535..c1b2822f60 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -3404,10 +3404,6 @@ static bool do_depw_sar(DisasContext *ctx, unsigned rt, unsigned c,
     TCGv_reg mask, tmp, shift, dest;
     unsigned msb = 1U << (len - 1);
 
-    if (c) {
-        nullify_over(ctx);
-    }
-
     dest = dest_gpr(ctx, rt);
     shift = tcg_temp_new();
     tmp = tcg_temp_new();
@@ -3440,11 +3436,17 @@ static bool do_depw_sar(DisasContext *ctx, unsigned rt, unsigned c,
 
 static bool trans_depw_sar(DisasContext *ctx, arg_depw_sar *a)
 {
+    if (a->c) {
+        nullify_over(ctx);
+    }
     return do_depw_sar(ctx, a->t, a->c, a->nz, a->clen, load_gpr(ctx, a->r));
 }
 
 static bool trans_depwi_sar(DisasContext *ctx, arg_depwi_sar *a)
 {
+    if (a->c) {
+        nullify_over(ctx);
+    }
     return do_depw_sar(ctx, a->t, a->c, a->nz, a->clen, load_const(ctx, a->i));
 }
 
-- 
2.23.0.rc1


