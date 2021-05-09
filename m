Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5B5377749
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:23:18 +0200 (CEST)
Received: from localhost ([::1]:41496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflH3-0001bn-EW
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAh-0005Qs-AN
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:16:45 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAf-0005Q1-6p
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:16:42 -0400
Received: by mail-wm1-x335.google.com with SMTP id n205so7785698wmf.1
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 08:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=atM6iFbVJYj8jFYxxSOXWsMaTzteWTiOf5UTdquIQgE=;
 b=X24ZRzeXNdLVs8jc5bMHuh/wtgivrCCs9r15bd85RO7U0l2+kQZbMYOlq10T0gPQU+
 mL2M985UbxDF57rhYFmyff+9jfj+5HWh3eq0yHUnkR3wMtCVGQq/TmQH1H5ichlECJJx
 DTI1x26DHAlqfiw0xIeM4fmQQAgV4nL0kcPtUvvR0DG8mj4+wNpOt9z8EDdLe48laamA
 cWbHgii88TbVgBTdRw3PHeRhbYqTzGWrGfatJXRLoZxYWkALOS3+UavsaTHtdQG5sDTE
 X24b3/FT9U4ZDrQQl48vNoLHcXhYsZ7zeqPmBzwmrhEWV+kKyFZmZqbJBNAz4zNJXKU1
 Etww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=atM6iFbVJYj8jFYxxSOXWsMaTzteWTiOf5UTdquIQgE=;
 b=Y0hSV4b27FoUXRXCKq06txyaF/ZsuTT+A/hgFjlYBN+/wDjByt3o658+nSGrCo/Ui1
 FUkLlFhzHKdFkjtrbtDJpYGir4v4UwAWXpDohOVGwoLx0pAX6qr4oj8mhv17IMzzaLxq
 ggwJ8E1cEQBxvCPkH4jghh9wOJdks3g39wkrZOgEGg9EQHu2rcgVPIPxWR22aytfX0W2
 K9gumUpCI6yGgTY8lQPNqhnnvNea1R2oUuQv49dy7uRqNaWTriVmkGHiM7w5lME3hRlU
 UkNd2N0Y1Yrh+IklD6fZiLGbxj2/oLASRbphu+Kqhq9fSsWVOMoXFvnzZiFOOI4IRtVs
 fYaA==
X-Gm-Message-State: AOAM531Yj7VRKayDLnMCLPcAiGLju5Mfjc2eCai+ieDt/nK72sKeXtgi
 cF9JuUVlsx/H00yOIKK08Es4GfX/z+P+4aFi
X-Google-Smtp-Source: ABdhPJzOZSuzUAlzmVmDj8BNoBj7SPbRBpg/vZ2+eBuZyAxn2hPL88BaT3ZCcuXwWhr98nUmg8rdEQ==
X-Received: by 2002:a1c:c206:: with SMTP id s6mr34099771wmf.47.1620573399739; 
 Sun, 09 May 2021 08:16:39 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f6sm19892242wru.72.2021.05.09.08.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 08:16:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] accel/tcg: Add tlb_flush_range_by_mmuidx()
Date: Sun,  9 May 2021 17:16:13 +0200
Message-Id: <20210509151618.2331764-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210509151618.2331764-1-f4bug@amsat.org>
References: <20210509151618.2331764-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/exec-all.h | 19 +++++++++++++++++++
 accel/tcg/cputlb.c      | 20 +++++++++++++++-----
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 6b036cae8f6..5a5f6d4c1a8 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -262,6 +262,20 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *cpu, target_ulong addr,
 void tlb_flush_page_bits_by_mmuidx_all_cpus_synced
     (CPUState *cpu, target_ulong addr, uint16_t idxmap, unsigned bits);
 
+/**
+ * tlb_flush_range_by_mmuidx
+ * @cpu: CPU whose TLB should be flushed
+ * @addr: virtual address of the start of the range to be flushed
+ * @len: length of range to be flushed
+ * @idxmap: bitmap of mmu indexes to flush
+ * @bits: number of significant bits in address
+ *
+ * For each mmuidx in @idxmap, flush all pages within [@addr,@addr+@len),
+ * comparing only the low @bits worth of each virtual page.
+ */
+void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
+                               target_ulong len, uint16_t idxmap,
+                               unsigned bits);
 /**
  * tlb_set_page_with_attrs:
  * @cpu: CPU to add this TLB entry for
@@ -365,6 +379,11 @@ tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *cpu, target_ulong addr,
                                               uint16_t idxmap, unsigned bits)
 {
 }
+static inline void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
+                                             target_ulong len, uint16_t idxmap,
+                                             unsigned bits)
+{
+}
 #endif
 /**
  * probe_access:
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 36e7831ef70..16924ceb777 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -825,14 +825,18 @@ static void tlb_flush_page_bits_by_mmuidx_async_2(CPUState *cpu,
     g_free(d);
 }
 
-void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
-                                   uint16_t idxmap, unsigned bits)
+void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
+                               target_ulong len, uint16_t idxmap,
+                               unsigned bits)
 {
     TLBFlushRangeData d;
     run_on_cpu_data runon;
 
-    /* If all bits are significant, this devolves to tlb_flush_page. */
-    if (bits >= TARGET_LONG_BITS) {
+    /*
+     * If all bits are significant, and len is small,
+     * this devolves to tlb_flush_page.
+     */
+    if (bits >= TARGET_LONG_BITS && len <= TARGET_PAGE_SIZE) {
         tlb_flush_page_by_mmuidx(cpu, addr, idxmap);
         return;
     }
@@ -844,7 +848,7 @@ void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
 
     /* This should already be page aligned */
     d.addr = addr & TARGET_PAGE_MASK;
-    d.len = TARGET_PAGE_SIZE;
+    d.len = len;
     d.idxmap = idxmap;
     d.bits = bits;
 
@@ -860,6 +864,12 @@ void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
     }
 }
 
+void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
+                                   uint16_t idxmap, unsigned bits)
+{
+    tlb_flush_range_by_mmuidx(cpu, addr, TARGET_PAGE_SIZE, idxmap, bits);
+}
+
 void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
                                             target_ulong addr,
                                             uint16_t idxmap,
-- 
2.26.3


