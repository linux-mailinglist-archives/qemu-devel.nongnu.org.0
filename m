Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AB937100E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:13:56 +0200 (CEST)
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldMDj-0007uE-Jy
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLy6-0007jP-CD
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:46 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:35525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLy4-0000e9-1W
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:46 -0400
Received: by mail-pf1-x435.google.com with SMTP id i13so3003224pfu.2
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BHu4qM/MhMiYC/c/WCqDscmQkpu/YOU/5ukcDk8ND1k=;
 b=i3YZBtL229NCd2oEeKiDgLFcUVcNuhZBs4GbRwzpGDqcvZYSEil9TEfLgQWbTJmDC+
 ohh7LKaohGb20fWqdjYeguB3q4hzvgLLludNE9pIh2AQJ3/j2wEXN8133jZBIxgvJMNb
 5S3Bh3Bg3lihR2PFi/olvw7j8n6X2wTUvuq1vy9QPEwSRNQLPcg7vqqYVJ7h+hpIkquH
 gpCNPCz5RuqXV+hSm7BJwfLrcE22UaAM3fYbu43daixfC9eFMFMCxMgOou4c3QPhvRRN
 i2kGtgDZNOyItCRycuf7bd1dgAECmZhxt3QcsG91X60hWCxxzpjABBRZyXV0TEXcEFMr
 MBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BHu4qM/MhMiYC/c/WCqDscmQkpu/YOU/5ukcDk8ND1k=;
 b=LG4GT9nEYrzSX3o2nIAa7MZVs0eE/SlIQQ+aZn1+AJgKUnl2yeY5AgIVY6TFkgdR5L
 cE14at8PYKhLW3Cf+oMhpVrztqL48EQMyeYMoc0dwx/MhTBOL1n01LSZ1i5vyRuLjm3s
 UjBAlEoZymOI6jtOxtfRLkDUqTVvVKO3TPf73cxNlqknUwXLXstY/+G2PGniVg7OC/Em
 oD5pkHPMmqY5tP2qW8jbxVNY/2cO/OJ7ouAfzansT4gJb9d4uJHWLtWnsygY6tkAd4jT
 wPtjraL252DLFRKWhaVKah4MhBGMi0Wu14mDnKPijucOLfa3mhrdB0u4V1oV8KPkt01y
 FZYw==
X-Gm-Message-State: AOAM530T9ojuSxsfS/8yAn6NoKDakBBfeorjh1Rj80IGsf2Ez2Wb6THJ
 Xezffef3UJOqrY7pAlGf1BOBtx9LRi64Ag==
X-Google-Smtp-Source: ABdhPJy4rNjuZHCw37QISrHmFpTvkgF8XcKCCV8VT5SVL/KK5I7c4r0y90sxGS0NPR665tEpJrzjkg==
X-Received: by 2002:a63:e918:: with SMTP id i24mr15743249pgh.118.1619999862812; 
 Sun, 02 May 2021 16:57:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 17/26] tcg/tci: Implement movcond
Date: Sun,  2 May 2021 16:57:18 -0700
Message-Id: <20210502235727.1979457-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
index ea28077847..7f1d54158e 100644
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
@@ -419,6 +421,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -431,6 +438,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -1136,7 +1148,8 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            op_name, str_r(r0), str_r(r1), str_r(r2), pos, len);
         break;
 
-#if TCG_TARGET_REG_BITS == 32
+    case INDEX_op_movcond_i32:
+    case INDEX_op_movcond_i64:
     case INDEX_op_setcond2_i32:
         tci_args_rrrrrc(insn, &r0, &r1, &r2, &r3, &r4, &c);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s, %s, %s",
@@ -1144,6 +1157,7 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
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


