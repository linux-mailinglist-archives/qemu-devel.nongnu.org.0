Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B1564F150
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 19:55:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Fpr-0000NS-Dx; Fri, 16 Dec 2022 13:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fpo-0000LB-Gq
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:28 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fpm-0003FF-Lv
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:28 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so6988837pjs.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 10:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zm3VUx9ZkFCce7tlymmqLl3qxTdEEqRkB/7xizKqvmo=;
 b=RNl3HuWVfYK4hp2dzQ6xaDxpm0ki5H9SjGG0Xzt1nSo2hAt+7v+fda2wkkYx2BoHrq
 nGYVK7uLfeCN6l6xqmG63+xNWWIF5ub6xHcstVLKh60fsajLIgzfr0QwmZBK+TT0cEmI
 q9Un6Q6a1dUTWulmeqS3YgZgdqPo63Xrjv1VFVU9dvPPtgJYhmce+DslagmhaAKconML
 yLQKTj5BobjZyy6BtDwlG+5FZNYiX4gniAwOFqGLeNi79NGdmUn7Mj8pbs3jZNM7FNJo
 Aqwx7l1ogPYbms8+a1vt6N3PiMftuH8ZIv3gBXnDC/nJ5rSd0czHrkIroMZ+sMkGAgMs
 t65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zm3VUx9ZkFCce7tlymmqLl3qxTdEEqRkB/7xizKqvmo=;
 b=GbJFUO7CXL6h0iZMNDeSWQokLw0SXtar4Y+nVhPOuGT8YhBnjM/pmfkans/o7uf33r
 MYquhtjwYsyp0xqhvh1UQCsxGmkQVke0cwRUVcciXbHO9fapDaew1P9GA/QvFl9HbKIX
 EXlkUg08iYyNPQKr+X8WCjsfEl0YgyggSM7agZpOvrxov/QIR43VUfnnxfUT7Fq2AleL
 BtbtszaofOeyJ5fByGdqtYGfSnjPw3ldMqAwisSGcqVRlg7TXNyGXozIxZtaD2F7ffxq
 SNZLLGOyGbWj0Z3E1950W+QvTfUWjXX39xhDCI9MNuqoFaIyBY4F+H16NUs1k035+FFh
 ywRw==
X-Gm-Message-State: ANoB5pmYKhmWdtKZgRJ/9dklxBnfqXsBkN8ExnDsJiVTBDP89f0gMy8x
 oGVpZjzbSMPOMOMcBykoc71oaQWq0zbmJDOT
X-Google-Smtp-Source: AA0mqf4AknqK7gZF73zxKt1cYgmwvaF6MsVxWhpDzcE44I5y9UZkIrkjQYzhhd+nDw3sjdWYy84uFw==
X-Received: by 2002:a05:6a20:8e02:b0:a0:462f:8e3f with SMTP id
 y2-20020a056a208e0200b000a0462f8e3fmr57146917pzj.53.1671216802232; 
 Fri, 16 Dec 2022 10:53:22 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 13-20020a630b0d000000b0046ff3634a78sm1761300pgl.71.2022.12.16.10.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 10:53:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 04/13] accel/tcg: Use interval tree for TARGET_PAGE_DATA_SIZE
Date: Fri, 16 Dec 2022 10:52:56 -0800
Message-Id: <20221216185305.3429913-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216185305.3429913-1-richard.henderson@linaro.org>
References: <20221216185305.3429913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Continue weaning user-only away from PageDesc.

Use an interval tree to record target data.
Chunk the data, to minimize allocation overhead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h  |  1 -
 accel/tcg/user-exec.c | 99 ++++++++++++++++++++++++++++++++-----------
 2 files changed, 74 insertions(+), 26 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index bf1bf62e2a..0f91ee939c 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -26,7 +26,6 @@
 typedef struct PageDesc {
 #ifdef CONFIG_USER_ONLY
     unsigned long flags;
-    void *target_data;
 #else
     QemuSpin lock;
     /* list of TBs intersecting this ram page */
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index fb7d6ee9e9..42a04bdb21 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -210,47 +210,96 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
     return addr;
 }
 
