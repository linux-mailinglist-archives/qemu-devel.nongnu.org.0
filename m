Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C59370FBC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:23:54 +0200 (CEST)
Received: from localhost ([::1]:43502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLRK-00058M-17
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMT-0008Ce-NP
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:53 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:40792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMR-0002s6-Us
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:53 -0400
Received: by mail-pl1-x62a.google.com with SMTP id n16so1776630plf.7
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sBQ1+Rv2XXbszZHsJR/EueMHmCKRSaUBKr3RPrTCguk=;
 b=LgNwLPFpZXkaGbqqFIqx9umW9JFiw78WHudW/YgDnQ/Z1YAF0w/plfuM5Q0kxFmvXm
 5diRYWQnjGozoWHRD8gjbMFgG/IDsVpoUM/v1j0wJRKcAraswy6u3IiWHhTROZIB1ZwK
 O8DFvS9+P3uvdrl+1/t4s11lPvFas0kd0tHTggUZE9sk+/WuHO8/5oLd4Z92GEo58W1a
 4S1Dq/uhB4u4B8lMYNT7DKKof85y3fL9SrVSWIhUpxM0WVQGhYtip3CV763K/FjaLM/C
 SM91exRRxiWdBCKpXprb6+QBI9WEv/gVIvLwS99YV6suoscxORmeNZ+lvfM5g8b0F9Qu
 IZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sBQ1+Rv2XXbszZHsJR/EueMHmCKRSaUBKr3RPrTCguk=;
 b=AG4Qddkkxc+XRCMCIAYn0ujyN6szc0n8wDzF5JwVjJpUG0AlPzLexq603SBsQOnSFB
 OzFWLOUSBnguG422FkFIxGQuj3O+MvZMsBzyVXM6qpLQloEBU4T8czwisRNaxKxzTtLj
 +qQJE/YnqbsfHt6xFAYY56B2IAeDYhvDZY33vr0jX3z+nPmRe4ecAIWKDDPqZCVgyGOv
 rt+oIErese6esjW8o12VuzJd7f4gBFuTtiy7nBoIWaH+paZ+2vQUZhYqKw8AHJhJskb3
 ttlePGcD0v4PqdETI4NVU5kJaa3nVWotsKbpSPFklRwu7eaT9wBSpdFj2AmfNA9qGZjQ
 LSbA==
X-Gm-Message-State: AOAM533La4px0cYMugsmjhLfNcKbY+wH0sYivQ29xssHReDZYeym0Ow7
 bgU5O/AjHCwzsGknxlnStUoHGublczteLg==
X-Google-Smtp-Source: ABdhPJy40L0dtq7oAaNOYC2Z/i+tG/0dwdNFopDnm41jaDElNF1+fyrHLZ0IbR1ID1nBCEbkyvj7/A==
X-Received: by 2002:a17:90b:347:: with SMTP id
 fh7mr18204681pjb.23.1619997530725; 
 Sun, 02 May 2021 16:18:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/28] tcg: Split out tcg_region_prologue_set
Date: Sun,  2 May 2021 16:18:22 -0700
Message-Id: <20210502231844.1977630-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This has only one user, but will make more sense after some
code motion.

Always leave the tcg_init_ctx initialized to the first region,
in preparation for tcg_prologue_init().  This also requires
that we don't re-allocate the region for the first cpu, lest
we hit the assertion for total number of regions allocated .

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index df78c89673..ee3319e163 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -885,10 +885,26 @@ void tcg_region_init(void)
 
     tcg_region_trees_init();
 
-    /* In user-mode we support only one ctx, so do the initial allocation now */
-#ifdef CONFIG_USER_ONLY
-    tcg_region_initial_alloc__locked(tcg_ctx);
-#endif
+    /*
+     * Leave the initial context initialized to the first region.
+     * This will be the context into which we generate the prologue.
+     * It is also the only context for CONFIG_USER_ONLY.
+     */
+    tcg_region_initial_alloc__locked(&tcg_init_ctx);
+}
+
+static void tcg_region_prologue_set(TCGContext *s)
+{
+    /* Deduct the prologue from the first region.  */
+    g_assert(region.start == s->code_gen_buffer);
+    region.start = s->code_ptr;
+
+    /* Recompute boundaries of the first region. */
+    tcg_region_assign(s, 0);
+
+    /* Register the balance of the buffer with gdb. */
+    tcg_register_jit(tcg_splitwx_to_rx(region.start),
+                     region.end - region.start);
 }
 
 #ifdef CONFIG_DEBUG_TCG
@@ -968,10 +984,10 @@ void tcg_register_thread(void)
 
     if (n > 0) {
         alloc_tcg_plugin_context(s);
+        tcg_region_initial_alloc(s);
     }
 
     tcg_ctx = s;
-    tcg_region_initial_alloc(s);
 }
 #endif /* !CONFIG_USER_ONLY */
 
@@ -1211,8 +1227,6 @@ void tcg_prologue_init(TCGContext *s)
 {
     size_t prologue_size;
 
-    /* Put the prologue at the beginning of code_gen_buffer.  */
-    tcg_region_assign(s, 0);
     s->code_ptr = s->code_gen_ptr;
     s->code_buf = s->code_gen_ptr;
     s->data_gen_ptr = NULL;
@@ -1244,14 +1258,7 @@ void tcg_prologue_init(TCGContext *s)
                         (uintptr_t)s->code_buf, prologue_size);
 #endif
 
-    /* Deduct the prologue from the first region.  */
-    region.start = s->code_ptr;
-
-    /* Recompute boundaries of the first region. */
-    tcg_region_assign(s, 0);
-
-    tcg_register_jit(tcg_splitwx_to_rx(region.start),
-                     region.end - region.start);
+    tcg_region_prologue_set(s);
 
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {
-- 
2.25.1


