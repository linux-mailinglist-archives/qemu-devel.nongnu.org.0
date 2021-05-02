Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B76370FDE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:34:26 +0200 (CEST)
Received: from localhost ([::1]:51396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLbV-00038B-LX
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMm-0008Ne-Je
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:12 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMg-0002zQ-8g
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:12 -0400
Received: by mail-pj1-x102f.google.com with SMTP id gj14so2044964pjb.5
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=euZbMSCAnJ/aSruzU2XNeMy2K5psC8+GIr707J2MLks=;
 b=TGIP86FWhF7MbSaUoncx5PfFlCuHIHgjEVBQ0IBRA+IUeyizbrSbdsUBl7n1DAIrLi
 ahVX7QO1JCpSSQwhu/ZA5N+7++TIxW+40s0o3zJqset2Am9kB/GD+TBXUe7crRLsmhZq
 R2oc5W1nE5+CPuq2wimv/jNCPzFxqx7he/0UL9OpYiW2FkVPTy7gCNEryKZNRbUXDR4d
 Ls0THUJn3IM8s8aUq9LiutcGQGBwMCGMDIvZYzjm9iEwSE35ktfQQ6SyOIh36vN09RVm
 ybHa3roUpKap/uVhZW9Ebi/8/ike/BUxTg4SzkIG9uvP18XSzkysH9xrQ6HXb0K/u/jq
 BoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=euZbMSCAnJ/aSruzU2XNeMy2K5psC8+GIr707J2MLks=;
 b=DNkH54AREBBEallL2O0YybCPunTKIy7ib1qRXZ2AWq5a414niwyHBcDAwHjY9I73QY
 DR2++EJd4agF76h6QqGsqcGMPDQeL205qiS0tNKpn8CqD1Ai/kNHJNJI5TiOcyiNONH8
 u3a1LDb8NFaTt5fCKdUS9lzzskhLepaj6nwCy8pOUFWZnZjVQy1J4EnUOIH6yJEAtRiL
 6Int651hF5cPphgdvLUlv8ofoQUNrmKXvRpokgvWEDWx30L1URYeGXOkK5ihS42swKPm
 vUA2qvui4NoR/FwRltwJfwmqY6tcsYWdix1L/jcvLGQxfTS832BLbF1rSwL+9o6sia9I
 8IsA==
X-Gm-Message-State: AOAM5322za+YxJsNEgEJ+/6FezRJQYxCwCYpWPAU85sJPNUbyDYO9moN
 sOdWmZ+uqnXFxhmLm6M48E6mDamtVO9F9w==
X-Google-Smtp-Source: ABdhPJzXr+TKJ9Fek5fbCzdbtiVWReGwpyO65a0izv7WN5Ud8jRrfqzTG6kuwniV05qe4wjtZjIgMQ==
X-Received: by 2002:a17:902:7281:b029:ea:afe2:b356 with SMTP id
 d1-20020a1709027281b02900eaafe2b356mr17643619pll.16.1619997544597; 
 Sun, 02 May 2021 16:19:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.19.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:19:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/28] tcg: Round the tb_size default from
 qemu_get_host_physmem
Date: Sun,  2 May 2021 16:18:41 -0700
Message-Id: <20210502231844.1977630-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
index b3f0b9bda5..49764b40dc 100644
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


