Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF1833A833
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:29:29 +0100 (CET)
Received: from localhost ([::1]:59510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYIi-0007lp-GM
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYGu-0005vb-7t
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:36 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:43552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYGs-0008AR-HZ
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:35 -0400
Received: by mail-qt1-x830.google.com with SMTP id s2so7857237qtx.10
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EQ+ywpBmHDVC3DOo5FVJf1bXQ/r+fWvVCtSN9ZnyiEg=;
 b=Ragnizp7a27wR/YaHG4/PdoiQ+mi5w+4HE5ob8l33RZkSiGr37ViIpaHQ5NvzIjSG6
 F6PrCuPp+hKKHUVUPKat79k+C64MaPg+OozY9YnJZDBHvY/+QU+Ls2yxvYpzP3eDOvgM
 FpMO99rE7RpaB2Ph3DeMb0jd/bErcGwXttS0itB77/fwberQ2ed/7l2zPMzctXFsgepS
 M8ezJNDK5c0idmWBTSE5G5Mu4FutQQZ7MnSmezjiRReELdBEuCPOfFDjFv4K2lSXhLO3
 KSfFVkV2R12xCej516/VvJZ2QMQp0wa9+aYnuj3e9QLXm9KXHHM4HgZoEtBt3sZLAjli
 43TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EQ+ywpBmHDVC3DOo5FVJf1bXQ/r+fWvVCtSN9ZnyiEg=;
 b=kFkDDzZetF9ftyzulHfBjucOaN4dlU8PzzS+lKs2Q0ZK1j7xvM4PhdjC9T5vW8L1qV
 a3UEv9Sc+nqqR/hOU+HHhErlPAP2IudpgBZHA9v/Lqdw6EBfhcIjJqzKy+jslDpD3ZwA
 XUYSqYRBgGiaYkZyVzdrBXd+fKV20HUpK8/bt+0gfT9F1dK+s7+QRw99+yDJFQV8UNan
 HHquJGJE2wjq90rynROWAxPlNBL0BVn1NECoCaz+3ImboyFM0aCgtM2uPdevnqW4gG0u
 jV5VG0uEg6JklJhILfuCAt21+dbNjxVhacjwSxdGfJYKb1APUBon26hzQf2uhoyvRrLY
 EvaA==
X-Gm-Message-State: AOAM530eOKnl7zGKX8UEHhI2/BSMCLheTpjtQOgNExIbiA9ty5v60C1L
 6I/Vuf6gIsMeMp4wH/EVg1Fer4DNE/jMgb/f
X-Google-Smtp-Source: ABdhPJxCEcMMK2wDFqBYVd6SshfSnopv5/cHp7DD3EIJne0dAsXfTqI3eKq7XDp/6nGEov0H4vdiIw==
X-Received: by 2002:ac8:6892:: with SMTP id m18mr20232105qtq.5.1615757253660; 
 Sun, 14 Mar 2021 14:27:33 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/29] tcg: Split out tcg_region_prologue_set
Date: Sun, 14 Mar 2021 15:27:01 -0600
Message-Id: <20210314212724.1917075-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
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
index 3316a22bde..5b3525d52a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -880,10 +880,26 @@ void tcg_region_init(void)
 
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
@@ -963,10 +979,10 @@ void tcg_register_thread(void)
 
     if (n > 0) {
         alloc_tcg_plugin_context(s);
+        tcg_region_initial_alloc(s);
     }
 
     tcg_ctx = s;
-    tcg_region_initial_alloc(s);
 }
 #endif /* !CONFIG_USER_ONLY */
 
@@ -1206,8 +1222,6 @@ void tcg_prologue_init(TCGContext *s)
 {
     size_t prologue_size;
 
-    /* Put the prologue at the beginning of code_gen_buffer.  */
-    tcg_region_assign(s, 0);
     s->code_ptr = s->code_gen_ptr;
     s->code_buf = s->code_gen_ptr;
     s->data_gen_ptr = NULL;
@@ -1239,14 +1253,7 @@ void tcg_prologue_init(TCGContext *s)
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


