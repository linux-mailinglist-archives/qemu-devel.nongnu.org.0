Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64D3698CDA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 07:27:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSXhy-0003JG-CN; Thu, 16 Feb 2023 01:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSXhi-0003Bw-Uc
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:25:16 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pSXhd-0006zr-O6
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:25:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=S+AEz0s2ufZRQK/Pht+lDH+Dy5F/QUu3465qowQUubw=; b=LlMfXtFqTswZroC82e+1VsFnPA
 tVctznLN5rnAqgqOzeLavQY9+j6nOifyYQatn3nAs8wvvyK45nBsCAjRAPWb98El1VVZ3XTONIX7x
 jnRNre4/vvg3kIc+FnUrPrwB/gEe77PCwyQm3V7j25YDHKDa48KUP77R7VyuW8+DbsFi9FzK78oHY
 NfcVB8qcMuyaAfUQ6ti93msdj5X3etGvzVry0qYkbzbdrJnGmU+quUUFIIVhVscVtau2VF2LcaMAp
 G3oN1orzFEajwxrzs52/QM0iGQmcGrNMrp753FvFxExtohLgZBfvSYnjZLSm6kXqSs4Vaw++ynPPL
 8xs1A2KA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pSXgb-00AAzC-0P; Thu, 16 Feb 2023 06:24:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pSXhH-008w7D-0x; Thu, 16 Feb 2023 06:24:47 +0000
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
Subject: [PATCH v11 20/59] i386/xen: implement HYPERVISOR_vcpu_op
Date: Thu, 16 Feb 2023 06:24:05 +0000
Message-Id: <20230216062444.2129371-21-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230216062444.2129371-1-dwmw2@infradead.org>
References: <20230216062444.2129371-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+96e41a9b2a2966255e0b+7116+infradead.org+dwmw2@desiato.srs.infradead.org;
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
index 4002b1b797..e5ae0a9a38 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -27,6 +27,7 @@
 #include "hw/xen/interface/sched.h"
 #include "hw/xen/interface/memory.h"
 #include "hw/xen/interface/hvm/hvm_op.h"
+#include "hw/xen/interface/vcpu.h"
 
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


