Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946E2B1B7E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 12:22:38 +0200 (CEST)
Received: from localhost ([::1]:42090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8iir-0005hL-Lt
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 06:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>) id 1i8idl-0001ub-IA
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:17:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <svens@stackframe.org>) id 1i8idk-00017W-HI
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:17:21 -0400
Received: from smtp.duncanthrax.net ([2001:470:70c5:1111::170]:34320)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <svens@stackframe.org>)
 id 1i8idk-00016Z-4r
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 06:17:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=T/vNNqU0upqf6XS8y3LAK1FXx4ffxM5S3CP1z6fMnmY=; b=abXFPUv6TCqp3euC+Q4KkuEUp/
 KunwgUXhS8IF6fMs5ownTLORWzMh+FwNDXm9nGPxf3KeyYQF4GkPi8Ts8qfAOXbrMD+oka/P5ECce
 T20WJwtgnRdklkgrci0HxDx3NBiBIuVut59sYz1hI9kWsZYjGX1zy2g2P36a8au6HmeE=;
Received: from hsi-kbw-046-005-233-221.hsi8.kabel-badenwuerttemberg.de
 ([46.5.233.221] helo=x280.stackframe.org)
 by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <svens@stackframe.org>)
 id 1i8idi-00076C-2H; Fri, 13 Sep 2019 12:17:18 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Richard Henderson <richard.henderson@linaro.org>
Date: Fri, 13 Sep 2019 12:17:13 +0200
Message-Id: <20190913101714.29019-2-svens@stackframe.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190913101714.29019-1-svens@stackframe.org>
References: <20190913101714.29019-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:470:70c5:1111::170
Subject: [Qemu-devel] [PATCH 1/2] target/hppa: prevent trashing of temporary
 in trans_mtctl()
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
 target/hppa/translate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 53e17d8963..b12525d535 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -2214,10 +2214,11 @@ static bool trans_mtsp(DisasContext *ctx, arg_mtsp *a)
 static bool trans_mtctl(DisasContext *ctx, arg_mtctl *a)
 {
     unsigned ctl = a->t;
-    TCGv_reg reg = load_gpr(ctx, a->r);
+    TCGv_reg reg;
     TCGv_reg tmp;
 
     if (ctl == CR_SAR) {
+        reg = load_gpr(ctx, a->r);
         tmp = tcg_temp_new();
         tcg_gen_andi_reg(tmp, reg, TARGET_REGISTER_BITS - 1);
         save_or_nullify(ctx, cpu_sar, tmp);
@@ -2232,6 +2233,8 @@ static bool trans_mtctl(DisasContext *ctx, arg_mtctl *a)
 
 #ifndef CONFIG_USER_ONLY
     nullify_over(ctx);
+    reg = load_gpr(ctx, a->r);
+
     switch (ctl) {
     case CR_IT:
         gen_helper_write_interval_timer(cpu_env, reg);
-- 
2.23.0.rc1


