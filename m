Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83E65F5F9F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:30:23 +0200 (CEST)
Received: from localhost ([::1]:54306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHaY-0002Mr-Bc
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIW-0006Bb-2B
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:44 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIT-00070q-7e
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:43 -0400
Received: by mail-pg1-x529.google.com with SMTP id bh13so717596pgb.4
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=fMNzVDjZno1MDGZKBogmjYP5Xb4oEHZ4nbrRSgPIHno=;
 b=kMSfNngl6T80Y7wxEjAeFMYD+mM3xMZc3HqpAxcCGe4D3LFDYdJtuGcONYsSxXSg33
 sezHon3kU4r+wIXklSP8ABec5obpbVvsePk26b1S4CLMMlMci5tZ2bKFNr5xQa509j5f
 rN1xTyGA6dYIuIttXpsANPaNgbtmixDH+AzgjGGD/dDAzC/Usud3AAxkAThU6F/2w+6o
 kAuzqC1BPjK4m2bSGkyrehVmg1VA6j1/psZvpw9Qg6/FP7KdXexrWSdKSJLCwFZp8FV/
 /hNA/TetP9cuIU8CImVkUCylJMZ0RHAyv+R64mxZ1Z6MAjq8OmML0TSwnhKrEoPR+syb
 TTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=fMNzVDjZno1MDGZKBogmjYP5Xb4oEHZ4nbrRSgPIHno=;
 b=PNSpD1iPq4QB2V6RqXqmamifljttcUcWaVVQx2MnxAfye+ayppaWed9bVdj2iCr43z
 2J5TX+5+FLb3Wnw8+QN2j1rSMoLwc5X0Ys2+7rCuYeC5Zq9O+eBYSeZeU4PYTZS+sNem
 x7d5+GBtmjy1E+9mpbqg/NHhEH3vueAYVixLfQOvZLzc5CFW1udkGHIZT/AuK27Y8KRZ
 Seg+XCUP06KjBkzlIXbwARwqWEIOIROfUZly4mLq3GBc0ud4qbNayqQoLcD5ox9ddcqj
 05hAB8Wet06YsfIvi/Nom0PBmOQAxwKX+o77abnbgbbvwahEyikXN8QqfneGuGliIVbN
 0Wnw==
X-Gm-Message-State: ACrzQf1wWAiz/qiiVq5mYKvSSPYY6j8IGQYu0tJmuMJkWSS+onrMEZxO
 5+39NhfqabjF6DueoeNz96qLgjdJB2ivHg==
X-Google-Smtp-Source: AMsMyM6wXCtrCCA9iaVmUsKa3e1sTxVVSfBgkGpcxQcPJL33gCfGjgqNrZpBo4tcQ3kvv8GxiwESHw==
X-Received: by 2002:a05:6a00:a8c:b0:558:991a:6691 with SMTP id
 b12-20020a056a000a8c00b00558991a6691mr2584469pfl.53.1665025899866; 
 Wed, 05 Oct 2022 20:11:39 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 20/24] accel/tcg: Use interval tree for TARGET_PAGE_DATA_SIZE
Date: Wed,  5 Oct 2022 20:11:09 -0700
Message-Id: <20221006031113.1139454-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Continue weaning user-only away from PageDesc.

Use an interval tree to record target data.
Chunk the data, to minimize allocation overhead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h  |   1 -
 accel/tcg/user-exec.c | 110 ++++++++++++++++++++++++++++++++----------
 2 files changed, 85 insertions(+), 26 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 1bd5a02911..8731dc52e2 100644
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
index fb7d6ee9e9..bce3d5f335 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -210,47 +210,107 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
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
+    bool locked;
 
-    if (!ret) {
-        ret = g_malloc0(TARGET_PAGE_DATA_SIZE);
-        p->target_data = ret;
+    page = address & TARGET_PAGE_MASK;
+    region = address & TBD_MASK;
+
+    n = interval_tree_iter_first(&targetdata_root, page, page);
+    if (n) {
+        goto found;
     }
-    return ret;
+
+    /*
+     * See util/interval-tree.c re lockless lookups: no false positives but
+     * there are false negatives.  If we find nothing, retry with the mmap
+     * lock acquired.  We also need the lock for the allocation + insert.
+     */
+    locked = have_mmap_lock();
+    if (!locked) {
+        mmap_lock();
+        n = interval_tree_iter_first(&targetdata_root, page, page);
+        if (n) {
+            mmap_unlock();
+            goto found;
+        }
+    }
+
+    t = g_new0(TargetPageDataNode, 1);
+    n = &t->itree;
+    n->start = region;
+    n->last = region | ~TBD_MASK;
+    interval_tree_insert(n, &targetdata_root);
+    if (!locked) {
+        mmap_unlock();
+    }
+
+ found:
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


