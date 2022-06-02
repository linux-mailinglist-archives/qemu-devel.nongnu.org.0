Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC5153B8E7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:21:33 +0200 (CEST)
Received: from localhost ([::1]:54522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwjpU-0001wi-2t
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTV-0000gD-UE
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:49 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:36841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTU-0001F5-8R
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:49 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M1Hi8-1nv5qe0jxC-002oA6; Thu, 02
 Jun 2022 13:58:46 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 15/19] target/m68k: Implement FTRAPcc
Date: Thu,  2 Jun 2022 13:58:33 +0200
Message-Id: <20220602115837.2013918-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BsQvszhiMunhfUGS9kl7E5WtpL9uCiUN+7E2JTwK7APFKVOqxqs
 uXITMBrg8VOWM232q7CMZdo2L8hEUM9AEu8TsYBDGFGYjiqQ3NfWuNw3gJp1TPvw20Jo0GD
 Z94tVjk+0ZpnInJTa0F/ol50Obpz2AaYTazhDDIHJ8t2vKXPmXi5r0XethonHOTPRKKeM3+
 9+7K4fhh8qxPNtXhSEYug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mOYMHOGQ4B4=:TQZWJWYOVJ+uglpJZ3XQWl
 9tiahQdcB3cIf9xPRcA7ABUgTReaWzD60Pit+F/JcQIo6ZqW7m6VGZLqRFlcjtF2nx06cZOnL
 Mx+UYB53ytgS+cT/XPpqZUGUKJK9sper2CPxQQDkfCUojtslWvYfuciupvULCLu/Ohv/xRSaJ
 beFczOhZQA/CR8k4YXaU6IfzEEy1vqsGmgOP8XtwqJkOmGWIYnh4s6Q/sgPmtbVoJHJL2oQu9
 k9scptl5YMIABbSrK86A27MVT701KFPCXHntWrPWXk1h+cSkkVEX6k/Htno85KGjaX60fPRe4
 KHHdJw3fl5pyENNx8AHaIT3lCO2KNBF4f/aTG3sjaYIL8C1LHCk5IwWfSqu59AR+DEb9iJRur
 glxRFUt3WYU4OvAv183SCzL+ZhNbgFkOGMAPgao7NRAhAqR0y13vMWIBHTYYK8fY8iCPGFZF7
 /xTf0NibLoy0n4Xvqq2iorksYWs2tt15BfboDHVWyZwY2bdnLL3ycqnYdIPWHTRb8fBFJY8D1
 u+kwOCYKwD+aobgnR1txuXLuIhsDDvnBkG49I+zMSD4rhCKgp1s/Y//mCZr6xJaCDdh2idCny
 2ELHHUpw7f59QXWliUPMgzgW1/olNHyM/9orikTZdQk1hb29ejzKfqv8GWDfPOKtU61fxoH/N
 a4ovGoGLUvLrxK3PLca+R4NoLk3dypsoKhyZHB2fFhf+psfsk9LYA+TJ8IZfjEmANhDzHHYhr
 q2nOQ1oxfUy1eEDqpDp4KADess/TEAHxmcUiUw==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220602013401.303699-14-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 0dfddaa05628..8f3c298ad04f 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -5566,6 +5566,34 @@ DISAS_INSN(fscc)
     tcg_temp_free(tmp);
 }
 
+DISAS_INSN(ftrapcc)
+{
+    DisasCompare c;
+    uint16_t ext;
+    int cond;
+
+    ext = read_im16(env, s);
+    cond = ext & 0x3f;
+
+    /* Consume and discard the immediate operand. */
+    switch (extract32(insn, 0, 3)) {
+    case 2: /* ftrapcc.w */
+        (void)read_im16(env, s);
+        break;
+    case 3: /* ftrapcc.l */
+        (void)read_im32(env, s);
+        break;
+    case 4: /* ftrapcc (no operand) */
+        break;
+    default:
+        /* ftrapcc registered with only valid opmodes */
+        g_assert_not_reached();
+    }
+
+    gen_fcc_cond(&c, s, cond);
+    do_trapcc(s, &c);
+}
+
 #if defined(CONFIG_SOFTMMU)
 DISAS_INSN(frestore)
 {
@@ -6192,6 +6220,8 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(fbcc,      f280, ffc0, CF_FPU);
     INSN(fpu,       f200, ffc0, FPU);
     INSN(fscc,      f240, ffc0, FPU);
+    INSN(ftrapcc,   f27a, fffe, FPU);       /* opmode 010, 011 */
+    INSN(ftrapcc,   f27c, ffff, FPU);       /* opmode 100 */
     INSN(fbcc,      f280, ff80, FPU);
 #if defined(CONFIG_SOFTMMU)
     INSN(frestore,  f340, ffc0, CF_FPU);
-- 
2.36.1


