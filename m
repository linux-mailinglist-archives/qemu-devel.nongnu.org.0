Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBC8370FCB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:28:24 +0200 (CEST)
Received: from localhost ([::1]:60076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLVf-0003X0-TV
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMm-0008Nf-L0
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:12 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:39627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMd-0002y7-5K
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:12 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 z6-20020a17090a1706b0290155e8a752d8so4707105pjd.4
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jSOp/9wJhN3jCWwzFvXkuBaSFQqc7XH9WxgSTuRkYOk=;
 b=QDwT5swGmrYYswcDVsi1NhRzKUSK1KnqwkLVKKPYx3EZTJY8MX7lBKELYMRc9prfCk
 gIl5Kg79nZ1sFtD2y92nWzIWVXVrLY9yUIKsQvAa1c9sfu8qbDez6sVVYcsDbZvaun6f
 wPxZQtMRcQBjY2tRzKwCZWUm1IMM5i9cyqsRXb2HTobDEoANBVibs5n9w1MkIfdzF758
 bSm+vuSCD1nSpQEIIVW73nX8uWN+pAuqadSFFp9L8vr+wJuLdl3zqxJqEYuFr51Q1vQ5
 L98A8AzEzVyU8kd9m8GOojl+pO99W8CnSy5vzQJrpnFycgQ630MpgiLr/gJ9OsjsxH0g
 GaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jSOp/9wJhN3jCWwzFvXkuBaSFQqc7XH9WxgSTuRkYOk=;
 b=oc3/EKpoBMHSSgpyNaRNd4ZOWcaJSz/RcQg7/Q6q7QOdgtRg5xKjLZD3IVBD1LmE+P
 16qbaXMnoe2VqPdES58ERrmhuvycWlS5VphIuTiSC3pUSGGwvxgBqO6IP3h6KFMqEiFV
 Ck/Ygt7nYdY1HqHWFDDN/kYE1mhwCrgw443gmPEzTGWYoOTX55Xxu+3p9bCV1RhPQ8se
 vtl9AQVZFzeanq6T1ZS0IeT6Nbe7y5noPcf0XnHJAjA+tm2Oonrbg70Rv8kVQZ2gJpMb
 OVFfavO+Mmkj7K4x+UsbHLvm2E55EJibLrXu0ynPInkXXinn2bdytiFxgF60CrmjWkYY
 jKew==
X-Gm-Message-State: AOAM533+oYV/ACjiwBGiS7kDXAerslsczL61leVk14pOsKruxxi/EgMD
 WkQSmcDHm63u0Q7xTo0UF5gsiVdTYyXQTA==
X-Google-Smtp-Source: ABdhPJwy/yUqLRV7O47uXtAjD7aYh9aTqocyFilHetaJ/LEUcn/Rnvvwz3sS8qIMsbwAQQnL00vaPw==
X-Received: by 2002:a17:90a:d24a:: with SMTP id
 o10mr27263235pjw.138.1619997541727; 
 Sun, 02 May 2021 16:19:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.19.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:19:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/28] tcg: Allocate code_gen_buffer into struct
 tcg_region_state
Date: Sun,  2 May 2021 16:18:37 -0700
Message-Id: <20210502231844.1977630-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Do not mess around with setting values within tcg_init_ctx.
Put the values into 'region' directly, which is where they
will live for the lifetime of the program.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 64 ++++++++++++++++++++++------------------------------
 1 file changed, 27 insertions(+), 37 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 893256f9f4..d6499f7d98 100644
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
     bool ok;
 
@@ -853,39 +849,33 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
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
 
     /*
      * Set guard pages in the rw buffer, as that's the one into which
-- 
2.25.1


