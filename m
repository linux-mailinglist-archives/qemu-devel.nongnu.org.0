Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1BF642EEB
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:34:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2FL6-0008Dq-U4; Mon, 05 Dec 2022 12:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FKT-0007x6-W8
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:34 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FK6-0007QR-OQ
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=t064sWCmPUZXmo6ZkmmkCyQGKm+KF/mmsLLFsp5yinI=; b=YjeMJGGNtCMQYjjNloyLiLzgWT
 DGjK3D4jb9qvytrZB7tpE5WRSGx/jTl4QYIjxxHaQHiiFFdrDLOB4chaa9HIJwxHZUg+Hpj9fYzb1
 9VyjMaY7vx93nf01iQ3QytvggSfbcwnZ0dbnNHTAPZe7NNA2eaHZyA1SuujF8nveIanC+1tLCZ3UV
 4XEESbV9SsdxJ5e47ixc/+bw+K/H+y9vmqBcOs2rI774YIMsI6keg5Ljfk3lnh0Dp6mkEvZpTd9rA
 DGcWQuyNfq1TnZAUe3VQk1Jl912IETMA9iwTABiW92yxTS8ngGOfpEiBvHvLxIIrwGSsltrun5zbn
 HPdR+Ocw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2FJp-007fzW-4j; Mon, 05 Dec 2022 17:31:53 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p2FJo-002YKz-SE; Mon, 05 Dec 2022 17:31:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
Subject: [RFC PATCH 21/21] i386/xen: implement HYPERVISOR_sched_op
Date: Mon,  5 Dec 2022 17:31:37 +0000
Message-Id: <20221205173137.607044-22-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221205173137.607044-1-dwmw2@infradead.org>
References: <20221205173137.607044-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org;
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
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/xen.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/target/i386/xen.c b/target/i386/xen.c
index f3cc240bff..9606f5978a 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -15,6 +15,7 @@
 #include "xen.h"
 #include "trace.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/runstate.h"
 
 #define __XEN_INTERFACE_VERSION__ 0x00040400
 
@@ -23,6 +24,7 @@
 #include "standard-headers/xen/hvm/hvm_op.h"
 #include "standard-headers/xen/hvm/params.h"
 #include "standard-headers/xen/vcpu.h"
+#include "standard-headers/xen/sched.h"
 #include "standard-headers/xen/event_channel.h"
 
 #define PAGE_OFFSET    0xffffffff80000000UL
@@ -476,6 +478,44 @@ static int kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit,
     return err ? HCALL_ERR : 0;
 }
 
+static int schedop_shutdown(CPUState *cs, uint64_t arg)
+{
+    struct sched_shutdown *shutdown;
+
+    shutdown = gva_to_hva(cs, arg);
+    if (!shutdown) {
+        return -EFAULT;
+    }
+
+    if (shutdown->reason == SHUTDOWN_crash) {
+        cpu_dump_state(cs, stderr, CPU_DUMP_CODE);
+        qemu_system_guest_panicked(NULL);
+    } else if (shutdown->reason == SHUTDOWN_reboot) {
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+    } else if (shutdown->reason == SHUTDOWN_poweroff) {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
+
+    return 0;
+}
+
+static int kvm_xen_hcall_sched_op(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                  int cmd, uint64_t arg)
+{
+    CPUState *cs = CPU(cpu);
+    int err = -ENOSYS;
+
+    switch (cmd) {
+    case SCHEDOP_shutdown: {
+          err = schedop_shutdown(cs, arg);
+          break;
+       }
+    }
+
+    exit->u.hcall.result = err;
+    return err;
+}
+
 static int __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
 {
     uint16_t code = exit->u.hcall.input;
@@ -489,6 +529,10 @@ static int __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     case HVMOP_set_evtchn_upcall_vector:
         return kvm_xen_hcall_evtchn_upcall_vector(exit, cpu,
                                                   exit->u.hcall.params[0]);
+    case __HYPERVISOR_sched_op_compat:
+    case __HYPERVISOR_sched_op:
+        return kvm_xen_hcall_sched_op(exit, cpu, exit->u.hcall.params[0],
+                                      exit->u.hcall.params[1]);
     case __HYPERVISOR_event_channel_op_compat:
         return kvm_xen_hcall_evtchn_op_compat(exit, cpu,
                                               exit->u.hcall.params[0]);
-- 
2.35.3


