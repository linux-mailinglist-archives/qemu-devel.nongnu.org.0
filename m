Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2151A5963D9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 22:42:16 +0200 (CEST)
Received: from localhost ([::1]:53206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3OB-00017T-7K
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 16:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3Gm-0004oX-Kw
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:36 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:39917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3Gk-0004Vz-VP
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:36 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-11be650aaccso5531590fac.6
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=GX62IFzgxiLc3YqrfYpimUBcYuQPnU8/+Qkb9r74BEo=;
 b=Qhwl/nzZib4gYpu3K7s4UGLiwy/W1ffbovnMmf38xL0AKNyDPF6F9Pw13jRKrZtMM+
 sdwwhoRpFft74CLbkgsu8fu2GqGn3ykvrOZf8DzZn9OTqEwY6SuqVbBogZAHXiDGJ5nK
 jzphjqIOu95lJWybZTp1LNCkiAD5R/CLrIzVrwt/c3HwhTzSMIRcijJKfhQ4mSm2laEh
 L7jM4JBhp5gH7jq2gJmU/EjNALhYI/1zi9XRcEaCC9ToqbV+LPSSrEpobYs3kFlzkwbD
 GutM6EnvpPkGhJkbAotSNv4xRe+OghDRNxtZBL8oD0Pd3K4cgLcpg0zcB82FviOsx+1u
 LWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=GX62IFzgxiLc3YqrfYpimUBcYuQPnU8/+Qkb9r74BEo=;
 b=68StIuM3mZ3b7TqCC+NfvHdowZzrdc/jOryEtf2qOAKKNDj3AIB1NV04z9JEM2vwPb
 wJj8nQ8frkjWALRbWsOSiCrsPT9IjvMCSa05TeKvIdHLrfoHBpJ0DOD2ldJ4l8L87iRC
 XKWObd9tha5AIL1hJ9I9RbNgAfb0svAPR41XYbH8L4eURgCSa8jmwuSw5//al3Bw7PE4
 Ls141kx4u6sV9gtt5zRntIsWqVocpWpJSeZvYiO5ocbE9zbbjgZseU+WdXIgPltIsmaD
 H8d+GFpeqtdsOQpa2TgKh7ktkLKrHszjI25JHjKipcGmNhVsPgHjqHRY+/6nLpWJKm8t
 pDRg==
X-Gm-Message-State: ACgBeo0s4UEn5UBOYXE+80bmmIHSasBGchvbz4xaPybXnU2rZyBumokc
 9lbeL/+JZZn0AlWqSOgAKbVxuyBdsGZ8Mg==
X-Google-Smtp-Source: AA6agR6ibQzDXEqwKBDBrohPkPd5ixQ4nVnm8ylyS/+b+wCOjny0cwZi2Z4lGkytmtl7nX76yYP51Q==
X-Received: by 2002:a05:6870:b148:b0:112:cfe1:5062 with SMTP id
 a8-20020a056870b14800b00112cfe15062mr137113oal.297.1660682062731; 
 Tue, 16 Aug 2022 13:34:22 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 07/33] accel/tcg: Use bool for page_find_alloc
Date: Tue, 16 Aug 2022 15:33:34 -0500
Message-Id: <20220816203400.161187-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
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
index 298277a590..596029b26d 100644
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


