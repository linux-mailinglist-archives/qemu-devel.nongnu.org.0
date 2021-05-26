Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688F8392140
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:06:03 +0200 (CEST)
Received: from localhost ([::1]:55094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llzmt-00021M-QF
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1llzf5-0004IE-DN
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:57:51 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:42993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1llzf3-0006Z0-Dm
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:57:51 -0400
Received: from quad ([82.142.6.50]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N7iT4-1lPMUb0aI6-014kA4; Wed, 26
 May 2021 21:57:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] target/m68k: introduce gen_singlestep_exception() function
Date: Wed, 26 May 2021 21:57:43 +0200
Message-Id: <20210526195744.227346-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526195744.227346-1-laurent@vivier.eu>
References: <20210526195744.227346-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Y/+u/ORQpiW5R4bjfub+Yh3AbZsEEppRfPWNnqAjZSJH9NV2/p5
 7X/ykCIXXTAy1Z7/+XbKNG1NVlT34DzKHgnIuMDRSki5nVc5d+bOdaul+Sj/ETmnH9VuAxV
 xqOGfpzkcpncOwoxUXxgNtkfged5pqPAp+wymMj6m08zUO+WcaQSwJ0uFW/eFSqu0TcXVfe
 KegefYTuJYzW/OcLAbqug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PEZdLa43wkk=:Bm0/64PwzLlDhRESgnGGQs
 Ao8KmJeTLHcN8QLJjMYgFqco5z/KVwi6pkNx/asfS+w6mEIEA14P6U3bSCmte9ei7khWxV7Ng
 lsWdUxCtd9e+QBQtWzHtd1mnpSzFJ9GaXPq2hIyPg1L3ZfW8JrOQ2JBZS2x7l2W/aAbI95Uvr
 /ETv4/1O4fpAqpOK8T5i+8BRcff8hERRxlfVQShx8I6xNBE7d23BNcme1WfalTQI21OAl5TLt
 h7hZsy+7ouMpktTZPznX02SFV4lXkaWfW7KqiAzBl5Obyszli0fOHmW8zxYxMr1z+smd8Qmtf
 4nSgHJ/ZV1RWj/s2sMW0dhEsEInJZoyRZV1hW5+/APQXatVH5PwShO6+/5sn43HLA0qjZUvnY
 W9lBdJA3aKMkPiPXDbJMKvB4PdNWPQvtRsL8BXT2w4o8Gh+owNEIpCMc6y8MEzwJcEdWCmZer
 2GdHctDtHQPeVLYiwFxEw84TKYIxCLtVR/V9Jiti9Bl+TEYr3MAIfqjvL2T5x/zmXunxuvLZZ
 MKIE8MERPuK6W87+IDh39A=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Introduce a new gen_singlestep_exception() function to be called when generating
the EXCP_DEBUG exception in single-step mode rather than calling
gen_raise_exception(EXCP_DEBUG) directly. This allows for the single-step
exception behaviour for all callers to be managed in a single place.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210519142917.16693-4-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index f14ecab5a502..10e8aba42e42 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -319,6 +319,15 @@ static void gen_exception(DisasContext *s, uint32_t dest, int nr)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
+static void gen_singlestep_exception(DisasContext *s)
+{
+    /*
+     * Generate the right kind of exception for singlestep, which is
+     * EXCP_DEBUG for QEMU's gdb singlestepping.
+     */
+    gen_raise_exception(EXCP_DEBUG);
+}
+
 static inline void gen_addr_fault(DisasContext *s)
 {
     gen_exception(s, s->base.pc_next, EXCP_ADDRESS);
@@ -1520,7 +1529,7 @@ static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
     if (unlikely(is_singlestepping(s))) {
         update_cc_op(s);
         tcg_gen_movi_i32(QREG_PC, dest);
-        gen_raise_exception(EXCP_DEBUG);
+        gen_singlestep_exception(s);
     } else if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(QREG_PC, dest);
@@ -6260,7 +6269,7 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         update_cc_op(dc);
         if (is_singlestepping(dc)) {
             tcg_gen_movi_i32(QREG_PC, dc->pc);
-            gen_raise_exception(EXCP_DEBUG);
+            gen_singlestep_exception(dc);
         } else {
             gen_jmp_tb(dc, 0, dc->pc);
         }
@@ -6268,7 +6277,7 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     case DISAS_JUMP:
         /* We updated CC_OP and PC in gen_jmp/gen_jmp_im.  */
         if (is_singlestepping(dc)) {
-            gen_raise_exception(EXCP_DEBUG);
+            gen_singlestep_exception(dc);
         } else {
             tcg_gen_lookup_and_goto_ptr();
         }
@@ -6279,7 +6288,7 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
          * other state that may require returning to the main loop.
          */
         if (is_singlestepping(dc)) {
-            gen_raise_exception(EXCP_DEBUG);
+            gen_singlestep_exception(dc);
         } else {
             tcg_gen_exit_tb(NULL, 0);
         }
-- 
2.31.1


