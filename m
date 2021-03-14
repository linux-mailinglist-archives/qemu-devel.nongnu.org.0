Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE533A849
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:39:49 +0100 (CET)
Received: from localhost ([::1]:60024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYSi-0002zq-Dg
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYHH-0006K9-Em
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:59 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:35368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYHC-0008IF-TU
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:59 -0400
Received: by mail-qk1-x735.google.com with SMTP id d20so29929245qkc.2
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dbOIDgtK5Y740kNmX5rEOHFZVjBYbVNjCLgwvbDsCnc=;
 b=wSkZk/aXvYc046TWbwqTWpUsoI81YkzWwYchqJLNrF1yWkytSHqGix+Q6UlE8oQ0Kh
 MPPWns5Q2+x30dqUyMDPf5jyF052zQH8fECOrobmbJGPK0p56dQTSdz0GRt8O20QMwNO
 pukS+KE8ErqgZl/OwH764fVjv1rSngiJ+d7It5ux+w+0ejKcgP3d8gPWIDvwzzi0a8NL
 puGqnRs1cXrmf4EeJc2djcdSSdtnYRfqzTxIytZmyByg49MzGMd543CbSXDhoGviQPws
 ElUVk/O2x1IFAEJC5FPIXJu7nvBSRja7m851n9ZRqlO9w0i5gx08clNwTaPJoMUu+c+w
 rOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dbOIDgtK5Y740kNmX5rEOHFZVjBYbVNjCLgwvbDsCnc=;
 b=qo7zWSf8qgMnhfRFA7fNLHiwtHqceu6vZq9NUbdYspP5NyRtqGf7bcxXXBXyF8Duzw
 4vKVK+FWRBdesMERWd3Hn5cmkrl50EKlAFAzLibcyfCliXOsPLt5/2+dWa3WUZFhk6pe
 puw+EVrrcBntRfrr037pfrEdTcbteQlBDJDfwD04Tb7w2Oi8yMfwfpalOmHnwWlb02cu
 SQSs+cpQzyM7pTCypVTPiuHv8McqdrxM+kyWdc+UkiKcW4Y4hqZflKgZk2DmbZG93w+/
 PHPjlDcgtI0rkyDkbgpk9r4+MPqGixduXtd4/RpSODW4k8kJdWIb0AAtMDdsjYB6ZRvx
 /W6A==
X-Gm-Message-State: AOAM531uxj/ELg7S2I7CSJaEdO5wK3G+SR5bXHcyXyczcd3SZB2n5d9E
 lZbcHU1f7MhXHV3fdv/6Nzh5Doxn7NjyMmdG
X-Google-Smtp-Source: ABdhPJw9G1jNx2mqEoIjzbS+dfKvVho4uRR3VRz2mZBdUa7QPkTnet5NHYHcFp3r2mNqhLlS+YNunw==
X-Received: by 2002:a37:8743:: with SMTP id j64mr21469640qkd.299.1615757273247; 
 Sun, 14 Mar 2021 14:27:53 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/29] tcg: Do not set guard pages in the rx buffer
Date: Sun, 14 Mar 2021 15:27:19 -0600
Message-Id: <20210314212724.1917075-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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

We only need guard pages in the rw buffer to avoid buffer overruns.
Let the rx buffer keep large pages all the way through.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 994c083343..27a7e35c8e 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -839,7 +839,6 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     size_t page_size;
     size_t region_size;
     size_t i;
-    uintptr_t splitwx_diff;
     int have_prot;
 
     have_prot = alloc_code_gen_buffer(size_code_gen_buffer(tb_size),
@@ -881,8 +880,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     /* init the region struct */
     qemu_mutex_init(&region.lock);
 
-    /* set guard pages */
-    splitwx_diff = tcg_splitwx_diff;
+    /* Set guard pages.  No need to do this for the rx_buf, only the rw_buf. */
     for (i = 0; i < region.n; i++) {
         void *start, *end;
         int rc;
@@ -890,10 +888,6 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
         tcg_region_bounds(i, &start, &end);
         rc = qemu_mprotect_none(end, page_size);
         g_assert(!rc);
-        if (splitwx_diff) {
-            rc = qemu_mprotect_none(end + splitwx_diff, page_size);
-            g_assert(!rc);
-        }
     }
 
     tcg_region_trees_init();
-- 
2.25.1


