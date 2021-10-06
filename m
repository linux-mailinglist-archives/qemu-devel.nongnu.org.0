Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D95424923
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 23:44:10 +0200 (CEST)
Received: from localhost ([::1]:52154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYEht-00063y-FB
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 17:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETe-0007xc-EP; Wed, 06 Oct 2021 17:29:27 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETc-0007x1-NA; Wed, 06 Oct 2021 17:29:26 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 376DB4101C;
 Wed,  6 Oct 2021 23:29:23 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 1FB8F60066;
 Wed,  6 Oct 2021 23:29:23 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id E067714005C;
 Wed,  6 Oct 2021 23:29:22 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 04/27] target/riscv: array for the 64 upper bits of 128-bit
 registers
Date: Wed,  6 Oct 2021 23:28:10 +0200
Message-Id: <20211006212833.108706-5-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: bin.meng@windriver.com, richard.henderson@linaro.org,
 alistair.francis@wdc.com, fabien.portas@grenoble-inp.org, palmer@dabbelt.com,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The upper 64-bit of the 128-bit registers have now a place inside
the cpu state structure, and are created as globals for future use.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/cpu.h       | 3 +++
 target/riscv/translate.c | 6 +++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0c41b60b25..1de9a1286b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -120,6 +120,7 @@ FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
 
 struct CPURISCVState {
     target_ulong gpr[32];
+    target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
     uint64_t fpr[32]; /* assume both F and D extensions */
 
     /* vector coprocessor state. */
@@ -405,6 +406,8 @@ FIELD(TB_FLAGS, VILL, 8, 1)
 FIELD(TB_FLAGS, HLSX, 9, 1)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env);
+bool riscv_cpu_is_64bit(CPURISCVState *env);
+bool riscv_cpu_is_128bit(CPURISCVState *env);
 
 /*
  * A simplification for VLMAX
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c04430805e..3c929ce960 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -32,7 +32,7 @@
 #include "instmap.h"
 
 /* global register indices */
-static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
+static TCGv cpu_gpr[32], cpu_gprh[32], cpu_pc, cpu_vl;
 static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
 static TCGv load_res;
 static TCGv load_val;
@@ -55,6 +55,7 @@ typedef struct DisasContext {
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
     target_ulong priv_ver;
+    /* Type of csrs should be MXLEN, that might be dynamically settable */
     target_ulong misa;
     uint64_t misah;
     uint32_t opcode;
@@ -658,10 +659,13 @@ void riscv_translate_init(void)
      * unless you specifically block reads/writes to reg 0.
      */
     cpu_gpr[0] = NULL;
+    cpu_gprh[0] = NULL;
 
     for (i = 1; i < 32; i++) {
         cpu_gpr[i] = tcg_global_mem_new(cpu_env,
             offsetof(CPURISCVState, gpr[i]), riscv_int_regnames[i]);
+        cpu_gprh[i] = tcg_global_mem_new(cpu_env,
+            offsetof(CPURISCVState, gprh[i]), riscv_int_regnames[i]);
     }
 
     for (i = 0; i < 32; i++) {
-- 
2.33.0


