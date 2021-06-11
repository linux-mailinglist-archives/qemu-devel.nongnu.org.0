Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650DD3A4B96
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 02:04:00 +0200 (CEST)
Received: from localhost ([::1]:54984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrr83-00039r-BT
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 20:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmo-0002u5-OU
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:02 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmm-0002j9-6k
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:02 -0400
Received: by mail-pl1-x634.google.com with SMTP id e1so3588660pld.13
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YckM4rrXqWzq3iloRH/M5Y1yXJHaBzItIjFSA6/6d8o=;
 b=AUHYX218chIllIBKLN7GnpXohlc2gfPsy7xV4GE8dnKbzLkmc9XX2RaPHk41szXOy0
 Y1gXknYqE8tNcBbXTT/HbhNyrofee9QijoqbjruRxGKbh5lQXJEQPFUiG7T7xB13DSkU
 tUD2B0xH/KW537xLa8emnDpfPHB9m+kQ1UpRzbqhihQ7WL83IlpqMeg3BKKICjuggDrQ
 7Da3oOqaUUNV4eUri+J8D9YhNeolmF3wulijIbZrrQ7nM/Ux25TI1HzwmSrCgn+fe+4v
 TeJwvT/S8jo+YsJMf7WbP5B09n2lTUOMl90yf0NIPxW4NRXgLs93Meh5KDasuiX3Lpgp
 p2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YckM4rrXqWzq3iloRH/M5Y1yXJHaBzItIjFSA6/6d8o=;
 b=VfSnkQQHUROBHSsYo5l941qoQVBhsi74qpFkWmWBmIOAc0BuWs2kmE1unIKlAb/FMo
 zZqSn7YEWD1Meya7WwWnGylVavT9cYyLcZ/ls51VGmfg16oqCdCf5lHjUVHxIoJatVtd
 2KNHYtnAfDPuMB3gWr9E80hiNbG3/LeGHbORS2sVkGNYkkSyXxtKy2wDEUu4TBFxWfpp
 thSDR27otBRuS7+plzuxX4GnG0rEyz+V7uRVW68095s0EgObxo+BBNtZ3IQuxJD/RL70
 Im9ahi8gJ6Db9YnD9R66Dc7fxdR6jZAeNGJZsRXmaOe0zAX7xUY/qsbkaeOG0nd/udfT
 MVKw==
X-Gm-Message-State: AOAM5319/civYIuK0tuQI4u5q6YTOX6p5COTPe0M0MAlPcF9KhsIbnu2
 i7NPuz8VGZH6BD+6OhEnJKeb/riWvW8Zbg==
X-Google-Smtp-Source: ABdhPJw2TDFSijSEkGp3+ar0GUYf+L3tdu4urwj6Abm5nh+TZnkDmqD9nmu/JTN835+AwtH85l+5ow==
X-Received: by 2002:a17:90a:f317:: with SMTP id
 ca23mr7039972pjb.174.1623454918837; 
 Fri, 11 Jun 2021 16:41:58 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/34] tcg: Allocate code_gen_buffer into struct
 tcg_region_state
Date: Fri, 11 Jun 2021 16:41:32 -0700
Message-Id: <20210611234144.653682-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
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
index 5beba41412..ed7efba4b4 100644
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
+    buf_rw = region.start_aligned;
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


