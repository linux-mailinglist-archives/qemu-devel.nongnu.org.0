Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D71370FE2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:37:50 +0200 (CEST)
Received: from localhost ([::1]:60500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLen-0006sn-PG
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMd-0008Lx-Bs
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:05 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:33571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMa-0002wx-AX
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:03 -0400
Received: by mail-pf1-x42e.google.com with SMTP id h11so2993653pfn.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xx8tRHMyHl5/LaDMF0obGZKdN5Jc9YJNwYigENo1M50=;
 b=f9q+M7uK4Cl00bcg6ti/HakN55r6IJ4Tsvd5o7EVjfsQdGsT+enoLrtHiWVOCJ/4N7
 J+hXplJ0KqN/GkK9nnpvGvJ0iRXOf6n2+3vi4aY4RahFn+29U0G2Kh65hKkE0/k+g0PS
 3fTdWp+PJEAjQAGnGguGI6qNAEMFrQaPsj1OxBbXyXjJpN3+u4b0MRRL1QrxWEXtfkV+
 5gAtQkmiS2jzhm2blaLnG4l6JYa9WSogCQj+hCsSEmRiJ3+OylMjHksl5+CcucZSivfI
 6aNVMorVqNQTb91eQgag/MCk6nG3NtoecZ46ysZdwW0GqH9VCB4Tj1p/vkaQC4Ijj3fM
 WSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xx8tRHMyHl5/LaDMF0obGZKdN5Jc9YJNwYigENo1M50=;
 b=fvRAVRezBt4tfLybeTJ6YcF4xrphHQF7dpt+Wt0gcTNQIPGzgT+ocGt/2asWqNlzCd
 0NTD1w9tyEmVPqwaSh5syxh3ENyey4uRo1ldejZAnhSbiNXfuK33hr20kanmENeyoUBD
 a1ftVAwB6PV6OhPwqdzeJv6vc/zPiEvmP/aXFvQtAdghzcQWpTI03sh6HHuOUc4qEbxL
 QK9LcYGeOnT2JLpNDNHgVVrW3DvCjGYGFL6tgSftSdmBJLZ5ehcH57lRx0Rrfzpytg5V
 Y2wqVsZOsFmxPX/nUmeaEwpWSvQuYZwA0VWAg8p6DNGmnH/eHfbypUzEHKFxIPcRVH/7
 l8+w==
X-Gm-Message-State: AOAM533Akxiv0kkaPiWk1r0YPIRW9XBogFwqAS5ZvXcQLOPo09x5xRhM
 wGSz/lXGm4UQpiR/SuHNPqHbxcyaD0sFuA==
X-Google-Smtp-Source: ABdhPJwFADiXOTcIrlG6P+dO0SiNAz1eSa2pTYla6aWy5DP6nYSRlMiCAbdGaDsV5o0icJpmxjGbyQ==
X-Received: by 2002:a62:754d:0:b029:289:11e7:4103 with SMTP id
 q74-20020a62754d0000b029028911e74103mr14416390pfc.25.1619997538205; 
 Sun, 02 May 2021 16:18:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/28] tcg: Replace region.end with region.total_size
Date: Sun,  2 May 2021 16:18:32 -0700
Message-Id: <20210502231844.1977630-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A size is easier to work with than an end point,
particularly during initial buffer allocation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 9a1e039824..a17f342f38 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -48,7 +48,7 @@ struct tcg_region_state {
     /* fields set at init time */
     void *start;
     void *start_aligned;
-    void *end;
+    size_t total_size; /* size of entire buffer */
     size_t n;
     size_t size; /* size of one region */
     size_t stride; /* .size + guard size */
@@ -279,7 +279,7 @@ static void tcg_region_bounds(size_t curr_region, void **pstart, void **pend)
         start = region.start;
     }
     if (curr_region == region.n - 1) {
-        end = region.end;
+        end = region.start_aligned + region.total_size;
     }
 
     *pstart = start;
@@ -813,8 +813,8 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
  */
 void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
 {
-    void *buf, *aligned;
-    size_t size;
+    void *buf, *aligned, *end;
+    size_t total_size;
     size_t page_size;
     size_t region_size;
     size_t n_regions;
@@ -826,19 +826,20 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     assert(ok);
 
     buf = tcg_init_ctx.code_gen_buffer;
-    size = tcg_init_ctx.code_gen_buffer_size;
+    total_size = tcg_init_ctx.code_gen_buffer_size;
     page_size = qemu_real_host_page_size;
     n_regions = tcg_n_regions(max_cpus);
 
     /* The first region will be 'aligned - buf' bytes larger than the others */
     aligned = QEMU_ALIGN_PTR_UP(buf, page_size);
-    g_assert(aligned < tcg_init_ctx.code_gen_buffer + size);
+    g_assert(aligned < tcg_init_ctx.code_gen_buffer + total_size);
+
     /*
      * Make region_size a multiple of page_size, using aligned as the start.
      * As a result of this we might end up with a few extra pages at the end of
      * the buffer; we will assign those to the last region.
      */
-    region_size = (size - (aligned - buf)) / n_regions;
+    region_size = (total_size - (aligned - buf)) / n_regions;
     region_size = QEMU_ALIGN_DOWN(region_size, page_size);
 
     /* A region must have at least 2 pages; one code, one guard */
@@ -852,9 +853,11 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     region.start = buf;
     region.start_aligned = aligned;
     /* page-align the end, since its last page will be a guard page */
-    region.end = QEMU_ALIGN_PTR_DOWN(buf + size, page_size);
+    end = QEMU_ALIGN_PTR_DOWN(buf + total_size, page_size);
     /* account for that last guard page */
-    region.end -= page_size;
+    end -= page_size;
+    total_size = end - aligned;
+    region.total_size = total_size;
 
     /*
      * Set guard pages in the rw buffer, as that's the one into which
@@ -895,7 +898,7 @@ void tcg_region_prologue_set(TCGContext *s)
 
     /* Register the balance of the buffer with gdb. */
     tcg_register_jit(tcg_splitwx_to_rx(region.start),
-                     region.end - region.start);
+                     region.start_aligned + region.total_size - region.start);
 }
 
 /*
@@ -936,8 +939,10 @@ size_t tcg_code_capacity(void)
 
     /* no need for synchronization; these variables are set at init time */
     guard_size = region.stride - region.size;
-    capacity = region.end + guard_size - region.start;
-    capacity -= region.n * (guard_size + TCG_HIGHWATER);
+    capacity = region.total_size;
+    capacity -= (region.n - 1) * guard_size;
+    capacity -= region.n * TCG_HIGHWATER;
+
     return capacity;
 }
 
-- 
2.25.1


