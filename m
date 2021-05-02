Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0BB370FEA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:41:10 +0200 (CEST)
Received: from localhost ([::1]:37532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLi1-0000eK-OS
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMg-0008ME-FU
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:06 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMc-0002xR-3m
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:03 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 k3-20020a17090ad083b0290155b934a295so4722326pju.2
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3+qvAys+bC4iB3oxnM72GbfzF+QWmjj72t2D1jOredk=;
 b=CY2E5kuv59LbsNiJJrF75ZkCRfFbMPUDod9g3cXTvJRKW/9vNLZLmhinuWeHrjW96q
 IGSCRlDP12yxLu5VDpJoVTVCSbemuLPxSqHNRx7wUo3SueOToOVFw6oX6T1bIwqky85e
 oKz+BXHJ7qX4IWkC0C3kI6RAfY0hsa405JvzCLT98O0nGni8ePrwdSp+bYjFKUNEZC0K
 GRfl6bWhDpaMDAzy8ZjJC6pmsiwlESRQ/EAQfRAB6M86fZfCGcRyr0oMCH5W4qe7hWbx
 t/M2enqCnaCpo92lpyA+2R+/ohepN1s4Aq/8MHsdFRZNGlZ86SHDxMBo8yvKQs/cnZpT
 F8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3+qvAys+bC4iB3oxnM72GbfzF+QWmjj72t2D1jOredk=;
 b=kf1iJzH7gWbpIYeXzeesswbiA6Gxac/diAATDdSspFE0ndBxL4TYDogGc95TFLx/Gs
 7ZUNVNAq3iDpb4dYcPv4NrGDcwZs8ymMNyshHxcs50nld7NSXhGRPC7zEL8wNVhAWrRM
 3xsK1ZS/tDgV4kKWVRaGw9dOnUVuqCMO/Vu146kCOQ7E/t1xw1wKI5fNhrmUWbtQTN2a
 d7jmvC/GgKMF7VLdcqWLcRt0B7o+b2WrN2rvcCCsnxFiuFZVv0A1AMInWtPOhfWEYOzU
 TDpAE53URbiyVr9k/6s7+QSoJ59zBcfkcNOtfNge3dvPge6dNz4/cAbA3cf7Wk6c8t1X
 051w==
X-Gm-Message-State: AOAM533DmMzJyDnQP4b7M90/tIhtYSGfIFNgPQ7gMLEIuR1Aw2BJaR5z
 wAhmRsIEtbSCeCnAEacLvxkFd6ASk+jgOA==
X-Google-Smtp-Source: ABdhPJzQGuCimNaJZB7KeOQgZH308ZaZ2IPAXf83MFFaw0WiTI0vkXnHclqmCn5St4Bm+yJg2BnZrQ==
X-Received: by 2002:a17:90a:7063:: with SMTP id
 f90mr18815835pjk.95.1619997540677; 
 Sun, 02 May 2021 16:19:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.19.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:19:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/28] tcg: Move in_code_gen_buffer and tests to region.c
Date: Sun,  2 May 2021 16:18:36 -0700
Message-Id: <20210502231844.1977630-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Shortly, the full code_gen_buffer will only be visible
to region.c, so move in_code_gen_buffer out-of-line.

Move the debugging versions of tcg_splitwx_to_{rx,rw}
to region.c as well, so that the compiler gets to see
the implementation of in_code_gen_buffer.

This leaves exactly one use of in_code_gen_buffer outside
of region.c, in cpu_restore_state.  Which, being on the
exception path, is not performance critical.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 11 +----------
 tcg/region.c      | 34 ++++++++++++++++++++++++++++++++++
 tcg/tcg.c         | 23 -----------------------
 3 files changed, 35 insertions(+), 33 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index a0122c0dd3..a19deb529f 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -696,16 +696,7 @@ extern const void *tcg_code_gen_epilogue;
 extern uintptr_t tcg_splitwx_diff;
 extern TCGv_env cpu_env;
 
-static inline bool in_code_gen_buffer(const void *p)
-{
-    const TCGContext *s = &tcg_init_ctx;
-    /*
-     * Much like it is valid to have a pointer to the byte past the
-     * end of an array (so long as you don't dereference it), allow
-     * a pointer to the byte past the end of the code gen buffer.
-     */
-    return (size_t)(p - s->code_gen_buffer) <= s->code_gen_buffer_size;
-}
+bool in_code_gen_buffer(const void *p);
 
 #ifdef CONFIG_DEBUG_TCG
 const void *tcg_splitwx_to_rx(void *rw);
diff --git a/tcg/region.c b/tcg/region.c
index 652f328d2c..893256f9f4 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -68,6 +68,40 @@ static struct tcg_region_state region;
 static void *region_trees;
 static size_t tree_size;
 
+bool in_code_gen_buffer(const void *p)
+{
+    const TCGContext *s = &tcg_init_ctx;
+    /*
+     * Much like it is valid to have a pointer to the byte past the
+     * end of an array (so long as you don't dereference it), allow
+     * a pointer to the byte past the end of the code gen buffer.
+     */
+    return (size_t)(p - s->code_gen_buffer) <= s->code_gen_buffer_size;
+}
+
+#ifdef CONFIG_DEBUG_TCG
+const void *tcg_splitwx_to_rx(void *rw)
+{
+    /* Pass NULL pointers unchanged. */
+    if (rw) {
+        g_assert(in_code_gen_buffer(rw));
+        rw += tcg_splitwx_diff;
+    }
+    return rw;
+}
+
+void *tcg_splitwx_to_rw(const void *rx)
+{
+    /* Pass NULL pointers unchanged. */
+    if (rx) {
+        rx -= tcg_splitwx_diff;
+        /* Assert that we end with a pointer in the rw region. */
+        g_assert(in_code_gen_buffer(rx));
+    }
+    return (void *)rx;
+}
+#endif /* CONFIG_DEBUG_TCG */
+
 /* compare a pointer @ptr and a tb_tc @s */
 static int ptr_cmp_tb_tc(const void *ptr, const struct tb_tc *s)
 {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0926454845..212df31622 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -419,29 +419,6 @@ static const TCGTargetOpDef constraint_sets[] = {
 
 #include "tcg-target.c.inc"
 
-#ifdef CONFIG_DEBUG_TCG
-const void *tcg_splitwx_to_rx(void *rw)
-{
-    /* Pass NULL pointers unchanged. */
-    if (rw) {
-        g_assert(in_code_gen_buffer(rw));
-        rw += tcg_splitwx_diff;
-    }
-    return rw;
-}
-
-void *tcg_splitwx_to_rw(const void *rx)
-{
-    /* Pass NULL pointers unchanged. */
-    if (rx) {
-        rx -= tcg_splitwx_diff;
-        /* Assert that we end with a pointer in the rw region. */
-        g_assert(in_code_gen_buffer(rx));
-    }
-    return (void *)rx;
-}
-#endif /* CONFIG_DEBUG_TCG */
-
 static void alloc_tcg_plugin_context(TCGContext *s)
 {
 #ifdef CONFIG_PLUGIN
-- 
2.25.1


