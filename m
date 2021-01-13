Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A19F2F4459
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 07:08:52 +0100 (CET)
Received: from localhost ([::1]:55642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzZKs-0008OP-VK
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 01:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maahiuzeon@gmail.com>)
 id 1kzZJn-0007xf-Om
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 01:07:43 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maahiuzeon@gmail.com>)
 id 1kzZJm-0006Gd-1y
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 01:07:43 -0500
Received: by mail-pg1-x534.google.com with SMTP id n25so847665pgb.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 22:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=R/RHRy3m+/zh6zvRYJuXBU68imd1sZILCE3fM0Cn7y0=;
 b=nrPfR5HLymC9KkWM/EpawhTSUdX2wqNoF4AMaeu5DnadPsMO80CjZwh18gvalsHAdB
 QfmfuvceMye5HrJFT/rNlYHWIYtdyFgbazxIR6tCaUbJlqzRGhsVa+vfh3PCEGg91rgu
 HZ2yU4VoHMbxumuxVUrcTFKZKuA93FAELEZfboj8KADO7EQD38GublisG/5zB5zJVYUm
 CrdJiUh+t82NYHH8UMrOxFFibmFgxbBlCsr7Yc7M+oxFM5VfE2wule8QCShXNQoWOzD0
 ESzzVOpHn7pa1G22mCOBCIgsQ3XTrLVsRoK36BX/xBf5KbSjStIM+U6JOQPpey6CuayJ
 bdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=R/RHRy3m+/zh6zvRYJuXBU68imd1sZILCE3fM0Cn7y0=;
 b=sz4aSlPFh5/n11bVXODWOuoHhlaYBXXOSIk24sE2xgef/KoU8z88GEpM69RbDvhu1t
 DiTQivrCyYbVwnIk7ZYTXyl5shBG6d7P4kkP9VPsz+rdSr8TwDJh9bre+AGgz2sckqeG
 9YiT3rKhSpOhgigi9d9clTcqqTlgbx5QD4UPmmo65YRsbqkhIua1HjSUZM2gHgGeytOj
 tcReNVuqydP4Hltojn2/CH8Fwu2a69XzEXAF+FnXajcXVn2YRMPTTxVeWtvZltXZr4zJ
 8HAEjO9uCMSONxoG0h76qgvr+ue3ShDN5BtdiKDxfzov01iHgL6Px2NCK4OKJ6chEUJs
 t5uA==
X-Gm-Message-State: AOAM532+lNRvtSR9JyePdDMPTCeCBjJR5t3KPK7Pmjgh5vo1+KE7BrDQ
 QYwrQIdnIUOhK2txaFmhwO0=
X-Google-Smtp-Source: ABdhPJyQQBswthVul/dr5+S88tkMcLEqx+LNAnSGmYJiz7LPvvVtqjsIbOkOMOCJE1l+ea7VYADLEA==
X-Received: by 2002:a63:ba1e:: with SMTP id k30mr623169pgf.312.1610518058064; 
 Tue, 12 Jan 2021 22:07:38 -0800 (PST)
Received: from Hills-Mac-Pro.local (c-73-222-199-61.hsd1.ca.comcast.net.
 [73.222.199.61])
 by smtp.gmail.com with ESMTPSA id gi15sm843356pjb.37.2021.01.12.22.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 22:07:37 -0800 (PST)
Date: Tue, 12 Jan 2021 22:07:35 -0800
From: Hill Ma <maahiuzeon@gmail.com>
To: r.bolshakov@yadro.com, richard.henderson@linaro.org, dirty@apple.com
Subject: [PATCH v3] hvf: guard xgetbv call.
Message-ID: <X/6OJ7qk0W6bHkHQ@Hills-Mac-Pro.local>
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
v3: addressed feedback.
v2: xgetbv() modified based on feedback.

 target/i386/hvf/x86_cpuid.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
index a6842912f5..32b0d131df 100644
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
@@ -100,12 +107,15 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
         break;
     case 0xD:
         if (idx == 0) {
-            uint64_t host_xcr0 = xgetbv(0);
-            uint64_t supp_xcr0 = host_xcr0 & (XSTATE_FP_MASK | XSTATE_SSE_MASK |
-                                  XSTATE_YMM_MASK | XSTATE_BNDREGS_MASK |
-                                  XSTATE_BNDCSR_MASK | XSTATE_OPMASK_MASK |
-                                  XSTATE_ZMM_Hi256_MASK | XSTATE_Hi16_ZMM_MASK);
-            eax &= supp_xcr0;
+            uint64_t host_xcr0;
+            if (xgetbv(ecx, 0, &host_xcr0)) {
+                uint64_t supp_xcr0 = host_xcr0 & (XSTATE_FP_MASK |
+                                  XSTATE_SSE_MASK | XSTATE_YMM_MASK |
+                                  XSTATE_BNDREGS_MASK | XSTATE_BNDCSR_MASK |
+                                  XSTATE_OPMASK_MASK | XSTATE_ZMM_Hi256_MASK |
+                                  XSTATE_Hi16_ZMM_MASK);
+                eax &= supp_xcr0;
+            }
         } else if (idx == 1) {
             hv_vmx_read_capability(HV_VMX_CAP_PROCBASED2, &cap);
             eax &= CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XGETBV1;
-- 
2.20.1 (Apple Git-117)


