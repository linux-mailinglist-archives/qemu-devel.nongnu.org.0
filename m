Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA4B5F4A33
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 22:16:49 +0200 (CEST)
Received: from localhost ([::1]:37812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofoLP-0003yb-L4
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 16:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyM-0001ss-WD
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:59 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:40531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyK-0000Fs-9x
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:58 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 h8-20020a17090a054800b00205ccbae31eso19550174pjf.5
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Me0sYA03idIPAnR4K7d66qbwf2Tw0FB962wCcSsxCZU=;
 b=xTgXNB60QV1OW1aJH2i2rdagQWNfLdurK/jjOJTei6SEPx+nJgQXCcw90RotANBHXj
 ViDip2m62EiXzyZ3HjDzySdqgu9kfBjKb/UG8IAylbGtmDbufo+Bx+Mz/TH7JW7EQwR/
 QU1QCYo80BNC9/uJ6mN4U8jvpJPi679r9xhXCiwW4L2x/v3I/EwFKsh/4GuJj8CGH4wc
 1MUTYitcl66dadbQ5Cra50XVM2SzYQxdZlilxMG0nDR/a1AYt4T8TZNnb4dlMrvjZ+bV
 IRvb2ato83xII7mZMiRoztow2RpnrppLz8AuJ6nL3elLjbwkeZp+UXnN7r6/XdzdNx2R
 1llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Me0sYA03idIPAnR4K7d66qbwf2Tw0FB962wCcSsxCZU=;
 b=ZWoCgvFkDYGUbnu9dNXjxUAUkcatlT7Ypp3+4oHuOk7UEa7G8vOfcOU7noBiUnJGZm
 VeHfCMYF8bKcJzjWhqnhhQqNPcIyCLTSLDwNMBbokW1o6Vt1OQjhsjavGWof7ZgMt+Z0
 39FundKdzWRlOBNMEiNABJot+bwiVynGMxhrhzBLmKT89asKjQ2NN1y5uhxExXKtRWAd
 Eoh4gaZP5zd413T2mQHuPea2auyHEgq3TogS9IGK7K87PcLLBnPuZZ4R/jT3Xpw91Stg
 zDy1IQRmqPm6Sbp0Js4w51kvXiue0XSZNTdPp4WgP/GtAeRA2begs6kVy4cRWU7kRytR
 ITNw==
X-Gm-Message-State: ACrzQf1mnxC1R3gAhGAim7yCvv2l8TPJdYpVtOtYag9I/JbqAN/l6w7T
 4yo/VHTFOPoWtigXu/oPCqbxI/BU8yqPng==
X-Google-Smtp-Source: AMsMyM7xy5WKdisHL+rymNhbGQ6Zv2vEwQuOdP6drOvq9wwMsBb+HShYePH+mfvkxE9PwSfcNDaBFw==
X-Received: by 2002:a17:90a:4613:b0:20a:e03a:d292 with SMTP id
 w19-20020a17090a461300b0020ae03ad292mr1285151pjg.91.1664913175310; 
 Tue, 04 Oct 2022 12:52:55 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a1709026e1700b00172973d3cd9sm9293406plk.55.2022.10.04.12.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 12:52:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 12/20] accel/tcg: Use DisasContextBase in plugin_gen_tb_start
Date: Tue,  4 Oct 2022 12:52:33 -0700
Message-Id: <20221004195241.46491-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004195241.46491-1-richard.henderson@linaro.org>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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


