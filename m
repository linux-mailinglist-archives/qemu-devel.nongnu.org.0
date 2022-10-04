Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E715F45F9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:55:36 +0200 (CEST)
Received: from localhost ([::1]:58744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofjKZ-0005K0-Ba
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidj-0002ti-S0
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:20 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidi-0004Q7-3A
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:19 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 e11-20020a17090a77cb00b00205edbfd646so18752620pjs.1
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=KuRL2CDS48FqJFGuFq4UGhKzkHTMjVZnGCKRoNAufic=;
 b=Z/rRpPG9bPEoPHBDIrBXY/qjiq35AV8QS5qYveOpQlESJRtJ2Yr2InzfP3Drb7pk9L
 USEnkAi8REpPy+hMUh6Z/f3TM+0p8C3tJGcdUQkDskF9F/QZZkTewiryhffFi7jflH0x
 TAGzBAYsfZuHo/EKRaBJUAAsUjXJJZ/UZrQFooZ7mEVX7LIPuYsrTgI05iehRIr5Br0r
 VMUdwzMSakgMDF3BXVtye9iWiqTc6TOfUs0cGSztMQfcYKkDTEk+AIleYPvWhj7wd+oz
 sbn6FowIUK4IuPDhKgI9BCHX7p6bOkTnf7n3+CJXpvY8NFgfDYQ6ucQDhdd2cfC9YraI
 iZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=KuRL2CDS48FqJFGuFq4UGhKzkHTMjVZnGCKRoNAufic=;
 b=vuEZz6rRVs/3G7SSs8P+xrElf+3A+BWXkRT0byki8HDsHx1zMS2TWZqdde/bfQYJDL
 fphRUr3Atyr5W1NBdNhflNavvVNbL7hrfyuSvsBV/NfR+moetCzYLk2kwXBRgh6o8piA
 GOGKYuA9qDiOxv8QCBjCizKo0vpRpAAs+SFXH9VOWJBcFRR5G6lt9VLZMZSWsfpIsqHu
 2t0YWkcc5grHzR9PIAD5DPceyR+vqSLn8/W6sN9zHCiWM0hrKt84XVbCpIPYUy44+UYk
 i6axZxwdbW72iPXbuu3JFecflQZi1W/+UcB3Ijsk2IUAazUgCChjgr/Y2WgsgJpZQo9R
 okLA==
X-Gm-Message-State: ACrzQf3v3Yi6z0UWoc3FZTWv1vtwkPTMnoBb0rJkIsJJQWM+N/CvgEwX
 6B4plxtlre0D32c/Ow9AInNF/yDb2g5wJw==
X-Google-Smtp-Source: AMsMyM5Yck/PwF4Bhb1Aft3sfBngOJSc/vUbiTkauzpKDAjdT5rGvrHafji+eSDDG9ETWM3W8Ahurw==
X-Received: by 2002:a17:902:ea0f:b0:178:23f7:5a30 with SMTP id
 s15-20020a170902ea0f00b0017823f75a30mr27076782plg.150.1664892676477; 
 Tue, 04 Oct 2022 07:11:16 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa79ae5000000b00561382a5a25sm1240357pfp.26.2022.10.04.07.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 07:11:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v7 13/18] accel/tcg: Do not align tb->page_addr[0]
