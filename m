Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB9F5F5F66
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:19:00 +0200 (CEST)
Received: from localhost ([::1]:39902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHPX-0008O3-K0
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIG-0005Q7-7P
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:28 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:42802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIE-0006x0-0A
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:27 -0400
Received: by mail-pl1-x633.google.com with SMTP id c24so519264pls.9
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=DRFC50U9dyvtXdLShq+XHevnJofYGzZnrDEQDuNtnAo=;
 b=QZShy2ewT/j4hEm1ArJxOYWw9aQNrWrd1yrcRNj602P9+hMPkE1LoJ60ybcDanDT8d
 Y5gUSsGsrEI3Fal0Rmyngm9qt7dFsn/WugGrXAZAgLooZ+aQ09+fuZ/iLSWm9UepWPOj
 fy4+EJv2wX2qeqKimQXIa0i1211EFb9kxjF597ivv4C1MXy/XkgdBe0SonmJyVgdQBM6
 rc0tZiKosOAzc8PWC90X8WAM6864ZocyLxUvV+GZS6e7SII7qSIVs5eQ1mMDQD7Mhck1
 rP5qQzy2HfBrMiMg24nHs7OrZfLIKHnaoP4L/KOvwSmHxegl597+hepXNkfJRPetR1uU
 o/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DRFC50U9dyvtXdLShq+XHevnJofYGzZnrDEQDuNtnAo=;
 b=tuqX+rYNy56DVEfbMeiYgrvOf6gX/xfusohpr0FhPP9NwkMM5UtGbdCOxVh1iY3AFm
 NP/8OqWbvGp06b/Hqoq/nUF3UFBKxMsW1c8V4sAAvoF8mimSz1+p6xIxV0XWwcgSj6Yi
 MvKNlT3QF1WVeZh/Fl79n1FII5vi7NUzZIVGBjU2J8UlrueFC9U6MtMh6IQ8fDLu/1x4
 xcFUSeY5xSK6nG3WSiPW0XtGmdYQt0hDeigqm8mi4VI5iFzDdYbIJiFjGRtvzERJPvO2
 z7W6VskXQpnv8UNC4xjzjPEHKGZxPObn+T3mV1xMiMBS509Q5Q4Iztk65EnFjay841Ys
 VUug==
X-Gm-Message-State: ACrzQf0tSIP3mbGPnzOuknPmkpZxTEhWSphtT+atyN9OLnMTsEh1Pg7W
 tIWVYS3DNHJmOFC1GUBeaSUQcKupws91bg==
X-Google-Smtp-Source: AMsMyM4GHhoTTJ7p2GGSg+gFVU/fLsnCjbNJO+WkDGnwsB7meIL6Ov+AuO3QX/9Bb/ZkWMj6qkuJvg==
X-Received: by 2002:a17:90a:6003:b0:20a:6fa6:b5b with SMTP id
 y3-20020a17090a600300b0020a6fa60b5bmr2853282pji.21.1665025884162; 
 Wed, 05 Oct 2022 20:11:24 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 07/24] accel/tcg: Drop cpu_get_tb_cpu_state from
 TARGET_HAS_PRECISE_SMC
Date: Wed,  5 Oct 2022 20:10:56 -0700
Message-Id: <20221006031113.1139454-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

The results of the calls to cpu_get_tb_cpu_state,
current_{pc,cs_base,flags}, are not used.
In tb_invalidate_phys_page, use bool for current_tb_modified.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-maint.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 66c1900ae6..9af5cb49e0 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -502,23 +502,13 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
     int n;
 #ifdef TARGET_HAS_PRECISE_SMC
     CPUState *cpu = current_cpu;
-    CPUArchState *env = NULL;
     bool current_tb_not_found = retaddr != 0;
     bool current_tb_modified = false;
     TranslationBlock *current_tb = NULL;
-    target_ulong current_pc = 0;
-    target_ulong current_cs_base = 0;
-    uint32_t current_flags = 0;
 #endif /* TARGET_HAS_PRECISE_SMC */
 
     assert_page_locked(p);
 
-#if defined(TARGET_HAS_PRECISE_SMC)
-    if (cpu != NULL) {
-        env = cpu->env_ptr;
-    }
-#endif
-
     /*
      * We remove all the TBs in the range [start, end[.
      * XXX: see if in some cases it could be faster to invalidate all the code
@@ -554,8 +544,6 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
                  */
                 current_tb_modified = true;
                 cpu_restore_state_from_tb(cpu, current_tb, retaddr, true);
-                cpu_get_tb_cpu_state(env, &current_pc, &current_cs_base,
-                                     &current_flags);
             }
 #endif /* TARGET_HAS_PRECISE_SMC */
             tb_phys_invalidate__locked(tb);
@@ -679,11 +667,7 @@ bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
 #ifdef TARGET_HAS_PRECISE_SMC
     TranslationBlock *current_tb = NULL;
     CPUState *cpu = current_cpu;
-    CPUArchState *env = NULL;
-    int current_tb_modified = 0;
-    target_ulong current_pc = 0;
-    target_ulong current_cs_base = 0;
-    uint32_t current_flags = 0;
+    bool current_tb_modified = false;
 #endif
 
     assert_memory_lock();
@@ -698,9 +682,6 @@ bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
     if (p->first_tb && pc != 0) {
         current_tb = tcg_tb_lookup(pc);
     }
-    if (cpu != NULL) {
-        env = cpu->env_ptr;
-    }
 #endif
     assert_page_locked(p);
     PAGE_FOR_EACH_TB(p, tb, n) {
@@ -713,10 +694,8 @@ bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
              * after the current PC, but it would require a specialized
              * function to partially restore the CPU state.
              */
-            current_tb_modified = 1;
+            current_tb_modified = true;
             cpu_restore_state_from_tb(cpu, current_tb, pc, true);
-            cpu_get_tb_cpu_state(env, &current_pc, &current_cs_base,
-                                 &current_flags);
         }
 #endif /* TARGET_HAS_PRECISE_SMC */
         tb_phys_invalidate(tb, addr);
-- 
2.34.1


