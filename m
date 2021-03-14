Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78D533A853
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:41:58 +0100 (CET)
Received: from localhost ([::1]:36760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYUn-00059l-Nh
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYHG-0006Jc-T4
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:59 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:40974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH9-0008HC-39
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:58 -0400
Received: by mail-qk1-x732.google.com with SMTP id x10so29909537qkm.8
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pGsgpXwTM6hxqYx7HXtoXmPFsuT3pbQk6IhBOzlzD0Y=;
 b=d6SrVOrgusSushCXa6lEK6+gpvsflECleEFk5qW/xBL5r+VNXe4I/d61j1/rUPkoDO
 EY35Wjpe9TEw0A2Hh/Tt3TpS9qQ97h22tyv4Uc1/lr8TqPQSC3hrOR1JhpjaK2HmZ9hP
 wjONXH44pR0uw6zZjlJvPJtAdSHUC4kKHrl4Hxu6w+9BctnweeF+W+u6TR3L9NvCZ+eP
 XHkftTYNtSU4Xx6BE1puQM8UXMZ7OSmT91HmcwgHTOpFYGYCtcevEzR/emBWoFIpXBpY
 6FD4aknhXKPJ0NZJow3r/cHkmYLWGwuVzjOqBq8EPgETQQNDmgtIoDXAWKStAOc58/OE
 8/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pGsgpXwTM6hxqYx7HXtoXmPFsuT3pbQk6IhBOzlzD0Y=;
 b=mHIS1RK6Vvg8UCCh2a4tsmVeIqVKENlpW5O+BMMQIxNpj7IB11JLYUdiDJp+7p7q6l
 aA8Ou5Hh2SAYolO0yAB/VqigRra3ozNjBVAUCTrb4wuq+452YM0J1XnXlyqLwRnF3Y3U
 1/Hsv6MK8+TZNTcWSYBhXnzDNIEvb/X0ofdLLQRPsgubzPCtCO6k3Z95JEJrdU85KmGA
 YNejU/QdomJ2Rpxudxuec3vz0nxB+yrtSSmujfmW2r2mQnLjQyhZrmSUxV+5Ct0CEkA2
 dn333eoyZR4akqHN1MML1aiS8DmRflMM9hn28ihygqHzI7HpQbMj6+cJ7U6nPhWdO7Y4
 qVyg==
X-Gm-Message-State: AOAM530z7P+8Wmo0eb628I1n8WmIu9iJ6Iv3uTrAS6Ke50hBbAABJdpT
 n1Tb+5jwMStId1ISIX3hrVJdlyQHevqXqtpy
X-Google-Smtp-Source: ABdhPJyvLk6l5InVBxNR5pL66bVgHhDtgRr3wB3UZPTZeL6PJwtgnfuGUdeJjl1FVn7vS+SJbceOjQ==
X-Received: by 2002:a05:620a:1528:: with SMTP id
 n8mr869589qkk.329.1615757269989; 
 Sun, 14 Mar 2021 14:27:49 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/29] tcg: Allocate code_gen_buffer into struct
 tcg_region_state
Date: Sun, 14 Mar 2021 15:27:16 -0600
Message-Id: <20210314212724.1917075-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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

Do not mess around with setting values within tcg_init_ctx.
Put the values into 'region' directly, which is where they
will live for the lifetime of the program.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 64 ++++++++++++++++++++++------------------------------
 1 file changed, 27 insertions(+), 37 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index bf4167e467..9a2b014838 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -70,13 +70,12 @@ static size_t tree_size;
 
 bool in_code_gen_buffer(const void *p)
 {
-    const TCGContext *s = &tcg_init_ctx;
     /*
      * Much like it is valid to have a pointer to the byte past the
      * end of an array (so long as you don't dereference it), allow
      * a pointer to the byte past the end of the code gen buffer.
      */
-    return (size_t)(p - s->code_gen_buffer) <= s->code_gen_buffer_size;
+    return (size_t)(p - region.start_aligned) <= region.total_size;
 }
 
 #ifdef CONFIG_DEBUG_TCG
@@ -557,8 +556,8 @@ static bool alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
     }
     qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
 
-    tcg_ctx->code_gen_buffer = buf;
-    tcg_ctx->code_gen_buffer_size = size;
+    region.start_aligned = buf;
+    region.total_size = size;
     return true;
 }
 #elif defined(_WIN32)
