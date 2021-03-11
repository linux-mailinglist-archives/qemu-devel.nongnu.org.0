Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0D6336899
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:28:45 +0100 (CET)
Received: from localhost ([::1]:44148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9C0-0004rU-6K
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95g-0004f2-6x
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:12 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:37814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95d-0001Kq-Q0
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:11 -0500
Received: by mail-ot1-x32a.google.com with SMTP id 75so15057185otn.4
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EQ+ywpBmHDVC3DOo5FVJf1bXQ/r+fWvVCtSN9ZnyiEg=;
 b=tePEB/mK+us80Wh9mMSDL3XT+XJRgWOfeEJJypJALP+x1v2Y8Ud3ZYR7leRakdYBNw
 wUpgI6CnSDz8R04T3HrFIHLcXgwXUOaKSZLsfFof/Q8q54rBxxJvm0bhhQ1JZ3C1/J29
 3k6PBbXnnpCQBxqVEudbiJ1o2CgFPMF6BnGSzdsOMTgcXfy5qmOTAVEWJJVIyih8coer
 zk+0nLbdMuaduOf0oQ+3ZFL6Ji2vp8KD5zrER48I6Iy/bqmREP00hGGfgHZfQ61Cpm2V
 9V9VGHyUGJfhCvT2BV97REQx/GLbgIwR9P82LcCB+jqFvQMNFWididdRnTRcgmO3NGAF
 Yu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EQ+ywpBmHDVC3DOo5FVJf1bXQ/r+fWvVCtSN9ZnyiEg=;
 b=Ke1nIOx8+jom4zuNAQszP2huMTxXFKUEdw8aIkx6X+kiut6Pe291fpMgx4eZVNtI+Z
 Kdv/V6kV+xofRqiCWWHc5VJsCqDXQ85z5Loc4YDUYZxV3W4cnTrTzIe69qrZv4GMjrrN
 FcrK/wcZrNlhTJAc4QuMREnUrtq4CAOLZiuep2dXKgPswfeDSJFXI/IEO6EpiSj31eUG
 6BkaVhlRJuX/1REEMxYVIK0b6Q/ltGuD8A1rrMkEJC9/Q/9OInbdwVYjWdsK9OAte+oq
 6VsbWXhIcIGp/Tpfl8KBAj539Wkz21F2GQYHa4hAAWogWhH1ap2Bdsjo4Bp0ErvjsLcv
 fk4A==
X-Gm-Message-State: AOAM532wfuA0BstI98kGta0pmhRlJFlD5h9k43o48ZCRMq9oTEL+ebEg
 swpA4qbMufHcgsh9dlNfsJW9+QBUp23quRsG
X-Google-Smtp-Source: ABdhPJzPI/rDWnfzZodkxGNlMFK/oy6ai6SMDdVcD546IIDzHQMKr+RAlMtFiTK430Hpt861S08hWQ==
X-Received: by 2002:a05:6830:1c6e:: with SMTP id
 s14mr4775576otg.17.1615422128128; 
 Wed, 10 Mar 2021 16:22:08 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/26] tcg: Split out tcg_region_prologue_set
Date: Wed, 10 Mar 2021 18:21:37 -0600
Message-Id: <20210311002156.253711-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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


