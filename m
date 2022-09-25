Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9095E92A0
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:13:57 +0200 (CEST)
Received: from localhost ([::1]:39934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocPa7-0002Qt-8I
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEz-00037J-Lp
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:52:05 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:38814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEx-0000NZ-W8
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:52:05 -0400
Received: by mail-qv1-xf29.google.com with SMTP id i15so2792523qvp.5
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=IxU+2TcSPxOMpzbbtR4F1GZkdhXK0yr1aP3EanHShgc=;
 b=Anhpt+ZLvEc133rrfsXafacjjoK4Yjmcx3n9A3CqiUjpxJtcfQ58UT3rgiq76nTKDv
 xOs2SnCYtJz+vAqKcc17tSQlraIbiBZ1UwC4wDeaE1EI+wn1KyjfyeuuNZZ86KDUxffl
 K05QvgH2GpUICs3vl/q8na6Stt2u3xwLlK2W0r1nswvnbkJdwYI0s/GOYRDJJPJrQwxM
 Clm+JHXl+wWwK6WfBRKIyTLv1ZNzRU5DKNcfH3h6jEULjmT8yjT2bZTSBxK+3cEW0FSj
 hhMWw+CzWFOBnyec1xqNciZXc+9ICohl70MNKgf7mTLUWTrVnN7d4RpL9thdf1BpyGnP
 yC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IxU+2TcSPxOMpzbbtR4F1GZkdhXK0yr1aP3EanHShgc=;
 b=0agz0YerAiGt5ewVJOXFAfwadsgBFaTg+zsiV0L98NbA2FYHFjNKlOp44rlJaNmd+0
 Q+bFnMF7e6o2YXIeY5M9/ZQycRyqGjQreMXjjcSc1OyPLtdn0tqaoYxZxhuIe0Z1Dbah
 LVBr4YTy9Msn2D7YJnrTtrUFSopKMkUTgOkiwBciqR7Kis6zsoZJOtQKBlgzVUzw7v2p
 +QewrrPbfg3YeKyjuXW7QN6rtIIeTkuQ+8fsOnkeNFil+Jcw7ohGIwJsgV0m9WcVJCpP
 m3s2+1yrAwj0QrEZNdnsEWt4+8ZGUNlsz1rdg3uNBeo8fPI5p8fnmWxOre+P1Ii3mA/R
 PwLQ==
X-Gm-Message-State: ACrzQf09z9VObFfbFY3FcBTPpA6HoNQGRYaNNVMb7v10tibitwLVMRV9
 ME1vj/YXoQBq9QhcxLn+cCdbkQvUPE/hUg==
X-Google-Smtp-Source: AMsMyM7SqFV+ttg0L6O/Cc3nEHtdwotN2SbFHOR/WVd7APD+ZNX7MkQAGCY08R8WszJVw2xj8uHzEw==
X-Received: by 2002:a05:6214:4001:b0:474:1516:5372 with SMTP id
 kd1-20020a056214400100b0047415165372mr13544873qvb.96.1664103123038; 
 Sun, 25 Sep 2022 03:52:03 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a9:5c0e:1ec2:d482:4986:8538])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a0c4f00b006cf19068261sm10061132qki.116.2022.09.25.03.52.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 03:52:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/17] accel/tcg: Remove PageDesc code_bitmap
Date: Sun, 25 Sep 2022 10:51:17 +0000
Message-Id: <20220925105124.82033-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925105124.82033-1-richard.henderson@linaro.org>
References: <20220925105124.82033-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
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

This bitmap is created and discarded immediately.
We gain nothing by its existence.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822232338.1727934-2-richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 78 ++-------------------------------------
 1 file changed, 4 insertions(+), 74 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index f5e8592d4a..9046ea80f7 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -102,21 +102,14 @@
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
@@ -907,17 +900,6 @@ void tb_htable_init(void)
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
@@ -932,7 +914,6 @@ static void page_flush_tb_1(int level, void **lp)
         for (i = 0; i < V_L2_SIZE; ++i) {
             page_lock(&pd[i]);
             pd[i].first_tb = (uintptr_t)NULL;
-            invalidate_page_bitmap(pd + i);
             page_unlock(&pd[i]);
         }
     } else {
@@ -1197,11 +1178,9 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
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
 
@@ -1246,35 +1225,6 @@ void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr)
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
@@ -1295,7 +1245,6 @@ static inline void tb_page_add(PageDesc *p, TranslationBlock *tb,
     page_already_protected = p->first_tb != (uintptr_t)NULL;
 #endif
     p->first_tb = (uintptr_t)tb | n;
-    invalidate_page_bitmap(p);
 
 #if defined(CONFIG_USER_ONLY)
     /* translator_loop() must have made all TB pages non-writable */
@@ -1357,10 +1306,8 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
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
@@ -1731,7 +1678,6 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
 #if !defined(CONFIG_USER_ONLY)
     /* if no code remaining, no need to continue to use slow writes */
     if (!p->first_tb) {
-        invalidate_page_bitmap(p);
         tlb_unprotect_code(start);
     }
 #endif
@@ -1827,24 +1773,8 @@ void tb_invalidate_phys_page_fast(struct page_collection *pages,
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


