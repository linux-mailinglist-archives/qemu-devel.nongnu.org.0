Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AC72E2913
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 23:47:22 +0100 (CET)
Received: from localhost ([::1]:59988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksZOD-0003hm-N4
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 17:47:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMK-0001qi-UB
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:26 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:37448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMI-0008Im-Ne
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:24 -0500
Received: by mail-pl1-x634.google.com with SMTP id be12so1825762plb.4
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 14:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jFRhkBWqut/6G0Q0sKpZiaviQgGi/m1iS3y3mM/4i90=;
 b=ag+qiTxTPYURL2BLvUBnSOy999VXNy//Mh6qfewizCAYeOg/ibHMOQk2OzgmMaD50Q
 OVjnyBUtYmgFiRZcyWd0wgYC302nT79+RayXOknC8bOQUzG5enshO6CnM26c885QuNr7
 7CLGPn3biJQwfHXelhWz4w3Y28Jp8MiTXoBM2jqz9T4TmKTDm12qpb2EUqu1HailicJU
 YhFrFtm/Xgd72Cbe5bV9BpMAzxwL0J974/ecAaP/U/YB+hbMVehMicAD9U/jU0Ywt0qI
 3WkiHVPEBHBbL+/WqytryOQPJ7MwiswO6XRVL35zfEpa50rHA+SMj8bRTt+UKcN128xW
 L9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jFRhkBWqut/6G0Q0sKpZiaviQgGi/m1iS3y3mM/4i90=;
 b=Qq9Bk0esSBVy8bjYs7+EWPGdkSW+u8Ht7jfiC8VO286q3y2pcY/zl6BLStdD5jDGJH
 Th+TNsy5FbxkqK2tG+1pObVuJh/lrHbO8aqxEsXBYiPobo3r/VZuzarhTw6njjUWC04x
 JUWWN6ubbuATIu4SNZw/z5vj3/3gM9l3D0a7ozwKsKlz1bibIta8hCdHyVrNf1JThVxL
 XMWKHPzmFe2KkQkgTjj9oxnNLm/jzeVMdkD0fnuZ5hDlRbykSj6YClFzMqflG6IFUbCg
 ONVo4H+ipj5e9TTvbX2gG1+iHDX+5EKXRd+f54j1G6MREOwkmYRwKsLcFH1Xd3Ae8zuu
 RQ0w==
X-Gm-Message-State: AOAM530xNHj4fpgkataF87olPBf+NsNbIhghpGbg2uxHbf9JuC9tkn7C
 1cbiKMyVczwSETB+UKoAWdcJO0iJSD3qPg==
X-Google-Smtp-Source: ABdhPJyUiSuWwImIOJ4hejN0UWW2XTaA4cAuitEGLutNi3iCqdKVmHdNqjOh9bBxP0hAHfsjfNJrvQ==
X-Received: by 2002:a17:902:d351:b029:db:d63d:d0e with SMTP id
 l17-20020a170902d351b02900dbd63d0d0emr12656287plk.75.1608849921157; 
 Thu, 24 Dec 2020 14:45:21 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id w11sm11844123pge.28.2020.12.24.14.45.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 14:45:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/15] tcg: Change parameters for tcg_target_const_match
Date: Thu, 24 Dec 2020 14:45:04 -0800
Message-Id: <20201224224514.626561-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224224514.626561-1-richard.henderson@linaro.org>
References: <20201224224514.626561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Change the return value to bool, because that's what is should
have been from the start.  Pass the ct mask instead of the whole
TCGArgConstraint, as that's the only part that's relevant.

Change the value argument to int64_t.  We will need the extra
width for 32-bit hosts wanting to match vector constants.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                    | 5 ++---
 tcg/aarch64/tcg-target.c.inc | 5 +----
 tcg/arm/tcg-target.c.inc     | 5 +----
 tcg/i386/tcg-target.c.inc    | 4 +---
 tcg/mips/tcg-target.c.inc    | 5 +----
 tcg/ppc/tcg-target.c.inc     | 4 +---
 tcg/riscv/tcg-target.c.inc   | 4 +---
 tcg/s390/tcg-target.c.inc    | 5 +----
 tcg/sparc/tcg-target.c.inc   | 5 +----
 tcg/tci/tcg-target.c.inc     | 6 ++----
 10 files changed, 12 insertions(+), 36 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 3c0e494a08..73d22ecb26 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -147,8 +147,7 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg, TCGReg arg1,
 static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
                         TCGReg base, intptr_t ofs);
 static void tcg_out_call(TCGContext *s, tcg_insn_unit *target);
