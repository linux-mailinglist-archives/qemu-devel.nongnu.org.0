Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B787160D93F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:27:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVu5-0004yQ-HK; Tue, 25 Oct 2022 22:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVu3-0004yG-2S
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:23 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVu1-0001EB-DR
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:22 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso1078581pjc.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=su7SRG6mA4EK+3Nl1nKtKV8hb+mbjAByRO+UTdDwjN0=;
 b=AN5Sy4RY/pCtkYuTYQAYfVNLnO2S86ypK5qqiCs+TZUM3ZUCoqdIc7LOy2V01JSuYj
 K6ox1X7jnjZ3p6qV9rVsSiT4IeHYyCYlpba3aBXJt5589ew3wY1cZG8rQ2ZvRJjoZaTd
 ZtoHsTAowdwLttAGURgeFlXbWkv8QI2AR8w2633c42xyQxJTAB6hatEqGYAZ6ky2AMJ9
 2r1XoPryPsCyAK60nW39+LYNiKDP7Y6JSZvUZia0D5US57iHe6qh0KcfcUgqEoPxQeyF
 4ViaVD1ulyr4AjCsuRI/6+MfDmH1dVl+VD5qqplNSsXPX1+d0tbeJwfgg08GoptJoytK
 DTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=su7SRG6mA4EK+3Nl1nKtKV8hb+mbjAByRO+UTdDwjN0=;
 b=53Bw7depUD5agb7e6DbLSaCmDzdwHsGAf94ygC5naouh2OLt3Rgo41RMIlaODosIux
 97sTpFeHChh6f6HgGmEwFxJNj7rlD2K70XO9R9VhVcJ0LEzh3ZVDuHi4Cn0fk34dsAqM
 iq2gcYbxB6qzSqUkB/LcajYk2kvh1+fUhIQfmSpWv4YpRJ2dlqKBqWGfgWFiCA5dOVVq
 lHuoPf4tqc+jsOvr3p7L9f7J0DB5EPkAVMplQdXC2gk+F4zaaXgShTwT7xca4+BH6Jbo
 r/N7hKvQUiY6/jxIbhuw0GgMFuMqATkw9q3DmIjzUxef9/q2UxrgiO+bTwcxrnG9HciI
 M5gQ==
X-Gm-Message-State: ACrzQf3vfn0w9ZO9G52ZiWO/XPgs9eTYBwxW1VBwnUDNYwEIsq+3NxyI
 AYH+t28Y4FDCMXF/z0s308AMx/gQzmHjk4N6
X-Google-Smtp-Source: AMsMyM7kTe8TXoJ7GIw7xuoCeVFl0S57d7+pKwaX4uz9wjJj6mQJNt5Z0CQlDdDS36dIK0T7XAOi/g==
X-Received: by 2002:a17:90b:4f8a:b0:213:48f0:296f with SMTP id
 qe10-20020a17090b4f8a00b0021348f0296fmr1520582pjb.140.1666750340051; 
 Tue, 25 Oct 2022 19:12:20 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 20/47] accel/tcg: Call tb_invalidate_phys_page for PAGE_RESET
Date: Wed, 26 Oct 2022 12:10:49 +1000
Message-Id: <20221026021116.1988449-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When PAGE_RESET is set, we are replacing pages with new
content, which means that we need to invalidate existing
cached data, such as TranslationBlocks.  Perform the
reset invalidate while we're doing other invalidates,
which allows us to remove the separate invalidates from
the user-only mmap/munmap/mprotect routines.

In addition, restrict invalidation to PAGE_EXEC pages.
Since cdf713085131, we have validated PAGE_EXEC is present
before translation, which means we can assume that if the
bit is not present, there are no translations to invalidate.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 19 +++++++++++--------
 bsd-user/mmap.c           |  2 --
 linux-user/mmap.c         |  4 ----
 3 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 8d5233fa9e..478301f227 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1352,7 +1352,7 @@ int page_get_flags(target_ulong address)
 void page_set_flags(target_ulong start, target_ulong end, int flags)
 {
     target_ulong addr, len;
-    bool reset_target_data;
+    bool reset;
 
     /* This function should never be called with addresses outside the
        guest address space.  If this assert fires, it probably indicates
@@ -1369,7 +1369,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     if (flags & PAGE_WRITE) {
         flags |= PAGE_WRITE_ORG;
     }
-    reset_target_data = !(flags & PAGE_VALID) || (flags & PAGE_RESET);
+    reset = !(flags & PAGE_VALID) || (flags & PAGE_RESET);
     flags &= ~PAGE_RESET;
 
     for (addr = start, len = end - start;
@@ -1377,14 +1377,17 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
          len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
         PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, true);
 
-        /* If the write protection bit is set, then we invalidate
-           the code inside.  */
-        if (!(p->flags & PAGE_WRITE) &&
-            (flags & PAGE_WRITE) &&
-            p->first_tb) {
+        /*
+         * If the page was executable, but is reset, or is no longer
+         * executable, or has become writable, then invalidate any code.
+         */
+        if ((p->flags & PAGE_EXEC)
+            && (reset ||
+                !(flags & PAGE_EXEC) ||
+                (flags & ~p->flags & PAGE_WRITE))) {
             tb_invalidate_phys_page(addr);
         }
-        if (reset_target_data) {
+        if (reset) {
             g_free(p->target_data);
             p->target_data = NULL;
             p->flags = flags;
diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index e54e26de17..d6c5a344c9 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -663,7 +663,6 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
     page_dump(stdout);
     printf("\n");
 #endif
-    tb_invalidate_phys_range(start, start + len);
     mmap_unlock();
     return start;
 fail:
@@ -769,7 +768,6 @@ int target_munmap(abi_ulong start, abi_ulong len)
 
     if (ret == 0) {
         page_set_flags(start, start + len, 0);
-        tb_invalidate_phys_range(start, start + len);
     }
     mmap_unlock();
     return ret;
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 28f3bc85ed..10f5079331 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -182,7 +182,6 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
     }
 
     page_set_flags(start, start + len, page_flags);
-    tb_invalidate_phys_range(start, start + len);
     ret = 0;
 
 error:
@@ -662,7 +661,6 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
             qemu_log_unlock(f);
         }
     }
-    tb_invalidate_phys_range(start, start + len);
     mmap_unlock();
     return start;
 fail:
@@ -766,7 +764,6 @@ int target_munmap(abi_ulong start, abi_ulong len)
 
     if (ret == 0) {
         page_set_flags(start, start + len, 0);
-        tb_invalidate_phys_range(start, start + len);
     }
     mmap_unlock();
     return ret;
@@ -856,7 +853,6 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
         page_set_flags(new_addr, new_addr + new_size,
                        prot | PAGE_VALID | PAGE_RESET);
     }
-    tb_invalidate_phys_range(new_addr, new_addr + new_size);
     mmap_unlock();
     return new_addr;
 }
-- 
2.34.1


