Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA4C39764D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:15:46 +0200 (CEST)
Received: from localhost ([::1]:48006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo67N-0004s6-I4
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tr-0002Vh-Uz
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:48 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:39930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5ta-0002cU-NL
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:47 -0400
Received: by mail-io1-xd35.google.com with SMTP id r4so15629423iol.6
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n+NTL2MutxAPHUKPja/7SmmpwMkRIr8Q1GSxPTANoP8=;
 b=XGsTzzwtDihkWBE5D9QcHbeYAxvgQDrgqN4Hbs1/q6aut7hFT+KlhtYXtajlAAmaf5
 w48g0NM1HXJ+EZyy7oklLv2TPKIuJlyHWDzHZuvKLt9rDPDbFod4cccgaWhxH4tkc309
 xmYmGLlxZfwGqeKNjsyfuhU9syLwLv2Yy+GaAlAtMELJSO5mHy2KW75PbGr3lpy6WQKJ
 ELNJCUZRFjJRw91KSEJTBW1umOx4Xknze6w6KaIsuT8nf6SyIJQRaftuK9QQ+JG4gKWg
 YlgPyE8pKMDA/C0eZnRSgBWy+A6haPwZ7wy4XKJlNcKI2/Z5sbbCSDwRFhv51agc6cYX
 0rGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n+NTL2MutxAPHUKPja/7SmmpwMkRIr8Q1GSxPTANoP8=;
 b=gwhZut2TeQytMPaaN8z6blnILMhI2dvs06TA0N6aeRmyp/W8whUy+iFIvqamlwHB24
 Z++RtTTNyMOOjvqlA6feQ7BM/JGR3M4eSm8KmCkjoEXEUJLOw2/B9dseDW8m7ltiZC4e
 SXL4Bb1R/QRqg7BRcBudG4yJT/OLYaW3vNzvW/W7Rz9htqelRvSs9nXAQOwe3rMq8nCA
 jfN9D1xa7y9rKM5imYJWX5G9R4wHKeuJUpsgAcnNu+n4g2Bgz7mKOaWW0KE3kFOK863h
 WSvrR7oQp6e0EKBzPygqWwnItoIcC5fBXSXqrJorP+UmvCk8F0R5SXIEe6xtjv2eyEHK
 RXKw==
X-Gm-Message-State: AOAM533cDuEkKiroCzbs9RIpVSkoAVxkAEfdfELtDsQzKx4EsraBSeLd
 pMoLSsL0X96kG9dnpAyO7VKBBFYLw0S2Rl5D
X-Google-Smtp-Source: ABdhPJwjn9hL3UhK2CafPT4PgqwvFwPHUyICxbTTYeCAHHCqpS6R1aX3VIUkRwoZy38PfDsmQzc+Bg==
X-Received: by 2002:a6b:5a1a:: with SMTP id o26mr610967iob.178.1622559686597; 
 Tue, 01 Jun 2021 08:01:26 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 13/27] tcg/tci: Emit setcond before brcond
Date: Tue,  1 Jun 2021 08:00:52 -0700
Message-Id: <20210601150106.12761-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd35.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The encoding planned for tci does not have enough room for
brcond2, with 4 registers and a condition as input as well
as the label.  Resolve the condition into TCG_REG_TMP, and
relax brcond to one register plus a label, considering the
condition to always be reg != 0.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                | 68 ++++++++++------------------------------
 tcg/tci/tcg-target.c.inc | 52 +++++++++++-------------------
 2 files changed, 35 insertions(+), 85 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 3a6aeb1139..1e9e89458b 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -145,6 +145,16 @@ static void tci_args_nll(const uint8_t **tb_ptr, uint8_t *n0,
     check_size(start, tb_ptr);
 }
 
