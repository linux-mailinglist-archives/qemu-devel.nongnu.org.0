Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD27C64E573
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 01:54:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5yoy-0006mE-W3; Thu, 15 Dec 2022 19:43:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5ynG-0005Fd-P3
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:45 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5ynB-0006cs-VS
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=7UcMPqOUFVHrvjG6b85D3YQtF72RKPxFv/Mlkkh4KII=; b=qN4QyPmVQ8Fg0DwqGhvpGW2XZW
 76P/aTt840bGLqOfAK60oHBpLkgnqtQkEhnmiP8oiVXgWOZE67IylTVwNpIBzZVeDGD8l50sGx6mf
 rQa2LMgtrNH06w7JQRLx0X97kNCkKWMXjN8Sf9iCCfeM5P1flYUOIna3Ug+JnTc9GM4gabGTgCMSM
 789Y9T0kW/Eqx7EHT0wdUOgk+CnO50uK4nlbXXdKxzZjBPjLvl2+ocS7UPW3OYHtv1MMEHjTYlzJ1
 48D9JtkwnW3r0oXGEIsCRbnzgMhLuBLaGhtoKN/36/Zu6aJf/iNIs1s6U0lH+cQcO+9ZEooVjpw5p
 Hitr5HHQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p5ymx-00Azyv-9o; Fri, 16 Dec 2022 00:41:27 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p5ymw-003cPF-8c; Fri, 16 Dec 2022 00:41:22 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Subject: [RFC PATCH v3 24/38] i386/xen: implement HYPERVISOR_sched_op
Date: Fri, 16 Dec 2022 00:41:03 +0000
Message-Id: <20221216004117.862106-25-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216004117.862106-1-dwmw2@infradead.org>
References: <20221216004117.862106-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Joao Martins <joao.m.martins@oracle.com>

It allows to shutdown itself via hypercall with any of the 3 reasons:
  1) self-reboot
  2) shutdown
  3) crash

Implementing SCHEDOP_shutdown sub op let us handle crashes gracefully rather
than leading to triple faults if it remains unimplemented.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Ditch sched_op_compat which was never available for HVM guests]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/kvm/xen-emu.c | 58 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index d6f3102d8e..1ff6d32edd 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -21,12 +21,14 @@
 #include "trace.h"
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
+#include "sysemu/runstate.h"
 
 #include "standard-headers/xen/version.h"
 #include "standard-headers/xen/memory.h"
 #include "standard-headers/xen/hvm/hvm_op.h"
 #include "standard-headers/xen/hvm/params.h"
 #include "standard-headers/xen/vcpu.h"
+#include "standard-headers/xen/sched.h"
 #include "standard-headers/xen/event_channel.h"
 
 #include "xen-compat.h"
@@ -629,6 +631,59 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit,
     return true;
 }
 
+static int schedop_shutdown(CPUState *cs, uint64_t arg)
+{
+    struct sched_shutdown shutdown;
+    int ret = 0;
+
+    /* No need for 32/64 compat handling */
+    qemu_build_assert(sizeof(shutdown) == 4);
+
+    if (kvm_copy_from_gva(cs, arg, &shutdown, sizeof(shutdown))) {
+        return -EFAULT;
+    }
+
+    switch(shutdown.reason) {
+    case SHUTDOWN_crash:
+        cpu_dump_state(cs, stderr, CPU_DUMP_CODE);
+        qemu_system_guest_panicked(NULL);
+        break;
+
+    case SHUTDOWN_reboot:
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+        break;
+
+    case SHUTDOWN_poweroff:
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        break;
+
+    default:
+            ret = -EINVAL;
+            break;
+    }
+
+    return ret;
+}
+
+static bool kvm_xen_hcall_sched_op(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                   int cmd, uint64_t arg)
+{
+    CPUState *cs = CPU(cpu);
+    int err = -ENOSYS;
+
+    switch (cmd) {
+    case SCHEDOP_shutdown:
+        err = schedop_shutdown(cs, arg);
+        break;
+
+    default:
+        return false;
+    }
+
+    exit->u.hcall.result = err;
+    return true;
+}
+
 static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
 {
     uint16_t code = exit->u.hcall.input;
@@ -639,6 +694,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     }
 
     switch (code) {
+    case __HYPERVISOR_sched_op:
+        return kvm_xen_hcall_sched_op(exit, cpu, exit->u.hcall.params[0],
+                                      exit->u.hcall.params[1]);
     case __HYPERVISOR_event_channel_op:
         return kvm_xen_hcall_evtchn_op(exit, exit->u.hcall.params[0],
                                        exit->u.hcall.params[1]);
-- 
2.35.3


