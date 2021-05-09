Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36712377746
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:21:20 +0200 (CEST)
Received: from localhost ([::1]:35114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflF3-0005fH-Ms
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAc-0005Hg-9K
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:16:38 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAa-0005Mq-Ev
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:16:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id o127so7761021wmo.4
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 08:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=62KhF+aHTJsms61syfsXVhbiLTTTHduiXAK5ql6cZIo=;
 b=a9HLnfkBeHQYqq2uhH/njwJCmKJs8fL64QZatvt/kLZn2/eoYkVOa6z9j6ALoc4aLs
 HrYsyWx0RNbVUdyEsxCF+IKrPLTEXPkcQRNHEt72eOnR2soFlq6Y8wSINbQBreYBQ3WO
 SnFPH3CQENfRtjdkWij5TM9osXc9cBUwzWx95BKR1JbqGmF/AzpCkTpOdXLl396vFAHK
 XEIPCd1AgjZVoK9J3xdqG4KkZLRTDLd31jP0BgIzqHi/YzEiEtj+lc+opnwDe1MdLq35
 E6xwGMootkZ4ChYs62ay0V8Jfx9F3dpSFwPPxpI31RRNjbWfmGEuzZGnF4pmpbVHniU8
 Ypow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=62KhF+aHTJsms61syfsXVhbiLTTTHduiXAK5ql6cZIo=;
 b=UBQFL/VWU6pL0emEKbIVum3lEtOoFNZEWnOLJVA0Qjyms6+lJ2/O1muZHDXihh6wYe
 dA+STuXE7ZiEmuGnTj0+ZVR7AmhY6QlGxiiBUPU7uWk5faKZnpk72WpeeLDNbHhKE+H6
 6dlyqT8MqxUqbWXQiKuqnneG+zg1nm9IBrXjgoz5DVvNz6cHG0j+ZGqakzUJAUaK3GCG
 lrcwtsLcuvPh+ydpeg+BfkaaZ7np+nyQY4Bu98pPQlBhCwU+tsxgYLbx9sUmUcn52QGC
 QlEtL3nA7Pbj8yqXmPk/F/JAZq37ZppNkdx8bArAeNqUyxqp9Wm4/jGeK2/Mc3VO+5S8
 MpCg==
X-Gm-Message-State: AOAM5304CZvRbYaKOPrnpBNkSlA6eyJT0IlyhZyfi1L8QXASDTIZAf4r
 gItDrFSv7LnWYU8w3JqQkdS7fNhPxByGR6QM
X-Google-Smtp-Source: ABdhPJz0a+WNXdeoLPq89GPQhrHlCttO+qN+VoSiomH5+1YGHGNfWivXTMcoG1wOknF3Hqu+SyXHfg==
X-Received: by 2002:a7b:c0cb:: with SMTP id s11mr21618989wmh.146.1620573394933; 
 Sun, 09 May 2021 08:16:34 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d3sm4507459wrs.41.2021.05.09.08.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 08:16:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] accel/tlb: Rename TLBFlushPageBitsByMMUIdxData ->
 TLBFlushRangeData
Date: Sun,  9 May 2021 17:16:12 +0200
Message-Id: <20210509151618.2331764-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210509151618.2331764-1-f4bug@amsat.org>
References: <20210509151618.2331764-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
2.26.3


