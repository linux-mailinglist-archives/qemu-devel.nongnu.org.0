Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338CD33F8B4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 20:04:58 +0100 (CET)
Received: from localhost ([::1]:52976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMbTU-0005oA-P7
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 15:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMax6-0004So-6o
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:31:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:48674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMawn-0007rJ-Ny
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 14:31:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32A6BAEC2;
 Wed, 17 Mar 2021 18:30:34 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v9 40/50] accel: add double dispatch mechanism for class
 initialization
Date: Wed, 17 Mar 2021 19:30:03 +0100
Message-Id: <20210317183013.25772-41-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210317183013.25772-1-cfontana@suse.de>
References: <20210317183013.25772-1-cfontana@suse.de>
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

while on x86 all CPU classes can use the same set of TCGCPUOps,
on ARM the right accel behavior depends on the type of the CPU.

So we need a way to specialize the accel behavior according to
the CPU. Therefore, add a second initialization, after the
accel_cpu->cpu_class_init, that allows to do this.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 include/hw/core/cpu.h     |  6 ++++++
 accel/accel-common.c      | 12 ++++++++++++
 target/i386/tcg/tcg-cpu.c |  8 +++++++-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c68bc3ba8a..d45f78290e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -192,6 +192,12 @@ struct CPUClass {
 
     /* when TCG is not available, this pointer is NULL */
     struct TCGCPUOps *tcg_ops;
+
+    /*
+     * if not NULL, this is called in order for the CPUClass to initialize
+     * class data that depends on the accelerator, see accel/accel-common.c.
+     */
+    void (*init_accel_cpu)(struct AccelCPUClass *accel_cpu, CPUClass *cc);
 };
 
 /*
diff --git a/accel/accel-common.c b/accel/accel-common.c
index d77c09d7b5..2103397d5e 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -54,10 +54,22 @@ static void accel_init_cpu_int_aux(ObjectClass *klass, void *opaque)
     CPUClass *cc = CPU_CLASS(klass);
     AccelCPUClass *accel_cpu = opaque;
 
+    /*
+     * double dispatch. The first callback allows the accel cpu
+     * to run initializations for the CPU,
+     * the second one allows the CPU to customize the accel cpu
+     * behavior according to the CPU.
+     *
+     * The second is currently only used by TCG, to specialize the
+     * TCGCPUOps depending on the CPU type.
+     */
     cc->accel_cpu = accel_cpu;
     if (accel_cpu->cpu_class_init) {
         accel_cpu->cpu_class_init(cc);
     }
+    if (cc->init_accel_cpu) {
+        cc->init_accel_cpu(accel_cpu, cc);
+    }
 }
 
 /* initialize the arch-specific accel CpuClass interfaces */
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index e311f52855..ba39531aa5 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -69,11 +69,17 @@ static struct TCGCPUOps x86_tcg_ops = {
 #endif /* !CONFIG_USER_ONLY */
 };
 
-static void tcg_cpu_class_init(CPUClass *cc)
+static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
 {
+    /* for x86, all cpus use the same set of operations */
     cc->tcg_ops = &x86_tcg_ops;
 }
 
+static void tcg_cpu_class_init(CPUClass *cc)
+{
+    cc->init_accel_cpu = tcg_cpu_init_ops;
+}
+
 /*
  * TCG-specific defaults that override all CPU models when using TCG
  */
-- 
2.26.2


