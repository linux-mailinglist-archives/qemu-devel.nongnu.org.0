Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890986CCDC2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 00:59:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phIGl-0006uN-KU; Tue, 28 Mar 2023 18:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGg-0006t5-DW
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:18 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGe-00074I-LG
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:18 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 lr16-20020a17090b4b9000b0023f187954acso14260331pjb.2
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 15:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680044295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7lQNHN36cq4JX4MpVuNitP2N8g4BnbyjtKLtJ8yHuJE=;
 b=EDVmEBixoqKCsNzfT33au9L9b1ZaunRZbLgP7crJMv2AJXNSF5qhOAFpzLFlk8f1Cr
 VQLKDptRMChSq3GD0s/aMxe2RZU5VYvHchHb39y0VGnfUhXPAz2FzYycmk4lGpXjt3PV
 52q7bk0VyaeHoHlqeitUrVJIgTanM5MpR4a9+WFTcpFgl4SUzGVRJ7uDBp6mF/KcWAQb
 hncaAmoYH8gAqquLNAfpgo8qJBGyjQ5ZK+E7cYb6coREe6/T7z2uZN8wOYDYAzFO0eud
 Jtm34Qz0BYdMWXWOH+E7DRAnlAqnVbr3tay5Q8GwsMf3CqyhaRhmaCH1HIVf0uJeX3rt
 pNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680044295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7lQNHN36cq4JX4MpVuNitP2N8g4BnbyjtKLtJ8yHuJE=;
 b=jOTCK9g76g93yZP5woLFVl//U6T0cZA/W/SYAW6nzqA3e8cnNJFyUe9467TucLykrq
 jKoU+aCEn8rgB4QrBeJoQ2twe6xxfQhP60XofaarGhKTgIWVArQ5t7MLXSten55cX+LN
 PnIycdIpu+X58fa+LDeCnNg02xRfiuAOzoScspq8Z3xO9LNsyyn0wKgTJWq5/qa4qZ9i
 btTvKYh2qiAt943a2YhPxClVJIeLUmSwwkw0qBHnRnWe19SEBBK1pPiMJAuLB/4EnQGn
 HOTePvx3YHUSy1XqIyLuoflNMrVTGMPg7bmDergRAOcQ6/CIsATzhSDxfxdFDnVfwS+Q
 FFdw==
X-Gm-Message-State: AAQBX9ful5nFXQJ1jRgQj1OCtPYbGxzO8DF2GAi8Sk1djQPQBnVJ5AMI
 GpiBHWqyN9QzNqzVc9SlfN/B1Ndtqt6NbEdjVy0=
X-Google-Smtp-Source: AKy350ZvoKt6k39YF61gz2/DUQHQvxpuuNzKW915vMLgU4t5KUwvUbF3s4DxrzBtSRdC/X9L/1GtbA==
X-Received: by 2002:a17:902:f547:b0:1a1:7899:f009 with SMTP id
 h7-20020a170902f54700b001a17899f009mr244699plf.17.1680044295371; 
 Tue, 28 Mar 2023 15:58:15 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:c23d:b6:6be1:f147])
 by smtp.gmail.com with ESMTPSA id
 jw1-20020a170903278100b0019cd1ee1523sm21670633plb.30.2023.03.28.15.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:58:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 08/15] accel/tcg: Pass last not end to
 tb_invalidate_phys_page_range__locked
Date: Tue, 28 Mar 2023 15:57:59 -0700
Message-Id: <20230328225806.2278728-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328225806.2278728-1-richard.henderson@linaro.org>
References: <20230328225806.2278728-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-maint.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 57da2feb2f..74823ba464 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -1084,35 +1084,33 @@ bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
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
@@ -1165,7 +1163,7 @@ void tb_invalidate_phys_page(tb_page_addr_t addr)
     start = addr & TARGET_PAGE_MASK;
     last = addr | ~TARGET_PAGE_MASK;
     pages = page_collection_lock(start, last);
-    tb_invalidate_phys_page_range__locked(pages, p, start, last + 1, 0);
+    tb_invalidate_phys_page_range__locked(pages, p, start, last, 0);
     page_collection_unlock(pages);
 }
 
@@ -1192,7 +1190,7 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
             continue;
         }
         assert_page_locked(pd);
-        tb_invalidate_phys_page_range__locked(pages, pd, start, bound, 0);
+        tb_invalidate_phys_page_range__locked(pages, pd, start, bound - 1, 0);
     }
     page_collection_unlock(pages);
 }
@@ -1212,7 +1210,7 @@ static void tb_invalidate_phys_page_fast__locked(struct page_collection *pages,
     }
 
     assert_page_locked(p);
-    tb_invalidate_phys_page_range__locked(pages, p, start, start + len, ra);
+    tb_invalidate_phys_page_range__locked(pages, p, start, start + len - 1, ra);
 }
 
 /*
-- 
2.34.1


