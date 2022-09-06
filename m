Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258645AE4D9
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:56:09 +0200 (CEST)
Received: from localhost ([::1]:60360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVJP-0001GA-TD
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVUcJ-0007U4-8C
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:11:36 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVUcG-0002eX-Ii
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:11:34 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b17so1087732wrq.3
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 02:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=otYbIH7+XnOzyNNWUPs7TNiTtGs08RctjQezdZ+bWqM=;
 b=dWM4r7trPT4IwxjICsj5NkvVOKcPxWAjHBdSTS9rudEFqzihHN+O/T9ETra+c7Qko+
 lzVUypFevacmG6yutlP+7RgSaoV27wt/k5JOCMfMKOHAuWf53GGqDcq88/NRgQcwhiR0
 MSbF+l1jzrNCLv2n+dg5z/pSoHUyDE2EWVt1B+2YMs2fVYQKTSMbK7e6ZER9N/zQKvDw
 Bab7nfGP1PP1Kte6KcwGnpXiAMVc0gGWIdk75NJpNKZaNwWnXIdfaQMp2nGnZ79UuN7W
 OIo+IhY246lSQCmIwytzWJd0mwmC2f2nzQuHuVOIU/JONbLMqMbluho7aXyvCEfrrlPj
 AYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=otYbIH7+XnOzyNNWUPs7TNiTtGs08RctjQezdZ+bWqM=;
 b=MZxvapHtgahD9nXgmKmoI8S8uRkACIkmRA5313Dw9dFw+O3uN//oVSqP/cvQOm5aTX
 mSK8yDneKnsJhs7vRrNBlUCMI7U0CHLabMjiSui890IUoTnCmhtJ8HXH5osisSDSRkSX
 cqmog6uJbmQ3Se8E5ABscQpC2AGTUOz8UaRKOuCNj3LJ4y22jy7vRquIwDvWUx+xcAVI
 GVAZOaoJfM6VE0tMswz3nTS2EVCnQpbe1uhb/zY9cL58x79gf+dd6aBpsUsqYT9L5yIV
 wJbOp3Py/5oPn6kJijJEjw5OT+B5xyFDjpiU/Ux20HIvTdKyVXHu+Q4dVsbUC/bsgI/p
 KXgw==
X-Gm-Message-State: ACgBeo0Jo3WOvKU/q7BSmmtAQ/oYNba9NkflX1TS9IHMfGfblRY6DOCe
 AxY6uzf6XG+z4Yp4A/Z9YDb3tgJO1QJQVNAI
X-Google-Smtp-Source: AA6agR6KBzRf2pIkq49Nk50QIRF/an80PbRNCIncuLlJz5ShiVp/QN6kvOYzI8YpwcxsoJ8EFtI6Ag==
X-Received: by 2002:a5d:5847:0:b0:227:595f:de89 with SMTP id
 i7-20020a5d5847000000b00227595fde89mr10829578wrf.236.1662455490855; 
 Tue, 06 Sep 2022 02:11:30 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 m64-20020a1c2643000000b003a5ee64cc98sm20094193wmm.33.2022.09.06.02.11.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 02:11:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/7] accel/tcg: Use bool for page_find_alloc
Date: Tue,  6 Sep 2022 10:11:20 +0100
Message-Id: <20220906091126.298041-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906091126.298041-1-richard.henderson@linaro.org>
References: <20220906091126.298041-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index f5e8592d4a..d2946f8e59 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -472,7 +472,7 @@ void page_init(void)
 #endif
 }
 
-static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
+static PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
 {
     PageDesc *pd;
     void **lp;
@@ -540,11 +540,11 @@ static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
 
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
@@ -658,7 +658,7 @@ static inline void page_unlock(PageDesc *pd)
 /* lock the page(s) of a TB in the correct acquisition order */
 static inline void page_lock_tb(const TranslationBlock *tb)
 {
-    page_lock_pair(NULL, tb->page_addr[0], NULL, tb->page_addr[1], 0);
+    page_lock_pair(NULL, tb->page_addr[0], NULL, tb->page_addr[1], false);
 }
 
 static inline void page_unlock_tb(const TranslationBlock *tb)
@@ -847,7 +847,7 @@ void page_collection_unlock(struct page_collection *set)
 #endif /* !CONFIG_USER_ONLY */
 
 static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
-                           PageDesc **ret_p2, tb_page_addr_t phys2, int alloc)
+                           PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc)
 {
     PageDesc *p1, *p2;
     tb_page_addr_t page1;
@@ -1341,7 +1341,7 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
      * Note that inserting into the hash table first isn't an option, since
      * we can only insert TBs that are fully initialized.
      */
-    page_lock_pair(&p, phys_pc, &p2, phys_page2, 1);
+    page_lock_pair(&p, phys_pc, &p2, phys_page2, true);
     tb_page_add(p, tb, 0, phys_pc & TARGET_PAGE_MASK);
     if (p2) {
         tb_page_add(p2, tb, 1, phys_page2);
@@ -2289,7 +2289,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     for (addr = start, len = end - start;
          len != 0;
          len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
-        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
+        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, true);
 
         /* If the write protection bit is set, then we invalidate
            the code inside.  */
-- 
2.34.1