Date: Tue,  4 Oct 2022 07:10:46 -0700
Message-Id: <20221004141051.110653-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004141051.110653-1-richard.henderson@linaro.org>
References: <20221004141051.110653-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let tb->page_addr[0] contain the address of the first byte of the
translated block, rather than the address of the page containing the
start of the translated block.  We need to recover this value anyway
at various points, and it is easier to discard a page offset when it
is not needed, which happens naturally via the existing find_page shift.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c      | 16 ++++++++--------
 accel/tcg/cputlb.c        |  3 ++-
 accel/tcg/translate-all.c |  9 +++++----
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5f43b9769a..dd58a144a8 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -174,7 +174,7 @@ struct tb_desc {
     target_ulong pc;
     target_ulong cs_base;
     CPUArchState *env;
-    tb_page_addr_t phys_page1;
+    tb_page_addr_t page_addr0;
     uint32_t flags;
     uint32_t cflags;
     uint32_t trace_vcpu_dstate;
@@ -186,7 +186,7 @@ static bool tb_lookup_cmp(const void *p, const void *d)
     const struct tb_desc *desc = d;
 
     if (tb->pc == desc->pc &&
-        tb->page_addr[0] == desc->phys_page1 &&
+        tb->page_addr[0] == desc->page_addr0 &&
         tb->cs_base == desc->cs_base &&
         tb->flags == desc->flags &&
         tb->trace_vcpu_dstate == desc->trace_vcpu_dstate &&
@@ -195,8 +195,8 @@ static bool tb_lookup_cmp(const void *p, const void *d)
         if (tb->page_addr[1] == -1) {
             return true;
         } else {
-            tb_page_addr_t phys_page2;
-            target_ulong virt_page2;
+            tb_page_addr_t phys_page1;
+            target_ulong virt_page1;
 
             /*
              * We know that the first page matched, and an otherwise valid TB
@@ -207,9 +207,9 @@ static bool tb_lookup_cmp(const void *p, const void *d)
              * is different for the new TB.  Therefore any exception raised
              * here by the faulting lookup is not premature.
              */
-            virt_page2 = TARGET_PAGE_ALIGN(desc->pc);
-            phys_page2 = get_page_addr_code(desc->env, virt_page2);
-            if (tb->page_addr[1] == phys_page2) {
+            virt_page1 = TARGET_PAGE_ALIGN(desc->pc);
+            phys_page1 = get_page_addr_code(desc->env, virt_page1);
+            if (tb->page_addr[1] == phys_page1) {
                 return true;
             }
         }
@@ -235,7 +235,7 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
     if (phys_pc == -1) {
         return NULL;
     }
-    desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
+    desc.page_addr0 = phys_pc;
     h = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
     return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
 }
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 361078471b..a0db2d32a8 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -951,7 +951,8 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
    can be detected */
 void tlb_protect_code(ram_addr_t ram_addr)
 {
-    cpu_physical_memory_test_and_clear_dirty(ram_addr, TARGET_PAGE_SIZE,
+    cpu_physical_memory_test_and_clear_dirty(ram_addr & TARGET_PAGE_MASK,
+                                             TARGET_PAGE_SIZE,
                                              DIRTY_MEMORY_CODE);
 }
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ca685f6ede..3a63113c41 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1167,7 +1167,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     qemu_spin_unlock(&tb->jmp_lock);
 
     /* remove the TB from the hash list */
-    phys_pc = tb->page_addr[0] + (tb->pc & ~TARGET_PAGE_MASK);
+    phys_pc = tb->page_addr[0];
     h = tb_hash_func(phys_pc, tb->pc, tb->flags, orig_cflags,
                      tb->trace_vcpu_dstate);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
@@ -1291,7 +1291,7 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
      * we can only insert TBs that are fully initialized.
      */
     page_lock_pair(&p, phys_pc, &p2, phys_page2, true);
-    tb_page_add(p, tb, 0, phys_pc & TARGET_PAGE_MASK);
+    tb_page_add(p, tb, 0, phys_pc);
     if (p2) {
         tb_page_add(p2, tb, 1, phys_page2);
     } else {
@@ -1644,11 +1644,12 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
         if (n == 0) {
             /* NOTE: tb_end may be after the end of the page, but
                it is not a problem */
-            tb_start = tb->page_addr[0] + (tb->pc & ~TARGET_PAGE_MASK);
+            tb_start = tb->page_addr[0];
             tb_end = tb_start + tb->size;
         } else {
             tb_start = tb->page_addr[1];
-            tb_end = tb_start + ((tb->pc + tb->size) & ~TARGET_PAGE_MASK);
+            tb_end = tb_start + ((tb->page_addr[0] + tb->size)
+                                 & ~TARGET_PAGE_MASK);
         }
         if (!(tb_end <= start || tb_start >= end)) {
 #ifdef TARGET_HAS_PRECISE_SMC
-- 
2.34.1


