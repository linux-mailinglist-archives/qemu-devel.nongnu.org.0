Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF0C2973B1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 18:28:26 +0200 (CEST)
Received: from localhost ([::1]:39142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVzvV-0003e2-OY
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 12:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=558518344=alistair.francis@wdc.com>)
 id 1kVzFq-0002wZ-Iw; Fri, 23 Oct 2020 11:45:25 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:6193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=558518344=alistair.francis@wdc.com>)
 id 1kVzFi-0003ka-AE; Fri, 23 Oct 2020 11:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603467915; x=1635003915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6mVHo6Kdkm96p8Am08pHcF5AEniGKNySN6PQr2zd9l0=;
 b=DuOscd6t5dndHBRGsnTAUtOaPAACNgzNhldbMjlRdKO++fkpScFHwG06
 WOLFbCV+IHZ38PK+L6bN7p4ZRomoc5VBViUCGtGpP6Ayl5KzQiS2l2oRc
 juHiYp1Gu7PQFevekl/WkMe4HauF4WKL9FcOGH8qJp3kNWQIcD0QMcAUk
 MURLp2Mo5nhL5Sj7oqVEFza4aB4VRT50Jb0kLUrCgyBs+g1yKf3+WtbHl
 HZQyb2R/nU0RippJSJBlCzdzupH2iBa4SWG57gI4dWXdqaJ1/McLVYQuX
 es2rb0KgxB9DmpIjJptlNGSkE1o/GDHRycchDr2ZlWMBcx+f/0GVe9zBh Q==;
IronPort-SDR: /ZrAAkG3k/p8+va3EVksXPt9/gVPrFCJv7Mh9SRR1pNy1xICg1yKKLEZ5PyjVBFBbdDauWve36
 WtW1plk0tjjJqFO+LthmIi/Imz4fN28DTlSfBzN2cGTzLlnI37OWFEcXkXQRRgFy3TJq7j2Rn2
 7CExLDCZjGo0WDgKVUtIwgHtauPZJEpx8Yk8Nv/BOpwKd2zmSngUuU0hXMCygvwi+xV2LSkLI3
 0Fj5kZEvR/Eu2BmOoU/WnaTB/Z7hrnIx/lqo8L8Wj1IXplAgcHuXWb1ZA7odx8gfWSxBII5flN
 2BA=
X-IronPort-AV: E=Sophos;i="5.77,408,1596470400"; d="scan'208";a="151960174"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2020 23:45:10 +0800
IronPort-SDR: LD3DumCvpAN26yEOhlh+4uUePbso6sOHAyCfWMgOTSYP5QBBAlHclXAf+R0bE1W2NWTIeYz55/
 IeWPAozWumKK8ojuH4oHPapvX2MyJRENTDW+ma6R9uVOTWJ+SUMwhvTM4m2RpMB5Zs8ahLYoMe
 Tt7krIcUkwdE9vZAZrur8ZCmYDTOUr6i52zJqri/C45jH/dnZe7EQcH8Ip0FCm2CQuCvx8rqH2
 BwW3gBpkhqTr/GabQYr0VPP1LJAnRhBftIq5YqtFTtrx5gOmy9+fyxB6t4BKW3MFfXvEy+P/ii
 3V3h53maISyY3OUjhxoYIRfB
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 08:31:31 -0700
IronPort-SDR: LM8Zf6Q8OWuCxE/GYKq3Hhj5bkKcS8ogbJhBA/9bAIizd83rXKqVCDZ1G/f4iKQmEHHddJIOg2
 T6IERRzah2QbLUPRr+NbVnV3m1s8motT/2BA5AixYjf8ATtDYnyIA8EO9JuKSjG1sg7JMwGf9U
 dluliKd2MSXJ07TBLZUvqdEmZ/akeyPegSj3xh2FQGBI6SZorJcTjVEhZdM/b0ihZGEwjSVuiI
 lPugNslh4vjP2DPMms9zFFkjGUJvg4TdhdcAvKaq6Y/G0eZW2k/wNTvjGNYeyo+KfObEgVI4u1
 d6s=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.60.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Oct 2020 08:45:09 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v1 13/16] target/riscv: csr: Remove compile time XLEN checks
