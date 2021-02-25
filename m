Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DDB324ED2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:10:08 +0100 (CET)
Received: from localhost ([::1]:55302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFEX1-0004uJ-CR
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:10:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lFEDl-0002c8-DR
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:50:14 -0500
Received: from mx2.suse.de ([195.135.220.15]:40966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lFEDe-0003Pv-RA
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:50:13 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49F37AD57;
 Thu, 25 Feb 2021 10:49:54 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v23 17/17] i386: make cpu_load_efer sysemu-only
Date: Thu, 25 Feb 2021 11:49:41 +0100
Message-Id: <20210225104941.15688-18-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210225104941.15688-1-cfontana@suse.de>
References: <20210225104941.15688-1-cfontana@suse.de>
MIME-Version: 1.0
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

cpu_load_efer is now used only for sysemu code.

Therefore, move this function implementation to
sysemu-only section of helper.c

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/i386/cpu.h    | 20 +++++---------------
 target/i386/helper.c | 13 +++++++++++++
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 3797789dc2..a1268abe9f 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1957,6 +1957,11 @@ static inline AddressSpace *cpu_addressspace(CPUState *cs, MemTxAttrs attrs)
     return cpu_get_address_space(cs, cpu_asidx_from_attrs(cs, attrs));
 }
 
+/*
+ * load efer and update the corresponding hflags. XXX: do consistency
+ * checks with cpuid bits?
+ */
+void cpu_load_efer(CPUX86State *env, uint64_t val);
 uint8_t x86_ldub_phys(CPUState *cs, hwaddr addr);
 uint32_t x86_lduw_phys(CPUState *cs, hwaddr addr);
 uint32_t x86_ldl_phys(CPUState *cs, hwaddr addr);
@@ -2053,21 +2058,6 @@ static inline uint32_t cpu_compute_eflags(CPUX86State *env)
     return eflags;
 }
 
-
-/* load efer and update the corresponding hflags. XXX: do consistency
-   checks with cpuid bits? */
-static inline void cpu_load_efer(CPUX86State *env, uint64_t val)
-{
-    env->efer = val;
-    env->hflags &= ~(HF_LMA_MASK | HF_SVME_MASK);
-    if (env->efer & MSR_EFER_LMA) {
-        env->hflags |= HF_LMA_MASK;
-    }
-    if (env->efer & MSR_EFER_SVME) {
-        env->hflags |= HF_SVME_MASK;
-    }
-}
-
 static inline MemTxAttrs cpu_get_mem_attrs(CPUX86State *env)
 {
     return ((MemTxAttrs) { .secure = (env->hflags & HF_SMM_MASK) != 0 });
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 618ad1c409..7304721a94 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -574,6 +574,19 @@ void do_cpu_sipi(X86CPU *cpu)
 #endif
 
 #ifndef CONFIG_USER_ONLY
+
+void cpu_load_efer(CPUX86State *env, uint64_t val)
+{
+    env->efer = val;
+    env->hflags &= ~(HF_LMA_MASK | HF_SVME_MASK);
+    if (env->efer & MSR_EFER_LMA) {
+        env->hflags |= HF_LMA_MASK;
+    }
+    if (env->efer & MSR_EFER_SVME) {
+        env->hflags |= HF_SVME_MASK;
+    }
+}
+
 uint8_t x86_ldub_phys(CPUState *cs, hwaddr addr)
 {
     X86CPU *cpu = X86_CPU(cs);
-- 
2.26.2


