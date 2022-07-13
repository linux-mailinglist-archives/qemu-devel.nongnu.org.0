Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8495D573BA6
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 19:00:10 +0200 (CEST)
Received: from localhost ([::1]:40354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBfib-00012h-Hi
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 13:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oBfef-0003ZM-6b; Wed, 13 Jul 2022 12:56:05 -0400
Received: from [200.168.210.66] (port=34335 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oBfed-00039g-M5; Wed, 13 Jul 2022 12:56:04 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 13 Jul 2022 13:55:53 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 4FFF28001C2;
 Wed, 13 Jul 2022 13:55:53 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, mst@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, farosas@linux.ibm.com
Subject: [RFC PATCH v3 3/3] target/ppc: Implement hashstp and hashchkp
Date: Wed, 13 Jul 2022 13:54:58 -0300
Message-Id: <20220713165458.58807-4-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713165458.58807-1-victor.colombo@eldorado.org.br>
References: <20220713165458.58807-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Jul 2022 16:55:53.0747 (UTC)
 FILETIME=[69F9AE30:01D896D9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
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

Implementation for instructions hashstp and hashchkp, the privileged
versions of hashst and hashchk, which were added in Power ISA 3.1B.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h                           | 1 +
 target/ppc/cpu_init.c                      | 3 +++
 target/ppc/excp_helper.c                   | 2 ++
 target/ppc/helper.h                        | 2 ++
 target/ppc/insn32.decode                   | 2 ++
 target/ppc/translate/fixedpoint-impl.c.inc | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index f3f98d7a01..e6fc9c41f0 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1678,6 +1678,7 @@ void ppc_compat_add_property(Object *obj, const char *name,
 #define SPR_TIR               (0x1BE)
 #define SPR_PTCR              (0x1D0)
 #define SPR_POWER_HASHKEYR    (0x1D4)
+#define SPR_POWER_HASHPKEYR   (0x1D5)
 #define SPR_BOOKE_SPEFSCR     (0x200)
 #define SPR_Exxx_BBEAR        (0x201)
 #define SPR_Exxx_BBTAR        (0x202)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index a2bbb84d47..3e704304b1 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6493,6 +6493,9 @@ static void init_proc_POWER10(CPUPPCState *env)
     spr_register_kvm(env, SPR_POWER_HASHKEYR, "HASHKEYR",
         SPR_NOACCESS, SPR_NOACCESS, &spr_read_generic, &spr_write_generic,
         KVM_REG_PPC_HASHKEYR, 0x0);
+    spr_register_kvm(env, SPR_POWER_HASHPKEYR, "HASHPKEYR",
+        SPR_NOACCESS, SPR_NOACCESS, &spr_read_generic, &spr_write_generic,
+        KVM_REG_PPC_HASHPKEYR, 0x0);
 
     /* env variables */
     env->dcache_line_size = 128;
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 34893bdf9f..0998e8374e 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2253,6 +2253,8 @@ void helper_##op(CPUPPCState *env, target_ulong ea, target_ulong ra,          \
 
 HELPER_HASH(HASHST, env->spr[SPR_POWER_HASHKEYR], true)
 HELPER_HASH(HASHCHK, env->spr[SPR_POWER_HASHKEYR], false)
+HELPER_HASH(HASHSTP, env->spr[SPR_POWER_HASHPKEYR], true)
+HELPER_HASH(HASHCHKP, env->spr[SPR_POWER_HASHPKEYR], false)
 
 #if !defined(CONFIG_USER_ONLY)
 
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index d455b9d97a..cf68ba458d 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -6,6 +6,8 @@ DEF_HELPER_FLAGS_4(td, TCG_CALL_NO_WG, void, env, tl, tl, i32)
 #endif
 DEF_HELPER_4(HASHST, void, env, tl, tl, tl)
 DEF_HELPER_4(HASHCHK, void, env, tl, tl, tl)
+DEF_HELPER_4(HASHSTP, void, env, tl, tl, tl)
+DEF_HELPER_4(HASHCHKP, void, env, tl, tl, tl)
 #if !defined(CONFIG_USER_ONLY)
 DEF_HELPER_2(store_msr, void, env, tl)
 DEF_HELPER_1(rfi, void, env)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 37ec6b2681..64f92a0524 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -321,6 +321,8 @@ PEXTD           011111 ..... ..... ..... 0010111100 -   @X
 
 HASHST          011111 ..... ..... ..... 1011010010 .   @X_DW
 HASHCHK         011111 ..... ..... ..... 1011110010 .   @X_DW
+HASHSTP         011111 ..... ..... ..... 1010010010 .   @X_DW
+HASHCHKP        011111 ..... ..... ..... 1010110010 .   @X_DW
 
 ## BCD Assist
 
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 41c06de8a2..1ba56cbed5 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -572,3 +572,5 @@ static bool do_hash(DisasContext *ctx, arg_X *a, bool priv,
 
 TRANS(HASHST, do_hash, false, gen_helper_HASHST)
 TRANS(HASHCHK, do_hash, false, gen_helper_HASHCHK)
+TRANS(HASHSTP, do_hash, true, gen_helper_HASHSTP)
+TRANS(HASHCHKP, do_hash, true, gen_helper_HASHCHKP)
-- 
2.25.1


