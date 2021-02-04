Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF9730EA2B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:28:23 +0100 (CET)
Received: from localhost ([::1]:60612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UNa-0003Kc-7Q
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:28:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjL-0005Sl-0Z
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:47 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:38184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjH-0003zR-4i
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:46 -0500
Received: by mail-pl1-x62d.google.com with SMTP id x9so892629plb.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KzQlyAD9k/hiBg8OA6mTnZcwGe7ZwxIZNF3j/mJP4ic=;
 b=oDT9BwJHUoOFo6FUhXWZheJr1v8FWyXi9ePfou6O3jIpj0IpBRVfHC5oAelrucmNev
 1692AiesT5eabfLFEdwKMKk9XcEOrBWvYBQcuEm6Xl+yLlCmH79wmWHhZoCwXdOVX+ad
 tVCbYOVJn3F4Fr1jUzGS7oxxQpSchvvfsDX9oC4w9LK04rBLWLrLmqq8lbjyBNU5dJ06
 HFkzd9Q1FvvFJPrlkFMxqSgrZba7SfUBjc7TOuPAk7UfZ2aaPc9rcG6n2sKU6ZpUjTAt
 Rp2Q6JtNV76lFlchkFc2qdJZs4nrGVSxEn4H/k4PiCt+thPLnfkKnqeHuEg6anRjqOZ5
 qUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KzQlyAD9k/hiBg8OA6mTnZcwGe7ZwxIZNF3j/mJP4ic=;
 b=N8OONg9xVWlVqqP8nPi6IgublxJrc4NOGq7dYAMiStZ6PIDft5GFmfwteibVHywQar
 mBOqX258lxIJiQIuxi5A1z/8ZboYSRa+5W1df/BTI1N64oZTvQl4tjGzs6rugKTT/0Mo
 pXBWZW1n+wWifqcYMn/TTAfI0GK3muZJ2duB9VCaG2qgA0LO3zocN4oAdF2No/Kcjav3
 cS1j83fiElEjklWZ5tJ7dAyB8BXTgsxVBfN68vIkZzDYXAKuYIllUIXM6sS8bARiQs10
 88oYV/9/frK6NyMJaQu8e+F0TjIwwefFktFH3vN20GyXmTtOhUdfhPb57SuV54wIx2QQ
 WKiw==
X-Gm-Message-State: AOAM532Bo1oEAcJ6hQLQsgNV/+Z4qqkB1RtC2Zl3M70mPNnE2fGpGcAi
 Mt0gQ4bXpVGe8Vwhdt7naPB5WA/pfRpnre/9
X-Google-Smtp-Source: ABdhPJzzyKIVebAHbYF5qveltyr2pFgUFmljnzEOWyZrtr1+6a+ziv72j1Sq5IWhHPmBmQnCsnM1ng==
X-Received: by 2002:a17:90a:d98a:: with SMTP id
 d10mr5898664pjv.116.1612403200409; 
 Wed, 03 Feb 2021 17:46:40 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 49/93] tcg/tci: Split out tci_args_rrcl and tci_args_rrrrcl
Date: Wed,  3 Feb 2021 15:44:25 -1000
Message-Id: <20210204014509.882821-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 52 ++++++++++++++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 692b95b5c2..1e2f78a9f9 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -212,6 +212,15 @@ static void tci_args_rrs(const uint8_t **tb_ptr,
     *i2 = tci_read_s32(tb_ptr);
 }
 
+static void tci_args_rrcl(const uint8_t **tb_ptr,
+                          TCGReg *r0, TCGReg *r1, TCGCond *c2, void **l3)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *c2 = tci_read_b(tb_ptr);
+    *l3 = (void *)tci_read_label(tb_ptr);
+}
+
 static void tci_args_rrrc(const uint8_t **tb_ptr,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGCond *c3)
 {
@@ -222,6 +231,17 @@ static void tci_args_rrrc(const uint8_t **tb_ptr,
 }
 
 #if TCG_TARGET_REG_BITS == 32
+static void tci_args_rrrrcl(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
+                            TCGReg *r2, TCGReg *r3, TCGCond *c4, void **l5)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *r3 = tci_read_r(tb_ptr);
+    *c4 = tci_read_b(tb_ptr);
+    *l5 = (void *)tci_read_label(tb_ptr);
+}
+
 static void tci_args_rrrrrc(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
 {
@@ -405,7 +425,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         tcg_target_ulong t0;
         tcg_target_ulong t1;
         tcg_target_ulong t2;
-        tcg_target_ulong label;
         TCGCond condition;
         target_ulong taddr;
         uint8_t tmp8;
@@ -414,7 +433,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
         TCGReg r3, r4;
-        uint64_t v64, T1, T2;
+        uint64_t T1, T2;
 #endif
         TCGMemOpIdx oi;
         int32_t ofs;
@@ -611,13 +630,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i32:
-            t0 = tci_read_rval(regs, &tb_ptr);
-            t1 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            label = tci_read_label(&tb_ptr);
-            if (tci_compare32(t0, t1, condition)) {
+            tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
+            if (tci_compare32(regs[r0], regs[r1], condition)) {
                 tci_assert(tb_ptr == old_code_ptr + op_size);
-                tb_ptr = (uint8_t *)label;
+                tb_ptr = ptr;
                 continue;
             }
             break;
@@ -637,13 +653,12 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg64(regs, t1, t0, tmp64);
             break;
         case INDEX_op_brcond2_i32:
-            tmp64 = tci_read_r64(regs, &tb_ptr);
-            v64 = tci_read_r64(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            label = tci_read_label(&tb_ptr);
-            if (tci_compare64(tmp64, v64, condition)) {
+            tci_args_rrrrcl(&tb_ptr, &r0, &r1, &r2, &r3, &condition, &ptr);
+            T1 = tci_uint64(regs[r1], regs[r0]);
+            T2 = tci_uint64(regs[r3], regs[r2]);
+            if (tci_compare64(T1, T2, condition)) {
                 tci_assert(tb_ptr == old_code_ptr + op_size);
-                tb_ptr = (uint8_t *)label;
+                tb_ptr = ptr;
                 continue;
             }
             break;
@@ -783,13 +798,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #endif
         case INDEX_op_brcond_i64:
-            t0 = tci_read_rval(regs, &tb_ptr);
-            t1 = tci_read_rval(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            label = tci_read_label(&tb_ptr);
-            if (tci_compare64(t0, t1, condition)) {
+            tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
+            if (tci_compare64(regs[r0], regs[r1], condition)) {
                 tci_assert(tb_ptr == old_code_ptr + op_size);
-                tb_ptr = (uint8_t *)label;
+                tb_ptr = ptr;
                 continue;
             }
             break;
-- 
2.25.1


