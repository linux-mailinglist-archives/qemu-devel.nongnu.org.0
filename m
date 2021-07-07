Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5997C3BE1AC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 05:56:31 +0200 (CEST)
Received: from localhost ([::1]:42976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0yfl-0001XH-WD
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 23:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0yev-0000sA-DS
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 23:55:37 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0yet-00015f-FS
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 23:55:37 -0400
Received: by mail-pf1-x429.google.com with SMTP id y4so942158pfi.9
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 20:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M39PQLdTWbuy4ej+V7GbsRnZ+hcJud211Lz4sWsGrtA=;
 b=nzdkGjYkRrpSlrrTxUXRlRGhu+z0S8E0/vAMwSr5CHXgrWN1mpluHdNd8jh0ZWlTlf
 TZY0w4rUoTHFkSeuePGfi4gLZtlbj4YPaooJQvv+dwML8mH54juvT+lHwaYRNQ+jTHoM
 e/rBxYB06iPfHItFn9txydtxhNKgaVqwnKQg4arVnpOrwYqQ4+vICnri2oimjVnZdJc3
 iNAieQYtJqFihjsMq71w16q1isKUcXbE+DyBcS/KrZ/JlBX5sr99CluUwqug46024IyB
 ZnEgPhzgiT/17cbcxc83VKEaNPDi27pMa9ZRy9Obbb5wRbNFTUSrsvTDhyKjcdX0V1Tc
 KhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M39PQLdTWbuy4ej+V7GbsRnZ+hcJud211Lz4sWsGrtA=;
 b=HZBLH+YnPOC2nN+SDP+pceOXQ18aYGBN7WMT7pyRDQnJVxsBzHA4orfZ2NfBXrNVnq
 BENIjsaRZXO5tKZsCHYnIvHSVwo8a9qVDhZm1//knvd7XEyfHgwDP9edZprDvJQYp2lj
 ZbSIjZ75WkQMHnYWnxdTOPd1nxasZsGGzHLH1GNSoh5XRIOn68acx4dimIB+QED48K1C
 sQ9bnidpvZENACblQ1Mb0txg/dp2jVGTe2/F/UY73cIIV+uaLzYjjOLQ/WY/frTBsT+y
 TJslLPRhnxmJwqAEXrftw66J+OTgH1I895HTQ2p4kZCszgfN7Y/r5m9otDoyacYdV9+j
 a2Mg==
X-Gm-Message-State: AOAM531h8yV/l57txsrJhXq/5F5O6ip0Zpixk3y47HAH0KM4Eu/F4xwt
 Sy1apZGsiTmwZk02Qot2NOIkJvJRq+XAzw==
X-Google-Smtp-Source: ABdhPJyXmb469KHLKoWQALlTw6qOMZBDLgxqFP5Jl9gI3DOW7nRqrJHGYMmgnvsG8/gE+nMTEi2coQ==
X-Received: by 2002:a65:62d3:: with SMTP id m19mr24450886pgv.225.1625630133157; 
 Tue, 06 Jul 2021 20:55:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id q13sm12840403pjj.36.2021.07.06.20.55.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 20:55:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Move tb_phys_invalidate_count to tb_ctx (#457)
Date: Tue,  6 Jul 2021 20:55:32 -0700
Message-Id: <20210707035532.421820-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can call do_tb_phys_invalidate from an iocontext, which has
no per-thread tcg_ctx.  Move this to tb_ctx, which is global.
The actual update still takes place with a lock held, so only
an atomic set is required, not an atomic increment.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/457
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


