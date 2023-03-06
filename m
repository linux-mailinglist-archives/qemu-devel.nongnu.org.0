Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FEA6AB492
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 03:14:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ0Lp-0003PU-MF; Sun, 05 Mar 2023 21:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Lm-0003My-Tg
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:18 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ0Ll-00062c-5a
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:13:18 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so11733897pjb.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 18:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678068796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hueqYlY00i1W4vP3ESdohw7VNMjowjLFHkyPNqqchh8=;
 b=L7sEcQ+g15DfEM5vfV2YcrIPLAB7rLnVn+yC5NOreQ3KoxvRVvvrL2hCIiIw3OV674
 ecsR2Wu8KYut9J09F1kLtLEEBot/7FcycLpSqmEkRBEi4GiL4BbrEQZGamxVVjNBEg6n
 zkEfuNNkA0whES8D5VB9gk6wyR4Ti6pppdqHs9T+TWoTTe2NiP9mgigKuId/G95T8hFX
 nkoWYBDaNXGwlEa1LII08CWCLTPAE775YY6KIJTkYWYf1lJpUAa8W+bkRAHSoclhbWe3
 ctQo1AXxHRp/I+nv3YMztoruB3Je4QTOUeIuoIb2rkbmVs+5slXnY2CN7Fv2VvEOXAC/
 XQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678068796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hueqYlY00i1W4vP3ESdohw7VNMjowjLFHkyPNqqchh8=;
 b=PIq47nVlaqCjmMmiljGGLUMtYc3mVIflK02+abeYXxmqAshohEXxRiDOefFsu1xglt
 ZGM//QKZjM8vljzQnrUA9IFe52malsl0r6aaTKCfgWIJkjrodwlbNRfPahTGCR1GPSY2
 g+D/vuqAFQVLde/WnRBr1FCezAQ0ZfmSZW8E3tnX6AU5X5dEKHGVHErL/mnlYwGVxhcS
 LWlnlfuuBKEhffgg6YrpEy4g5VeACCLb9o2mhv54hG/mW93d2OiwlmAFX9fV/QFPTKJI
 Lpwf6TTeM96VmOtZZ45bQKAKpnC8aflHrWR+U2HHbDqWeUN+yfBg4VRjEjJcskVwooIc
 l7UQ==
X-Gm-Message-State: AO0yUKUAkydmJlTpvRAS0drPDrpB1LNS0AtUDnFjl8/rIVA8sjI4FbHW
 PQJWbxyetNXBOiSsIOuZyNzCKSiVBq22K9ago0g48A==
X-Google-Smtp-Source: AK7set8QKhjpcrlh7mu+1x0A6FPi/um2ILowedUGh62+XN6jQISGRNhPc6sShFjzqm7vsMNCj3+7yg==
X-Received: by 2002:a05:6a20:12d4:b0:cc:beae:c2c2 with SMTP id
 v20-20020a056a2012d400b000ccbeaec2c2mr11047746pzg.1.1678068795739; 
 Sun, 05 Mar 2023 18:13:15 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a630e12000000b005030136314dsm5048434pgl.71.2023.03.05.18.13.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 18:13:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] accel/tcg: Pass last not end to
 tb_invalidate_phys_page_range__locked
Date: Sun,  5 Mar 2023 18:13:06 -0800
Message-Id: <20230306021307.1879483-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306021307.1879483-1-richard.henderson@linaro.org>
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Properly truncate tb_last to the end of the page; the comment about
tb_end being past the end of the page being ok is not correct,
considering overflow.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-maint.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index c4e15c5591..a93c4c3ef7 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -1082,35 +1082,33 @@ bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
 static void
 tb_invalidate_phys_page_range__locked(struct page_collection *pages,
                                       PageDesc *p, tb_page_addr_t start,
-                                      tb_page_addr_t end,
+                                      tb_page_addr_t last,
                                       uintptr_t retaddr)
 {
     TranslationBlock *tb;
-    tb_page_addr_t tb_start, tb_end;
     PageForEachNext n;
 #ifdef TARGET_HAS_PRECISE_SMC
     bool current_tb_modified = false;
     TranslationBlock *current_tb = retaddr ? tcg_tb_lookup(retaddr) : NULL;
 #endif /* TARGET_HAS_PRECISE_SMC */
-    tb_page_addr_t last G_GNUC_UNUSED = end - 1;
 
     /*
-     * We remove all the TBs in the range [start, end[.
+     * We remove all the TBs in the range [start, last].
      * XXX: see if in some cases it could be faster to invalidate all the code
      */
     PAGE_FOR_EACH_TB(start, last, p, tb, n) {
+        tb_page_addr_t tb_start, tb_last;
+
         /* NOTE: this is subtle as a TB may span two physical pages */
+        tb_start = tb_page_addr0(tb);
+        tb_last = tb_start + tb->size - 1;
         if (n == 0) {
-            /* NOTE: tb_end may be after the end of the page, but
-               it is not a problem */
-            tb_start = tb_page_addr0(tb);
-            tb_end = tb_start + tb->size;
+            tb_last = MIN(tb_last, tb_start | ~TARGET_PAGE_MASK);
         } else {
             tb_start = tb_page_addr1(tb);
-            tb_end = tb_start + ((tb_page_addr0(tb) + tb->size)
-                                 & ~TARGET_PAGE_MASK);
+            tb_last = tb_start + (tb_last & ~TARGET_PAGE_MASK);
         }
-        if (!(tb_end <= start || tb_start >= end)) {
+        if (!(tb_last < start || tb_start > last)) {
 #ifdef TARGET_HAS_PRECISE_SMC
             if (current_tb == tb &&
                 (tb_cflags(current_tb) & CF_COUNT_MASK) != 1) {
@@ -1163,7 +1161,7 @@ void tb_invalidate_phys_page(tb_page_addr_t addr)
     start = addr & TARGET_PAGE_MASK;
     last = addr | ~TARGET_PAGE_MASK;
     pages = page_collection_lock(start, last);
-    tb_invalidate_phys_page_range__locked(pages, p, start, last + 1, 0);
+    tb_invalidate_phys_page_range__locked(pages, p, start, last, 0);
     page_collection_unlock(pages);
 }
 
@@ -1190,7 +1188,7 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
             continue;
         }
         assert_page_locked(pd);
-        tb_invalidate_phys_page_range__locked(pages, pd, start, bound, 0);
+        tb_invalidate_phys_page_range__locked(pages, pd, start, bound - 1, 0);
     }
     page_collection_unlock(pages);
 }
@@ -1210,7 +1208,7 @@ static void tb_invalidate_phys_page_fast__locked(struct page_collection *pages,
     }
 
     assert_page_locked(p);
-    tb_invalidate_phys_page_range__locked(pages, p, start, start + len, ra);
+    tb_invalidate_phys_page_range__locked(pages, p, start, start + len - 1, ra);
 }
 
 /*
-- 
2.34.1


