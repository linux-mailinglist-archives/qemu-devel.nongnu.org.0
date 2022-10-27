Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D052F60F606
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 13:17:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo0pA-0006Zh-8c; Thu, 27 Oct 2022 07:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo0p2-0005QM-Q7
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:13:16 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo0p0-0008Mi-JB
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:13:16 -0400
Received: by mail-pf1-x429.google.com with SMTP id g62so1134451pfb.10
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 04:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N5gJDBJrC0M+T7l6w/7vi7ZpQaw4NHSxWx3wQd1ZGd4=;
 b=m7997IWTIsex9XbqhI2Ow/lnvBJzMOoMFSw0y/AouaCvuxxoTNjXBJVr8OXMaYE61U
 3K42ZWMUH4vsuUrtRBR/7QZoTxjh/56WZDFkvCb+6Jwo4bdQXR/1EpgyHnbxVuFoDAeB
 0ZcFZRfIjIL5pAzlMUUor5CAJuKt0WO5KKspC63r63bguFpn565HifqgGAOrzLYRiOuv
 HOW6VC2YZI2lWV0i7vRjRCSAd7C0poC6hDqnCVp9hAxR1O++HGaps48RQnFfOsRLo1HE
 TkyPr9szSAOtnoS/TcJ2tQWA/79vUOOSduh2/v6xq/fY/0eg9qZu5HCQTDQ+Hk3C6bVh
 JWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N5gJDBJrC0M+T7l6w/7vi7ZpQaw4NHSxWx3wQd1ZGd4=;
 b=6vCBipeHKOZqLFLCCIcSW4alCs6l5YOrQsQMzwCrloLmRssWAsmCFviyUUIWnFmUVG
 V8ET6aCT7zOghtWFFxXQ5JLUWpusOSrxpiloB8TAFGdHJ5thNRNOQlYadbhUIzgrfgQt
 ppTHxpmWjzLT2Ps6PGdeZskzJS3A5FimLycf7tTgecrHKlj6w193N/Blqmce9GduQCU1
 Z9H1XjQbJDr71XtUma/1jXbNmTXNzXdUZBqYd00aVygPTINmkPqjA6afQ0H6VlvJcWC5
 UDmOlA3TUznT0qrI4fS/UYda8iw8i5AzNG73H+VgWeBxe4r8oLzElP1XdEyxpkIsGSlC
 ueJw==
X-Gm-Message-State: ACrzQf3Yrbpqwn/+cqRjoD5qyTi3XSFmAbosrEpFDiaX5QUeP8kWdvQ6
 GPVoOSuYteRhkjW4I3sgEHKf9WL2UPqo/7DH
X-Google-Smtp-Source: AMsMyM78IvxyDR+ycOwDUCuuzen+LRWlqb3c7016glZzGgA/UzCsRBWUletNm3UrogB65WSRIyVRRQ==
X-Received: by 2002:a05:6a00:1482:b0:56c:6a9c:3d7 with SMTP id
 v2-20020a056a00148200b0056c6a9c03d7mr7153166pfu.0.1666869193138; 
 Thu, 27 Oct 2022 04:13:13 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:501a:d301:3a91:9408:3918:55a])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a170902c3c500b00172ea8ff334sm969621plj.7.2022.10.27.04.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 04:13:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v2 3/7] accel/tcg: Use interval tree for TARGET_PAGE_DATA_SIZE
Date: Thu, 27 Oct 2022 22:12:54 +1100
Message-Id: <20221027111258.348196-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027111258.348196-1-richard.henderson@linaro.org>
References: <20221027111258.348196-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Continue weaning user-only away from PageDesc.

Use an interval tree to record target data.
Chunk the data, to minimize allocation overhead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h  |  1 -
 accel/tcg/user-exec.c | 99 ++++++++++++++++++++++++++++++++-----------
 2 files changed, 74 insertions(+), 26 deletions(-)

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


