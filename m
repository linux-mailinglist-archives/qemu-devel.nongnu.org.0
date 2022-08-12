Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A7859156E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:23:06 +0200 (CEST)
Received: from localhost ([::1]:37888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZJJ-0001e3-Kg
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ51-0003SO-Aa
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:19 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:33445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ4z-0006Wx-Ac
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:18 -0400
Received: by mail-pf1-x432.google.com with SMTP id k14so1616511pfh.0
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rrga6twr5lPEFk3KdzvBoPM7BlgbMv2p+pr0L9Fqmzg=;
 b=E47kQ14+tF/xNBPmWx81CMi41N9WIcSwuSF88lb1cB0Pk/atVNV4Y5lRLxEBwU1oGS
 exjiLtFlEg3iijnbvXFId+wdM4uIzhyo5R6uqsb3JUbJCco7X6EH1OoWPtMut9mzdEll
 4dkMKaKfYHmf/u3s9lPEot9CCjh/g9icO9jc0sQz1UgP36pynYHDCNM882AW7c0BbGtt
 KHnRlbEadlWnD8xnUK4/TKECy4yJJn/I7RLNB/CYHCVWHFeRi9SiAl+/KEalsKKV71LC
 V/l8OvKsWUKbPYJnGlfdqscMSZJLvwz70PRvQ1esT4rK90sjgQVudeXisvDh/q5HVeOT
 d9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rrga6twr5lPEFk3KdzvBoPM7BlgbMv2p+pr0L9Fqmzg=;
 b=gIP/5iX3hU72pGQSaioKfC/R4kaxjxvD1h9hQTkTIN/lBEKA3EFLGojfIG6JEE4f1T
 WZci3AYzf20Xxqf9XeBNhG9Ph92NIRCNGEGLt+0MPkxU5uBEbPBCuie3bBEQrw4aSxq5
 6+9C1olvDCvYQJf+DGj9n+8LPegrRuh+40xgc0R/sZqJZdTvGzbvNvTXWHN5UmceWL0t
 FUQIHw3Tqyb+rPmWyO9yNu9qajzp826PYrfRSDMwxIjsChqkGp1FHB3+EPFC/z+uHEpG
 FqN8qok5FD33ApgyUy+OTHf4NJbnFNDYuaflS0903xQbGm09Y3MIM47JKrSYACwLQKzn
 xEtg==
X-Gm-Message-State: ACgBeo0n7f/55dWY51NmCfmUipM8J5iol4EKeOLueiMwpU2/7FQh5VW7
 VtVxqOU7KPYWPzV4b3rdCDE11U7Lj7+muw==
X-Google-Smtp-Source: AA6agR6VluL+g0AUqR+As0Xwzbl4mP+2aL3r++uUlO1p2IFWgpsSx6cqZLnDnjFfstbr830xq2cX2Q==
X-Received: by 2002:a63:1450:0:b0:41c:c499:4fc8 with SMTP id
 16-20020a631450000000b0041cc4994fc8mr4050898pgu.556.1660327696021; 
 Fri, 12 Aug 2022 11:08:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 06/21] accel/tcg: Remove PageDesc code_bitmap
Date: Fri, 12 Aug 2022 11:07:51 -0700
Message-Id: <20220812180806.2128593-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

This bitmap is created and discarded immediately.
We gain nothing by its existence.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 78 ++-------------------------------------
 1 file changed, 4 insertions(+), 74 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ef62a199c7..cf99b2b876 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -101,21 +101,14 @@
 #define assert_memory_lock() tcg_debug_assert(have_mmap_lock())
 #endif
 
-#define SMC_BITMAP_USE_THRESHOLD 10
-
 typedef struct PageDesc {
     /* list of TBs intersecting this ram page */
     uintptr_t first_tb;
-#ifdef CONFIG_SOFTMMU
-    /* in order to optimize self modifying code, we count the number
-       of lookups we do to a given page to use a bitmap */
-    unsigned long *code_bitmap;
-    unsigned int code_write_count;
-#else
+#ifdef CONFIG_USER_ONLY
     unsigned long flags;
     void *target_data;
 #endif
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_SOFTMMU
     QemuSpin lock;
 #endif
 } PageDesc;
@@ -906,17 +899,6 @@ void tb_htable_init(void)
     qht_init(&tb_ctx.htable, tb_cmp, CODE_GEN_HTABLE_SIZE, mode);
 }
 
