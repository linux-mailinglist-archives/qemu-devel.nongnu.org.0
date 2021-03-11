Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FD63368A4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:31:18 +0100 (CET)
Received: from localhost ([::1]:52154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9ET-00085W-1Y
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:31:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95v-0004t7-UU
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:27 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:35430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95r-0001Nr-Gr
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:27 -0500
Received: by mail-oi1-x22e.google.com with SMTP id u6so13898665oic.2
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7xeEhlQtM0fbvE7NxUGTdI3mS6R4AAuovhR3QGDZMN4=;
 b=uL/a9BNyQm+QVs8rWZXRm9BwYV7955RXkq+3CXJimlHaGiWXbZ263PEJbO/O8tgJy1
 ftaA6jDmzWFLNTQLFDcdGGD3LJbtoAtwl0jh98ocD2qpuldbaPTvQm7Wef7WU6IhvVDW
 9Shq/sRuK7gisLeV0xSxutHT39jw84RXsY/Q/VD+32cqbqa9Gt+tE1sZMYT6nP/CNT54
 eP3yO/M6IbKd2/X7RkZElbcvjq5LXDpRUlqKwZOPBkWGBQVx1bnrt4D3x7M6yGTuQMLC
 FxORtW1PwgVeB5ytd4RDS7ZFwVj1K1Ulupe04Pl5GrUDq+8tiYq0RjUpoGmzqwyjITIo
 b0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7xeEhlQtM0fbvE7NxUGTdI3mS6R4AAuovhR3QGDZMN4=;
 b=OOnkKK83nuXir2YYYHxhmIHL7SLK0sM5zSAk2i8Hcx7hDvgkx0N+5IHIz15F3eFAK/
 2ZzSQPeQHT+hNrecSRlpMzkQ1FP8p9DcQ0IS9QMd3SEt2Cp2U24O7VWVRpsu5eKyw02/
 MSzrS8CtAAndHhYPfjL3CWhn57V8zd1u052Yp8GjaWrY5DGb77DZVnWAPRPOlEKqtfJ1
 j2n6px/BM/1i7rR1CeLUYpRKqsx2OQ9CRKRzDF6muP5xZZbyrM6esNgFWRuH3ZwXACMs
 PFfGddqxqAI90eBokm0wOCpUVIc+JtYeS5i/6LX2ejBO703P/EpFlloQtw5Tb02FKa+x
 RwAw==
X-Gm-Message-State: AOAM530eizTawcqdUw0m+ZZ7OaIOpbuj1E9tPC6a+3JtrNHWF2hNw0gL
 PGMIfh4J7akcjmTdxnqsyevdfVJ9+XQL1dWm
X-Google-Smtp-Source: ABdhPJxfT0XxTYPJFtTqpVvkfr4QPxj5IBqcSqBu81hZbmIlht1Im+M+IfU7KGgIEuEiMr8ExGZKmQ==
X-Received: by 2002:aca:6084:: with SMTP id u126mr4250486oib.45.1615422141304; 
 Wed, 10 Mar 2021 16:22:21 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/26] tcg: Tidy tcg_n_regions
Date: Wed, 10 Mar 2021 18:21:48 -0600
Message-Id: <20210311002156.253711-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compute the value using straight division and bounds,
rather than a loop.  Pass in tb_size rather than reading
from tcg_init_ctx.code_gen_buffer_size,

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 7fb24f6b60..57017c1e80 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -363,38 +363,33 @@ void tcg_region_reset_all(void)
     tcg_region_tree_reset_all();
 }
 
-static size_t tcg_n_regions(unsigned max_cpus)
+static size_t tcg_n_regions(size_t tb_size, unsigned max_cpus)
 {
 #ifdef CONFIG_USER_ONLY
     return 1;
 #else
+    size_t n_regions;
+
     /*
      * It is likely that some vCPUs will translate more code than others,
      * so we first try to set more regions than max_cpus, with those regions
      * being of reasonable size. If that's not possible we make do by evenly
      * dividing the code_gen_buffer among the vCPUs.
      */
-    size_t i;
-
     /* Use a single region if all we have is one vCPU thread */
     if (max_cpus == 1 || !qemu_tcg_mttcg_enabled()) {
         return 1;
     }
 
-    /* Try to have more regions than max_cpus, with each region being >= 2 MB */
-    for (i = 8; i > 0; i--) {
-        size_t regions_per_thread = i;
-        size_t region_size;
-
-        region_size = tcg_init_ctx.code_gen_buffer_size;
-        region_size /= max_cpus * regions_per_thread;
-
-        if (region_size >= 2 * 1024u * 1024) {
-            return max_cpus * regions_per_thread;
-        }
+    /*
+     * Try to have more regions than max_cpus, with each region being >= 2 MB.
+     * If we can't, then just allocate one region per vCPU thread.
+     */
+    n_regions = tb_size / (2 * MiB);
+    if (n_regions <= max_cpus) {
+        return max_cpus;
     }
-    /* If we can't, then just allocate one region per vCPU thread */
-    return max_cpus;
+    return MIN(n_regions, max_cpus * 8);
 #endif
 }
 
@@ -826,7 +821,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     buf = tcg_init_ctx.code_gen_buffer;
     total_size = tcg_init_ctx.code_gen_buffer_size;
     page_size = qemu_real_host_page_size;
-    n_regions = tcg_n_regions(max_cpus);
+    n_regions = tcg_n_regions(total_size, max_cpus);
 
     /* The first region will be 'aligned - buf' bytes larger than the others */
     aligned = QEMU_ALIGN_PTR_UP(buf, page_size);
-- 
2.25.1


