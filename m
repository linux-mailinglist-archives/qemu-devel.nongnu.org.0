Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E6564803A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 10:38:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Zok-0004G9-0E; Fri, 09 Dec 2022 04:37:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Zoh-0004Fd-Ep
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:37:15 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Zof-0003s9-K9
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:37:15 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so2984747wmi.3
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 01:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=le0MHQk9HQYTwazHbeRMYTj7OI4RdAPESdb8VrJM2D8=;
 b=JwhW9f+hi/mAmWPhz7bJmfNq2GBFMd5apvMf+COEjuVJldNBzbT3KFeqOAlxfbTiX4
 Kp+eBZwtZ13D3I3tgO+JsPmNR+O8CdkYbYwUvTgMUqYxgP8mN0Y3rSdhFa2aZhwueGll
 r914EpRUJZBQpr+M+tkh/gbPmkYZiZN1b9KbodvAqqpMqovjOyzRX5kmazJZ5Q2Y1aqI
 aclbmuaBqUqEUvO2zke0H1YW4SmZ5VYeZ8SFyrHOZ6mAN/EB4b9or+NmxvkiAUkt8MdT
 ULB7zmcv1bR726xUI8DZAeViwW7avvj1wBh7GyroyrCK0kKfCnt9rJWmUgHo0BP3nJa6
 sLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=le0MHQk9HQYTwazHbeRMYTj7OI4RdAPESdb8VrJM2D8=;
 b=C9pX2nQKMj+2cNaT58u0ERbxe2sysqkkwzDARhZ9J6dmAIe9ofgGOLvYIQ6FJeIotO
 6IMSYdrUByxqfQceBcNiuJ2NR5WRq/MsedNQmvtJsFA53/JnDuskUekGhB87z5E+VjpS
 5H1lTxlkgHohAR+nbOmJn9HoPh5JD93KXFg937xuvS9LzUsGOJUQE1Tmqh0MfYwl4+oZ
 QCQDB6qs1/gSJx/h/3OccK9zZcMPiHpii9WYaX1FvpnC7YCE99yly4z594TM0NSpYgg9
 wL5z9a1hnIOz91YUSQwbaM0R5Q5vcxwA818UV6FeLHv8qKI6PAvVfyIlxNjAe6uqBCbC
 B8rQ==
X-Gm-Message-State: ANoB5pmabd8vtdO5LbJS3nbgmW6C2izCag8TwpBxRt2fLl6OWwDEE7Xu
 jMxA60f5BofbhLfHEYLRPuS7oSoWQrAKiuP1OzA=
X-Google-Smtp-Source: AA0mqf6BkrrfpXwB70MA5yPdxBnR5cLU3rq88MwK97zNAXm/89bndQOrSAmAyG8JRbN6HnFppZStBg==
X-Received: by 2002:a1c:7c18:0:b0:3cf:a6d9:7b3c with SMTP id
 x24-20020a1c7c18000000b003cfa6d97b3cmr4088228wmc.21.1670578631079; 
 Fri, 09 Dec 2022 01:37:11 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b003cf57329221sm8899649wmq.14.2022.12.09.01.37.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 01:37:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 4/5] accel/tcg: Factor tb_invalidate_phys_range_fast()
 out
Date: Fri,  9 Dec 2022 10:36:48 +0100
Message-Id: <20221209093649.43738-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209093649.43738-1-philmd@linaro.org>
References: <20221209093649.43738-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cputlb.c   |  5 +----
 accel/tcg/internal.h |  3 +++
 accel/tcg/tb-maint.c | 21 +++++++++++++++++----
 3 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 6402fe11c1..03674d598f 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1508,10 +1508,7 @@ static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
     trace_memory_notdirty_write_access(mem_vaddr, ram_addr, size);
 
     if (!cpu_physical_memory_get_dirty_flag(ram_addr, DIRTY_MEMORY_CODE)) {
-        struct page_collection *pages
-            = page_collection_lock(ram_addr, ram_addr + size);
-        tb_invalidate_phys_page_locked_fast(pages, ram_addr, size, retaddr);
-        page_collection_unlock(pages);
+        tb_invalidate_phys_range_fast(ram_addr, size, retaddr);
     }
 
     /*
diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index d8b58c1e70..db078390b1 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -42,6 +42,9 @@ void tb_invalidate_phys_page_locked_fast(struct page_collection *pages,
                                          uintptr_t retaddr);
 struct page_collection *page_collection_lock(tb_page_addr_t start,
                                              tb_page_addr_t end);
+void tb_invalidate_phys_range_fast(ram_addr_t ram_addr,
+                                   unsigned size,
+                                   uintptr_t retaddr);
 void page_collection_unlock(struct page_collection *set);
 G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 #endif /* CONFIG_SOFTMMU */
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index bf84728910..4dc2fa1060 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -1194,10 +1194,6 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
 }
 
 /*
- * len must be <= 8 and start must be a multiple of len.
- * Called via softmmu_template.h when code areas are written to with
- * iothread mutex not held.
- *
  * Call with all @pages in the range [@start, @start + len[ locked.
  */
 void tb_invalidate_phys_page_locked_fast(struct page_collection *pages,
@@ -1215,4 +1211,21 @@ void tb_invalidate_phys_page_locked_fast(struct page_collection *pages,
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
+    tb_invalidate_phys_page_locked_fast(pages, ram_addr, size, retaddr);
+    page_collection_unlock(pages);
+}
+
 #endif /* CONFIG_USER_ONLY */
-- 
2.38.1


