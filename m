Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2212531734A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:26:35 +0100 (CET)
Received: from localhost ([::1]:51312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xwQ-0003Px-1M
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xqD-0006uu-Ax
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:20:09 -0500
Received: from mail-wm1-f52.google.com ([209.85.128.52]:40094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xqB-0006oP-Ci
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:20:09 -0500
Received: by mail-wm1-f52.google.com with SMTP id o24so3309081wmh.5
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zi1c0Q20m9EGw/QfIztoiD94DW+qzR6K9/2yw9fZmXc=;
 b=ewm8sO4qgysB3SiXiFdi3RDZCc1SKRY82XXvucpiIIG3DBtMlJ9HkovrH/GZAwm5J6
 B5DO7w7mwh5a6DIUXWqjouooUZ62Op/Yf2xhWcq687A7lJf5DziSvP7ur/kSAyyeK0sR
 xsSOZSVme4dXyxVyBvsfcaG01BdmxYMXLAiRt12LqirHG/hQxJnXhfUNysnIyVcs+Ht7
 ug35PYszpnLCvdA7S/Z6a+5pk4gudXnnlluDG4G6a1Ps5A4bqN/BuSImBfqoBx7ycvVF
 yO15V/GACRWbX8T/bwCNGafoxaexpJotub+PASVUOiwDh1OV+whjaXoupUpW37phqdTo
 Dp0w==
X-Gm-Message-State: AOAM532d9RIeAuajMropuHnWu60oZ69EJYw243brpoV4YL/l0GK9NAea
 tz34/C3jkzYZglo7MxVUlclkIg==
X-Google-Smtp-Source: ABdhPJzZJ3WRI8g82xIBBeot/afxddw7EyWHm3Bfq9s/LUjl7hovkctFbCn2nSHPL5GM17w5Ec3FLg==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr1230441wmc.43.1612995605733;
 Wed, 10 Feb 2021 14:20:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m2sm4329332wml.34.2021.02.10.14.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:20:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 57B311FFA5;
 Wed, 10 Feb 2021 22:10:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 18/21] accel/tcg: re-factor non-RAM execution code
Date: Wed, 10 Feb 2021 22:10:50 +0000
Message-Id: <20210210221053.18050-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.52;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-f52.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no real need to use CF_NOCACHE here. As long as the TB isn't
linked to other TBs or included in the QHT or jump cache then it will
only get executed once.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210209182749.31323-10-alex.bennee@linaro.org>
---
 accel/tcg/translate-all.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index b8ad95aa1b..7e62d8ad97 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1778,7 +1778,8 @@ static inline void tb_page_add(PageDesc *p, TranslationBlock *tb,
 #endif
 }
 
-/* add a new TB and link it to the physical page tables. phys_page2 is
+/*
+ * Add a new TB and link it to the physical page tables. phys_page2 is
  * (-1) to indicate that only one page contains the TB.
  *
  * Called with mmap_lock held for user-mode emulation.
@@ -1797,17 +1798,6 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
 
     assert_memory_lock();
 
-    if (phys_pc == -1) {
-        /*
-         * If the TB is not associated with a physical RAM page then
-         * it must be a temporary one-insn TB, and we have nothing to do
-         * except fill in the page_addr[] fields.
-         */
-        assert(tb->cflags & CF_NOCACHE);
-        tb->page_addr[0] = tb->page_addr[1] = -1;
-        return tb;
-    }
-
     /*
      * Add the TB to the page list, acquiring first the pages's locks.
      * We keep the locks held until after inserting the TB in the hash table,
@@ -1880,9 +1870,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     phys_pc = get_page_addr_code(env, pc);
 
     if (phys_pc == -1) {
-        /* Generate a temporary TB with 1 insn in it */
-        cflags &= ~CF_COUNT_MASK;
-        cflags |= CF_NOCACHE | 1;
+        /* Generate a one-shot TB with 1 insn in it */
+        cflags = (cflags & ~CF_COUNT_MASK) | 1;
     }
 
     cflags &= ~CF_CLUSTER_MASK;
@@ -2096,6 +2085,17 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         tb_reset_jump(tb, 1);
     }
 
+    /*
+     * If the TB is not associated with a physical RAM page then
+     * it must be a temporary one-insn TB, and we have nothing to do
+     * except fill in the page_addr[] fields. Return early before
+     * attempting to link to other TBs or add to the lookup table.
+     */
+    if (phys_pc == -1) {
+        tb->page_addr[0] = tb->page_addr[1] = -1;
+        return tb;
+    }
+
     /* check next page if needed */
     virt_page2 = (pc + tb->size - 1) & TARGET_PAGE_MASK;
     phys_page2 = -1;
-- 
2.20.1


