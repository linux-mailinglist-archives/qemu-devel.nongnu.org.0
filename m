Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74FD5F468E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 17:22:03 +0200 (CEST)
Received: from localhost ([::1]:56138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofjkA-0004US-De
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 11:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidg-0002qr-Bw
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:17 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:41495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofide-0004PI-M8
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:16 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 x32-20020a17090a38a300b00209dced49cfso10648604pjb.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cLUCkFTb6+JnLlWzn7HnttSYfDBpIhciH0RgPU16KNQ=;
 b=mhogLRbXv6FJrqbHqDhqTHBgtbcEBYeaxsralmTapSob74gC2iGDujPAF2kT5Nfq+H
 2dpkm84gZCE3cYIQXqPKUHNceRiOuY72W2bKOwihS8d8RqXj8aIMlV+bDKCnY+Fju84p
 /zjsgg1Jft85rdTvEdzT456x1ebDys0Tf3zJ/bL+8YXjQ2+AVpMxcybhqwCOzR30lIpl
 TNBMxiLA0BtHWuJyihhAG3nyTobjVrcW1TlU6jsutlA9qv1Y5SVvuToxyrJoBtbMU9jF
 F7S6LAzdP8aP974oqVaojZjZJjIRkVKVrlClLz2ZN0xEyMdkobc7fStWFnKvlD890ZTS
 wf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cLUCkFTb6+JnLlWzn7HnttSYfDBpIhciH0RgPU16KNQ=;
 b=WKNeK9iPSTsqIPuehZb6Bxwe+qvbT+0YXI6d7fLMZVkNQigNkPAmVjR6+S6o0o4gC3
 uNG870H0gPAnP4hjfWkQq1wNl6uUaFw1sutkiBT8I8xM1vrq8wt8mH5NpqkeUgFmLTx0
 wc5U4NXvSWmZk4j3YT7OerD6K4pdfYXFkgYUOe52W5Cr64CHfJg9u0g1wDyiP6img++G
 iWoabxpkhlJnGSOPxsm3iA7jnISBI/VlVko2xA25DYBxZB/1vscZd78+AzUIY9jXTEnY
 EftgjcHNVaTdnpyBtquMx9MS0/iO2GDbHfSpqUIPC3e/vdtKlaZtUIu/HLu8vZKAFPeL
 FReg==
X-Gm-Message-State: ACrzQf3qfXqKABFtnBuw7xnMgg0j7bSolSL5P/+u+8nYuq5K6tbklYnl
 mtV0wKvHbmo2me/6u7skxJK5Fd/R+ew7wg==
X-Google-Smtp-Source: AMsMyM7qtIeOInD8fuzNKtxrz0Owk7uEL+oERShm1etLjJBgl8tkWWNezQTl1MYPpga6q3erwoRNbw==
X-Received: by 2002:a17:90b:3b91:b0:202:91d7:6a5d with SMTP id
 pc17-20020a17090b3b9100b0020291d76a5dmr17175206pjb.101.1664892673248; 
 Tue, 04 Oct 2022 07:11:13 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa79ae5000000b00561382a5a25sm1240357pfp.26.2022.10.04.07.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 07:11:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 11/18] accel/tcg: Use bool for page_find_alloc
Date: Tue,  4 Oct 2022 07:10:44 -0700
Message-Id: <20221004141051.110653-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004141051.110653-1-richard.henderson@linaro.org>
References: <20221004141051.110653-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Bool is more appropriate type for the alloc parameter.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 59432dc558..ca685f6ede 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -465,7 +465,7 @@ void page_init(void)
 #endif
 }
 
-static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
+static PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
 {
     PageDesc *pd;
     void **lp;
@@ -533,11 +533,11 @@ static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
 
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
@@ -651,7 +651,7 @@ static inline void page_unlock(PageDesc *pd)
 /* lock the page(s) of a TB in the correct acquisition order */
 static inline void page_lock_tb(const TranslationBlock *tb)
 {
-    page_lock_pair(NULL, tb->page_addr[0], NULL, tb->page_addr[1], 0);
+    page_lock_pair(NULL, tb->page_addr[0], NULL, tb->page_addr[1], false);
 }
 
 static inline void page_unlock_tb(const TranslationBlock *tb)
@@ -840,7 +840,7 @@ void page_collection_unlock(struct page_collection *set)
 #endif /* !CONFIG_USER_ONLY */
 
 static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
-                           PageDesc **ret_p2, tb_page_addr_t phys2, int alloc)
+                           PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc)
 {
     PageDesc *p1, *p2;
     tb_page_addr_t page1;
@@ -1290,7 +1290,7 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
      * Note that inserting into the hash table first isn't an option, since
      * we can only insert TBs that are fully initialized.
      */
-    page_lock_pair(&p, phys_pc, &p2, phys_page2, 1);
+    page_lock_pair(&p, phys_pc, &p2, phys_page2, true);
     tb_page_add(p, tb, 0, phys_pc & TARGET_PAGE_MASK);
     if (p2) {
         tb_page_add(p2, tb, 1, phys_page2);
@@ -2219,7 +2219,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     for (addr = start, len = end - start;
          len != 0;
          len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
-        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
+        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, true);
 
         /* If the write protection bit is set, then we invalidate
            the code inside.  */
-- 
2.34.1


