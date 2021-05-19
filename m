Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F40E389115
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:35:26 +0200 (CEST)
Received: from localhost ([::1]:54974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljNID-0001de-6o
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljNCd-0000gK-Ht
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:29:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37852
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljNCY-0008Iy-CS
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:29:39 -0400
Received: from host217-39-58-213.range217-39.btcentralplus.com
 ([217.39.58.213] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljNCR-0003Tz-Ny; Wed, 19 May 2021 15:29:31 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 19 May 2021 15:29:14 +0100
Message-Id: <20210519142917.16693-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210519142917.16693-1-mark.cave-ayland@ilande.co.uk>
References: <20210519142917.16693-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.58.213
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 1/4] target/m68k: introduce is_singlestepping() function
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

The m68k translator currently checks the DisasContextBase singlestep_enabled
boolean directly to determine whether to single-step execution. Soon
single-stepping may also be triggered by setting the appropriate bits in the
SR register so centralise the check into a single is_singlestepping()
function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 target/m68k/translate.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 200018ae6a..c774f2e8f0 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -194,6 +194,17 @@ static void do_writebacks(DisasContext *s)
     }
 }
 
+static bool is_singlestepping(DisasContext *s)
+{
+    /*
+     * Return true if we are singlestepping either because of QEMU gdbstub
+     * singlestep. This does not include the command line '-singlestep' mode
+     * which is rather misnamed as it only means "one instruction per TB" and
+     * doesn't affect the code we generate.
+     */
+    return s->base.singlestep_enabled;
+}
+
 /* is_jmp field values */
 #define DISAS_JUMP      DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_EXIT      DISAS_TARGET_1 /* cpu state was modified dynamically */
@@ -1506,7 +1517,7 @@ static inline bool use_goto_tb(DisasContext *s, uint32_t dest)
 /* Generate a jump to an immediate address.  */
 static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
 {
-    if (unlikely(s->base.singlestep_enabled)) {
+    if (unlikely(is_singlestepping(s))) {
         gen_exception(s, dest, EXCP_DEBUG);
     } else if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
@@ -6245,7 +6256,7 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         break;
     case DISAS_TOO_MANY:
         update_cc_op(dc);
-        if (dc->base.singlestep_enabled) {
+        if (is_singlestepping(dc)) {
             tcg_gen_movi_i32(QREG_PC, dc->pc);
             gen_raise_exception(EXCP_DEBUG);
         } else {
@@ -6254,7 +6265,7 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         break;
     case DISAS_JUMP:
         /* We updated CC_OP and PC in gen_jmp/gen_jmp_im.  */
-        if (dc->base.singlestep_enabled) {
+        if (is_singlestepping(dc)) {
             gen_raise_exception(EXCP_DEBUG);
         } else {
             tcg_gen_lookup_and_goto_ptr();
@@ -6265,7 +6276,7 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
          * We updated CC_OP and PC in gen_exit_tb, but also modified
          * other state that may require returning to the main loop.
          */
-        if (dc->base.singlestep_enabled) {
+        if (is_singlestepping(dc)) {
             gen_raise_exception(EXCP_DEBUG);
         } else {
             tcg_gen_exit_tb(NULL, 0);
-- 
2.20.1


