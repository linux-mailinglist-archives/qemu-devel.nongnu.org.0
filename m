Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FBB3A4B8B
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:59:47 +0200 (CEST)
Received: from localhost ([::1]:45790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrr3y-0005K7-Rn
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqms-00034x-M3
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:07 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmp-0002lC-84
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:04 -0400
Received: by mail-pj1-x1035.google.com with SMTP id g24so6520329pji.4
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y0NBhQuf2KfybteRYM2KfBpCijz1I25HMN5sM61Z6v0=;
 b=o/uGJs1gxi/tL/H5aFJh5EEYEMxG/xjxCjqMitcEU8cNEwcaDp1ptEcvUbxUYkAHYY
 +oYzgvCmCb3DfTvIBDv66oZ5bhyxo94SpqCvV8aePG+7s7hPWZjOWLKHwZOhfPALEBy0
 Vc9SLxa2iVzVnkowG/QROcHchOgAK8fgXYfjH/yFk7P4C71OTmTL9enqIOBqSpNS4Z5j
 1O3lfHNtCQPrS+nznV+sfxWwDK/MZTGOxxzntq9UgqLW+7MdMeOB3sni9LEUQxB8gV6m
 5QzowGJ0ECMxEMmQ0eMlxltxT+MgnUFaKybcyORS6+1xvK3vDIW/nLOngpDZPNj7iYXf
 0uzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y0NBhQuf2KfybteRYM2KfBpCijz1I25HMN5sM61Z6v0=;
 b=TUJZm5aIFatEgyFXTSMGwvihK1LrJjo2zln2+fOBF5EI/c8FHlCGRddG4G4yt5Y7o9
 1kTascazNKLE/Qtn2SFo1iv/V09FgEtQG4Wntu6CZNgkKvXSZfcn8mQm85DtqBTsDcsm
 OAWnZbbLLaq1VwKEIVmoL2cjGxXzw4wWg9ldpbvp95MjBtVeY/t+r3Xd+DJYWBYBv/oi
 DXAFQ29HeZKpo8dKv0fQGtD33EqG+JC38dggPSolAjRLBk/BqP+okfI7e4OiRV0SHMNP
 P0Nq0dTawLr+xL4yBW5X8JcvJrl98QLOGgaYWN/Qywx3o2zUHNL3vg1Xer2jZlX+OmrT
 3Rqg==
X-Gm-Message-State: AOAM5310o2xNVPG0HHYPeNP5wrIvEu52uruuujGVaPeV5aXPqgKVDA4R
 i0K+WQDR4BRXWB0rXriUg7X8crfA/sWMJg==
X-Google-Smtp-Source: ABdhPJwhBq2JLitlCbcJl4YVD2A7KjKeceQ3bbPB0ryuAoBN964gGttQPFd7fPh51JsqGUzry3iqNQ==
X-Received: by 2002:a17:90a:4817:: with SMTP id
 a23mr11795414pjh.192.1623454921966; 
 Fri, 11 Jun 2021 16:42:01 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:42:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/34] tcg: Merge buffer protection and guard page protection
Date: Fri, 11 Jun 2021 16:41:37 -0700
Message-Id: <20210611234144.653682-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Do not handle protections on a case-by-case basis in the
various alloc_code_gen_buffer instances; do it within a
single loop in tcg_region_init.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 45 +++++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index e1790ce1e4..294cbd8e65 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -535,11 +535,6 @@ static int alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
     }
 #endif
 
-    if (qemu_mprotect_rwx(buf, size)) {
-        error_setg_errno(errp, errno, "mprotect of jit buffer");
-        return false;
-    }
-
     region.start_aligned = buf;
     region.total_size = size;
 
@@ -823,8 +818,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
 {
     const size_t page_size = qemu_real_host_page_size;
     size_t region_size;
-    size_t i;
-    int have_prot;
+    int have_prot, need_prot;
 
     /* Size the buffer.  */
     if (tb_size == 0) {
@@ -884,18 +878,41 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
      * Set guard pages in the rw buffer, as that's the one into which
      * buffer overruns could occur.  Do not set guard pages in the rx
      * buffer -- let that one use hugepages throughout.
+     * Work with the page protections set up with the initial mapping.
      */
-    for (i = 0; i < region.n; i++) {
+    need_prot = PAGE_READ | PAGE_WRITE;
+#ifndef CONFIG_TCG_INTERPRETER
+    if (tcg_splitwx_diff == 0) {
+        need_prot |= PAGE_EXEC;
+    }
+#endif
+    for (size_t i = 0, n = region.n; i < n; i++) {
         void *start, *end;
 
         tcg_region_bounds(i, &start, &end);
+        if (have_prot != need_prot) {
+            int rc;
 
-        /*
-         * macOS 11.2 has a bug (Apple Feedback FB8994773) in which mprotect
-         * rejects a permission change from RWX -> NONE.  Guard pages are
-         * nice for bug detection but are not essential; ignore any failure.
-         */
-        (void)qemu_mprotect_none(end, page_size);
+            if (need_prot == (PAGE_READ | PAGE_WRITE | PAGE_EXEC)) {
+                rc = qemu_mprotect_rwx(start, end - start);
+            } else if (need_prot == (PAGE_READ | PAGE_WRITE)) {
+                rc = qemu_mprotect_rw(start, end - start);
+            } else {
+                g_assert_not_reached();
+            }
+            if (rc) {
+                error_setg_errno(&error_fatal, errno,
+                                 "mprotect of jit buffer");
+            }
+        }
+        if (have_prot != 0) {
+            /*
+             * macOS 11.2 has a bug (Apple Feedback FB8994773) in which mprotect
+             * rejects a permission change from RWX -> NONE.  Guard pages are
+             * nice for bug detection but are not essential; ignore any failure.
+             */
+            (void)qemu_mprotect_none(end, page_size);
+        }
     }
 
     tcg_region_trees_init();
-- 
2.25.1


