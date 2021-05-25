Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871F63904A0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:08:55 +0200 (CEST)
Received: from localhost ([::1]:38016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYfu-0004hU-J2
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYav-0001zU-Bk
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:45 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYar-00048a-Hv
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:45 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r12so32614048wrp.1
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aYnbRqEtX/G/24dkOfBXmmy8TqbaOH7Q6ZCKhOBKqLg=;
 b=fW+62xQYz6gvP7IDoN0YagTPJOaVrDSqkD1QM5K89ZFqVBVodlZUAUqZF+pP5UMCeO
 h/BvfRgz73OJy5liECWocy7JuffaoWV6gxLSYi+WEBzgdjlLRfD13gFl2IxUXx2xujeO
 DGrvBbfyzL96Rt5toI+NV3VIQ/v9/pTv1XTrdu08Mjbyem/7E94pH8cC3CM2bBm7dBg9
 TeuBWBeny7vK8JcV+bFbK1/yzpCSyptL6SDupW/ilR3B8HzSuhMaNaZATdS9OhIOLomj
 yNvjR/TtFy1saKK8rorOMuD6gL0dsRW75Q5yIFWSLxHylN2Sp/Ie3dUTKN2wrXkaNqYE
 Tc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aYnbRqEtX/G/24dkOfBXmmy8TqbaOH7Q6ZCKhOBKqLg=;
 b=sCl1u2SGl0xfWOhBObJxpI1mqf2E/OZUGLpjhEAKjjO3qsVjkhVgUnH6onxv4LXkAT
 Jt1iKVzNEniUhgIa9FEPqlqB/fUVEOKcjjsN9QSFWD9rhnbI8vsJbQPJQGzAWAfdZPeV
 ReMVWF2bDjgUk6Jyi+xvtWH+RKuLhc7svospigaOl+dtr9g4IK0E3gQJFpJDSIQX5u51
 xBV7Ztx2pMcwE8Zz4VAL/bUJRLRhyN/3tBIDeFjnmqmPkBpLMhCzecxuMBOrUGyL3hFJ
 piTGAHpDbCbac3WA7eoFshLDuTfitkNoUoXDXXzZw7CTZpMy08pVIZgTd2A35rZSbNtP
 nhnA==
X-Gm-Message-State: AOAM530Re5jXaFqq8CQ4oA9+LngCIzFCtRV5vATsPlcOR4EtWU+BFzgD
 fl2ymxLnUVWQbp7fpHmhC7z6KGxF1H2cLIDn
X-Google-Smtp-Source: ABdhPJwyoBl9NbM6LywZZ5Q4rJWjBin84ab/d7Ocib2A1y5xFnoOA80wtuDuApOJI2XPB6U8nczfsw==
X-Received: by 2002:adf:f341:: with SMTP id e1mr26678564wrp.352.1621955019985; 
 Tue, 25 May 2021 08:03:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 012/114] accel/tlb: Rename TLBFlushPageBitsByMMUIdxData ->
 TLBFlushRangeData
Date: Tue, 25 May 2021 16:01:42 +0100
Message-Id: <20210525150324.32370-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

