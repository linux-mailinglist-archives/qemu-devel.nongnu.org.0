Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF7132FD8F
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:39:54 +0100 (CET)
Received: from localhost ([::1]:59376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIeeP-0003cn-HC
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:39:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeb9-0006y7-AP
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:32 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeb1-0002x1-0l
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:31 -0500
Received: by mail-pg1-x533.google.com with SMTP id o10so3810024pgg.4
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vXWtOAbqO0IiL4x1PJ+ry/MmusWHvhWYDh4bY00za1s=;
 b=kpd50IbpVc4XoNRRhBIyqS/ZxPYamEXvdvmIBrR7iaiaguawXE8gkB9DbAyDD452Pe
 SkZeMyfrUG/WsMrjrbqIXkP4X++oG+YpBDQQwSU4WZeztZ3TN3c/EcX0ADCulcRXVoBJ
 fpYL7yzbnUhzjunklXCNcTkaJCESSZNvqH7OayK8EQ/4kkWvS9NV/1EANyAdtHbqNck5
 Jtf6xfouVN4flotOUlGj89sCpTDpeaHs1HMSs9mypgLelSGU7od9AIMa8fFr3jAxohke
 jm7Z0zsvMbLCm+4GRZGJSf7azKQm/UMY6Xz44Fhea4QLNn/xW+KvjnFmnf9lbDvcu6jC
 K5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vXWtOAbqO0IiL4x1PJ+ry/MmusWHvhWYDh4bY00za1s=;
 b=nnvCb0eL3SyZ3LcChGu9hK+yjoqPDQu5Ylt05tN9vPgcNZtFAv0d6RQRL56UCrWWu/
 cQb+Ll1OjjhgSPohSU7pSzN47y49RHHjOjE8KMf8aYgga6HeHB5r9Qkf8UdMxMNTMH2f
 8LmtkiNKv7r0BtuBdCia1s4ebB+TYU6+75Umjx1T6gpyS2Hnv4AWbjCZxD8Xgj9MjVGD
 WVfUGZo2S3CnVogcWSS7c73nY53BlVDD8lfCeJ4OnDjZaAfVKE0sS6d9mC12fx9325X9
 wN8kdmb5CKe/WfOidQGfdPEOI7nqqgLdMxNKHPAlbXi68yP9HFe7DEc6WBjnkVtt5/fW
 vxMw==
X-Gm-Message-State: AOAM5335jP97+a51cT+tUr040IRvH0uCE6ak6k3TC86xIDlXAn+YxwwK
 nmhRgLS0bAyTulM0Htp4ffhQxvaiAAyLdA==
X-Google-Smtp-Source: ABdhPJw3Z9Fh4AkGvq3z0vg2Zj7mf4fR8+AoOn+laMBhI974PBxWodHAm0MEXmnELsSM2hHrixc6Dw==
X-Received: by 2002:a63:4e26:: with SMTP id c38mr14266789pgb.81.1615066581606; 
 Sat, 06 Mar 2021 13:36:21 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/27] tcg: Manage splitwx in tc_ptr_to_region_tree by hand
Date: Sat,  6 Mar 2021 13:35:52 -0800
Message-Id: <20210306213613.85168-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: peter.maydell@linaro.org
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


