Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2A83904B1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:11:12 +0200 (CEST)
Received: from localhost ([::1]:46636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYi7-0001xs-3V
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYav-00020Y-LO
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:45 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYas-00049I-6N
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:45 -0400
Received: by mail-wr1-x42f.google.com with SMTP id y14so30531647wrm.13
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=r3psLHIrQooal2rpFwedAy4rO0VVa8gjuS1giFmBzh8=;
 b=e3Ob2Ok3Nmgh7/Zkf99yw3htLSMKj5t/ldUh16yB3sWuzEKbgbAAm27/vo3MRm2wk/
 cITldHqkdwXv4EMe98BY53/aa15hY34TcoeYDMrcFjpPFNANBceZOJhwYane78zosjMD
 PGI1h4ZV6wtWBK4a+1Fm8CkhqhJQg5ZeR4MbLan6rPy1dHwYp+Vvj+oM52WzLwA708f8
 6LdKuUPZX70uaiObauVDUiKuvhEMoY43aYccexliRnEMnScQHIlwp8cJB5pLx2Kklc8S
 k6tjzEDLSH2qgMpo3izHeAAaxK5nopNg+iSB5F1hCxwqeoOZD2VKagivByDHX94/OhKT
 emWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r3psLHIrQooal2rpFwedAy4rO0VVa8gjuS1giFmBzh8=;
 b=EaBDx0Py67AkNSwXKK6amIdv5MqGMEzvhUJ8m9vyh5rNG2UC0DnTTOMdZpwNYYFXed
 vdBtPR+dLt666Jw7nY2Wn1fBW8XS1gJx30OfDQh6BQOrnRQ1MwiOUOPhYF+BpJ5wTGKd
 YgcyC/QWa11699o1H/LPBgnPvsnEthb6uLqijFMXdjriit+y/goteiUf5gGEv3yghAAv
 BYp4zJg49/VEKBIey1R4v0UHi4o6QTSMmobowk2/SJJnb4Z5lISsyMHtE+YE74K65pqt
 X0JkVhiU0Qzlfp93DjIYMw6+tq2GZcmRzejSB/0eviN3MnKGk6eNBiYj8DiVlctiB3Mg
 98CA==
X-Gm-Message-State: AOAM531tPSKaTZhvEqHW5u0p7bRMbzXUvxH7EsVFNo3IgTy1+CTWFXcn
 +UzBDi9BNs2r+V459HWX9epEYTDBESCXY2Ec
X-Google-Smtp-Source: ABdhPJyEX/Fn7ow4oY05Qr1zQ26HZoU/gr+6Dd9m/WjlJVD6dWpbYyBCeV2mqQIT5+BxCBhLH2lIhQ==
X-Received: by 2002:adf:e3c6:: with SMTP id k6mr27962350wrm.236.1621955020731; 
 Tue, 25 May 2021 08:03:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 013/114] accel/tcg: Remove {encode,decode}_pbm_to_runon
Date: Tue, 25 May 2021 16:01:43 +0100
Message-Id: <20210525150324.32370-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

We will not be able to fit address + length into a 64-bit packet.
Drop this optimization before re-organizing this code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210509151618.2331764-10-f4bug@amsat.org
Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMM: Moved patch earlier in the series]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/tcg/cputlb.c | 86 +++++++++++-----------------------------------
 1 file changed, 20 insertions(+), 66 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 36e7831ef70..a49a72b035e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -789,34 +789,6 @@ tlb_flush_page_bits_by_mmuidx_async_0(CPUState *cpu,
     }
 }
 
