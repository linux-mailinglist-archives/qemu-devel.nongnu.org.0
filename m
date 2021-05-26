Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750C839213A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:01:48 +0200 (CEST)
Received: from localhost ([::1]:50134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llzit-0006yY-Ci
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1llzf4-0004GI-Gs
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:57:50 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:37773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1llzf2-0006YH-KD
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:57:50 -0400
Received: from quad ([82.142.6.50]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MwfrG-1lVzGq0o4Q-00y6KW; Wed, 26
 May 2021 21:57:46 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] target/m68k: introduce is_singlestepping() function
Date: Wed, 26 May 2021 21:57:41 +0200
Message-Id: <20210526195744.227346-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526195744.227346-1-laurent@vivier.eu>
References: <20210526195744.227346-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:M899fsS/0WPY6+ZeyunWSnsP6eWaddkT9pIE3Pj+FOLlZkXUmXo
 gu7ZICczXGeqi6ATqZIrO6W3MpCWEgEyYU/VRLQIWEGUnFMV4f9mygPn2Khu+RE3+3il0VX
 nhw/rqUrc/oIcDnVmb/LbuAV/Vh17h9yzQ75TMWsbfgZT9U762+jIwaEGqhewW55xqNXUpY
 LKaUNOhYqHih2d68iSNAQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OFCNXIeH8Q8=:ug5bacnmyX++xUBvcKq8gx
 QEdYpT6Ue0EmvL0gpAN9AgsnezYr4CAeqObod7sKE7D/Xl/E9Z5NQtNBM5as+f5/AiGUA+W1d
 DIo1aEUeAudEhhFDoXkWqwdykjZfv8nJse2ObP1jhd0OrNs5NxatxFCMExKKkpg3RvzXzd5lH
 +Ke7ewQEX9Ul2TV6yXLJN4AOrcxbOCuJU0MlECaxvzt1VN/8DtCxMjds2uD/H0p+8rYzN5vPH
 SpxcX/LK4y6xPntwUgqlWYjZvy0rF8f5ysli/gK8I5YAv6b60e5ZVQ0WRynSrHoBr60A7Ad9G
 rZ2rkGaJldpNDBUgWWj5p9b5ghDtma4jWiVg/jkdnZBCdYExbcd8j+UuRjykkAvLnhF6HxfOO
 djODUcNfE8vURIShkx34Xgxl8bfuHnbqUbzYgisher5LyUkCd4YwmQdJnbrBeyNjeg9nzpwqn
 VXpPUDJYozMUO9JYZLwWiN8Xx4VfI3pFh0qBMpy6CHdWgN0/0F9mSMjKPcSy8Vpzfp76FbVXR
 RlVGZSP2B9ucRgIvtVS6M8=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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

The m68k translator currently checks the DisasContextBase singlestep_enabled
boolean directly to determine whether to single-step execution. Soon
single-stepping may also be triggered by setting the appropriate bits in the
SR register so centralise the check into a single is_singlestepping()
function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210519142917.16693-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 200018ae6a63..c774f2e8f0fc 100644
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
2.31.1


