Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1729E64809C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 11:05:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3a8S-0002h2-Vz; Fri, 09 Dec 2022 04:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7S-0002St-UF
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:41 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7Q-0006qj-Iq
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=lCMhWDrjALhQhUGBf4LP4I2MF0kkx02KxczMj0wX1UM=; b=YDldmiJ3AgnltpmHi/aTnJHVaG
 5zTGjgXuZmt5VIIm4yaotqUd9h5EuTskD8DynUrs4JaxgQqbz7iGlHQeMMcKDIvheBbjmb54ls/yq
 tVnL647gvfasOHIrZrWXFUVCh7rQ0PC7NNnLZ8hXRr+dOif9fj/H3ABZmS6TajRKUDGnvzUlYEMg/
 x9v3PY7GcuIbpw0JgOwKxYnouSA92eN5XfSyhWzhQWXrArNZA/9KBBr5utIPD8JRsJlWzcTt9jtWH
 OtGPQAXDTPcx49h7tSsfgmAg4ga35pR/goqKT8EvERdEZ9ztrpA4cZXBHYiy2vAaruu62NumLsCep
 HkTblz6w==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p3a7G-007tic-MW; Fri, 09 Dec 2022 09:56:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p3a78-002tZh-9v; Fri, 09 Dec 2022 09:56:18 +0000
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
Subject: [RFC PATCH v2 21/22] i386/xen: implement HYPERVISOR_event_channel_op
Date: Fri,  9 Dec 2022 09:56:11 +0000
Message-Id: <20221209095612.689243-22-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221209095612.689243-1-dwmw2@infradead.org>
References: <20221209095612.689243-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
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

Additionally set XEN_INTERFACE_VERSION to most recent in order to
exercise both event_channel_op and event_channel_op_compat.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/xen.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/target/i386/xen.c b/target/i386/xen.c
index 1af336d9e5..f102c40f04 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -18,11 +18,14 @@
 #include "hw/i386/kvm/xen_overlay.h"
 #include "hw/i386/kvm/xen_evtchn.h"
 
+#define __XEN_INTERFACE_VERSION__ 0x00040400
+
 #include "standard-headers/xen/version.h"
 #include "standard-headers/xen/memory.h"
 #include "standard-headers/xen/hvm/hvm_op.h"
 #include "standard-headers/xen/hvm/params.h"
 #include "standard-headers/xen/vcpu.h"
+#include "standard-headers/xen/event_channel.h"
 
 static bool kvm_gva_to_gpa(CPUState *cs, uint64_t gva, uint64_t *gpa,
                            size_t *len, bool is_write)
@@ -452,6 +455,42 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static bool kvm_xen_hcall_evtchn_op_compat(struct kvm_xen_exit *exit,
+                                          X86CPU *cpu, uint64_t arg)
+{
+    struct evtchn_op op;
+    int err = -EFAULT;
+
+    if (kvm_copy_from_gva(CPU(cpu), arg, &op, sizeof(op))) {
+        goto err;
+    }
+
+    switch (op.cmd) {
+    default:
+        return false;
+    }
+err:
+    exit->u.hcall.result = err;
+    return true;
+}
+
+static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit,
+                                    int cmd, uint64_t arg)
+{
+    int err = -ENOSYS;
+
+    switch (cmd) {
+    case EVTCHNOP_init_control:
+        err = -ENOSYS;
+        break;
+    default:
+        return false;
+    }
+
+    exit->u.hcall.result = err;
+    return true;
+}
+
 static bool __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
 {
     uint16_t code = exit->u.hcall.input;
@@ -462,6 +501,12 @@ static bool __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     }
 
     switch (code) {
+    case __HYPERVISOR_event_channel_op_compat:
+        return kvm_xen_hcall_evtchn_op_compat(exit, cpu,
+                                              exit->u.hcall.params[0]);
+    case __HYPERVISOR_event_channel_op:
+        return kvm_xen_hcall_evtchn_op(exit, exit->u.hcall.params[0],
+                                       exit->u.hcall.params[1]);
     case __HYPERVISOR_vcpu_op:
         return kvm_xen_hcall_vcpu_op(exit, cpu,
                                      exit->u.hcall.params[0],
-- 
2.35.3


