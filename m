Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F843A4B70
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:53:30 +0200 (CEST)
Received: from localhost ([::1]:53356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqxt-00084h-KN
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmm-0002ne-V3
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:00 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmk-0002hK-Bi
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:00 -0400
Received: by mail-pl1-x633.google.com with SMTP id 69so3600018plc.5
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YgKo8PzUJ/RjzvpHHwpb7sclY+pASE32tnOuKWOtjvE=;
 b=OjjPvZk9B0mzN15VTJvKeyNHbic7oAMnr6MJmD8Ba8D56E232KicoZlKNOaGVR03QA
 Y4PtH0bnxGy/ZOHgm44odkkfHgWBRer+FF2agVzXkC87s3E2tGjwXa5zLKtsdy67XIp7
 u2XJAbb+X1WeAp7wmXlG7QpQhv7RCgHYXuy3qqyg0A9BQ222k1T4Rji9tXWSyxeEBcug
 31+rc2hd8pAN5eHwKcUuV/a5avTLrGdLTW2wU+EDUr3UrDCg5JUYCyMzyBbC0feUirkY
 qOOwWova/GayyUGnlCc2Z6WCL/Pcif8SjYS/LxRHALqCz0I/rveydL51RACic7I2rzZV
 ZV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YgKo8PzUJ/RjzvpHHwpb7sclY+pASE32tnOuKWOtjvE=;
 b=qHTG2TGsXJ5p3SBlKblQTBl+fylFMBAz4Nqae1BaL4CL2v1aAOfrg8rLGahxRxg48n
 5PW9bpfUs41lrxSKJPdtnkPvro/7CV9+R8x7dkoE3JHKjQRIm9RFVsG9kxgHUK7sAtvb
 VMZzOEmdCKY55pbFURCShOptieSJH/GL3QBsMJWmIQdrfNueGBf1Lje84O0Hpt6oWxcl
 ZwfqQDTBofWbWZ4MBGw0UKjB5/kgDyK2oVDVHvnCjCCnxIKi7P6qxVSmqYhJ+Q3GQM15
 b5NKgNNcVF/j3Irb0xGlSpCktG9d6Le7+VlvbaMAm22ZNEKl1PhMyjJnI6eWcsrQfVhp
 kaKQ==
X-Gm-Message-State: AOAM530afQxQcteNTMfFi5u9AluQLh95yEPM4d735DpQ6LqcIYkurfWt
 RW3AGogIIauaR0vgZl8pKhJPSNdhDMHi6g==
X-Google-Smtp-Source: ABdhPJznDSGntGZ/BJmFF+1+wTob36QnC33303Jqc6atNfZMIP25C3dXSqjebfKhmXGdV0jPQNiB7Q==
X-Received: by 2002:a17:90a:7c43:: with SMTP id e3mr6730715pjl.5.1623454916937; 
 Fri, 11 Jun 2021 16:41:56 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/34] tcg: Tidy tcg_n_regions
Date: Fri, 11 Jun 2021 16:41:29 -0700
Message-Id: <20210611234144.653682-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compute the value using straight division and bounds,
rather than a loop.  Pass in tb_size rather than reading
from tcg_init_ctx.code_gen_buffer_size,

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index b143eaf69c..037a01e4ed 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -364,38 +364,33 @@ void tcg_region_reset_all(void)
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
 
@@ -833,7 +828,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     buf = tcg_init_ctx.code_gen_buffer;
     total_size = tcg_init_ctx.code_gen_buffer_size;
     page_size = qemu_real_host_page_size;
-    n_regions = tcg_n_regions(max_cpus);
+    n_regions = tcg_n_regions(total_size, max_cpus);
 
     /* The first region will be 'aligned - buf' bytes larger than the others */
     aligned = QEMU_ALIGN_PTR_UP(buf, page_size);
-- 
2.25.1


