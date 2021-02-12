Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED63F319F0F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 13:48:06 +0100 (CET)
Received: from localhost ([::1]:40264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAXri-0003OD-1v
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 07:48:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lAXgV-00016Z-Sk
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 07:36:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:48424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lAXgS-0006Ig-J3
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 07:36:31 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BCCC4B95C;
 Fri, 12 Feb 2021 12:36:26 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC v18 04/15] target/i386: fix host_cpu_adjust_phys_bits error
 handling
Date: Fri, 12 Feb 2021 13:36:11 +0100
Message-Id: <20210212123622.15834-5-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210212123622.15834-1-cfontana@suse.de>
References: <20210212123622.15834-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

move the check for phys_bits outside of host_cpu_adjust_phys_bits,
because otherwise it is impossible to return an error condition
explicitly.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/host-cpu.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/i386/host-cpu.c b/target/i386/host-cpu.c
index 9cfe56ce41..d07d41c34c 100644
--- a/target/i386/host-cpu.c
+++ b/target/i386/host-cpu.c
@@ -50,7 +50,7 @@ static void host_cpu_enable_cpu_pm(X86CPU *cpu)
     env->features[FEAT_1_ECX] |= CPUID_EXT_MONITOR;
 }
 
-static uint32_t host_cpu_adjust_phys_bits(X86CPU *cpu, Error **errp)
+static uint32_t host_cpu_adjust_phys_bits(X86CPU *cpu)
 {
     uint32_t host_phys_bits = host_cpu_phys_bits();
     uint32_t phys_bits = cpu->phys_bits;
@@ -77,14 +77,6 @@ static uint32_t host_cpu_adjust_phys_bits(X86CPU *cpu, Error **errp)
         }
     }
 
-    if (phys_bits &&
-        (phys_bits > TARGET_PHYS_ADDR_SPACE_BITS ||
-         phys_bits < 32)) {
-        error_setg(errp, "phys-bits should be between 32 and %u "
-                   " (but is %u)",
-                   TARGET_PHYS_ADDR_SPACE_BITS, phys_bits);
-    }
-
     return phys_bits;
 }
 
@@ -97,7 +89,17 @@ void host_cpu_realizefn(CPUState *cs, Error **errp)
         host_cpu_enable_cpu_pm(cpu);
     }
     if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM) {
-        cpu->phys_bits = host_cpu_adjust_phys_bits(cpu, errp);
+        uint32_t phys_bits = host_cpu_adjust_phys_bits(cpu);
+
+        if (phys_bits &&
+            (phys_bits > TARGET_PHYS_ADDR_SPACE_BITS ||
+             phys_bits < 32)) {
+            error_setg(errp, "phys-bits should be between 32 and %u "
+                       " (but is %u)",
+                       TARGET_PHYS_ADDR_SPACE_BITS, phys_bits);
+            return;
+        }
+        cpu->phys_bits = phys_bits;
     }
 }
 
-- 
2.26.2


