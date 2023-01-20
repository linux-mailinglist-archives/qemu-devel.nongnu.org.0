Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9868967557C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:18:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrFe-00022Z-SN; Fri, 20 Jan 2023 08:16:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+11ac54132413ad4eaace+7089+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pIrDv-0006sO-Te
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:14:27 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+11ac54132413ad4eaace+7089+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pIrDq-0000lk-B5
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:14:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=bXrAzykyGCxnmGCCCDOw0SLfATXtVMPMK9ALwqv52vQ=; b=dCLOQyxRd8jfDW/CNRvspTKgxn
 qS4piJvWR8Tn6AjEbyVtIsc8s2o2/Ee59u14nJ96hzDVQyxQ8R6RtJlmMmXRNrBx0NbslvmqUAoGR
 +VHFTVJ3x3FUA6uCdDVBO12bRaGf3b3lfaRSI8cLiFvvApl9CaYF36P+4bT3wkfOml2jme30jy7pE
 DOaN6uVA+qzlbA/0l1Up4M/a7LSCyEimr1UrTLdnPo711CYs4W1CE2wDsLd12m6dubRWUISeT0Uxz
 bJUNgVL5W3nsV7Aee6G4XIyHhIniPFL8W6jH+d2beunLQZVFH9PaCKPndcipkeCggHedCeHFHPqlE
 Z3WG08gg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pIrCq-000det-0m; Fri, 20 Jan 2023 13:13:24 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pIrDI-0063Dr-1N; Fri, 20 Jan 2023 13:13:48 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v8 19/58] i386/xen: implement HYPERVISOR_vcpu_op
Date: Fri, 20 Jan 2023 13:13:04 +0000
Message-Id: <20230120131343.1441939-20-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120131343.1441939-1-dwmw2@infradead.org>
References: <20230120131343.1441939-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+11ac54132413ad4eaace+7089+infradead.org+dwmw2@desiato.srs.infradead.org;
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

This is simply when guest tries to register a vcpu_info
and since vcpu_info placement is optional in the minimum ABI
therefore we can just fail with -ENOSYS

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 0b056eb450..e940901f80 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -27,6 +27,7 @@
 #include "standard-headers/xen/sched.h"
 #include "standard-headers/xen/memory.h"
 #include "standard-headers/xen/hvm/hvm_op.h"
+#include "standard-headers/xen/vcpu.h"
 
 #include "xen-compat.h"
 
@@ -363,6 +364,25 @@ static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     }
 }
 
+static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                  int cmd, int vcpu_id, uint64_t arg)
+{
+    int err;
+
+    switch (cmd) {
+    case VCPUOP_register_vcpu_info:
+        /* no vcpu info placement for now */
+        err = -ENOSYS;
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
 int kvm_xen_soft_reset(void)
 {
     int err;
@@ -464,6 +484,11 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     case __HYPERVISOR_sched_op:
         return kvm_xen_hcall_sched_op(exit, cpu, exit->u.hcall.params[0],
                                       exit->u.hcall.params[1]);
+    case __HYPERVISOR_vcpu_op:
+        return kvm_xen_hcall_vcpu_op(exit, cpu,
+                                     exit->u.hcall.params[0],
+                                     exit->u.hcall.params[1],
+                                     exit->u.hcall.params[2]);
     case __HYPERVISOR_hvm_op:
         return kvm_xen_hcall_hvm_op(exit, cpu, exit->u.hcall.params[0],
                                     exit->u.hcall.params[1]);
-- 
2.39.0


