Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB8E64F14A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 19:55:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Fq4-0000cu-GO; Fri, 16 Dec 2022 13:53:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fq0-0000bC-Mx
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:40 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Fpy-0003Hg-GW
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 13:53:39 -0500
Received: by mail-pj1-x102f.google.com with SMTP id js9so3389789pjb.2
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 10:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KNHQY/4RRXvJU0V3H4/K7OQJyFUdroRHt7gYQp+f6XQ=;
 b=XJDTqtEjiwgdScx7A9RGOSdszs0y4Mc+i5zwf4YKbUlfOWMZfpd6JNtQZ+0aNCxFKU
 0rRZRSQPSJzalz8lTuWUtNcnZRuUpeYJltJq03f/Ga2dBqCFhUth3aeeJvn1y+On1rdi
 JIZ1sQm/IUZjh7BXXBZDCx7Xsfvl+6ZSsZv6plmay6VdYm134dxi/vqdgOhKsu4Baysa
 x6LMoLSpqc0Clze/IluEbwVqIcR9ZN4RQ19hfTDwLFStPqNkTaRUQNXfq0TzZ/CNcOuK
 xBtm8pqNpkRM4WCXqCXe8zxjWlHbQiX1NvOxHQQipFvW8QXQAJQ/G2Ensazd+zELZrTA
 mL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KNHQY/4RRXvJU0V3H4/K7OQJyFUdroRHt7gYQp+f6XQ=;
 b=XgCfUTisv1vJ3ooPjurIlXXs5RfQ5HT/S8Iy+24ABj+U3rkURxhucrLJ85VsIdQQzT
 kN75G5NqV3m+dTmMMiX+B48DzRpAQ3++8vUo6lCUz0n452lDFNWSvBlURkrx1OZkqAd6
 QCbWWVZBnd16OJFe6eybobjs2YL6COOKK3tB8bRWxIHlBn7pKJbJYu1VyOIyzmqqmrnJ
 pOqbc3s53sPdes1YdqFwXO+xEd8h6ITPULn6AvX9az5+wNtg7eRFIpJFptgr8FhQLXsx
 AIKI/z4MMqlDiWG3v5fJgvoWsB0oVsLhHD/jKKQVYnNiy1sGywYu1FCWf99hirQasji5
 1oAA==
X-Gm-Message-State: ANoB5plknwq4dn9ZFTXiXIMF5ShUqRD3PGMlU4fWchBekoDtQQQibRCO
 0cd2tLODW4mXBfEJKOlj3qFTl2B4EjsdS6V4
X-Google-Smtp-Source: AA0mqf5FFKD+anYAuIHNfB7msWbNtPZFlRYcmo4Q40FUgbxqo/2hmnmQwELampsLr+wFdOiJd7AMUQ==
X-Received: by 2002:a17:90a:af85:b0:20d:bd60:ad8d with SMTP id
 w5-20020a17090aaf8500b0020dbd60ad8dmr42303027pjq.9.1671216817170; 
 Fri, 16 Dec 2022 10:53:37 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 13-20020a630b0d000000b0046ff3634a78sm1761300pgl.71.2022.12.16.10.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 10:53:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 11/13] accel/tcg: Rename tb_invalidate_phys_page_fast{,
 __locked}()
Date: Fri, 16 Dec 2022 10:53:03 -0800
Message-Id: <20221216185305.3429913-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216185305.3429913-1-richard.henderson@linaro.org>
References: <20221216185305.3429913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Emphasize this function is called with pages locked.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221209093649.43738-4-philmd@linaro.org>
[rth: Use "__locked" suffix, to match other instances.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h | 6 +++---
 accel/tcg/cputlb.c   | 2 +-
 accel/tcg/tb-maint.c | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 35419f3fe1..d10ab69ed0 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -37,9 +37,9 @@ void page_table_config_init(void);
 
 #ifdef CONFIG_SOFTMMU
 struct page_collection;
-void tb_invalidate_phys_page_fast(struct page_collection *pages,
-                                  tb_page_addr_t start, int len,
-                                  uintptr_t retaddr);
+void tb_invalidate_phys_page_fast__locked(struct page_collection *pages,
+                                          tb_page_addr_t start, int len,
+                                          uintptr_t retaddr);
 struct page_collection *page_collection_lock(tb_page_addr_t start,
                                              tb_page_addr_t end);
 void page_collection_unlock(struct page_collection *set);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index ac459478f4..f7963d3af8 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1510,7 +1510,7 @@ static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
     if (!cpu_physical_memory_get_dirty_flag(ram_addr, DIRTY_MEMORY_CODE)) {
         struct page_collection *pages
             = page_collection_lock(ram_addr, ram_addr + size);
-        tb_invalidate_phys_page_fast(pages, ram_addr, size, retaddr);
+        tb_invalidate_phys_page_fast__locked(pages, ram_addr, size, retaddr);
         page_collection_unlock(pages);
     }
 
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 1676d359f2..8edfd910c4 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -1190,9 +1190,9 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
  *
  * Call with all @pages in the range [@start, @start + len[ locked.
  */
-void tb_invalidate_phys_page_fast(struct page_collection *pages,
-                                  tb_page_addr_t start, int len,
-                                  uintptr_t retaddr)
+void tb_invalidate_phys_page_fast__locked(struct page_collection *pages,
+                                          tb_page_addr_t start, int len,
+                                          uintptr_t retaddr)
 {
     PageDesc *p;
 
-- 
2.34.1


