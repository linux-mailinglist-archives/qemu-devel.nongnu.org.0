Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A883376D2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:20:16 +0100 (CET)
Received: from localhost ([::1]:58064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKN6l-0000ai-6E
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVV-0004MA-W4
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:46 -0500
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:38713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVR-000709-P3
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:44 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id t5so2640783qvs.5
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BvlzLp6n+uhbL6lJ6/SY8kpsbMrMSqUUMDmNT2MwoZ8=;
 b=d5A5eaI2z4s0UJKnwj8g3M/FF722KSD2V9Zv2GoRVbLLC+jOcMIMpOaO2ITsUkPpm8
 hcH5oFAhxqxo4q7eiIXZqd7wTL5oDPoOj4rIy1ClPnjLRQhrOyWZFyGImQwuWh3Qw1G4
 Y/DieB5l0VtHRDpep8zWhdVE3650LRnK03sxIQjhjtMBi2BUS4t9hF04nKTA3UFGkfY9
 o5HUcqT1AGrgKTcUJUJRT74HjNv2rwALaFG5HCf+XJGb+Auf3+IAPcVgigLUxHxm6KJF
 iQ0O0bVyYogIrbOqptu9Ixv0nKDduP4kAKMy9CxqjGKGWN/cUSAyMVmkTezrmjH4EQPr
 pK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BvlzLp6n+uhbL6lJ6/SY8kpsbMrMSqUUMDmNT2MwoZ8=;
 b=nHMM9xw7sqtgH9QyLSDRpKpmgsuKK8nzLAg0LhR8BVbdbW6iSAXdQPpIbAOvENgB6T
 lwKZp3McAA0SF2uuw4fOZfsdm8aG7ihRNAoLwbngUVHmaNbvdYE2bOTsIwd8+7Oc+vhi
 BIqF+jK7SiJdkYYaBMWModEf5DXZTUFTbE8Qg6pedaVgibCK5WYrPzoQnhsarUrnf6TX
 Wt2KxBkWzBue7RX0MQI0DlaUQGTyD0Bvp3tdw0QYJzvfujq3HNgLdYSqcBPcS9MI9g+b
 z71if36am/+VVtjUhOETffVcE35V/gT91sZaViCz50GCbTMu9b6AxlEwVR6K+ypYYtl+
 7wsw==
X-Gm-Message-State: AOAM531Hh/qnz/xu16t/zzVTeJXGP+XmyxiEZ8ckaak/Y7chpbyDluYI
 4DPvKcP9S+icHDlYI6DEyMU+LdEY0GSfVNio
X-Google-Smtp-Source: ABdhPJxSOWx3nAsdYipJhRH+5gHAVlILlQu0GnQdzwCQAmp8iMaOEaISdpgUD35KstslnBbkPHp1bw==
X-Received: by 2002:a0c:a954:: with SMTP id z20mr7764934qva.29.1615473700669; 
 Thu, 11 Mar 2021 06:41:40 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g14sm1962421qkm.98.2021.03.11.06.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:41:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 53/57] tcg/tci: Implement add2, sub2
Date: Thu, 11 Mar 2021 08:39:54 -0600
Message-Id: <20210311143958.562625-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already had the 32-bit versions for a 32-bit host; expand this
to 64-bit hosts as well.  The 64-bit opcodes are new.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     |  8 ++++----
 tcg/tci.c                | 40 ++++++++++++++++++++++++++--------------
 tcg/tci/tcg-target.c.inc | 15 ++++++++-------
 3 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 71a44bbfb0..515b3c7a56 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -121,11 +121,11 @@
 #define TCG_TARGET_HAS_rot_i64          1
 #define TCG_TARGET_HAS_movcond_i64      1
 #define TCG_TARGET_HAS_muls2_i64        1
-#define TCG_TARGET_HAS_add2_i32         0
-#define TCG_TARGET_HAS_sub2_i32         0
+#define TCG_TARGET_HAS_add2_i32         1
+#define TCG_TARGET_HAS_sub2_i32         1
 #define TCG_TARGET_HAS_mulu2_i32        1
-#define TCG_TARGET_HAS_add2_i64         0
-#define TCG_TARGET_HAS_sub2_i64         0
+#define TCG_TARGET_HAS_add2_i64         1
+#define TCG_TARGET_HAS_sub2_i64         1
 #define TCG_TARGET_HAS_mulu2_i64        1
 #define TCG_TARGET_HAS_muluh_i64        0
 #define TCG_TARGET_HAS_mulsh_i64        0
diff --git a/tcg/tci.c b/tcg/tci.c
index d76b9f5798..0240d850cf 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -189,7 +189,6 @@ static void tci_args_rrrrrc(uint32_t insn, TCGReg *r0, TCGReg *r1,
     *c5 = extract32(insn, 28, 4);
 }
 
