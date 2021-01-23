Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0EC3017CA
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 19:54:05 +0100 (CET)
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3O2u-0000Ic-FL
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 13:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3Nze-0005Kq-B4
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:42 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3NzX-0008H1-LX
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:42 -0500
Received: by mail-pf1-x42a.google.com with SMTP id u67so5963317pfb.3
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UqHrCB4kNK0rhQOAfSyXF5GRntYhHhyAfqhZg0V8bdY=;
 b=jMNXWj6T7cZseMzBnOPaEaltvnEvQwRlYI6uoqAqmjMEmJ7SLx4I+QiHcDB3fVO47N
 8JioZzw/phU31w0owSLSPUtppOXLeiQ+qJ6yuMoKTsLoyTBPxzvyEtMFVVNuK8x0efTp
 S3tMyM9XWnjy3xrLjlnIB1QiiZn5D8sbDSM86RjCt2gHsxuoh4DjlcCu9o02AesnVmSe
 MQ+6KJztbBRJIFVk5KicYTLqcDV/yctx+yPwOHqkjzShVvJjkZOTvy1oX4fk4DvSZ+ip
 CUFTDt4fQjrvVVg65p6oKfHqIvaOFnD4Samr7pGOU1ys0BQuR3hf7oqamDRcDDfoQqaY
 pLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UqHrCB4kNK0rhQOAfSyXF5GRntYhHhyAfqhZg0V8bdY=;
 b=sUvMe3Tx4WaUCQpoyeQBaaudOhT+zuadc1kuCE9LV0l2W2Pvcgyn3rM02WribuJFDL
 4P5GRgDJ8i3W23L1tlqRROi+F6KewqOiybYKFztRJ42aq5CLf3o0phlYMBTgmHaNZegv
 yM4qxyGv41epk4N6ZzvOPf2KKJIZ3CQ53kE7EzjkvcODNsa61Ncy7CKPToKCenTsZjel
 N7XBF8kwq7e4ATC8kPjRGER31iYo4M9xrnVtdunUpODr/hchHwYI04Olo24j/r3foiRh
 DrK8D2U1RFWpuNV4sI5x6J6SFw3Ruyu3JmVMZh/k0YD+xZzOwaXxe9m7Szw2/w+5qZWF
 Z5iA==
X-Gm-Message-State: AOAM531LItkzdP48jlAu7uxO3aFu6yoCKal44tHCruu4dv7o3V9P7Z2r
 uwV/gdIG5puvehXs68z3nSmsm+w27vR7zQ==
X-Google-Smtp-Source: ABdhPJzEdakmKZXAmWc2j7tIAX0o+KV3b85Z8wUJdixSj6ZhgRCTv8TtnjgqyL6wkOLpAzRErS2pOg==
X-Received: by 2002:a63:1602:: with SMTP id w2mr11035870pgl.128.1611427834009; 
 Sat, 23 Jan 2021 10:50:34 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id j19sm5018614pfn.14.2021.01.23.10.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 10:50:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/10] accel/tcg: Move tb_flush_jmp_cache() to cputlb.c
Date: Sat, 23 Jan 2021 08:50:16 -1000
Message-Id: <20210123185020.1766324-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123185020.1766324-1-richard.henderson@linaro.org>
References: <20210123185020.1766324-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move and make the function static, as the only users
are here in cputlb.c.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   |  3 ---
 accel/tcg/cputlb.c        | 18 ++++++++++++++++++
 accel/tcg/translate-all.c | 17 -----------------
 3 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 516013e735..1e3e7cf8e7 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -663,9 +663,6 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
 void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
 void tlb_set_dirty(CPUState *cpu, target_ulong vaddr);
 
-/* exec.c */
-void tb_flush_jmp_cache(CPUState *cpu, target_ulong addr);
-
 MemoryRegionSection *
 address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
                                   hwaddr *xlat, hwaddr *plen,
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index ced3dc077e..0fa1643ed3 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -25,6 +25,7 @@
 #include "exec/address-spaces.h"
 #include "exec/cpu_ldst.h"
 #include "exec/cputlb.h"
+#include "exec/tb-hash.h"
 #include "exec/memory-internal.h"
 #include "exec/ram_addr.h"
 #include "tcg/tcg.h"
@@ -97,6 +98,23 @@ static void tlb_window_reset(CPUTLBDesc *desc, int64_t ns,
     desc->window_max_entries = max_entries;
 }
 
+static void tb_jmp_cache_clear_page(CPUState *cpu, target_ulong page_addr)
+{
+    unsigned int i, i0 = tb_jmp_cache_hash_page(page_addr);
+
+    for (i = 0; i < TB_JMP_PAGE_SIZE; i++) {
+        qatomic_set(&cpu->tb_jmp_cache[i0 + i], NULL);
+    }
+}
+
+static void tb_flush_jmp_cache(CPUState *cpu, target_ulong addr)
+{
+    /* Discard jump cache entries for any tb which might potentially
+       overlap the flushed page.  */
+    tb_jmp_cache_clear_page(cpu, addr - TARGET_PAGE_SIZE);
+    tb_jmp_cache_clear_page(cpu, addr);
+}
+
 /**
  * tlb_mmu_resize_locked() - perform TLB resize bookkeeping; resize if necessary
  * @desc: The CPUTLBDesc portion of the TLB
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ca7ef6aa17..5bd0e267c8 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2461,23 +2461,6 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
     cpu_loop_exit_noexc(cpu);
 }
 
-static void tb_jmp_cache_clear_page(CPUState *cpu, target_ulong page_addr)
-{
-    unsigned int i, i0 = tb_jmp_cache_hash_page(page_addr);
-
-    for (i = 0; i < TB_JMP_PAGE_SIZE; i++) {
-        qatomic_set(&cpu->tb_jmp_cache[i0 + i], NULL);
-    }
-}
-
-void tb_flush_jmp_cache(CPUState *cpu, target_ulong addr)
-{
-    /* Discard jump cache entries for any tb which might potentially
-       overlap the flushed page.  */
-    tb_jmp_cache_clear_page(cpu, addr - TARGET_PAGE_SIZE);
-    tb_jmp_cache_clear_page(cpu, addr);
-}
-
 static void print_qht_statistics(struct qht_stats hst)
 {
     uint32_t hgram_opts;
-- 
2.25.1


