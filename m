Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D05D3904D1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:13:31 +0200 (CEST)
Received: from localhost ([::1]:55306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYkM-0007pN-5P
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYay-0002B3-KC
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:48 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYau-0004Bh-PT
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:48 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x8so32601248wrq.9
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Wp1Tfw/cNQ1FJuNdktBt5w18+3l6z2igOWDQmJdVNNA=;
 b=fTRwj307kltm12XTck1BoDVv63kLjW39k86luyYiOM2soNOgRCoOkErjXXsjjATRbA
 KBvbFHi+TfOfzO0w3dkmijIFkNilR043UCgwGcTb/xD+JOvOILeTiGCWA6WB47ABSvwt
 ZMq/mHr7qc8P9bjylApv6xMQbTynHmplHpU2cw56VDDwLUefNjT07faNx/9V5WmR0eBh
 DcMcKKi6cOqO37qAJjqzrDbuoNN1WP1XPD0f21Z9uwvJMoHdGc3oVl6YS1XUH9Tlatn6
 /qcMFJLSKvogHPmpB9e4sE0We7csWNZsDINPh7R3rlp6jBAxT/vFimjoR8X7YLsx5gQt
 AwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wp1Tfw/cNQ1FJuNdktBt5w18+3l6z2igOWDQmJdVNNA=;
 b=Chu+Kv78EH2HyG3LRYcLpY/6kz74CDSv5rCmgROYskiItJZ2I5N0I4Qb81W20Hkydq
 c5prqGauSDdQo2jUcK7YLU4Eq0ilwgekZOwrs9YK8Sw86VGQkFY2Abja+NWCIiEEHQwB
 74bWN2wdZPu/Eo+ZXmjlYdWwG/bciCh4ckgXm87MIkjzt5SK1R5ytvEAa3wauze6F80E
 oj/UCGAJqxhKDhYoWcLgDDnbmg1myLT2AnRUzfpiJ7e8q8vacFsTn8fX/9yESj06uWW4
 6wyXGGrM0MWkoDgJUTTCrWBram6YkFNXA1bwtWUdp96toQskcSOCCFT0iB+jZnLiwGWJ
 xFSw==
X-Gm-Message-State: AOAM531H0fuGQBbapuErH/1HP9EM9kBUJHLyhvSJKGrMOhKWrzHBPjBY
 EfGzH/SmlqgMCuVAW1uWy5r60gGfUWrnKfdl
X-Google-Smtp-Source: ABdhPJyM9Kph2WjXfB5SaFTRjQEikSbAqfVpu5fnsgSluXG6EI7vn7oxEzfddqdGiRmYBiUtFH3sNw==
X-Received: by 2002:adf:d231:: with SMTP id k17mr27023654wrh.78.1621955023404; 
 Tue, 25 May 2021 08:03:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 016/114] accel/tlb: Add
 tlb_flush_range_by_mmuidx_all_cpus_synced()
Date: Tue, 25 May 2021 16:01:46 +0100
Message-Id: <20210525150324.32370-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Forward tlb_flush_page_bits_by_mmuidx_all_cpus_synced to
tlb_flush_range_by_mmuidx_all_cpus_synced passing TARGET_PAGE_SIZE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210509151618.2331764-7-f4bug@amsat.org
Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/exec-all.h | 12 ++++++++++++
 accel/tcg/cputlb.c      | 27 ++++++++++++++++++++-------
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 9a3dbb7ec08..8021adf38f4 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -281,6 +281,11 @@ void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
 void tlb_flush_range_by_mmuidx_all_cpus(CPUState *cpu, target_ulong addr,
                                         target_ulong len, uint16_t idxmap,
                                         unsigned bits);
+void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
+                                               target_ulong addr,
+                                               target_ulong len,
+                                               uint16_t idxmap,
+                                               unsigned bits);
 
 /**
  * tlb_set_page_with_attrs:
@@ -397,6 +402,13 @@ static inline void tlb_flush_range_by_mmuidx_all_cpus(CPUState *cpu,
                                                       unsigned bits)
 {
 }
+static inline void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
+                                                             target_ulong addr,
+                                                             target_long len,
+                                                             uint16_t idxmap,
+                                                             unsigned bits)
+{
+}
 #endif
 /**
  * probe_access:
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index a63cf187a4f..4b3ac7093cb 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -887,16 +887,20 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
                                        idxmap, bits);
 }
 
-void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
-                                                   target_ulong addr,
-                                                   uint16_t idxmap,
-                                                   unsigned bits)
+void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                               target_ulong addr,
+                                               target_ulong len,
+                                               uint16_t idxmap,
+                                               unsigned bits)
 {
     TLBFlushRangeData d, *p;
     CPUState *dst_cpu;
 
-    /* If all bits are significant, this devolves to tlb_flush_page. */
-    if (bits >= TARGET_LONG_BITS) {
+    /*
+     * If all bits are significant, and len is small,
+     * this devolves to tlb_flush_page.
+     */
+    if (bits >= TARGET_LONG_BITS && len <= TARGET_PAGE_SIZE) {
         tlb_flush_page_by_mmuidx_all_cpus_synced(src_cpu, addr, idxmap);
         return;
     }
@@ -908,7 +912,7 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
 
     /* This should already be page aligned */
     d.addr = addr & TARGET_PAGE_MASK;
-    d.len = TARGET_PAGE_SIZE;
+    d.len = len;
     d.idxmap = idxmap;
     d.bits = bits;
 
@@ -926,6 +930,15 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
                           RUN_ON_CPU_HOST_PTR(p));
 }
 
+void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                                   target_ulong addr,
+                                                   uint16_t idxmap,
+                                                   unsigned bits)
+{
+    tlb_flush_range_by_mmuidx_all_cpus_synced(src_cpu, addr, TARGET_PAGE_SIZE,
+                                              idxmap, bits);
+}
+
 /* update the TLBs so that writes to code in the virtual page 'addr'
    can be detected */
 void tlb_protect_code(ram_addr_t ram_addr)
-- 
2.20.1


