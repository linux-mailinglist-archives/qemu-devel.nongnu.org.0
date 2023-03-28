Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EB56CCDBF
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 00:59:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phIGk-0006ta-US; Tue, 28 Mar 2023 18:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGf-0006sM-Hu
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:17 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGd-00073u-Qn
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:17 -0400
Received: by mail-pl1-x636.google.com with SMTP id c18so13146980ple.11
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 15:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680044294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OMK6G6BOZWlbHX4rg+TLkGN/x34xkpFqL8aYBw8SQ0w=;
 b=qeTk7JCR8d+olCcPf1GPlJfjOn1bGE8ehMOh+7CH8inYsp0jRAkVQuP7f7DkN9LHgl
 dqROn3hwYM/gE0bsJNOiufo1TgiIFg4CAGGN1hhwwci3+D/iLddizCJlCEk4ql7nZwlK
 YirILZN52/bWwNORa2hwBGXauLJ2KtAI9/UmxKUSbpxVUje+aarq7UvChp73n1GZiOHf
 huD/ndx69ANAlYIwc9C5sv5B843WoHflmO3hivG20tc1nGfteWaX2j3x9lAEApngbx8L
 vSYj5qjobe2dbNYKk1ovdOWDQyoa49IL0XCiy7DmYlRJt4rf1Kn4Vt20IU+KIJKYcSV1
 E9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680044294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OMK6G6BOZWlbHX4rg+TLkGN/x34xkpFqL8aYBw8SQ0w=;
 b=d+4vJp2jOLAM8uYI/xH8fwJN+t0x8diK8f3h+rBJX//nBC4ehhvycUJz996erZvJ4G
 iTCEGw/87Nh7D6qdjhwLweN5NxICjcRaQXgK7t+Ky26EPOJXVIZZ7HCDhlmgO/QX7yq1
 Y8tqTBncV+HjF7Ym1Ntwqi5TzoibQxgMre1mnjH+J5HosjemYIn89ng9+kgsdIGBJLTe
 U+y7WvDrKWTVyVmG/ko5V/4pkPnIZJNFMaYP1ozyIO0ZVe6Ev/cJ02V2xQ0fT2Hnfc/A
 d/TJawACrX24Stq/vO187KpVf/fLhQ0gW1YCGuDxp1fEUIi93BUZbn966m2WW2bQNph9
 UlBQ==
X-Gm-Message-State: AAQBX9fLH/rcELjs7txWIcAbrzu6gpXAW1rJLxQPSiA88XOP15iKm0Kk
 uUZS3+sBIonIG73D+2tnfDxxWjuwdaVLMkzRpl0=
X-Google-Smtp-Source: AKy350ZPEnKobKs+qgJZdN0LXPbTmiBZCp1g8z9kYJza+8I+mUs66Yifk+pC8yM+vsvLb0ppgsSUOw==
X-Received: by 2002:a17:903:3293:b0:1a0:428b:d8c5 with SMTP id
 jh19-20020a170903329300b001a0428bd8c5mr14687232plb.45.1680044294399; 
 Tue, 28 Mar 2023 15:58:14 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:c23d:b6:6be1:f147])
 by smtp.gmail.com with ESMTPSA id
 jw1-20020a170903278100b0019cd1ee1523sm21670633plb.30.2023.03.28.15.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:58:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 07/15] accel/tcg: Pass last not end to page_collection_lock
Date: Tue, 28 Mar 2023 15:57:58 -0700
Message-Id: <20230328225806.2278728-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328225806.2278728-1-richard.henderson@linaro.org>
References: <20230328225806.2278728-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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


