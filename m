Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54562370FEB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:43:22 +0200 (CEST)
Received: from localhost ([::1]:42176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLk9-0002ir-E9
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMj-0008Mw-91
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:10 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:50927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMa-0002x9-JZ
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:09 -0400
Received: by mail-pj1-x1032.google.com with SMTP id md17so2066060pjb.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=idNS6LRLDr7PE0vfbI3FZv/MhqMVmpiiFES5YjT5ohE=;
 b=tNxOHt39BDQ62poKmgS4JCLJpGXlYQDeySP03Yi2qiZhZ/heK/h8BEmHaqvEY8t7A4
 JLFJ7E1Q6v1iBpTlORLtXKkuz2cMue6lu+nQ5VF3HMay9zMPgT8eL5dPKksM3WKdJMhY
 p7VNxtpXWK7HLpM78Kt01Wmdgnz2oRck11HDyFWwUmjzBPggwWUWy4AZ3xJuPyc/GNgP
 Nvltp4eBIqaBdqVztX9Tz99S4J1JbKfUKi+U0XmExlmNvmEBsZYRm2IACwXYrJFPdHi4
 /uU6X/fU5i9rHaCy4l2By3dO7UqmlcppDnIST5uT9A/PVKX82mZk8vI5iNrZ53AQsElm
 L5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=idNS6LRLDr7PE0vfbI3FZv/MhqMVmpiiFES5YjT5ohE=;
 b=YHsMc0D2MavY4/JzTMHfdOTJq+OW1izHIhNIdhbwWJzCOh/bBjQHCoOjnrQ/hmqD56
 d2qdS4uEqQxXr2FtcVjld/xZ4Ol2oHmmA/s6NUZMZxjKElfCldiwEcco2ZiWW6VEgpge
 +1PMnU3DlMztHWWgvIBiShpV+VT7mOCVZN1CevSOuXs5kYP0oZ7amRQd8iPf0XTlmJHI
 s0i6NxXwGPsz4kdiLkG4C3dWfMZtR64mrmKtsgvHp4BY4afXkTwtJw6LjkJmwjPrnA/G
 2rD+V5UD3sDoSuzJvcRc/lEjazFfCdTdAI0zM3cGVypHIQR3N/I/FbM291326lMU3P8D
 zDGA==
X-Gm-Message-State: AOAM532l2W22iXS/5Ob1+25Bmq2x82a80ZhfLm37AUudJkWK6QaiMtSM
 GUWh0X55QX6CCq6u3xe9wtfcvZAYa3VsBw==
X-Google-Smtp-Source: ABdhPJw55yCFEe1lMNh0ml6UG6o3MS/IRSuzzHNsan4LlJ+e1oLDX0fSZQbWQydEqgGrtn/7YeGy+g==
X-Received: by 2002:a17:90a:1b62:: with SMTP id
 q89mr28053991pjq.141.1619997539276; 
 Sun, 02 May 2021 16:18:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/28] tcg: Tidy tcg_n_regions
Date: Sun,  2 May 2021 16:18:34 -0700
Message-Id: <20210502231844.1977630-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Compute the value using straight division and bounds,
rather than a loop.  Pass in tb_size rather than reading
from tcg_init_ctx.code_gen_buffer_size,

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index bd81b35359..b44246e1aa 100644
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
 
@@ -828,7 +823,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     buf = tcg_init_ctx.code_gen_buffer;
     total_size = tcg_init_ctx.code_gen_buffer_size;
     page_size = qemu_real_host_page_size;
-    n_regions = tcg_n_regions(max_cpus);
+    n_regions = tcg_n_regions(total_size, max_cpus);
 
     /* The first region will be 'aligned - buf' bytes larger than the others */
     aligned = QEMU_ALIGN_PTR_UP(buf, page_size);
-- 
2.25.1


