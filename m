Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 918A93368BF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:32:35 +0100 (CET)
Received: from localhost ([::1]:54852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9Fi-0000rt-IS
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:32:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95z-00051F-3C
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:31 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:42820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95t-0001PD-Hu
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:30 -0500
Received: by mail-ot1-x329.google.com with SMTP id e45so18297420ote.9
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VSZrJShNmwQW2SfqVcVS775pOVRCTGP4q6oG79pjXv8=;
 b=Zh79k/oI2hs0H++bDG+RoxmawsKa8j9qa9iPIosHizW2PTYBSH9RvwW3HBCQT6IYwT
 Hldpnud6C4+2JH0bGqBoAeZzfe8eTRsgZM2D9T9CtSPlPjvsNsR4zPp801WIJeg/zwib
 DqSKdQUP7jVlDCX/cnkBPeKFhE+tTJcyALJzrcEiEJa2LNKpsTkQNWKHaUPmJL1JVKBg
 56lSAk8Q0fBKSp8MDhUHr5ip4XxPfj7jnQ+cdGAn8zlQQ3Jy87KvDlrC3dy8tqjULN9H
 XESedvh41mllLQ6mCPssutEzJjZfmLdbQq+gtoZoNMhDj2U5zVecbcjcqfNNtsEPQ5DE
 ZiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VSZrJShNmwQW2SfqVcVS775pOVRCTGP4q6oG79pjXv8=;
 b=kfOlE4d4GeESc/CuNsBpUQJbv9uN80rE34lmkIpYuuUqLzt6egsKQec326LqQEAeDx
 ZXyD/ubxtMiQZy9jbVUy7ErtHgKbEWJrVh26ShH05JPK2jaCRsIcpL5LDoVPIb/W0DWV
 3gCpKEK+EgNKNSAC2Zn2zjdf7nlNXEbMiJp5snATvU0Yt5sDoUjthIwihQBdfI4pKeKU
 QuTmUSXw/uMktDs4TwYrIqUMJOGfJE3O1h1PeS6HIL0PHxSU17X6q9smU1OdAoX4KN5K
 gOQzevAy1JOp2LOSzrkT099HP7vXiDBO1hVHBeYWqsRqZxs2Rprxy03W2yWsY1sP3taG
 WVQw==
X-Gm-Message-State: AOAM531rMIAH2ZH2hI/xjrWvU/FZnHhVN5vDcno1Q/ncClitCvnsZrVM
 plkoP5ev8laD442ZE0Oj1JrmY6w0tx1fGMyv
X-Google-Smtp-Source: ABdhPJxy0taBz07U63bjHM49bz7VHV9X1z3qAqW4kIzRCnP1dymoA0WxoPIPakIcEzrKiha2Bz6fEw==
X-Received: by 2002:a9d:7613:: with SMTP id k19mr4815953otl.27.1615422143535; 
 Wed, 10 Mar 2021 16:22:23 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/26] tcg: Allocate code_gen_buffer into struct
 tcg_region_state
Date: Wed, 10 Mar 2021 18:21:50 -0600
Message-Id: <20210311002156.253711-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
 tcg/region.c | 61 ++++++++++++++++++++++------------------------------
 1 file changed, 26 insertions(+), 35 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index f719a3edf3..d7ad1be1f9 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -520,8 +520,8 @@ static bool alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
     }
     qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
 
-    tcg_ctx->code_gen_buffer = buf;
-    tcg_ctx->code_gen_buffer_size = size;
+    region.start_aligned = buf;
+    region.total_size = size;
     return true;
 }
 #elif defined(_WIN32)
@@ -542,8 +542,8 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
         return false;
     }
 
-    tcg_ctx->code_gen_buffer = buf;
-    tcg_ctx->code_gen_buffer_size = size;
+    region.start_aligned = buf;
+    region.total_size = size;
     return true;
 }
 #else
@@ -558,7 +558,6 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
                          "allocate %zu bytes for jit buffer", size);
         return false;
     }
-    tcg_ctx->code_gen_buffer_size = size;
 
 #ifdef __mips__
     if (cross_256mb(buf, size)) {
@@ -596,7 +595,8 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
     /* Request large pages for the buffer.  */
     qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
 
-    tcg_ctx->code_gen_buffer = buf;
+    region.start_aligned = buf;
+    region.total_size = size;
     return true;
 }
 
@@ -617,8 +617,8 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
         return false;
     }
     /* The size of the mapping may have been adjusted. */
-    size = tcg_ctx->code_gen_buffer_size;
-    buf_rx = tcg_ctx->code_gen_buffer;
+    buf_rx = region.start_aligned;
+    size = region.total_size;
 #endif
 
     buf_rw = qemu_memfd_alloc("tcg-jit", size, 0, &fd, errp);
@@ -640,8 +640,8 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
 #endif
 
     close(fd);
-    tcg_ctx->code_gen_buffer = buf_rw;
-    tcg_ctx->code_gen_buffer_size = size;
+    region.start_aligned = buf_rw;
+    region.total_size = size;
     tcg_splitwx_diff = buf_rx - buf_rw;
 
     /* Request large pages for the buffer and the splitwx.  */
@@ -692,7 +692,7 @@ static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
         return false;
     }
 
-    buf_rw = (mach_vm_address_t)tcg_ctx->code_gen_buffer;
+    buf_rw = region.start_aligned;
     buf_rx = 0;
     ret = mach_vm_remap(mach_task_self(),
                         &buf_rx,
@@ -804,11 +804,8 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
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
@@ -817,39 +814,33 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
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
+    region.start = region.start_aligned;
 
     /* init the region struct */
     qemu_mutex_init(&region.lock);
-    region.n = n_regions;
-    region.size = region_size - page_size;
-    region.stride = region_size;
-    region.start = buf;
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


