Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836CF652C3E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 06:05:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7rGQ-0002KL-Td; Wed, 21 Dec 2022 00:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rGO-0002JG-DW
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:32 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rGM-0003Pe-P0
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:32 -0500
Received: by mail-pj1-x1036.google.com with SMTP id u5so14575479pjy.5
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 21:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cckxZafOwtkUwQnY45Ez0scvGBO1+RBqrS/Kwfy+GPI=;
 b=I9pc2pd1N5GMj61jiDYr4cOo0OCsiMxBntpUKyLfNeynUxUKHDCZCriQAU1/QigYfY
 k2UIyhg4/pE7tFwH+F+5nvzd7Dtl7KPF8oljZDK8Y9r8YAhBwJdCLiC+DOod19JsA2yh
 th0eKTFtnD82nn0WO31Z3as9W8pTeYP056iKF/OGNADjHueOqS4oHraxlnrls+Q9ZRsS
 WZ/vGRVdpSX7KCIJR44U+31csP7BilwgNehwQ3kQk4MX31KiCJ5Kbw0Fz74fb1GKARID
 fVg1lCFFCuMA5g0cIm38nhMXnC81aJUzxXs4ST5hEwa/eHDKj7R7Q1IJfutliKoj97/I
 JD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cckxZafOwtkUwQnY45Ez0scvGBO1+RBqrS/Kwfy+GPI=;
 b=qSBwxXdTXq+IuxUrovdHMhs2toi4NvskOvzVTpbyd5ZMR9j8ELMdxqe43zVPvJZlQD
 ccJfpUWCxPFAtSN9qQP6D1pqGwBiZrCuf+9kG3JJM2D/wn4CNlDjCy9vvtxkgySBuzqm
 /498Bkz2tSNbMJSwGf+hTEn2IpZA/eHgo3FcxfXLoElm7yys9AZarTGSGkMJMYwnhNtm
 xilTDiGFlT77MOFTt72H89aVb8v8fNKdBaoDsZLD9YzbMa6TOivVKh0421Nyrp1lPKlp
 EvyP+khVGTlVCRxzyREIhcx39EFJLjMNVi7Hfee7GPGdGHtTZW97h1LSPe66A6XB28qF
 oK7w==
X-Gm-Message-State: AFqh2kpvZnAVD24UELj/yXqDBWjQ7rdknATGmCrel5XFjnT+EVwIkUMe
 LOKyMtR/scDiDJFKHty5rMOuAbHR3gbSQC+B
X-Google-Smtp-Source: AMrXdXvc4U4bvVxfdLBWsD1uUpnOTMu7gRrUoMOD5FXRcM/2oMn4BTn0EBz2sQLzfNZXZsFKEmphEg==
X-Received: by 2002:a17:90a:d911:b0:219:ffc6:4040 with SMTP id
 c17-20020a17090ad91100b00219ffc64040mr17248338pjv.38.1671599009248; 
 Tue, 20 Dec 2022 21:03:29 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a17090a688800b002135e8074b1sm390645pjd.55.2022.12.20.21.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 21:03:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 13/14] accel/tcg: Factor tb_invalidate_phys_range_fast() out
Date: Tue, 20 Dec 2022 21:03:12 -0800
Message-Id: <20221221050313.2950701-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221050313.2950701-1-richard.henderson@linaro.org>
References: <20221221050313.2950701-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221209093649.43738-5-philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h |  3 +++
 accel/tcg/cputlb.c   |  5 +----
 accel/tcg/tb-maint.c | 21 +++++++++++++++++----
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index d10ab69ed0..8f8c44d06b 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -42,6 +42,9 @@ void tb_invalidate_phys_page_fast__locked(struct page_collection *pages,
                                           uintptr_t retaddr);
 struct page_collection *page_collection_lock(tb_page_addr_t start,
                                              tb_page_addr_t end);
+void tb_invalidate_phys_range_fast(ram_addr_t ram_addr,
+                                   unsigned size,
+                                   uintptr_t retaddr);
 void page_collection_unlock(struct page_collection *set);
 G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 #endif /* CONFIG_SOFTMMU */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index f7963d3af8..03674d598f 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1508,10 +1508,7 @@ static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
     trace_memory_notdirty_write_access(mem_vaddr, ram_addr, size);
 
     if (!cpu_physical_memory_get_dirty_flag(ram_addr, DIRTY_MEMORY_CODE)) {
-        struct page_collection *pages
-            = page_collection_lock(ram_addr, ram_addr + size);
-        tb_invalidate_phys_page_fast__locked(pages, ram_addr, size, retaddr);
-        page_collection_unlock(pages);
+        tb_invalidate_phys_range_fast(ram_addr, size, retaddr);
     }
 
     /*
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 8edfd910c4..d557013f00 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -1184,10 +1184,6 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
 }
 
 /*
- * len must be <= 8 and start must be a multiple of len.
- * Called via softmmu_template.h when code areas are written to with
- * iothread mutex not held.
- *
  * Call with all @pages in the range [@start, @start + len[ locked.
  */
 void tb_invalidate_phys_page_fast__locked(struct page_collection *pages,
@@ -1205,4 +1201,21 @@ void tb_invalidate_phys_page_fast__locked(struct page_collection *pages,
     tb_invalidate_phys_page_range__locked(pages, p, start, start + len,
                                           retaddr);
 }
+
+/*
+ * len must be <= 8 and start must be a multiple of len.
+ * Called via softmmu_template.h when code areas are written to with
+ * iothread mutex not held.
+ */
+void tb_invalidate_phys_range_fast(ram_addr_t ram_addr,
+                                   unsigned size,
+                                   uintptr_t retaddr)
+{
+    struct page_collection *pages;
+
+    pages = page_collection_lock(ram_addr, ram_addr + size);
+    tb_invalidate_phys_page_fast__locked(pages, ram_addr, size, retaddr);
+    page_collection_unlock(pages);
+}
+
 #endif /* CONFIG_USER_ONLY */
-- 
2.34.1


