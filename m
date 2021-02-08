Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BBB31291C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:59:10 +0100 (CET)
Received: from localhost ([::1]:52514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wlZ-0007oO-3M
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:59:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRc-0001Z0-PC
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:32 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:32981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRU-0005qa-QP
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:32 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d13so7035059plg.0
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EjI7Jfr8LIthM/+Hr8pg5fY2MZ87PA6SSlhcAVNxWvA=;
 b=ehoIZkeAb719YXFMwoUAIjjvhbq9QnwM5Ih2E202BX3rSyf7bymjQ0lTH2FJfFKz+u
 zIyYxWB9voY/ASs1koqJtWUoPaJYSZMgHuBgUnyLY50j4n9DXwQJ7P8QnDWfWJ+Es3ah
 kz0WmDCnLVEzSW/zxTgPVQV/VcbE22tDWp2BCFuSystWQEAfeCzti7bqUU+UH30A4ev5
 1I31/CHI9wmGjCHn+H7xr75XTC3WEJuw5MqKGZi2+tTrntgWlBwRfjJ1ZK9kVY2533pf
 x5NfvBQpD+6tpfIeVeLcWDH8WRjYvR/ei9ZIMO3yYNhLlpyIu210N3dDuecBRnA1wXCn
 Zirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EjI7Jfr8LIthM/+Hr8pg5fY2MZ87PA6SSlhcAVNxWvA=;
 b=UzdQ+8qCarpTq8Y0ynWQOHWEN455YekTNBkqeV/0wRU9MMyETHcVj9f9Jw2jboETko
 /hyzvFs5eR9oOK00qB0VrkukNHazZWCUEIag9R/0dcdG0K/7E+XfJBZWr4ilOOs2nM7y
 w+S1LMlN5N8vkhPtg1XAz/V4g65gFbQTLbxxF9GRRn8rnILMywCCBB7jDG1FIb8W+AvL
 5sSi7Ki1kXAZXuXuNoShxQmWFdAIBZlsJCANUGuoWaC1s3Pq5tHBMW5het9gxQMG2v0n
 bWaa5Oryob55QIQqOOmE7mRyZEScouxJ+RQDXl/QPDM6V6tWGZmcQTGUEAJ+NgValAax
 J+4g==
X-Gm-Message-State: AOAM533LBdMQvdvjykBhdvUS9Gs9L8mw+xiudxClL+X8fYAB05ND/3pf
 noz5xU4W4CLwsrMX6K/605G4N1gF1YkcWA==
X-Google-Smtp-Source: ABdhPJxl0yN5F3auG2E74ClulLhzf7wu7aSa5vDpEYVh3ag4HqVz6JMYfvA9gZ2Gfz9DxsJRiyt0pQ==
X-Received: by 2002:a17:902:70c6:b029:df:d62a:8c69 with SMTP id
 l6-20020a17090270c6b02900dfd62a8c69mr14012400plt.20.1612751902659; 
 Sun, 07 Feb 2021 18:38:22 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/70] tcg/tci: Split out tci_args_rrrrrc
Date: Sun,  7 Feb 2021 18:37:05 -0800
Message-Id: <20210208023752.270606-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
 tcg/tci.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 8bc9dd27b0..692b95b5c2 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -221,6 +221,19 @@ static void tci_args_rrrc(const uint8_t **tb_ptr,
     *c3 = tci_read_b(tb_ptr);
 }
 
+#if TCG_TARGET_REG_BITS == 32
+static void tci_args_rrrrrc(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
+                            TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *r3 = tci_read_r(tb_ptr);
+    *r4 = tci_read_r(tb_ptr);
+    *c5 = tci_read_b(tb_ptr);
+}
+#endif
+
 static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
 {
     bool result = false;
@@ -400,7 +413,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         uint32_t tmp32;
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
-        uint64_t v64;
+        TCGReg r3, r4;
+        uint64_t v64, T1, T2;
 #endif
         TCGMemOpIdx oi;
         int32_t ofs;
@@ -449,11 +463,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
 #if TCG_TARGET_REG_BITS == 32
         case INDEX_op_setcond2_i32:
-            t0 = *tb_ptr++;
-            tmp64 = tci_read_r64(regs, &tb_ptr);
-            v64 = tci_read_r64(regs, &tb_ptr);
-            condition = *tb_ptr++;
-            tci_write_reg(regs, t0, tci_compare64(tmp64, v64, condition));
+            tci_args_rrrrrc(&tb_ptr, &r0, &r1, &r2, &r3, &r4, &condition);
+            T1 = tci_uint64(regs[r2], regs[r1]);
+            T2 = tci_uint64(regs[r4], regs[r3]);
+            regs[r0] = tci_compare64(T1, T2, condition);
             break;
 #elif TCG_TARGET_REG_BITS == 64
         case INDEX_op_setcond_i64:
-- 
2.25.1


