Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972AD60ABC1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:56:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxTN-0003gs-AV; Mon, 24 Oct 2022 09:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxTF-0003bk-2A
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:25 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxTC-0004DH-AI
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:24 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1324e7a1284so11794396fac.10
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FfZkTOiMtNPBh8Ui9QTeSKWabSxEGAfOyIzL8felDmc=;
 b=PN/u+mZTCA3jqFCYAaqoT467woxydzI73UhwNYKu1EUabOt8L9ygOyApEUf2mUt7Ic
 rME3xK4oCMlKeyAwx62i+2TchzXM/hhc6zwOm5JWhqhwT6Jdc7PoDe89Cip8QX9fz/Aa
 o7Tr30y7vbM8ecr67uLEMG2EmtLTRERv3MOafvZZXYxw23OVmCLESj67+/F7UVTCyjzI
 1Q94yAXhG/OTKJVjlpW/jTuXQFd2mD2FuHsQ43f7kwqir5GoWIGMwnZIG6snpfrC/vLT
 sqx+/7ViBwXUf8riqFfLeMGAZmNA4rq9+QOW1dICrXmZE3SWIn7IXYCgjhhl6P2DtQwz
 z0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FfZkTOiMtNPBh8Ui9QTeSKWabSxEGAfOyIzL8felDmc=;
 b=UxnANq35ZkLcw01r0NytHX38L8/J48Dso/TrCERt5K6o8x8eQ/M66NpZE7npsdA11z
 vWUGBZdOrFV1/xOXz0VXgs/yUa4LbEny0Ia0goXCM0qE+1Q8RcLAQhejtnLsYppwAauF
 mAjRwVxVGnYFUu8axNbaL+qJAESYwsR8T6Zy3p7wCCUSWr+83n5C6bK+kUkG1I6hM/5r
 wZTAL4o7CMFlP2tQzkCCAwz/aJw7frofOWmCmlEZeGB2bb6LstANCfh17qDRisORCo5V
 grnhCEg56lKRcvaca9eUxBHbhFTmqrVbm2wKLv+QwEvsuSx2V8onKpURd37PBjwndPTy
 Bocw==
X-Gm-Message-State: ACrzQf0ja9ftypotSN2yugZ1tavsdsz/D3JJeb5lMg3J1UGWG0sSlfWe
 a6UgQ7JboZ1jToGFYv48WkFz/QpSeXQaMA==
X-Google-Smtp-Source: AMsMyM4H/ZnlImyV7Byt8kDvpdw4z9ZetIlmzjj4nfHUdEL5mpw4D+Qr7UBlTu0WaNgBOASBOC1lYQ==
X-Received: by 2002:a17:90a:5996:b0:203:1640:2dbf with SMTP id
 l22-20020a17090a599600b0020316402dbfmr39366535pji.150.1666617969696; 
 Mon, 24 Oct 2022 06:26:09 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.26.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:26:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/29] accel/tcg: Introduce cpu_unwind_state_data
Date: Mon, 24 Oct 2022 23:24:54 +1000
Message-Id: <20221024132459.3229709-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add a way to examine the unwind data without actually
restoring the data back into env.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   | 13 ++++++++
 accel/tcg/translate-all.c | 68 ++++++++++++++++++++++++++-------------
 2 files changed, 58 insertions(+), 23 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 300832bd0b..d49cf113dd 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -39,6 +39,19 @@ typedef ram_addr_t tb_page_addr_t;
 #define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
 #endif
 
