Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8777E39C118
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 22:16:19 +0200 (CEST)
Received: from localhost ([::1]:58562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpGEs-0005fr-HD
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 16:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGB0-0005i9-S9
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:18 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpGAw-0005IX-Cn
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 16:12:18 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso5708572pjz.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 13:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R9nwVKNOQ71e/mfsdQAKgcoJg5Q6skMHW8VAyFqbJYY=;
 b=x1vhqERhq7PJubItn3B/7lTJktovQErHCSTNSSKlHKwvwLQMqZzhsQZ9fl+HbGOeOr
 D+XWdQoRQw0fNhgHl9Ddd+EwHm1h9Y1fy3ZoLINFvK67lVky/vnN50ylsMY4rm5jp9DJ
 22OA+ZnJOi56SAQELdBT5DQ/JhpbY14QC0Io3K4raPxO5j83o16UQ9vF/IGbf9Homn6X
 NrLXtIEagmIYt2EGgrweZmoRsfXNvePJuuIH2LkxGU6RwQywmw+YAhOh3kZhKD7H5+IH
 OUKqzUknufLLaEfFX3PD6KZ99qS+1di1Ijlxay9c1OKXMAPPqRk4LHtKa6Bw6Ec+HBg0
 i/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R9nwVKNOQ71e/mfsdQAKgcoJg5Q6skMHW8VAyFqbJYY=;
 b=cpvyX21rfc3+LKHAxRA1uamxkFibRFIpoYqyUGP/1+BcN/Jb+ePXT2zZOjJvMPidz/
 m1youncUT4NtH0DFY4TYg95ydfIVXFJ6FIF9dlPjewhhwI0bd3NTlkGuAF47S3xPO896
 pLz+/lACgf84/wkBsqEUxzCZRfQSImAgrJYxzlSRFOlK7nuLwdhLJIZFEuKMG4JiQvKb
 cRYX47yvJeMGrecBhmnwVbkLRJgg8QaTja0KRX0csxud9DppmEArqksswRRN8laOGqOe
 omLGo0tgiJhoqVRFDpVrfnh+nsp33cQw9J9sWCBvalm10OBYUdlVrOaViowUggOX63OV
 HMZw==
X-Gm-Message-State: AOAM531krEHGiiFf6TFMpwInApuANxY9vl1hl9HDJyUQv4XrqaQ5672T
 dcKu8xSweRyqMNYA1zYjm5FN5eUPIFDdjA==
X-Google-Smtp-Source: ABdhPJyxr0PV810r4j+jpS/3nvaFTNHZHsZHdUC/12BU0AjQiYaxpqXF//dVOg7QD3tmy3Wd6ntdiw==
X-Received: by 2002:a17:90b:1991:: with SMTP id
 mv17mr706895pjb.109.1622837533281; 
 Fri, 04 Jun 2021 13:12:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id a129sm2422599pfa.118.2021.06.04.13.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 13:12:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/15] tcg/arm: Implement tcg_out_mov for vector types
Date: Fri,  4 Jun 2021 13:11:59 -0700
Message-Id: <20210604201210.920136-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604201210.920136-1-richard.henderson@linaro.org>
References: <20210604201210.920136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 52 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index c6cfb83308..a802d4b585 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -173,6 +173,8 @@ typedef enum {
     /* Otherwise the assembler uses mov r0,r0 */
     INSN_NOP_v4    = (COND_AL << 28) | ARITH_MOV,
 
+    INSN_VORR      = 0xf2200110,
+
     INSN_VLD1      = 0xf4200000,  /* VLD1 (multiple single elements) */
     INSN_VST1      = 0xf4000000,  /* VST1 (multiple single elements) */
 } ARMInsn;
@@ -1106,6 +1108,25 @@ static uint32_t encode_vd(TCGReg rd)
     return (extract32(rd, 3, 1) << 22) | (extract32(rd, 0, 3) << 13);
 }
 
+static uint32_t encode_vn(TCGReg rn)
+{
+    tcg_debug_assert(rn >= TCG_REG_Q0);
+    return (extract32(rn, 3, 1) << 7) | (extract32(rn, 0, 3) << 17);
+}
+
+static uint32_t encode_vm(TCGReg rm)
+{
+    tcg_debug_assert(rm >= TCG_REG_Q0);
+    return (extract32(rm, 3, 1) << 5) | (extract32(rm, 0, 3) << 1);
+}
+
+static void tcg_out_vreg3(TCGContext *s, ARMInsn insn, int q, int vece,
+                          TCGReg d, TCGReg n, TCGReg m)
+{
+    tcg_out32(s, insn | (vece << 20) | (q << 6) |
+              encode_vd(d) | encode_vn(n) | encode_vm(m));
+}
+
 static void tcg_out_vldst(TCGContext *s, ARMInsn insn,
                           TCGReg rd, TCGReg rn, int offset)
 {
@@ -2276,16 +2297,35 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
-static inline bool tcg_out_mov(TCGContext *s, TCGType type,
-                               TCGReg ret, TCGReg arg)
+static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
-    tcg_out_mov_reg(s, COND_AL, ret, arg);
-    return true;
+    if (ret == arg) {
+        return true;
+    }
+    switch (type) {
+    case TCG_TYPE_I32:
+        if (ret < TCG_REG_Q0 && arg < TCG_REG_Q0) {
+            tcg_out_mov_reg(s, COND_AL, ret, arg);
+            return true;
+        }
+        return false;
+
+    case TCG_TYPE_V64:
+    case TCG_TYPE_V128:
+        /* "VMOV D,N" is an alias for "VORR D,N,N". */
+        tcg_out_vreg3(s, INSN_VORR, type - TCG_TYPE_V64, 0, ret, arg, arg);
+        return true;
+
+    default:
+        g_assert_not_reached();
+    }
 }
 
-static inline void tcg_out_movi(TCGContext *s, TCGType type,
-                                TCGReg ret, tcg_target_long arg)
+static void tcg_out_movi(TCGContext *s, TCGType type,
+                         TCGReg ret, tcg_target_long arg)
 {
+    tcg_debug_assert(type == TCG_TYPE_I32);
+    tcg_debug_assert(ret < TCG_REG_Q0);
     tcg_out_movi32(s, COND_AL, ret, arg);
 }
 
-- 
2.25.1


