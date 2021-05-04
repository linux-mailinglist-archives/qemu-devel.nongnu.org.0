Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E633725F6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:51:54 +0200 (CEST)
Received: from localhost ([::1]:52424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldouP-0007iZ-4g
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo1M-00074b-OB; Tue, 04 May 2021 01:55:00 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:56577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo1J-0005MQ-7a; Tue, 04 May 2021 01:55:00 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CQ1hJWz9t1Q; Tue,  4 May 2021 15:53:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107602;
 bh=jG3g9nrbM97zf6opwX6YAOoU0AMO/h9BaoJzHVwrdp4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IPWEpiyyzIshlUuWlP5nP6BF6FcmKGFITYlT4gbs2m/vABLow8EKhFmulPTSf7jmS
 fo5eQ1wPH5H6g5dG/OnBTtmFrESKXPVzn69eArc/JXt2O4lWAkeQhST75O/0HjftHE
 KOzqWwEyc0k+tjHwwMVRaq/ElwR0h+qcJTK/AaSU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 43/46] target/ppc: removed VSCR from SPR registration
Date: Tue,  4 May 2021 15:53:09 +1000
Message-Id: <20210504055312.306823-44-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Since vscr is not an spr, its initialization was removed from the
spr registration functions, and moved to the relevant init_procs.

We may look into adding vscr to the reset path instead of the init
path (as suggested by David Gibson), but this looked like a good
enough solution for now.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210430193533.82136-6-bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate_init.c.inc | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 5cee94f16d..66e6a4a746 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -1693,8 +1693,6 @@ static void gen_spr_74xx(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
-    /* Not strictly an SPR */
-    vscr_init(env, 0x00010000);
 }
 
 static void gen_l3_ctrl(CPUPPCState *env)
@@ -6618,6 +6616,7 @@ static void init_proc_7400(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* XXX : not implemented */
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -6697,6 +6696,7 @@ static void init_proc_7410(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* XXX : not implemented */
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -6782,6 +6782,7 @@ static void init_proc_7440(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* XXX : not implemented */
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -6890,6 +6891,7 @@ static void init_proc_7450(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* Level 3 cache control */
     gen_l3_ctrl(env);
     /* L3ITCR1 */
@@ -7024,6 +7026,7 @@ static void init_proc_7445(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* LDSTCR */
     /* XXX : not implemented */
     spr_register(env, SPR_LDSTCR, "LDSTCR",
@@ -7161,6 +7164,7 @@ static void init_proc_7455(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* Level 3 cache control */
     gen_l3_ctrl(env);
     /* LDSTCR */
@@ -7300,6 +7304,7 @@ static void init_proc_7457(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* Level 3 cache control */
     gen_l3_ctrl(env);
     /* L3ITCR1 */
@@ -7463,6 +7468,7 @@ static void init_proc_e600(CPUPPCState *env)
     gen_tbl(env);
     /* 74xx specific SPR */
     gen_spr_74xx(env);
+    vscr_init(env, 0x00010000);
     /* XXX : not implemented */
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
@@ -7713,11 +7719,6 @@ static void gen_spr_book3s_altivec(CPUPPCState *env)
                      &spr_read_generic, &spr_write_generic,
                      KVM_REG_PPC_VRSAVE, 0x00000000);
 
-    /*
-     * Can't find information on what this should be on reset.  This
-     * value is the one used by 74xx processors.
-     */
-    vscr_init(env, 0x00010000);
 }
 
 static void gen_spr_book3s_dbg(CPUPPCState *env)
@@ -8415,6 +8416,11 @@ static void init_proc_book3s_common(CPUPPCState *env)
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
2.31.1


