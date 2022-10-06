Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598425F5F93
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:24:42 +0200 (CEST)
Received: from localhost ([::1]:37198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHV3-0002tH-Fn
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIJ-0005fl-UG
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:31 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHII-0006xh-Bs
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:31 -0400
Received: by mail-pf1-x430.google.com with SMTP id g28so853136pfk.8
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=a7Aglx93RFVrz7iNIRH3QorEiqL8BPiOrMD+Ih+/A4s=;
 b=uFCPEFgtmw/LX60HcDFFguvWylfRw0B6cwtJySQohTBaxxxP69DFdPPgL14UyIDD7U
 +rCxcoPULS6l9pDwqEZiFKwf71QKfPl8H0c+7uvyxOQY1fdCWv5Wjd9lwM3bgHRpX/G+
 642IzKWAlCLWJ3eQSN3XIsPBySpMtEvQOoLwuo01pyEFZJZnPxcYRDC3adCdDprB21+I
 1p7cSp4spc/EgKQECFVVBke3vKRP8XKHrLEmR9LYykmLnFqW3Ro4NDcCflhurTXkfxfL
 bz6qxXgXPEwGQncSO3a+9sEVHUP6yVhsACZ4xGqqjqp1jba7ChwKDYynLBx6jRqxfOns
 neQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=a7Aglx93RFVrz7iNIRH3QorEiqL8BPiOrMD+Ih+/A4s=;
 b=ilMb8vGHIiHwVZtiLg+wIrXQp+frF34bQg997o01iWTj0r7D+VRdqr32LKjYKMK5GW
 H1N8wMm2BTb7a3fMkExDvCZKWEmUNTe0qYmt/Fj8yfXkwQ/zOWUKcTbm93ARvE0C5h82
 Lff6Wo9hhWEm7h8S/dWD63yM08StURjScTOGRfMdO6sQKldrbTW7pYTGWMrtmsKxcm4u
 5LZ9WGS2aRD/U0z5mAZnWNoV3Yw96yPF61Lo1qutbVGQ3TkXKAte6rZtJvkefSZC8mmW
 Oijv9WG8ygui1Bxm5KqmIb+uxWB5885Tv+OU6A6bxvzkx2BPPRz0vS8catx6JrAqmvob
 qeFg==
X-Gm-Message-State: ACrzQf2A8oE813G4Mzi/rRdpgqXyyZ7M6wJbp55N1XAnH4m6ffSQJxo/
 tPiBbslVmL/h97DakKZs/ZFt7jRdtCav0w==
X-Google-Smtp-Source: AMsMyM7r/G0/hxE6H1lkK+Kgo80kZakpvBRPvyyy90TLcMRa6Gv32eYLNnU/Mimxaag1mJJxurItig==
X-Received: by 2002:a63:4283:0:b0:457:dced:8ba3 with SMTP id
 p125-20020a634283000000b00457dced8ba3mr2571816pga.220.1665025889043; 
 Wed, 05 Oct 2022 20:11:29 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 11/24] accel/tcg: Rename tb_invalidate_phys_page_range and
 drop end parameter
Date: Wed,  5 Oct 2022 20:11:00 -0700
Message-Id: <20221006031113.1139454-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is is never called with a real range,
only for a single page.  Drop the second parameter
and rename to tb_invalidate_phys_page.

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


