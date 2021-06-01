Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24C839763C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:12:01 +0200 (CEST)
Received: from localhost ([::1]:36544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo63k-0005Lk-OG
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tr-0002TZ-5B
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:47 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:42694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5th-0002dk-1p
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:44 -0400
Received: by mail-il1-x130.google.com with SMTP id h11so13192844ili.9
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vdDKxhVSfVTZdarXG0XuySIyA0ROKeY6db26ImvLAi8=;
 b=gkSmNUVAULLUj4RTHkySFePOFKH5yQeDaVXRVaO/gxV54GnTzOLzA7U3uptCPQeuvD
 hVI5Nd6s+ZfK6O1/T9MgXithoJ4VB42AB5X+hZxN0MYqvQWkJ5tiWStt9pK563k1iTNj
 TqEKkz7JPQO3MYOos7iK6ctINy+GczuBxKlldnc2bdq5C/sdt67ohdkdHgWWdJDNYSns
 nUHEwdZYfdsEsiAZSsxZ6kvOX41sb0QFs5+cWLUSMTIRiLUD8j0VA1vqWiqRpoPHiPFN
 fzUJcVNOAQhzAFp1naTBgzussegsFJG81AoTihWYtUuz4T58m8hFiZgkDxuD0GKH00in
 Ocqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vdDKxhVSfVTZdarXG0XuySIyA0ROKeY6db26ImvLAi8=;
 b=jYVfHgb75jULfWEBCWDq4/00LefnPclMpQcqk3dNqnbVOx+hvRd63k04vs5IbL4Ihs
 05JOfFLt/XBhvMdtnHBCKydfhxpLdY5Pp44K9fI+GRauqK3uTr92KGSP+mC4IOORT2s7
 HBYDkxkG2djhkxZkWb76ULZGiGzA0y+dBSSOoYnqKspJskd2qWGL02z/J29KTyYpkV1F
 ZXoS1F9RKFSp7841aPPVVT1vrcQ8stdkXwYg+B0MsheguWF/+8NmkljxXQ/WtFwdiHgs
 7vG11830JnJA3hTwe8w4iNVX9SDXspX12QXjlPm/XSJlmwHakg68jvH9qO7yLxiVzU9f
 FvUQ==
X-Gm-Message-State: AOAM532AWtS0Oc0jqBLJqPWxRguQCjZy+s7lWgtP4ZMgCKhOizdnybY5
 xUvco/YfdkGwMykO64cS5KxQMLYdm+OVynQg
X-Google-Smtp-Source: ABdhPJw5IMSa5TKcj3j8JK/y0OruDTecsExAYYsCE/2HzQhen/yG6W2TmTNjt/JMZUJIItofD0yXJg==
X-Received: by 2002:a92:c003:: with SMTP id q3mr716719ild.128.1622559692310;
 Tue, 01 Jun 2021 08:01:32 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 17/27] tcg/tci: Implement movcond
Date: Tue,  1 Jun 2021 08:00:56 -0700
Message-Id: <20210601150106.12761-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x130.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When this opcode is not available in the backend, tcg middle-end
will expand this as a series of 5 opcodes.  So implementing this
saves bytecode space.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     |  4 ++--
 tcg/tci.c                | 16 +++++++++++++++-
 tcg/tci/tcg-target.c.inc | 10 +++++++---
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 17911d3297..f53773a555 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -82,7 +82,7 @@
 #define TCG_TARGET_HAS_not_i32          1
 #define TCG_TARGET_HAS_orc_i32          0
 #define TCG_TARGET_HAS_rot_i32          1
-#define TCG_TARGET_HAS_movcond_i32      0
+#define TCG_TARGET_HAS_movcond_i32      1
 #define TCG_TARGET_HAS_muls2_i32        0
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
@@ -119,7 +119,7 @@
 #define TCG_TARGET_HAS_not_i64          1
 #define TCG_TARGET_HAS_orc_i64          0
 #define TCG_TARGET_HAS_rot_i64          1
-#define TCG_TARGET_HAS_movcond_i64      0
+#define TCG_TARGET_HAS_movcond_i64      1
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_add2_i32         0
 #define TCG_TARGET_HAS_sub2_i32         0