-static int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                  const TCGArgConstraint *arg_ct);
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct);
 #ifdef TCG_TARGET_NEED_LDST_LABELS
 static int tcg_out_ldst_finalize(TCGContext *s);
 #endif
@@ -4000,7 +3999,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         ts = arg_temp(arg);
 
         if (ts->val_type == TEMP_VAL_CONST
-            && tcg_target_const_match(ts->val, ts->type, arg_ct)) {
+            && tcg_target_const_match(ts->val, ts->type, arg_ct->ct)) {
             /* constant is OK for instruction */
             const_args[i] = 1;
             new_args[i] = ts->val;
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index e52db4a881..84971a285f 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -262,11 +262,8 @@ static bool is_shimm1632(uint32_t v32, int *cmode, int *imm8)
     }
 }
 
-static int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                  const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    int ct = arg_ct->ct;
-
     if (ct & TCG_CT_CONST) {
         return 1;
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 6e9d72289a..3eb4456dce 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -407,11 +407,8 @@ static int is_shimm32_pair(uint32_t v32, int *cmode, int *imm8)
  * mov operand2:     values represented with x << (2 * y), x < 0x100
  * add, sub, eor...: ditto
  */
-static inline int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                         const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    int ct;
-    ct = arg_ct->ct;
     if (ct & TCG_CT_CONST) {
         return 1;
     } else if ((ct & TCG_CT_CONST_ARM) && check_fit_imm(val)) {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 9c16c5cc70..96a296d92e 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -206,10 +206,8 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #endif
 
 /* test if a constant matches the constraint */
-static inline int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                         const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    int ct = arg_ct->ct;
     if (ct & TCG_CT_CONST) {
         return 1;
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 3542fce752..8fb2d4f422 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -190,11 +190,8 @@ static inline bool is_p2m1(tcg_target_long val)
 }
 
 /* test if a constant matches the constraint */
-static inline int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                         const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    int ct;
-    ct = arg_ct->ct;
     if (ct & TCG_CT_CONST) {
         return 1;
     } else if ((ct & TCG_CT_CONST_ZERO) && val == 0) {
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 238743f135..aded09315d 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -219,10 +219,8 @@ static bool reloc_pc14(tcg_insn_unit *pc, tcg_insn_unit *target)
 }
 
 /* test if a constant matches the constraint */
-static int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                  const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    int ct = arg_ct->ct;
     if (ct & TCG_CT_CONST) {
         return 1;
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 3bc0d1f1b4..3b4a3a7dcf 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -132,10 +132,8 @@ static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
 }
 
 /* test if a constant matches the constraint */
-static int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                  const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    int ct = arg_ct->ct;
     if (ct & TCG_CT_CONST) {
         return 1;
     }
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index 087b4a2f5c..8edb35030a 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -403,11 +403,8 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 }
 
 /* Test if a constant matches the constraint. */
-static int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                  const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    int ct = arg_ct->ct;
-
     if (ct & TCG_CT_CONST) {
         return 1;
     }
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 85fb6c344c..e44eb9aa4b 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -320,11 +320,8 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 }
 
 /* test if a constant matches the constraint */
-static inline int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                         const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    int ct = arg_ct->ct;
-
     if (ct & TCG_CT_CONST) {
         return 1;
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index d28133ccb1..4e2f25bbba 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -742,11 +742,9 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
 }
 
 /* Test if a constant matches the constraint. */
-static int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                  const TCGArgConstraint *arg_ct)
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 {
-    /* No need to return 0 or 1, 0 or != 0 is good enough. */
-    return arg_ct->ct & TCG_CT_CONST;
+    return ct & TCG_CT_CONST;
 }
 
 static void tcg_target_init(TCGContext *s)
-- 
2.25.1


