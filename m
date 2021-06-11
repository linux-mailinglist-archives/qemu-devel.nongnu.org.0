Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE223A4B73
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:56:00 +0200 (CEST)
Received: from localhost ([::1]:33256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrr0J-0005Au-ES
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmn-0002pt-GM
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:01 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:42634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmj-0002gd-0W
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:01 -0400
Received: by mail-pl1-x62b.google.com with SMTP id v13so3599477ple.9
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v3dqO5xG9NML/3lBzhEEI0lp1xg70tk/1JnUT4HyRn4=;
 b=SgzSfOLgLvR+/tldyUQnrXnw3IY2Z8dZdrWpIBwdGL8clujPdTWGOpSZjQf8/39uMh
 u68JqX7yNQeKioPWaR5aY5L1PoSjMkxvA607R90LDXYHMLdb7ucox2RTl6t819/ax/25
 X3xPZDEru+9ELaSUZDHXfAHbrS/ogG12DD3/3AH4sOhPMEw7Nf+0yTv5Cte0X80XCtmA
 IowTR4XT69QITBK3j9z6an1b30gqEZW034coJIFmJY4+NMQtC8YogvxRbDFERy1meG3U
 Pmyt++uVnaOJXEsnPJXFlLSJWZoKBOOjTTNQNVa/rrM07m09sC3k5dvjTntLqD7pPGIF
 VeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v3dqO5xG9NML/3lBzhEEI0lp1xg70tk/1JnUT4HyRn4=;
 b=L2v7voRhaTFgopzCWGcB2SU+TpKhmK18YBmzJOna5xTJ0OHnRjOO+jB5/faDu7ea6p
 H2npe/nm2/IqVtY1QHMZc2Fzs09W/SiAkHdwtYiZMiVFwtk7U+rGCN49YzFQkG/RJoc8
 ICNlhIAoLWFv7yg38ZboAAlHGjeutP0tLmFb0mDAu/FBN8twZK1xiSb/vV02z7M6sqrp
 hu/Qk/2+B2G5osyGIgZ/cInXjdzE/K0RciqKcOWktlzRGrGoFdF5gKhCFscf6lOlRRYq
 eJC2nUic10KICQMaSIERbxXFOr3yPdbajtSsKTm4yAywIyi25DTMUVrgcDF/BIP8Bku3
 aC0Q==
X-Gm-Message-State: AOAM532h8EnNa0PJ2xRBV0mjKK9Z4SYHbQddQ+6xGZxcOVOznLlmiD00
 vGPvB9ehce0ZlLJU/WtdUg0y06S8QcEgeQ==
X-Google-Smtp-Source: ABdhPJzvN3GccV5JCFKyEFduD9anYsY/x2JvzibByrHtotUnkJHwnifABdyE37FP2FVZjLJBPBxgaw==
X-Received: by 2002:a17:90a:de04:: with SMTP id
 m4mr6713608pjv.40.1623454915732; 
 Fri, 11 Jun 2021 16:41:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/34] tcg: Replace region.end with region.total_size
Date: Fri, 11 Jun 2021 16:41:27 -0700
Message-Id: <20210611234144.653682-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

A size is easier to work with than an end point,
particularly during initial buffer allocation.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 13087aa0c9..7a34c96d74 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -48,10 +48,10 @@ struct tcg_region_state {
     /* fields set at init time */
     void *start;
     void *start_aligned;
-    void *end;
     size_t n;
     size_t size; /* size of one region */
     size_t stride; /* .size + guard size */
+    size_t total_size; /* size of entire buffer, >= n * stride */
 
     /* fields protected by the lock */
     size_t current; /* current region index */
@@ -278,8 +278,9 @@ static void tcg_region_bounds(size_t curr_region, void **pstart, void **pend)
     if (curr_region == 0) {
         start = region.start;
     }
+    /* The final region may have a few extra pages due to earlier rounding. */
     if (curr_region == region.n - 1) {
-        end = region.end;
+        end = region.start_aligned + region.total_size;
     }
 
     *pstart = start;
@@ -817,8 +818,8 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
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
@@ -830,19 +831,20 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
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
@@ -856,9 +858,11 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
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
@@ -899,7 +903,7 @@ void tcg_region_prologue_set(TCGContext *s)
 
     /* Register the balance of the buffer with gdb. */
     tcg_register_jit(tcg_splitwx_to_rx(region.start),
-                     region.end - region.start);
+                     region.start_aligned + region.total_size - region.start);
 }
 
 /*
@@ -940,8 +944,10 @@ size_t tcg_code_capacity(void)
 
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