+static void tci_args_rl(const uint8_t **tb_ptr, TCGReg *r0, void **l1)
+{
+    const uint8_t *start = *tb_ptr;
+
+    *r0 = tci_read_r(tb_ptr);
+    *l1 = (void *)tci_read_label(tb_ptr);
+
+    check_size(start, tb_ptr);
+}
+
 static void tci_args_rr(const uint8_t **tb_ptr,
                         TCGReg *r0, TCGReg *r1)
 {
@@ -216,19 +226,6 @@ static void tci_args_rrs(const uint8_t **tb_ptr,
     check_size(start, tb_ptr);
 }
 
-static void tci_args_rrcl(const uint8_t **tb_ptr,
-                          TCGReg *r0, TCGReg *r1, TCGCond *c2, void **l3)
-{
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *r1 = tci_read_r(tb_ptr);
-    *c2 = tci_read_b(tb_ptr);
-    *l3 = (void *)tci_read_label(tb_ptr);
-
-    check_size(start, tb_ptr);
-}
-
 static void tci_args_rrrc(const uint8_t **tb_ptr,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGCond *c3)
 {
@@ -297,21 +294,6 @@ static void tci_args_rrrr(const uint8_t **tb_ptr,
     check_size(start, tb_ptr);
 }
 
-static void tci_args_rrrrcl(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
-                            TCGReg *r2, TCGReg *r3, TCGCond *c4, void **l5)
-{
-    const uint8_t *start = *tb_ptr;
-
-    *r0 = tci_read_r(tb_ptr);
-    *r1 = tci_read_r(tb_ptr);
-    *r2 = tci_read_r(tb_ptr);
-    *r3 = tci_read_r(tb_ptr);
-    *c4 = tci_read_b(tb_ptr);
-    *l5 = (void *)tci_read_label(tb_ptr);
-
-    check_size(start, tb_ptr);
-}
-
 static void tci_args_rrrrrc(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
 {
@@ -708,8 +690,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i32:
-            tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
-            if (tci_compare32(regs[r0], regs[r1], condition)) {
+            tci_args_rl(&tb_ptr, &r0, &ptr);
+            if ((uint32_t)regs[r0]) {
                 tb_ptr = ptr;
             }
             break;
@@ -726,15 +708,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             T2 = tci_uint64(regs[r5], regs[r4]);
             tci_write_reg64(regs, r1, r0, T1 - T2);
             break;
-        case INDEX_op_brcond2_i32:
-            tci_args_rrrrcl(&tb_ptr, &r0, &r1, &r2, &r3, &condition, &ptr);
-            T1 = tci_uint64(regs[r1], regs[r0]);
-            T2 = tci_uint64(regs[r3], regs[r2]);
-            if (tci_compare64(T1, T2, condition)) {
-                tb_ptr = ptr;
-                continue;
-            }
-            break;
         case INDEX_op_mulu2_i32:
             tci_args_rrrr(&tb_ptr, &r0, &r1, &r2, &r3);
             tci_write_reg64(regs, r1, r0, (uint64_t)regs[r2] * regs[r3]);
@@ -862,8 +835,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i64:
-            tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
-            if (tci_compare64(regs[r0], regs[r1], condition)) {
+            tci_args_rl(&tb_ptr, &r0, &ptr);
+            if (regs[r0]) {
                 tb_ptr = ptr;
             }
             break;
@@ -1174,9 +1147,9 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
-        tci_args_rrcl(&tb_ptr, &r0, &r1, &c, &ptr);
-        info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %p",
-                           op_name, str_r(r0), str_r(r1), str_c(c), ptr);
+        tci_args_rl(&tb_ptr, &r0, &ptr);
+        info->fprintf_func(info->stream, "%-12s  %s, 0, ne, %p",
+                           op_name, str_r(r0), ptr);
         break;
 
     case INDEX_op_setcond_i32:
@@ -1301,13 +1274,6 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            str_r(r3), str_r(r4), str_c(c));
         break;
 
-    case INDEX_op_brcond2_i32:
-        tci_args_rrrrcl(&tb_ptr, &r0, &r1, &r2, &r3, &c, &ptr);
-        info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s, %s, %p",
-                           op_name, str_r(r0), str_r(r1),
-                           str_r(r2), str_r(r3), str_c(c), ptr);
-        break;
-
     case INDEX_op_mulu2_i32:
         tci_args_rrrr(&tb_ptr, &r0, &r1, &r2, &r3);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s",
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index d80fec3488..4841787e5f 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -337,6 +337,17 @@ static void tcg_out_op_rI(TCGContext *s, TCGOpcode op,
 }
 #endif
 
+static void tcg_out_op_rl(TCGContext *s, TCGOpcode op, TCGReg r0, TCGLabel *l1)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tci_out_label(s, l1);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
 {
     uint8_t *old_code_ptr = s->code_ptr;
@@ -388,20 +399,6 @@ static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
-static void tcg_out_op_rrcl(TCGContext *s, TCGOpcode op,
-                            TCGReg r0, TCGReg r1, TCGCond c2, TCGLabel *l3)
-{
-    uint8_t *old_code_ptr = s->code_ptr;
-
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tcg_out_r(s, r1);
-    tcg_out8(s, c2);
-    tci_out_label(s, l3);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
-}
-
 static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
                             TCGReg r0, TCGReg r1, TCGReg r2, TCGCond c3)
 {
@@ -475,23 +472,6 @@ static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
-static void tcg_out_op_rrrrcl(TCGContext *s, TCGOpcode op,
-                              TCGReg r0, TCGReg r1, TCGReg r2, TCGReg r3,
-                              TCGCond c4, TCGLabel *l5)
-{
-    uint8_t *old_code_ptr = s->code_ptr;
-
-    tcg_out_op_t(s, op);
-    tcg_out_r(s, r0);
-    tcg_out_r(s, r1);
-    tcg_out_r(s, r2);
-    tcg_out_r(s, r3);
-    tcg_out8(s, c4);
-    tci_out_label(s, l5);
-
-    old_code_ptr[1] = s->code_ptr - old_code_ptr;
-}
-
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGCond c5)
@@ -697,7 +677,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     CASE_32_64(brcond)
-        tcg_out_op_rrcl(s, opc, args[0], args[1], args[2], arg_label(args[3]));
+        tcg_out_op_rrrc(s, (opc == INDEX_op_brcond_i32
+                            ? INDEX_op_setcond_i32 : INDEX_op_setcond_i64),
+                        TCG_REG_TMP, args[0], args[1], args[2]);
+        tcg_out_op_rl(s, opc, TCG_REG_TMP, arg_label(args[3]));
         break;
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
@@ -723,8 +706,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                           args[3], args[4], args[5]);
         break;
     case INDEX_op_brcond2_i32:
-        tcg_out_op_rrrrcl(s, opc, args[0], args[1], args[2],
-                          args[3], args[4], arg_label(args[5]));
+        tcg_out_op_rrrrrc(s, INDEX_op_setcond2_i32, TCG_REG_TMP,
+                          args[0], args[1], args[2], args[3], args[4]);
+        tcg_out_op_rl(s, INDEX_op_brcond_i32, TCG_REG_TMP, arg_label(args[5]));
         break;
     case INDEX_op_mulu2_i32:
         tcg_out_op_rrrr(s, opc, args[0], args[1], args[2], args[3]);
-- 
2.25.1


