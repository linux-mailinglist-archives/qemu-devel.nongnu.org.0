Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EBF6C4F0A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:09:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf04l-0003Xg-94; Wed, 22 Mar 2023 11:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf04L-00032l-GW
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:08:10 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf04H-0007Kg-E7
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:08:04 -0400
Received: by mail-pl1-x634.google.com with SMTP id ja10so19554264plb.5
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679497676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OMK6G6BOZWlbHX4rg+TLkGN/x34xkpFqL8aYBw8SQ0w=;
 b=Hg75OGgVVVqJ8K9jjUZa98ox2YwUFnU+TI+Tco112arWLwXN1dj9DgdoEeKzTE2Ps5
 0N3Ap4z4swtXI8xu6gZwyiHNyZQaEk+TLJz+9dS0j5lOBk5vGeODZlRjD+FSjzq2NKOw
 Oca5CCwhUsBXuSSP/7ydGA1ucZqqrlijQPLl2w1cC5VQ9G2Fw9+qpwftfieYCeh2rt9F
 mveIzBAbe0tvxZETzhXLlorgcDYsX9WuhwdgB1EPKoPn/ff6NjMqi3svOPBuk01lLs3T
 ZfH9Prj26vMqUD8BfpEkEibwusUAqys9PlW+kJ+HGOKj3tJkFSminJENLbayXZvJAAaX
 1yWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679497676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OMK6G6BOZWlbHX4rg+TLkGN/x34xkpFqL8aYBw8SQ0w=;
 b=DyvbrPnpfvVLSNNaN42HF4K0ImLBPEIbC1PMMeVkyQYlvbTCakx41TmBfDn7MNd01u
 cV2ZTWHvkPOnsa/5chK8okEVksHLfNeVl8V2fvQITxX+aCmzc4RcjfjtPbYHcAqDyJdl
 fbMlCB+sJL1EJmhH2Vn5pRCVbadZZSbpGZsqky7tpIxnwTy05m2gEKlOU2MQ5dgjbXmf
 4WfqcssSm7TAisjUMz47NfUxARF9h+5KsYhupbrkbOJqvk3La2hCc+VoZ4AQ7PUwKWuC
 qGBUuWSAxYyDB3UYBeXHAOKlWPn2aYzlcvzJzVNmF+MF8aerscIcTh1Uakktxi785e0i
 AWYQ==
X-Gm-Message-State: AO0yUKUv7IAIlS7Kt1xbaiAqf+lFUDoawPOvoUSZcOpwic5Ktu574w2K
 HlBV+z3lR40ZTa9KQHQVbUC+F7yEwcLGqkPWcw0=
X-Google-Smtp-Source: AK7set8dz3/p8w27gZe3BQSsgQ7xLCz09ryK6AeRjmPKz9/qX6hMcnDeXBjhnaCZpKxbB+vSzr5nkw==
X-Received: by 2002:a17:902:c944:b0:1a1:e14f:3750 with SMTP id
 i4-20020a170902c94400b001a1e14f3750mr3584388pla.1.1679497676383; 
 Wed, 22 Mar 2023 08:07:56 -0700 (PDT)
Received: from stoup.. (24-113-166-229.wavecable.com. [24.113.166.229])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b0019339f3368asm10757555plo.3.2023.03.22.08.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 08:07:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 08/11] accel/tcg: Pass last not end to
 page_collection_lock
Date: Wed, 22 Mar 2023 08:07:41 -0700
Message-Id: <20230322150744.175010-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322150744.175010-1-richard.henderson@linaro.org>
References: <20230322150744.175010-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
index 04d2751bb6..57da2feb2f 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -511,20 +511,20 @@ static gint tb_page_addr_cmp(gconstpointer ap, gconstpointer bp, gpointer udata)
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
 
     set->tree = q_tree_new_full(tb_page_addr_cmp, NULL, NULL,
                                 page_entry_destroy);
@@ -534,7 +534,7 @@ static struct page_collection *page_collection_lock(tb_page_addr_t start,
  retry:
     q_tree_foreach(set->tree, page_entry_lock, NULL);
 
-    for (index = start; index <= end; index++) {
+    for (index = start; index <= last; index++) {
         TranslationBlock *tb;
         PageForEachNext n;
 
@@ -1154,7 +1154,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
 void tb_invalidate_phys_page(tb_page_addr_t addr)
 {
     struct page_collection *pages;
-    tb_page_addr_t start, end;
+    tb_page_addr_t start, last;
     PageDesc *p;
 
     p = page_find(addr >> TARGET_PAGE_BITS);
@@ -1163,9 +1163,9 @@ void tb_invalidate_phys_page(tb_page_addr_t addr)
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
 
@@ -1181,7 +1181,7 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
     struct page_collection *pages;
     tb_page_addr_t next;
 
-    pages = page_collection_lock(start, end);
+    pages = page_collection_lock(start, end - 1);
     for (next = (start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
          start < end;
          start = next, next += TARGET_PAGE_SIZE) {
@@ -1226,7 +1226,7 @@ void tb_invalidate_phys_range_fast(ram_addr_t ram_addr,
 {
     struct page_collection *pages;
 
-    pages = page_collection_lock(ram_addr, ram_addr + size);
+    pages = page_collection_lock(ram_addr, ram_addr + size - 1);
     tb_invalidate_phys_page_fast__locked(pages, ram_addr, size, retaddr);
     page_collection_unlock(pages);
 }
-- 
2.34.1


