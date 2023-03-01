Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795146A65F8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:59:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCej-0000S3-Dc; Tue, 28 Feb 2023 21:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCee-0008Vz-56
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:20 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCea-00039T-Se
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:19 -0500
Received: by mail-pl1-x636.google.com with SMTP id z2so12528980plf.12
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FO6CPz/9Q/GRzP8w9w7VxwtuhhK81UtWPm/J24x6V4A=;
 b=KgqBQ1N0BcT8zcqFU/pMKl1A/VlwQOcCY9oFh0n/kEEgl6ETglRHfl6ePwnJvUVym7
 OrHyL67JPu7DD9/K9eureWFxiDR0fsNp6IyDFoN4MR74/CZUDQpHKdEduTmcFFegJRpe
 PbAAoMBecyEzkJBGK3h2QxCVdFsJar/8pOB4fMkMWej8P3WH2MyaTw8gKLUwXcFFk0r1
 5aE/btGn1xjTiYNAYoHW4ShStN0I4OMPkRcawzVxeCDSNHJAHbLf3Hg4hTeSZoqMbpLf
 Dka4tSJyJijiYq7jsGnLWP84x3HcXPKKIbzzpaoV8Jq8oGmhVwnFB+9PJUdUwX48XpoF
 5Cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FO6CPz/9Q/GRzP8w9w7VxwtuhhK81UtWPm/J24x6V4A=;
 b=37xsMhaVUpwP6TyTIbw8gAZ0Ns2KSFZm4W2ROzTfYyQoegZqJz8r5YW0hVG7Nhghl2
 pcwW9gqxIlRLXzTtWLKmvhDCT2gTIw5+VTJZbPHsBz9Q7d+QNgoRPN8AXNt2QpDjPIhP
 AeCM9HyOo8buLhWITBgT0Yw/QAJCv7p/CNO2P4ndvL/DDIuhr8itSDKXyw1RiXglupBW
 Jf1WdWBEA63EAAMINJI+IwPF/8fKojP63kcPJHe9v0DUG/4kJH0foLPvI2rEzavQJZX9
 0OgRaA6caP5PhCLg08bJxlBRGSYBJ0pchk3h5I4LoBk5USR2JO52vkLU7tyBbplef8wP
 z5dw==
X-Gm-Message-State: AO0yUKWmxgSpgsOZpHSDBjQWp2FznXPKFytbw6HbiAk6bXG5R4G50VCC
 PJ+NyghSa+stdlnIAQQnEJPUHGRArj08mkMmDh0=
X-Google-Smtp-Source: AK7set+wuzaGiJxDUufjpwmA4pOGDVcozH8SRyeGCWnhpN02J5a3xjsjlGiQAjStA4KJVk05qDyDnA==
X-Received: by 2002:a17:903:124d:b0:19c:a5dd:fadb with SMTP id
 u13-20020a170903124d00b0019ca5ddfadbmr5234964plh.54.1677639433732; 
 Tue, 28 Feb 2023 18:57:13 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 16/62] accel/tcg: Replace `tb_pc()` with `tb->pc`
Date: Tue, 28 Feb 2023 16:55:57 -1000
Message-Id: <20230301025643.1227244-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-13-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h      | 2 +-
 accel/tcg/cpu-exec.c      | 6 +++---
 accel/tcg/tb-maint.c      | 8 ++++----
 accel/tcg/translate-all.c | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 5daa4cf0d7..96f198b28b 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -60,7 +60,7 @@ static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
     if (tb_cflags(tb) & CF_PCREL) {
         return cpu->cc->get_pc(cpu);
     } else {
-        return tb_pc(tb);
+        return tb->pc;
     }
 }
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index aa14e97958..56aaf58b9d 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -183,7 +183,7 @@ static bool tb_lookup_cmp(const void *p, const void *d)
     const TranslationBlock *tb = p;
     const struct tb_desc *desc = d;
 
