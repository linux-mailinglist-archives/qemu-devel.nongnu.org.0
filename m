Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9BF2522C8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 23:27:29 +0200 (CEST)
Received: from localhost ([::1]:38652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAgTY-0001y5-VG
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 17:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg4S-0000jj-Sm
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:01:35 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg4P-00024g-9e
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:01:32 -0400
Received: by mail-pf1-x442.google.com with SMTP id m71so8311719pfd.1
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 14:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m6fh136WeDEV1UTM3Bn7M1wdgMRKLLNiRWtU8qzbrz8=;
 b=oDega+RGE2GGEM+RjL2arhqkeqkZOTbsjRg/L69FVRHuW3GHASiiIWCPPnNdicBUUj
 gEdrxBCCM6woVZfIN/viYTwXkzDno4SfH+5gYvvaPGWiiW5wLWuVUviO+BiAs9J4BLve
 Z0RKRUO/BmWXtxWWvCvSpLRi4b0HcWmdQyLKwht6PSitZ/rF/1NnOZoNXFUE71VOyl74
 b+ba5WvYkJxFePb91le6HdC1SxonoTMiVNnP76gy/nB4O51RKX4KsiC9j06e0cgv498U
 G9e68q+MVZEDwQiYiH8iLi33jAzZB4/4+ZKbXsICqkDE0mnjZGpqr9+ng1KrVmXV/Mw4
 R+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6fh136WeDEV1UTM3Bn7M1wdgMRKLLNiRWtU8qzbrz8=;
 b=knwgvNG9Sdkx1txnAO7Cm1hy2N4ezfs+b87pzH8xk/iEZeDKeMRL28jjp+mCF/27tp
 sUNe2SaOyzoukZrgDDLNW709m5ca7TeprFuAM2YS07dQVMg5V0eeG4CG0iVTECzq6z7I
 pMjpq2+sRvT8Mw+oRdsdVvFM72XkWvZgDTG4CxM76FNkXgFv1eWIJJZ6eh6ZlWc7KooB
 /LdmgPbypljVD9VCxpxpe9rUgJp94i8BkmDRkm/gl0hsevu7AVYABqwe+uHm+DlI/i1I
 OrEMPbujjp8NjzdQXvfuR2ITR7r9QvNRBAIjOXG0vGJjpbB/Wc45aaCfk3qX37mG+AV+
 7kZg==
X-Gm-Message-State: AOAM533VhqTMd4NvMnqDVOM/5H5B501sOAFNZ2aOfNuldDZC4Rf2s8/M
 2IkiaKIHbMSrzMtuunfTZq6PU5gdeokM9g==
X-Google-Smtp-Source: ABdhPJxC2zZYgQKA4g+d/dXgn/Gp9p7dURq4zbNf2u9PgNZKb4Hyao8eKprFmLziDX2XgMZ3VsHrHQ==
X-Received: by 2002:a63:df01:: with SMTP id u1mr7427865pgg.401.1598389287208; 
 Tue, 25 Aug 2020 14:01:27 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id k4sm16074pgr.87.2020.08.25.14.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 14:01:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 72/77] target/microblaze: Convert dec_msr to decodetree
Date: Tue, 25 Aug 2020 13:59:45 -0700
Message-Id: <20200825205950.730499-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825205950.730499-1-richard.henderson@linaro.org>
References: <20200825205950.730499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/insns.decode |   3 +
 target/microblaze/translate.c  | 270 +++++++++++++++++----------------
 2 files changed, 139 insertions(+), 134 deletions(-)

diff --git a/target/microblaze/insns.decode b/target/microblaze/insns.decode
index e80283cce6..48c60082e0 100644
--- a/target/microblaze/insns.decode
+++ b/target/microblaze/insns.decode
@@ -179,6 +179,9 @@ lwi             111010 ..... ..... ................     @typeb
 
 mbar            101110 imm:5 00010 0000 0000 0000 0100
 