Rename the structure to match the rename of tlb_flush_range_locked.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210509151618.2331764-4-f4bug@amsat.org
Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/tcg/cputlb.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index df5d5dbf879..36e7831ef70 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -762,11 +762,11 @@ typedef struct {
     target_ulong len;
     uint16_t idxmap;
     uint16_t bits;
-} TLBFlushPageBitsByMMUIdxData;
+} TLBFlushRangeData;
 
 static void
 tlb_flush_page_bits_by_mmuidx_async_0(CPUState *cpu,
-                                      TLBFlushPageBitsByMMUIdxData d)
+                                      TLBFlushRangeData d)
 {
     CPUArchState *env = cpu->env_ptr;
     int mmu_idx;
@@ -790,7 +790,7 @@ tlb_flush_page_bits_by_mmuidx_async_0(CPUState *cpu,
 }
 
 static bool encode_pbm_to_runon(run_on_cpu_data *out,
-                                TLBFlushPageBitsByMMUIdxData d)
+                                TLBFlushRangeData d)
 {
     /* We need 6 bits to hold to hold @bits up to 63. */
     if (d.idxmap <= MAKE_64BIT_MASK(0, TARGET_PAGE_BITS - 6)) {
@@ -800,11 +800,11 @@ static bool encode_pbm_to_runon(run_on_cpu_data *out,
     return false;
 }
 
-static TLBFlushPageBitsByMMUIdxData
+static TLBFlushRangeData
 decode_runon_to_pbm(run_on_cpu_data data)
 {
     target_ulong addr_map_bits = (target_ulong) data.target_ptr;
-    return (TLBFlushPageBitsByMMUIdxData){
+    return (TLBFlushRangeData){
         .addr = addr_map_bits & TARGET_PAGE_MASK,
         .idxmap = (addr_map_bits & ~TARGET_PAGE_MASK) >> 6,
         .bits = addr_map_bits & 0x3f
@@ -820,7 +820,7 @@ static void tlb_flush_page_bits_by_mmuidx_async_1(CPUState *cpu,
 static void tlb_flush_page_bits_by_mmuidx_async_2(CPUState *cpu,
                                                   run_on_cpu_data data)
 {
-    TLBFlushPageBitsByMMUIdxData *d = data.host_ptr;
+    TLBFlushRangeData *d = data.host_ptr;
     tlb_flush_page_bits_by_mmuidx_async_0(cpu, *d);
     g_free(d);
 }
@@ -828,7 +828,7 @@ static void tlb_flush_page_bits_by_mmuidx_async_2(CPUState *cpu,
 void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
                                    uint16_t idxmap, unsigned bits)
 {
-    TLBFlushPageBitsByMMUIdxData d;
+    TLBFlushRangeData d;
     run_on_cpu_data runon;
 
     /* If all bits are significant, this devolves to tlb_flush_page. */
@@ -854,7 +854,7 @@ void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
         async_run_on_cpu(cpu, tlb_flush_page_bits_by_mmuidx_async_1, runon);
     } else {
         /* Otherwise allocate a structure, freed by the worker.  */
-        TLBFlushPageBitsByMMUIdxData *p = g_memdup(&d, sizeof(d));
+        TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
         async_run_on_cpu(cpu, tlb_flush_page_bits_by_mmuidx_async_2,
                          RUN_ON_CPU_HOST_PTR(p));
     }
@@ -865,7 +865,7 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
                                             uint16_t idxmap,
                                             unsigned bits)
 {
-    TLBFlushPageBitsByMMUIdxData d;
+    TLBFlushRangeData d;
     run_on_cpu_data runon;
 
     /* If all bits are significant, this devolves to tlb_flush_page. */
@@ -893,7 +893,7 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
         /* Allocate a separate data block for each destination cpu.  */
         CPU_FOREACH(dst_cpu) {
             if (dst_cpu != src_cpu) {
-                TLBFlushPageBitsByMMUIdxData *p = g_memdup(&d, sizeof(d));
+                TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
                 async_run_on_cpu(dst_cpu,
                                  tlb_flush_page_bits_by_mmuidx_async_2,
                                  RUN_ON_CPU_HOST_PTR(p));
@@ -909,7 +909,7 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
                                                    uint16_t idxmap,
                                                    unsigned bits)
 {
-    TLBFlushPageBitsByMMUIdxData d;
+    TLBFlushRangeData d;
     run_on_cpu_data runon;
 
     /* If all bits are significant, this devolves to tlb_flush_page. */
@@ -935,7 +935,7 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
                               runon);
     } else {
         CPUState *dst_cpu;
-        TLBFlushPageBitsByMMUIdxData *p;
+        TLBFlushRangeData *p;
 
         /* Allocate a separate data block for each destination cpu.  */
         CPU_FOREACH(dst_cpu) {
-- 
2.20.1


