Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6752D0BE3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 09:41:53 +0100 (CET)
Received: from localhost ([::1]:39492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmC5g-0004B2-MU
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 03:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmC4q-0003lS-25
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 03:41:00 -0500
Received: from mx2.suse.de ([195.135.220.15]:40722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmC4o-00029G-Ef
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 03:40:59 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D56F4ACBA;
 Mon,  7 Dec 2020 08:40:56 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>
Subject: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
Date: Mon,  7 Dec 2020 09:40:42 +0100
Message-Id: <20201207084042.7690-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cc->do_interrupt is a TCG callback used in accel/tcg only,
call instead directly the arm_cpu_do_interrupt for the
injection of exeptions from KVM, so that

do_interrupt can be exported to TCG-only operations in the CPUClass.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/helper.c | 4 ++++
 target/arm/kvm64.c  | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 38cd35c049..bebaabf525 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9895,6 +9895,10 @@ static void handle_semihosting(CPUState *cs)
  * Do any appropriate logging, handle PSCI calls, and then hand off
  * to the AArch64-entry or AArch32-entry function depending on the
  * target exception level's register width.
+ *
+ * Note: this is used for both TCG (as the do_interrupt tcg op),
+ *       and KVM to re-inject guest debug exceptions, and to
+ *       inject a Synchronous-External-Abort.
  */
 void arm_cpu_do_interrupt(CPUState *cs)
 {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index f74bac2457..2b17e4203d 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -960,7 +960,7 @@ static void kvm_inject_arm_sea(CPUState *c)
 
     env->exception.syndrome = esr;
 
-    cc->do_interrupt(c);
+    arm_cpu_do_interrupt(c);
 }
 
 #define AARCH64_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
@@ -1545,7 +1545,7 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
     env->exception.vaddress = debug_exit->far;
     env->exception.target_el = 1;
     qemu_mutex_lock_iothread();
-    cc->do_interrupt(cs);
+    arm_cpu_do_interrupt(cs);
     qemu_mutex_unlock_iothread();
 
     return false;
-- 
2.26.2


