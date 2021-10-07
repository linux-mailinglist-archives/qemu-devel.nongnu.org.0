Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826BB424964
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 00:02:18 +0200 (CEST)
Received: from localhost ([::1]:33636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYEzR-0006Yr-Fo
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 18:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUd-0000Kx-JR; Wed, 06 Oct 2021 17:30:31 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:44136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUZ-0008SF-9z; Wed, 06 Oct 2021 17:30:26 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 7398841F28;
 Wed,  6 Oct 2021 23:29:47 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 5DA0560066;
 Wed,  6 Oct 2021 23:29:47 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 26D3314005C;
 Wed,  6 Oct 2021 23:29:47 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 27/27] target/riscv: support for 128-bit satp
Date: Wed,  6 Oct 2021 23:28:33 +0200
Message-Id: <20211006212833.108706-28-frederic.petrot@univ-grenoble-alpes.fr>
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

Support for a 128-bit satp. This is a bit more involved than necessary
because we took the opportunity to increase the page size to 16kB, and
change the page table geometry, which makes the page walk a bit more
parametrizable (variables instead of defines).
Note that is anyway a necessary step for the merging of the 32-bit and
64-bit riscv versions in a single executable.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/cpu-param.h  |  9 ++++-
 target/riscv/cpu_bits.h   | 10 +++++
 target/riscv/cpu_helper.c | 54 +++++++++++++++++++--------
 target/riscv/csr.c        | 77 +++++++++++++++++++++++++++++++++++++--
 4 files changed, 130 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
index c10459b56f..78f0916403 100644
--- a/target/riscv/cpu-param.h
+++ b/target/riscv/cpu-param.h
@@ -19,10 +19,15 @@
 #else
 /* 64-bit target, since QEMU isn't built to have TARGET_LONG_BITS over 64 */
 # define TARGET_LONG_BITS 64
-# define TARGET_PHYS_ADDR_SPACE_BITS 56 /* 44-bit PPN */
-# define TARGET_VIRT_ADDR_SPACE_BITS 48 /* sv48 */
+# define TARGET_PHYS_ADDR_SPACE_BITS 64 /* 54-bit PPN */
+# define TARGET_VIRT_ADDR_SPACE_BITS 44 /* sv44 */
 #endif
+
+#if defined(TARGET_RISCV32) || defined(TARGET_RISCV64)
 #define TARGET_PAGE_BITS 12 /* 4 KiB Pages */
+#else
+#define TARGET_PAGE_BITS 14 /* 16 KiB pages for RV128 */
+#endif
 /*
  * The current MMU Modes are:
  *  - U mode 0b000
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 553b0a3d71..a4f6ba927f 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -428,6 +428,11 @@
 #define SATP64_ASID         0x0FFFF00000000000ULL
 #define SATP64_PPN          0x00000FFFFFFFFFFFULL
 
+/* RV128 satp CSR field masks (H/L for high/low dword) */
+#define SATP128_HMODE       0xFF00000000000000ULL
+#define SATP128_HASID       0x00FFFFFFFF000000ULL
+#define SATP128_LPPN        0x0003FFFFFFFFFFFFULL
+
 /* VM modes (mstatus.vm) privileged ISA 1.9.1 */
 #define VM_1_09_MBARE       0
 #define VM_1_09_MBB         1
@@ -443,6 +448,9 @@
 #define VM_1_10_SV48        9
 #define VM_1_10_SV57        10
 #define VM_1_10_SV64        11
+#define VM_1_10_SV44        12
+#define VM_1_10_SV54        13
+
 
 /* Page table entry (PTE) fields */
 #define PTE_V               0x001 /* Valid */
@@ -460,6 +468,8 @@
 
 /* Leaf page shift amount */
 #define PGSHIFT             12
+/* For now, pages in RV128 are 16 KiB. */
+#define PGSHIFT128          14
 
 /* Default Reset Vector adress */
 #define DEFAULT_RSTVEC      0x1000
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d41d5cd27c..55dea1f58b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -391,7 +391,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     *prot = 0;
 
     hwaddr base;
