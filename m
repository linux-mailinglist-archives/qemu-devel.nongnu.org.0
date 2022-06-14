Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EC354B70C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 19:00:23 +0200 (CEST)
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o19tu-0000yu-10
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 13:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o19Rx-0005ZX-JY; Tue, 14 Jun 2022 12:31:29 -0400
Received: from [187.72.171.209] (port=34837 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1o19Rv-0008Tq-U1; Tue, 14 Jun 2022 12:31:29 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 14 Jun 2022 13:31:17 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 0E35D80046B;
 Tue, 14 Jun 2022 13:31:17 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, npiggin@gmail.com,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH RESEND 2/3] target/ppc: Move tlbiel to decode tree
Date: Tue, 14 Jun 2022 13:30:17 -0300
Message-Id: <20220614163018.39819-3-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614163018.39819-1-leandro.lupori@eldorado.org.br>
References: <20220614163018.39819-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 14 Jun 2022 16:31:17.0606 (UTC)
 FILETIME=[2C25B060:01D8800C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Also decode RIC, PRS and R operands.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 target/ppc/insn32.decode                     |  1 +
 target/ppc/translate.c                       | 22 --------------------
 target/ppc/translate/storage-ctrl-impl.c.inc | 16 +++++++++-----
 3 files changed, 12 insertions(+), 27 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 1710babfc4..44ac5f0785 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -793,3 +793,4 @@ XVF64GERNN      111011 ... -- .... 0 ..... 11111010 ..-  @XX3_at xa=%xx_xa_pair
 @X_tlbie        ...... rs:5 - ric:2 prs:1 r:1 rb:5 .......... .     &X_tlbie
 
 TLBIE           011111 ..... - .. . . ..... 0100110010 -            @X_tlbie
+TLBIEL          011111 ..... - .. . . ..... 0100010010 -            @X_tlbie
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index c945ff0362..4fcb311c2d 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5424,26 +5424,6 @@ static void gen_tlbia(DisasContext *ctx)
 #endif  /* defined(CONFIG_USER_ONLY) */
 }
 
-/* tlbiel */
-static void gen_tlbiel(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
-#else
-    bool psr = (ctx->opcode >> 17) & 0x1;
-
-    if (ctx->pr || (!ctx->hv && !psr && ctx->hr)) {
-        /*
-         * tlbiel is privileged except when PSR=0 and HR=1, making it
-         * hypervisor privileged.
-         */
-        GEN_PRIV;
-    }
-
-    gen_helper_tlbie(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
 /* tlbsync */
 static void gen_tlbsync(DisasContext *ctx)
 {
@@ -6901,8 +6881,6 @@ GEN_HANDLER(tlbia, 0x1F, 0x12, 0x0B, 0x03FFFC01, PPC_MEM_TLBIA),
  * XXX Those instructions will need to be handled differently for
  * different ISA versions
  */
-GEN_HANDLER(tlbiel, 0x1F, 0x12, 0x08, 0x001F0001, PPC_MEM_TLBIE),
-GEN_HANDLER_E(tlbiel, 0x1F, 0x12, 0x08, 0x00100001, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(tlbsync, 0x1F, 0x16, 0x11, 0x03FFF801, PPC_MEM_TLBSYNC),
 #if defined(TARGET_PPC64)
 GEN_HANDLER(slbia, 0x1F, 0x12, 0x0F, 0x031FFC01, PPC_SLBI),
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
index 33733c082c..7793297dd4 100644
--- a/target/ppc/translate/storage-ctrl-impl.c.inc
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -46,21 +46,21 @@ static bool do_tlbie(DisasContext *ctx, arg_X_tlbie *a, bool local)
     }
 
     if (ctx->pr) {
-        /* tlbie is privileged... */
+        /* tlbie[l] is privileged... */
         gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
         return true;
     } else if (!ctx->hv) {
-        if (!ctx->gtse || (!a->prs && ctx->hr)) {
+        if ((!a->prs && ctx->hr) || (!local && !ctx->gtse)) {
             /*
-             * ... except when GTSE=0 or when PRS=0 and HR=1, making it
-             * hypervisor privileged.
+             * ... except when PRS=0 and HR=1, or when GTSE=0 for tlbie,
+             * making it hypervisor privileged.
              */
             gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
             return true;
         }
     }
 
-    if (NARROW_MODE(ctx)) {
+    if (!local && NARROW_MODE(ctx)) {
         TCGv t0 = tcg_temp_new();
         tcg_gen_ext32u_tl(t0, cpu_gpr[rb]);
         gen_helper_tlbie(cpu_env, t0);
@@ -68,6 +68,11 @@ static bool do_tlbie(DisasContext *ctx, arg_X_tlbie *a, bool local)
     } else {
         gen_helper_tlbie(cpu_env, cpu_gpr[rb]);
     }
+
+    if (local) {
+        return true;
+    }
+
     t1 = tcg_temp_new_i32();
     tcg_gen_ld_i32(t1, cpu_env, offsetof(CPUPPCState, tlb_need_flush));
     tcg_gen_ori_i32(t1, t1, TLB_NEED_GLOBAL_FLUSH);
@@ -79,3 +84,4 @@ static bool do_tlbie(DisasContext *ctx, arg_X_tlbie *a, bool local)
 }
 
 TRANS_FLAGS(MEM_TLBIE, TLBIE, do_tlbie, false)
+TRANS_FLAGS(MEM_TLBIE, TLBIEL, do_tlbie, true)
-- 
2.25.1


