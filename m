Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC10362643
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 19:03:15 +0200 (CEST)
Received: from localhost ([::1]:35622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXRsA-000459-88
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 13:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lXRLG-0004Mn-Pz
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:29:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:44702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lXRL6-0001Ux-19
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:29:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B05F5B2F4;
 Fri, 16 Apr 2021 16:28:43 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v14 38/80] target/arm: rename handle_semihosting to
 tcg_handle_semihosting
Date: Fri, 16 Apr 2021 18:27:42 +0200
Message-Id: <20210416162824.25131-39-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210416162824.25131-1-cfontana@suse.de>
References: <20210416162824.25131-1-cfontana@suse.de>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

make it clearer from the name that this is a tcg-only function.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/tcg/tcg-cpu.h        | 2 +-
 target/arm/cpu-sysemu.c         | 2 +-
 target/arm/tcg/sysemu/tcg-cpu.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/tcg-cpu.h b/target/arm/tcg/tcg-cpu.h
index 0ee8ba073b..7e62f92d16 100644
--- a/target/arm/tcg/tcg-cpu.h
+++ b/target/arm/tcg/tcg-cpu.h
@@ -24,7 +24,7 @@
 
 #ifndef CONFIG_USER_ONLY
 /* Do semihosting call and set the appropriate return value. */
-void handle_semihosting(CPUState *cs);
+void tcg_handle_semihosting(CPUState *cs);
 
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 0e872b2e55..7569241339 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -1153,7 +1153,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
      * must be handled here.
      */
     if (cs->exception_index == EXCP_SEMIHOST) {
-        handle_semihosting(cs);
+        tcg_handle_semihosting(cs);
         return;
     }
 #endif /* CONFIG_TCG */
diff --git a/target/arm/tcg/sysemu/tcg-cpu.c b/target/arm/tcg/sysemu/tcg-cpu.c
index af9d3905d7..2c395f47e7 100644
--- a/target/arm/tcg/sysemu/tcg-cpu.c
+++ b/target/arm/tcg/sysemu/tcg-cpu.c
@@ -52,7 +52,7 @@
  * We only see semihosting exceptions in TCG only as they are not
  * trapped to the hypervisor in KVM.
  */
-void handle_semihosting(CPUState *cs)
+void tcg_handle_semihosting(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-- 
2.26.2


