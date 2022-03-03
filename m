Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEDA4CC7AD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:14:02 +0100 (CET)
Received: from localhost ([::1]:37420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPslt-0008Ht-FH
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:14:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYS-0005zf-ST
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:09 -0500
Received: from [2607:f8b0:4864:20::62e] (port=36582
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYR-0004HG-38
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:08 -0500
Received: by mail-pl1-x62e.google.com with SMTP id e13so5875522plh.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cQT9zMG4FhkFaAOj70Z7g11F51tSzJO8zWBn/QmjzwM=;
 b=MhR+9nDhEMB/UdupTHC68b7DOCxs9TewlPsLE2p7Hm1T3K4iVINr56FNck1SPvWhh9
 KBka8IkoVM+za1/QyqvD/+DMKMmimxYbLrs456EyLs7sdZdy2jMzB3tERQyqweNs5BjI
 2Kekze/nS6Gh9U6fFPfxYkIUt9btM1+ZqgaGs2r27CSVZCAtaBVMlILI1IbNAyC7d7/c
 IqbyetpxtJHVejV0okIt5vRQKS9AHgy3FgElmtA4meaUij4REXzzSUu/Co99BL7DcDl6
 oqxYx7vs2uChG6bkbhAVBa7ZGvGtwYw0F+qPjBNYopLHnZtBqXRPZfV0wncXZy2Hdc2Q
 1JQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cQT9zMG4FhkFaAOj70Z7g11F51tSzJO8zWBn/QmjzwM=;
 b=zEt42BTqWHT7sjp2oCoLewhA/6jyzYB8mtVso9m5LG6KKhrgeW9Ecyxlu7zQwJwI1i
 M5vX6jVUOkI2+QTo9zNr8E8K1rjDYVrqTC591fJ2UBL6GG79ld9tO2Fm8WRw2sjLIUrR
 2wvxuJzJSCNAAQQyb46K3rYlBUZKLiJ1HOX2UnfgAMdRomaXeaYXNY8wS8k426aSPI9R
 okCFTecTZrD6x31mUhfWctwtLQIPpfl1Cs4s33DoJ4uLDuB3/WBOLkzVdMhZmfsIcD/T
 2eYhICfjRR//f1BWhEKFzCIoMmwbScjBPjvgymFdAeecKKo+Uv8k63uFW6LPoWoINaaI
 Toaw==
X-Gm-Message-State: AOAM533gCgPTIbMGfFGL1kkyppshNLXP+9iBXV2/C5WZiPal4iWdurYI
 axY+JsiX3vmjdTaBbOwCydpWNSfDmjUE+A==
X-Google-Smtp-Source: ABdhPJyWhJ1ltpEUpJrWVeXUjVKwgZN2ehJTriAQGjkSZwWnxKXNtWG4pZREUnhst9zdW4BlhfOMwA==
X-Received: by 2002:a17:90a:7f84:b0:1bc:aba8:f281 with SMTP id
 m4-20020a17090a7f8400b001bcaba8f281mr7271185pjl.101.1646341205722; 
 Thu, 03 Mar 2022 13:00:05 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/30] tcg/i386: Implement avx512 immediate rotate
Date: Thu,  3 Mar 2022 10:59:26 -1000
Message-Id: <20220303205944.469445-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AVX512VL has VPROLD and VPROLQ, layered onto the same
opcode as PSHIFTD, but requires EVEX encoding and W1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     |  2 +-
 tcg/i386/tcg-target.c.inc | 15 +++++++++++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 79af353860..23a8b2a8c8 100644
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
index de01fbf40c..3a9f6a3360 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -362,7 +362,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_PSHUFLW     (0x70 | P_EXT | P_SIMDF2)
 #define OPC_PSHUFHW     (0x70 | P_EXT | P_SIMDF3)
 #define OPC_PSHIFTW_Ib  (0x71 | P_EXT | P_DATA16) /* /2 /6 /4 */
-#define OPC_PSHIFTD_Ib  (0x72 | P_EXT | P_DATA16) /* /2 /6 /4 */
+#define OPC_PSHIFTD_Ib  (0x72 | P_EXT | P_DATA16) /* /1 /2 /6 /4 */
 #define OPC_PSHIFTQ_Ib  (0x73 | P_EXT | P_DATA16) /* /2 /6 /4 */
 #define OPC_PSLLW       (0xf1 | P_EXT | P_DATA16)
 #define OPC_PSLLD       (0xf2 | P_EXT | P_DATA16)
@@ -3000,6 +3000,14 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
             insn = shift_imm_insn[vece];
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
@@ -3289,6 +3297,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
     case INDEX_op_sari_vec:
+    case INDEX_op_rotli_vec:
     case INDEX_op_x86_psrldq_vec:
         return C_O1_I1(x, x);
 
@@ -3310,11 +3319,13 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
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


