Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0206F5E928E
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:10:10 +0200 (CEST)
Received: from localhost ([::1]:41834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocPWS-0004f8-T6
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEx-00032b-57
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:52:03 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:36535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEv-0000NL-Jy
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:52:02 -0400
Received: by mail-qk1-x72e.google.com with SMTP id i3so2652391qkl.3
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=0AHQ15bdXv3V/XhfvkV/1ZzCa7qRaWxOYtuze5IOQL8=;
 b=b2SwHTV8AGXreemtRS7m+vFY3ryBKri3ZOGIAc6eeWu7Gw1y2B35icbV7zKz4N6bQS
 0+h8VbLRw6ewHopYviR5qxOGWPVZRkxjXOJaN0k0oyCdz5N5mF+pbAyU2IKOe8UyT/G8
 z01WDEK700finS4jEMc69an7AZQyslscABias19a2VfhQdFWe+b+qTR7sKqI+1Pkogdt
 w1Xhski8DP59P/zNOmbXAdMk04eICRLA/ITQfFJJN/3yHBfeUmbbbxCDfYEMjAdqAcDn
 2D+bh+LoO4P8YsX6sFYII63tBzo9Pcufe/f/WSLCR6WvvrZ6wTbyybGslmChXStZSKHl
 m5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0AHQ15bdXv3V/XhfvkV/1ZzCa7qRaWxOYtuze5IOQL8=;
 b=RaKHvvMu/BY7EGF8u1F32UE6PlsFu0gXHDN3pvJpjv6vQefYAS93Ot80YFuYJrXWdK
 h5HEjazWGrXlLSTZ2UDIyizhxeQUVTyYZXEYp1kg9tOcGBO8B6eUOX7KSMJOyRfprBj6
 3CruUlHscwcH6bY+9yCiPs5Ps6RKW5ZUa/1qg+Wy0TlCAxwh7NBweo9de56W7ePy7tVV
 MzetkcynRiZS1oFrMMLIGoC+wmg3H+W/jcq+ATh75QPGlSR7mTz1u1u9Srlfkh0273l9
 ImvpttG7cApylqJZdri2rT2lb78709c/4kLa1/wAxJKLIeDW+U0GhgOFW+il56iIxNK3
 1E0Q==
X-Gm-Message-State: ACrzQf1R/Ta/+7Zi0hIPO/J49LbOwYB6keoR/d/wJGRYC6hnc6pCoGlT
 s1RtnVNVBYIiV7UfUPIu3lQNbTsEULiZNw==
X-Google-Smtp-Source: AMsMyM6cpleTbSHpOUtqUfF9gFtsrC1eF+EIpegnYtMtRcsHcxEmIqWdxqXehNOlILPBlBkEuAs/ww==
X-Received: by 2002:ae9:ed8e:0:b0:6ce:7eb6:adb8 with SMTP id
 c136-20020ae9ed8e000000b006ce7eb6adb8mr11024359qkg.777.1664103120636; 
 Sun, 25 Sep 2022 03:52:00 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a9:5c0e:1ec2:d482:4986:8538])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a0c4f00b006cf19068261sm10061132qki.116.2022.09.25.03.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 03:52:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 09/17] accel/tcg: Add force_aligned to CPUTLBEntryFull
Date: Sun, 25 Sep 2022 10:51:16 +0000
Message-Id: <20220925105124.82033-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925105124.82033-1-richard.henderson@linaro.org>
References: <20220925105124.82033-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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

Support per-page natural alignment checking.  This will be
used by Arm for pages mapped with memory type Device.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h |  3 +++
 accel/tcg/cputlb.c      | 20 +++++++++++++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 7c0ba93826..d0acbb4d35 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -167,6 +167,9 @@ typedef struct CPUTLBEntryFull {
     /* @byte_swap indicates that all accesses use inverted endianness. */
     bool byte_swap;
 
+    /* @force_aligned indicates that all accesses must be aligned. */
+    bool force_aligned;
+
     /*
      * Allow target-specific additions to this structure.
      * This may be used to cache items from the guest cpu
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 1a5a6bd98b..01a89b4a1f 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1146,7 +1146,7 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
         /* Repeat the MMU check and TLB fill on every access.  */
         address |= TLB_INVALID_MASK;
     }
-    if (full->byte_swap) {
+    if (full->byte_swap || full->force_aligned) {
         address |= TLB_SLOW_PATH;
     }
 
@@ -1944,16 +1944,19 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
 
     /* Handle anything that isn't just a straight memory access.  */
     if (unlikely(tlb_addr & ~TARGET_PAGE_MASK)) {
-        CPUTLBEntryFull *full;
+        CPUTLBEntryFull *full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
         bool need_swap;
 
         /* For anything that is unaligned, recurse through full_load.  */
         if ((addr & (size - 1)) != 0) {
+            /* Honor per-page alignment requirements. */
+            if (full->force_aligned) {
+                cpu_unaligned_access(env_cpu(env), addr, access_type,
+                                     mmu_idx, retaddr);
+            }
             goto do_unaligned_access;
         }
 
-        full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
-
         /* Handle watchpoints.  */
         if (unlikely(tlb_addr & TLB_WATCHPOINT)) {
             /* On watchpoint hit, this will longjmp out.  */
@@ -2349,16 +2352,19 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
 
     /* Handle anything that isn't just a straight memory access.  */
     if (unlikely(tlb_addr & ~TARGET_PAGE_MASK)) {
-        CPUTLBEntryFull *full;
+        CPUTLBEntryFull *full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
         bool need_swap;
 
         /* For anything that is unaligned, recurse through byte stores.  */
         if ((addr & (size - 1)) != 0) {
+            /* Honor per-page alignment requirements. */
+            if (full->force_aligned) {
+                cpu_unaligned_access(env_cpu(env), addr, MMU_DATA_STORE,
+                                     mmu_idx, retaddr);
+            }
             goto do_unaligned_access;
         }
 
-        full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
-
         /* Handle watchpoints.  */
         if (unlikely(tlb_addr & TLB_WATCHPOINT)) {
             /* On watchpoint hit, this will longjmp out.  */
-- 
2.34.1


