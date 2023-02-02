Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C45687CEB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 13:09:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNYMV-0006Q7-I1; Thu, 02 Feb 2023 07:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pNYL9-0005pz-Ox
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:05:21 -0500
Received: from hoth.uni-paderborn.de ([2001:638:502:c003::19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pNYL3-0006Mm-Lo
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:05:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F0wKnLydI5seausjnFJwsIDVIHSoLU8vXKTNm7qc/70=; b=hdAtgvw8BcG7IhaWOd1AduaKe9
 IyY2rMx3TBq/gJDs+lyah5Ev63tKLJuzhDMLZhLMLeNUHMtQbTJUPuIBcyWidY3pVGDJA/iTBX536
 Yg4mE+G4UDx5BDSR4gfb+DmbvXY9VmimjrzSnhJG4ovTZ4Jh9FtypXPBiiOL17k3Pv1M=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Cc: kbastian@mail.uni-paderborn.de, anton.kochkov@proton.me,
 richard.henderson@linaro.org
Subject: [PATCH v2 07/10] target/tricore: Fix OPC2_32_RRRR_DEXTR
Date: Thu,  2 Feb 2023 13:04:29 +0100
Message-Id: <20230202120432.1268-8-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202120432.1268-1-kbastian@mail.uni-paderborn.de>
References: <20230202120432.1268-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Source: Intern
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.2.2.115116, AntiVirus-Engine: 5.97.0,
 AntiVirus-Data: 2023.2.1.5970001
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::19;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=hoth.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
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

if cpu_gpr_d[r3] == 0 then we were shifting the lower register to the
right by 32 which is undefined behaviour. In this case the TriCore would
do nothing an just return the higher register cpu_reg_d[r1]. We fixed
that by detecting whether cpu_gpr_d[r3] was zero and cleared the lower
register.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
v1 -> v2:
  - use tcg_constant_tl(0) for TCGv zero
  - add extra line on top of comment

 target/tricore/translate.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 3b4ec530b1..8bf78b46d0 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -8245,10 +8245,19 @@ static void decode_rrrr_extract_insert(DisasContext *ctx)
         if (r1 == r2) {
             tcg_gen_rotl_tl(cpu_gpr_d[r4], cpu_gpr_d[r1], tmp_pos);
         } else {
+            TCGv msw = tcg_temp_new();
+            TCGv zero = tcg_constant_tl(0);
             tcg_gen_shl_tl(tmp_width, cpu_gpr_d[r1], tmp_pos);
-            tcg_gen_subfi_tl(tmp_pos, 32, tmp_pos);
-            tcg_gen_shr_tl(tmp_pos, cpu_gpr_d[r2], tmp_pos);
-            tcg_gen_or_tl(cpu_gpr_d[r4], tmp_width, tmp_pos);
+            tcg_gen_subfi_tl(msw, 32, tmp_pos);
+            tcg_gen_shr_tl(msw, cpu_gpr_d[r2], msw);
+            /*
+             * if pos == 0, then we do cpu_gpr_d[r2] << 32, which is undefined
+             * behaviour. So check that case here and set the low bits to zero
+             * which effectivly returns cpu_gpr_d[r1]
+             */
+            tcg_gen_movcond_tl(TCG_COND_EQ, msw, tmp_pos, zero, zero, msw);
+            tcg_gen_or_tl(cpu_gpr_d[r4], tmp_width, msw);
+            tcg_temp_free(msw);
         }
         break;
     case OPC2_32_RRRR_EXTR:
-- 
2.39.1


