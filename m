Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE36C33A842
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:37:04 +0100 (CET)
Received: from localhost ([::1]:51614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYQ3-0007wS-LE
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH9-0006DI-UZ
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:51 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:39184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH7-0008GZ-Tw
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:51 -0400
Received: by mail-qk1-x735.google.com with SMTP id g185so29901634qkf.6
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R00g9ZT+DJOPXUc3gA2QBcnKHFBUn5tI+Lb3fkrnwOQ=;
 b=tcLx2D+tAV0YN0uVdnNouyBX0515LSM0jCunsUStY2Rv/JmyybskjxmMWpMj5Lb2QY
 H6zfxnZ+FpYk7fjSAM6oVRNi4jUStpHcof8Sc0bkXq7AdTPlQfa/0PgNXHzgpuAJ1Xft
 rc5b7lmi7Cw7vSrdqckIa08VVrkXpIShiSH3t4bHGgBU5cPJ3dlls/bJC7wh9ghluRNd
 7Pl6OKTmrCU+yqLJ3/uKUzqJPZwLFEUvo3USq+Orq8OcBy7JSF+i55GKFLDsLeKElK44
 3MCqCuBRqSp62dr2c8Zmgp8v7rkS3r+V6mmByNo/NubCDf/4tiKG/zg9HZrde5DkBQ2f
 inVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R00g9ZT+DJOPXUc3gA2QBcnKHFBUn5tI+Lb3fkrnwOQ=;
 b=KrPBLGgAtFS+mdiaCRItnug2504gYM31BMnI+TTxeevpdBjlPvuKAO28sjNApWCOkA
 tFAg9hCobXryA/+4orA2A4nKwcvpmfL8F+QUhBdQZD2FPJxEexwiFCeysW/KT79oRhfd
 7pVb4eHYdQjcQlTxL6CNMcSrE1/92zNvv/LJQoicDdDvpCORAe6vwv2IrCtlAEbndmqT
 OOnxx2XrHDC2et8iBwCmQYcJNKBH9GnynHixz4UModrOZs9MXTPW8Xx/0VgK4zVDVTo6
 ljll24gAJEKm8PrPnfY3U0pR1mNcqvSj0txO9Vj0ggcH9qSonYCpKddZsRG7LshA8p8d
 K0VQ==
X-Gm-Message-State: AOAM532ylmz7NwCRqx87eHDe+zGgk4KAu0PTfBy1PVwm4bb8ZY3+KnVa
 Ic4/O+SrOwjEAOaGBN6PBZeFasEb7ng0MXMG
X-Google-Smtp-Source: ABdhPJwGzHFcHDjINUA/di0CZ+SbL5n3/+UZXqfIekOd4I8JkKaG7PW0jJg9fxmKMDDZnKrSUPRBYw==
X-Received: by 2002:a05:620a:14ae:: with SMTP id
 x14mr22275820qkj.237.1615757269013; 
 Sun, 14 Mar 2021 14:27:49 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/29] tcg: Move in_code_gen_buffer and tests to region.c
Date: Sun, 14 Mar 2021 15:27:15 -0600
Message-Id: <20210314212724.1917075-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
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
index 45c1178815..bf4167e467 100644
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
index a82d3a0861..65f9cf01d5 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -416,29 +416,6 @@ static const TCGTargetOpDef constraint_sets[] = {
 
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