+#ifdef TARGET_PAGE_DATA_SIZE
+/*
+ * Allocate chunks of target data together.  For the only current user,
+ * if we allocate one hunk per page, we have overhead of 40/128 or 40%.
+ * Therefore, allocate memory for 64 pages at a time for overhead < 1%.
+ */
+#define TPD_PAGES  64
+#define TBD_MASK   (TARGET_PAGE_MASK * TPD_PAGES)
+
+typedef struct TargetPageDataNode {
+    IntervalTreeNode itree;
+    char data[TPD_PAGES][TARGET_PAGE_DATA_SIZE] __attribute__((aligned));
+} TargetPageDataNode;
+
+static IntervalTreeRoot targetdata_root;
+
 void page_reset_target_data(target_ulong start, target_ulong end)
 {
-#ifdef TARGET_PAGE_DATA_SIZE
-    target_ulong addr, len;
+    IntervalTreeNode *n, *next;
+    target_ulong last;
 
-    /*
-     * This function should never be called with addresses outside the
-     * guest address space.  If this assert fires, it probably indicates
-     * a missing call to h2g_valid.
-     */
-    assert(end - 1 <= GUEST_ADDR_MAX);
-    assert(start < end);
     assert_memory_lock();
 
     start = start & TARGET_PAGE_MASK;
-    end = TARGET_PAGE_ALIGN(end);
+    last = TARGET_PAGE_ALIGN(end) - 1;
 
-    for (addr = start, len = end - start;
-         len != 0;
-         len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
-        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
+    for (n = interval_tree_iter_first(&targetdata_root, start, last),
+         next = n ? interval_tree_iter_next(n, start, last) : NULL;
+         n != NULL;
+         n = next,
+         next = next ? interval_tree_iter_next(n, start, last) : NULL) {
+        target_ulong n_start, n_last, p_ofs, p_len;
+        TargetPageDataNode *t;
 
-        g_free(p->target_data);
-        p->target_data = NULL;
+        if (n->start >= start && n->last <= last) {
+            interval_tree_remove(n, &targetdata_root);
+            g_free(n);
+            continue;
+        }
+
+        if (n->start < start) {
+            n_start = start;
+            p_ofs = (start - n->start) >> TARGET_PAGE_BITS;
+        } else {
+            n_start = n->start;
+            p_ofs = 0;
+        }
+        n_last = MIN(last, n->last);
+        p_len = (n_last + 1 - n_start) >> TARGET_PAGE_BITS;
+
+        t = container_of(n, TargetPageDataNode, itree);
+        memset(t->data[p_ofs], 0, p_len * TARGET_PAGE_DATA_SIZE);
     }
-#endif
 }
 
-#ifdef TARGET_PAGE_DATA_SIZE
 void *page_get_target_data(target_ulong address)
 {
-    PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
-    void *ret = p->target_data;
+    IntervalTreeNode *n;
+    TargetPageDataNode *t;
+    target_ulong page, region;
 
-    if (!ret) {
-        ret = g_malloc0(TARGET_PAGE_DATA_SIZE);
-        p->target_data = ret;
+    page = address & TARGET_PAGE_MASK;
+    region = address & TBD_MASK;
+
+    n = interval_tree_iter_first(&targetdata_root, page, page);
+    if (!n) {
+        /*
+         * See util/interval-tree.c re lockless lookups: no false positives
+         * but there are false negatives.  If we find nothing, retry with
+         * the mmap lock acquired.  We also need the lock for the
+         * allocation + insert.
+         */
+        mmap_lock();
+        n = interval_tree_iter_first(&targetdata_root, page, page);
+        if (!n) {
+            t = g_new0(TargetPageDataNode, 1);
+            n = &t->itree;
+            n->start = region;
+            n->last = region | ~TBD_MASK;
+            interval_tree_insert(n, &targetdata_root);
+        }
+        mmap_unlock();
     }
-    return ret;
+
+    t = container_of(n, TargetPageDataNode, itree);
+    return t->data[(page - region) >> TARGET_PAGE_BITS];
 }
-#endif
+#else
+void page_reset_target_data(target_ulong start, target_ulong end) { }
+#endif /* TARGET_PAGE_DATA_SIZE */
 
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
-- 
2.34.1


