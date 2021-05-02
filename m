Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC4C371014
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:19:20 +0200 (CEST)
Received: from localhost ([::1]:49060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldMIx-0004dM-Hs
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLy8-0007lN-RR
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:49 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLy5-0000fG-Hu
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:48 -0400
Received: by mail-pg1-x534.google.com with SMTP id t22so2516948pgu.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Iop9lS3YJAqVSei4s6Hlfu43Tzbs5sje2md6BmFXFTk=;
 b=fCpDI7cYj6qJnPCswsoEtpIkcxUD22tXIWUUtpKiKxtkTW9eKaDvDyUyKEGZ/Tesp1
 6Efnb6hLrDvDyZV3Q1UiJagZgTq8Ker3Xwim/ZwTD/WIU9uk0HNqIVUjq2hTwlvVCqoC
 kRvo6A9dgKI7BT33Q4+UESW3fmsITKLHh+88MbdvK/WRjGphtz7aIhGjCWJ8XMAB8liy
 pL70Wx19S5jI3zGmS6EN+TQVY06K3WAXPpqh/I0BoUbV2v5xO9WNQnSiQdna8PGJxPVX
 QeMPb3ItCKnwikKO7oBoxSnilHrgTzwYTfhLCD26bfEt4MULgCQnjaE6igU2Qr8Mig03
 Fw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iop9lS3YJAqVSei4s6Hlfu43Tzbs5sje2md6BmFXFTk=;
 b=J0ruv3rv/LZiJOFhXWgIz5GlyzBR58CkRLkXNdIlb1cXu/UbuTgmlOl7wztLPUAqfT
 RPo6Grd5kfoctc6/EHCvMxMbs/3sAjO8f9p0ZTpdj+OTKm9TBkBHeJdznRtpPytTPRaj
 UxWovS6RQ4YLgYeUwU7TioUJgWMY4vAIsYp0OM6VF1Criqyaob34khKsblz4HMTPy6VM
 ck6bqCGmd9D2LRMWj6YhFULIW8IOP8W6kvyNbDv/7SLoARFsvbRxcV+WEZJ7V8IdHMKu
 bd4cm4AnkZA29YKzx4ipeZmOELI9EGDGjLAG7ZGLelc6U0GO4u8Ds12+B0APSTgpPs9e
 SKuQ==
X-Gm-Message-State: AOAM530qTlSXxlUA/EMP1lYH63jmH/Wa8g8YM0hMYZHkJo1cQMj1qM8Q
 TRx2JfB3Jh/DOyJ5NV52ulNoXOxDHyPJ4Q==
X-Google-Smtp-Source: ABdhPJzYn+K+E9D8hQ8IKgQfLPuRqrZHnlR3+Ajkv1+twfE56DXVlCnsGPPMybM6dh6n02sy1gFObg==
X-Received: by 2002:a63:8f0b:: with SMTP id n11mr5371730pgd.162.1619999864315; 
 Sun, 02 May 2021 16:57:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 19/26] tcg/tci: Implement extract, sextract
Date: Sun,  2 May 2021 16:57:20 -0700
Message-Id: <20210502235727.1979457-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     |  8 ++++----
 tcg/tci.c                | 42 ++++++++++++++++++++++++++++++++++++++++
 tcg/tci/tcg-target.c.inc | 32 ++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+), 4 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 5945272a43..60b67b196b 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -69,8 +69,8 @@
 #define TCG_TARGET_HAS_ext16u_i32       1
 #define TCG_TARGET_HAS_andc_i32         1
 #define TCG_TARGET_HAS_deposit_i32      1
-#define TCG_TARGET_HAS_extract_i32      0
-#define TCG_TARGET_HAS_sextract_i32     0
+#define TCG_TARGET_HAS_extract_i32      1
+#define TCG_TARGET_HAS_sextract_i32     1
 #define TCG_TARGET_HAS_extract2_i32     0
 #define TCG_TARGET_HAS_eqv_i32          1
 #define TCG_TARGET_HAS_nand_i32         1
@@ -97,8 +97,8 @@
 #define TCG_TARGET_HAS_bswap32_i64      1
 #define TCG_TARGET_HAS_bswap64_i64      1
 #define TCG_TARGET_HAS_deposit_i64      1
-#define TCG_TARGET_HAS_extract_i64      0
-#define TCG_TARGET_HAS_sextract_i64     0
+#define TCG_TARGET_HAS_extract_i64      1
+#define TCG_TARGET_HAS_sextract_i64     1
 #define TCG_TARGET_HAS_extract2_i64     0
 #define TCG_TARGET_HAS_div_i64          1
 #define TCG_TARGET_HAS_rem_i64          1
diff --git a/tcg/tci.c b/tcg/tci.c
index 3e16dc30cf..d9a00f9f3a 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -124,6 +124,15 @@ static void tci_args_rrs(uint32_t insn, TCGReg *r0, TCGReg *r1, int32_t *i2)
     *i2 = sextract32(insn, 16, 16);
 }
 