-#if TCG_TARGET_REG_BITS == 32
 static void tci_args_rrrrrr(uint32_t insn, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGReg *r5)
 {
@@ -200,7 +199,6 @@ static void tci_args_rrrrrr(uint32_t insn, TCGReg *r0, TCGReg *r1,
     *r4 = extract32(insn, 24, 4);
     *r5 = extract32(insn, 28, 4);
 }
-#endif
 
 static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
 {
@@ -351,17 +349,14 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
     for (;;) {
         uint32_t insn;
         TCGOpcode opc;
-        TCGReg r0, r1, r2, r3, r4;
+        TCGReg r0, r1, r2, r3, r4, r5;
         tcg_target_ulong t1;
         TCGCond condition;
         target_ulong taddr;
         uint8_t pos, len;
         uint32_t tmp32;
         uint64_t tmp64;
-#if TCG_TARGET_REG_BITS == 32
-        TCGReg r5;
         uint64_t T1, T2;
-#endif
         TCGMemOpIdx oi;
         int32_t ofs;
         void *ptr;
@@ -655,20 +650,22 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 tb_ptr = ptr;
             }
             break;
-#if TCG_TARGET_REG_BITS == 32
+#if TCG_TARGET_REG_BITS == 32 || TCG_TARGET_HAS_add2_i32
         case INDEX_op_add2_i32:
             tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
             T1 = tci_uint64(regs[r3], regs[r2]);
             T2 = tci_uint64(regs[r5], regs[r4]);
             tci_write_reg64(regs, r1, r0, T1 + T2);
             break;
+#endif
+#if TCG_TARGET_REG_BITS == 32 || TCG_TARGET_HAS_sub2_i32
         case INDEX_op_sub2_i32:
             tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
             T1 = tci_uint64(regs[r3], regs[r2]);
             T2 = tci_uint64(regs[r5], regs[r4]);
             tci_write_reg64(regs, r1, r0, T1 - T2);
             break;
-#endif /* TCG_TARGET_REG_BITS == 32 */
+#endif
 #if TCG_TARGET_HAS_mulu2_i32
         case INDEX_op_mulu2_i32:
             tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
@@ -798,6 +795,24 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             muls64(&regs[r0], &regs[r1], regs[r2], regs[r3]);
             break;
 #endif
+#if TCG_TARGET_HAS_add2_i64
+        case INDEX_op_add2_i64:
+            tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
+            T1 = regs[r2] + regs[r4];
+            T2 = regs[r3] + regs[r5] + (T1 < regs[r2]);
+            regs[r0] = T1;
+            regs[r1] = T2;
+            break;
+#endif
+#if TCG_TARGET_HAS_add2_i64
+        case INDEX_op_sub2_i64:
+            tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
+            T1 = regs[r2] - regs[r4];
+            T2 = regs[r3] - regs[r5] - (regs[r2] < regs[r4]);
+            regs[r0] = T1;
+            regs[r1] = T2;
+            break;
+#endif
 
             /* Shift/rotate operations (64 bit). */
 
@@ -1114,10 +1129,7 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     const char *op_name;
     uint32_t insn;
     TCGOpcode op;
-    TCGReg r0, r1, r2, r3, r4;
-#if TCG_TARGET_REG_BITS == 32
-    TCGReg r5;
-#endif
+    TCGReg r0, r1, r2, r3, r4, r5;
     tcg_target_ulong i1;
     int32_t s2;
     TCGCond c;
@@ -1315,15 +1327,15 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            str_r(r2), str_r(r3));
         break;
 
-#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_add2_i32:
+    case INDEX_op_add2_i64:
     case INDEX_op_sub2_i32:
+    case INDEX_op_sub2_i64:
         tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
         info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s,%s,%s",
                            op_name, str_r(r0), str_r(r1), str_r(r2),
                            str_r(r3), str_r(r4), str_r(r5));
         break;
-#endif
 
     case INDEX_op_qemu_ld_i64:
     case INDEX_op_qemu_st_i64:
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index eb48633fba..9b2e2c32a1 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -134,11 +134,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_brcond_i64:
         return C_O0_I2(r, r);
 
-#if TCG_TARGET_REG_BITS == 32
-    /* TODO: Support R, R, R, R, RI, RI? Will it be faster? */
     case INDEX_op_add2_i32:
+    case INDEX_op_add2_i64:
     case INDEX_op_sub2_i32:
+    case INDEX_op_sub2_i64:
         return C_O2_I4(r, r, r, r, r, r);
+
+#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_brcond2_i32:
         return C_O0_I4(r, r, r, r);
 #endif
@@ -467,7 +469,6 @@ static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
     tcg_out32(s, insn);
 }
 
-#if TCG_TARGET_REG_BITS == 32
 static void tcg_out_op_rrrrrr(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGReg r5)
@@ -483,7 +484,6 @@ static void tcg_out_op_rrrrrr(TCGContext *s, TCGOpcode op,
     insn = deposit32(insn, 28, 4, r5);
     tcg_out32(s, insn);
 }
-#endif
 
 static void tcg_out_ldst(TCGContext *s, TCGOpcode op, TCGReg val,
                          TCGReg base, intptr_t offset)
@@ -719,12 +719,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_op_rr(s, opc, args[0], args[1]);
         break;
 
-#if TCG_TARGET_REG_BITS == 32
-    case INDEX_op_add2_i32:
-    case INDEX_op_sub2_i32:
+    CASE_32_64(add2)
+    CASE_32_64(sub2)
         tcg_out_op_rrrrrr(s, opc, args[0], args[1], args[2],
                           args[3], args[4], args[5]);
         break;
+
+#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_brcond2_i32:
         tcg_out_op_rrrrrc(s, INDEX_op_setcond2_i32, TCG_REG_TMP,
                           args[0], args[1], args[2], args[3], args[4]);
-- 
2.25.1