+mfs             100101 rd:5  0 e:1 000 10 rs:14
+mts             100101 0 e:1 000 ra:5  11 rs:14
+
 msrclr          100101 ..... 100010 ...............     @type_msr
 msrset          100101 ..... 100000 ...............     @type_msr
 
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index e05523bd5b..e9e4a0e1db 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1327,6 +1327,7 @@ static void msr_read(DisasContext *dc, TCGv_i32 d)
     tcg_temp_free_i32(t);
 }
 
+#ifndef CONFIG_USER_ONLY
 static void msr_write(DisasContext *dc, TCGv_i32 v)
 {
     dc->cpustate_changed = 1;
@@ -1337,6 +1338,7 @@ static void msr_write(DisasContext *dc, TCGv_i32 v)
     /* Clear MSR_C and MSR_CC; MSR_PVR is not writable, and is always clear. */
     tcg_gen_andi_i32(cpu_msr, v, ~(MSR_C | MSR_CC | MSR_PVR));
 }
+#endif
 
 static bool do_msrclrset(DisasContext *dc, arg_type_msr *arg, bool set)
 {
@@ -1385,151 +1387,152 @@ static bool trans_msrset(DisasContext *dc, arg_type_msr *arg)
     return do_msrclrset(dc, arg, true);
 }
 
