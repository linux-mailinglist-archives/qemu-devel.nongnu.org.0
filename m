Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ACC5F1528
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 23:46:02 +0200 (CEST)
Received: from localhost ([::1]:34084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeNpZ-0007tl-6y
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 17:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNX6-0006uN-6O
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:56 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:40451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNX4-0005RS-AV
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:55 -0400
Received: by mail-qk1-x734.google.com with SMTP id c19so3609591qkm.7
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 14:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Me0sYA03idIPAnR4K7d66qbwf2Tw0FB962wCcSsxCZU=;
 b=RpmLEvMQ3/Y5w0nbC4Baqc6zNnDUv028sttoNpg4ha3MbOccmLV//8z6p4329MMsUI
 ITt/lcRhZf5+hDtiNj+oyKgqjR8dqcIFk4HTwsDrf+uWajYUE01OGyz8obztrN+XWlW2
 nPj6S+qSQoNZ0Bjq+wpYXUxJ0DW7x2i2f7+qq/6OMD1fqKSJx7yVeyQKsu0yp3zNd5Oe
 rYtiajF426kk4vxGzT9ffbqIe2FzxLLX3fcGfp9vODmYwjVao2ZOMQjxMWCDJk1rbMC0
 Z2HcF/p1yBYzOxoKgYt9RiWj5hGqfJro7ZybLw35CgiwVZnH8WZhnmQTVSCUfZYQ/huu
 EIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Me0sYA03idIPAnR4K7d66qbwf2Tw0FB962wCcSsxCZU=;
 b=ppr2fc3NBhDBH0TTqBt0La5YK0HfZMGrqKEr+DEuemE3xSkeddB7ZoKGJwp0PCWPcU
 wi1RTxAwZeqczZ4nkwNeR2MTFPJ9vjOiRUajfi2a24WL3pWb68lwHQqyIzD4BSbYzkpc
 WcfLQtKeeFFjBdz6vfXfOeuoK8N57dCs5mDouVFaroW2JdeBUlPfZqthDhiBDibtkGbJ
 ZrHTlCB/62PVllcbTswMEWcCpbOQIV+Dw+KOxn/edPyhYBU9jPdd2QGItb/Aobd6FKxq
 mhrxfyd4+mPrg7dNT+7bAOGrTazwZmy6USVdSqiU665YGpPTTKqxkbw6Td9ywBQSVR6z
 peHw==
X-Gm-Message-State: ACrzQf3Ya0oDfoEexnUWjucoB/+6g6rMcUWAnGddMZCHY5EzyD7nTggW
 Iw0ivfiG4+SaHop6idyiJjJ5snZYMBoSxw==
X-Google-Smtp-Source: AMsMyM4udaKOBiQToKaHjvrGIPPO6Hc2jRyYGa36xXOZup2kmFplp/Kc1ReS3zVOSeD+ENpk567gPQ==
X-Received: by 2002:a05:620a:1a14:b0:6ce:a65b:8e6 with SMTP id
 bk20-20020a05620a1a1400b006cea65b08e6mr7598325qkb.145.1664573213133; 
 Fri, 30 Sep 2022 14:26:53 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05620a28d200b006ce813bb306sm3696370qkp.125.2022.09.30.14.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:26:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linux.org, alex.bennee@linux.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v6 12/18] accel/tcg: Use DisasContextBase in
 plugin_gen_tb_start
Date: Fri, 30 Sep 2022 14:26:16 -0700
Message-Id: <20220930212622.108363-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930212622.108363-1-richard.henderson@linaro.org>
References: <20220930212622.108363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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


