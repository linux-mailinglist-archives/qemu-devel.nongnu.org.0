Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270E333A85B
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:50:54 +0100 (CET)
Received: from localhost ([::1]:56128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYdQ-0005F0-Rj
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH8-0006BH-6w
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:50 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:46668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH6-0008Fy-HS
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:49 -0400
Received: by mail-qk1-x72a.google.com with SMTP id a9so29868593qkn.13
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dKl3plwM0T4wQ2XEJ99rVXo5h1hjm+9QWf83bPhdblE=;
 b=UZsDacHJ4pECD/381oH/pFqrUGiK9d6goWxrumgVIsyCtFxOlC3wNh5kcocFv3sl8L
 LQT9mzBDDwPjZsZzNzRr6SJA6OA0PXuvjOu+8s/Nyyo5YJLJ+OvDvVeTjAtKPgENH9BV
 1byZW/SkjlPtblJwN52tCDvWFxonfhFjIGcGdZaIhhux7egXUFomeLgDzMBx4S2QCaya
 IWC6pesfozYHhG5tb+XCM6vMeD458/HL7Txv6GHchrRMFt0pxGzNuTEzVsDdMufRZW38
 YafFR1BGF7WubLYSkZQ6FoEEu3+H1IB1RwTg0cum9aotQOjB2ZF3UwTAwC/XEZJKEptP
 Je5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dKl3plwM0T4wQ2XEJ99rVXo5h1hjm+9QWf83bPhdblE=;
 b=RnxHfTciWonpI+b3lNUKlPpREW2V14GxyuVdKd+FWqXnUb1/sGYugUArXyF9K7Z+I+
 tfV49hNKELN0kcNnQBqh9e1pUswKhvLAg7qEyjYw8uLrNKNwRI6KO4opLpsZAGYzvZLb
 NGoewBOwRJfIookFjxfmJrtS6dYAzKQHcel6JIeWcB6TmJm21ZeYOHtR7p4UHE+6D1sj
 TYXg0HLgCTHUmeeq1JlxtmLw5uXIBoPqIT083EK23FqbgaZzTFEsB54E+q0Ulvnm8fyr
 NpsfARjpF5KM4UF8gQppU8JD0TWEODpPhAzXDv0UURGdLrkpTzUA+vKBrNl4+u0+WtW+
 tqBw==
X-Gm-Message-State: AOAM531Km86NgASHyaH/NAv7ANlo6jRp5VQKkk8ZZnKPlt+u6B+bhR3p
 IYRW3w8oGcBdiKLV1Z3Dcl+wz32HDJdE2U3n
X-Google-Smtp-Source: ABdhPJx39ffIFwb8DWAZoIzoRZj0Rzyw+P3poZEa3xTIYVtbFczoOCXkRjwlXw8Ba6XbeYbys4P7eg==
X-Received: by 2002:a05:620a:414e:: with SMTP id
 k14mr23558721qko.243.1615757267024; 
 Sun, 14 Mar 2021 14:27:47 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/29] tcg: Tidy tcg_n_regions
Date: Sun, 14 Mar 2021 15:27:13 -0600
Message-Id: <20210314212724.1917075-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
index 23261561a1..23b3459c61 100644
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
 
@@ -829,7 +824,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     buf = tcg_init_ctx.code_gen_buffer;
     total_size = tcg_init_ctx.code_gen_buffer_size;
     page_size = qemu_real_host_page_size;
-    n_regions = tcg_n_regions(max_cpus);
+    n_regions = tcg_n_regions(total_size, max_cpus);
 
     /* The first region will be 'aligned - buf' bytes larger than the others */
     aligned = QEMU_ALIGN_PTR_UP(buf, page_size);
-- 
2.25.1