-    int levels, ptidxbits, ptesize, vm, sum, mxr, widened;
+    int levels, ptidxbits, ptesize, vm, sum, mxr, widened, pgshift;
 
     if (first_stage == true) {
         mxr = get_field(env->mstatus, MSTATUS_MXR);
@@ -404,17 +404,25 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
             if (riscv_cpu_is_32bit(env)) {
                 base = (hwaddr)get_field(env->vsatp, SATP32_PPN) << PGSHIFT;
                 vm = get_field(env->vsatp, SATP32_MODE);
-            } else {
+            } else if (riscv_cpu_is_64bit(env)) {
                 base = (hwaddr)get_field(env->vsatp, SATP64_PPN) << PGSHIFT;
                 vm = get_field(env->vsatp, SATP64_MODE);
+            } else {
+                /* TODO : Hypervisor extension not supported yet in RV128. */
+                g_assert_not_reached();
             }
         } else {
             if (riscv_cpu_is_32bit(env)) {
                 base = (hwaddr)get_field(env->satp, SATP32_PPN) << PGSHIFT;
                 vm = get_field(env->satp, SATP32_MODE);
-            } else {
+            } else if (riscv_cpu_is_64bit(env)) {
                 base = (hwaddr)get_field(env->satp, SATP64_PPN) << PGSHIFT;
                 vm = get_field(env->satp, SATP64_MODE);
+            } else if (riscv_cpu_is_128bit(env)) {
+                base = (hwaddr)get_field(env->satp, SATP128_LPPN) << PGSHIFT128;
+                vm = get_field(env->satph, SATP128_HMODE);
+            } else {
+                g_assert_not_reached();
             }
         }
         widened = 0;
@@ -422,9 +430,15 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         if (riscv_cpu_is_32bit(env)) {
             base = (hwaddr)get_field(env->hgatp, SATP32_PPN) << PGSHIFT;
             vm = get_field(env->hgatp, SATP32_MODE);
-        } else {
+        } else if (riscv_cpu_is_64bit(env)) {
             base = (hwaddr)get_field(env->hgatp, SATP64_PPN) << PGSHIFT;
             vm = get_field(env->hgatp, SATP64_MODE);
+        } else {
+            /*
+             * TODO : Hypervisor extension not supported yet in RV128,
+             * so there shouldn't be any two-stage address lookups.
+             */
+            g_assert_not_reached();
         }
         widened = 2;
     }
@@ -432,13 +446,17 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     sum = get_field(env->mstatus, MSTATUS_SUM) || use_background || is_debug;
     switch (vm) {
     case VM_1_10_SV32:
-      levels = 2; ptidxbits = 10; ptesize = 4; break;
+      levels = 2; ptidxbits = 10; ptesize = 4; pgshift = 12; break;
     case VM_1_10_SV39:
-      levels = 3; ptidxbits = 9; ptesize = 8; break;
+      levels = 3; ptidxbits = 9; ptesize = 8; pgshift = 12; break;
     case VM_1_10_SV48:
-      levels = 4; ptidxbits = 9; ptesize = 8; break;
+      levels = 4; ptidxbits = 9; ptesize = 8; pgshift = 12; break;
     case VM_1_10_SV57:
-      levels = 5; ptidxbits = 9; ptesize = 8; break;
+      levels = 5; ptidxbits = 9; ptesize = 8; pgshift = 12; break;
+    case VM_1_10_SV44:
+      levels = 3; ptidxbits = 10; ptesize = 16; pgshift = 14; break;
+    case VM_1_10_SV54:
+      levels = 4; ptidxbits = 10; ptesize = 16;  pgshift = 14; break;
     case VM_1_10_MBARE:
         *physical = addr;
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -448,7 +466,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     }
 
     CPUState *cs = env_cpu(env);
-    int va_bits = PGSHIFT + levels * ptidxbits + widened;
+    int va_bits = pgshift + levels * ptidxbits + widened;
     target_ulong mask, masked_msbs;
 
     if (TARGET_LONG_BITS > (va_bits - 1)) {
@@ -463,6 +481,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     }
 
     int ptshift = (levels - 1) * ptidxbits;
+    uint64_t pgoff_mask = (1ULL << pgshift) - 1;
     int i;
 
 #if !TCG_OVERSIZED_GUEST
@@ -471,10 +490,10 @@ restart:
     for (i = 0; i < levels; i++, ptshift -= ptidxbits) {
         target_ulong idx;
         if (i == 0) {
-            idx = (addr >> (PGSHIFT + ptshift)) &
+            idx = (addr >> (pgshift + ptshift)) &
                            ((1 << (ptidxbits + widened)) - 1);
         } else {
-            idx = (addr >> (PGSHIFT + ptshift)) &
+            idx = (addr >> (pgshift + ptshift)) &
                            ((1 << ptidxbits) - 1);
         }
 
@@ -482,6 +501,7 @@ restart:
         hwaddr pte_addr;
 
         if (two_stage && first_stage) {
+            /* TODO : Two-stage translation for RV128 */
             int vbase_prot;
             hwaddr vbase;
 
@@ -515,6 +535,10 @@ restart:
         if (riscv_cpu_is_32bit(env)) {
             pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
         } else {
+            /*
+             * For RV128, load only lower 64 bits as only those
+             * are used for now
+             */
             pte = address_space_ldq(cs->as, pte_addr, attrs, &res);
         }
 
@@ -529,7 +553,7 @@ restart:
             return TRANSLATE_FAIL;
         } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
             /* Inner PTE, continue walking */
-            base = ppn << PGSHIFT;
+            base = ppn << pgshift;
         } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
             /* Reserved leaf PTE flags: PTE_W */
             return TRANSLATE_FAIL;
