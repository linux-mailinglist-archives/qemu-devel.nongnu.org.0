Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C86F687CFA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 13:13:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNYMy-0007Lc-Ph; Thu, 02 Feb 2023 07:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pNYL9-0005q6-Qf
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:05:21 -0500
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pNYL0-0006LX-NX
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Qin9w+15oyeteOuKHsy5z3GGGe0g30C6XP8Kb7XiV4=; b=eTrX3WMPotipZjAI6tw5A5SeB3
 WCbCpZ6vpAPJIclfJROG3dYEgxXAL4712NGZ9gu35mzYxPF+/HwTBhuGB2yPWdZCngU3f0l1OHr5k
 aHJVfZRhiEMCvWRLIXn1XzAOYWtzF3JNU+yvwXZBfcWuOapznAHL2zg9RD0cBI6qLB+U=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Cc: kbastian@mail.uni-paderborn.de, anton.kochkov@proton.me,
 richard.henderson@linaro.org
Subject: [PATCH v2 05/10] target/tricore: Fix RRPW_DEXTR
Date: Thu,  2 Feb 2023 13:04:27 +0100
Message-Id: <20230202120432.1268-6-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202120432.1268-1-kbastian@mail.uni-paderborn.de>
References: <20230202120432.1268-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Source: Intern
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.2.2.115116, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2023.1.24.5960001
X-IMT-Spam-Score: 0.0 ()
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

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
v1 -> v2:
   Use tcg_gen_extract2_tl and remove all special cases.

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


