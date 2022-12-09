Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA2664807D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 10:57:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3a8I-0002eu-R4; Fri, 09 Dec 2022 04:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+70dbbb0d34525a3cd306+7047+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p3a7N-0002SU-15
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:35 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+70dbbb0d34525a3cd306+7047+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p3a7I-0006pP-So
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=GAVY2oYMGh9a7gapK4qpBFJ0kJvbuYtCCVfUGDMCI/M=; b=dycRG1xN/ZskCJWqcAgs6sDcKs
 cLgk9Ca1Wez20z4lspseGj6P+PqcPNwi9yxyYChlvMSKs0rG8qcmVfrc4a90eErclbhU/rsLels5p
 u0+7Ybzm3JH7gxARjBKoU+FQEqQxAFnZSN9c+ejQvWktGh/Ty43hwcOHSzQmROTgFCToYor3JRBMz
 6/OzyJ8BzbFdd3MOI1TCqR59pea6+JArLuQO6mCoG29dwgE+vAGc/nRR/IgUJvskqDHuTOnCh0Vqh
 tK1iw+Re3fE3/v2GMEv/oJA4nb+zV/Q8laoVzAud98n7oD28ZMuwABP0uCSZZkQrMhEJRDeFOp0lE
 HOdn9c+g==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p3a78-008l4M-Hx; Fri, 09 Dec 2022 09:56:20 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p3a78-002tZ4-3k; Fri, 09 Dec 2022 09:56:18 +0000
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
Subject: [RFC PATCH v2 14/22] i386/xen: implement HYPERVISOR_hvm_op
Date: Fri,  9 Dec 2022 09:56:04 +0000
Message-Id: <20221209095612.689243-15-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221209095612.689243-1-dwmw2@infradead.org>
References: <20221209095612.689243-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+70dbbb0d34525a3cd306+7047+infradead.org+dwmw2@desiato.srs.infradead.org;
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

This is when guest queries for support for HVMOP_pagetable_dying.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/xen.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/i386/xen.c b/target/i386/xen.c
index ddd144039a..2847b4f864 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -18,6 +18,7 @@
 #include "hw/i386/kvm/xen_overlay.h"
 #include "standard-headers/xen/version.h"
 #include "standard-headers/xen/memory.h"
+#include "standard-headers/xen/hvm/hvm_op.h"
 
 static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
                       bool is_write)
@@ -180,6 +181,19 @@ static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit,
     return true;
 }
 
+static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit,
+                                 int cmd, uint64_t arg)
+{
+    switch (cmd) {
+    case HVMOP_pagetable_dying:
+            exit->u.hcall.result = -ENOSYS;
+            return true;
+
+    default:
+            return false;
+    }
+}
+
 static bool __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
 {
     uint16_t code = exit->u.hcall.input;
@@ -190,6 +204,9 @@ static bool __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     }
 
     switch (code) {
+    case __HYPERVISOR_hvm_op:
+        return kvm_xen_hcall_hvm_op(exit, exit->u.hcall.params[0],
+                                    exit->u.hcall.params[1]);
     case __HYPERVISOR_memory_op:
         return kvm_xen_hcall_memory_op(exit, exit->u.hcall.params[0],
                                        exit->u.hcall.params[1], cpu);
-- 
2.35.3


