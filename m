Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E466CB087
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 23:20:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pguEg-00045s-LF; Mon, 27 Mar 2023 17:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEd-00043b-Ip
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:35 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEb-0005w9-81
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:35 -0400
Received: by mail-pl1-x634.google.com with SMTP id kq3so9706324plb.13
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 14:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679951911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8SVCaZUmE/Km0+IIG6EiSCxwnpR9ibdQSVxm7qmuBg=;
 b=ZJt6IFwsbTvqF7DeYJTesSKcfAeiTZDfQno1NOheRM9XyJTSOuht0iWGuLXFjZcQPA
 VjMcSBjZ5U8bHOgbrNCQ/dl6OJKO4c01LNpT/VMtRWyNmq2ifVVFln8KoZywX2DAQbFv
 42GyzdGrTmp/L7Bg/4wXtMAGXFnGruHeRelJjObWRu/pCi2ftYjRaKRqaPbDjwvL9Lyz
 YtiYzqD38iNijITiUTw/zZHUNrly9AzOjD+iLGf4b6TKkOtpqxRao693k8QmmCuvaoU4
 QJEVUm+3TX1F/DCSQpiGprjDWxS0LyDdvQrEiQ22hSCbjY4TEINxd+qjiaO98sRbu7/1
 36/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679951911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8SVCaZUmE/Km0+IIG6EiSCxwnpR9ibdQSVxm7qmuBg=;
 b=vbIPUqvZUdI7M7HdVmVndAc64FPVzVBt74u3aVCQdnw64rObVQEngW5dB9g1z+GUdL
 fxCONxZHcnBbJ+3HJbTkTNlFjkjiJzLH9g2hy0D41Hq7u3jjjKhPH6Mb/j+UVPE0xj1s
 ucpdp48pJSlONs5q2tiBdxWd1hSJZHwczRzfe/Dd9WS/qyTo779rZR14QN4iqMhzNHYH
 EpDTroGB09aJtDupu2hQRtjCA3iYyrbwQEhajNBoIeMyH1KYwp6AcbdZZ976NUmeeJCH
 Zi/mjQ6ExKulf6d8x/E3u3RqxryDQgJJmB7MT1t08v6BLmBPb8NCdmE3ZYGFGl741cws
 ek4g==
X-Gm-Message-State: AAQBX9eeBpUq5Kqpys197zfjqLbkCU8xgYYkANC//TgoFvjo5cIoMtqH
 wG6jJm8rquzr8nTJZD6XFvxtXM8j7rnmy6kqhsM=
X-Google-Smtp-Source: AKy350YdLYjBxuh5RgfWxxd/p2AZKfDz6Dx9hXCqr+WCn3NElD4+arEhPla9rxmEAZ4scnw45Pauzg==
X-Received: by 2002:a17:90a:ba08:b0:23d:5196:eca8 with SMTP id
 s8-20020a17090aba0800b0023d5196eca8mr13591345pjr.20.1679951911262; 
 Mon, 27 Mar 2023 14:18:31 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a17090a6f0200b0023440af7aafsm7902708pjk.9.2023.03.27.14.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 14:18:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH for-8.0 v2 06/12] accel/tcg: Pass last not end to
 PAGE_FOR_EACH_TB
Date: Mon, 27 Mar 2023 14:18:18 -0700
Message-Id: <20230327211824.1785547-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327211824.1785547-1-richard.henderson@linaro.org>
References: <20230327211824.1785547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-maint.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index a173db17e6..04d2751bb6 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -127,29 +127,29 @@ static void tb_remove(TranslationBlock *tb)
 }
 
 /* TODO: For now, still shared with translate-all.c for system mode. */
-#define PAGE_FOR_EACH_TB(start, end, pagedesc, T, N)    \
-    for (T = foreach_tb_first(start, end),              \
-         N = foreach_tb_next(T, start, end);            \
+#define PAGE_FOR_EACH_TB(start, last, pagedesc, T, N)   \
+    for (T = foreach_tb_first(start, last),             \
+         N = foreach_tb_next(T, start, last);           \
          T != NULL;                                     \
-         T = N, N = foreach_tb_next(N, start, end))
+         T = N, N = foreach_tb_next(N, start, last))
 
 typedef TranslationBlock *PageForEachNext;
 
 static PageForEachNext foreach_tb_first(tb_page_addr_t start,
-                                        tb_page_addr_t end)
+                                        tb_page_addr_t last)
 {
-    IntervalTreeNode *n = interval_tree_iter_first(&tb_root, start, end - 1);
+    IntervalTreeNode *n = interval_tree_iter_first(&tb_root, start, last);
     return n ? container_of(n, TranslationBlock, itree) : NULL;
 }
 
 static PageForEachNext foreach_tb_next(PageForEachNext tb,
                                        tb_page_addr_t start,
-                                       tb_page_addr_t end)
+                                       tb_page_addr_t last)
 {
     IntervalTreeNode *n;
 
     if (tb) {
-        n = interval_tree_iter_next(&tb->itree, start, end - 1);
+        n = interval_tree_iter_next(&tb->itree, start, last);
         if (n) {
             return container_of(n, TranslationBlock, itree);
         }
@@ -320,7 +320,7 @@ struct page_collection {
 };
 
 typedef int PageForEachNext;
-#define PAGE_FOR_EACH_TB(start, end, pagedesc, tb, n) \
+#define PAGE_FOR_EACH_TB(start, last, pagedesc, tb, n) \
     TB_FOR_EACH_TAGGED((pagedesc)->first_tb, tb, n, page_next)
 
 #ifdef CONFIG_DEBUG_TCG
@@ -995,10 +995,11 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
 {
     TranslationBlock *tb;
     PageForEachNext n;
+    tb_page_addr_t last = end - 1;
 
     assert_memory_lock();
 
-    PAGE_FOR_EACH_TB(start, end, unused, tb, n) {
+    PAGE_FOR_EACH_TB(start, last, unused, tb, n) {
         tb_phys_invalidate__locked(tb);
     }
 }
@@ -1030,6 +1031,7 @@ bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
     bool current_tb_modified;
     TranslationBlock *tb;
     PageForEachNext n;
+    tb_page_addr_t last;
 
     /*
      * Without precise smc semantics, or when outside of a TB,
@@ -1046,10 +1048,11 @@ bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
     assert_memory_lock();
     current_tb = tcg_tb_lookup(pc);
 
+    last = addr | ~TARGET_PAGE_MASK;
     addr &= TARGET_PAGE_MASK;
     current_tb_modified = false;
 
-    PAGE_FOR_EACH_TB(addr, addr + TARGET_PAGE_SIZE, unused, tb, n) {
+    PAGE_FOR_EACH_TB(addr, last, unused, tb, n) {
         if (current_tb == tb &&
             (tb_cflags(current_tb) & CF_COUNT_MASK) != 1) {
             /*
@@ -1091,12 +1094,13 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
     bool current_tb_modified = false;
     TranslationBlock *current_tb = retaddr ? tcg_tb_lookup(retaddr) : NULL;
 #endif /* TARGET_HAS_PRECISE_SMC */
+    tb_page_addr_t last G_GNUC_UNUSED = end - 1;
 
     /*
      * We remove all the TBs in the range [start, end[.
      * XXX: see if in some cases it could be faster to invalidate all the code
      */
-    PAGE_FOR_EACH_TB(start, end, p, tb, n) {
+    PAGE_FOR_EACH_TB(start, last, p, tb, n) {
         /* NOTE: this is subtle as a TB may span two physical pages */
         if (n == 0) {
             /* NOTE: tb_end may be after the end of the page, but
-- 
2.34.1


