Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540293C3532
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:37:02 +0200 (CEST)
Received: from localhost ([::1]:57886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F2L-0002Zk-C2
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExM-00050a-44
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:52 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:45603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExK-0002E2-BO
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:51 -0400
Received: by mail-pl1-x62a.google.com with SMTP id p17so6109861plf.12
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wPpFfUs4h86ewu3F3iemYnJMaalb1kmHYOs+LuBl5DE=;
 b=PmrRTxuGXUAj0eFvREXvAAM5IPPizJxSXQjpBPBAGNYlL3e+0PbvknpVE7Ka7ODO/M
 ToK5ZeGElpMfZ6Q/MrBsbp/LIGAGlyBvgr36Iu0q5TQpoW1XyEh6GyhnQLrL1xWu6mSE
 VrsZUb5lqwqUokwPgOv2a6FjEkhIF609KZnu1UJjD8Z6TGlykFvgcPdBC8fTP2Bpu2Is
 GJRcngy1kFVO+MdflcBvsFDTCBAruG4qa3Gx7UCwKutZzN+VLIYKUEzI1uPci3BYtvku
 Nw0tGsvgHI8spi0WexuEWTKmtIgr7opotWYNC5becdbchE9ktBV0bxE7E0Oqo+i7XLwL
 Di+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wPpFfUs4h86ewu3F3iemYnJMaalb1kmHYOs+LuBl5DE=;
 b=BulBVXOhPot4NPvhghmU5TMDxoIyobPpkW80bcsdc7dnWCASYrVxUiIRJVqcmN6fPO
 8R0KDuHaA/Hp5Pasz9tOosV2mafp9qc6tKGsX05HxOmagEiFJ6NwT7GCRjXecJejOavq
 awctinC2yFw3K8mG3dOIWBG1WdEt6I4AhzD1JhOUezpBdmm3HiM1CTMrwRqRt7v12DZV
 gUMsoDAh9mL2reFo8x2njk5lkyR2jannGKEB6kKMlQH4nBqmQ1sTJN73Q8BmMygY2OfW
 upPSydxWlUY278cewDfl5C+E5im/llS5WlZTDub6gXKW0gvSG0tXaI7T2HUTIQ9TVqjV
 4jWA==
X-Gm-Message-State: AOAM532Jt4TTPfn2dCGk3k3pWa3JkkGFc5slESOOBNaRWAR9F5w+O/2L
 gkOwJ1JR7pCpP9I+PWSVVLrYrMArok2tHg==
X-Google-Smtp-Source: ABdhPJyz+n9sN4H/oMn53tf4++2ZxI5j18l8aBGqvCYUBG+AUvG2HI6JWTpn4T1NM4QOab4W/uD1tg==
X-Received: by 2002:a17:90a:1a:: with SMTP id 26mr4765510pja.187.1625931108959; 
 Sat, 10 Jul 2021 08:31:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/41] tcg: Move tb_phys_invalidate_count to tb_ctx
Date: Sat, 10 Jul 2021 08:31:07 -0700
Message-Id: <20210710153143.1320521-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: Viktor Ashirov <vashirov@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can call do_tb_phys_invalidate from an iocontext, which has
no per-thread tcg_ctx.  Move this to tb_ctx, which is global.
The actual update still takes place with a lock held, so only
an atomic set is required, not an atomic increment.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/457
Tested-by: Viktor Ashirov <vashirov@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-context.h    |  1 +
 include/tcg/tcg.h         |  3 ---
 accel/tcg/translate-all.c |  8 ++++----
 tcg/region.c              | 14 --------------
 4 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/accel/tcg/tb-context.h b/accel/tcg/tb-context.h
index cc33979113..cac62d9749 100644
--- a/accel/tcg/tb-context.h
+++ b/accel/tcg/tb-context.h
@@ -34,6 +34,7 @@ struct TBContext {
 
     /* statistics */
     unsigned tb_flush_count;
+    unsigned tb_phys_invalidate_count;
 };
 
 extern TBContext tb_ctx;
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index dedb86939a..25dd19d6e1 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -579,8 +579,6 @@ struct TCGContext {
     /* Threshold to flush the translated code buffer.  */
     void *code_gen_highwater;
 
-    size_t tb_phys_invalidate_count;
-
     /* Track which vCPU triggers events */
     CPUState *cpu;                      /* *_trans */
 
@@ -815,7 +813,6 @@ size_t tcg_code_capacity(void);
 
 void tcg_tb_insert(TranslationBlock *tb);
 void tcg_tb_remove(TranslationBlock *tb);
-size_t tcg_tb_phys_invalidate_count(void);
 TranslationBlock *tcg_tb_lookup(uintptr_t tc_ptr);
 void tcg_tb_foreach(GTraverseFunc func, gpointer user_data);
 size_t tcg_nb_tbs(void);
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 57455d8639..4df26de858 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1219,8 +1219,8 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     /* suppress any remaining jumps to this TB */
     tb_jmp_unlink(tb);
 
-    qatomic_set(&tcg_ctx->tb_phys_invalidate_count,
-               tcg_ctx->tb_phys_invalidate_count + 1);
+    qatomic_set(&tb_ctx.tb_phys_invalidate_count,
+                tb_ctx.tb_phys_invalidate_count + 1);
 }
 
 static void tb_phys_invalidate__locked(TranslationBlock *tb)
@@ -2128,8 +2128,8 @@ void dump_exec_info(void)
     qemu_printf("\nStatistics:\n");
     qemu_printf("TB flush count      %u\n",
                 qatomic_read(&tb_ctx.tb_flush_count));
-    qemu_printf("TB invalidate count %zu\n",
-                tcg_tb_phys_invalidate_count());
+    qemu_printf("TB invalidate count %u\n",
+                qatomic_read(&tb_ctx.tb_phys_invalidate_count));
 
     tlb_flush_counts(&flush_full, &flush_part, &flush_elide);
     qemu_printf("TLB full flushes    %zu\n", flush_full);
diff --git a/tcg/region.c b/tcg/region.c
index d3a3658e81..e64c3ea230 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -980,17 +980,3 @@ size_t tcg_code_capacity(void)
 
     return capacity;
 }
-
-size_t tcg_tb_phys_invalidate_count(void)
-{
-    unsigned int n_ctxs = qatomic_read(&tcg_cur_ctxs);
-    unsigned int i;
-    size_t total = 0;
-
-    for (i = 0; i < n_ctxs; i++) {
-        const TCGContext *s = qatomic_read(&tcg_ctxs[i]);
-
-        total += qatomic_read(&s->tb_phys_invalidate_count);
-    }
-    return total;
-}
-- 
2.25.1


