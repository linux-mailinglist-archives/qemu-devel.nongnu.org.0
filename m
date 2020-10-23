Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FFF296A5C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 09:36:29 +0200 (CEST)
Received: from localhost ([::1]:50446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVrci-0002K0-OZ
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 03:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kVrb9-0000cO-G3
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:34:51 -0400
Received: from mail.ispras.ru ([83.149.199.84]:38448)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kVrb7-0003iV-1W
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:34:50 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id A3F2240A1DDC;
 Fri, 23 Oct 2020 07:34:41 +0000 (UTC)
Subject: [PATCH] cpus: verify that number of created cpus do not exceed smp
 params
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Fri, 23 Oct 2020 10:34:41 +0300
Message-ID: <160343848141.8350.10469322440262034340.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 03:34:42
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, pavel.dovgalyuk@ispras.ru, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Machine definitions may miss some vCPU-related parameters.
E.g., xlnx-versal-virt missed min_cpus and it was set to 1 by default.
This allowed using -smp 1 command line argument. But the machine
still created 2 vCPUs and passed all checks.
This patch adds one more check that does not allow creating
extra cpus that exceed the values specified in machine/smp.

Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
---
 0 files changed

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 47cceddd80..da74794e09 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -603,6 +603,11 @@ void qemu_init_vcpu(CPUState *cpu)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
 
+    if (cpu->cpu_index >= ms->smp.cpus) {
+        fprintf(stderr, "Machine definition error: trying to create too many CPUs\n");
+        exit(1);
+    }
+
     cpu->nr_cores = ms->smp.cores;
     cpu->nr_threads =  ms->smp.threads;
     cpu->stopped = true;