@@ -579,8 +578,8 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
         return false;
     }
 
-    tcg_ctx->code_gen_buffer = buf;
-    tcg_ctx->code_gen_buffer_size = size;
+    region.start_aligned = buf;
+    region.total_size = size;
     return true;
 }
 #else
@@ -595,7 +594,6 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
                          "allocate %zu bytes for jit buffer", size);
         return false;
     }
-    tcg_ctx->code_gen_buffer_size = size;
 
 #ifdef __mips__
     if (cross_256mb(buf, size)) {
@@ -633,7 +631,8 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
     /* Request large pages for the buffer.  */
     qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
 
-    tcg_ctx->code_gen_buffer = buf;
+    region.start_aligned = buf;
+    region.total_size = size;
     return true;
 }
 
@@ -654,8 +653,8 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
         return false;
     }
     /* The size of the mapping may have been adjusted. */
-    size = tcg_ctx->code_gen_buffer_size;
-    buf_rx = tcg_ctx->code_gen_buffer;
+    buf_rx = region.start_aligned;
+    size = region.total_size;
 #endif
 
     buf_rw = qemu_memfd_alloc("tcg-jit", size, 0, &fd, errp);
@@ -677,8 +676,8 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
 #endif
 
     close(fd);
-    tcg_ctx->code_gen_buffer = buf_rw;
-    tcg_ctx->code_gen_buffer_size = size;
+    region.start_aligned = buf_rw;
+    region.total_size = size;
     tcg_splitwx_diff = buf_rx - buf_rw;
 
     /* Request large pages for the buffer and the splitwx.  */
@@ -729,7 +728,7 @@ static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
         return false;
     }
 
-    buf_rw = (mach_vm_address_t)tcg_ctx->code_gen_buffer;
+    buf_rw = region.start_aligned;
     buf_rx = 0;
     ret = mach_vm_remap(mach_task_self(),
                         &buf_rx,
@@ -841,11 +840,8 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
  */
 void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
 {
-    void *buf, *aligned, *end;
-    size_t total_size;
     size_t page_size;
     size_t region_size;
-    size_t n_regions;
     size_t i;
     uintptr_t splitwx_diff;
     bool ok;
@@ -854,39 +850,33 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
                                splitwx, &error_fatal);
     assert(ok);
 
-    buf = tcg_init_ctx.code_gen_buffer;
-    total_size = tcg_init_ctx.code_gen_buffer_size;
-    page_size = qemu_real_host_page_size;
-    n_regions = tcg_n_regions(total_size, max_cpus);
-
-    /* The first region will be 'aligned - buf' bytes larger than the others */
-    aligned = QEMU_ALIGN_PTR_UP(buf, page_size);
-    g_assert(aligned < tcg_init_ctx.code_gen_buffer + total_size);
-
     /*
      * Make region_size a multiple of page_size, using aligned as the start.
      * As a result of this we might end up with a few extra pages at the end of
      * the buffer; we will assign those to the last region.
      */
-    region_size = (total_size - (aligned - buf)) / n_regions;
+    region.n = tcg_n_regions(region.total_size, max_cpus);
+    page_size = qemu_real_host_page_size;
+    region_size = region.total_size / region.n;
     region_size = QEMU_ALIGN_DOWN(region_size, page_size);
 
     /* A region must have at least 2 pages; one code, one guard */
     g_assert(region_size >= 2 * page_size);
+    region.stride = region_size;
+
+    /* Reserve space for guard pages. */
+    region.size = region_size - page_size;
+    region.total_size -= page_size;
+
+    /*
+     * The first region will be smaller than the others, via the prologue,
+     * which has yet to be allocated.  For now, the first region begins at
+     * the page boundary.
+     */
+    region.after_prologue = region.start_aligned;
 
     /* init the region struct */
     qemu_mutex_init(&region.lock);
-    region.n = n_regions;
-    region.size = region_size - page_size;
-    region.stride = region_size;
-    region.after_prologue = buf;
-    region.start_aligned = aligned;
-    /* page-align the end, since its last page will be a guard page */
-    end = QEMU_ALIGN_PTR_DOWN(buf + total_size, page_size);
-    /* account for that last guard page */
-    end -= page_size;
-    total_size = end - aligned;
-    region.total_size = total_size;
 
     /* set guard pages */
     splitwx_diff = tcg_splitwx_diff;
-- 
2.25.1


