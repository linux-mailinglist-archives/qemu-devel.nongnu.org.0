Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB403904D8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:14:54 +0200 (CEST)
Received: from localhost ([::1]:33122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYlh-0003Rp-Pd
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYas-0001pH-Cb
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:42 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:46693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYap-00046S-VX
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:42 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l18-20020a1c79120000b0290181c444b2d0so6458499wme.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sG9cygL9esXNKbBpTg0uyfUWXncRBKXkgJRBiDrFpkQ=;
 b=HlWtX5rjgzzi6PHh7/VG6rN8JyGWpc8U9XtyLUG0/B+77YGn7noM2Kges3AvVck8UX
 UZa9SMjRuMrRXZp7aOylPRh79N6pQgZbwebX4ISnE74tpVptB/M6ruIPPq6agM14Juzd
 TLjOgDuJgRs3nQrxaq22ufLU1rtk+6hCRvDCqP+zXk6oRwFr3oq5+kGJn9N0sguE1iEF
 kJMwwfH/ckoRhhCWE6tduxw2KB9MGH7FBow5SOOVxlw4tZpyiqPrmCALJ/BwohjXtqVF
 FsMCp05rGbevP4ELUmXCYImtXn05n9odsGd9Ta2vFvVJw5hFOhWp9R5ZEKPLdsZAGpj+
 PBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sG9cygL9esXNKbBpTg0uyfUWXncRBKXkgJRBiDrFpkQ=;
 b=Ukxm3uY2oOFx86q+aAGXSPIAat7xRlci7+U00h/icxwx4U5ymLDNhCCKE1Lx/Nm06c
 Ess2FLCmQh3ZB+9MrVTj49LsFRhYLluZDV/3zorAsQEz9C6WyjJ1zqh/H4CnnVC52LqU
 BkE/jGekm0StsApVOPkf9BEiPpLxf9MW/PtTWofiwvi9vFIlYL+OuinGzCBtHQkSaRwG
 ZKXHuK2RNH6fkmMC0sT+RUB3OekNKb4h6RQBGdStbm2V3gBUrc7zYx5BFSnIZe0QEi8C
 SzUrmO6oJQ/Tv+d1Ofv/HYqr7l4mpejbV/WmPJizDZTHuM6aI7ofEvou6cny8JXdRWSj
 D6Tw==
X-Gm-Message-State: AOAM530DVd4D2NmxIzc3K4qhQ9QTVH1ps0TU69PhjJ47Vsx3efgHkUbN
 EGs0XaBP3PNKc1etWrBn7tcqMYgOdZPKckWN
X-Google-Smtp-Source: ABdhPJwP2lizVK3a1qEbmYerguLKznIBWf9j7djTHC6ffmTzIcCsMe2kUwjvve3hBohg2J4S9oVhsg==
X-Received: by 2002:a05:600c:4f48:: with SMTP id
 m8mr4266495wmq.169.1621955018474; 
 Tue, 25 May 2021 08:03:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 010/114] accel/tcg: Replace g_new() + memcpy() by g_memdup()
Date: Tue, 25 May 2021 16:01:40 +0100
Message-Id: <20210525150324.32370-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Using g_memdup is a bit more compact than g_new + memcpy.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210509151618.2331764-2-f4bug@amsat.org
Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
2.20.1


