Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D5537017A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 21:53:13 +0200 (CEST)
Received: from localhost ([::1]:58278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcZCK-0004o2-7s
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 15:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lcYwy-0005nv-Nn; Fri, 30 Apr 2021 15:37:20 -0400
Received: from [201.28.113.2] (port=1834 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lcYwx-00020c-0I; Fri, 30 Apr 2021 15:37:20 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 30 Apr 2021 16:35:56 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 545738013C2;
 Fri, 30 Apr 2021 16:35:56 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/7] target/ppc: removed VSCR from SPR registration
Date: Fri, 30 Apr 2021 16:35:31 -0300
Message-Id: <20210430193533.82136-6-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 30 Apr 2021 19:35:56.0497 (UTC)
 FILETIME=[0A50CC10:01D73DF8]
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
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
index 67529e8648..b922b04f25 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -941,8 +941,6 @@ static void gen_spr_74xx(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
-    /* Not strictly an SPR */
-    vscr_init(env, 0x00010000);
 }
 
 static void gen_l3_ctrl(CPUPPCState *env)
@@ -5790,6 +5788,7 @@ static void init_proc_7400(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* XXX : not implemented */
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -5869,6 +5868,7 @@ static void init_proc_7410(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* XXX : not implemented */
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -5954,6 +5954,7 @@ static void init_proc_7440(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* XXX : not implemented */
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -6062,6 +6063,7 @@ static void init_proc_7450(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* Level 3 cache control */
     gen_l3_ctrl(env);
     /* L3ITCR1 */
@@ -6196,6 +6198,7 @@ static void init_proc_7445(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* LDSTCR */
     /* XXX : not implemented */
     spr_register(env, SPR_LDSTCR, "LDSTCR",
@@ -6333,6 +6336,7 @@ static void init_proc_7455(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* Level 3 cache control */
     gen_l3_ctrl(env);
     /* LDSTCR */
@@ -6472,6 +6476,7 @@ static void init_proc_7457(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* Level 3 cache control */
     gen_l3_ctrl(env);
     /* L3ITCR1 */
@@ -6635,6 +6640,7 @@ static void init_proc_e600(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* XXX : not implemented */
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -6833,11 +6839,6 @@ static void gen_spr_book3s_altivec(CPUPPCState *env)
                      &spr_read_generic, &spr_write_generic,
                      KVM_REG_PPC_VRSAVE, 0x00000000);
 
-    /*
-     * Can't find information on what this should be on reset.  This
-     * value is the one used by 74xx processors.
-     */
-    vscr_init(env, 0x00010000);
 }
 
 static void gen_spr_book3s_dbg(CPUPPCState *env)
@@ -7457,6 +7458,11 @@ static void init_proc_book3s_common(CPUPPCState *env)
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


