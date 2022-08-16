Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F61596447
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 23:13:43 +0200 (CEST)
Received: from localhost ([::1]:36684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3sc-0000pO-EC
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 17:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3HL-0005NN-O1
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:35:13 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:41701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3H3-0004bb-AY
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:35:10 -0400
Received: by mail-oi1-x230.google.com with SMTP id t8so6917386oie.8
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=cLyo7WUImzwl8n72hOFLRaDln1yZ2j3QK9XDXoSaZVk=;
 b=aMVUEV59R8mdaR0ZItQmDsMLFH7rNvDdYOYIY2QyAfMNwxCI6rjRa3+1+abcA9eBPZ
 3/ze/NAmfo5Q8N/PhjGbiu04RPzEmRrYu1h9Oom7sj1vLWOz0jy6VdwnmYE1tHJHqGPy
 MaHxV93Tfp7NCdvrZA//pTxkzvMiYVbjm03jOhjkh68zwQ2GzQk7+hN+7kkKA/yBfA6+
 g1YsM/LnArpCk/feRcLmlqbjWbQSSI7SfXkLDMtotE/YJbIRo//d0ZttvkkMjoHlOGBa
 kkGAVyZIlP2SIh2NTkoSpVRp85osHiAyxt3zYCAhq5GyCGpYbLXdWc4SLHEW7Br9jUrY
 SVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cLyo7WUImzwl8n72hOFLRaDln1yZ2j3QK9XDXoSaZVk=;
 b=e3ZDRzp+dsgryUEOFoXT/ki5al3l+kERXellYkJLgtHfCiBR+wMTFjHIuqebw0gEoU
 +d3oeOH8nBmNnreL58xA6fKZon+JqADStjPCvSAdSp/nkKa9XvjD9cP6t7NBiqngwgac
 Aw/PjUMah6y93QRTfZE8YZ7vaO0sWHE9dvzx4+m+FjXYUXRJhUj6+djuhjdAGnfvoSAo
 El4XD3BNRn1zoXj+m1fshI8jtHxiKgRC2aPtOHrBBUJ5vjmqCBOAjPf38054/Lm6205s
 b74ToXO0y8mCeDNUJeTpr3zizyr0cthx/Glxe8D5wCTTdyINFFA7YAToapERdfJ0vbH1
 t4PA==
X-Gm-Message-State: ACgBeo3rS2JtOJhNZdFmwDojg4LhQ/L67pHptr1AWHwbTWwiUvtWrDlL
 cecEu2Lpri2UOUQOZsxMVou17COegeoKWA==
X-Google-Smtp-Source: AA6agR7bENcurirQQ6KZlmWGr7QDiQnam1w7rkYQdRHIO/g7TeZszpFe/Tc41iNHKbgpFyuP4LHhAA==
X-Received: by 2002:a05:6808:23d0:b0:344:b8fe:6f50 with SMTP id
 bq16-20020a05680823d000b00344b8fe6f50mr135803oib.159.1660682088090; 
 Tue, 16 Aug 2022 13:34:48 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 19/33] accel/tcg: Use DisasContextBase in
 plugin_gen_tb_start
Date: Tue, 16 Aug 2022 15:33:46 -0500
Message-Id: <20220816203400.161187-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Use the pc coming from db->pc_first rather than the TB.

Use the cached host_addr rather than re-computing for the
first page.  We still need a separate lookup for the second
page because it won't be computed for DisasContextBase until
the translator actually performs a read from the page.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/plugin-gen.h |  7 ++++---
 accel/tcg/plugin-gen.c    | 23 ++++++++++++-----------
 accel/tcg/translator.c    |  2 +-
 3 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
index f92f169739..5004728c61 100644
--- a/include/exec/plugin-gen.h
+++ b/include/exec/plugin-gen.h
@@ -19,7 +19,8 @@ struct DisasContextBase;
 
 #ifdef CONFIG_PLUGIN
 
-bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool supress);
+bool plugin_gen_tb_start(CPUState *cpu, const struct DisasContextBase *db,
+                         bool supress);
 void plugin_gen_tb_end(CPUState *cpu);
 void plugin_gen_insn_start(CPUState *cpu, const struct DisasContextBase *db);
 void plugin_gen_insn_end(void);
@@ -48,8 +49,8 @@ static inline void plugin_insn_append(abi_ptr pc, const void *from, size_t size)
 
 #else /* !CONFIG_PLUGIN */
 
-static inline
-bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool supress)
+static inline bool
+plugin_gen_tb_start(CPUState *cpu, const struct DisasContextBase *db, bool sup)
 {
     return false;
 }
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 8377c15383..0f080386af 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -852,7 +852,8 @@ static void plugin_gen_inject(const struct qemu_plugin_tb *plugin_tb)
     pr_ops();
 }
 
-bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool mem_only)
+bool plugin_gen_tb_start(CPUState *cpu, const DisasContextBase *db,
+                         bool mem_only)
 {
     bool ret = false;
 
@@ -870,9 +871,9 @@ bool plugin_gen_tb_start(CPUState *cpu, const TranslationBlock *tb, bool mem_onl
 
         ret = true;
 
-        ptb->vaddr = tb->pc;
+        ptb->vaddr = db->pc_first;
         ptb->vaddr2 = -1;
-        get_page_addr_code_hostp(cpu->env_ptr, tb->pc, true, &ptb->haddr1);
+        ptb->haddr1 = db->host_addr[0];
         ptb->haddr2 = NULL;
         ptb->mem_only = mem_only;
 
@@ -898,16 +899,16 @@ void plugin_gen_insn_start(CPUState *cpu, const DisasContextBase *db)
      * Note that we skip this when haddr1 == NULL, e.g. when we're
      * fetching instructions from a region not backed by RAM.
      */
-    if (likely(ptb->haddr1 != NULL && ptb->vaddr2 == -1) &&
-        unlikely((db->pc_next & TARGET_PAGE_MASK) !=
-                 (db->pc_first & TARGET_PAGE_MASK))) {
-        get_page_addr_code_hostp(cpu->env_ptr, db->pc_next,
-                                 true, &ptb->haddr2);
-        ptb->vaddr2 = db->pc_next;
-    }
-    if (likely(ptb->vaddr2 == -1)) {
+    if (ptb->haddr1 == NULL) {
+        pinsn->haddr = NULL;
+    } else if (is_same_page(db, db->pc_next)) {
         pinsn->haddr = ptb->haddr1 + pinsn->vaddr - ptb->vaddr;
     } else {
+        if (ptb->vaddr2 == -1) {
+            ptb->vaddr2 = TARGET_PAGE_ALIGN(db->pc_first);
+            get_page_addr_code_hostp(cpu->env_ptr, ptb->vaddr2,
+                                     true, &ptb->haddr2);
+        }
         pinsn->haddr = ptb->haddr2 + pinsn->vaddr - ptb->vaddr2;
     }
 }
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index a693c17259..3e6fab482e 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -81,7 +81,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int max_insns,
     ops->tb_start(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
-    plugin_enabled = plugin_gen_tb_start(cpu, tb, cflags & CF_MEMI_ONLY);
+    plugin_enabled = plugin_gen_tb_start(cpu, db, cflags & CF_MEMI_ONLY);
 
     while (true) {
         db->num_insns++;
-- 
2.34.1


