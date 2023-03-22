Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B02F6C4F00
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:09:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf04f-0003Ke-8D; Wed, 22 Mar 2023 11:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf04J-00031I-CR
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:08:03 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf04H-0007LB-DU
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:08:03 -0400
Received: by mail-pj1-x1029.google.com with SMTP id l7so1731342pjg.5
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679497677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7lQNHN36cq4JX4MpVuNitP2N8g4BnbyjtKLtJ8yHuJE=;
 b=MflxYJOxIJIARWIPMDZRefRtzZfMoCmTzUISF2fxavT/eM0hXocv7oLPLRkk8FRsmh
 vmyLMPQZZu+InlCg9ZDKaYcBIYJTQ48/9WDYOoLkceIfX4Zc7itBZY3d+4gyMXt7xjfK
 coNR0h3LagNSgTd6tlr4xu0z9DDecj0aIW+Wm9Qc8KG/16WxxQUkNTZBogaWQfIluuwZ
 w6PlaNQ5D35K4WYInS/sOUNmRlLR88XkakXJK0bYMLwYqMiFXh3kceBP5S+MoO6M7dpT
 sqNzGa06PSS/nXLfisRRT/vaDa2uqQ122ZA90ISTDqZkkXo/lAW+wgAAEpyfPo5xw+wV
 LgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679497677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7lQNHN36cq4JX4MpVuNitP2N8g4BnbyjtKLtJ8yHuJE=;
 b=qJzIeYQewTR7P/G6grfO8iwkLB1mIodan+lQ2/6gpbfqif0qJfUI/YA9OP+SMs4gfa
 TimCSES72YY94az1Ywz2/6mn6Y7ivS1sCdVs0GJyhRx9MM2ZVstZyJ0V0cPDh+cH+1jl
 2ty6uYf31dAnnDPnPTnA/7BwkYM1MHTJwzyXMenUcYNVJQ95WCoKjhePa/kDoroVAckX
 P8DSmR67RzO0N0nqCNnyfwXxiwYrgf8J8yEDMc/H2evYthdDulDMO8+rw95y7P0ndGuC
 X22KzRuWOngMpWi/pgOaOTSK5+Xt8z2FsOV2lNDT0AcNgBFF8VJSG8hiAFpYiEh8zCob
 EmVg==
X-Gm-Message-State: AO0yUKUFp+vXYhvco2ocfNj4YWoo0PgbuQfvrHCZJAdiTcW8zLC5yTJY
 E9uppniUiYx6g2qP8ppHh1e6kxIWepwmjonEDj4=
X-Google-Smtp-Source: AK7set8BeCuAxRfaDEXV3qgMRFzAtJM4pMfUmGLkflEFtTPVkrJzpxTUO2+fbkWsvskY1PUnLN+u7A==
X-Received: by 2002:a17:902:c613:b0:1a1:e33e:2606 with SMTP id
 r19-20020a170902c61300b001a1e33e2606mr2456361plr.25.1679497677592; 
 Wed, 22 Mar 2023 08:07:57 -0700 (PDT)
Received: from stoup.. (24-113-166-229.wavecable.com. [24.113.166.229])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b0019339f3368asm10757555plo.3.2023.03.22.08.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 08:07:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0 09/11] accel/tcg: Pass last not end to
 tb_invalidate_phys_page_range__locked
Date: Wed, 22 Mar 2023 08:07:42 -0700
Message-Id: <20230322150744.175010-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322150744.175010-1-richard.henderson@linaro.org>
References: <20230322150744.175010-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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


