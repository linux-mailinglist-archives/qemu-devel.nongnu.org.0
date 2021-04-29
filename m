Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C996E36EE73
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 18:56:30 +0200 (CEST)
Received: from localhost ([::1]:53744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc9xl-0001Ps-1q
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 12:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lc9RX-0004gQ-Sa; Thu, 29 Apr 2021 12:23:11 -0400
Received: from [201.28.113.2] (port=34399 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lc9RW-0004Gz-9F; Thu, 29 Apr 2021 12:23:11 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 29 Apr 2021 13:21:39 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 177CB80134B;
 Thu, 29 Apr 2021 13:21:39 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] target/ppc: removed VSCR from SPR registration
Date: Thu, 29 Apr 2021 13:21:28 -0300
Message-Id: <20210429162130.2412-6-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 29 Apr 2021 16:21:39.0243 (UTC)
 FILETIME=[BBA33FB0:01D73D13]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since vscr is not an spr, its initialization was removed from the
spr registration functions, and moved to the relevant init_procs.

We may look into adding vscr to the reset path instead of the init
path (as suggested by David Gibson), but this looked like a good
enough solution for now.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/translate_init.c.inc | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index f809941c5e..f470a8533e 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -938,8 +938,6 @@ static void gen_spr_74xx(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
-    /* Not strictly an SPR */
-    vscr_init(env, 0x00010000);
 }
 
 static void gen_l3_ctrl(CPUPPCState *env)
@@ -5787,6 +5785,7 @@ static void init_proc_7400(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* XXX : not implemented */
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -5866,6 +5865,7 @@ static void init_proc_7410(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* XXX : not implemented */
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -5951,6 +5951,7 @@ static void init_proc_7440(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* XXX : not implemented */
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -6059,6 +6060,7 @@ static void init_proc_7450(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* Level 3 cache control */
     gen_l3_ctrl(env);
     /* L3ITCR1 */
@@ -6193,6 +6195,7 @@ static void init_proc_7445(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* LDSTCR */
     /* XXX : not implemented */
     spr_register(env, SPR_LDSTCR, "LDSTCR",
@@ -6330,6 +6333,7 @@ static void init_proc_7455(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* Level 3 cache control */
     gen_l3_ctrl(env);
     /* LDSTCR */
@@ -6469,6 +6473,7 @@ static void init_proc_7457(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* Level 3 cache control */
     gen_l3_ctrl(env);
     /* L3ITCR1 */
@@ -6632,6 +6637,7 @@ static void init_proc_e600(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* XXX : not implemented */
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -6830,11 +6836,6 @@ static void gen_spr_book3s_altivec(CPUPPCState *env)
                      &spr_read_generic, &spr_write_generic,
                      KVM_REG_PPC_VRSAVE, 0x00000000);
 
-    /*
-     * Can't find information on what this should be on reset.  This
-     * value is the one used by 74xx processors.
-     */
-    vscr_init(env, 0x00010000);
 }
 
 static void gen_spr_book3s_dbg(CPUPPCState *env)
@@ -7454,6 +7455,11 @@ static void init_proc_book3s_common(CPUPPCState *env)
     gen_spr_book3s_pmu_sup(env);
     gen_spr_book3s_pmu_user(env);
     gen_spr_book3s_ctrl(env);
+    /*
+     * Can't find information on what this should be on reset.  This
+     * value is the one used by 74xx processors.
+     */
+    vscr_init(env, 0x00010000);
 }
 
 static void init_proc_970(CPUPPCState *env)
-- 
2.17.1


