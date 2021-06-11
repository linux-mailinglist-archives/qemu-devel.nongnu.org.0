Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFAF3A4B91
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 02:00:58 +0200 (CEST)
Received: from localhost ([::1]:48560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrr57-0007CY-A2
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 20:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmr-00032o-1P
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:05 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:33455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmo-0002kN-F4
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:04 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso8024785pjz.0
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2wvd/6SGk1w8OXui4/FBWGSYpErzZvV+B9LV37fcakY=;
 b=bdLFHHPwOlW4VyQm3We/eXb+tvzIbp+VmnB2Zly8tWpPgPtoeRvAv1cIGMxSgYlY3V
 f+Veegvt7fssgEJ40mQZFwEcIDHKqK5WYB6fGkyCYJSIRDdFeoUGqc2vUSvaONXmaPsw
 q8FigcpwXC4XRlAI38t8RWF9JyIBiYFk+pH5kgFf04Xm8XuVwpjDWjNwIdkL4D7VwlNY
 tuLckFRAzHYwoRv3M55EznPELFIm9XK6WFocRN9hNgxOuHBVbPVn4YSXRc3iir+eE/7u
 SmZ/fCWUCd0UE8G7o3d9e8k/0RvYyDRki+a4Yze+M73i1tYNQmROeewjg9NgPTtaBkvF
 1Feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2wvd/6SGk1w8OXui4/FBWGSYpErzZvV+B9LV37fcakY=;
 b=nROPJDFoXdkITSSMj/FqjTOHkLkOFalvJ9Xi9IxF6Ol1idsQbg5A6TvZ4Y43PsM4sm
 sIqGPoP+JtuwUQAz5WJJVtb2ra9RHsNjsyst0QEb489twO1/+Lsj+a3Qgmp6ac97+IXu
 NXFudXt8TekH3UX7h44bJb9ACIJqnGEvqm0m8+wnZRmzjqhRDBzb+wMJQbXnxBfKvNbv
 Sq6zxjrWDeYhrdAeaUDDTyR1qwSGIjuWUxKKKBP/QYswYGJc7GcGlzU9VrW51wm4ktQl
 sJA2YG3GOpdwfIWfTHCggaqUka+vtHQnLYvu5XivR3YMymniwf7y6evx5BW4vvAnom+y
 LF2Q==
X-Gm-Message-State: AOAM533vFATkhG1NbDb78goMxsd2xZTDvLlKQL9MsXXh6ZYHP/uEpFrW
 oYStemTHrbAFwxhTQX4CAz106TbLCnbsyQ==
X-Google-Smtp-Source: ABdhPJzg2181udEs2qkSjDl8G9fc52RnLdXhFA717eUGgrNoWN5fnZrnqJJ0kSdhZ93TWCJr36M2gQ==
X-Received: by 2002:a17:902:c789:b029:110:4933:71ce with SMTP id
 w9-20020a170902c789b0290110493371cemr6151169pla.56.1623454921175; 
 Fri, 11 Jun 2021 16:42:01 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:42:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/34] tcg: Round the tb_size default from qemu_get_host_physmem
Date: Fri, 11 Jun 2021 16:41:36 -0700
Message-Id: <20210611234144.653682-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

If qemu_get_host_physmem returns an odd number of pages,
then physmem / 8 will not be a multiple of the page size.

The following was observed on a gitlab runner:

ERROR qtest-arm/boot-serial-test - Bail out!
ERROR:../util/osdep.c:80:qemu_mprotect__osdep: \
  assertion failed: (!(size & ~qemu_real_host_page_mask))

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 47 +++++++++++++++++++++--------------------------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 2e541cd2bf..e1790ce1e4 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -470,26 +470,6 @@ static size_t tcg_n_regions(size_t tb_size, unsigned max_cpus)
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
 /*
  * In order to use J and JAL within the code_gen_buffer, we require
@@ -841,13 +821,29 @@ static int alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
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
@@ -862,9 +858,8 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
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


