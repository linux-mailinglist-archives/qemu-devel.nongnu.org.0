Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D7133A523
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 15:01:37 +0100 (CET)
Received: from localhost ([::1]:57246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLRJI-0007wF-6U
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 10:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lLRF7-0003Im-LY
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 09:57:17 -0400
Received: from shirlock.uni-paderborn.de ([2001:638:502:c003::15]:36904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lLRF5-00037R-Vb
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 09:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3aSRTte9ZULWzk/90FhqfstR77buAGw2N/S+ncvPqJo=; b=l2J5qIQzJJu0Wbp3NazzSCLOjG
 JLS3XroX3itBZF8HEcA+KWCqXlzt1VCGZFaKfK8VDnA2T8r6m4ZkO9ojMBWieLOryrGGRACbKrLi0
 +dTCXkN/oVZqfW0rkCway/jiP52rS53wQijmuLjrleqAnw9RrS6MoVrAd6ircfuk/lbA=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] target/tricore: Fix imask OPC2_32_RRPW_IMASK for r3+1 == r2
Date: Sun, 14 Mar 2021 14:55:12 +0100
Message-Id: <20210314135513.1369871-7-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210314135513.1369871-1-kbastian@mail.uni-paderborn.de>
References: <20210314135513.1369871-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.14.134815, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.3.13.5800002
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=31367616, da=103339297,
 mc=573, sc=4, hc=569, sp=0, fso=31367616, re=0, sd=0, hd=0
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::15;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=shirlock.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: kbastian@mail.uni-paderborn.de,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

if r3+1 and r2 are the same then we would overwrite r2 with our first
move and use the wrong result for the shift. Thus we store the result
from the mov in a temp.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/translate.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index ebeddf8f4a..5b7ed70e39 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -6989,6 +6989,7 @@ static void decode_rrpw_extract_insert(DisasContext *ctx)
     uint32_t op2;
     int r1, r2, r3;
     int32_t pos, width;
+    TCGv temp;
 
     op2 = MASK_OP_RRPW_OP2(ctx->opcode);
     r1 = MASK_OP_RRPW_S1(ctx->opcode);
@@ -7021,10 +7022,15 @@ static void decode_rrpw_extract_insert(DisasContext *ctx)
         break;
     case OPC2_32_RRPW_IMASK:
         CHECK_REG_PAIR(r3);
+
         if (pos + width <= 32) {
-            tcg_gen_movi_tl(cpu_gpr_d[r3+1], ((1u << width) - 1) << pos);
+            temp = tcg_temp_new();
+            tcg_gen_movi_tl(temp, ((1u << width) - 1) << pos);
             tcg_gen_shli_tl(cpu_gpr_d[r3], cpu_gpr_d[r2], pos);
+            tcg_gen_mov_tl(cpu_gpr_d[r3 + 1], temp);
+            tcg_temp_free(temp);
         }
+
         break;
     case OPC2_32_RRPW_INSERT:
         if (pos + width <= 32) {
-- 
2.30.1


