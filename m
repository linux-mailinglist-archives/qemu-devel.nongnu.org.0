Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A703A5B51
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 03:22:57 +0200 (CEST)
Received: from localhost ([::1]:38046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsbJY-0007uk-G4
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 21:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsbHM-0005j2-VZ
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 21:20:41 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:35536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsbHH-0006nb-Rg
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 21:20:40 -0400
Received: by mail-pf1-x434.google.com with SMTP id h12so9365532pfe.2
 for <qemu-devel@nongnu.org>; Sun, 13 Jun 2021 18:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5J7pL7i+2GqCeQaZWlw3deouUMvNS4TyvXPxrh3A3xk=;
 b=FKyNojNuzr3JDcoMn+334fSYkfJjq737bCU1Whs6UbOVd4pN4pEUCGuNUFjrL1FhTg
 rZ+LnlBMIDVSn0cZCCll2qtGUQiDPjRw4kM34Fl3gwkH8N1bXDtP591kVQvNxsZm1oZX
 5RpeoP7YFrWa7gqkn8pWv4D3/F90lThKePozCdrR+9xNrkwnyeHJ8MSO4BygDv4fSc8n
 xm69xRTx4QS3rHzWrsGky9BYDRCL2lhfgti45PU9akpY2vTLYC0wqLbN9dFBbqA6wLve
 z+wCuBb6WNX9jkGbUJRJUvJLLAI+pmbhqRRoT9XmVbJHYaZavEbQ66DjFZpA1xA0IaW9
 xJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5J7pL7i+2GqCeQaZWlw3deouUMvNS4TyvXPxrh3A3xk=;
 b=ae99R77wCtyIg9jgwd/kWrhSDbXMfHCE07R+IUvFcqerYXdWZ1l1RSnNkKbzs95eW4
 SReXlLdTOihwTVQ5an1xhG2EEDRrtOCr8umOuN7CJGg90cINFLGIqj8Kvgh1ALeTsGJ0
 FlTOXcIHTUYm16n8c/AN5g9LT2aRogAldKwuOOjiYmp+9NK97OoJfTvLLC7O4fa+/tpw
 sbtSvVPHlbFxQ2uK29Khr/wpDPqU4TZ6qb/eiytIctOr7QNIgKT1MxGM5LybDTCk1KDl
 v80uM6AKtnTNAyZDz6K4QzFkdVI7//lL+CfPcUTizdl+9E6D/CcWhVf6T9cqqpH5C27q
 YqFA==
X-Gm-Message-State: AOAM532oxvfXXbJOmNV8xMeZeUt0lLTo6dYByLAU+XCJZUDuQ/1qc34P
 bREYiE/GRgm0FLNskVaKmYhbi7WNOiWt4A==
X-Google-Smtp-Source: ABdhPJyoRJf0EqCNyF8qtg5uQVDwMB+tqt40wlT7ajjUhRCpjsqYGwJS7/4cojRpX69qnyYuUOVB6g==
X-Received: by 2002:a63:3d82:: with SMTP id
 k124mr14815094pga.401.1623633633898; 
 Sun, 13 Jun 2021 18:20:33 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id d15sm15724359pjr.47.2021.06.13.18.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 18:20:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 22/34] tcg: Allocate code_gen_buffer into struct
 tcg_region_state
Date: Sun, 13 Jun 2021 18:20:31 -0700
Message-Id: <20210614012031.1081133-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614012031.1081133-1-richard.henderson@linaro.org>
References: <20210614012031.1081133-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not mess around with setting values within tcg_init_ctx.
Put the values into 'region' directly, which is where they
will live for the lifetime of the program.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 64 ++++++++++++++++++++++------------------------------
 1 file changed, 27 insertions(+), 37 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 5beba41412..afa11ec5d7 100644
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
@@ -562,8 +561,8 @@ static bool alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
     }
     qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
 
-    tcg_ctx->code_gen_buffer = buf;
-    tcg_ctx->code_gen_buffer_size = size;
+    region.start_aligned = buf;
+    region.total_size = size;
     return true;
 }
 #elif defined(_WIN32)
@@ -584,8 +583,8 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
         return false;
     }
 
-    tcg_ctx->code_gen_buffer = buf;
-    tcg_ctx->code_gen_buffer_size = size;
+    region.start_aligned = buf;
+    region.total_size = size;
     return true;
 }
 #else
@@ -637,8 +636,8 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
     /* Request large pages for the buffer.  */
     qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
 
-    tcg_ctx->code_gen_buffer = buf;
-    tcg_ctx->code_gen_buffer_size = size;
+    region.start_aligned = buf;
+    region.total_size = size;
     return true;
 }
 
@@ -659,8 +658,8 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
         return false;
     }
     /* The size of the mapping may have been adjusted. */
-    size = tcg_ctx->code_gen_buffer_size;
-    buf_rx = tcg_ctx->code_gen_buffer;
+    buf_rx = region.start_aligned;
+    size = region.total_size;
 #endif
 
     buf_rw = qemu_memfd_alloc("tcg-jit", size, 0, &fd, errp);
@@ -682,8 +681,8 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
 #endif
 
     close(fd);
-    tcg_ctx->code_gen_buffer = buf_rw;
-    tcg_ctx->code_gen_buffer_size = size;
+    region.start_aligned = buf_rw;
+    region.total_size = size;
     tcg_splitwx_diff = buf_rx - buf_rw;
 
     /* Request large pages for the buffer and the splitwx.  */
@@ -734,7 +733,7 @@ static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
         return false;
     }
 
-    buf_rw = (mach_vm_address_t)tcg_ctx->code_gen_buffer;
+    buf_rw = (mach_vm_address_t)region.start_aligned;
     buf_rx = 0;
     ret = mach_vm_remap(mach_task_self(),
                         &buf_rx,
@@ -846,11 +845,8 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
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
 
@@ -858,39 +854,33 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
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


