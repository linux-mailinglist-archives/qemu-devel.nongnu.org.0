Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA065915A4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:51:19 +0200 (CEST)
Received: from localhost ([::1]:46512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZkc-0003b8-0d
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ5J-0003vF-GZ
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:37 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ5H-0006a2-61
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:37 -0400
Received: by mail-pl1-x630.google.com with SMTP id 17so1434799pli.0
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=cLyo7WUImzwl8n72hOFLRaDln1yZ2j3QK9XDXoSaZVk=;
 b=ysQwSCN4ChTaLj9/ZMoqE/PMnbOYsCXb7/WqOi1bFUnc7oLlpZOto3YFEWm8G4LEFt
 JPjARJGAFRkVTAG9o4h4dKAm5kNSYWw8dlB+QqdNHQGSADM+ukXM7H2tfBsC8SwLGZRs
 4Zhq37li2M3SkZPWulrjfN6ExpCrPU0LX2vDmjBYUyJgATXP27b3IH5Wk+Mq+BUWBg+I
 ocg0xif9m1FeM/OtZshxupWRNTOek3iw2cj5Z+Rn23OO6/a18OsMMfOjUcG4sxIwuEAl
 6Z5zxLdhEjBAHQlxbC7i1U5oCWNWXcXhpjRrps2HzE9lAb7n9j2116Oe3UmWu9+Hwgjm
 s1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cLyo7WUImzwl8n72hOFLRaDln1yZ2j3QK9XDXoSaZVk=;
 b=7hb6A5bMhLxEax+qfSAv7vY8cGTlmgW0AMFVg64YQi+SXk4k/oIyEKrqhrL8m4R6fr
 8ykauFmZzwearcW3F7ESsoDO2rvvFVaoflH+bQNktRQ9r9j0dYTfKdHatfTSPvVi/QUY
 VAuiBcDusFVmUKW/wxoK4fb1dn2aVO980x8XD3GErG4agNJqn/eTBvzl/3Etxly4VR+X
 aMv2J0YhwLF6x4cBUI+JKEi1UrT2cKpRbaLgTJCNoJ7x1WZhR6TTfVpIaSy4glndks4O
 hoZb+4SjTKcooUj5RTiX+eE9KSnOEoCG305JcaxNsc1n2U0MR30XDYUNelixuiKFdjib
 cdgA==
X-Gm-Message-State: ACgBeo0XAoQIt2teip8EWlmnF6V12TMWFksWeBLg5aC7HF+lwTRFn00R
 pujlZo5G2tyIY5JHlWRZeBUbxI3Qrkiwog==
X-Google-Smtp-Source: AA6agR4RRoGxnL9zA0M7FVBJkOa8D4H86Dms09ZgIclEgds30h3kc7sZqH/l3dK7LShnk7X1d52Ekw==
X-Received: by 2002:a17:90b:3c0e:b0:1f4:d764:99f8 with SMTP id
 pb14-20020a17090b3c0e00b001f4d76499f8mr5242344pjb.91.1660327713862; 
 Fri, 12 Aug 2022 11:08:33 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 21/21] accel/tcg: Use DisasContextBase in
 plugin_gen_tb_start
Date: Fri, 12 Aug 2022 11:08:06 -0700
Message-Id: <20220812180806.2128593-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


