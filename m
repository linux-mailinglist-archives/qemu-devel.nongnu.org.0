Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD3647323C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 17:50:46 +0100 (CET)
Received: from localhost ([::1]:48300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwoXF-0006QO-Dh
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 11:50:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mwoLi-00032C-1R; Mon, 13 Dec 2021 11:38:50 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:46702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mwoLf-0003Ze-QG; Mon, 13 Dec 2021 11:38:49 -0500
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id BD11A402D6;
 Mon, 13 Dec 2021 17:38:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1639413520;
 bh=DaIEmbnr7XQLW570vwc91TIgEcWRPDHy81WjU9BMsXE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fgd1czaPpKgim0MH2GREf4AGGOIOr75vtmJyfmd7TkUWDLa4TgcK1VsP1pLdYNbaK
 2WNFIoWZeTmQxbABY/Q+1Uwp4M5IrSabDdqnDcxZj6fLH1/qf0iRloCFPakzYR6IQI
 vcSdrBYYoCUoJuuMwvz/IczjRUD0sIyDRPnIPy2a1InYuEO+ef2iPd7iyW8qktz4SF
 EoxD0S13sOGGE8Wd9JQ0kFNxr64DprP1OsLvxQROFqIA9Upe33dc+H6+0pjtRF07qw
 E6C6OC0FtxJoqKLnhyjvP5BpllvfXXneQUnvgAiXKmCmwnct3UbZHRIiSkcwjBIQpZ
 VB3oG8p1YtDzQ==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id A4EAB60071;
 Mon, 13 Dec 2021 17:38:40 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 7267A14005C;
 Mon, 13 Dec 2021 17:38:40 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 06/18] target/riscv: array for the 64 upper bits of 128-bit
 registers
Date: Mon, 13 Dec 2021 17:38:22 +0100
Message-Id: <20211213163834.170504-7-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h       |  2 ++
 target/riscv/cpu.c       |  9 +++++++++
 target/riscv/machine.c   | 20 ++++++++++++++++++++
 target/riscv/translate.c |  5 ++++-
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0760c0af93..53a295efb7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -110,6 +110,7 @@ FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
 
 struct CPURISCVState {
     target_ulong gpr[32];
+    target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
     uint64_t fpr[32]; /* assume both F and D extensions */
 
     /* vector coprocessor state. */
@@ -339,6 +340,7 @@ static inline bool riscv_feature(CPURISCVState *env, int feature)
 #include "cpu_user.h"
 
 extern const char * const riscv_int_regnames[];
+extern const char * const riscv_int_regnamesh[];
 extern const char * const riscv_fpr_regnames[];
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f812998123..364140f5ff 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -42,6 +42,15 @@ const char * const riscv_int_regnames[] = {
   "x28/t3",  "x29/t4", "x30/t5", "x31/t6"
 };
 
+const char * const riscv_int_regnamesh[] = {
+  "x0h/zeroh", "x1h/rah",  "x2h/sph",   "x3h/gph",   "x4h/tph",  "x5h/t0h",
+  "x6h/t1h",   "x7h/t2h",  "x8h/s0h",   "x9h/s1h",   "x10h/a0h", "x11h/a1h",
+  "x12h/a2h",  "x13h/a3h", "x14h/a4h",  "x15h/a5h",  "x16h/a6h", "x17h/a7h",
+  "x18h/s2h",  "x19h/s3h", "x20h/s4h",  "x21h/s5h",  "x22h/s6h", "x23h/s7h",
+  "x24h/s8h",  "x25h/s9h", "x26h/s10h", "x27h/s11h", "x28h/t3h", "x29h/t4h",
+  "x30h/t5h",  "x31h/t6h"
+};
+
 const char * const riscv_fpr_regnames[] = {
   "f0/ft0",   "f1/ft1",  "f2/ft2",   "f3/ft3",   "f4/ft4",  "f5/ft5",
   "f6/ft6",   "f7/ft7",  "f8/fs0",   "f9/fs1",   "f10/fa0", "f11/fa1",
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index ad8248ebfd..8af9caabf5 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -164,6 +164,25 @@ static const VMStateDescription vmstate_pointermasking = {
     }
 };
 
+static bool rv128_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+
+    return env->misa_mxl_max == MXL_RV128;
+}
+
+static const VMStateDescription vmstate_rv128 = {
+    .name = "cpu/rv128",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = rv128_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINTTL_ARRAY(env.gprh, RISCVCPU, 32),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 3,
@@ -218,6 +237,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_hyper,
         &vmstate_vector,
         &vmstate_pointermasking,
+        &vmstate_rv128,
         NULL
     }
 };
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 9d102f21ee..f969885eed 100644
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
@@ -777,10 +777,13 @@ void riscv_translate_init(void)
      * unless you specifically block reads/writes to reg 0.
      */
     cpu_gpr[0] = NULL;
+    cpu_gprh[0] = NULL;
 
     for (i = 1; i < 32; i++) {
         cpu_gpr[i] = tcg_global_mem_new(cpu_env,
             offsetof(CPURISCVState, gpr[i]), riscv_int_regnames[i]);
+        cpu_gprh[i] = tcg_global_mem_new(cpu_env,
+            offsetof(CPURISCVState, gprh[i]), riscv_int_regnamesh[i]);
     }
 
     for (i = 0; i < 32; i++) {
-- 
2.34.1


