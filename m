Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD973368C2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:34:10 +0100 (CET)
Received: from localhost ([::1]:58508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9HF-0002Mb-1g
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95x-0004we-4h
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:29 -0500
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33]:34422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95r-0001Nl-Ge
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:28 -0500
Received: by mail-oo1-xc33.google.com with SMTP id
 j10-20020a4ad18a0000b02901b677a0ba98so260470oor.1
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bg/ftYJpZmIv5dqq+Yn+4tV/QrT7/G+XyqQDNfj556Y=;
 b=Z1Yz6zNb9Piac7DRb1/1IngOm+HfFt82DkqzxWKny/D+jvd5vQthm6UO0kd5f9AN1o
 B2FsFVcABK2Rz49pc1bus9Q4NJmlTTNEpxAhQXvAAaifSLbULJc8i82A1alTaH3XGHD4
 PAmDkj6+pTeQ+74uhdgO8/bqqiH02zw74QIl7Cbq8w2+7zBLD+td0X8bCabmDtfq2/6m
 rhM+YA0JBf2tCeF9IdqSjOIx0T+MZbewFUldcsa/YnSpX1jT3HzqWcLf+JnkohxMveTg
 RlYAdSkggKqyllFe3yfXnaNhCnqF7qkKQbFD4mkAKu8MaU/fqP3pG66vVqEOSoDDvaPf
 fq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bg/ftYJpZmIv5dqq+Yn+4tV/QrT7/G+XyqQDNfj556Y=;
 b=C3rBok2wf9/xC20mtj8kZagy3gq6pJbFtPTJhE7xO7TMYYOVKTvcjFfGvvroqQd5N2
 v5KkMj/b7OPEv3atjvpRSKcbF2tQuj/WZifkztlXZ/jaAaWQTkIstvaX3zaWEAxNItAK
 6PnxzxGLoWTfjoTUMhDKC1Eoc02LK6gzRpGB5Y1Js19fyx9SombQf2T6pbZUQjc3cz75
 BVBXMLowoEpEPMf0l2ojETPWIRTJGI9ZhHcrKeDUA1c/+dwoBoZSWtVxrBGXT6VAwsgk
 BJS5uu+Azix/6a7uDiMHmbJxnA+t58ZwFFJONANqidtPETcdpu9GDpLGeZg/peucDbG9
 Z6UA==
X-Gm-Message-State: AOAM530sNjZpKEqnMk6cdIXDWRKkZooJVKCjKZa9a7XMIc0DNioOcc9p
 5CRCHXsy2NXcES7kit6eAhusc0A9XjbDw4wl
X-Google-Smtp-Source: ABdhPJwVm+7yAO/40hVJHwRFVQFgWE+5lZ15z7Xa4AAqAs5Cir2P9+YjGSEQr8svy/b7pElpxUam1w==
X-Received: by 2002:a4a:a1a1:: with SMTP id k33mr4446752ool.34.1615422140306; 
 Wed, 10 Mar 2021 16:22:20 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/26] tcg: Replace region.end with region.total_size
Date: Wed, 10 Mar 2021 18:21:47 -0600
Message-Id: <20210311002156.253711-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc33.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A size is easier to work with than an end point,
particularly during initial buffer allocation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 8fba0724e5..7fb24f6b60 100644
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
@@ -810,8 +810,8 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
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
@@ -824,19 +824,20 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
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
@@ -850,9 +851,11 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
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
 
     /* set guard pages */
     splitwx_diff = tcg_splitwx_diff;
@@ -890,7 +893,7 @@ void tcg_region_prologue_set(TCGContext *s)
 
     /* Register the balance of the buffer with gdb. */
     tcg_register_jit(tcg_splitwx_to_rx(region.start),
-                     region.end - region.start);
+                     region.start_aligned + region.total_size - region.start);
 }
 
 /*
@@ -931,8 +934,10 @@ size_t tcg_code_capacity(void)
 
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


