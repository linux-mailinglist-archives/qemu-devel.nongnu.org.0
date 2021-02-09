Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7256B315146
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:13:01 +0100 (CET)
Received: from localhost ([::1]:38822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9TlE-0004DY-GO
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9TWF-0001ai-Mb
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:57:31 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:56150 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9TWD-0007xo-Qi
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:57:31 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id D98F24127A;
 Tue,  9 Feb 2021 13:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1612879046; x=1614693447; bh=anFPf/M/ctovNuakdYx63q/WsMmTxYn0D96
 kjAcopNU=; b=FJ81VH5jEJpVbYM2o507+0mJe3nQcQvmf3ZWF0XJ3bD5XjtnMi4
 G6dodHQ7KOXsgOsDm0HJggrKkkuHHP7XUnB+yygbT5TFq+1gjVsfvrLjPCXcgchv
 O8+qokVpnQG9GfL5tqvDZG20OgaDIIFAvgU+n65osE+JuV6kLz1j+xtY=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5sT79mCk-BLH; Tue,  9 Feb 2021 16:57:26 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 9328C412DE;
 Tue,  9 Feb 2021 16:57:25 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 9 Feb
 2021 16:57:25 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL hvf 1/5] hvf: Guard xgetbv call
Date: Tue, 9 Feb 2021 16:57:18 +0300
Message-ID: <20210209135722.4891-2-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209135722.4891-1-r.bolshakov@yadro.com>
References: <20210209135722.4891-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Hill Ma <maahiuzeon@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hill Ma <maahiuzeon@gmail.com>

This prevents illegal instruction on cpus that do not support xgetbv.

Buglink: https://bugs.launchpad.net/qemu/+bug/1758819
Reviewed-by: Cameron Esfahani <dirty@apple.com>
Signed-off-by: Hill Ma <maahiuzeon@gmail.com>
Message-Id: <X/6OJ7qk0W6bHkHQ@Hills-Mac-Pro.local>
Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
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
2.30.0


