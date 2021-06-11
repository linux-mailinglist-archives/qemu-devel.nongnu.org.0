Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8573A4B95
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 02:03:50 +0200 (CEST)
Received: from localhost ([::1]:54830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrr7t-00033S-CG
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 20:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmo-0002se-9t
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:02 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:50861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqml-0002iv-IC
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:02 -0400
Received: by mail-pj1-x1032.google.com with SMTP id g4so6555196pjk.0
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1l+8M2L0wM1oDKnQt56uL3Y/0V+moZ9SU9/ZN2FXsyc=;
 b=LpqQjzRDOp/KwKC7cR3el/L2ynR/z99L+eZO8A+EjkXKAwElngsq+IWbBwbYkY5kYX
 TL7wBkGUBz1d7CVHKdrIzBAfKYYEkEt0HSiph23n23POaxPSzR/cStEuqR7v/K7to9CV
 u0ICT3KNyMSxCU5rojczg4ApxhCyclf/eEuA4ENAnw+s7PAZNq7Qja9SHyCtMRqJzzv5
 BNh9X273ldSMvCVmzr/Bg0/lObwn5N7nJagIPZ3R/W1zbF9NjmZC0ev2SpDJI6gBiQTy
 6QAFWan0Y+iQuOpdKuYITS2rxlshzkWx3SHfvGnAGSyHmUhtWb0KPhMmMm66fKqRNIwx
 iiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1l+8M2L0wM1oDKnQt56uL3Y/0V+moZ9SU9/ZN2FXsyc=;
 b=Dvub7SQnDHvqUr9sre3fCGwKXj7oq9pFwoTFbKaDpcpECB1HkiJsM3fRN434GruE/n
 8aKpNf5I+2gt2EWW8XBo0LCs+92yeiSM6WRiIuFxLTMeJDxx4z13ywLtZ1PnlsOQQ0y/
 LCavCsekhIEYQBovvfNZMrPHKmWb/NZXeAw4gKrVhEqKxRhEHQitTbuwfKnfArWHcVyn
 t+E3Um58IFK4pUjPKyHqBEjlfn9gsSAu/FmLQ1IdvSj7MuqNV2kFWZgtrunKar3dC1X9
 +gsrf2MAgG8pcbLLEKo+lxuP40/i7W5B0sf3NCpqxbWrwqT7r3DJMXBUzdxiIBobvot/
 28pg==
X-Gm-Message-State: AOAM530AKNkwLIx32qyEiVMo6f6Df5Yzt43Vc+y9Ao6VA4xdgDKW35/z
 b2qaElmadMkM7OqcGRKxEqfVXRjsrRRttg==
X-Google-Smtp-Source: ABdhPJzuGol4r16wLm2vFJ4PLE6VdntTdMaen2VZgJaC1in4crs8tAFrgTukWjGuriDwu+WIvdOE7w==
X-Received: by 2002:a17:90a:c8b:: with SMTP id
 v11mr11148113pja.114.1623454918187; 
 Fri, 11 Jun 2021 16:41:58 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/34] tcg: Move in_code_gen_buffer and tests to region.c
Date: Fri, 11 Jun 2021 16:41:31 -0700
Message-Id: <20210611234144.653682-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 11 +----------
 tcg/region.c      | 34 ++++++++++++++++++++++++++++++++++
 tcg/tcg.c         | 23 -----------------------
 3 files changed, 35 insertions(+), 33 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 2316a64139..f48b5aa166 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -695,16 +695,7 @@ extern const void *tcg_code_gen_epilogue;
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
index 445a278702..5beba41412 100644
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
index 9880d5205e..4bb35b455b 100644
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


