Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C756EC591
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:53:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqp4l-0006Hy-0g; Mon, 24 Apr 2023 01:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0k-0006O3-91
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:45:19 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0H-0005Kh-Vf
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:45:13 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f19c473b9eso30783525e9.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315076; x=1684907076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8auTOlyLXqTfCckvUiWN7Zc35mefBco1qqtfpVHTz4=;
 b=Yq71wfiIl9tZ2CcABXmqp+Jj+f+6FnbojU+FVLL5tX86chUHYpQNq7MNCtwRe1X5hl
 KqqQqIk6VPCgdXJJCp0kWL4uyGY1IWrO9NRJNg1l1Mlj/0Y3qEZSDN90Jy/rM0SSuzbz
 f+jNy4E9eIM3nlrF6ZiFziyd+uOTnsIwDGEB5IEnLVMnOA9MEuSOQBfoKEuUlfcN3Nik
 zDmTeH06BVXZTPNeHRlFjOaiSlZ9ewWo4Mfxl0WkelotEVL/1QbETMAzdq+GY90dKN/J
 alq9stHHHInr0FC1y3BngygMkqeEOOOlQT/+ppaSUI2BvLMT/WXgDOAdkDbk/1ENcJ7V
 aRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315076; x=1684907076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k8auTOlyLXqTfCckvUiWN7Zc35mefBco1qqtfpVHTz4=;
 b=PuCcmv69jH32JSHHRuz2LPr6s3pz+HSnr7kJu+2xfJdrkEygcI6VZdC5Q4JMQKT094
 xlr9/BUhm+5Q9gHOVyzzRtK0ey/OBykDadAA1Tmji9TrM6EFU170fdVKQjegEHtZx4nj
 K4l591vAxg5o34phg2/CnEK7LfdPl4CoRVUD1K/lHPtIotyijYdbPatAwgp6Jjyb4Jp2
 dC2t9D94F95bxCQEeqJW0vNXHaOLvDjgdmEsgPfuwBSgMPtc1QA5yw9xaCMSEtZLIg6J
 EMMHU0oD4EYD7wsM176zgZkAEJtgbAlCM5PVP7EsGfdcyMR+4MNsUC2uOEDpEBeDoUIg
 ++Tw==
X-Gm-Message-State: AAQBX9ebNIMZzF6XW64ZyeVarOGr8nyr/58IG637Hl5fmWT5KX08bI+v
 PvxzhNW1ArBxs1Eyjs9VRpojjBBXQiE5KEiN1kFV7A==
X-Google-Smtp-Source: AKy350a/S7pnnHQyi3InFQxE9nHIOTsIdd8lZyPjTdn9VWhB5uYAekSTTdqicQnxqhxFiPPvDgg4Vg==
X-Received: by 2002:a1c:7912:0:b0:3f1:94e2:e5bc with SMTP id
 l18-20020a1c7912000000b003f194e2e5bcmr6366520wme.11.1682315076267; 
 Sun, 23 Apr 2023 22:44:36 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 51/57] tcg/mips: Simplify constraints on qemu_ld/st
Date: Mon, 24 Apr 2023 06:40:59 +0100
Message-Id: <20230424054105.1579315-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The softmmu tlb uses TCG_REG_TMP[0-3], not any of the normally available
registers.  Now that we handle overlap betwen inputs and helper arguments,
and have eliminated use of A0, we can allow any allocatable reg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target-con-set.h | 13 +++++--------
 tcg/mips/tcg-target-con-str.h |  2 --
 tcg/mips/tcg-target.c.inc     | 30 ++++++++----------------------
 3 files changed, 13 insertions(+), 32 deletions(-)

diff --git a/tcg/mips/tcg-target-con-set.h b/tcg/mips/tcg-target-con-set.h
index fe3e868a2f..864034f468 100644
--- a/tcg/mips/tcg-target-con-set.h
+++ b/tcg/mips/tcg-target-con-set.h
@@ -12,15 +12,13 @@
 C_O0_I1(r)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rZ)
