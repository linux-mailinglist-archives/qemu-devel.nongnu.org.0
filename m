Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518B547C469
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:01:31 +0100 (CET)
Received: from localhost ([::1]:39388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziW0-0003aQ-U9
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:01:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIx-0000PI-QB
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:59 -0500
Received: from [2607:f8b0:4864:20::1029] (port=46644
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIs-0007d5-0e
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:59 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so3726414pjb.5
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g/ZansEwFOaBtkGLkicA0MHIWwkeqDn07upI3aEefAs=;
 b=dMl0d/dz9/sxfp6AhfKjZhMsortJICn0e9ROPeEgFNKVpMQ+zbqBSLZPhFi6X4P6Nm
 +lV09KeCR8UGM2em6LqY2CIXi0a5zHaqbCmEE7I3Y54VabM1/OQCY2xBc1p4Gx2Jc4+L
 3636yFLtBPSR1JUF8/+Zn/ZrwG1N7OgUF+5suArV7m5KRXPRjoh8ITOFkrWD2/6PzHnj
 zcsSV03U7xabTL6gs5ZIJpcIRuAOIuiNR//5mT6HWAUU7D9LNlNekSUwQfjMtQRcwGhk
 1kjPsFdWVkvdRMVzBCEChUFM54FhPmQfMleBVJNQ76Re6xmX0A0jhfwzyL6H7v0T1DHO
 uaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g/ZansEwFOaBtkGLkicA0MHIWwkeqDn07upI3aEefAs=;
 b=zHsNj8B3CvtbYcqQ67Dn/kADd3paXDwYbfhLtCl0FEYZLWeggOtjKQrQfTK7Fq2x/a
 7VQTirXPxrPAPLFHIcBycIxPmzVacuORZK4aCADTcCSXutxUZAW8HDNA2JP2QmpBWd38
 4KJpQclUY699oX2sX2yFTIIX2ShfT9Tl3mUzeBFf6+Ph4xQp0aXqFnkDizL4rL66wtBG
 L/EtMXLeXQOl5MYA9yNsEzIh7ARtSAnuPfpev5DUH2o2yxUdQJsVjbRt4vvQt8nZyGMw
 bOdYB+GRc1N9d3xSC7BbI57xN7pKX/IQsf7GD5fYaTkZoo8E/Owk1TmPCPLWUhTBOC8h
 brOQ==
X-Gm-Message-State: AOAM533CHxZAZ4QOdiGtvz0omb5J+TI0Y0Keyr62la6pk9H7ld32cmSc
 PamMHLrArCxpQmkKsKhh4cpfg+vE9fF5gQ==
X-Google-Smtp-Source: ABdhPJxrTdrXwb2Pxk0fpwiKDw8HFDhTa33KKYhB1X/nSvYyiAmlM0YfepqiWyrGofVHzY54MQ8eZQ==
X-Received: by 2002:a17:90a:578b:: with SMTP id
 g11mr4908051pji.76.1640105272684; 
 Tue, 21 Dec 2021 08:47:52 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/31] tcg/loongarch64: Implement clz/ctz ops
Date: Tue, 21 Dec 2021 08:47:21 -0800
Message-Id: <20211221164737.1076007-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211221054105.178795-16-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  1 +
 tcg/loongarch64/tcg-target.h         |  8 +++---
 tcg/loongarch64/tcg-target.c.inc     | 42 ++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index d958183020..2975e03127 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -18,4 +18,5 @@ C_O0_I1(r)
 C_O1_I1(r, r)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, rU)
+C_O1_I2(r, r, rW)
 C_O1_I2(r, 0, rZ)
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index 5303001653..2fd2745b63 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -120,8 +120,8 @@ typedef enum {
 #define TCG_TARGET_HAS_eqv_i32          0
 #define TCG_TARGET_HAS_nand_i32         0
 #define TCG_TARGET_HAS_nor_i32          1
-#define TCG_TARGET_HAS_clz_i32          0
-#define TCG_TARGET_HAS_ctz_i32          0
+#define TCG_TARGET_HAS_clz_i32          1
+#define TCG_TARGET_HAS_ctz_i32          1
 #define TCG_TARGET_HAS_ctpop_i32        0
 #define TCG_TARGET_HAS_direct_jump      0
 #define TCG_TARGET_HAS_brcond2          0
@@ -156,8 +156,8 @@ typedef enum {
 #define TCG_TARGET_HAS_eqv_i64          0
 #define TCG_TARGET_HAS_nand_i64         0
 #define TCG_TARGET_HAS_nor_i64          1
-#define TCG_TARGET_HAS_clz_i64          0
-#define TCG_TARGET_HAS_ctz_i64          0
+#define TCG_TARGET_HAS_clz_i64          1
+#define TCG_TARGET_HAS_ctz_i64          1
 #define TCG_TARGET_HAS_ctpop_i64        0
 #define TCG_TARGET_HAS_add2_i64         0
 #define TCG_TARGET_HAS_sub2_i64         0
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 3b056dd358..39df2885b5 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -412,6 +412,28 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
     tcg_out_opc_addi_w(s, ret, arg, 0);
 }
 
+static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
+                           TCGReg a0, TCGReg a1, TCGReg a2,
+                           bool c2, bool is_32bit)
+{
+    if (c2) {
+        /*
+         * Fast path: semantics already satisfied due to constraint and
+         * insn behavior, single instruction is enough.
+         */
+        tcg_debug_assert(a2 == (is_32bit ? 32 : 64));
+        /* all clz/ctz insns belong to DJ-format */
+        tcg_out32(s, encode_dj_insn(opc, a0, a1));
+        return;
+    }
+
+    tcg_out32(s, encode_dj_insn(opc, TCG_REG_TMP0, a1));
+    /* a0 = a1 ? REG_TMP0 : a2 */
+    tcg_out_opc_maskeqz(s, TCG_REG_TMP0, TCG_REG_TMP0, a1);
+    tcg_out_opc_masknez(s, a0, a2, a1);
+    tcg_out_opc_or(s, a0, TCG_REG_TMP0, a0);
+}
+
 /*
  * Entry-points
  */
@@ -572,6 +594,20 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_revb_d(s, a0, a1);
         break;
 
+    case INDEX_op_clz_i32:
+        tcg_out_clzctz(s, OPC_CLZ_W, a0, a1, a2, c2, true);
+        break;
+    case INDEX_op_clz_i64:
+        tcg_out_clzctz(s, OPC_CLZ_D, a0, a1, a2, c2, false);
+        break;
+
+    case INDEX_op_ctz_i32:
+        tcg_out_clzctz(s, OPC_CTZ_W, a0, a1, a2, c2, true);
+        break;
+    case INDEX_op_ctz_i64:
+        tcg_out_clzctz(s, OPC_CTZ_D, a0, a1, a2, c2, false);
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -632,6 +668,12 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         /* LoongArch reg-imm bitops have their imms ZERO-extended */
         return C_O1_I2(r, r, rU);
 
+    case INDEX_op_clz_i32:
+    case INDEX_op_clz_i64:
+    case INDEX_op_ctz_i32:
+    case INDEX_op_ctz_i64:
+        return C_O1_I2(r, r, rW);
+
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
         /* Must deposit into the same register as input */
-- 
2.25.1


