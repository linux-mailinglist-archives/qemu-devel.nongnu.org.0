Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EB664F1A0
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 20:17:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Fq5-0000e6-L5; Fri, 16 Dec 2022 13:53:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fq1-0000cF-Ft
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:42 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fpz-0003Hk-HJ
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:41 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 q17-20020a17090aa01100b002194cba32e9so7020175pjp.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 10:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cckxZafOwtkUwQnY45Ez0scvGBO1+RBqrS/Kwfy+GPI=;
 b=aRBHGlo9cl1yPib7XKMPGRns2I2FuCcGsqzL38bNbe+ykJKRQeWyqWftrZo2B9c2j+
 5jZQD7V5LL3Okz0gdiaLkLFPyCYSep2vujo5Tff/rV5EgVN+88nncap9OU8voQe29mkb
 g3AWzhDXECzdq/OZYu3uLQo7TA9KE/LpQFQylgX5sWvXtO+12MLqIhqp5ECyk1FdN1cL
 u4t9EoP1+2lPirc09dsqWermqFfn3MRHv4qGXoNKxB5ScxNXPQTwGAQ/Sl39Oc/3bSZ2
 223v2DdC46XS+HFFW9a2IgkuFYcay1SY9R69bx8bKyPPk0EeuO5IpravkmM6mTbWxzjY
 xVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cckxZafOwtkUwQnY45Ez0scvGBO1+RBqrS/Kwfy+GPI=;
 b=QxjKa7EMY4hwHKd/7rVogY8Tc62TCEwyNNp69ciYNx0OHSag0khLJZOEnvGT8FfPTz
 cy5qtirOygfxVugeOKYugLy6QmQIJtZOcCkWV2QCCXmgmv6bFaV17IZjhG91HPKBBhm0
 hd+tgQDI6U8Y/N68vytPlWFogGMDrztOAIxl47jnyy/LjXx86tlZl9FRy8rTUT/kNq2B
 /nH0X0gm3mK2J6BiS8+xBtcnh+W7uxy2NQ27uEI2DrjBxlc0dkj/LM16eiuS/xmmv7Z3
 kJNxXwpWX5ZcAJkFuJC69chtGy+1Sjmjd7MtMpi5QxenMOVzHXSIKiD33nJ+VuPigrj0
 MB/A==
X-Gm-Message-State: ANoB5pnwQC29WBIGCslULSuxssWDJj24PJHApuhsj6uGGlG0PJEmhyHZ
 pGPfjfFXzK0H6LpKMNh9jUyuuEUx/XAW2bBj
X-Google-Smtp-Source: AA0mqf63LncSPUCHIeKN5DdCrjlg5EvvvIuUPul94n915cqd/Om7721TEoev5VqTIr4N7oQYjZ+jkw==
X-Received: by 2002:a05:6a20:1bdc:b0:ad:97cc:e948 with SMTP id
 cv28-20020a056a201bdc00b000ad97cce948mr21762670pzb.45.1671216818016; 
 Fri, 16 Dec 2022 10:53:38 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 13-20020a630b0d000000b0046ff3634a78sm1761300pgl.71.2022.12.16.10.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 10:53:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 12/13] accel/tcg: Factor tb_invalidate_phys_range_fast() out
Date: Fri, 16 Dec 2022 10:53:04 -0800
Message-Id: <20221216185305.3429913-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216185305.3429913-1-richard.henderson@linaro.org>
References: <20221216185305.3429913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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