@@ -601,9 +625,9 @@ restart:
 
             /* for superpage mappings, make a fake leaf PTE for the TLB's
                benefit. */
-            target_ulong vpn = addr >> PGSHIFT;
-            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT) |
-                        (addr & ~TARGET_PAGE_MASK);
+            target_ulong vpn = addr >> pgshift;
+            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << pgshift) |
+                        (addr & pgoff_mask);
 
             /* set permissions on the TLB entry */
             if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a9146a4496..3a6bc02571 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -461,6 +461,12 @@ static const char valid_vm_1_10_64[16] = {
     [VM_1_10_SV57] = 1
 };
 
+static const bool valid_vm_1_10_128[16] = {
+    [VM_1_10_MBARE] = 1,
+    [VM_1_10_SV44] = 1,
+    [VM_1_10_SV54] = 1
+};
+
 /* Machine Information Registers */
 static RISCVException read_zero_i128(CPURISCVState *env, int csrno,
                                     Int128 *val)
@@ -557,8 +563,12 @@ static int validate_vm(CPURISCVState *env, target_ulong vm)
 {
     if (riscv_cpu_is_32bit(env)) {
         return valid_vm_1_10_32[vm & 0xf];
-    } else {
+    } else if (riscv_cpu_is_64bit(env)) {
         return valid_vm_1_10_64[vm & 0xf];
+    } else if (riscv_cpu_is_128bit(env)) {
+        return valid_vm_1_10_128[vm & 0xf];
+    } else {
+        return 0;
     }
 }
 
@@ -1090,6 +1100,67 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
 }
 
 /* Supervisor Protection and Translation */
+static RISCVException read_satp_i128(CPURISCVState *env, int csrno,
+                                    Int128 *val)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+        *val = int128_zero();
+        return RISCV_EXCP_NONE;
+    }
+
+    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    } else {
+        *val = int128_make128(env->satp, env->satph);
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_satp_i128(CPURISCVState *env, int csrno,
+                                     Int128 val)
+{
+    uint32_t asid;
+    bool vm_ok;
+    Int128 mask;
+
+    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    if (riscv_cpu_is_32bit(env)) {
+        vm_ok = validate_vm(env, get_field(int128_getlo(val), SATP32_MODE));
+        mask = int128_make64((int128_getlo(val) ^ env->satp)
+                           & (SATP32_MODE | SATP32_ASID | SATP32_PPN));
+        asid = (int128_getlo(val) ^ env->satp) & SATP32_ASID;
+    } else if (riscv_cpu_is_64bit(env)) {
+        vm_ok = validate_vm(env, get_field(int128_getlo(val), SATP64_MODE));
+        mask = int128_make64((int128_getlo(val) ^ env->satp)
+                           & (SATP64_MODE | SATP64_ASID | SATP64_PPN));
+        asid = (int128_getlo(val) ^ env->satp) & SATP64_ASID;
+    } else {
+        vm_ok = validate_vm(env, get_field(int128_gethi(val), SATP128_HMODE));
+        mask = int128_and(
+                   int128_xor(val, int128_make128(env->satp, env->satph)),
+                   int128_make128(SATP128_LPPN, SATP128_HMODE | SATP128_HASID));
+        asid = (int128_gethi(val) ^ env->satph) & SATP128_HASID;
+    }
+
+
+    if (vm_ok && int128_nz(mask)) {
+        if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        } else {
+            if (asid) {
+                tlb_flush(env_cpu(env));
+            }
+            env->satp = int128_getlo(val);
+            env->satph = int128_gethi(val);
+        }
+    }
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_satp(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -1624,7 +1695,7 @@ static inline RISCVException riscv_csrrw_check_i128(CPURISCVState *env,
     /* check privileges and return -1 if check fails */
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv = env->priv;
-    int read_only = get_field(csrno, 0xc00) == 3;
+    int read_only = get_field(csrno, 0xC00) == 3;
 
     if (riscv_has_ext(env, RVH) &&
         env->priv == PRV_S &&
@@ -1765,7 +1836,7 @@ riscv_csr_operations128 csr_ops_128[CSR_TABLE_SIZE] = {
     [CSR_MSCRATCH]   = { read_mscratch_i128, write_mscratch_i128 },
     [CSR_MEPC]       = { read_mepc_i128,     write_mepc_i128     },
 
-    [CSR_SATP]       = { read_zero_i128    },
+    [CSR_SATP]       = { read_satp_i128,     write_satp_i128     },
 #endif
 };
 
-- 
2.33.0


