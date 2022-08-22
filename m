Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEF959CC2F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:27:31 +0200 (CEST)
Received: from localhost ([::1]:50358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGpO-0003df-3T
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlp-0005d0-91
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:23:50 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:54838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlj-0005am-L6
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:23:45 -0400
Received: by mail-pj1-x1030.google.com with SMTP id bf22so12439989pjb.4
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=eMqYEALQlNCHryVYkn9ayeWYJiH16krDhtfDzKR3N+4=;
 b=TYQBcK0MW3DxORsvXbqYjWpE/UmT9qOmwhv9wkrUvhF0j5rA6d5pKvtPzWcYl+9L/T
 qAvV1jms+Lx3KVQ1w0oVJOTP6V9RgCED3VI7DW0Wmr41+DVB7iFnL0tB2rdVZMZZELP1
 GOqwBPzN1BPfoBDd3CMGf5t88lKe44qPn0Z8dezGE4QVRb3d4BE/2NgF/UkJTI53ZcHe
 TFt8Ynfifin+b5h9vfNuNvUP5sYDFYJSRHX2NDV7AzMKWqmXGfnVDITBA2K6vmUbeuBS
 6fkEcoSnRs3k6Nliqc6XHg9gL08+hW76uj7rXLSDwz5pl9p2DdWXpeAf1Irj3GzXGq13
 PUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=eMqYEALQlNCHryVYkn9ayeWYJiH16krDhtfDzKR3N+4=;
 b=ZYAw68cKxjlcwbCZonAe7FyuuG+ysbqvSlTkJFtgHNCkszo2iH2QTmnXKct0cMdHzj
 ubeL0OdDFpyedQ1GQXSsQwQxZmSyPjyeM9d6TrJNGnwTll60+CgottKaG8L2ghaqHlxL
 pf9id/eRcP1bxvFr+g6FZr1XX70EX9+yB81BR5XsAt32pUh+zKM7/D4ts3MJNj4Mi8Tp
 4H/2iA4Nw+hOpNtuEVzqQxT4GmZbPZZQL76kPC14rhK65p59ubFToyLmEqYrkinTh8jL
 lqeHeTPz6/7VGiI+s/7HVdXQsGM/bUWcgp1voBCK8TvCUFF8znrbG7T52yCXdTcqZUK2
 HCYA==
X-Gm-Message-State: ACgBeo3DQjzWe3cI+th0VRyHg3G2MrAW0JdL9zs+DMIFYm7NAYncQdcF
 4chZpXH1AcrD5ubJI1kNcQcRJDX11qGQyg==
X-Google-Smtp-Source: AA6agR588Xaw8V5mgt910iXAqfft/VUSQ2ZYw/tRblgtwlvsQt4qvLYBzF9ThYkdb36mIor2LxGMBg==
X-Received: by 2002:a17:902:7b95:b0:172:9dc3:6c12 with SMTP id
 w21-20020a1709027b9500b001729dc36c12mr22486423pll.94.1661210622245; 
 Mon, 22 Aug 2022 16:23:42 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79731000000b0052d3899f8c2sm3809112pfg.4.2022.08.22.16.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:23:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 02/17] accel/tcg: Use bool for page_find_alloc
Date: Mon, 22 Aug 2022 16:23:23 -0700
Message-Id: <20220822232338.1727934-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822232338.1727934-1-richard.henderson@linaro.org>
References: <20220822232338.1727934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Bool is more appropriate type for the alloc parameter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 34bf296250..a8f1c34c4e 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -465,7 +465,7 @@ void page_init(void)
 #endif
 }
 
-static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
+static PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
 {
     PageDesc *pd;
     void **lp;
@@ -533,11 +533,11 @@ static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
 
 static inline PageDesc *page_find(tb_page_addr_t index)
 {
-    return page_find_alloc(index, 0);
+    return page_find_alloc(index, false);
 }
 
 static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
-                           PageDesc **ret_p2, tb_page_addr_t phys2, int alloc);
+                           PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc);
 
 /* In user-mode page locks aren't used; mmap_lock is enough */
 #ifdef CONFIG_USER_ONLY
@@ -651,7 +651,7 @@ static inline void page_unlock(PageDesc *pd)
 /* lock the page(s) of a TB in the correct acquisition order */
 static inline void page_lock_tb(const TranslationBlock *tb)
 {
-    page_lock_pair(NULL, tb->page_addr[0], NULL, tb->page_addr[1], 0);
+    page_lock_pair(NULL, tb->page_addr[0], NULL, tb->page_addr[1], false);
 }
 
 static inline void page_unlock_tb(const TranslationBlock *tb)
@@ -840,7 +840,7 @@ void page_collection_unlock(struct page_collection *set)
 #endif /* !CONFIG_USER_ONLY */
 
 static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
-                           PageDesc **ret_p2, tb_page_addr_t phys2, int alloc)
+                           PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc)
 {
     PageDesc *p1, *p2;
     tb_page_addr_t page1;
@@ -1290,7 +1290,7 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
      * Note that inserting into the hash table first isn't an option, since
      * we can only insert TBs that are fully initialized.
      */
-    page_lock_pair(&p, phys_pc, &p2, phys_page2, 1);
+    page_lock_pair(&p, phys_pc, &p2, phys_page2, true);
     tb_page_add(p, tb, 0, phys_pc & TARGET_PAGE_MASK);
     if (p2) {
         tb_page_add(p2, tb, 1, phys_page2);
@@ -2219,7 +2219,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     for (addr = start, len = end - start;
          len != 0;
          len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
-        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
+        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, true);
 
         /* If the write protection bit is set, then we invalidate
            the code inside.  */
-- 
2.34.1