Date: Fri, 23 Oct 2020 08:33:48 -0700
Message-Id: <59e2196b8d86ab6b234db1a54c80a0149dcd1598.1603467169.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1603467169.git.alistair.francis@wdc.com>
References: <cover.1603467169.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=558518344=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 11:44:34
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h |   2 -
 target/riscv/csr.c      | 182 +++++++++++++++++++++-------------------
 2 files changed, 96 insertions(+), 88 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index bd36062877..d9ad694b3f 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -448,9 +448,7 @@
 #define HSTATUS_VGEIN        0x0003F000
 #define HSTATUS_VTVM         0x00100000
 #define HSTATUS_VTSR         0x00400000
-#if defined(TARGET_RISCV64)
 #define HSTATUS_VSXL        0x300000000
-#endif
 
 #define HSTATUS32_WPRI       0xFF8FF87E
 #define HSTATUS64_WPRI       0xFFFFFFFFFF8FF87EULL
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index aaef6c6f20..b153cdfec3 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -102,44 +102,65 @@ static int ctr(CPURISCVState *env, int csrno)
                 return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
-#if defined(TARGET_RISCV32)
-        case CSR_CYCLEH:
-            if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
-                get_field(env->mcounteren, HCOUNTEREN_CY)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_TIMEH:
-            if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
-                get_field(env->mcounteren, HCOUNTEREN_TM)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_INSTRETH:
-            if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
-                get_field(env->mcounteren, HCOUNTEREN_IR)) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
-                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
-                return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+        if (riscv_cpu_is_32bit(env)) {
+            switch (csrno) {
+            case CSR_CYCLEH:
+                if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
+                    get_field(env->mcounteren, HCOUNTEREN_CY)) {
+                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                }
+                break;
+            case CSR_TIMEH:
+                if (!get_field(env->hcounteren, HCOUNTEREN_TM) &&
+                    get_field(env->mcounteren, HCOUNTEREN_TM)) {
+                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                }
+                break;
+            case CSR_INSTRETH:
+                if (!get_field(env->hcounteren, HCOUNTEREN_IR) &&
+                    get_field(env->mcounteren, HCOUNTEREN_IR)) {
+                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                }
+                break;
+            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
+                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
+                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
+                    return -RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+                }
+                break;
             }
-            break;
-#endif
         }
     }
 #endif
     return 0;
 }
 
+static int ctr32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_is_32bit(env)) {
+        return 0;
+    }
+
+    return ctr(env, csrno);
+}
+
 #if !defined(CONFIG_USER_ONLY)
 static int any(CPURISCVState *env, int csrno)
 {
     return 0;
 }
 
+static int any32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_is_32bit(env)) {
+        return 0;
+    }
+
+    return any(env, csrno);
+
+}
+
 static int smode(CPURISCVState *env, int csrno)
 {
     return -!riscv_has_ext(env, RVS);
@@ -161,6 +182,16 @@ static int hmode(CPURISCVState *env, int csrno)
     return -RISCV_EXCP_ILLEGAL_INST;
 }
 
+static int hmode32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_is_32bit(env)) {
+        return 0;
+    }
+
+    return hmode(env, csrno);
+
+}
+
 static int pmp(CPURISCVState *env, int csrno)
 {
     return -!riscv_feature(env, RISCV_FEATURE_PMP);
@@ -310,7 +341,6 @@ static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
-#if defined(TARGET_RISCV32)
 static int read_instreth(CPURISCVState *env, int csrno, target_ulong *val)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -324,7 +354,6 @@ static int read_instreth(CPURISCVState *env, int csrno, target_ulong *val)
 #endif
     return 0;
 }
-#endif /* TARGET_RISCV32 */
 
 #if defined(CONFIG_USER_ONLY)
 static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
@@ -333,13 +362,11 @@ static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
-#if defined(TARGET_RISCV32)
 static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = cpu_get_host_ticks() >> 32;
     return 0;
 }
-#endif
 
 #else /* CONFIG_USER_ONLY */
 
@@ -355,7 +382,6 @@ static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
-#if defined(TARGET_RISCV32)
 static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
 {
     uint64_t delta = riscv_cpu_virt_enabled(env) ? env->htimedelta : 0;
@@ -367,7 +393,6 @@ static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
     *val = (env->rdtime_fn(env->rdtime_fn_arg) + delta) >> 32;
     return 0;
 }
-#endif
 
 /* Machine constants */
 
@@ -406,19 +431,17 @@ static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
 
