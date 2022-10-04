Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530C15F45EB
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:51:26 +0200 (CEST)
Received: from localhost ([::1]:53938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofjGV-0007sk-Bf
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidi-0002rp-B9
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:19 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidg-0004Pp-3v
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:17 -0400
Received: by mail-pl1-x62e.google.com with SMTP id h10so10053629plb.2
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Me0sYA03idIPAnR4K7d66qbwf2Tw0FB962wCcSsxCZU=;
 b=KgKcWze6ZMoM0sm/WDVer24WKnzRwloiI3I7u2Fkjz8bpBH2KpTtHL8yE6+oh22Zzm
 xUvnxgIawszFmi0d7PF037LsW+3dk2XToKgombdQx2f7opYunM1iNn1Lzngo/V8j5tpV
 HhbpkUZ8L8KxtaUNGKwS1lp7sfwF2aybq7dlWh+KyW5Bfo5fPgO3dT5fzieCMOnyrKeK
 4VpHBxcBcLt6Qn4EZJbdba+NyvQEAdMu6LQaOa8BlTvujKWt64Wk73MHkV0tSJeW/Glw
 Din4J8iDnTI5PeNjvaKeSIDxa6Fe9/n07JDwSE88cBE9i5Baxpw3GDiol17y0IfEUsfE
 GDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Me0sYA03idIPAnR4K7d66qbwf2Tw0FB962wCcSsxCZU=;
 b=H1eRqhwqhN7x+iK20MPfX9eP5gqNaW9zdNo3pcBf8ukPggE1vI0+qZzqnK6uPobmEb
 NZ8NqH/l4mnN+eLjFaIgsaEpXj1TnkxUcpnqG7oddz3gTG/TXvq+5oI54cFp7iLy0Ovj
 HEtjoTTfD4jgb4dqxj4Sq9dewomG3hnqinkX4+JOdr/AV8eDr4l0sGbHGu2b5quBsGMa
 ZikUBNfbiVFnlzVD7GZTOY+h3jBbvTZ+g1aQajbMsDm0BrmzDna6d6VLj7sFdPIaYtgw
 huGGFGDqFk4tnpLcLm+XypfJOVh5fU508DgItsYZ5EEMjlBi9fNgX9KePWShjh9Whn+F
 aOCw==
X-Gm-Message-State: ACrzQf3Gqb78YqLttMptifdq9+3jZXZKFrmrMPttf1KCH1AIs33Hn4cZ
 ITkAzQ9gP10GC8cW49mIseLhl73svyMlvw==
X-Google-Smtp-Source: AMsMyM52GR4MKESErb2AgyZjP8g5poHsR7hoIUURdXpm7SeoWqGJcSJfeG/8xFPhBJJ8TK5DWokMCw==
X-Received: by 2002:a17:902:a612:b0:17e:539:c415 with SMTP id
 u18-20020a170902a61200b0017e0539c415mr14499191plq.173.1664892674637; 
 Tue, 04 Oct 2022 07:11:14 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa79ae5000000b00561382a5a25sm1240357pfp.26.2022.10.04.07.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 07:11:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v7 12/18] accel/tcg: Use DisasContextBase in
 plugin_gen_tb_start
Date: Tue,  4 Oct 2022 07:10:45 -0700
Message-Id: <20221004141051.110653-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004141051.110653-1-richard.henderson@linaro.org>
References: <20221004141051.110653-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Use the pc coming from db->pc_first rather than the TB.

Use the cached host_addr rather than re-computing for the
first page.  We still need a separate lookup for the second
page because it won't be computed for DisasContextBase until
the translator actually performs a read from the page.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/plugin-gen.h |  7 ++++---
 accel/tcg/plugin-gen.c    | 22 +++++++++++-----------
 accel/tcg/translator.c    |  2 +-
 3 files changed, 16 insertions(+), 15 deletions(-)

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
index 3d0b101e34..80dff68934 100644
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
-        get_page_addr_code_hostp(cpu->env_ptr, tb->pc, &ptb->haddr1);
+        ptb->haddr1 = db->host_addr[0];
         ptb->haddr2 = NULL;
         ptb->mem_only = mem_only;
 
@@ -898,16 +899,15 @@ void plugin_gen_insn_start(CPUState *cpu, const DisasContextBase *db)
      * Note that we skip this when haddr1 == NULL, e.g. when we're
      * fetching instructions from a region not backed by RAM.
      */
-    if (likely(ptb->haddr1 != NULL && ptb->vaddr2 == -1) &&
-        unlikely((db->pc_next & TARGET_PAGE_MASK) !=
-                 (db->pc_first & TARGET_PAGE_MASK))) {
-        get_page_addr_code_hostp(cpu->env_ptr, db->pc_next,
-                                 &ptb->haddr2);
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
+            get_page_addr_code_hostp(cpu->env_ptr, ptb->vaddr2, &ptb->haddr2);
+        }
         pinsn->haddr = ptb->haddr2 + pinsn->vaddr - ptb->vaddr2;
     }
 }
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index ca8a5f2d83..8e78fd7a9c 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -75,7 +75,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int max_insns,
     ops->tb_start(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
-    plugin_enabled = plugin_gen_tb_start(cpu, tb, cflags & CF_MEMI_ONLY);
+    plugin_enabled = plugin_gen_tb_start(cpu, db, cflags & CF_MEMI_ONLY);
 
     while (true) {
         db->num_insns++;
-- 
2.34.1


