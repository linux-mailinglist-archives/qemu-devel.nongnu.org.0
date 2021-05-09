Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58983377743
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:19:15 +0200 (CEST)
Received: from localhost ([::1]:55706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflD8-0000Zn-Dc
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAT-0004uv-St
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:16:29 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAR-0005Hl-QN
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:16:29 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 b11-20020a7bc24b0000b0290148da0694ffso9741702wmj.2
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g/4SxtqNPm0E/CIeRZgN6CpYgDUnydXgvlLbsp+hewQ=;
 b=g1qDQPuY8atoSzlEkszcdJ+eEHA/16oyeHN3JAuilwQMmKCRQ1a49G4J/wKGEXx6ei
 XbrxU2p3MaOPsDCim6QTXX0OkqQZD5eok2dIKtpGdtMWWhYoBqM0yXr2H5lV3Cdcf3hj
 IgeK/tcwXhqRBEzFOqXIYJXxMhSe6j+U+aoWwpUd/cO4y1Ils9JaZP2usf5oUAKSzpgj
 sxe9gaiN+b5WEV7sNw+6ERPJDhZ1titXnGb++Za7CKzVnKO5w39coDgoB9XEJnqN3e4Q
 xryr661yP3zQFHigcB6KtP5ICU2rlzFKb8ePtpxxO04sZm+vyNU2O+IG+PcIDgzIvxZM
 4sPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=g/4SxtqNPm0E/CIeRZgN6CpYgDUnydXgvlLbsp+hewQ=;
 b=csH7jXQ8t4Z/8G0dsDq9+M08qnklL3rfS7dpqStfbkoPb3fKCKiG1yHClXndRCqxJU
 xT9scYSnigCBvxutsD8pciotlniRl6LnmaT4PkOrNXaMOftsrb9NtZtxWaoyOO4YUMc/
 VTKjtysMDYEayysRiy/efQhbGkjhE84AmB63EwK1M8jrD35kzoa00e3qqikpANRK35z0
 /fiDTXsD9jbgQ2u5wiBe92N+9g1vubcVercAFhGwIuEKuTBGOd7wZYUzhEL0MHPveOcK
 tL9Mgb077ImCu+qisx5WYfdKSSHfMPDjMe5GITa66j32b7hO6s3oMg3Lo4/7lzITEptd
 wWHQ==
X-Gm-Message-State: AOAM5317tmCcxtxwCF1McHicuizXHEllo1mG6diHOpCnHs5nTU+wd2Tx
 ZAYIO3EYqxrIFOZFKf/cPQsN+Vj/f4GHiNTO
X-Google-Smtp-Source: ABdhPJzNQkckM2TtOySTimVX34+66oIMBWjIm0OqcJkvxAagJxG9g4vFuVGub/ZSJRr0lQK3l8za9w==
X-Received: by 2002:a05:600c:3388:: with SMTP id
 o8mr32529782wmp.101.1620573385750; 
 Sun, 09 May 2021 08:16:25 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f6sm19891650wru.72.2021.05.09.08.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 08:16:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] accel/tcg: Replace g_new() + memcpy() by g_memdup()
Date: Sun,  9 May 2021 17:16:10 +0200
Message-Id: <20210509151618.2331764-2-f4bug@amsat.org>
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
 accel/tcg/cputlb.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 84e7d91a5ca..f616b58a898 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -837,11 +837,8 @@ void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, target_ulong addr,
     } else if (encode_pbm_to_runon(&runon, d)) {
         async_run_on_cpu(cpu, tlb_flush_page_bits_by_mmuidx_async_1, runon);
     } else {
-        TLBFlushPageBitsByMMUIdxData *p
-            = g_new(TLBFlushPageBitsByMMUIdxData, 1);
-
         /* Otherwise allocate a structure, freed by the worker.  */
-        *p = d;
+        TLBFlushPageBitsByMMUIdxData *p = g_memdup(&d, sizeof(d));
         async_run_on_cpu(cpu, tlb_flush_page_bits_by_mmuidx_async_2,
                          RUN_ON_CPU_HOST_PTR(p));
     }
@@ -875,13 +872,11 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
         flush_all_helper(src_cpu, tlb_flush_page_bits_by_mmuidx_async_1, runon);
     } else {
         CPUState *dst_cpu;
-        TLBFlushPageBitsByMMUIdxData *p;
 
         /* Allocate a separate data block for each destination cpu.  */
         CPU_FOREACH(dst_cpu) {
             if (dst_cpu != src_cpu) {
-                p = g_new(TLBFlushPageBitsByMMUIdxData, 1);
-                *p = d;
+                TLBFlushPageBitsByMMUIdxData *p = g_memdup(&d, sizeof(d));
                 async_run_on_cpu(dst_cpu,
                                  tlb_flush_page_bits_by_mmuidx_async_2,
                                  RUN_ON_CPU_HOST_PTR(p));
@@ -927,15 +922,13 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
         /* Allocate a separate data block for each destination cpu.  */
         CPU_FOREACH(dst_cpu) {
             if (dst_cpu != src_cpu) {
-                p = g_new(TLBFlushPageBitsByMMUIdxData, 1);
-                *p = d;
+                p = g_memdup(&d, sizeof(d));
                 async_run_on_cpu(dst_cpu, tlb_flush_page_bits_by_mmuidx_async_2,
                                  RUN_ON_CPU_HOST_PTR(p));
             }
         }
 
-        p = g_new(TLBFlushPageBitsByMMUIdxData, 1);
-        *p = d;
+        p = g_memdup(&d, sizeof(d));
         async_safe_run_on_cpu(src_cpu, tlb_flush_page_bits_by_mmuidx_async_2,
                               RUN_ON_CPU_HOST_PTR(p));
     }
-- 
2.26.3


