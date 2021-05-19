Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9E138910A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:34:49 +0200 (CEST)
Received: from localhost ([::1]:53616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljNHc-0000kF-3j
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljNCe-0000iW-EN
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:29:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37862
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljNCY-0008Je-Dl
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:29:40 -0400
Received: from host217-39-58-213.range217-39.btcentralplus.com
 ([217.39.58.213] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljNCW-0003Tz-A8; Wed, 19 May 2021 15:29:32 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 19 May 2021 15:29:16 +0100
Message-Id: <20210519142917.16693-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210519142917.16693-1-mark.cave-ayland@ilande.co.uk>
References: <20210519142917.16693-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.58.213
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 3/4] target/m68k: introduce gen_singlestep_exception() function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a new gen_singlestep_exception() function to be called when generating
the EXCP_DEBUG exception in single-step mode rather than calling
gen_raise_exception(EXCP_DEBUG) directly. This allows for the single-step
exception behaviour for all callers to be managed in a single place.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 target/m68k/translate.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index f14ecab5a5..10e8aba42e 100644
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
2.20.1


