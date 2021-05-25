Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDC9390525
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:21:01 +0200 (CEST)
Received: from localhost ([::1]:50318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYrb-0006mk-UF
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYaz-0002EZ-FO
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:49 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYaw-0004Cs-4g
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:49 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n4so6680053wrw.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jKKUfMmwtP0dv34VhR0OZOa9LKuKcq4ws4ALKbrYATo=;
 b=aQ+O8zoGfK4bNV5S6Ek/pggDuSod/IKheVSBqJ3z6F0z0BWS8b3kovN7zhP9YboLcJ
 luciW54exm5z7OJZLYw9mVX7x0wN3e0yZ6r4XidwujmGX/73Wykvp/0S4mVUXdf5cI+D
 zZygMvg+oV5Ink0B8eDJBJ5bc10kU7mB1KYg/UhZO3KzCvzZU1hWscCp6g/OxsG/LwK/
 yi3+OPXHHQFapdHEYW+H4rivGhnb7TJlov+izV8z1QERjyG+X+0Pg+M8GLfaU4eqA+Zq
 FGuqQv0bByoHeFXKq18s4j4h4xaxHsjC25NJT164CjrbGw7TohdYOpGWGdzVBWNFv7EV
 H4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jKKUfMmwtP0dv34VhR0OZOa9LKuKcq4ws4ALKbrYATo=;
 b=X8yGvBg7/Tta+MStWRQlio632nmLvULtkxC2ft7DFRIjqfBxYxTiwagGXuZu4VeZRo
 ddrSXxtiqsUvnVvbnCrTDkc/vcUdWVoVOK1vxilA8kw7ZOtfQJ1RrONKDb0JzA3YVALa
 21KxELZMwAlcOQecKQziCtnogq7u8YTqIBkbYVYZoDYydq2GIiVgQnSfnhb63inyStOm
 TCZ8jdJo4VDdEizK31ekorGG/pYQjZWTNeoJCjaJi8mA6MH7Fi6E7H63ayu+kwh2u8Fo
 eGRDzU6lhSuU5ojYln42epMj5H41vxGyhN5OTi97RMEhg8SMeLaoZRgsngRk1KRYQJnd
 s9gA==
X-Gm-Message-State: AOAM533vjHYX4YQHJBeQXe8+Opk/sJ6zCLwF11uvNdF+3vpCVOkdN1Rv
 vgliF9f+da6F7ht4BHZ12Bvh4tWTONbMckcT
X-Google-Smtp-Source: ABdhPJwQzGKOIEJrPuGvyKICz+ECL4uho+390YgXVtDf+SFO2Px8rZjkGO/wTLsVe2hbOXmVqe5NBQ==
X-Received: by 2002:a5d:4f03:: with SMTP id c3mr27480601wru.158.1621955024805; 
 Tue, 25 May 2021 08:03:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 018/114] accel/tlb: Rename tlb_flush_[page_bits >
 range]_by_mmuidx_async_[2 > 1]
Date: Tue, 25 May 2021 16:01:48 +0100
Message-Id: <20210525150324.32370-19-peter.maydell@linaro.org>
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

Rename to match tlb_flush_range_locked.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210509151618.2331764-9-f4bug@amsat.org
Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/tcg/cputlb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 596b87c876b..2f7088614a7 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -788,8 +788,8 @@ static void tlb_flush_range_by_mmuidx_async_0(CPUState *cpu,
     }
 }
 
-static void tlb_flush_page_bits_by_mmuidx_async_2(CPUState *cpu,
-                                                  run_on_cpu_data data)
+static void tlb_flush_range_by_mmuidx_async_1(CPUState *cpu,
+                                              run_on_cpu_data data)
 {
     TLBFlushRangeData *d = data.host_ptr;
     tlb_flush_range_by_mmuidx_async_0(cpu, *d);
@@ -827,7 +827,7 @@ void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
     } else {
         /* Otherwise allocate a structure, freed by the worker.  */
         TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
-        async_run_on_cpu(cpu, tlb_flush_page_bits_by_mmuidx_async_2,
+        async_run_on_cpu(cpu, tlb_flush_range_by_mmuidx_async_1,
                          RUN_ON_CPU_HOST_PTR(p));
     }
 }
@@ -870,7 +870,7 @@ void tlb_flush_range_by_mmuidx_all_cpus(CPUState *src_cpu,
         if (dst_cpu != src_cpu) {
             TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
             async_run_on_cpu(dst_cpu,
-                             tlb_flush_page_bits_by_mmuidx_async_2,
+                             tlb_flush_range_by_mmuidx_async_1,
                              RUN_ON_CPU_HOST_PTR(p));
         }
     }
@@ -919,13 +919,13 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
     CPU_FOREACH(dst_cpu) {
         if (dst_cpu != src_cpu) {
             p = g_memdup(&d, sizeof(d));
-            async_run_on_cpu(dst_cpu, tlb_flush_page_bits_by_mmuidx_async_2,
+            async_run_on_cpu(dst_cpu, tlb_flush_range_by_mmuidx_async_1,
                              RUN_ON_CPU_HOST_PTR(p));
         }
     }
 
     p = g_memdup(&d, sizeof(d));
-    async_safe_run_on_cpu(src_cpu, tlb_flush_page_bits_by_mmuidx_async_2,
+    async_safe_run_on_cpu(src_cpu, tlb_flush_range_by_mmuidx_async_1,
                           RUN_ON_CPU_HOST_PTR(p));
 }
 
-- 
2.20.1


