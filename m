Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20718479C78
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:59:01 +0100 (CET)
Received: from localhost ([::1]:53534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfrA-0003CL-8w
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:59:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbh-0000gU-Lc
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:01 -0500
Received: from [2607:f8b0:4864:20::62c] (port=43875
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbg-0003Td-4S
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:01 -0500
Received: by mail-pl1-x62c.google.com with SMTP id m24so4751203pls.10
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZKtl3eQLDrPDo5wLMGrCHs/bvnXVBSx+UlJ8IYMRTRo=;
 b=cOwRALHOp0ozN519tWk1/13y9qu12KSIfKSefZxHyv0mue8cTUIQuz4qf5oVes35NQ
 hvaoyow78ZZIaECeYgRu9JHML/pm+j3P4JoJrO++hYv+enf6BSb9l320SKHDQUFElyAU
 9QOvJf5LgatKyYGPWCayur1hin7n4t3tBeyKQ4HcDs53YcZr7NOYVnM0fwQrZWjXEFZT
 GTCIn9Y0hBgZUhMnEAGKKZcmW3X8lBYfi2qIPWmjXU+WKhGeTOR6UHGLkfwTrlBdclGQ
 myVhew4SoyKooZHJAyYGkWiqEXgT/kd3NtbIY1sN7hbmnb6swplIIcoxHKvCl5fPdHfn
 rmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZKtl3eQLDrPDo5wLMGrCHs/bvnXVBSx+UlJ8IYMRTRo=;
 b=i4K3UndK8X8e9cjKlRP4/RIKGk2pTP+gJ4/foTEEQJVrsJB5Idl+G998xQtHwDcJl2
 5HObH2izB7rFQgOvXTlq6UsyP+rDW2g6sauum1YEhLeG6xCwQ5Y7zkRqM2BhqkuSeav5
 hXSnRRYtSBtbdEtHlOe8EueC/3+6F1Lj6ZaW3xVZnJjwbEK578vTgKkyX621nzvRVP5R
 856UL7licgorU9VsxNxcrer7GLK3Q1sK7GjPOa1H851dyLh6GY+dXhQSEGrIQMZe0bu+
 et0qdhpNLOHx5HOU8g2163sZkLYoVjZZ0SCZFvkOeadDdx5q9QUsfUzcMxi4XHmIIbF8
 4kpw==
X-Gm-Message-State: AOAM532gWPWO+I3CsAPJww8GUeji8QO+oa9NB27IhJ9LAS+FPjMRacnC
 QNKgjNSZwbrqKCtTeeC7PlbslX86nP0tUw==
X-Google-Smtp-Source: ABdhPJzrhlGHWHnebvD7dSqEL1jmCSXH7XefICSCU9uvpwOxLqxBRNfNzzgIpoNhvpIS9teZlsKFpg==
X-Received: by 2002:a17:90b:4a83:: with SMTP id
 lp3mr19252747pjb.34.1639856578705; 
 Sat, 18 Dec 2021 11:42:58 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.42.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:42:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/20] tcg/i386: Implement avx512 immediate rotate
Date: Sat, 18 Dec 2021 11:42:41 -0800
Message-Id: <20211218194250.247633-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AVX512VL has VPROLD and VPROLQ, layered onto the same
opcode as PSHIFTD, but requires EVEX encoding and W.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     |  2 +-
 tcg/i386/tcg-target.c.inc | 15 +++++++++++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 12d098ad6c..38c09fd66c 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -195,7 +195,7 @@ extern bool have_movbe;
 #define TCG_TARGET_HAS_not_vec          0
 #define TCG_TARGET_HAS_neg_vec          0
 #define TCG_TARGET_HAS_abs_vec          1
-#define TCG_TARGET_HAS_roti_vec         0
+#define TCG_TARGET_HAS_roti_vec         have_avx512vl
 #define TCG_TARGET_HAS_rots_vec         0
 #define TCG_TARGET_HAS_rotv_vec         0
 #define TCG_TARGET_HAS_shi_vec          1
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index c4e6f2e5ea..5ab7c4c0fa 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -361,7 +361,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_PSHUFLW     (0x70 | P_EXT | P_SIMDF2)
 #define OPC_PSHUFHW     (0x70 | P_EXT | P_SIMDF3)
 #define OPC_PSHIFTW_Ib  (0x71 | P_EXT | P_DATA16) /* /2 /6 /4 */
-#define OPC_PSHIFTD_Ib  (0x72 | P_EXT | P_DATA16) /* /2 /6 /4 */
+#define OPC_PSHIFTD_Ib  (0x72 | P_EXT | P_DATA16) /* /1 /2 /6 /4 */
 #define OPC_PSHIFTQ_Ib  (0x73 | P_EXT | P_DATA16) /* /2 /6 /4 */
 #define OPC_PSLLW       (0xf1 | P_EXT | P_DATA16)
 #define OPC_PSLLD       (0xf2 | P_EXT | P_DATA16)
@@ -2906,6 +2906,14 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
             insn |= P_VEXW | P_EVEX;
         }
         sub = 4;
+        goto gen_shift;
+    case INDEX_op_rotli_vec:
+        insn = OPC_PSHIFTD_Ib | P_EVEX;  /* VPROL[DQ] */
+        if (vece == MO_64) {
+            insn |= P_VEXW;
+        }
+        sub = 1;
+        goto gen_shift;
     gen_shift:
         tcg_debug_assert(vece != MO_8);
         if (type == TCG_TYPE_V256) {
@@ -3195,6 +3203,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
     case INDEX_op_sari_vec:
+    case INDEX_op_rotli_vec:
     case INDEX_op_x86_psrldq_vec:
         return C_O1_I1(x, x);
 
@@ -3216,11 +3225,13 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_xor_vec:
     case INDEX_op_andc_vec:
         return 1;
-    case INDEX_op_rotli_vec:
     case INDEX_op_cmp_vec:
     case INDEX_op_cmpsel_vec:
         return -1;
 
+    case INDEX_op_rotli_vec:
+        return have_avx512vl && vece >= MO_32 ? 1 : -1;
+
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
         /* We must expand the operation for MO_8.  */
-- 
2.25.1


