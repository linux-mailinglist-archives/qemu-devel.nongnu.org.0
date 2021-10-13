Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8472342C20C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 16:04:10 +0200 (CEST)
Received: from localhost ([::1]:53180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maerZ-0005L7-1H
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 10:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nia@netbsd.org>) id 1maei7-0004wD-BW
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 09:54:24 -0400
Received: from mail.netbsd.org ([199.233.217.200]:60798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nia@netbsd.org>) id 1maei5-0005oz-4S
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 09:54:22 -0400
Received: by mail.netbsd.org (Postfix, from userid 1524)
 id C44C084E8D; Wed, 13 Oct 2021 13:54:17 +0000 (UTC)
Date: Wed, 13 Oct 2021 13:54:17 +0000
From: nia <nia@NetBSD.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] nvmm: Fix support for stable version
Message-ID: <YWblCe2J8GwCaV9U@homeworld.netbsd.org>
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
Cc: kamil@netbsd.org, reinoud@netbsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NVMM user version 1 is the version being shipped with netbsd-9,
which is the most recent stable branch of NetBSD. This makes it
possible to use the NVMM accelerator on the most recent NetBSD
release, 9.2, which lacks nvmm_cpu_stop.

(CC'ing maintainers)

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

