Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A806AB48D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 03:14:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ0Ln-0003NQ-Lq; Sun, 05 Mar 2023 21:13:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Ll-0003JB-Nw
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:17 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Lk-00062J-5k
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:17 -0500
Received: by mail-pj1-x102c.google.com with SMTP id bo22so8302567pjb.4
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 18:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678068795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RvcMLtMZSPv7P6lANhDUocXLVd0nBQQsNtPV18yr4k4=;
 b=wh52Ylg3bwxtArx3aZ6tB+nDnP/KRGtwZkYcDqVIlM7iuD+Ck2gECuAbFMlrKaUfV6
 GA42Lbt825aKn2rcDyIxrM7Xdr1X1nhm+wtV4uCaJK1LbkJZVjGJfIyN9UdP1sdkqVVT
 7Pn6Z0foUnY0/Kcn+gyYsUyplemWr2Z/ZiSoZgZ7dl1yMuES6DLi03n1C47Q73D3EPmM
 5xkfcPymF25VQL1KVV/anPOZ+Okflod3vGdEP+KDqAcJOCvXX3/pE7NgfSppp/zaIDQ9
 UFJ/ZvmL7VA8B2YjIoAy/D0EKlhWnl0ts10OK+oFmkEOLme4a9XGf9RdeEqjamWAtHoV
 CN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678068795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RvcMLtMZSPv7P6lANhDUocXLVd0nBQQsNtPV18yr4k4=;
 b=gfrpmabsASTpW4IQrx+eVRiXod6lrh253nphwP2LlnkI2zDxfjtG/5VVHqx0YI3Er0
 iROUGml1PzO6oizFL/imKvcRw43QQo0E5MRMjmmAkfVQYJ1VrliuZ2jUJVB3VVtzQlMn
 fF4o4i56mm/JIP7LEftkNuaXYj/c7HEleHhtVYiYVd/VY2WIq0N3zukxaxRSNswQTPl3
 dMteToRbhBRY0fbor6RznrIxN4ovS1hVcSW/1KguK3TlAESI9x4pXmKI1Fcfd+Ksu56d
 kvw2H6hKFOvXUsggt6obEezK9PsZnYvn8fi4x4Xrl7MpjA2p0aQk69LeVqjaq34M90BE
 C5qw==
X-Gm-Message-State: AO0yUKXLEcOeeovPcFRZK4UhEC/grWMWmMMxWeGm0yplDQiRzj2cPoaS
 d0gAuAEL352Hr6rGuzIWWd7d9qaSej6yQTMljHnteA==
X-Google-Smtp-Source: AK7set+ItVq41oWNXnZgJQitMTuTbyu9BYjfV+zHnIoufIMbSlWwVI8HhvmEa6FvImy7Px/3B80GTw==
X-Received: by 2002:a05:6a20:5483:b0:cd:47dc:82b5 with SMTP id
 i3-20020a056a20548300b000cd47dc82b5mr13278691pzk.21.1678068794870; 
 Sun, 05 Mar 2023 18:13:14 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a630e12000000b005030136314dsm5048434pgl.71.2023.03.05.18.13.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 18:13:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] accel/tcg: Pass last not end to page_collection_lock
Date: Sun,  5 Mar 2023 18:13:05 -0800
Message-Id: <20230306021307.1879483-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306021307.1879483-1-richard.henderson@linaro.org>
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-maint.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 745912e60a..c4e15c5591 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -509,20 +509,20 @@ static gint tb_page_addr_cmp(gconstpointer ap, gconstpointer bp, gpointer udata)
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
@@ -532,7 +532,7 @@ static struct page_collection *page_collection_lock(tb_page_addr_t start,
  retry:
     g_tree_foreach(set->tree, page_entry_lock, NULL);
 
-    for (index = start; index <= end; index++) {
+    for (index = start; index <= last; index++) {
         TranslationBlock *tb;
         PageForEachNext n;
 
@@ -1152,7 +1152,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
 void tb_invalidate_phys_page(tb_page_addr_t addr)
 {
     struct page_collection *pages;
-    tb_page_addr_t start, end;
+    tb_page_addr_t start, last;
     PageDesc *p;
 
     p = page_find(addr >> TARGET_PAGE_BITS);
@@ -1161,9 +1161,9 @@ void tb_invalidate_phys_page(tb_page_addr_t addr)
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
 
@@ -1179,7 +1179,7 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
     struct page_collection *pages;
     tb_page_addr_t next;
 
-    pages = page_collection_lock(start, end);
+    pages = page_collection_lock(start, end - 1);
     for (next = (start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
          start < end;
          start = next, next += TARGET_PAGE_SIZE) {
@@ -1224,7 +1224,7 @@ void tb_invalidate_phys_range_fast(ram_addr_t ram_addr,
 {
     struct page_collection *pages;
 
-    pages = page_collection_lock(ram_addr, ram_addr + size);
+    pages = page_collection_lock(ram_addr, ram_addr + size - 1);
     tb_invalidate_phys_page_fast__locked(pages, ram_addr, size, retaddr);
     page_collection_unlock(pages);
 }
-- 
2.34.1


