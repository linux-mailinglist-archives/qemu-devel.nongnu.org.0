Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F04E6BED72
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 16:56:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdCQI-0002od-Hv; Fri, 17 Mar 2023 11:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdCQB-0002nX-Mp
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:55:11 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdCQ9-0007zO-Jw
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:55:11 -0400
Received: by mail-pj1-x1029.google.com with SMTP id x11so3712773pja.5
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 08:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679068508;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wsQ/JfArB2BnOMGVj/Z41DP1gayMJPyf6K8wTYkX29M=;
 b=YUu6MXo4K0YQ65YfkNr4WeIACGfGVoZk+BdtENPQ9FeV45Td811XmU8CP6QdNd3nEY
 g94uXYXrBfcIS6sKwoLGwGEKxS46/YDZXkeWQauNe1Ou4trqJK6l44NBa7KzLHVRixl3
 dzExDpzhMLsc/0CgQsZXatyJNbwyyAyrnNIeQZwJzURpJPEOvq4iR5mXMG5oRxMIc7Gx
 dY7YpHzWrZUL+XSl3TySjC+Y9xyHzubU1DQRxhwvCNUpzobN9hDGpyEEWy+O6uA0SBhs
 scKqKwzH7Q0heZfdjMs4WmB0U37xFKc8N1A4pE4gOpF8W8Cy5i+DgzKPp7JLE9oQ4dei
 ZKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679068508;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wsQ/JfArB2BnOMGVj/Z41DP1gayMJPyf6K8wTYkX29M=;
 b=JWO07zVh2EDJsAHHtPGv6SktwMfxvluweVSZf8Z0p5NeeHK2iNagCIGrG4dDEX8RHz
 okK2ixjnUb/SZbL56xxzB3RAcpkJdgL5+iTZ4r/bKY0PDpLdtObsEFqxn9F7cwmiuSCw
 KiuaouveqtK0cZjIhYxzcP0oJ1HKvibbiVI/V5rCJiaowud5wyKwgrTvYv74zkM4/bGj
 dEi4ZqSF9qImpcb0vwzekNd6gwLtNxN/s9Ctx3h+d/V8+sqgP3CV/PBp4tzP01i4/A7P
 ZYVHx70Tn5nkKGuvcT/Zk4qh0P07amKRIj4yqLJufD5D8oH5XDGQx5KNukRWscTb15ma
 H1qw==
X-Gm-Message-State: AO0yUKWfAMc5N8aAYyXg7sth5bpQoGUTEpupzzK1XfpUKbz3GZz31V8C
 zw+h8OflnLTW/LymAE63MLBbLLz9SAG/NzadVP0=
X-Google-Smtp-Source: AK7set/qCll5uC/XPpSCCntmDVszmhi7hmQztNVXHx+jgG2p5bD/uEUribUR8RCAFnSV9Xak9KOD+A==
X-Received: by 2002:a05:6a20:7d8b:b0:cd:49a4:305d with SMTP id
 v11-20020a056a207d8b00b000cd49a4305dmr9376219pzj.11.1679068507852; 
 Fri, 17 Mar 2023 08:55:07 -0700 (PDT)
Received: from stoup.. (96-82-119-43-static.hfc.comcastbusiness.net.
 [96.82.119.43]) by smtp.gmail.com with ESMTPSA id
 s5-20020a656445000000b004fb3e5681cesm1668986pgv.20.2023.03.17.08.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 08:55:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PATCH v2 8/9] accel/tcg: Pass last not end to
 tb_invalidate_phys_page_range__locked
Date: Fri, 17 Mar 2023 08:54:54 -0700
Message-Id: <20230317155455.341843-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230317155455.341843-1-richard.henderson@linaro.org>
References: <20230317155455.341843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
index cc23f7fa45..99c0e708ba 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -1083,35 +1083,33 @@ bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
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
@@ -1164,7 +1162,7 @@ void tb_invalidate_phys_page(tb_page_addr_t addr)
     start = addr & TARGET_PAGE_MASK;
     last = addr | ~TARGET_PAGE_MASK;
     pages = page_collection_lock(start, last);
-    tb_invalidate_phys_page_range__locked(pages, p, start, last + 1, 0);
+    tb_invalidate_phys_page_range__locked(pages, p, start, last, 0);
     page_collection_unlock(pages);
 }
 
@@ -1191,7 +1189,7 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
             continue;
         }
         assert_page_locked(pd);
-        tb_invalidate_phys_page_range__locked(pages, pd, start, bound, 0);
+        tb_invalidate_phys_page_range__locked(pages, pd, start, bound - 1, 0);
     }
     page_collection_unlock(pages);
 }
@@ -1211,7 +1209,7 @@ static void tb_invalidate_phys_page_fast__locked(struct page_collection *pages,
     }
 
     assert_page_locked(p);
-    tb_invalidate_phys_page_range__locked(pages, p, start, start + len, ra);
+    tb_invalidate_phys_page_range__locked(pages, p, start, start + len - 1, ra);
 }
 
 /*
-- 
2.34.1