-static void dec_msr(DisasContext *dc)
+static bool trans_mts(DisasContext *dc, arg_mts *arg)
 {
-    CPUState *cs = CPU(dc->cpu);
-    unsigned int sr, rn;
-    bool to, extended = false;
-
-    sr = extract32(dc->imm, 0, 14);
-    to = extract32(dc->imm, 14, 1);
-    dc->type_b = 1;
-    if (to) {
-        dc->cpustate_changed = 1;
+    if (trap_userspace(dc, true)) {
+        return true;
     }
 
-    /* Extended MSRs are only available if addr_size > 32.  */
-    if (dc->cpu->cfg.addr_size > 32) {
-        /* The E-bit is encoded differently for To/From MSR.  */
-        static const unsigned int e_bit[] = { 19, 24 };
-
-        extended = extract32(dc->imm, e_bit[to], 1);
+#ifdef CONFIG_USER_ONLY
+    g_assert_not_reached();
+#else
+    if (arg->e && arg->rs != 0x1003) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Invalid extended mts reg 0x%x\n", arg->rs);
+        return true;
     }
 
-    if (trap_userspace(dc, to)) {
-        return;
-    }
+    TCGv_i32 src = reg_for_read(dc, arg->ra);
+    switch (arg->rs) {
+    case SR_MSR:
+        msr_write(dc, src);
+        break;
+    case SR_FSR:
+        tcg_gen_st_i32(src, cpu_env, offsetof(CPUMBState, fsr));
+        break;
+    case 0x800:
+        tcg_gen_st_i32(src, cpu_env, offsetof(CPUMBState, slr));
+        break;
+    case 0x802:
+        tcg_gen_st_i32(src, cpu_env, offsetof(CPUMBState, shr));
+        break;
 
-#if !defined(CONFIG_USER_ONLY)
-    /* Catch read/writes to the mmu block.  */
-    if ((sr & ~0xff) == 0x1000) {
-        TCGv_i32 tmp_ext = tcg_const_i32(extended);
-        TCGv_i32 tmp_sr;
+    case 0x1000: /* PID */
+    case 0x1001: /* ZPR */
+    case 0x1002: /* TLBX */
+    case 0x1003: /* TLBLO */
+    case 0x1004: /* TLBHI */
+    case 0x1005: /* TLBSX */
+        {
+            TCGv_i32 tmp_ext = tcg_const_i32(arg->e);
+            TCGv_i32 tmp_reg = tcg_const_i32(arg->rs & 7);
 
-        sr &= 7;
-        tmp_sr = tcg_const_i32(sr);
-        if (to) {
-            gen_helper_mmu_write(cpu_env, tmp_ext, tmp_sr, cpu_R[dc->ra]);
-        } else {
-            gen_helper_mmu_read(cpu_R[dc->rd], cpu_env, tmp_ext, tmp_sr);
+            gen_helper_mmu_write(cpu_env, tmp_ext, tmp_reg, src);
+            tcg_temp_free_i32(tmp_reg);
+            tcg_temp_free_i32(tmp_ext);
         }
-        tcg_temp_free_i32(tmp_sr);
-        tcg_temp_free_i32(tmp_ext);
-        return;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid mts reg 0x%x\n", arg->rs);
+        return true;
     }
+    dc->cpustate_changed = 1;
+    return true;
+#endif
+}
+
+static bool trans_mfs(DisasContext *dc, arg_mfs *arg)
+{
+    TCGv_i32 dest = reg_for_write(dc, arg->rd);
+
+    if (arg->e) {
+        switch (arg->rs) {
+        case SR_EAR:
+            {
+                TCGv_i64 t64 = tcg_temp_new_i64();
+                tcg_gen_ld_i64(t64, cpu_env, offsetof(CPUMBState, ear));
+                tcg_gen_extrh_i64_i32(dest, t64);
+                tcg_temp_free_i64(t64);
+            }
+            return true;
+#ifndef CONFIG_USER_ONLY
+        case 0x1003: /* TLBLO */
+            /* Handled below. */
+            break;
+#endif
+        case 0x2006 ... 0x2009:
+            /* High bits of PVR6-9 not implemented. */
+            tcg_gen_movi_i32(dest, 0);
+            return true;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "Invalid extended mfs reg 0x%x\n", arg->rs);
+            return true;
+        }
+    }
+
+    switch (arg->rs) {
+    case SR_PC:
+        tcg_gen_movi_i32(dest, dc->base.pc_next);
+        break;
+    case SR_MSR:
+        msr_read(dc, dest);
+        break;
+    case SR_EAR:
+        {
+            TCGv_i64 t64 = tcg_temp_new_i64();
+            tcg_gen_ld_i64(t64, cpu_env, offsetof(CPUMBState, ear));
+            tcg_gen_extrl_i64_i32(dest, t64);
+            tcg_temp_free_i64(t64);
+        }
+        break;
+    case SR_ESR:
+        tcg_gen_ld_i32(dest, cpu_env, offsetof(CPUMBState, esr));
+        break;
+    case SR_FSR:
+        tcg_gen_ld_i32(dest, cpu_env, offsetof(CPUMBState, fsr));
+        break;
+    case SR_BTR:
+        tcg_gen_ld_i32(dest, cpu_env, offsetof(CPUMBState, btr));
+        break;
+    case SR_EDR:
+        tcg_gen_ld_i32(dest, cpu_env, offsetof(CPUMBState, edr));
+        break;
+    case 0x800:
+        tcg_gen_ld_i32(dest, cpu_env, offsetof(CPUMBState, slr));
+        break;
+    case 0x802:
+        tcg_gen_ld_i32(dest, cpu_env, offsetof(CPUMBState, shr));
+        break;
+
+#ifndef CONFIG_USER_ONLY
+    case 0x1000: /* PID */
+    case 0x1001: /* ZPR */
+    case 0x1002: /* TLBX */
+    case 0x1003: /* TLBLO */
+    case 0x1004: /* TLBHI */
+    case 0x1005: /* TLBSX */
+        {
+            TCGv_i32 tmp_ext = tcg_const_i32(arg->e);
+            TCGv_i32 tmp_reg = tcg_const_i32(arg->rs & 7);
+
+            gen_helper_mmu_read(dest, cpu_env, tmp_ext, tmp_reg);
+            tcg_temp_free_i32(tmp_reg);
+            tcg_temp_free_i32(tmp_ext);
+        }
+        break;
 #endif
 
-    if (to) {
-        switch (sr) {
-            case SR_PC:
-                break;
-            case SR_MSR:
-                msr_write(dc, cpu_R[dc->ra]);
-                break;
-            case SR_EAR:
-                {
-                    TCGv_i64 t64 = tcg_temp_new_i64();
-                    tcg_gen_extu_i32_i64(t64, cpu_R[dc->ra]);
-                    tcg_gen_st_i64(t64, cpu_env, offsetof(CPUMBState, ear));
-                    tcg_temp_free_i64(t64);
-                }
-                break;
-            case SR_ESR:
-                tcg_gen_st_i32(cpu_R[dc->ra],
-                               cpu_env, offsetof(CPUMBState, esr));
-                break;
-            case SR_FSR:
-                tcg_gen_st_i32(cpu_R[dc->ra],
-                               cpu_env, offsetof(CPUMBState, fsr));
-                break;
-            case SR_BTR:
-                tcg_gen_st_i32(cpu_R[dc->ra],
-                               cpu_env, offsetof(CPUMBState, btr));
-                break;
-            case SR_EDR:
-                tcg_gen_st_i32(cpu_R[dc->ra],
-                               cpu_env, offsetof(CPUMBState, edr));
-                break;
-            case 0x800:
-                tcg_gen_st_i32(cpu_R[dc->ra],
-                               cpu_env, offsetof(CPUMBState, slr));
-                break;
-            case 0x802:
-                tcg_gen_st_i32(cpu_R[dc->ra],
-                               cpu_env, offsetof(CPUMBState, shr));
-                break;
-            default:
-                cpu_abort(CPU(dc->cpu), "unknown mts reg %x\n", sr);
-                break;
-        }
-    } else {
-        switch (sr) {
-            case SR_PC:
-                tcg_gen_movi_i32(cpu_R[dc->rd], dc->base.pc_next);
-                break;
-            case SR_MSR:
-                msr_read(dc, cpu_R[dc->rd]);
-                break;
-            case SR_EAR:
-                {
-                    TCGv_i64 t64 = tcg_temp_new_i64();
-                    tcg_gen_ld_i64(t64, cpu_env, offsetof(CPUMBState, ear));
-                    if (extended) {
-                        tcg_gen_extrh_i64_i32(cpu_R[dc->rd], t64);
-                    } else {
-                        tcg_gen_extrl_i64_i32(cpu_R[dc->rd], t64);
-                    }
-                    tcg_temp_free_i64(t64);
-                }
-                break;
-            case SR_ESR:
-                tcg_gen_ld_i32(cpu_R[dc->rd],
-                               cpu_env, offsetof(CPUMBState, esr));
-                break;
-            case SR_FSR:
-                tcg_gen_ld_i32(cpu_R[dc->rd],
-                               cpu_env, offsetof(CPUMBState, fsr));
-                break;
-            case SR_BTR:
-                tcg_gen_ld_i32(cpu_R[dc->rd],
-                               cpu_env, offsetof(CPUMBState, btr));
-                break;
-            case SR_EDR:
-                tcg_gen_ld_i32(cpu_R[dc->rd],
-                               cpu_env, offsetof(CPUMBState, edr));
-                break;
-            case 0x800:
-                tcg_gen_ld_i32(cpu_R[dc->rd],
-                               cpu_env, offsetof(CPUMBState, slr));
-                break;
-            case 0x802:
-                tcg_gen_ld_i32(cpu_R[dc->rd],
-                               cpu_env, offsetof(CPUMBState, shr));
-                break;
-            case 0x2000 ... 0x200c:
-                rn = sr & 0xf;
-                tcg_gen_ld_i32(cpu_R[dc->rd],
-                              cpu_env, offsetof(CPUMBState, pvr.regs[rn]));
-                break;
-            default:
-                cpu_abort(cs, "unknown mfs reg %x\n", sr);
-                break;
-        }
-    }
-
-    if (dc->rd == 0) {
-        tcg_gen_movi_i32(cpu_R[0], 0);
+    case 0x2000 ... 0x200c:
+        tcg_gen_ld_i32(dest, cpu_env,
+                       offsetof(CPUMBState, pvr.regs[arg->rs - 0x2000]));
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid mfs reg 0x%x\n", arg->rs);
+        break;
     }
+    return true;
 }
 
 static void do_rti(DisasContext *dc)
@@ -1620,7 +1623,6 @@ static struct decoder_info {
     };
     void (*dec)(DisasContext *dc);
 } decinfo[] = {
-    {DEC_MSR, dec_msr},
     {DEC_STREAM, dec_stream},
     {{0, 0}, dec_null}
 };
-- 
2.25.1


