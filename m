Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0EB33A85E
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:54:35 +0100 (CET)
Received: from localhost ([::1]:60942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYh0-0007dk-Iv
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH9-0006Bz-Au
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:51 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:43187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH3-0008FN-TZ
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:50 -0400
Received: by mail-qk1-x734.google.com with SMTP id b130so29890131qkc.10
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cCuL+0Cr0Nxn0ond/pgRLvEba3AtjzB4cSKYgtHeHws=;
 b=czkvbfTBUnwW/ScjIkq8zyezdsj/aif2NiRQFji6uiQUVHhRqMBZxsmLtVpo0eFlG7
 2L0FsnvP09dSc6s9aweOr65WpM71H0pwtVXCoBBbrRQlyKHvI2/Fx9mUqm5B2HCtpHXZ
 D02U0MA+sI7C6UeAUnFQP98i72VRtI7rQLlB+YiEN+Ge+bQj9+kCe30LjUXqkHha83FQ
 ia799cvCfvxzH9/MjC3jbPia7MSYF+9hwKQk41fJwzYEatXLT3AqWe+Vt7UuGYjXzi/w
 lQ1R+ecmwovuk3/jFUOkrnAnWMn/6N2uzq9uc5GP9GG+5ObERzb1/E+z8EjD/N8BBoPl
 /MjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cCuL+0Cr0Nxn0ond/pgRLvEba3AtjzB4cSKYgtHeHws=;
 b=GCBtBJixaGFp9Q6FktCr0u3d2Gt1OSh2fmjls8jxtJA2lT0IENCIHR3JYWdZdme4VJ
 aNvdg5t+n97lBL/Ih6S+QGD0/QTr74NqRNpXaa+3N87J4jXHYR+tZ0XD2+wY+P4MoMHH
 Rm5TFWXxLqVlbgW+QgnHZO7pxuGPOPThG8Nc3GGGiqPGZufXPzGqM9w47Ne3blmGm5Og
 a6xSlzdlrZwGSexYR4sfQilkoKQ/pqmrO943EUYew0lP29vB3Zdip/jymPA7EMo6Y6dA
 rRoKs8PW8DnN4EaXsaHaCY8Yal5PELZFeE6TuXixpg+xB0TAwb4ayuSCuQB7YV+l/HHW
 mAGw==
X-Gm-Message-State: AOAM5332M/FJ82JoDWEModS0gUZxHL8+cCphYfOiAX8tp/oEcTqmcFXq
 uuA1IjZZkb/lC5LdLIIWtCfIhmtXTdmup7W9
X-Google-Smtp-Source: ABdhPJxcf27vhg3+wKc99eklNOWAs6vXjS83KU407qfv45l22m/U4e2mHRuNTPhS/fY17y7Q/D1QMA==
X-Received: by 2002:a05:620a:1353:: with SMTP id
 c19mr23065731qkl.392.1615757264880; 
 Sun, 14 Mar 2021 14:27:44 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/29] tcg: Replace region.end with region.total_size
Date: Sun, 14 Mar 2021 15:27:11 -0600
Message-Id: <20210314212724.1917075-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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
index ae22308290..8e4dd0480b 100644
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
@@ -827,19 +827,20 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
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
@@ -853,9 +854,11 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
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
@@ -893,7 +896,7 @@ void tcg_region_prologue_set(TCGContext *s)
 
     /* Register the balance of the buffer with gdb. */
     tcg_register_jit(tcg_splitwx_to_rx(region.start),
-                     region.end - region.start);
+                     region.start_aligned + region.total_size - region.start);
 }
 
 /*
@@ -934,8 +937,10 @@ size_t tcg_code_capacity(void)
 
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


