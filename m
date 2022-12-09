Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9882647D34
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 06:21:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3VnG-0004eU-G3; Fri, 09 Dec 2022 00:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3VnD-0004dc-Ku
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 00:19:27 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3VnA-0008M1-TW
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 00:19:27 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 x44-20020a05683040ac00b006707c74330eso21322ott.10
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 21:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7bxOdRfbcz2IkflzlmPEpI9OdICmn7oATfVNnCrpRBc=;
 b=yBXKBPZkemKMFB+74uILyq11Q/T9jD6kdentWtM8rVwiJ5obsjKTeX6RZDyH9VfHeR
 rBY00QLtSVpc58/0yYF3nRzs93FaeQ5/diEAFml2U/KYZvXH4LFpi2GW7KJ3CdYXZfBP
 Q/v0dzrlb8eiKbL9lv39Xp0+PTDHySrvCTKrZRmaZjpIqCsscaeG2CHt76W/6CHnecJE
 55tGFaTk9CqmxhhTyZ1xRtC4cDrDvqzq4HA8ZEAWPYHdiLzsB9tE5a2JjV2h6JUIy39t
 VYWeX4Qt0rmLwt6AxBVcYUCD/BDfpYaDmk/2PBdjZ4ucCICsLYubwkxk3scqzxYzMBet
 xvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7bxOdRfbcz2IkflzlmPEpI9OdICmn7oATfVNnCrpRBc=;
 b=xHrdfGX2XA5SwTydk/yW3buvuE/bFMCbsMUS9Zoxh1/rXO226PlSgeUuQsCX7UWrGX
 orbgicjmJApyDqFCr18gMNNNtGX/XTxXWVayDj3OJQ6UtqvEAavSV9GK79jjx+CZnJhU
 SWlpmFJYQ5RyyzyLp9/NU4ew+0SsgwKV9+rnTDZIuPoP2D0YEkh0Kb8PBwMrvR7yJmNi
 i63DePn4mlTYpfT+inZmcJd8utwxGsdnUG6zEHKrvkA29TYC565UxUBg5oZkjhUK7S3V
 IheAB7FCtb1+aQEmb7ukm/ik30KMVV4h2ZhSIdW0FQjjLzm//PeBPjL/4KE7eawfGXPj
 BmYA==
X-Gm-Message-State: ANoB5pmYzd0mYdlK8oNYgh4MxIsARxFqPiEbS7XmbaBS14+phpMS7Fxy
 ce9ViCVePojw2QP/4E4gWKfqgJEzHOjJihJcFRI=
X-Google-Smtp-Source: AA0mqf4IFhIgmUc3UQvlHqqbLLuJaGSc3mBMBndS0ObClBghPqvzjeNmmxdY7hVikQK9M/bkV9qHvA==
X-Received: by 2002:a05:6830:549:b0:670:5c2a:a369 with SMTP id
 l9-20020a056830054900b006705c2aa369mr2628027otb.19.1670563163669; 
 Thu, 08 Dec 2022 21:19:23 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:95e5:48b1:fe60:b74c])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a056830244f00b00661b46cc26bsm224657otr.9.2022.12.08.21.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 21:19:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v3 4/8] accel/tcg: Use interval tree for TARGET_PAGE_DATA_SIZE
Date: Thu,  8 Dec 2022 23:19:10 -0600
Message-Id: <20221209051914.398215-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209051914.398215-1-richard.henderson@linaro.org>
References: <20221209051914.398215-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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


