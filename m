Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0D268EAF7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:16:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgXL-0003OX-Cb; Wed, 08 Feb 2023 04:14:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgXI-0003NS-Mn
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:14:40 -0500
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgXF-0007o5-TP
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:14:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LmqbJNN3BHfoLPQrTp5XuTjtd7FynkXm+VxgO4U2sck=; b=Io3ztjrNooyOJJPPrDVu4Ng1tT
 vjSUlABMWRwFkVDazmsbbduoZk9h++ktmES4coWVhg1CENM/f22YOFslE7yeqndoIXpaY18aXJez2
 FDNb6VO0kGggGOOHECPI4p2e/E6zIjnKFBrvnWGHeLGwovE/HX/x5Um/AGhAThCCx27c=;
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 05/12] target/tricore: Fix RRPW_DEXTR
Date: Wed,  8 Feb 2023 10:14:15 +0100
Message-Id: <20230208091422.1243084-6-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208091422.1243084-1-kbastian@mail.uni-paderborn.de>
References: <20230208091422.1243084-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.2.8.90317, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2023.1.24.5960001
X-Sophos-SenderHistory: ip=84.154.177.181, fs=778824, da=163456740, mc=16, sc=0,
 hc=16, sp=0, fso=778824, re=0, sd=0, hd=0
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::17;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=zuban.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

if we used const16 == 0 we would crash qemu with the error:
../tcg/tcg-op.c:196: tcg_gen_shri_i32: Assertion `arg2 >= 0 && arg2 < 32' failed

This whole instruction can be handled by 'tcg_gen_extract2_tl' which
takes care of this special case as well.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-Id: <20230202120432.1268-6-kbastian@mail.uni-paderborn.de>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/translate.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 6149d4f5c0..3b4ec530b1 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -8706,15 +8706,9 @@ static void decode_32Bit_opc(DisasContext *ctx)
         r2 = MASK_OP_RRPW_S2(ctx->opcode);
         r3 = MASK_OP_RRPW_D(ctx->opcode);
         const16 = MASK_OP_RRPW_POS(ctx->opcode);
-        if (r1 == r2) {
-            tcg_gen_rotli_tl(cpu_gpr_d[r3], cpu_gpr_d[r1], const16);
-        } else {
-            temp = tcg_temp_new();
-            tcg_gen_shli_tl(temp, cpu_gpr_d[r1], const16);
-            tcg_gen_shri_tl(cpu_gpr_d[r3], cpu_gpr_d[r2], 32 - const16);
-            tcg_gen_or_tl(cpu_gpr_d[r3], cpu_gpr_d[r3], temp);
-            tcg_temp_free(temp);
-        }
+
+        tcg_gen_extract2_tl(cpu_gpr_d[r3], cpu_gpr_d[r2], cpu_gpr_d[r1],
+                            32 - const16);
         break;
 /* RRR Format */
     case OPCM_32_RRR_COND_SELECT:
-- 
2.39.1


