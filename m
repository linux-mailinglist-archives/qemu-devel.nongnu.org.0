Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C386CB083
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 23:19:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pguEh-00046E-VP; Mon, 27 Mar 2023 17:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEe-00044i-UU
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:36 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEd-0005wq-2j
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:36 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 mp3-20020a17090b190300b0023fcc8ce113so13147681pjb.4
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 14:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679951913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7lQNHN36cq4JX4MpVuNitP2N8g4BnbyjtKLtJ8yHuJE=;
 b=u6542RlUtm0RAqWUesOoJpQ0ckVGNHlJ8P9bEPA30gOwkgkcK2kuUBRrC2RuGWCTyp
 Q9lxayrWgmZDIbvSwZ1+hAdUMTeNkVYBZ+HLRjaWq5/jGkSD3TljzP4KuidhcnKRMu9n
 hi0ytnMm8ifDZXzOIFJ5E7aANS4eArlyktJ4t9NI8FNYIYB1ePcCx8qP96qgyHeqJAcc
 eK3wVxoWWUiwXq6w+RvQz8GtR5FTTcB3TImkeOT4icjE0aTeyX4P5W7783QK9wEe0cyO
 4qhCSZmvq9Ig2bIOrjC7QKB7q4zCh5J840RZWTZTk5DgP+3Kqsu2KCRyN3sx1arLX8/4
 KQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679951913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7lQNHN36cq4JX4MpVuNitP2N8g4BnbyjtKLtJ8yHuJE=;
 b=mreQskm3mzNX7tQPNtwjkPaOYE7CmALZaLf2uw2/3WIWY5HWeqHxs3CdyTzBWRhn3a
 eAw9DPwnD+hdv2mBIV7SJc0YgwPVIOlLbA3yHA4MDDI/K7tDtMkdIbfP3iri+86VedX6
 ifm40xDjMZbjW/2rw3ckkzmVzdwUel3BKHYwDYcAIjiaF7ue1AYbGPcHBXQGBOK1TVRZ
 xeq1SK9gXm4aznM11jMd8KKwieIs2Qw6Ooh3MNOFVJmOs/SMNG8aJ3Eh1aM4JXHWftRP
 ekweaxsacfdxf3OT5A7zSTy7Zv+2ux7nE2gq4TQ2d3XsPUapiJQyw0F03+nxfoDs7sdB
 nnfg==
X-Gm-Message-State: AAQBX9c8phvVmS1xrnxr23V/reySNDaDlTeA6yXEecSCk8Unh133HpoC
 hwRtz7Uc/PgwSQyqu9J3bVXiHKWvCmKj31Wo2Go=
X-Google-Smtp-Source: AKy350Z3GVx2zjbnYsMqse1u9ZtYOUzIAkfGaDFTKHbhmNP9sZn2ArZqUfwU7SpdytwtNEe/yzBbEQ==
X-Received: by 2002:a17:90b:4d12:b0:23d:c49:3875 with SMTP id
 mw18-20020a17090b4d1200b0023d0c493875mr15044961pjb.33.1679951913009; 
 Mon, 27 Mar 2023 14:18:33 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a17090a6f0200b0023440af7aafsm7902708pjk.9.2023.03.27.14.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 14:18:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH for-8.0 v2 08/12] accel/tcg: Pass last not end to
 tb_invalidate_phys_page_range__locked
Date: Mon, 27 Mar 2023 14:18:20 -0700
Message-Id: <20230327211824.1785547-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327211824.1785547-1-richard.henderson@linaro.org>
References: <20230327211824.1785547-1-richard.henderson@linaro.org>
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


