Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1975F4A54
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 22:32:47 +0200 (CEST)
Received: from localhost ([::1]:59268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofoas-0003HD-UT
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 16:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyO-0001xm-MW
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:53:00 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyM-0000Ha-OL
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:53:00 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 i7-20020a17090a65c700b0020ad9666a86so2818497pjs.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=tAnjl9pfuDVCc8aWBS5RzIa+1h31pDabWO64Od8wikE=;
 b=kBQwLHlHbmtO5j7UF4khiDh0P8vKNpPeUetSInW7DF/OGtwurvguXxSp6TmbNS9E0n
 fOg2WdBPa2UofObO7IXhO1Y5f9eZKrp5l+2jFE85tRzUx8XbGpwwN6X5AQjQIQ4Fck2L
 UnJrdZ/L9ug7AzBnxs4PKjS+6s2tdPNxb9RRrWR+xYlLcF7vV+zAJfs2mtPh1WmlfzLx
 ENu2xKgktwGxozPYxG9mlpW8f1kVOIf1ut8VPL1AJ22AJb3fvhOzbKdiLgpiBSJeI63X
 LatEuRRyM2kg/S10e7mjN82Ng2JpKMabiKtp9/6GYsLIbMohhyZCqXn6mw5suYyYAiE1
 2Q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=tAnjl9pfuDVCc8aWBS5RzIa+1h31pDabWO64Od8wikE=;
 b=2hFp+SYUUzcirUiEH5wCnvyVdxQGvQZTD+duxS+PQ6X3hcgBr1TfawPw6iEoQ9253l
 /w7VBRb6DjURP4wfSr03/7rEyURJaB99lJSgOvkCsOCCl8Ce5g9gd9OnYFgs4wAE6PTU
 PkycAWspdRXgpwZRTTTtLWB7EwE65fkTe9PBZzN/tcPvoxEw4Y0Ehwd8UGbDtZsETgef
 1cd5r7U7qy84ewQokDmC7jFW0I6pbl0ZNxM3wmNDBxoVBQ/lhR1l74PZLzfA+pp9Nx3A
 5kbI+SqpFTSCX0SrAXwFfyldoRq8JL4zVtsTs8SposkVfM0kAIPK3UvB2jhLFfPaSGa8
 iFMg==
X-Gm-Message-State: ACrzQf09Z+j9g4Z30MDaXW4EIwxdglMnZEX3KXuzUwK5SRg89j1USiLE
 hKMeMBlrldhJ9TGgXHYzG7JFgzte5VKcXg==
X-Google-Smtp-Source: AMsMyM64jAObDP11QSCeWGKt9E5N0piCENJT1XpYzVxwJNbpOdVyOOhdpEda2BK2QSpkAZxt/532qQ==
X-Received: by 2002:a17:903:40cf:b0:17f:7d7e:95b0 with SMTP id
 t15-20020a17090340cf00b0017f7d7e95b0mr1744808pld.78.1664913176270; 
 Tue, 04 Oct 2022 12:52:56 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a1709026e1700b00172973d3cd9sm9293406plk.55.2022.10.04.12.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 12:52:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 13/20] accel/tcg: Do not align tb->page_addr[0]
Date: Tue,  4 Oct 2022 12:52:34 -0700
Message-Id: <20221004195241.46491-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004195241.46491-1-richard.henderson@linaro.org>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


