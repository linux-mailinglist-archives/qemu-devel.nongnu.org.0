Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1245E92A4
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:17:11 +0200 (CEST)
Received: from localhost ([::1]:54158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocPdG-0007oc-3Y
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPF2-0003AO-Td
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:52:10 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:36764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPF1-0000Ny-CO
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:52:08 -0400
Received: by mail-qt1-x834.google.com with SMTP id h21so2609544qta.3
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=t8g2NigUHYP8ExVOle9lzfEDrD9urqWPbeXGUQKl61M=;
 b=Y+l5fLoBF6h81ctszsWATURjCwduet+AbcBBgsIXC4Oe7US0U807M3clrP5/nV6jW9
 4aAAwbgVDN6t/ypS9KMzhIOMALbLdYPpzMVnFitquS+8Q9pkOhCmQzx28QaF2lPC6Kmb
 cmrcclj/6eILqFmWxzbqWz3IrPCNOq2fHHSAFJ+PGFiWA0zw4MWA1t+UVef0JucgOPXL
 pef++ndxzIlN8Qx66k7aG/sSjDPMfrdkjyYkAOflDNLl2MwsuNF5fVSDeMBJbcNtmtJz
 N6eRemPG/7wJCKqeZI31VJSlk2mq+sIqQv1igktD0mUlAoq+pQ5ne3OjaXKT07aJaBky
 dmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=t8g2NigUHYP8ExVOle9lzfEDrD9urqWPbeXGUQKl61M=;
 b=6kDqubVtVYpEZOweA0n3zm/KC0lefMkhid7MpA4+X5gwouOlDBOh6UWDfXRsxeyZkf
 mZhAw1Z9xTpUoes0SArk+9XZcbiXZ8GLbaWtJzyjxBLC0Xj9tUmdhskxaoy6f0uMmrk/
 dIpjGHeztpgr+bCJK9iaxDU/bEkPloCGWHPtIgutWs+MapwbaIXqlWSUTKMPbpAueFml
 3ptr0fjXUocctXYvDYPRReNvf1cq0Goy5LBBgeGc+ElAaCu6ZF/7eyJOiUfVuLBmh7ID
 nWc9blIeBfTNA1rpYpPPxmpRAk1bHYWHvXTerNmHUBmq+mQ1MFyXbddL5kRNwivk/Lwi
 031A==
X-Gm-Message-State: ACrzQf10KZ27AEI32xO6dXdmS2cLZy88wnHF+Wq5mUaiDgbwyIn83/oo
 syiAicsOAz6UDVjUDNnDxOx/mlq5ILd+Mg==
X-Google-Smtp-Source: AMsMyM6y3Yscbmm4GVezaQQzk9HwJ/g+ZTPQFzCYZOM5a71ScvUs2ang+hR/UKyc7lsXVHabd6grOw==
X-Received: by 2002:a05:622a:164a:b0:35c:b87f:4839 with SMTP id
 y10-20020a05622a164a00b0035cb87f4839mr13896076qtj.219.1664103126215; 
 Sun, 25 Sep 2022 03:52:06 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a9:5c0e:1ec2:d482:4986:8538])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a0c4f00b006cf19068261sm10061132qki.116.2022.09.25.03.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 03:52:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 11/17] accel/tcg: Use bool for page_find_alloc
Date: Sun, 25 Sep 2022 10:51:18 +0000
Message-Id: <20220925105124.82033-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925105124.82033-1-richard.henderson@linaro.org>
References: <20220925105124.82033-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
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
index 9046ea80f7..69f39d669d 100644
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


