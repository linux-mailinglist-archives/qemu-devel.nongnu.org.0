Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E9A32A8C7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:06:40 +0100 (CET)
Received: from localhost ([::1]:53848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9Pr-0006M6-HZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:06:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HM-0002WB-LD
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:52 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HK-0007Y6-UL
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:52 -0500
Received: by mail-pf1-x42f.google.com with SMTP id r5so14293109pfh.13
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vXWtOAbqO0IiL4x1PJ+ry/MmusWHvhWYDh4bY00za1s=;
 b=Cc3LBM8V8Ek1Q8YhY1+KbK+WNzMUFUqih7/YcAGAeltZ7/z9FvYcrbWQfwO6dUQZfN
 jHtZKQ5QlvulfDkvpI0EbJ0E2XOtQ9bHuY+YBMNsDIg1u43pF+tpENC/WBWSElCvUUvp
 SKrYx1h3GAv3vJdo3kGuV0T1NaBylSwCD2ZOvzSfBYXKXOSwHlYSUsPi7nuQ1AXHiM47
 F8sEpQItRAWJBaE568lCqvBaeKKF690DAqpkQvWvLuGuIlQsvm2EUILWuWNCqof9aTBv
 o4J99jYnOCwcQ9KfLLEY1DL4qkFA2oyBUCzNw8zjnMRbHQmVrFCUw2wgJelVcEH38PDH
 iODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vXWtOAbqO0IiL4x1PJ+ry/MmusWHvhWYDh4bY00za1s=;
 b=rI/p9u6Z3/5BBXIiP5uA9aiDKHCpFOG8h8QhbwUgxJDoYU/xB/d+ww3Vf9sKendeUJ
 I2wIrbog2+JzOa9s+DmVIWv61XX9M8vCXdBDPAwrCBoB3F3SKAhpKlqb59oni4Rs26Hl
 0LD8m6kWcmZmCQu6qr+cOywVl7/5Y6vfzytu9TbTWZ2VOLGITLdTB2KmTXKa7Kn4wltP
 NFwEFbnJWTo9heCw0Xgvg2a0emcY6EeB6siJxsqO+P+SGW7Z5RSBAkq/vux0Xk//HxYP
 +N1zsQXHZPDkAl5KbE8Y0R6MZG0iWeX2HDzUkM6uUDhx2KoqCcbEP6A1PdWmZM8ZDQPs
 +CvA==
X-Gm-Message-State: AOAM530FIRnisa99wWlW0Is6idKCqgGN5BjPPQfhIjpKD7jTGLUYY4ix
 JgLwUsrY5aHLygYQgMqALx13fT7o6TyP9w==
X-Google-Smtp-Source: ABdhPJz78bsB1cvbHL/p1k2R3jX60hg+l9KVd2mryUQeSRfmXOcyWoJxb7HSD4l/RuTrL8aR3ZIihw==
X-Received: by 2002:a05:6a00:886:b029:1ed:b546:6d1f with SMTP id
 q6-20020a056a000886b02901edb5466d1fmr4363215pfj.22.1614707869514; 
 Tue, 02 Mar 2021 09:57:49 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:57:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/27] tcg: Manage splitwx in tc_ptr_to_region_tree by hand
Date: Tue,  2 Mar 2021 09:57:20 -0800
Message-Id: <20210302175741.1079851-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The use in tcg_tb_lookup is given a random pc that comes from the pc
of a signal handler.  Do not assert that the pointer is already within
the code gen buffer at all, much less the writable mirror of it.

Fixes: db0c51a3803
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index bbe3dcee03..2991112829 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -513,11 +513,21 @@ static void tcg_region_trees_init(void)
     }
 }
 
-static struct tcg_region_tree *tc_ptr_to_region_tree(const void *cp)
+static struct tcg_region_tree *tc_ptr_to_region_tree(const void *p)
 {
-    void *p = tcg_splitwx_to_rw(cp);
     size_t region_idx;
 
+    /*
+     * Like tcg_splitwx_to_rw, with no assert.  The pc may come from
+     * a signal handler over which the caller has no control.
+     */
+    if (!in_code_gen_buffer(p)) {
+        p -= tcg_splitwx_diff;
+        if (!in_code_gen_buffer(p)) {
+            return NULL;
+        }
+    }
+
     if (p < region.start_aligned) {
         region_idx = 0;
     } else {
@@ -536,6 +546,7 @@ void tcg_tb_insert(TranslationBlock *tb)
 {
     struct tcg_region_tree *rt = tc_ptr_to_region_tree(tb->tc.ptr);
 
+    g_assert(rt != NULL);
     qemu_mutex_lock(&rt->lock);
     g_tree_insert(rt->tree, &tb->tc, tb);
     qemu_mutex_unlock(&rt->lock);
@@ -545,6 +556,7 @@ void tcg_tb_remove(TranslationBlock *tb)
 {
     struct tcg_region_tree *rt = tc_ptr_to_region_tree(tb->tc.ptr);
 
+    g_assert(rt != NULL);
     qemu_mutex_lock(&rt->lock);
     g_tree_remove(rt->tree, &tb->tc);
     qemu_mutex_unlock(&rt->lock);
@@ -561,6 +573,10 @@ TranslationBlock *tcg_tb_lookup(uintptr_t tc_ptr)
     TranslationBlock *tb;
     struct tb_tc s = { .ptr = (void *)tc_ptr };
 
+    if (rt == NULL) {
+        return NULL;
+    }
+
     qemu_mutex_lock(&rt->lock);
     tb = g_tree_lookup(rt->tree, &s);
     qemu_mutex_unlock(&rt->lock);
-- 
2.25.1


