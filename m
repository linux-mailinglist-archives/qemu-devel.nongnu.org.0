Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C7C6480BC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 11:14:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3a8A-0002eC-BD; Fri, 09 Dec 2022 04:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7S-0002Ss-UO
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:41 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7Q-0006qh-Gi
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=lIlMBcPXH64zUVREtRgY4luMAzD6i7RUuD8FuaojD9k=; b=uxcd4XjPooP927bsK7Vw8yf/UE
 IfnuKD5QtCw9LWYQioIHi+FRmb68Rj0sIl41C1osgFsSrQPXrVMrHUxke3SrOqseY4Igy8VfdmIq8
 ktQ6Os2xiIrmnWhKTmNMhpV+4rvC7lT6L/+D6dF/CO9Ei4tGkElVNId5EDS/GK1LwRT/l+ohkPzhm
 gIdGlyEysjUAIN/O/lMEwfMnkCw0otxyM4j0a+tDZJ368ekTyG6+P9cvYofAKJa6oC7/W9dne80oO
 x7XMxUYvvUXmofWPSAqVS86cRsscfMbO6PpAJjhWdfgd7A66827M1eL24GxIWbscmCatXkXJjZODK
 a2Liu0tQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p3a7G-007tiW-HC; Fri, 09 Dec 2022 09:56:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p3a78-002tZ8-4Z; Fri, 09 Dec 2022 09:56:18 +0000
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
Subject: [RFC PATCH v2 15/22] i386/xen: implement HYPERVISOR_vcpu_op
Date: Fri,  9 Dec 2022 09:56:05 +0000
Message-Id: <20221209095612.689243-16-dwmw2@infradead.org>
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

This is simply when guest tries to register a vcpu_info
and since vcpu_info placement is optional in the minimum ABI
therefore we can just fail with -ENOSYS

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/xen.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/i386/xen.c b/target/i386/xen.c
index 2847b4f864..9d1daadee1 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -19,6 +19,7 @@
 #include "standard-headers/xen/version.h"
 #include "standard-headers/xen/memory.h"
 #include "standard-headers/xen/hvm/hvm_op.h"
+#include "standard-headers/xen/vcpu.h"
 
 static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
                       bool is_write)
@@ -194,6 +195,25 @@ static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit,
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
 static bool __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
 {
     uint16_t code = exit->u.hcall.input;
@@ -204,6 +224,11 @@ static bool __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     }
 
     switch (code) {
+    case __HYPERVISOR_vcpu_op:
+        return kvm_xen_hcall_vcpu_op(exit, cpu,
+                                     exit->u.hcall.params[0],
+                                     exit->u.hcall.params[1],
+                                     exit->u.hcall.params[2]);
     case __HYPERVISOR_hvm_op:
         return kvm_xen_hcall_hvm_op(exit, exit->u.hcall.params[0],
                                     exit->u.hcall.params[1]);
-- 
2.35.3


