Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC5C6CB08B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 23:20:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pguEh-000467-Ai; Mon, 27 Mar 2023 17:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEd-00043j-RL
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:35 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEb-0005wP-Mp
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:35 -0400
Received: by mail-pl1-x62f.google.com with SMTP id f22so5617958plr.0
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 14:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679951912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OMK6G6BOZWlbHX4rg+TLkGN/x34xkpFqL8aYBw8SQ0w=;
 b=chVOZTo+vk7pGDyQ5FBgzgO55RfXniyzfONgbN5QzMQBIJKLlpfBAPq6/78z5ZWqCc
 I94c5DwzEEP+vJYU1bF1FFf+tnSB7j6lWsiz9ZbrtH6VLsy2vp18SP7QfS3rL9C+IsYr
 /LDyhGOzoHjifYzPCAj0I/FXIR4+xMq/fkbuWCA2016Pf4nwx00ueDim1XQAhCkV43OF
 +/oLHM22J666bC2qQhMe9fX7VBiZrpBXYdypXwVWidAPRw6Mp0l0gAOj7LL1ZLmGvZ9P
 b2+OUla4MV2/mlF+kLjdc50+VIMDVWbbEwVh7u3Hcez/O4/3zkattK+QpHbuNfjwKb1k
 E2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679951912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OMK6G6BOZWlbHX4rg+TLkGN/x34xkpFqL8aYBw8SQ0w=;
 b=EP/CHhO9USHA6u3T12umpygAtBPtIxKVbSz72ooCDQ25iBnG4mK3WzvzpzJw7qDMox
 RW+IqthfjjW8HkSna6fwH+XV8fgRM5rZcaL1w3R56BIxs1HRfLHJoQVYuFshIJI4gmU4
 C9QHlQUx7EPolfr+MZoN8iJFVYzSFf2ygFM26Tt0qvuTnbwHR9Fm6gUEkvk44QKpi5yu
 vbRKBcf0TnemXqAuxqIA1qFjPiPZzvYJw2fPYKvp6nUAfNrgz/q+feGWgJF0SXlVVW8q
 3VLrQ+Dh817bV5h5QcGq+Y/6rmovHCP4HgPFkC+UAsPBaUlMHqDQbl4/MXq6TGZZG3L3
 p3bw==
X-Gm-Message-State: AAQBX9faE+AKAEQl9bXVALVrhJ7OGNnH33F3IlSw0XCDi9g72XZ/D5GD
 nRZDlTbk620e3za+ouoOVec7AZYP86bMFhrdR+U=
X-Google-Smtp-Source: AKy350ZrUbsM++8lJZwlz9D6DI72yRnrokQ8lKe3INH0Z5bzo6+3GKHExvnFAPxlriHSdvKhjjy+8Q==
X-Received: by 2002:a17:90b:33c9:b0:233:a6b7:3770 with SMTP id
 lk9-20020a17090b33c900b00233a6b73770mr14514457pjb.14.1679951912153; 
 Mon, 27 Mar 2023 14:18:32 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a17090a6f0200b0023440af7aafsm7902708pjk.9.2023.03.27.14.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 14:18:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH for-8.0 v2 07/12] accel/tcg: Pass last not end to
 page_collection_lock
Date: Mon, 27 Mar 2023 14:18:19 -0700
Message-Id: <20230327211824.1785547-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327211824.1785547-1-richard.henderson@linaro.org>
References: <20230327211824.1785547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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


