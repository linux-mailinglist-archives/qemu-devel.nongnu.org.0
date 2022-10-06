Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DF35F5F9C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:26:53 +0200 (CEST)
Received: from localhost ([::1]:60890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHXA-0006Nt-EV
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIN-0005qQ-H5
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:35 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIL-0006xx-Lb
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:35 -0400
Received: by mail-pf1-x435.google.com with SMTP id v186so835333pfv.11
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=dHdAexTxcvEANXE2xc0nlvNki+DaezbfRQXE+k/TXUs=;
 b=D5xP7qEFHoVr4nmcRoJAqJfl1NFpk0/DEXiw0sghThEWDxNfFbglKHnvUSsj4CsKDF
 p1rAkvFPGPvQJy2H+V8X0y+XXEuF/+nfytXbTkQzivKHADoTRLhozANjRQkwLJe0c95y
 MQ5GYHwGzIDMG8smdVRcejTa6zrS0zVZP8nlZf3xanxQvPmyT1hz5OASBnQ6K4fZjJoH
 5Qmd7or63GmDYfWWwuHxBlGi7b6rBiUyQ1gbvYt2jdeEa4c3BNTMWYySDZr/gKOzr7Sm
 8M9nzqnMSuYa0VF9hluF/AkWKa4dcv1c+atBMqf9j18g4UkFM04ddiPibcalN482t8oe
 C/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=dHdAexTxcvEANXE2xc0nlvNki+DaezbfRQXE+k/TXUs=;
 b=Lvqat8El89yBasY5fjFG8igbNjOxoyfcgE4VZZdMgrKih2w3P/KIR4k59kWkm8D/4t
 r0+tqsFWHHxsX5qWdEQfLMEB2/k4sRUQkylV1WMggtaHQHB6a0SEEPK7IvAf930XylfD
 XWUjgXsoVMMYK8VhJkhlrzc+Aoje/U2USRVjgNgO9sHCcMfpn0x7goSvfgj8YoeIOd18
 QgHO904P/lEyrf3zVCm1UrYwaE4qQlQgFVqxkiDDzVvctiVlTHBQmkO3e6+lKddPTG0U
 YemVVK8dXyS8US6ksDhQepL+8lh845VTce0NL6txP3BOmWfpNF7niGKnktvI4pFsQ3x5
 WZgA==
X-Gm-Message-State: ACrzQf1btTlL+gqf/D/Civki/iaIE5mUYXNYY/kZSkE9iBlMNJOoNv7k
 NmO2veAVbfVsFSTWtWLr57AD9ECTGMYucg==
X-Google-Smtp-Source: AMsMyM6ruoGQDcs1GxIJ/mjmJakCmiB28LxYc0RHjFuswQk+uDjn3HOUgbD0etzGL4Jvy2nsQk9CQg==
X-Received: by 2002:a05:6a00:4106:b0:548:9e0e:f13b with SMTP id
 bu6-20020a056a00410600b005489e0ef13bmr3002033pfb.0.1665025892871; 
 Wed, 05 Oct 2022 20:11:32 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 14/24] accel/tcg: Call tb_invalidate_phys_page for PAGE_RESET
Date: Wed,  5 Oct 2022 20:11:03 -0700
Message-Id: <20221006031113.1139454-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