-/* call with @p->lock held */
-static inline void invalidate_page_bitmap(PageDesc *p)
-{
-    assert_page_locked(p);
-#ifdef CONFIG_SOFTMMU
-    g_free(p->code_bitmap);
-    p->code_bitmap = NULL;
-    p->code_write_count = 0;
-#endif
-}
-
 /* Set to NULL all the 'first_tb' fields in all PageDescs. */
 static void page_flush_tb_1(int level, void **lp)
 {
@@ -931,7 +913,6 @@ static void page_flush_tb_1(int level, void **lp)
         for (i = 0; i < V_L2_SIZE; ++i) {
             page_lock(&pd[i]);
             pd[i].first_tb = (uintptr_t)NULL;
-            invalidate_page_bitmap(pd + i);
             page_unlock(&pd[i]);
         }
     } else {
@@ -1196,11 +1177,9 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     if (rm_from_page_list) {
         p = page_find(tb->page_addr[0] >> TARGET_PAGE_BITS);
         tb_page_remove(p, tb);
-        invalidate_page_bitmap(p);
         if (tb->page_addr[1] != -1) {
             p = page_find(tb->page_addr[1] >> TARGET_PAGE_BITS);
             tb_page_remove(p, tb);
-            invalidate_page_bitmap(p);
         }
     }
 
@@ -1245,35 +1224,6 @@ void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr)
     }
 }
 
-#ifdef CONFIG_SOFTMMU
-/* call with @p->lock held */
-static void build_page_bitmap(PageDesc *p)
-{
-    int n, tb_start, tb_end;
-    TranslationBlock *tb;
-
-    assert_page_locked(p);
-    p->code_bitmap = bitmap_new(TARGET_PAGE_SIZE);
-
-    PAGE_FOR_EACH_TB(p, tb, n) {
-        /* NOTE: this is subtle as a TB may span two physical pages */
-        if (n == 0) {
-            /* NOTE: tb_end may be after the end of the page, but
-               it is not a problem */
-            tb_start = tb->pc & ~TARGET_PAGE_MASK;
-            tb_end = tb_start + tb->size;
-            if (tb_end > TARGET_PAGE_SIZE) {
-                tb_end = TARGET_PAGE_SIZE;
-             }
-        } else {
-            tb_start = 0;
-            tb_end = ((tb->pc + tb->size) & ~TARGET_PAGE_MASK);
-        }
-        bitmap_set(p->code_bitmap, tb_start, tb_end - tb_start);
-    }
-}
-#endif
-
 /* add the tb in the target page and protect it if necessary
  *
  * Called with mmap_lock held for user-mode emulation.
@@ -1294,7 +1244,6 @@ static inline void tb_page_add(PageDesc *p, TranslationBlock *tb,
     page_already_protected = p->first_tb != (uintptr_t)NULL;
 #endif
     p->first_tb = (uintptr_t)tb | n;
-    invalidate_page_bitmap(p);
 
 #if defined(CONFIG_USER_ONLY)
     /* translator_loop() must have made all TB pages non-writable */
@@ -1356,10 +1305,8 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     /* remove TB from the page(s) if we couldn't insert it */
     if (unlikely(existing_tb)) {
         tb_page_remove(p, tb);
-        invalidate_page_bitmap(p);
         if (p2) {
             tb_page_remove(p2, tb);
-            invalidate_page_bitmap(p2);
         }
         tb = existing_tb;
     }
@@ -1736,7 +1683,6 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
 #if !defined(CONFIG_USER_ONLY)
     /* if no code remaining, no need to continue to use slow writes */
     if (!p->first_tb) {
-        invalidate_page_bitmap(p);
         tlb_unprotect_code(start);
     }
 #endif
@@ -1832,24 +1778,8 @@ void tb_invalidate_phys_page_fast(struct page_collection *pages,
     }
 
     assert_page_locked(p);
-    if (!p->code_bitmap &&
-        ++p->code_write_count >= SMC_BITMAP_USE_THRESHOLD) {
-        build_page_bitmap(p);
-    }
-    if (p->code_bitmap) {
-        unsigned int nr;
-        unsigned long b;
-
-        nr = start & ~TARGET_PAGE_MASK;
-        b = p->code_bitmap[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG - 1));
-        if (b & ((1 << len) - 1)) {
-            goto do_invalidate;
-        }
-    } else {
-    do_invalidate:
-        tb_invalidate_phys_page_range__locked(pages, p, start, start + len,
-                                              retaddr);
-    }
+    tb_invalidate_phys_page_range__locked(pages, p, start, start + len,
+                                          retaddr);
 }
 #else
 /* Called with mmap_lock held. If pc is not 0 then it indicates the
-- 
2.34.1


