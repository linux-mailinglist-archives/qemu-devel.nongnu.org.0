Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A8F33A860
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:56:25 +0100 (CET)
Received: from localhost ([::1]:34884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYim-0000Ie-Pz
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYHJ-0006Po-Dw
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:28:01 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:40083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYHE-0008J1-PX
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:28:01 -0400
Received: by mail-qk1-x72f.google.com with SMTP id l132so29919945qke.7
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JZdn6ANaU4aV5zRIqP0A2KkQ5u2MmsLTSCDf8HK0t+o=;
 b=oF0BZfdMnQYHe7obz9wj63Y+CtaRLHXmCoc5Rd1IXR+Fof6wYaelQZq/sNdPYVFCkG
 N2Pa4zZZAMaxJp10rIGCS3M3zN6nSDjM+9xNFtQujdp5FuYK/LbzO65IqMFwak+Lw6Sf
 rTtDggvzXETMplHx20+hexBqxDNIprLOq5ia/XuZBSMULrmmW5pMQvI+50G0+3nJoUO7
 fisRiuo7Zbx0mi1I6eUMeHCruY0/8U3F+UHD68GQn7XdzLNvZA1u2yM4yAgRH1nZ7ak7
 zHDxS/dR+yfmRRM3GPeSxLy7kqCqtGlO5sgghWnFGpSI3bRgFLO2hJOvWp7mLTWHAcuh
 7LFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JZdn6ANaU4aV5zRIqP0A2KkQ5u2MmsLTSCDf8HK0t+o=;
 b=tLEH6IsJxlUXTEQM9sI8BVOu7s6AL3hoanXOALg4Aew9OC18cM/8D6DLln3sBz9CSX
 fYPCVWr6toBw406zFSp9Ddt8ipnPj5UHT8eSUfOT9yQQl281QrZWFB5Pq+jhMDGsRimO
 SAiNDJniTZcF3pQXIfEBqemQXsotNzCE46LdzSreLnmgbu/aNmXOgCja6z0sCoQ22mLG
 2djtBGlkmbjG7HFzpnd45FaIBJY8+Tyn310XrnRuvuO7A6uIw6aDonl0gKDSZSp0EE5x
 bxslPhp0jDM+QgPiS5uJoPnBWPXCtMmGF/XFTRhDsBK/o4BUxIK61xCQDLqbVxRrT4Eg
 jXCQ==
X-Gm-Message-State: AOAM530r2scL6LATBo7VwZoeMxA7H956eDCQP3cVyJUWXu9QFwPq4ka8
 v4k3Pak9TQUXnYhSimnb8+O4WozpBumPNRpU
X-Google-Smtp-Source: ABdhPJzA/FaDTADtIiZXIjp9xeRbhWkjvzpNfH4JzhwJI5rKraMlomOttoyh9o6W3FiVmk/Leb7Z6w==
X-Received: by 2002:a37:9f91:: with SMTP id i139mr22409218qke.72.1615757275673; 
 Sun, 14 Mar 2021 14:27:55 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/29] tcg: Round the tb_size default from
 qemu_get_host_physmem
Date: Sun, 14 Mar 2021 15:27:21 -0600
Message-Id: <20210314212724.1917075-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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

If qemu_get_host_physmem returns an odd number of pages,
then physmem / 8 will not be a multiple of the page size.

The following was observed on a gitlab runner:

ERROR qtest-arm/boot-serial-test - Bail out!
ERROR:../util/osdep.c:80:qemu_mprotect__osdep: \
  assertion failed: (!(size & ~qemu_real_host_page_mask))

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 47 +++++++++++++++++++++--------------------------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 27a7e35c8e..4dc1237ff4 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -469,26 +469,6 @@ static size_t tcg_n_regions(size_t tb_size, unsigned max_cpus)
   (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
    ? DEFAULT_CODE_GEN_BUFFER_SIZE_1 : MAX_CODE_GEN_BUFFER_SIZE)
 
-static size_t size_code_gen_buffer(size_t tb_size)
-{
-    /* Size the buffer.  */
-    if (tb_size == 0) {
-        size_t phys_mem = qemu_get_host_physmem();
-        if (phys_mem == 0) {
-            tb_size = DEFAULT_CODE_GEN_BUFFER_SIZE;
-        } else {
-            tb_size = MIN(DEFAULT_CODE_GEN_BUFFER_SIZE, phys_mem / 8);
-        }
-    }
-    if (tb_size < MIN_CODE_GEN_BUFFER_SIZE) {
-        tb_size = MIN_CODE_GEN_BUFFER_SIZE;
-    }
-    if (tb_size > MAX_CODE_GEN_BUFFER_SIZE) {
-        tb_size = MAX_CODE_GEN_BUFFER_SIZE;
-    }
-    return tb_size;
-}
-
 #ifdef __mips__
 /* In order to use J and JAL within the code_gen_buffer, we require
    that the buffer not cross a 256MB boundary.  */
@@ -836,13 +816,29 @@ static int alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
  */
 void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
 {
-    size_t page_size;
+    const size_t page_size = qemu_real_host_page_size;
     size_t region_size;
     size_t i;
     int have_prot;
 
-    have_prot = alloc_code_gen_buffer(size_code_gen_buffer(tb_size),
-                                      splitwx, &error_fatal);
+    /* Size the buffer.  */
+    if (tb_size == 0) {
+        size_t phys_mem = qemu_get_host_physmem();
+        if (phys_mem == 0) {
+            tb_size = DEFAULT_CODE_GEN_BUFFER_SIZE;
+        } else {
+            tb_size = QEMU_ALIGN_DOWN(phys_mem / 8, page_size);
+            tb_size = MIN(DEFAULT_CODE_GEN_BUFFER_SIZE, tb_size);
+        }
+    }
+    if (tb_size < MIN_CODE_GEN_BUFFER_SIZE) {
+        tb_size = MIN_CODE_GEN_BUFFER_SIZE;
+    }
+    if (tb_size > MAX_CODE_GEN_BUFFER_SIZE) {
+        tb_size = MAX_CODE_GEN_BUFFER_SIZE;
+    }
+
+    have_prot = alloc_code_gen_buffer(tb_size, splitwx, &error_fatal);
     assert(have_prot >= 0);
 
     /* Request large pages for the buffer and the splitwx.  */
@@ -857,9 +853,8 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
      * As a result of this we might end up with a few extra pages at the end of
      * the buffer; we will assign those to the last region.
      */
-    region.n = tcg_n_regions(region.total_size, max_cpus);
-    page_size = qemu_real_host_page_size;
-    region_size = region.total_size / region.n;
+    region.n = tcg_n_regions(tb_size, max_cpus);
+    region_size = tb_size / region.n;
     region_size = QEMU_ALIGN_DOWN(region_size, page_size);
 
     /* A region must have at least 2 pages; one code, one guard */
-- 
2.25.1


