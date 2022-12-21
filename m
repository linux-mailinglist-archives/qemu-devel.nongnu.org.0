Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B21652C4B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 06:09:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7rGI-0002G0-3A; Wed, 21 Dec 2022 00:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rGF-0002Cq-Bk
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:23 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rGD-0003NB-3b
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:23 -0500
Received: by mail-pl1-x631.google.com with SMTP id u7so6248886plq.11
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 21:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zm3VUx9ZkFCce7tlymmqLl3qxTdEEqRkB/7xizKqvmo=;
 b=tkWHZivXMaZlnkTIOslcPloTNoqDHsTTx+chaVuLcW6n9RxRkmTC2a5v6Jg8NQMxFc
 ytdtbtNqOu+wmi/TBO0LzDntJ8hFYCP3C1D0yHbWgaUnBLhkH+LqVjQ88fiQKOJn4Qvw
 fjXzmTiqce1kGqDk8IR2gT/PDXak/9OjzsBVWlnasCRV8wQtQbKth7Fu+iEJXRnQQH4M
 CY6Pz3lyhctduMWL4yk1V3bcB/VJPmr05y5bsckWTMFlgAR997YIwxARxnt8hVMPMh4K
 5/7xQBsMjpDLqEX7SvtJBqusAIAfOWylPigbI+zcjBCjRVZ+qcD0Fzck95l+mt6GpGSY
 Q11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zm3VUx9ZkFCce7tlymmqLl3qxTdEEqRkB/7xizKqvmo=;
 b=sq0BwnVumKDkZ+RQeTyU1UTxcKBGUv/STSoe0OvkrdOoewelz5gmmWLsNf+uwVMvaE
 ImqJL3bN91s36/QpAzKr7EUHXttbUOlS/FP1nfmKi8PPdBmrPHqDyDWqwTy5g3EEzEBU
 FLUMfxOaGY/1kKK6D2OG8g3ZZu2EhR9wZ/GEwwndFULZxYXBv1paD4UsoKBJx6T5Kd2d
 kcpXGjeG+QkxfBcYz24q0uNJP2FXp0mNIMaCGGEz/CcPK3LNhKj9Z7++EMtxkAlb+efe
 j3rNaZa02I6CbVEd4+0O2pxtceiLemzeeMfjtYMLyc48s5BZSVzg5vrAHdBOerQ8AC9C
 6Cdw==
X-Gm-Message-State: AFqh2koMKlxd19c9ss97ERHtr/TJYiLIW5DttSpNWf6oWKFKTbFN2Sm+
 oUXuL4G5EAYjDplClrq2zHCNlHCwfKuOsaVy
X-Google-Smtp-Source: AMrXdXs3v6QWAqTVD9NGnOM/ReAfCTSXtW/FUP5MwbJylixIBvIA0kWtTqA/GbiKI55K8jAqfTIqkw==
X-Received: by 2002:a05:6a20:4d9e:b0:af:91a1:94a0 with SMTP id
 gj30-20020a056a204d9e00b000af91a194a0mr974582pzb.32.1671598999733; 
 Tue, 20 Dec 2022 21:03:19 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a17090a688800b002135e8074b1sm390645pjd.55.2022.12.20.21.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 21:03:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 04/14] accel/tcg: Use interval tree for TARGET_PAGE_DATA_SIZE
Date: Tue, 20 Dec 2022 21:03:03 -0800
Message-Id: <20221221050313.2950701-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221050313.2950701-1-richard.henderson@linaro.org>
References: <20221221050313.2950701-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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


