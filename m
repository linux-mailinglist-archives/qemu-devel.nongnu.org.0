Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C065433331
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 12:06:51 +0200 (CEST)
Received: from localhost ([::1]:58686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcm1C-00089g-Jx
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 06:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mclk0-0001VQ-HQ; Tue, 19 Oct 2021 05:49:04 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:55076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljx-0006jE-Pq; Tue, 19 Oct 2021 05:49:04 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 3B0A841F6E;
 Tue, 19 Oct 2021 11:48:40 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 1B0A0601D6;
 Tue, 19 Oct 2021 11:48:40 +0200 (CEST)
Received: from palmier.u-ga.fr (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id EC6F814005A;
 Tue, 19 Oct 2021 11:48:34 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 20/21] target/riscv: adding 128-bit access functions for
 some csrs
Date: Tue, 19 Oct 2021 11:48:11 +0200
Message-Id: <20211019094812.614056-21-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
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

Access to mstatus, mtvec, mscratch and mepc is implemented.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/cpu_bits.h |   1 +
 target/riscv/csr.c      | 111 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 108 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index e248c6bf6d..e4750afc78 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -360,6 +360,7 @@
 
 #define MSTATUS32_SD        0x80000000
 #define MSTATUS64_SD        0x8000000000000000ULL
+#define MSTATUSH128_SD      0x8000000000000000ULL
 
 #define MISA32_MXL          0xC0000000
 #define MISA64_MXL          0xC000000000000000ULL
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3aac19e277..877cd2d63a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -509,6 +509,61 @@ static uint64_t add_status_sd(RISCVMXL xl, uint64_t status)
     return status;
 }
 
+static RISCVException read_mstatus_i128(CPURISCVState *env, int csrno,
+                                   Int128 *val)
+{
+    *val = int128_make128(env->mstatus, env->mstatush);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mstatus_i128(CPURISCVState *env, int csrno,
+                                        Int128 val)
+{
+    Int128 mstatus = int128_make128(env->mstatus, env->mstatush);
+    Int128 mask = int128_zero();
+    int dirty;
+
+    /* flush tlb on mstatus fields that affect VM */
+    if (int128_getlo(int128_xor(mstatus, val))
+            & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
+                           MSTATUS_MPRV | MSTATUS_SUM)) {
+        tlb_flush(env_cpu(env));
+    }
+    mask = int128_make64(MSTATUS_SIE | MSTATUS_SPIE |
+                         MSTATUS_MIE | MSTATUS_MPIE |
+                         MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
+                         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
+                         MSTATUS_TW);
+
+    if (!riscv_cpu_is_32bit(env)) {
+        /*
+         * RV32: MPV and GVA are not in mstatus. The current plan is to
+         * add them to mstatush. For now, we just don't support it.
+         */
+        mask = int128_or(mask, int128_make64(MSTATUS_MPV | MSTATUS_GVA));
+    }
+
+    mstatus = int128_or(int128_and(mstatus, int128_not(mask)),
+                        int128_and(val, mask));
+
+    dirty = ((int128_getlo(mstatus) & MSTATUS_FS) == MSTATUS_FS) |
+            ((int128_getlo(mstatus) & MSTATUS_XS) == MSTATUS_XS);
+    if (dirty) {
+        if (riscv_cpu_is_32bit(env)) {
+            mstatus = int128_make64(int128_getlo(mstatus) | MSTATUS32_SD);
+        } else if (riscv_cpu_is_64bit(env)) {
+            mstatus = int128_make64(int128_getlo(mstatus) | MSTATUS64_SD);
+        } else {
+            mstatus = int128_or(mstatus, int128_make128(0, MSTATUSH128_SD));
+        }
+    }
+
+    env->mstatus = int128_getlo(mstatus);
+    env->mstatush = int128_gethi(mstatus);
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
@@ -713,6 +768,26 @@ static RISCVException write_mie(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_mtvec_i128(CPURISCVState *env, int csrno,
+                                     Int128 *val)
+{
+    *val = int128_make128(env->mtvec, env->mtvech);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mtvec_i128(CPURISCVState *env, int csrno,
+                                      Int128 val)
+{
+    /* bits [1:0] encode mode; 0 = direct, 1 = vectored, 2 >= reserved */
+    if ((int128_getlo(val) & 3) < 2) {
+        env->mtvec = int128_getlo(val);
+        env->mtvech = int128_gethi(val);
+    } else {
+        qemu_log_mask(LOG_UNIMP, "CSR_MTVEC: reserved mode not supported\n");
+    }
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mtvec(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -747,6 +822,19 @@ static RISCVException write_mcounteren(CPURISCVState *env, int csrno,
 }
 
 /* Machine Trap Handling */
+static RISCVException read_mscratch_i128(CPURISCVState *env, int csrno,
+                                        Int128 *val)  {
+    *val = int128_make128(env->mscratch, env->mscratchh);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mscratch_i128(CPURISCVState *env, int csrno,
+                                         Int128 val) {
+    env->mscratch = int128_getlo(val);
+    env->mscratchh = int128_gethi(val);
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mscratch(CPURISCVState *env, int csrno,
                                     target_ulong *val)
 {
@@ -761,6 +849,21 @@ static RISCVException write_mscratch(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_mepc_i128(CPURISCVState *env, int csrno,
+                                    Int128 *val)
+{
+    *val = int128_make128(env->mepc, env->mepch);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mepc_i128(CPURISCVState *env, int csrno,
+                                     Int128 val)
+{
+    env->mepc = int128_getlo(val);
+    env->mepch = int128_gethi(val);
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mepc(CPURISCVState *env, int csrno,
                                      target_ulong *val)
 {
@@ -1679,12 +1782,12 @@ riscv_csr_operations128 csr_ops_128[CSR_TABLE_SIZE] = {
     [CSR_MIMPID]     = { read_zero_i128    },
     [CSR_MHARTID]    = { read_mhartid_i128 },
 
-    [CSR_MSTATUS]    = { read_zero_i128    },
+    [CSR_MSTATUS]    = { read_mstatus_i128,  write_mstatus_i128  },
     [CSR_MISA]       = { read_misa_i128    },
-    [CSR_MTVEC]      = { read_zero_i128    },
+    [CSR_MTVEC]      = { read_mtvec_i128,    write_mtvec_i128    },
 
-    [CSR_MSCRATCH]   = { read_zero_i128    },
-    [CSR_MEPC]       = { read_zero_i128    },
+    [CSR_MSCRATCH]   = { read_mscratch_i128, write_mscratch_i128 },
+    [CSR_MEPC]       = { read_mepc_i128,     write_mepc_i128     },
 
     [CSR_SATP]       = { read_zero_i128    },
 #endif
-- 
2.33.0


