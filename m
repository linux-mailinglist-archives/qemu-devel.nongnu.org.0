Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F8230EA8D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 04:00:48 +0100 (CET)
Received: from localhost ([::1]:39740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Usx-00017x-Pn
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 22:00:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Ttj-0001xb-Fw
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:57:35 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tte-0007Gt-CL
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:57:31 -0500
Received: by mail-pg1-x52b.google.com with SMTP id o16so1053047pgg.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lLuTVZMheh+w94V9lSybCso+88KsI23VfpQyYgw6vik=;
 b=T84PwoRa2Bfd4ZzTRRQ3ZFeC4XpI1P6LuRY8EnN4aIOOf2qKBaYY0z+QtuNgVhwDVO
 yfyhJ9DImz3JpcFpFuEIq2eoaPcUfME5SlswIPlsq0/AEg5wcAnttmeEuB6b7S7L9vq1
 n3Cj8qGM6MMT5L9+VgWsGckLhv2Lk8F+P+XOJm0zmctJYSk5lhW0HXYri8kzswZRP/1v
 Cn08ZucRpt1QCPDrlHFN0MkYcnpKgUuS5YwdBCMhedsqcZxNaWku3zHZ/TZOt49OVZBT
 0/8jRSEdReujHq6qtQHJcra5UXHJMDA5XQ6sUl/oxHOGvSGWABt1ObtXz/lnPerv5yrt
 213Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lLuTVZMheh+w94V9lSybCso+88KsI23VfpQyYgw6vik=;
 b=Y2WgTBN0JWOrxdA+veGDK1mkMYpUT+lmqwOuTEma5i/LxY9+DF+K2VuiXjmQF1Nd29
 M8iJQmxwfroopedPDvK0csXkFlBYyww++EaIp+nUP5VEOx0koehA0DCIEDVMXKc3z7pS
 z5Z59M0WPeMxCiWemmyj7Xj3uY9YnTpTyEbLKxQixH0j7wGR9OsUaO7sQ1k27oEw71VP
 ij3LlCwDlU9QF/DqZS2bctdN02lL7Rh2B76cDVxPFZhLL4F0kynnUOGR58gk07UVGWZU
 YmQI5mqZWdl4BjYre84D/2SFOSb57cN8OQBxd/kheHjh0oHI/em6Xv00PfO0UWd6SRl1
 5Njw==
X-Gm-Message-State: AOAM533tKs9fZjsfIFQAJKgBvzNRGr3yyfA4p2pmt+Sd13X+5zprGEaz
 SRy3ebFwpBQXgnh3j9YcxM5tYU+LYisYqaHi
X-Google-Smtp-Source: ABdhPJxzODLJ1Xk9SMa+FBPDVWuSbMXq6naZ7Ul9flqcmE8yKAP3hlAp0ko92Q62xLXYGad9dNrb1g==
X-Received: by 2002:a65:418b:: with SMTP id a11mr6528127pgq.231.1612403844972; 
 Wed, 03 Feb 2021 17:57:24 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id p15sm3610684pfn.172.2021.02.03.17.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:57:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 88/93] tcg/tci: Implement movcond
Date: Wed,  3 Feb 2021 15:57:21 -1000
Message-Id: <20210204015721.885711-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When this opcode is not available in the backend, tcg middle-end
will expand this as a series of 5 opcodes.  So implementing this
saves bytecode space.

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
index a6e30d31a9..2a39f8f5a0 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -169,6 +169,7 @@ static void tci_args_rrrr(uint32_t insn,
     *r2 = extract32(insn, 16, 4);
     *r3 = extract32(insn, 20, 4);
 }
+#endif
 
 static void tci_args_rrrrrc(uint32_t insn, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
@@ -181,6 +182,7 @@ static void tci_args_rrrrrc(uint32_t insn, TCGReg *r0, TCGReg *r1,
     *c5 = extract32(insn, 28, 4);
 }
 
+#if TCG_TARGET_REG_BITS == 32
 static void tci_args_rrrrrr(uint32_t insn, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGReg *r5)
 {
@@ -431,6 +433,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -443,6 +450,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -1148,7 +1160,8 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            op_name, str_r(r0), str_r(r1), str_r(r2), pos, len);
         break;
 
-#if TCG_TARGET_REG_BITS == 32
+    case INDEX_op_movcond_i32:
+    case INDEX_op_movcond_i64:
     case INDEX_op_setcond2_i32:
         tci_args_rrrrrc(insn, &r0, &r1, &r2, &r3, &r4, &c);
         info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s,%s,%s",
@@ -1156,6 +1169,7 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            str_r(r3), str_r(r4), str_c(c));
         break;
 
+#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_mulu2_i32:
         tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
         info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s",
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index db29bc6e54..a0c458a60a 100644
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
@@ -591,12 +596,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
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