-    if ((tb_cflags(tb) & CF_PCREL || tb_pc(tb) == desc->pc) &&
+    if ((tb_cflags(tb) & CF_PCREL || tb->pc == desc->pc) &&
         tb_page_addr0(tb) == desc->page_addr0 &&
         tb->cs_base == desc->cs_base &&
         tb->flags == desc->flags &&
@@ -279,7 +279,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
         tb = qatomic_rcu_read(&jc->array[hash].tb);
 
         if (likely(tb &&
-                   tb_pc(tb) == pc &&
+                   tb->pc == pc &&
                    tb->cs_base == cs_base &&
                    tb->flags == flags &&
                    tb->trace_vcpu_dstate == *cpu->trace_dstate &&
@@ -484,7 +484,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
         } else {
             tcg_debug_assert(!(tb_cflags(last_tb) & CF_PCREL));
             assert(cc->set_pc);
-            cc->set_pc(cpu, tb_pc(last_tb));
+            cc->set_pc(cpu, last_tb->pc);
         }
         if (qemu_loglevel_mask(CPU_LOG_EXEC)) {
             target_ulong pc = log_pc(cpu, last_tb);
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 2dbc2ce172..efefa08ee1 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -44,7 +44,7 @@ static bool tb_cmp(const void *ap, const void *bp)
     const TranslationBlock *a = ap;
     const TranslationBlock *b = bp;
 
-    return ((tb_cflags(a) & CF_PCREL || tb_pc(a) == tb_pc(b)) &&
+    return ((tb_cflags(a) & CF_PCREL || a->pc == b->pc) &&
             a->cs_base == b->cs_base &&
             a->flags == b->flags &&
             (tb_cflags(a) & ~CF_INVALID) == (tb_cflags(b) & ~CF_INVALID) &&
@@ -853,7 +853,7 @@ static void tb_jmp_cache_inval_tb(TranslationBlock *tb)
             tcg_flush_jmp_cache(cpu);
         }
     } else {
-        uint32_t h = tb_jmp_cache_hash_func(tb_pc(tb));
+        uint32_t h = tb_jmp_cache_hash_func(tb->pc);
 
         CPU_FOREACH(cpu) {
             CPUJumpCache *jc = cpu->tb_jmp_cache;
@@ -885,7 +885,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
     /* remove the TB from the hash list */
     phys_pc = tb_page_addr0(tb);
-    h = tb_hash_func(phys_pc, (orig_cflags & CF_PCREL ? 0 : tb_pc(tb)),
+    h = tb_hash_func(phys_pc, (orig_cflags & CF_PCREL ? 0 : tb->pc),
                      tb->flags, orig_cflags, tb->trace_vcpu_dstate);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
         return;
@@ -966,7 +966,7 @@ TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     tb_record(tb, p, p2);
 
     /* add in the hash table */
-    h = tb_hash_func(phys_pc, (tb->cflags & CF_PCREL ? 0 : tb_pc(tb)),
+    h = tb_hash_func(phys_pc, (tb->cflags & CF_PCREL ? 0 : tb->pc),
                      tb->flags, tb->cflags, tb->trace_vcpu_dstate);
     qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 7969c1ee4c..b495e63b8f 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -134,7 +134,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
 
         for (j = 0; j < TARGET_INSN_START_WORDS; ++j) {
             if (i == 0) {
-                prev = (!(tb_cflags(tb) & CF_PCREL) && j == 0 ? tb_pc(tb) : 0);
+                prev = (!(tb_cflags(tb) & CF_PCREL) && j == 0 ? tb->pc : 0);
             } else {
                 prev = tcg_ctx->gen_insn_data[i - 1][j];
             }
@@ -170,7 +170,7 @@ static int cpu_unwind_data_from_tb(TranslationBlock *tb, uintptr_t host_pc,
 
     memset(data, 0, sizeof(uint64_t) * TARGET_INSN_START_WORDS);
     if (!(tb_cflags(tb) & CF_PCREL)) {
-        data[0] = tb_pc(tb);
+        data[0] = tb->pc;
     }
 
     /*
-- 
2.34.1