diff --git a/tcg/tci.c b/tcg/tci.c
index 3636b03adf..1f4f52bac8 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -171,6 +171,7 @@ static void tci_args_rrrr(uint32_t insn,
     *r2 = extract32(insn, 16, 4);
     *r3 = extract32(insn, 20, 4);
 }
+#endif
 
 static void tci_args_rrrrrc(uint32_t insn, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
@@ -183,6 +184,7 @@ static void tci_args_rrrrrc(uint32_t insn, TCGReg *r0, TCGReg *r1,
     *c5 = extract32(insn, 28, 4);
 }
 
+#if TCG_TARGET_REG_BITS == 32
 static void tci_args_rrrrrr(uint32_t insn, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGReg *r5)
 {
@@ -420,6 +422,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_args_rrrc(insn, &r0, &r1, &r2, &condition);
             regs[r0] = tci_compare32(regs[r1], regs[r2], condition);
             break;
+        case INDEX_op_movcond_i32:
+            tci_args_rrrrrc(insn, &r0, &r1, &r2, &r3, &r4, &condition);
+            tmp32 = tci_compare32(regs[r1], regs[r2], condition);
+            regs[r0] = regs[tmp32 ? r3 : r4];
+            break;
 #if TCG_TARGET_REG_BITS == 32
         case INDEX_op_setcond2_i32:
             tci_args_rrrrrc(insn, &r0, &r1, &r2, &r3, &r4, &condition);
@@ -432,6 +439,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_args_rrrc(insn, &r0, &r1, &r2, &condition);
             regs[r0] = tci_compare64(regs[r1], regs[r2], condition);
             break;
+        case INDEX_op_movcond_i64:
+            tci_args_rrrrrc(insn, &r0, &r1, &r2, &r3, &r4, &condition);
+            tmp32 = tci_compare64(regs[r1], regs[r2], condition);
+            regs[r0] = regs[tmp32 ? r3 : r4];
+            break;
 #endif
         CASE_32_64(mov)
             tci_args_rr(insn, &r0, &r1);
@@ -1137,7 +1149,8 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            op_name, str_r(r0), str_r(r1), str_r(r2), pos, len);
         break;
 
-#if TCG_TARGET_REG_BITS == 32
+    case INDEX_op_movcond_i32:
+    case INDEX_op_movcond_i64:
     case INDEX_op_setcond2_i32:
         tci_args_rrrrrc(insn, &r0, &r1, &r2, &r3, &r4, &c);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s, %s, %s",
@@ -1145,6 +1158,7 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            str_r(r3), str_r(r4), str_c(c));
         break;
 
+#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_mulu2_i32:
         tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s",
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 01a8e20c5d..e7a07c1811 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -133,9 +133,12 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O0_I4(r, r, r, r);
     case INDEX_op_mulu2_i32:
         return C_O2_I2(r, r, r, r);
+#endif
+
+    case INDEX_op_movcond_i32:
+    case INDEX_op_movcond_i64:
     case INDEX_op_setcond2_i32:
         return C_O1_I4(r, r, r, r, r);
-#endif
 
     case INDEX_op_qemu_ld_i32:
         return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
@@ -419,6 +422,7 @@ static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
     insn = deposit32(insn, 20, 4, r3);
     tcg_out32(s, insn);
 }
+#endif
 
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
@@ -436,6 +440,7 @@ static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
     tcg_out32(s, insn);
 }
 
+#if TCG_TARGET_REG_BITS == 32
 static void tcg_out_op_rrrrrr(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGReg r5)
@@ -589,12 +594,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_op_rrrc(s, opc, args[0], args[1], args[2], args[3]);
         break;
 
-#if TCG_TARGET_REG_BITS == 32
+    CASE_32_64(movcond)
     case INDEX_op_setcond2_i32:
         tcg_out_op_rrrrrc(s, opc, args[0], args[1], args[2],
                           args[3], args[4], args[5]);
         break;
-#endif
 
     CASE_32_64(ld8u)
     CASE_32_64(ld8s)
-- 
2.25.1


