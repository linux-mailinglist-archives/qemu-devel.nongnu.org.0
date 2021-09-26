Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FED418752
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 10:17:45 +0200 (CEST)
Received: from localhost ([::1]:34262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUPLz-0001ib-T4
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 04:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nia@netbsd.org>) id 1mUOac-0005Ab-So
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 03:28:46 -0400
Received: from mail.netbsd.org ([199.233.217.200]:56686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nia@netbsd.org>) id 1mUOab-0005KX-1t
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 03:28:46 -0400
Received: by mail.netbsd.org (Postfix, from userid 1524)
 id 467B484EA4; Sun, 26 Sep 2021 07:28:42 +0000 (UTC)
Date: Sun, 26 Sep 2021 07:28:42 +0000
From: nia <nia@NetBSD.org>
To: qemu-devel@nongnu.org
Subject: nvmm: Fix support for stable version (NVMM_USER_VERSION 1)
Message-ID: <YVAhKiVG2VzcmK2c@homeworld.netbsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=199.233.217.200; envelope-from=nia@netbsd.org;
 helo=mail.netbsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 26 Sep 2021 04:11:49 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NVMM user version 1 is the version being shipped with netbsd-9,
which is the most recent stable branch of NetBSD. This makes it
possible to use the NVMM accelerator on the most recent NetBSD
release, 9.2, which lacks nvmm_cpu_stop.

Signed-off-by: Nia Alarie <nia@NetBSD.org>
---
 meson.build                 |  4 +---
 target/i386/nvmm/nvmm-all.c | 10 ++++++++++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 15ef4d3c41..6e4d9b919a 100644
--- a/meson.build
+++ b/meson.build
@@ -244,9 +244,7 @@ if not get_option('hax').disabled()
   endif
 endif
 if targetos == 'netbsd'
-  if cc.has_header_symbol('nvmm.h', 'nvmm_cpu_stop', required: get_option('nvmm'))
-    nvmm = cc.find_library('nvmm', required: get_option('nvmm'))
-  endif
+  nvmm = cc.find_library('nvmm', required: get_option('nvmm'))
   if nvmm.found()
     accelerators += 'CONFIG_NVMM'
   endif
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index a488b00e90..4a10412427 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -750,7 +750,11 @@ nvmm_vcpu_loop(CPUState *cpu)
         nvmm_vcpu_pre_run(cpu);
 
         if (qatomic_read(&cpu->exit_request)) {
+#if NVMM_USER_VERSION >= 2
             nvmm_vcpu_stop(vcpu);
+#else
+            qemu_cpu_kick_self();
+#endif
         }
 
         /* Read exit_request before the kernel reads the immediate exit flag */
@@ -767,6 +771,7 @@ nvmm_vcpu_loop(CPUState *cpu)
         switch (exit->reason) {
         case NVMM_VCPU_EXIT_NONE:
             break;
+#if NVMM_USER_VERSION >= 2
         case NVMM_VCPU_EXIT_STOPPED:
             /*
              * The kernel cleared the immediate exit flag; cpu->exit_request
@@ -775,6 +780,7 @@ nvmm_vcpu_loop(CPUState *cpu)
             smp_wmb();
             qcpu->stop = true;
             break;
+#endif
         case NVMM_VCPU_EXIT_MEMORY:
             ret = nvmm_handle_mem(mach, vcpu);
             break;
@@ -888,8 +894,12 @@ nvmm_ipi_signal(int sigcpu)
 {
     if (current_cpu) {
         struct qemu_vcpu *qcpu = get_qemu_vcpu(current_cpu);
+#if NVMM_USER_VERSION >= 2
         struct nvmm_vcpu *vcpu = &qcpu->vcpu;
         nvmm_vcpu_stop(vcpu);
+#else
+        qcpu->stop = true;
+#endif
     }
 }
 
-- 
2.33.0