-C_O0_I2(SZ, S)
-C_O0_I3(SZ, S, S)
-C_O0_I3(SZ, SZ, S)
+C_O0_I3(rZ, r, r)
+C_O0_I3(rZ, rZ, r)
 C_O0_I4(rZ, rZ, rZ, rZ)
-C_O0_I4(SZ, SZ, S, S)
-C_O1_I1(r, L)
+C_O0_I4(rZ, rZ, r, r)
 C_O1_I1(r, r)
 C_O1_I2(r, 0, rZ)
-C_O1_I2(r, L, L)
+C_O1_I2(r, r, r)
 C_O1_I2(r, r, ri)
 C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rIK)
@@ -30,7 +28,6 @@ C_O1_I2(r, rZ, rN)
 C_O1_I2(r, rZ, rZ)
 C_O1_I4(r, rZ, rZ, rZ, 0)
 C_O1_I4(r, rZ, rZ, rZ, rZ)
-C_O2_I1(r, r, L)
-C_O2_I2(r, r, L, L)
+C_O2_I1(r, r, r)
 C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, rZ, rZ, rN, rN)
diff --git a/tcg/mips/tcg-target-con-str.h b/tcg/mips/tcg-target-con-str.h
index e4b2965c72..413c280a7a 100644
--- a/tcg/mips/tcg-target-con-str.h
+++ b/tcg/mips/tcg-target-con-str.h
@@ -9,8 +9,6 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
-REGS('L', ALL_QLOAD_REGS)
-REGS('S', ALL_QSTORE_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 695c137023..5ad9867882 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -176,20 +176,6 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define TCG_CT_CONST_WSZ  0x2000   /* word size */
 
 #define ALL_GENERAL_REGS  0xffffffffu
-#define NOA0_REGS         (ALL_GENERAL_REGS & ~(1 << TCG_REG_A0))
-
-#ifdef CONFIG_SOFTMMU
-#define ALL_QLOAD_REGS \
-    (NOA0_REGS & ~((TCG_TARGET_REG_BITS < TARGET_LONG_BITS) << TCG_REG_A2))
-#define ALL_QSTORE_REGS \
-    (NOA0_REGS & ~(TCG_TARGET_REG_BITS < TARGET_LONG_BITS   \
-                   ? (1 << TCG_REG_A2) | (1 << TCG_REG_A3)  \
-                   : (1 << TCG_REG_A1)))
-#else
-#define ALL_QLOAD_REGS   NOA0_REGS
-#define ALL_QSTORE_REGS  NOA0_REGS
-#endif
-
 
 static bool is_p2m1(tcg_target_long val)
 {
@@ -2232,18 +2218,18 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_qemu_ld_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O1_I1(r, L) : C_O1_I2(r, L, L));
+                ? C_O1_I1(r, r) : C_O1_I2(r, r, r));
     case INDEX_op_qemu_st_i32:
         return (TCG_TARGET_REG_BITS == 64 || TARGET_LONG_BITS == 32
-                ? C_O0_I2(SZ, S) : C_O0_I3(SZ, S, S));
+                ? C_O0_I2(rZ, r) : C_O0_I3(rZ, r, r));
     case INDEX_op_qemu_ld_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, L)
-                : TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, L)
-                : C_O2_I2(r, r, L, L));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O1_I1(r, r)
+                : TARGET_LONG_BITS == 32 ? C_O2_I1(r, r, r)
+                : C_O2_I2(r, r, r, r));
     case INDEX_op_qemu_st_i64:
-        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(SZ, S)
-                : TARGET_LONG_BITS == 32 ? C_O0_I3(SZ, SZ, S)
-                : C_O0_I4(SZ, SZ, S, S));
+        return (TCG_TARGET_REG_BITS == 64 ? C_O0_I2(rZ, r)
+                : TARGET_LONG_BITS == 32 ? C_O0_I3(rZ, rZ, r)
+                : C_O0_I4(rZ, rZ, r, r));
 
     default:
         g_assert_not_reached();
-- 
2.34.1


