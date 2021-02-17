Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B612931E0DF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:55:05 +0100 (CET)
Received: from localhost ([::1]:39658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTqi-0006IP-ON
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLW-000888-Qj
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:50 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLT-0007Kp-9q
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:50 -0500
Received: by mail-pj1-x102b.google.com with SMTP id e9so2411589pjj.0
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V1TX4A2lg1baFpq2pztWBLMIOT18SzH84zy/1htPZ+g=;
 b=fjfRHSqoT3KcXMgVp1TnBQDl0srvYfG6KB7FJTr8vQJVkWKYJYkTZ3S8ENBs7IwfgB
 YbmJGzNRaEj0polNcXuMZU/p83GnzKKlN8EBPE5h+LwU6wpAz7nnBaxxNBGHOlxAeA3p
 xgoZ93su8jEkbBSpc365wnPpCwuPchTyPOYUsLtvZoWXkhs7fXiTBXlVzRHxz27wiMOB
 2YzcoFaWOSsNSwrIQkfpvMAnJjzbUd05ClGNhd/Jsazmc2mX+/bmfSyfzupoUMNNdLnm
 I5XIsUxolqUM7LXsRuZ3QYteQpma17nUieSATprLKBgURqdCiLrxFGwC6uFlkTbS1kMr
 mUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V1TX4A2lg1baFpq2pztWBLMIOT18SzH84zy/1htPZ+g=;
 b=T8JRhTJn0QvENUaAFuNuYd9mjUhP8jXrQyusxWM6jbV9ZnZLkVbPoCFOF7KRrV6H10
 vTyyb1vHzADPy3Al2RdbsHer+AU98GM+YQBqpTrYLrx0isBCaEFQaEpBx028ONMo2UFC
 0yFbIsE4/PJODuZiirWBHOPx5Fvrg3r09TRLYJYl3RZjXPvswGjvZN6QkbcfJS9Hsdqu
 g2//ME47CcjvdskjNdonIX6VpC0Buu+uSx82DCFe0Ev46TQ9BnOuSF1xpIGIftf5Yv/H
 MBupCSiBvycMevkuwWncdqTAaCmTlYQhryBJIGt4sCaayZBIJYuAcZW/8OU/USI2yFN7
 xUTw==
X-Gm-Message-State: AOAM530PGpnOHKBWKbIKeO5ZTCjiNKg2j3S3qTE1SMSX1v1zlP/O3EI4
 OLiBpYExBw4884LzIv9DSJvfwVGF/IkhYg==
X-Google-Smtp-Source: ABdhPJx9ao/I7beLRCkZ6A2Ysi6ieoEjn+HyGPjiLp8ADFDvylZy+9yfJBTn/LWDKFqxpH11koMguQ==
X-Received: by 2002:a17:90a:8a91:: with SMTP id
 x17mr546584pjn.179.1613593365602; 
 Wed, 17 Feb 2021 12:22:45 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/71] tcg/tci: Split out tci_args_rrcl and tci_args_rrrrcl
Date: Wed, 17 Feb 2021 12:19:49 -0800
Message-Id: <20210217202036.1724901-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 52 ++++++++++++++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 558d03fd1b..c8df45ce28 100644
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
@@ -388,7 +408,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         tcg_target_ulong t0;
         tcg_target_ulong t1;
         tcg_target_ulong t2;
-        tcg_target_ulong label;
         TCGCond condition;
         target_ulong taddr;
         uint8_t tmp8;
@@ -397,7 +416,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
         TCGReg r3, r4;
-        uint64_t v64, T1, T2;
+        uint64_t T1, T2;
 #endif
         TCGMemOpIdx oi;
         int32_t ofs;
@@ -594,13 +613,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -620,13 +636,12 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -766,13 +781,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


