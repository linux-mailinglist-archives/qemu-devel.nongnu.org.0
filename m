Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A407A31295C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:31:44 +0100 (CET)
Received: from localhost ([::1]:33196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xH5-0005PH-M2
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:31:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZL-0003jH-Fs
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:31 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wZI-0008VY-VI
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:46:31 -0500
Received: by mail-pl1-x633.google.com with SMTP id y10so7028318plk.7
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=I7geR9l1CU0gdZRN3d0rsGPXzyzt1jqfcdVWXDuwgz4=;
 b=G4I/g17AiFwEQY1v1SjW7xUCytCPDKpR6zi0DWR3+/qrIiSFnNhsFik11SemTZa+OO
 xTKlrSPUM6WVDbTW4ElnwKF9sFkdzZULtSmEsY7hdHkcaetFAvVzhu/+rHUXwxrTUDcp
 CVAXH9iEfgEfW18Oi44YpTOlGvjgqK/dsAWFjBB8nuDjgrad8QnQgWxIwYbSV5GYjsIA
 602FBe0Gu2VRegb/5edAWSrIbVyxwvkxAChfk75WNSeykW0L+gEmu/0NCWi9rfFNAktj
 1G1ymLt8gHcjkyoLGijUuM2fTaKfxQCo5jd3Wk1G3kXH/VtH3wWXIqMPoSonYL3sIJ0Y
 /8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7geR9l1CU0gdZRN3d0rsGPXzyzt1jqfcdVWXDuwgz4=;
 b=ZacB6VHUZsU/IjxkPNFCfMrli7wiju7BsiBtXUIHKKWuj8oLYh03/H6vytyTG1LO9R
 VUuszc3LXfk66DBuy96rTUQ96EIzpYQ1j6dD1HpyDIBoGxxdUAqv6R4E2SEnEBilK4xL
 WoaWQdUKxoQ5N/GVLpVHfiLn/gHCHjujK0tfWtA8WYs4fdw2kYT2e9R8Ta53ZLD+10Um
 W4eRfKllkFFnU/rN/96VjOUiFuqBMP59BnkX5YGvQ6SN3tuO1yHDGp/6/lJfIir1pFZh
 7CGlcEYgKNJjVPdsu9S7C/+bvVrrPrA4plDwEIxCiMYT2LvWmM4BCA+vSYFps+GZJZ22
 Otlg==
X-Gm-Message-State: AOAM530PT9gslZml19bYgKfwQRWpjKiGzMjTUa+Djhk2cGI7mpWgcE7M
 EgsEDiMEdt3X9NQoof2W66BX3e+G40mvYA==
X-Google-Smtp-Source: ABdhPJys5ToFw5Smt4IUZkDTg4HKPRlfIsMFetlTZXacfU1Q8txHPVU9wdL0pJixh1MD+zrkb4Zc2w==
X-Received: by 2002:a17:902:ecc4:b029:e1:5a03:87b5 with SMTP id
 a4-20020a170902ecc4b02900e15a0387b5mr4161195plh.39.1612752387590; 
 Sun, 07 Feb 2021 18:46:27 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id h8sm8966092pfv.154.2021.02.07.18.46.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:46:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/15] tcg: Change parameters for tcg_target_const_match
Date: Sun,  7 Feb 2021 18:46:11 -0800
Message-Id: <20210208024625.271018-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208024625.271018-1-richard.henderson@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
index 63a12b197b..2f06477a67 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -147,8 +147,7 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg, TCGReg arg1,
 static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
                         TCGReg base, intptr_t ofs);
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target);
-static int tcg_target_const_match(tcg_target_long val, TCGType type,
-                                  const TCGArgConstraint *arg_ct);
+static bool tcg_target_const_match(int64_t val, TCGType type, int ct);
 #ifdef TCG_TARGET_NEED_LDST_LABELS
 static int tcg_out_ldst_finalize(TCGContext *s);
 #endif
@@ -4054,7 +4053,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         ts = arg_temp(arg);
 
         if (ts->val_type == TEMP_VAL_CONST
-            && tcg_target_const_match(ts->val, ts->type, arg_ct)) {
+            && tcg_target_const_match(ts->val, ts->type, arg_ct->ct)) {
             /* constant is OK for instruction */
             const_args[i] = 1;
             new_args[i] = ts->val;
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 1376cdc404..35d3d3c12a 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -277,11 +277,8 @@ static bool is_shimm1632(uint32_t v32, int *cmode, int *imm8)
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
index 8457108a87..eb4f42e53d 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -301,11 +301,8 @@ static inline int check_fit_imm(uint32_t imm)
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
index 40326c2806..999dddc059 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -210,10 +210,8 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 }
 
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
index ab55f3109b..3a9333d5cf 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -193,11 +193,8 @@ static inline bool is_p2m1(tcg_target_long val)
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
index 4377d15d62..41358c5018 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -238,10 +238,8 @@ static bool reloc_pc14(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
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
index e700c52067..043921cee5 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -145,10 +145,8 @@ static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
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
index 695d7ee652..433061cfee 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -417,11 +417,8 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
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
index 3d50f985c6..ce39ac2d86 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -341,11 +341,8 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
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
index feac4659cc..59b4e833bb 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -671,11 +671,9 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
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


