Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05693A4B62
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:47:40 +0200 (CEST)
Received: from localhost ([::1]:35602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqsF-0004dL-TQ
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqme-0002Lj-04
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:52 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmc-0002Zu-6n
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:51 -0400
Received: by mail-pg1-x529.google.com with SMTP id t17so3679517pga.5
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UGCE0hBuujlu+HiYuNrthLkWxka9AZtIh3/7kEDtjdA=;
 b=i1NngS7b7TVu0uaIggAkqclZ4+BbnJ1A3bvlRY5SD+J8SE5JgHNndSGA/RqZ9ZvSwa
 4uke/wDxu1SAHz77wxLCf/ysnwQ4PLcTrHmaYxkYEMINfxtMom5ASUJlw+GgWc0Yd8Jo
 iOJs9BNVCdF5f1MFGWeWsCKzFeVmKBHumQSuE52Icl3KSHVtwDsw/f2tqfyDlSbjV2sk
 1aFGkIoVRwVFugX+8OF6E66ts6m6NfdcUG5eO7WYpMHSAp2qltK3uqPd270+7tdNYHpG
 Vhdg0vBsH+2ef9YJBZNX/cDM7PK2ayA20+RTO4Pg75N8a9iIb7fvkY1E3tK51UkGZ/yP
 u4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UGCE0hBuujlu+HiYuNrthLkWxka9AZtIh3/7kEDtjdA=;
 b=XjTlnxCuYJoJM1iaPuvG+EQmd+Qlm1u3Y3PDrsOnFgc8gU43EDvUwAaHUhzxQzpC8G
 INxZfRDDFeGygfZhCAm10tbbB/mT8o+8SWEuAwr/CUs0vVcd00c/RvyBpltDcRKHXc5R
 OBD437658PhTzPgdpakwS959nJiMHlAiXVYEAFeXylpigKH/rCh+kK+//cTUUn3EwkWP
 5AMAzhcgBUBLK7nTKADPIMy1DQWV2OmZo7TyddQVThd4MAo1HVvuGR5hS6D8m3TiUVE9
 h1XBC9j2WrEim3TxNwIBQ1yI156kJbyh3KDYVUuOOQjmxqlEIzP5X3FrVQ/XjNxvAqsQ
 JSlA==
X-Gm-Message-State: AOAM531YADv5NM70H7YnmY1dxcsJ8B4djVPsCBBXXMJDrLJGsZURvdkr
 MJZ1uuZv+SH0SzWsANFDyt8axEW0PEGmww==
X-Google-Smtp-Source: ABdhPJwLAwrxIaqvPEceWX9ZrW/32GQJA6KBY13q5+Vb8a+oHuTO3JWrwXmzFMISxZzGneaZBxetrA==
X-Received: by 2002:a63:e0e:: with SMTP id d14mr5877297pgl.426.1623454909009; 
 Fri, 11 Jun 2021 16:41:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/34] tcg: Split out tcg_region_prologue_set
Date: Fri, 11 Jun 2021 16:41:16 -0700
Message-Id: <20210611234144.653682-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

This has only one user, but will make more sense after some
code motion.

Always leave the tcg_init_ctx initialized to the first region,
in preparation for tcg_prologue_init().  This also requires
that we don't re-allocate the region for the first cpu, lest
we hit the assertion for total number of regions allocated .

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 36ea21d596..eca72990c1 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -882,10 +882,26 @@ void tcg_region_init(void)
 
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
@@ -965,10 +981,10 @@ void tcg_register_thread(void)
 
     if (n > 0) {
         alloc_tcg_plugin_context(s);
+        tcg_region_initial_alloc(s);
     }
 
     tcg_ctx = s;
-    tcg_region_initial_alloc(s);
 }
 #endif /* !CONFIG_USER_ONLY */
 
@@ -1208,8 +1224,6 @@ void tcg_prologue_init(TCGContext *s)
 {
     size_t prologue_size;
 
-    /* Put the prologue at the beginning of code_gen_buffer.  */
-    tcg_region_assign(s, 0);
     s->code_ptr = s->code_gen_ptr;
     s->code_buf = s->code_gen_ptr;
     s->data_gen_ptr = NULL;
@@ -1241,14 +1255,7 @@ void tcg_prologue_init(TCGContext *s)
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