+static void tci_args_rrbb(uint32_t insn, TCGReg *r0, TCGReg *r1,
+                          uint8_t *i2, uint8_t *i3)
+{
+    *r0 = extract32(insn, 8, 4);
+    *r1 = extract32(insn, 12, 4);
+    *i2 = extract32(insn, 16, 6);
+    *i3 = extract32(insn, 22, 6);
+}
+
 static void tci_args_rrrc(uint32_t insn,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGCond *c3)
 {
@@ -607,6 +616,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_args_rrrbb(insn, &r0, &r1, &r2, &pos, &len);
             regs[r0] = deposit32(regs[r1], pos, len, regs[r2]);
             break;
+#endif
+#if TCG_TARGET_HAS_extract_i32
+        case INDEX_op_extract_i32:
+            tci_args_rrbb(insn, &r0, &r1, &pos, &len);
+            regs[r0] = extract32(regs[r1], pos, len);
+            break;
+#endif
+#if TCG_TARGET_HAS_sextract_i32
+        case INDEX_op_sextract_i32:
+            tci_args_rrbb(insn, &r0, &r1, &pos, &len);
+            regs[r0] = sextract32(regs[r1], pos, len);
+            break;
 #endif
         case INDEX_op_brcond_i32:
             tci_args_rl(insn, tb_ptr, &r0, &ptr);
@@ -747,6 +768,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_args_rrrbb(insn, &r0, &r1, &r2, &pos, &len);
             regs[r0] = deposit64(regs[r1], pos, len, regs[r2]);
             break;
+#endif
+#if TCG_TARGET_HAS_extract_i64
+        case INDEX_op_extract_i64:
+            tci_args_rrbb(insn, &r0, &r1, &pos, &len);
+            regs[r0] = extract64(regs[r1], pos, len);
+            break;
+#endif
+#if TCG_TARGET_HAS_sextract_i64
+        case INDEX_op_sextract_i64:
+            tci_args_rrbb(insn, &r0, &r1, &pos, &len);
+            regs[r0] = sextract64(regs[r1], pos, len);
+            break;
 #endif
         case INDEX_op_brcond_i64:
             tci_args_rl(insn, tb_ptr, &r0, &ptr);
@@ -1188,6 +1221,15 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            op_name, str_r(r0), str_r(r1), str_r(r2), pos, len);
         break;
 
+    case INDEX_op_extract_i32:
+    case INDEX_op_extract_i64:
+    case INDEX_op_sextract_i32:
+    case INDEX_op_sextract_i64:
+        tci_args_rrbb(insn, &r0, &r1, &pos, &len);
+        info->fprintf_func(info->stream, "%-12s  %s,%s,%d,%d",
+                           op_name, str_r(r0), str_r(r1), pos, len);
+        break;
+
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
     case INDEX_op_setcond2_i32:
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index e7a07c1811..677ae2dceb 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -63,6 +63,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_bswap32_i32:
     case INDEX_op_bswap32_i64:
     case INDEX_op_bswap64_i64:
+    case INDEX_op_extract_i32:
+    case INDEX_op_extract_i64:
+    case INDEX_op_sextract_i32:
+    case INDEX_op_sextract_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
@@ -352,6 +356,21 @@ static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
     tcg_out32(s, insn);
 }
 
+static void tcg_out_op_rrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
+                            TCGReg r1, uint8_t b2, uint8_t b3)
+{
+    tcg_insn_unit insn = 0;
+
+    tcg_debug_assert(b2 == extract32(b2, 0, 6));
+    tcg_debug_assert(b3 == extract32(b3, 0, 6));
+    insn = deposit32(insn, 0, 8, op);
+    insn = deposit32(insn, 8, 4, r0);
+    insn = deposit32(insn, 12, 4, r1);
+    insn = deposit32(insn, 16, 6, b2);
+    insn = deposit32(insn, 22, 6, b3);
+    tcg_out32(s, insn);
+}
+
 static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
                             TCGReg r0, TCGReg r1, TCGReg r2, TCGCond c3)
 {
@@ -651,6 +670,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    CASE_32_64(extract)  /* Optional (TCG_TARGET_HAS_extract_*). */
+    CASE_32_64(sextract) /* Optional (TCG_TARGET_HAS_sextract_*). */
+        {
+            TCGArg pos = args[2], len = args[3];
+            TCGArg max = tcg_op_defs[opc].flags & TCG_OPF_64BIT ? 64 : 32;
+
+            tcg_debug_assert(pos < max);
+            tcg_debug_assert(pos + len <= max);
+
+            tcg_out_op_rrbb(s, opc, args[0], args[1], pos, len);
+        }
+        break;
+
     CASE_32_64(brcond)
         tcg_out_op_rrrc(s, (opc == INDEX_op_brcond_i32
                             ? INDEX_op_setcond_i32 : INDEX_op_setcond_i64),
-- 
2.25.1


