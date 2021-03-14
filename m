Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDB233A845
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:38:16 +0100 (CET)
Received: from localhost ([::1]:56560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYRD-0001ZV-5d
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYHD-0006Hf-G5
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:56 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:43182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYHB-0008IA-0y
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:55 -0400
Received: by mail-qk1-x72e.google.com with SMTP id b130so29890291qkc.10
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GL6gIGaWt/dCjMwMHmq6bzPQkZftRPDs8LLZAcbEC+c=;
 b=ARggv7oKTaE1LTeM3+EVE4/BvENkXP73vxe7LDDMK+nUoL6FGWX1icF4vulJ/1VAKr
 izTIfBcb166OcJZEfzZNj8BCj3bM2tQGH+Cr8eiYSeXjBVNXCWulAPiWCjlq9mLrWTO2
 5eD7GAx6K22O88aq/DTg+S/R1QsaTwhheIRqkHeIh2uxM/vfbzwvwWt5RcvKT7nr4/qZ
 fNsYFRtuzgJNJ7UV/6NB67SLPLkfBilkJm5nWnVnZACtKxtMGhluCSnFb4DGKfm9ONqC
 06GOKgWlQKnABLIZ3QUt/cYys15XMdnPlPpSDUWTtrkzO8nmWLX+pG7JSRIMuVyatoNr
 rilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GL6gIGaWt/dCjMwMHmq6bzPQkZftRPDs8LLZAcbEC+c=;
 b=MK+lHwdKDI/+z+WXJJEPl4Tj3GYz9FazLIyLWpzR70MtsGTyzKMN/c32hWqXpSMkNZ
 Px+w3/CVfdKqHlWemBwEWjUwbFI2YaG7Nt2vKHiJ/TICBcXKZu9fiDhtLp6H/od4PlOR
 kZoBJrS30D1DUOETmXyb0YKnnoafrpfAH1UWKzsHGaSV3Tm1uP7tHAcQPGvtAuC85h2g
 02IX/TQsJGTbEirNOl2GLuAbLFqNVD0hfo5qd3YbDNXkytFPhoJ4WgwQnKnXeyo9wcsB
 7I6WVHXr0lE5UApTl7OP6GRSt8zd05mC/Y6xYdAeBlB250FSxXd+ViDrOQfXpUgE3NB2
 vRTQ==
X-Gm-Message-State: AOAM530PV4FSDQo1dJ/5hbNzg1F3PpParz6NjBsNFCtepog2A4CYvW8b
 01UgCxsNLf8Jg2zagTVHbs2Eh6E2/PR40Ij/
X-Google-Smtp-Source: ABdhPJwdfelBCcGzVUTB4+4p64jbStbFwDGBP8+KicBtLF+aZbWYGjPvKzqmHnBE6z+5Uqq+JmDNgw==
X-Received: by 2002:a05:620a:404a:: with SMTP id
 i10mr22773089qko.2.1615757272103; 
 Sun, 14 Mar 2021 14:27:52 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/29] tcg: Sink qemu_madvise call to common code
Date: Sun, 14 Mar 2021 15:27:18 -0600
Message-Id: <20210314212724.1917075-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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

Move the call out of the N versions of alloc_code_gen_buffer
and into tcg_region_init.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 3ca0d01fa4..994c083343 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -554,7 +554,6 @@ static int alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
         error_setg_errno(errp, errno, "mprotect of jit buffer");
         return false;
     }
-    qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
 
     region.start_aligned = buf;
     region.total_size = size;
@@ -630,9 +629,6 @@ static int alloc_code_gen_buffer_anon(size_t size, int prot,
     }
 #endif
 
-    /* Request large pages for the buffer.  */
-    qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
-
     region.start_aligned = buf;
     region.total_size = size;
     return prot;
@@ -682,9 +678,6 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
     region.total_size = size;
     tcg_splitwx_diff = buf_rx - buf_rw;
 
-    /* Request large pages for the buffer and the splitwx.  */
-    qemu_madvise(buf_rw, size, QEMU_MADV_HUGEPAGE);
-    qemu_madvise(buf_rx, size, QEMU_MADV_HUGEPAGE);
     return PROT_READ | PROT_WRITE;
 
  fail_rx:
@@ -853,6 +846,13 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
                                       splitwx, &error_fatal);
     assert(have_prot >= 0);
 
+    /* Request large pages for the buffer and the splitwx.  */
+    qemu_madvise(region.start_aligned, region.total_size, QEMU_MADV_HUGEPAGE);
+    if (tcg_splitwx_diff) {
+        qemu_madvise(region.start_aligned + tcg_splitwx_diff,
+                     region.total_size, QEMU_MADV_HUGEPAGE);
+    }
+
     /*
      * Make region_size a multiple of page_size, using aligned as the start.
      * As a result of this we might end up with a few extra pages at the end of
-- 
2.25.1