-static bool encode_pbm_to_runon(run_on_cpu_data *out,
-                                TLBFlushRangeData d)
-{
-    /* We need 6 bits to hold to hold @bits up to 63. */
-    if (d.idxmap <= MAKE_64BIT_MASK(0, TARGET_PAGE_BITS - 6)) {
-        *out = RUN_ON_CPU_TARGET_PTR(d.addr | (d.idxmap << 6) | d.bits);
-        return true;
-    }
-    return false;
-}
-
-static TLBFlushRangeData
-decode_runon_to_pbm(run_on_cpu_data data)
-{
-    target_ulong addr_map_bits = (target_ulong) data.target_ptr;
-    return (TLBFlushRangeData){
-        .addr = addr_map_bits & TARGET_PAGE_MASK,
-        .idxmap = (addr_map_bits & ~TARGET_PAGE_MASK) >> 6,
-        .bits = addr_map_bits & 0x3f
-    };
-}
-
-static void tlb_flush_page_bits_by_mmuidx_async_1(CPUState *cpu,
-                                                  run_on_cpu_data runon)
-{
-    tlb_flush_page_bits_by_mmuidx_async_0(cpu, decode_runon_to_pbm(runon));
-}
-
 static void tlb_flush_page_bits_by_mmuidx_async_2(CPUState *cpu,
                                                   run_on_cpu_data data)
 {
@@ -829,7 +801,6 @@ void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
                                    uint16_t idxmap, unsigned bits)
 {
     TLBFlushRangeData d;
-    run_on_cpu_data runon;
 
     /* If all bits are significant, this devolves to tlb_flush_page. */
     if (bits >= TARGET_LONG_BITS) {
@@ -850,8 +821,6 @@ void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
 
     if (qemu_cpu_is_self(cpu)) {
         tlb_flush_page_bits_by_mmuidx_async_0(cpu, d);
-    } else if (encode_pbm_to_runon(&runon, d)) {
-        async_run_on_cpu(cpu, tlb_flush_page_bits_by_mmuidx_async_1, runon);
     } else {
         /* Otherwise allocate a structure, freed by the worker.  */
         TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
@@ -866,7 +835,7 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
                                             unsigned bits)
 {
     TLBFlushRangeData d;
-    run_on_cpu_data runon;
+    CPUState *dst_cpu;
 
     /* If all bits are significant, this devolves to tlb_flush_page. */
     if (bits >= TARGET_LONG_BITS) {
@@ -885,19 +854,13 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
     d.idxmap = idxmap;
     d.bits = bits;
 
-    if (encode_pbm_to_runon(&runon, d)) {
-        flush_all_helper(src_cpu, tlb_flush_page_bits_by_mmuidx_async_1, runon);
-    } else {
-        CPUState *dst_cpu;
-
-        /* Allocate a separate data block for each destination cpu.  */
-        CPU_FOREACH(dst_cpu) {
-            if (dst_cpu != src_cpu) {
-                TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
-                async_run_on_cpu(dst_cpu,
-                                 tlb_flush_page_bits_by_mmuidx_async_2,
-                                 RUN_ON_CPU_HOST_PTR(p));
-            }
+    /* Allocate a separate data block for each destination cpu.  */
+    CPU_FOREACH(dst_cpu) {
+        if (dst_cpu != src_cpu) {
+            TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
+            async_run_on_cpu(dst_cpu,
+                             tlb_flush_page_bits_by_mmuidx_async_2,
+                             RUN_ON_CPU_HOST_PTR(p));
         }
     }
 
@@ -909,8 +872,8 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
                                                    uint16_t idxmap,
                                                    unsigned bits)
 {
-    TLBFlushRangeData d;
-    run_on_cpu_data runon;
+    TLBFlushRangeData d, *p;
+    CPUState *dst_cpu;
 
     /* If all bits are significant, this devolves to tlb_flush_page. */
     if (bits >= TARGET_LONG_BITS) {
@@ -929,27 +892,18 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
     d.idxmap = idxmap;
     d.bits = bits;
 
-    if (encode_pbm_to_runon(&runon, d)) {
-        flush_all_helper(src_cpu, tlb_flush_page_bits_by_mmuidx_async_1, runon);
-        async_safe_run_on_cpu(src_cpu, tlb_flush_page_bits_by_mmuidx_async_1,
-                              runon);
-    } else {
-        CPUState *dst_cpu;
-        TLBFlushRangeData *p;
-
-        /* Allocate a separate data block for each destination cpu.  */
-        CPU_FOREACH(dst_cpu) {
-            if (dst_cpu != src_cpu) {
-                p = g_memdup(&d, sizeof(d));
-                async_run_on_cpu(dst_cpu, tlb_flush_page_bits_by_mmuidx_async_2,
-                                 RUN_ON_CPU_HOST_PTR(p));
-            }
+    /* Allocate a separate data block for each destination cpu.  */
+    CPU_FOREACH(dst_cpu) {
+        if (dst_cpu != src_cpu) {
+            p = g_memdup(&d, sizeof(d));
+            async_run_on_cpu(dst_cpu, tlb_flush_page_bits_by_mmuidx_async_2,
+                             RUN_ON_CPU_HOST_PTR(p));
         }
-
-        p = g_memdup(&d, sizeof(d));
-        async_safe_run_on_cpu(src_cpu, tlb_flush_page_bits_by_mmuidx_async_2,
-                              RUN_ON_CPU_HOST_PTR(p));
     }
+
+    p = g_memdup(&d, sizeof(d));
+    async_safe_run_on_cpu(src_cpu, tlb_flush_page_bits_by_mmuidx_async_2,
+                          RUN_ON_CPU_HOST_PTR(p));
 }
 
 /* update the TLBs so that writes to code in the virtual page 'addr'
-- 
2.20.1


