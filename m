Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF506BED77
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 16:56:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdCQH-0002o7-Fe; Fri, 17 Mar 2023 11:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdCQB-0002nV-IJ
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:55:11 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdCQ9-0007yy-8y
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:55:11 -0400
Received: by mail-pj1-x1031.google.com with SMTP id y2so5630551pjg.3
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 08:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679068507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kaO7GmK/787xWdgYWzb+qwyj7A2GGcvimGihRVSOyho=;
 b=HYQjrp+SgBS9jCJF+eUtgtMLq20HKfIq1bqk8Co83YZVvyHoe0GaFwTyyRzBlRkusp
 qqNQhD3nVdH2vUFS0qjR5vfZ1E7cMP7AdXsK4FAAqBOUymKmh66FKPkx74wJc0Ia03Hl
 /P8QpFf+HBwTwFV28wO326X+le0KKp6fBOM0hbFQE6wSh6/X5Rz5daD9aIwsatIrqDQz
 y5osIgVCImJCRGp0q7UTta8OlDyiZf0SfU5zjKMoTapN0pHBLlemcxl0vrfj6/IJdW3E
 vIde0yBs4qZ+yphqyH3+SVRNBWGlFGo7jCgndr9C68hf5h8YtZ89fQna8TTg96xsfrgW
 /JRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679068507;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kaO7GmK/787xWdgYWzb+qwyj7A2GGcvimGihRVSOyho=;
 b=LwEgfkMOlQlZmUR1hPXdGmRtMzjzXxazl4Q12ssXZ0OgzXdW2tlHJ3+xnLBOKzhtHu
 BRfkg6TENQ4B0apjuntwRMT7r+Z7yd56nw2nup8LO/jjSmre2Ar3gH8WhMl20zBBYteR
 qLd8ilCdrfA599b2EDKpf57zXOAjO09Lmr8gQbz7QyCA9KKDxqLNzvv7B2Fv9X0qrlcj
 2ugSOzQJ7gEILyVOMOMsJ5o+qyBXdckkqSsFNkUMQ0Oc5z9NU5zJ83xIAqsxWmgDvJPE
 fxMDBEYiaesyq8Mf3uFtP5d/M7gC+a8j7YV/Ef3PAvyrZ8jewTxlwZMEc+tMCQxDN/zf
 KC/Q==
X-Gm-Message-State: AO0yUKVhwIV7x4PZ/QbFaBO7BxslzBWoZkXxkAetwqJIroU5xOwFLZP9
 FBc/euQpR4lpm/KNr3x0ieCqKofboTtpLc3P0LQ=
X-Google-Smtp-Source: AK7set8Fv4WMZ7utFehL5PH1bfc/xwGNZLyebg54B5i+ZUXseKCfsZwxC9tbfudb5QWGfo4QB39WmA==
X-Received: by 2002:a05:6a20:491c:b0:d5:3818:6427 with SMTP id
 ft28-20020a056a20491c00b000d538186427mr8514332pzb.9.1679068506814; 
 Fri, 17 Mar 2023 08:55:06 -0700 (PDT)
Received: from stoup.. (96-82-119-43-static.hfc.comcastbusiness.net.
 [96.82.119.43]) by smtp.gmail.com with ESMTPSA id
 s5-20020a656445000000b004fb3e5681cesm1668986pgv.20.2023.03.17.08.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 08:55:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 7/9] accel/tcg: Pass last not end to page_collection_lock
Date: Fri, 17 Mar 2023 08:54:53 -0700
Message-Id: <20230317155455.341843-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230317155455.341843-1-richard.henderson@linaro.org>
References: <20230317155455.341843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Pass the address of the last byte to be changed, rather than
the first address past the last byte.  This avoids overflow
when the last page of the address space is involved.

Fixes a bug in the loop comparision where "<= end" would lock
one more page than required.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-maint.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 2c2e887196..cc23f7fa45 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -510,20 +510,20 @@ static gint tb_page_addr_cmp(gconstpointer ap, gconstpointer bp, gpointer udata)
 }
 
 /*
- * Lock a range of pages ([@start,@end[) as well as the pages of all
+ * Lock a range of pages ([@start,@last]) as well as the pages of all
  * intersecting TBs.
  * Locking order: acquire locks in ascending order of page index.
  */
 static struct page_collection *page_collection_lock(tb_page_addr_t start,
-                                                    tb_page_addr_t end)
+                                                    tb_page_addr_t last)
 {
     struct page_collection *set = g_malloc(sizeof(*set));
     tb_page_addr_t index;
     PageDesc *pd;
 
     start >>= TARGET_PAGE_BITS;
-    end   >>= TARGET_PAGE_BITS;
-    g_assert(start <= end);
+    last >>= TARGET_PAGE_BITS;
+    g_assert(start <= last);
 
     set->tree = g_tree_new_full(tb_page_addr_cmp, NULL, NULL,
                                 page_entry_destroy);
@@ -533,7 +533,7 @@ static struct page_collection *page_collection_lock(tb_page_addr_t start,
  retry:
     g_tree_foreach(set->tree, page_entry_lock, NULL);
 
-    for (index = start; index <= end; index++) {
+    for (index = start; index <= last; index++) {
         TranslationBlock *tb;
         PageForEachNext n;
 
@@ -1153,7 +1153,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
 void tb_invalidate_phys_page(tb_page_addr_t addr)
 {
     struct page_collection *pages;
-    tb_page_addr_t start, end;
+    tb_page_addr_t start, last;
     PageDesc *p;
 
     p = page_find(addr >> TARGET_PAGE_BITS);
@@ -1162,9 +1162,9 @@ void tb_invalidate_phys_page(tb_page_addr_t addr)
     }
 
     start = addr & TARGET_PAGE_MASK;
-    end = start + TARGET_PAGE_SIZE;
-    pages = page_collection_lock(start, end);
-    tb_invalidate_phys_page_range__locked(pages, p, start, end, 0);
+    last = addr | ~TARGET_PAGE_MASK;
+    pages = page_collection_lock(start, last);
+    tb_invalidate_phys_page_range__locked(pages, p, start, last + 1, 0);
     page_collection_unlock(pages);
 }
 
@@ -1180,7 +1180,7 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
     struct page_collection *pages;
     tb_page_addr_t next;
 
-    pages = page_collection_lock(start, end);
+    pages = page_collection_lock(start, end - 1);
     for (next = (start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
          start < end;
          start = next, next += TARGET_PAGE_SIZE) {
@@ -1225,7 +1225,7 @@ void tb_invalidate_phys_range_fast(ram_addr_t ram_addr,
 {
     struct page_collection *pages;
 
-    pages = page_collection_lock(ram_addr, ram_addr + size);
+    pages = page_collection_lock(ram_addr, ram_addr + size - 1);
     tb_invalidate_phys_page_fast__locked(pages, ram_addr, size, retaddr);
     page_collection_unlock(pages);
 }
-- 
2.34.1