+/**
+ * cpu_unwind_state_data:
+ * @cpu: the vCPU state is to be restore to
+ * @host_pc: the host PC the fault occurred at
+ * @data: output data
+ *
+ * Attempt to load the the unwind state for a host pc occurring in
+ * translated code.  If the searched_pc is not in translated code,
+ * the function returns false; otherwise @data is loaded.
+ * This is the same unwind info as given to restore_state_to_opc.
+ */
+bool cpu_unwind_state_data(CPUState *cpu, uintptr_t host_pc, uint64_t *data);
+
 /**
  * cpu_restore_state:
  * @cpu: the vCPU state is to be restore to
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index e4386b3198..c772e3769c 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -320,29 +320,20 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
     return p - block;
 }
 
-/* The cpu state corresponding to 'searched_pc' is restored.
- * When reset_icount is true, current TB will be interrupted and
- * icount should be recalculated.
- */
-static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
-                                     uintptr_t searched_pc, bool reset_icount)
+static int cpu_unwind_data_from_tb(TranslationBlock *tb, uintptr_t host_pc,
+                                   uint64_t *data)
 {
-    uint64_t data[TARGET_INSN_START_WORDS];
-    uintptr_t host_pc = (uintptr_t)tb->tc.ptr;
+    uintptr_t iter_pc = (uintptr_t)tb->tc.ptr;
     const uint8_t *p = tb->tc.ptr + tb->tc.size;
     int i, j, num_insns = tb->icount;
-#ifdef CONFIG_PROFILER
-    TCGProfile *prof = &tcg_ctx->prof;
-    int64_t ti = profile_getclock();
-#endif
 
-    searched_pc -= GETPC_ADJ;
+    host_pc -= GETPC_ADJ;
 
-    if (searched_pc < host_pc) {
+    if (host_pc < iter_pc) {
         return -1;
     }
 
-    memset(data, 0, sizeof(data));
+    memset(data, 0, sizeof(uint64_t) * TARGET_INSN_START_WORDS);
     if (!TARGET_TB_PCREL) {
         data[0] = tb_pc(tb);
     }
@@ -353,19 +344,40 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
         for (j = 0; j < TARGET_INSN_START_WORDS; ++j) {
             data[j] += decode_sleb128(&p);
         }
-        host_pc += decode_sleb128(&p);
-        if (host_pc > searched_pc) {
-            goto found;
+        iter_pc += decode_sleb128(&p);
+        if (iter_pc > host_pc) {
+            return num_insns - i;
         }
     }
     return -1;
+}
+
+/*
+ * The cpu state corresponding to 'host_pc' is restored.
+ * When reset_icount is true, current TB will be interrupted and
+ * icount should be recalculated.
+ */
+static void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
+                                      uintptr_t host_pc, bool reset_icount)
+{
+    uint64_t data[TARGET_INSN_START_WORDS];
+#ifdef CONFIG_PROFILER
+    TCGProfile *prof = &tcg_ctx->prof;
+    int64_t ti = profile_getclock();
+#endif
+    int insns_left = cpu_unwind_data_from_tb(tb, host_pc, data);
+
+    if (insns_left < 0) {
+        return;
+    }
 
- found:
     if (reset_icount && (tb_cflags(tb) & CF_USE_ICOUNT)) {
         assert(icount_enabled());
-        /* Reset the cycle counter to the start of the block
-           and shift if to the number of actually executed instructions */
-        cpu_neg(cpu)->icount_decr.u16.low += num_insns - i;
+        /*
+         * Reset the cycle counter to the start of the block and
+         * shift if to the number of actually executed instructions.
+         */
+        cpu_neg(cpu)->icount_decr.u16.low += insns_left;
     }
 
     cpu->cc->tcg_ops->restore_state_to_opc(cpu, tb, data);
@@ -375,7 +387,6 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
                 prof->restore_time + profile_getclock() - ti);
     qatomic_set(&prof->restore_count, prof->restore_count + 1);
 #endif
-    return 0;
 }
 
 bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
@@ -408,6 +419,17 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
     return false;
 }
 
+bool cpu_unwind_state_data(CPUState *cpu, uintptr_t host_pc, uint64_t *data)
+{
+    if (in_code_gen_buffer((const void *)(host_pc - tcg_splitwx_diff))) {
+        TranslationBlock *tb = tcg_tb_lookup(host_pc);
+        if (tb) {
+            return cpu_unwind_data_from_tb(tb, host_pc, data) >= 0;
+        }
+    }
+    return false;
+}
+
 void page_init(void)
 {
     page_size_init();
-- 
2.34.1


