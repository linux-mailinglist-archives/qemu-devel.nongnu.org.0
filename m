Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6B460D938
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:22:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVtw-0004x0-LZ; Tue, 25 Oct 2022 22:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtv-0004ws-JW
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:15 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVtu-00019J-29
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:15 -0400
Received: by mail-pg1-x531.google.com with SMTP id 20so13457167pgc.5
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KvjMeVIEaU8EHUZx3hOOt4jSPjq3zK70k+5NK6+i9OM=;
 b=WnkSuzekzt+8X5xxoOUlq3e9IAQzUUgG+v9U9kY5tC94ZsRGwsIEeQNBazcZbk1iYT
 6euntrVfzZH7ae8vuii1rBEgVomBuviT7sj2v77BFqAjvltJ83TQxvXf0tRBscAdGhO+
 9RgmGihi3KlvikQG7w3u1/i9S9mPi1Pnpd8Giuqvg/NfAd6u2VgREitMvAHakOaz0KUq
 EaMCe967O++2bYr1jlL9UfjgqxO27H1IjtLdfQ1G80suLeq/wLPYuP4hdUU88UsZ70ln
 OO+n0cGGXwAqaUZ6XOtWZBl7Jf/d++e7800V+7ngSjpF/IkNh0friPp64zNtdRBICd7I
 QVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KvjMeVIEaU8EHUZx3hOOt4jSPjq3zK70k+5NK6+i9OM=;
 b=12PqkSYgG17mkf9WCogmb2CbKyGATu2GKw7jakEHdA6oEVxv5imvlEG8SEfPxf/2lI
 67dXA6F1tjsnkGidBaTMMq63kywFMleKaJ4Vx/HJawuvPuBx3wjzzPMPkOHmlZgIcpK8
 oMhg0j7UBvhPVe9S6SSD/sJummwvpjT1tp0LCLsCNYMSJ42z+tU2pmi8YHZzaP+Y0LuI
 q6BYxSPIkQrAda94bkT45FcFj2YEsEx4sIqgk/el+nELmphKvXm4siBJmBwlnETpJgTh
 6YFepKgIe5goSj1y/ODJcfDnE77ZqwOYZfEXGh9rvvWEjdjaEdi6LubpRaunQUy9cYE/
 KoZA==
X-Gm-Message-State: ACrzQf2CifarrvOHC/zdYhuGhZgi07SXm5AabqT12DyTj0/uRusYGSWs
 Y6JmBCeibheE1b6cjYAh81VMd8MTBEYsCqz8
X-Google-Smtp-Source: AMsMyM6FeHradWrBmN64CXdI8Fd5xIkDDM8DmCvK6mJIzEAD0pzD+wNp1LrgQ/P48guv/A/k3/NVFg==
X-Received: by 2002:a65:5b0b:0:b0:462:da7a:1ded with SMTP id
 y11-20020a655b0b000000b00462da7a1dedmr18451669pgq.605.1666750332271; 
 Tue, 25 Oct 2022 19:12:12 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 17/47] accel/tcg: Rename tb_invalidate_phys_page_range and drop
 end parameter
Date: Wed, 26 Oct 2022 12:10:46 +1000
Message-Id: <20221026021116.1988449-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This function is is never called with a real range,
only for a single page.  Drop the second parameter
and rename to tb_invalidate_phys_page.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translate-all.h |  2 +-
 accel/tcg/tb-maint.c         | 15 ++++++++-------
 cpu.c                        |  4 ++--
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/include/exec/translate-all.h b/include/exec/translate-all.h
index 9f646389af..3e9cb91565 100644
--- a/include/exec/translate-all.h
+++ b/include/exec/translate-all.h
@@ -29,7 +29,7 @@ void page_collection_unlock(struct page_collection *set);
 void tb_invalidate_phys_page_fast(struct page_collection *pages,
                                   tb_page_addr_t start, int len,
                                   uintptr_t retaddr);
-void tb_invalidate_phys_page_range(tb_page_addr_t start, tb_page_addr_t end);
+void tb_invalidate_phys_page(tb_page_addr_t addr);
 void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr);
 
 #ifdef CONFIG_USER_ONLY
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 92170cbbc1..bac43774c0 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -565,25 +565,26 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
 }
 
 /*
- * Invalidate all TBs which intersect with the target physical address range
- * [start;end[. NOTE: start and end must refer to the *same* physical page.
- * 'is_cpu_write_access' should be true if called from a real cpu write
- * access: the virtual CPU will exit the current TB if code is modified inside
- * this TB.
+ * Invalidate all TBs which intersect with the target physical
+ * address page @addr.
  *
  * Called with mmap_lock held for user-mode emulation
  */
-void tb_invalidate_phys_page_range(tb_page_addr_t start, tb_page_addr_t end)
+void tb_invalidate_phys_page(tb_page_addr_t addr)
 {
     struct page_collection *pages;
+    tb_page_addr_t start, end;
     PageDesc *p;
 
     assert_memory_lock();
 
-    p = page_find(start >> TARGET_PAGE_BITS);
+    p = page_find(addr >> TARGET_PAGE_BITS);
     if (p == NULL) {
         return;
     }
+
+    start = addr & TARGET_PAGE_MASK;
+    end = start + TARGET_PAGE_SIZE;
     pages = page_collection_lock(start, end);
     tb_invalidate_phys_page_range__locked(pages, p, start, end, 0);
     page_collection_unlock(pages);
diff --git a/cpu.c b/cpu.c
index 14365e36f3..2a09b05205 100644
--- a/cpu.c
+++ b/cpu.c
@@ -277,7 +277,7 @@ void list_cpus(const char *optarg)
 void tb_invalidate_phys_addr(target_ulong addr)
 {
     mmap_lock();
-    tb_invalidate_phys_page_range(addr, addr + 1);
+    tb_invalidate_phys_page(addr);
     mmap_unlock();
 }
 #else
@@ -298,7 +298,7 @@ void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs)
         return;
     }
     ram_addr = memory_region_get_ram_addr(mr) + addr;
-    tb_invalidate_phys_page_range(ram_addr, ram_addr + 1);
+    tb_invalidate_phys_page(ram_addr);
 }
 #endif
 
-- 
2.34.1


