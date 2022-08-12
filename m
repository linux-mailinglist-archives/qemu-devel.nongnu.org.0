Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E51D591573
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:24:42 +0200 (CEST)
Received: from localhost ([::1]:40340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZKq-0003Jr-S0
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ52-0003TY-Mc
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:20 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:40658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ51-0006X9-2P
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:20 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 s5-20020a17090a13c500b001f4da9ffe5fso9005425pjf.5
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=nLs4F11vVpSwspm2veJzwmhbU1l4fxWHD0iuY3vRcw8=;
 b=crjmyD7wmONCXmpYOJVfuSq5y9+2feLfpdTHhquGKlHlSasHTPabuDAgKZTJODTNuS
 7sHIT3kXqaqjGfG3WhT5LpH/wLXunOrRIURWckr5KUYoSuy1NFQLMQL/KWl56J+JhUmF
 YtW3m+1O88mGVU5mkMRYdUemB9ulPfPmfIrlao5bdf8BCPXuBXY5NLQgic5H4YKRvre/
 tSydW2Tei+YeZAqtOfIldw2XrVa1QH/zdrXpEvz35O9/E0OfnTo93T5T8ULTNztlefH0
 4WIu6VEKtGyRyW+Xrvt7OHiuabgqmS83sU6pny5Xar7pGH+QMjxaDZP5CQNhqqm2UyBl
 +xIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=nLs4F11vVpSwspm2veJzwmhbU1l4fxWHD0iuY3vRcw8=;
 b=sFLuoWkt2ZffyLsInLBJrCmXBmPzZXCNh9hTjbY1nsPqwS2IaRWGDKjB8OhDngve6w
 ++8Xc5YKf5u8TnYLkMt5fH5iHNu+otWY9UoBl81yfn9yc+oKYY48psiSpXEQ8weRViR+
 r36rLpgTJc2+JXAj6Hqsa3bjIzyAKEYy3GhgtbzLOc3qXMPTd2GkYft/NbqE4cIJc4KQ
 PFY4mE4Ginz8jViZv3HTEBTT1gmcsdPjIIXkLWdURlUHVaJ7sO4OMQyiFvR83fTGe5Vd
 BI2l0yKZWDNf46Mbc+Cynn1tua4OQEdEc3D6po9tPM/vDv9guqP4t+SedxSaqePpyOvL
 C7Iw==
X-Gm-Message-State: ACgBeo1LgJ6tokrLIfzzFSYW7D/5x5QOrlA+HE3oX9Ce4m9cLjPcy1Tu
 jfeFWA4Uu0u8Cb6fDw4ZouGf0xc8xORVOw==
X-Google-Smtp-Source: AA6agR7gltJmCG7U/TESd/OXQ3iVbW5Q+NrjoRTyIDlkJaCk4IC7y+jv/ElEqymL2WYK1xnfnkOElA==
X-Received: by 2002:a17:902:f68e:b0:16f:5e7d:fc1 with SMTP id
 l14-20020a170902f68e00b0016f5e7d0fc1mr5140622plg.23.1660327697124; 
 Fri, 12 Aug 2022 11:08:17 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 07/21] accel/tcg: Use bool for page_find_alloc
Date: Fri, 12 Aug 2022 11:07:52 -0700
Message-Id: <20220812180806.2128593-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
index cf99b2b876..65a23f47d6 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -464,7 +464,7 @@ void page_init(void)
 #endif
 }
 
-static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
+static PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
 {
     PageDesc *pd;
     void **lp;
@@ -532,11 +532,11 @@ static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
 
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
@@ -650,7 +650,7 @@ static inline void page_unlock(PageDesc *pd)
 /* lock the page(s) of a TB in the correct acquisition order */
 static inline void page_lock_tb(const TranslationBlock *tb)
 {
-    page_lock_pair(NULL, tb->page_addr[0], NULL, tb->page_addr[1], 0);
+    page_lock_pair(NULL, tb->page_addr[0], NULL, tb->page_addr[1], false);
 }
 
 static inline void page_unlock_tb(const TranslationBlock *tb)
@@ -839,7 +839,7 @@ void page_collection_unlock(struct page_collection *set)
 #endif /* !CONFIG_USER_ONLY */
 
 static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
-                           PageDesc **ret_p2, tb_page_addr_t phys2, int alloc)
+                           PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc)
 {
     PageDesc *p1, *p2;
     tb_page_addr_t page1;
@@ -1289,7 +1289,7 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
      * Note that inserting into the hash table first isn't an option, since
      * we can only insert TBs that are fully initialized.
      */
-    page_lock_pair(&p, phys_pc, &p2, phys_page2, 1);
+    page_lock_pair(&p, phys_pc, &p2, phys_page2, true);
     tb_page_add(p, tb, 0, phys_pc & TARGET_PAGE_MASK);
     if (p2) {
         tb_page_add(p2, tb, 1, phys_page2);
@@ -2224,7 +2224,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     for (addr = start, len = end - start;
          len != 0;
          len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
-        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
+        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, true);
 
         /* If the write protection bit is set, then we invalidate
            the code inside.  */
-- 
2.34.1


