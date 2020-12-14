Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6972D9982
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:14:47 +0100 (CET)
Received: from localhost ([::1]:43034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koocg-0005Rq-CO
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRv-0001co-I0
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:40 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRl-0003v4-Me
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:36 -0500
Received: by mail-oi1-x244.google.com with SMTP id s2so19253529oij.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kjsZwqo16wWQgyXnGfAD2sB/J/+jiHAWTHwjAIw7NfU=;
 b=Rxipfw7PIv+4c19FSYNbuI12v9kOpq8hg+/i3/lvLjjt+IWertoVtl/+e9NRN9sJNb
 FdjaOB/CCQ6Ym/xFM7Cr+rc9b0OTjH0Y04zZbYM4xmRGA6k2iBloEIzI2vz9NmnSm4DI
 ARyJmFIW7BU3kIyZSIThhyW9z7tqXCHneivv7u1Hc/d4ZW/3ihj338ElLxP384A2wqm7
 uvuMLeU2CZLGundECkmoDBfhliabd5HrmuTSDBo2ABj9f0ms/SGvuEHgCVSw4duhJIwk
 hKbYXyedEzL8+JJgjEjVptpvv+iajNe2QN1atWqnQw0qarhl/zhhOhiMgclbl8qjadbQ
 D40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kjsZwqo16wWQgyXnGfAD2sB/J/+jiHAWTHwjAIw7NfU=;
 b=t4NjxzJ3UL8coa9YqQG1iMipST75m/Fg320ZBk1eVPOuAMV+NjxEiFxvpDqlejqCrI
 Xy7FXpYOAi9RHp7EzbeIaOKfJeQivDjGtTvSh9RnU6P+c6CF53Q9WXscnbHEji2Xrdem
 QkTbCO23Kaz4qWQFrwM2i56Xbu7PpXYMATzDf7teq3HZum4vXgrdci+tWNNaJfDjdN0K
 FQYW0jHk4l+y5K7Csvf4bI3hYe4ucjpGAKe/Wp6k6n4qdFpNY3bIEiSckhYBVmKIElwz
 doVAzm3kkDR/niLVuymjOdJZgYi90rlpLX7EQ6gFY7GRF8hx/lcbXbYMbTUbdnY2eJgN
 U95A==
X-Gm-Message-State: AOAM530Qadrf3C2foaoO0SkVUM6QUgjcXZT/4E3fRDv/edudbOLLHIOy
 2pvgl+9/y2DgTcKfSDhO2MgKWwul6fnVj9tv
X-Google-Smtp-Source: ABdhPJxlJzwoEhBUHkjrd77Z7ODMcm/BZ3XTmTQ/m1fRS6azZr0AH4RnVVdB+GJJfqNs8umizmpgTQ==
X-Received: by 2002:aca:5253:: with SMTP id g80mr18112498oib.98.1607954608250; 
 Mon, 14 Dec 2020 06:03:28 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/43] tcg: Add in_code_gen_buffer
Date: Mon, 14 Dec 2020 08:02:38 -0600
Message-Id: <20201214140314.18544-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
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

Create a function to determine if a pointer is within the buffer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h         |  6 ++++++
 accel/tcg/translate-all.c | 26 ++++++++------------------
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index bb1e97b13b..e4d0ace44b 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -680,6 +680,12 @@ extern __thread TCGContext *tcg_ctx;
 extern void *tcg_code_gen_epilogue;
 extern TCGv_env cpu_env;
 
+static inline bool in_code_gen_buffer(const void *p)
+{
+    const TCGContext *s = &tcg_init_ctx;
+    return (size_t)(p - s->code_gen_buffer) <= s->code_gen_buffer_size;
+}
+
 static inline size_t temp_idx(TCGTemp *ts)
 {
     ptrdiff_t n = ts - tcg_ctx->temps;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4572b4901f..744f97a717 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -392,27 +392,18 @@ void tb_destroy(TranslationBlock *tb)
 
 bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
 {
-    TranslationBlock *tb;
-    bool r = false;
-    uintptr_t check_offset;
-
-    /* The host_pc has to be in the region of current code buffer. If
-     * it is not we will not be able to resolve it here. The two cases
-     * where host_pc will not be correct are:
+    /*
+     * The host_pc has to be in the region of the code buffer.
+     * If it is not we will not be able to resolve it here.
+     * The two cases where host_pc will not be correct are:
      *
      *  - fault during translation (instruction fetch)
      *  - fault from helper (not using GETPC() macro)
      *
      * Either way we need return early as we can't resolve it here.
-     *
-     * We are using unsigned arithmetic so if host_pc <
-     * tcg_init_ctx.code_gen_buffer check_offset will wrap to way
-     * above the code_gen_buffer_size
      */
-    check_offset = host_pc - (uintptr_t) tcg_init_ctx.code_gen_buffer;
-
-    if (check_offset < tcg_init_ctx.code_gen_buffer_size) {
-        tb = tcg_tb_lookup(host_pc);
+    if (in_code_gen_buffer((const void *)host_pc)) {
+        TranslationBlock *tb = tcg_tb_lookup(host_pc);
         if (tb) {
             cpu_restore_state_from_tb(cpu, tb, host_pc, will_exit);
             if (tb_cflags(tb) & CF_NOCACHE) {
@@ -421,11 +412,10 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
                 tcg_tb_remove(tb);
                 tb_destroy(tb);
             }
-            r = true;
+            return true;
         }
     }
-
-    return r;
+    return false;
 }
 
 static void page_init(void)
-- 
2.25.1