-#if defined(TARGET_RISCV32)
-static const char valid_vm_1_10[16] = {
+static const char valid_vm_1_10_32[16] = {
     [VM_1_10_MBARE] = 1,
     [VM_1_10_SV32] = 1
 };
-#elif defined(TARGET_RISCV64)
-static const char valid_vm_1_10[16] = {
+
+static const char valid_vm_1_10_64[16] = {
     [VM_1_10_MBARE] = 1,
     [VM_1_10_SV39] = 1,
     [VM_1_10_SV48] = 1,
     [VM_1_10_SV57] = 1
 };
-#endif /* CONFIG_USER_ONLY */
 
 /* Machine Information Registers */
 static int read_zero(CPURISCVState *env, int csrno, target_ulong *val)
@@ -441,7 +464,11 @@ static int read_mstatus(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int validate_vm(CPURISCVState *env, target_ulong vm)
 {
-    return valid_vm_1_10[vm & 0xf];
+    if (riscv_cpu_is_32bit(env)) {
+        return valid_vm_1_10_32[vm & 0xf];
+    } else {
+        return valid_vm_1_10_64[vm & 0xf];
+    }
 }
 
 static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
@@ -459,13 +486,14 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
         MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
         MSTATUS_TW;
-#if defined(TARGET_RISCV64)
-    /*
-     * RV32: MPV and GVA are not in mstatus. The current plan is to
-     * add them to mstatush. For now, we just don't support it.
-     */
-    mask |= MSTATUS_MPV | MSTATUS_GVA;
-#endif
+
+    if (!riscv_cpu_is_32bit(env)) {
+        /*
+         * RV32: MPV and GVA are not in mstatus. The current plan is to
+         * add them to mstatush. For now, we just don't support it.
+         */
+        mask |= MSTATUS_MPV | MSTATUS_GVA;
+    }
 
     mstatus = (mstatus & ~mask) | (val & mask);
 
@@ -477,7 +505,6 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
-#ifdef TARGET_RISCV32
 static int read_mstatush(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->mstatush;
@@ -496,7 +523,6 @@ static int write_mstatush(CPURISCVState *env, int csrno, target_ulong val)
 
     return 0;
 }
-#endif
 
 static int read_misa(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -894,10 +920,10 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
 static int read_hstatus(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->hstatus;
-#ifdef TARGET_RISCV64
-    /* We only support 64-bit VSXL */
-    *val = set_field(*val, HSTATUS_VSXL, 2);
-#endif
+    if (!riscv_cpu_is_32bit(env)) {
+        /* We only support 64-bit VSXL */
+        *val = set_field(*val, HSTATUS_VSXL, 2);
+    }
     /* We only support little endian */
     *val = set_field(*val, HSTATUS_VSBE, 0);
     return 0;
@@ -906,11 +932,9 @@ static int read_hstatus(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_hstatus(CPURISCVState *env, int csrno, target_ulong val)
 {
     env->hstatus = val;
-#ifdef TARGET_RISCV64
-    if (get_field(val, HSTATUS_VSXL) != 2) {
+    if (!riscv_cpu_is_32bit(env) && get_field(val, HSTATUS_VSXL) != 2) {
         qemu_log_mask(LOG_UNIMP, "QEMU does not support mixed HSXLEN options.");
     }
-#endif
     if (get_field(val, HSTATUS_VSBE) != 0) {
         qemu_log_mask(LOG_UNIMP, "QEMU does not support big endian guests.");
     }
@@ -1052,11 +1076,11 @@ static int read_htimedelta(CPURISCVState *env, int csrno, target_ulong *val)
         return -RISCV_EXCP_ILLEGAL_INST;
     }
 
-#if defined(TARGET_RISCV32)
-    *val = env->htimedelta & 0xffffffff;
-#else
-    *val = env->htimedelta;
-#endif
+    if (riscv_cpu_is_32bit(env)) {
+        *val = env->htimedelta & 0xffffffff;
+    } else {
+       *val = env->htimedelta;
+    }
     return 0;
 }
 
@@ -1066,15 +1090,14 @@ static int write_htimedelta(CPURISCVState *env, int csrno, target_ulong val)
         return -RISCV_EXCP_ILLEGAL_INST;
     }
 
-#if defined(TARGET_RISCV32)
-    env->htimedelta = deposit64(env->htimedelta, 0, 32, (uint64_t)val);
-#else
-    env->htimedelta = val;
-#endif
+    if (riscv_cpu_is_32bit(env)) {
+        env->htimedelta = deposit64(env->htimedelta, 0, 32, (uint64_t)val);
+    } else {
+        env->htimedelta = val;
+    }
     return 0;
 }
 
-#if defined(TARGET_RISCV32)
 static int read_htimedeltah(CPURISCVState *env, int csrno, target_ulong *val)
 {
     if (!env->rdtime_fn) {
@@ -1094,7 +1117,6 @@ static int write_htimedeltah(CPURISCVState *env, int csrno, target_ulong val)
     env->htimedelta = deposit64(env->htimedelta, 32, 32, (uint64_t)val);
     return 0;
 }
-#endif
 
 /* Virtual CSR Registers */
 static int read_vsstatus(CPURISCVState *env, int csrno, target_ulong *val)
@@ -1372,26 +1394,20 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* User Timers and Counters */
     [CSR_CYCLE] =               { ctr,  read_instret                        },
     [CSR_INSTRET] =             { ctr,  read_instret                        },
-#if defined(TARGET_RISCV32)
-    [CSR_CYCLEH] =              { ctr,  read_instreth                       },
-    [CSR_INSTRETH] =            { ctr,  read_instreth                       },
-#endif
+    [CSR_CYCLEH] =              { ctr32,  read_instreth                       },
+    [CSR_INSTRETH] =            { ctr32,  read_instreth                       },
 
     /* In privileged mode, the monitor will have to emulate TIME CSRs only if
      * rdtime callback is not provided by machine/platform emulation */
     [CSR_TIME] =                { ctr,  read_time                           },
-#if defined(TARGET_RISCV32)
-    [CSR_TIMEH] =               { ctr,  read_timeh                          },
-#endif
+    [CSR_TIMEH] =               { ctr32,  read_timeh                          },
 
 #if !defined(CONFIG_USER_ONLY)
     /* Machine Timers and Counters */
     [CSR_MCYCLE] =              { any,  read_instret                        },
     [CSR_MINSTRET] =            { any,  read_instret                        },
-#if defined(TARGET_RISCV32)
-    [CSR_MCYCLEH] =             { any,  read_instreth                       },
-    [CSR_MINSTRETH] =           { any,  read_instreth                       },
-#endif
+    [CSR_MCYCLEH] =             { any32,  read_instreth                       },
+    [CSR_MINSTRETH] =           { any32,  read_instreth                       },
 
     /* Machine Information Registers */
     [CSR_MVENDORID] =           { any,  read_zero                           },
@@ -1408,9 +1424,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVEC] =               { any,  read_mtvec,       write_mtvec       },
     [CSR_MCOUNTEREN] =          { any,  read_mcounteren,  write_mcounteren  },
 
-#if defined(TARGET_RISCV32)
-    [CSR_MSTATUSH] =            { any,  read_mstatush,    write_mstatush    },
-#endif
+    [CSR_MSTATUSH] =            { any32,  read_mstatush,    write_mstatush    },
 
     [CSR_MSCOUNTEREN] =         { any,  read_mscounteren, write_mscounteren },
 
@@ -1450,9 +1464,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HGEIP] =               { hmode,   read_hgeip,       write_hgeip      },
     [CSR_HGATP] =               { hmode,   read_hgatp,       write_hgatp      },
     [CSR_HTIMEDELTA] =          { hmode,   read_htimedelta,  write_htimedelta },
-#if defined(TARGET_RISCV32)
-    [CSR_HTIMEDELTAH] =         { hmode,   read_htimedeltah, write_htimedeltah},
-#endif
+    [CSR_HTIMEDELTAH] =         { hmode32,   read_htimedeltah, write_htimedeltah},
 
     [CSR_VSSTATUS] =            { hmode,   read_vsstatus,    write_vsstatus   },
     [CSR_VSIP] =                { hmode,   NULL,     NULL,     rmw_vsip       },
@@ -1475,9 +1487,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HPMCOUNTER3   ... CSR_HPMCOUNTER31] =    { ctr,  read_zero          },
     [CSR_MHPMCOUNTER3  ... CSR_MHPMCOUNTER31] =   { any,  read_zero          },
     [CSR_MHPMEVENT3    ... CSR_MHPMEVENT31] =     { any,  read_zero          },
-#if defined(TARGET_RISCV32)
-    [CSR_HPMCOUNTER3H  ... CSR_HPMCOUNTER31H] =   { ctr,  read_zero          },
-    [CSR_MHPMCOUNTER3H ... CSR_MHPMCOUNTER31H] =  { any,  read_zero          },
-#endif
+    [CSR_HPMCOUNTER3H  ... CSR_HPMCOUNTER31H] =   { ctr32,  read_zero          },
+    [CSR_MHPMCOUNTER3H ... CSR_MHPMCOUNTER31H] =  { any32,  read_zero          },
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.28.0


