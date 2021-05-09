Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC18C37774C
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:26:18 +0200 (CEST)
Received: from localhost ([::1]:49644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflJx-00070m-Up
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflB8-0005sl-P5
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:17:10 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflB7-0005gk-5b
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:17:10 -0400
Received: by mail-wr1-x430.google.com with SMTP id z6so13996931wrm.4
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 08:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AOpOu7tS66FjHtPHNLuf/gpZjB/Q3PR0vAi0thAFl78=;
 b=VKKqMTjYJ/QP1ZoliCBPjA6kytDLigN8jwK4u6Fq+PaeuApWPtkJoQoqE7kM1vuwpP
 4uh/FSJXutqo/s+6dg8lg/zkF1Civ2sUJ5vc9wJGTIs6d/RnzfsX33YuqNa+imPxhaQu
 tddiPQnC4OTNJepyPh6IVOh/g6Ot/QVItzUWMXIE5cOqR5OAJJnCfFDtHsp+7tf1Fzem
 EQXpIKkWjRvJNp0EeEoZJhQcEYxEUro2YjoEWhUwg6kXaeAlbMwOCdAU8UjTg7E2iAxL
 BlVZAq9lGA+kWSfPM+URf0pwtbXUQhF33LWaNIlxavP+zAFOkTWd6KQRRMr/LQsTsAXU
 gERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AOpOu7tS66FjHtPHNLuf/gpZjB/Q3PR0vAi0thAFl78=;
 b=S9rpxZz7zA0lRHp5h3xyjxw1ExS6KZqkKafTwYWUXGRwn9DvWKH0eqgiB8zhDtVi2l
 SdTmzZ+zFxaJ6pKjMj6LqiYEClXU1clJazqTLpFx/J14o6VUK8tDDaULh7QbjrpEn6Sb
 GyK8dx0OhJgSlCiAoZRgknI6yKSz+mPD9l92PwTMBVX6vwphs9HarWCuxXLy8FRUVeQZ
 j3Yjhj2nkJiWQVLajY+FrfAfVQKuTIYkCPtDBlVchwvqg6Q4i9Hl2GTeFQI/eT6IatvT
 rTT3RUnZWw3eGHxrytRsreuW5yYXJhXnrYktlt9dWqE7kjGglAyVsXSB9Q2dRmw3QRNH
 wWcQ==
X-Gm-Message-State: AOAM531ljUaRXemxytcwnvVPjqlfeNH13g1w7HiNDsCuqi0TktdH6jiZ
 A0xknBtRJhXvJiMXsA7sf1UvVteHN7968+4S
X-Google-Smtp-Source: ABdhPJxelpKDfXOn2f4TzC4xGcSTQBg75YosFXUM0RZFcNfJINQzesD145I5GGr22icN9lVY+RR+Ew==
X-Received: by 2002:a5d:6383:: with SMTP id p3mr25377465wru.230.1620573427525; 
 Sun, 09 May 2021 08:17:07 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j13sm18099051wrw.93.2021.05.09.08.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 08:17:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] accel/tcg: Remove tlb_flush_page_bits_by_mmuidx_async_1()
 ???
Date: Sun,  9 May 2021 17:16:18 +0200
Message-Id: <20210509151618.2331764-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210509151618.2331764-1-f4bug@amsat.org>
References: <20210509151618.2331764-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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

Now than ... /* we use range? FILL ME... */ ... we can remove the
encode_pbm_to_runon() and flush_all_helper() calls.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
XXX proper description, commit might be placed earlier in series.
---
 accel/tcg/cputlb.c | 86 +++++++++++-----------------------------------
 1 file changed, 20 insertions(+), 66 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index ad0e44bce63..2f7088614a7 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -788,34 +788,6 @@ static void tlb_flush_range_by_mmuidx_async_0(CPUState *cpu,
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
-    tlb_flush_range_by_mmuidx_async_0(cpu, decode_runon_to_pbm(runon));
-}
-
 static void tlb_flush_range_by_mmuidx_async_1(CPUState *cpu,
                                               run_on_cpu_data data)
 {
@@ -829,7 +801,6 @@ void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
                                unsigned bits)
 {
     TLBFlushRangeData d;
-    run_on_cpu_data runon;
 
     /*
      * If all bits are significant, and len is small,
@@ -853,8 +824,6 @@ void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
 
     if (qemu_cpu_is_self(cpu)) {
         tlb_flush_range_by_mmuidx_async_0(cpu, d);
-    } else if (encode_pbm_to_runon(&runon, d)) {
-        async_run_on_cpu(cpu, tlb_flush_page_bits_by_mmuidx_async_1, runon);
     } else {
         /* Otherwise allocate a structure, freed by the worker.  */
         TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
@@ -874,7 +843,7 @@ void tlb_flush_range_by_mmuidx_all_cpus(CPUState *src_cpu,
                                         uint16_t idxmap, unsigned bits)
 {
     TLBFlushRangeData d;
-    run_on_cpu_data runon;
+    CPUState *dst_cpu;
 
     /*
      * If all bits are significant, and len is small,
@@ -896,19 +865,13 @@ void tlb_flush_range_by_mmuidx_all_cpus(CPUState *src_cpu,
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
-                                 tlb_flush_range_by_mmuidx_async_1,
-                                 RUN_ON_CPU_HOST_PTR(p));
-            }
+    /* Allocate a separate data block for each destination cpu.  */
+    CPU_FOREACH(dst_cpu) {
+        if (dst_cpu != src_cpu) {
+            TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
+            async_run_on_cpu(dst_cpu,
+                             tlb_flush_range_by_mmuidx_async_1,
+                             RUN_ON_CPU_HOST_PTR(p));
         }
     }
 
@@ -929,8 +892,8 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
                                                uint16_t idxmap,
                                                unsigned bits)
 {
-    TLBFlushRangeData d;
-    run_on_cpu_data runon;
+    TLBFlushRangeData d, *p;
+    CPUState *dst_cpu;
 
     /*
      * If all bits are significant, and len is small,
@@ -952,27 +915,18 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
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
-                async_run_on_cpu(dst_cpu, tlb_flush_range_by_mmuidx_async_1,
-                                 RUN_ON_CPU_HOST_PTR(p));
-            }
+    /* Allocate a separate data block for each destination cpu.  */
+    CPU_FOREACH(dst_cpu) {
+        if (dst_cpu != src_cpu) {
+            p = g_memdup(&d, sizeof(d));
+            async_run_on_cpu(dst_cpu, tlb_flush_range_by_mmuidx_async_1,
+                             RUN_ON_CPU_HOST_PTR(p));
         }
-
-        p = g_memdup(&d, sizeof(d));
-        async_safe_run_on_cpu(src_cpu, tlb_flush_range_by_mmuidx_async_1,
-                              RUN_ON_CPU_HOST_PTR(p));
     }
+
+    p = g_memdup(&d, sizeof(d));
+    async_safe_run_on_cpu(src_cpu, tlb_flush_range_by_mmuidx_async_1,
+                          RUN_ON_CPU_HOST_PTR(p));
 }
 
 void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
-- 
2.26.3


