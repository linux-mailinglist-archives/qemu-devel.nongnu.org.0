Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1BA642EF8
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2FKH-0007oB-PL; Mon, 05 Dec 2022 12:32:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FKD-0007nw-G4
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:17 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FJx-0007PO-M6
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=CmtzMD9qyMJ/O9WiM0u8rK7WPAHLSUq3FiGW7nZ6FSc=; b=PkCp/C67V8HOElY4dn2h3YBxTh
 7bbn6qQ7cf5erheZ6/Yct9pLrtYl/RtV4he62qIcC3BsH1b7BA4H+fLd7ADunllYAzcxmNRFRiStT
 N4zokszIYX7K23ssXqtcOFypV+LjyYXKqUI1E+vzsNTe0i0+J/R8h0GcTFo7QLNyOvB+DvY4rwl/k
 TX9yejz9SMjEvevOUm+UCMciNxvQ6I1gev8C6EWXA5WvLXx93iNUn3MGE5YACUzVM6KSFLssZrNM1
 Qs5AvaQy4feZ6h4ZvDDYNIEOKGDIm/HOumG9KjQ4n3cmhxko7MPATpHMbb9FdEYmLAqKhDEZwRMXp
 NyeUGSPQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2FJo-007fzP-VU; Mon, 05 Dec 2022 17:31:53 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p2FJo-002YKX-ND; Mon, 05 Dec 2022 17:31:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
Subject: [RFC PATCH 14/21] i386/xen: implement HYPERVISOR_vcpu_op
Date: Mon,  5 Dec 2022 17:31:30 +0000
Message-Id: <20221205173137.607044-15-dwmw2@infradead.org>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
 target/i386/xen.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/target/i386/xen.c b/target/i386/xen.c
index 38d4cae3d0..61c9959981 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -18,6 +18,7 @@
 #include "standard-headers/xen/version.h"
 #include "standard-headers/xen/memory.h"
 #include "standard-headers/xen/hvm/hvm_op.h"
+#include "standard-headers/xen/vcpu.h"
 
 #define PAGE_OFFSET    0xffffffff80000000UL
 #define PAGE_SHIFT     12
@@ -196,6 +197,21 @@ static int kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit,
     return HCALL_ERR;
 }
 
+static int kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit,
+                                 int cmd, uint64_t arg)
+{
+    switch (cmd) {
+    case VCPUOP_register_vcpu_info: {
+            /* no vcpu info placement for now */
+            exit->u.hcall.result = -ENOSYS;
+            return 0;
+        }
+    }
+
+    exit->u.hcall.result = -ENOSYS;
+    return HCALL_ERR;
+}
+
 static int __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
 {
     uint16_t code = exit->u.hcall.input;
@@ -206,6 +222,9 @@ static int __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     }
 
     switch (code) {
+    case __HYPERVISOR_vcpu_op:
+        return kvm_xen_hcall_vcpu_op(exit, exit->u.hcall.params[0],
+                                     exit->u.hcall.params[1]);
     case __HYPERVISOR_hvm_op:
         return kvm_xen_hcall_hvm_op(exit, exit->u.hcall.params[0],
                                     exit->u.hcall.params[1]);
-- 
2.35.3


