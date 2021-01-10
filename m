Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F222F09C6
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 22:10:25 +0100 (CET)
Received: from localhost ([::1]:43294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyhyh-0005Zc-NS
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 16:10:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maahiuzeon@gmail.com>)
 id 1kyhxN-0004mj-HO
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 16:09:01 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:35555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maahiuzeon@gmail.com>)
 id 1kyhxL-0008As-S6
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 16:09:01 -0500
Received: by mail-pg1-x534.google.com with SMTP id n7so11322498pgg.2
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 13:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=oMv67Nq727FZjUczV4iNdmTWnc3MM3wjCDFF2jAFh8c=;
 b=XkdJoMl7rOejI3rYuddShx9z4jRKqpoWtMTuD8Kb4bE+gBYVHF6EOXykmrAcMRnEex
 pSZnAT/kS64i90xzYWuZAxid8kJpNd6Q5z50/Fx6mVng3w5pyDzGKfz0VmRQODC8I39C
 5BU6XW3wF53/ZS/YONX2RVmjqYe+OEqUeyiPHol12IPrhZQ46PlPq4ZxhOKLs2EoZ2JH
 O7QWIDhS4iHr5CYPeBdMp0awxY5tTjd+/PJ/Kwvt4T8D3Sa3bPnQKlbCrcA9eA2bVEZ8
 gLT796HZyXuYFZU9O32ok4nvGhoDkYv1xFyosU0SIADuCU9Cx7Iz9ZnPayyREANAEEMN
 zLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=oMv67Nq727FZjUczV4iNdmTWnc3MM3wjCDFF2jAFh8c=;
 b=bjkJpo895fIEPFUQolgGa+xkC58sWlYzoV3i49fal4y9C7MEiu3J7f7scF8VBEhGS/
 7ay9/aemwoHDcpZCLZqxJgtQfGXYf4DG1qGL7yfUttKeL1KdvCvvF30c+OlUoGtq9V10
 j9QsEP5rJDQCPml85RjHNPxzYSUJybtKUKjsb1s6ugCaXFFZ85izYQefDTPHOYwfmaVu
 a9PLVx5YNGxxK4dB7oEFlmDaz6ti/hG+MaQgxNGmrWXH0dK1b4poaVMmLv3cCZO1VyNT
 sDAVfwSsI1NU50+CpQcqgvPjmsvbXB+OWYm3OZWkr99SdEYDJt7RZWXQVHAlmNb3cGoJ
 Si+w==
X-Gm-Message-State: AOAM530tKU4v/T5z0JVxhjZy4s2vG+FgS6SyJx+kjfLqWPr4+eKS95Jt
 LSwDnPzTTSRw3B6nbJFPN/0=
X-Google-Smtp-Source: ABdhPJw59jZiGEkroKFI4ulNM5YU+QR1WOZb/BVmb12EEDZBcFo1oJ3b2pZHJsPSv4tDDFW+OJts1w==
X-Received: by 2002:aa7:8517:0:b029:19d:d70f:86ec with SMTP id
 v23-20020aa785170000b029019dd70f86ecmr13669173pfn.19.1610312937941; 
 Sun, 10 Jan 2021 13:08:57 -0800 (PST)
Received: from Hills-Mac-Pro.local (c-73-222-199-61.hsd1.ca.comcast.net.
 [73.222.199.61])
 by smtp.gmail.com with ESMTPSA id i67sm17459873pfc.153.2021.01.10.13.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 13:08:57 -0800 (PST)
Date: Sun, 10 Jan 2021 13:08:54 -0800
From: Hill Ma <maahiuzeon@gmail.com>
To: r.bolshakov@yadro.com, richard.henderson@linaro.org, dirty@apple.com
Subject: [PATCH v2] hvf: guard xgetbv call.
Message-ID: <X/ts5kQD31VLIn0n@Hills-Mac-Pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=maahiuzeon@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This prevents illegal instruction on cpus do not support xgetbv.

Buglink: https://bugs.launchpad.net/qemu/+bug/1758819
Signed-off-by: Hill Ma <maahiuzeon@gmail.com>
---
 v2: xgetbv() modified based on feedback.

 target/i386/hvf/x86_cpuid.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
index a6842912f5..edaa1b7da2 100644
--- a/target/i386/hvf/x86_cpuid.c
+++ b/target/i386/hvf/x86_cpuid.c
@@ -27,15 +27,22 @@
 #include "vmx.h"
 #include "sysemu/hvf.h"
 
-static uint64_t xgetbv(uint32_t xcr)
+static bool xgetbv(uint32_t cpuid_ecx, uint32_t idx, uint64_t *xcr)
 {
-    uint32_t eax, edx;
+    uint32_t xcrl, xcrh;
 
-    __asm__ volatile ("xgetbv"
-                      : "=a" (eax), "=d" (edx)
-                      : "c" (xcr));
+    if (cpuid_ecx & CPUID_EXT_OSXSAVE) {
+        /*
+         * The xgetbv instruction is not available to older versions of
+         * the assembler, so we encode the instruction manually.
+         */
+        asm(".byte 0x0f, 0x01, 0xd0" : "=a" (xcrl), "=d" (xcrh) : "c" (idx));
 
-    return (((uint64_t)edx) << 32) | eax;
+        *xcr = (((uint64_t)xcrh) << 32) | xcrl;
+        return true;
+    }
+
+    return false;
 }
 
 uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
@@ -100,11 +107,14 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
         break;
     case 0xD:
         if (idx == 0) {
-            uint64_t host_xcr0 = xgetbv(0);
-            uint64_t supp_xcr0 = host_xcr0 & (XSTATE_FP_MASK | XSTATE_SSE_MASK |
+            uint64_t supp_xcr0 = XSTATE_FP_MASK | XSTATE_SSE_MASK |
                                   XSTATE_YMM_MASK | XSTATE_BNDREGS_MASK |
                                   XSTATE_BNDCSR_MASK | XSTATE_OPMASK_MASK |
-                                  XSTATE_ZMM_Hi256_MASK | XSTATE_Hi16_ZMM_MASK);
+                                  XSTATE_ZMM_Hi256_MASK | XSTATE_Hi16_ZMM_MASK;
+            uint64_t host_xcr0;
+            if (xgetbv(ecx, 0, &host_xcr0)) {
+                supp_xcr0 &= host_xcr0;
+            }
             eax &= supp_xcr0;
         } else if (idx == 1) {
             hv_vmx_read_capability(HV_VMX_CAP_PROCBASED2, &cap);
-- 
2.20.1 (Apple Git-117)


