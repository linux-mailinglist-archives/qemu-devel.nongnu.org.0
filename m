Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2731933A855
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:42:43 +0100 (CET)
Received: from localhost ([::1]:39308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYVW-0006H0-6i
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYHJ-0006Of-1R
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:28:01 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:42127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYHG-0008JB-3B
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:28:00 -0400
Received: by mail-qk1-x729.google.com with SMTP id z190so29892144qka.9
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pRz3FkmnhYrvDheUkOUyMc6EESrwISuc2jP3jfo+afs=;
 b=T6qzpQF40EwKSOnTbv8BIpH8oM4f5VDVFntt/319krpghQfldwdtDnK3mS84WMwI5w
 Vj9b9t9Q70pvP6GXPu0wNIgDndr1Y/G/naYbP09FkrpDHIp3DB/syEsyl3K6YSE/+PMQ
 EABylMr5oXCKpSoDt4KW/ir1ul9VqrI/1cV+rxYz5aPzaT9CBJYJCHEQJTWnEIiSZoDa
 WuJjV+aJg7LOnuGbkyAxWZb9t1Y9VfCfEbqrI1ZUTp2tzjkAnbrftdWe+LVDZKOll8Fm
 YXzislGDv/VwR4HF3suJUspTeODH1GsEaXafuJHfGLYZQP5pYsn/7twIYs1rNY/CztpT
 utUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pRz3FkmnhYrvDheUkOUyMc6EESrwISuc2jP3jfo+afs=;
 b=i2oCIh5ZKepHegsMQBNR8nTmAE7/2sq3fzTnYKImF5FUpKoYDSa5ist25349mZj6TL
 S0X3sqF0z2cQeUTBQSKpJHiA83c5cuBVn/Xc6qFwhOeaYRz1GEHAIHdel8EQqQIvBNcm
 3CJW1wox7OGfvEZdEKvA+25td5gql+eDX+18tA3nViIZe4jaZAsO1qOuZfneOfKlFdKJ
 K9eFznGVB29cnoCEuCNTUE1CxFi2r8jt2tG7VncKuTQIjhMjnaUTEk0M3xJuNZ6zfjtb
 gadWqwMQ9WacjZ0QoqDSAQuzvgmFL0jdOMA8TyHXSVHqRRXK5m7Dfm6b//vFaMewrbiP
 gMkw==
X-Gm-Message-State: AOAM532sXyJ/UBgf8CMkwhznjG34ETyYK1DhKJLqMcAJudO17VLT5CYf
 FzBm/4DnabwNK//9MU2016w3Fygqk7Kx1KsW
X-Google-Smtp-Source: ABdhPJzLpvrklawwJDQTJbvS+hCJFmUJb/kQa8qz8ySh5TbjCQhlV4PQLjPfHCaFUkrB+9fuDQGPmA==
X-Received: by 2002:a05:620a:13db:: with SMTP id
 g27mr23096202qkl.367.1615757276743; 
 Sun, 14 Mar 2021 14:27:56 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/29] tcg: Merge buffer protection and guard page
 protection
Date: Sun, 14 Mar 2021 15:27:22 -0600
Message-Id: <20210314212724.1917075-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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

Do not handle protections on a case-by-case basis in the
various alloc_code_gen_buffer instances; do it within a
single loop in tcg_region_init.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 4dc1237ff4..fac416ebf5 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -530,11 +530,6 @@ static int alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
     }
 #endif
 
-    if (qemu_mprotect_rwx(buf, size)) {
-        error_setg_errno(errp, errno, "mprotect of jit buffer");
-        return false;
-    }
-
     region.start_aligned = buf;
     region.total_size = size;
 
@@ -818,8 +813,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
 {
     const size_t page_size = qemu_real_host_page_size;
     size_t region_size;
-    size_t i;
-    int have_prot;
+    int have_prot, need_prot;
 
     /* Size the buffer.  */
     if (tb_size == 0) {
@@ -875,14 +869,38 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     /* init the region struct */
     qemu_mutex_init(&region.lock);
 
-    /* Set guard pages.  No need to do this for the rx_buf, only the rw_buf. */
-    for (i = 0; i < region.n; i++) {
+    /*
+     * Set guard pages.  No need to do this for the rx_buf, only the rw_buf.
+     * Work with the page protections set up with the initial mapping.
+     */
+    need_prot = PAGE_READ | PAGE_WRITE;
+#ifndef CONFIG_TCG_INTERPRETER
+    if (tcg_splitwx_diff == 0) {
+        need_prot |= PAGE_EXEC;
+    }
+#endif
+    for (size_t i = 0, n = region.n; i < n; i++) {
         void *start, *end;
         int rc;
 
         tcg_region_bounds(i, &start, &end);
-        rc = qemu_mprotect_none(end, page_size);
-        g_assert(!rc);
+        if (have_prot != need_prot) {
+            if (need_prot == (PAGE_READ | PAGE_WRITE | PAGE_EXEC)) {
+                rc = qemu_mprotect_rwx(start, end - start);
+            } else if (need_prot == (PAGE_READ | PAGE_WRITE)) {
+                rc = qemu_mprotect_rw(start, end - start);
+            } else {
+                g_assert_not_reached();
+            }
+            if (rc) {
+                error_setg_errno(&error_fatal, errno,
+                                 "mprotect of jit buffer");
+            }
+        }
+        if (have_prot != 0) {
+            /* If guard-page permissions don't change, it isn't fatal. */
+            (void)qemu_mprotect_none(end, page_size);
+        }
     }
 
     tcg_region_trees_init();
-- 
2.25.1


