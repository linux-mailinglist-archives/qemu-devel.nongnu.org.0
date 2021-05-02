Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8024370FE1
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:36:41 +0200 (CEST)
Received: from localhost ([::1]:57284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLdh-0005bL-1G
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMn-0008OC-Sb
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:13 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:34534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMh-0002zT-IC
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:13 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 t2-20020a17090a0242b0290155433387beso8876112pje.1
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5l4dTEQ+iJa2jxENce/P7jthFYg4uP2TXzJ1O/jGZ+Y=;
 b=oWB3YD69tY3UrXqCZ6ReDTbFcFYpoaXmPC1VE50NiJB0i0AqqhPj+opLD+I07E6cCQ
 b4E413RmBsjfo+xRdkgRwATew9lX9+nLUd66qIiDCvuYKAvdjNc3SNEqD9Mj/L2g42BE
 frVGfuT+vajsHy25OJ7pzOE8S1abTS8Rsh1Z1EfEZhGDPPSB6+9xd0SeZAOMlePLcAIb
 yOptrfD0SDknoIhE5Unq61pd0bCX0kr3eB686obMP98PZnzM/bASOta73BIJGJVT2xHB
 Uh7g27iluObewQ2ZWpNEFD7vxleUpDrAbcWYq9qWtynFkqOgVewCTWSL3wozmE7bSkpP
 BjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5l4dTEQ+iJa2jxENce/P7jthFYg4uP2TXzJ1O/jGZ+Y=;
 b=T0m+U479UnGNVBHwU73/UJC8QaQkLXj1VpCwjJZK+Xp1yTGpCvmX+ePohMQSLfwyEI
 QasoD18IoIHq9uPO7kWytIyLdrYWTPo+QrMUlBGK42RaNBE8GgJoNHNSDF8tFM4WEFgR
 uSO5sL3Y22yKA+3ZadSZboYmpUG1f7gkV0E8gVFFPY3POLpmYd164BK7X0AgWPXphabt
 1ZWEmCGnDyxRmyruhi7rj8Kl2QKSbPw3XwGJ8cvDLXWRkIX36yYt1Dwdjf08uz9Qn73M
 E4eFEZkdRmEneZO784+aKhwvN/NN+gcjwU72dLi8MTEadMlQRnNqfs6Yqtf08tBLjwct
 zzeA==
X-Gm-Message-State: AOAM532cRH0/KBLL/fyFIve2DS5eaJSgExzOVwOtbiRNVfQhoMjJmucz
 40gKM5TOYCBUgho3uUlU8bRSEuHp07RYPQ==
X-Google-Smtp-Source: ABdhPJwjFB51/J6jE7ThCv1e8B5HWqkkO5gq29LJLZuzqMp8nVjZmgfurnwIHkTyl3fnPMbEIVQGZQ==
X-Received: by 2002:a17:902:6941:b029:ee:dacc:3ab1 with SMTP id
 k1-20020a1709026941b02900eedacc3ab1mr1003352plt.3.1619997545408; 
 Sun, 02 May 2021 16:19:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.19.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:19:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/28] tcg: Merge buffer protection and guard page
 protection
Date: Sun,  2 May 2021 16:18:42 -0700
Message-Id: <20210502231844.1977630-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Do not handle protections on a case-by-case basis in the
various alloc_code_gen_buffer instances; do it within a
single loop in tcg_region_init.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 45 +++++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 49764b40dc..604530b902 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -530,11 +530,6 @@ static int alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
     }
 #endif
 
-    if (qemu_mprotect_rwx(buf, size)) {
-        error_setg_errno(errp, errno, "mprotect of jit buffer");
-        return false;
-    }
-
     region.start_aligned = buf;
     region.total_size = size;
 
@@ -818,8 +813,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
 {
     const size_t page_size = qemu_real_host_page_size;
     size_t region_size;
-    size_t i;
-    int have_prot;
+    int have_prot, need_prot;
 
     /* Size the buffer.  */
     if (tb_size == 0) {
@@ -879,18 +873,41 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
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


