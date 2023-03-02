Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AA36A82D0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi6M-0001ht-KF; Thu, 02 Mar 2023 07:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5q-0000Sa-HW
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5o-00030X-7F
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d1R/PN9dy7cWY6GbtHCFwrHnFZMQnaaGhFqfVwG1ke8=;
 b=ceFAODYh5Q1ZL9ds8HlYZlxBTm2R7etPEMfkJV7VtrTDf1PqGtFZ7aieo3z3l5214DCM9s
 sYP1H1SywN2ydD3M+imp4qVfsFSIHS1hPXt554tkKnwV9WkjSqKohcKiNylNSECPLV8TqU
 5zEPRNHzQ1Nv0A/bTpM0t1taczjdCTU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-GifcpE73MEKn0vsx7lQtAg-1; Thu, 02 Mar 2023 07:31:26 -0500
X-MC-Unique: GifcpE73MEKn0vsx7lQtAg-1
Received: by mail-wm1-f72.google.com with SMTP id
 z6-20020a7bc7c6000000b003e0107732f4so5699246wmk.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d1R/PN9dy7cWY6GbtHCFwrHnFZMQnaaGhFqfVwG1ke8=;
 b=28Rlpkgy6StiuHe8+y0ZqIiMV+LLSUTgiyeUP9D/fItRNSh50yoZhJsG269geXgZYq
 6agiLx4DeFQcUZ9NIZGw91Jg4KagAOb16L/HlFrKLaix744537idFLePEGCXbA9Pf4s4
 rUTDaJne0acb0lUPrG6ZjIENg3GHpH2IvoE918j+3lVcKX65pOC7l7tOa96PQ579iplU
 a/moRWzBb+O5h+ONpxTnXaoaJBaZlJxNmuWxxwS+H+7NAhGt2vl6chXzjYr8gFN96rW2
 X5XQhc59K8kbR04SGKJA61xVr5UKHFweyZHEi5SUP01KYbbREAL/pFag7L1BJSpTwwXC
 IEeg==
X-Gm-Message-State: AO0yUKVmc0lHnZW1W44VeDK2cicPBvoQQtU3cZEHqaYZC485hwNeXaAP
 UsI6rFGj/j4qS3MPgbKinYwiMNegERxyWVtriSs5IPi6jU5sx2Ai0kgelsGZD2mGm+NlfZKFpgq
 o37+J6/zOulPVrHbuvhkhnfgfJOF7dmFWhXf+jO32KwbesLGb0Q4+uwO+TlDKb4n058yJJMTQP0
 Y=
X-Received: by 2002:a05:600c:1708:b0:3ea:c100:f18d with SMTP id
 c8-20020a05600c170800b003eac100f18dmr7254406wmn.9.1677760284596; 
 Thu, 02 Mar 2023 04:31:24 -0800 (PST)
X-Google-Smtp-Source: AK7set8JgmZm0t3yvoPztvw6dX0ZS9P8xGI6Rs1Nt52Xv/oJTas07kFGgR8+GuBsnXdBKQb90tQhbQ==
X-Received: by 2002:a05:600c:1708:b0:3ea:c100:f18d with SMTP id
 c8-20020a05600c170800b003eac100f18dmr7254394wmn.9.1677760284313; 
 Thu, 02 Mar 2023 04:31:24 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a1ccc06000000b003e118684d56sm2761434wmb.45.2023.03.02.04.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [PULL 17/62] i386/xen: implement HYPERVISOR_memory_op
Date: Thu,  2 Mar 2023 13:29:44 +0100
Message-Id: <20230302123029.153265-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Specifically XENMEM_add_to_physmap with space XENMAPSPACE_shared_info to
allow the guest to set its shared_info page.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Use the xen_overlay device, add compat support]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/trace-events |   1 +
 target/i386/kvm/xen-compat.h |  27 ++++++++
 target/i386/kvm/xen-emu.c    | 116 ++++++++++++++++++++++++++++++++++-
 3 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100644 target/i386/kvm/xen-compat.h

diff --git a/target/i386/kvm/trace-events b/target/i386/kvm/trace-events
index bb732e1da840..8e9f269f5671 100644
--- a/target/i386/kvm/trace-events
+++ b/target/i386/kvm/trace-events
@@ -9,3 +9,4 @@ kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
 # xen-emu.c
 kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1, uint64_t a2, uint64_t ret) "xen_hypercall: cpu %d cpl %d input %" PRIu64 " a0 0x%" PRIx64 " a1 0x%" PRIx64 " a2 0x%" PRIx64" ret 0x%" PRIx64
 kvm_xen_soft_reset(void) ""
+kvm_xen_set_shared_info(uint64_t gfn) "shared info at gfn 0x%" PRIx64
diff --git a/target/i386/kvm/xen-compat.h b/target/i386/kvm/xen-compat.h
new file mode 100644
index 000000000000..2d852e2a28b8
--- /dev/null
+++ b/target/i386/kvm/xen-compat.h
@@ -0,0 +1,27 @@
+/*
+ * Xen HVM emulation support in KVM
+ *
+ * Copyright © 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef QEMU_I386_KVM_XEN_COMPAT_H
+#define QEMU_I386_KVM_XEN_COMPAT_H
+
+#include "hw/xen/interface/memory.h"
+
+typedef uint32_t compat_pfn_t;
+typedef uint32_t compat_ulong_t;
+
+struct compat_xen_add_to_physmap {
+    domid_t domid;
+    uint16_t size;
+    unsigned int space;
+    compat_ulong_t idx;
+    compat_pfn_t gpfn;
+};
+
+#endif /* QEMU_I386_XEN_COMPAT_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index be6d85f2cb7b..5d7982712842 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -12,6 +12,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
+#include "hw/xen/xen.h"
 #include "sysemu/kvm_int.h"
 #include "sysemu/kvm_xen.h"
 #include "kvm/kvm_i386.h"
@@ -24,6 +25,15 @@
 
 #include "hw/xen/interface/version.h"
 #include "hw/xen/interface/sched.h"
+#include "hw/xen/interface/memory.h"
+
+#include "xen-compat.h"
+
+#ifdef TARGET_X86_64
+#define hypercall_compat32(longmode) (!(longmode))
+#else
+#define hypercall_compat32(longmode) (false)
+#endif
 
 static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
                       bool is_write)
@@ -175,13 +185,114 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static int xen_set_shared_info(uint64_t gfn)
+{
+    uint64_t gpa = gfn << TARGET_PAGE_BITS;
+    int err;
+
+    QEMU_IOTHREAD_LOCK_GUARD();
+
+    /*
+     * The xen_overlay device tells KVM about it too, since it had to
+     * do that on migration load anyway (unless we're going to jump
+     * through lots of hoops to maintain the fiction that this isn't
+     * KVM-specific.
+     */
+    err = xen_overlay_map_shinfo_page(gpa);
+    if (err) {
+            return err;
+    }
+
+    trace_kvm_xen_set_shared_info(gfn);
+
+    return err;
+}
+
+static int add_to_physmap_one(uint32_t space, uint64_t idx, uint64_t gfn)
+{
+    switch (space) {
+    case XENMAPSPACE_shared_info:
+        if (idx > 0) {
+            return -EINVAL;
+        }
+        return xen_set_shared_info(gfn);
+
+    case XENMAPSPACE_grant_table:
+    case XENMAPSPACE_gmfn:
+    case XENMAPSPACE_gmfn_range:
+        return -ENOTSUP;
+
+    case XENMAPSPACE_gmfn_foreign:
+    case XENMAPSPACE_dev_mmio:
+        return -EPERM;
+
+    default:
+        return -EINVAL;
+    }
+}
+
+static int do_add_to_physmap(struct kvm_xen_exit *exit, X86CPU *cpu,
+                             uint64_t arg)
+{
+    struct xen_add_to_physmap xatp;
+    CPUState *cs = CPU(cpu);
+
+    if (hypercall_compat32(exit->u.hcall.longmode)) {
+        struct compat_xen_add_to_physmap xatp32;
+
+        qemu_build_assert(sizeof(struct compat_xen_add_to_physmap) == 16);
+        if (kvm_copy_from_gva(cs, arg, &xatp32, sizeof(xatp32))) {
+            return -EFAULT;
+        }
+        xatp.domid = xatp32.domid;
+        xatp.size = xatp32.size;
+        xatp.space = xatp32.space;
+        xatp.idx = xatp32.idx;
+        xatp.gpfn = xatp32.gpfn;
+    } else {
+        if (kvm_copy_from_gva(cs, arg, &xatp, sizeof(xatp))) {
+            return -EFAULT;
+        }
+    }
+
+    if (xatp.domid != DOMID_SELF && xatp.domid != xen_domid) {
+        return -ESRCH;
+    }
+
+    return add_to_physmap_one(xatp.space, xatp.idx, xatp.gpfn);
+}
+
+static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                   int cmd, uint64_t arg)
+{
+    int err;
+
+    switch (cmd) {
+    case XENMEM_add_to_physmap:
+        err = do_add_to_physmap(exit, cpu, arg);
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
+    int err;
+
     assert(qemu_mutex_iothread_locked());
 
     trace_kvm_xen_soft_reset();
 
-    /* Nothing to reset... yet. */
+    err = xen_overlay_map_shinfo_page(INVALID_GFN);
+    if (err) {
+        return err;
+    }
+
     return 0;
 }
 
@@ -270,6 +381,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     case __HYPERVISOR_sched_op:
         return kvm_xen_hcall_sched_op(exit, cpu, exit->u.hcall.params[0],
                                       exit->u.hcall.params[1]);
+    case __HYPERVISOR_memory_op:
+        return kvm_xen_hcall_memory_op(exit, cpu, exit->u.hcall.params[0],
+                                       exit->u.hcall.params[1]);
     case __HYPERVISOR_xen_version:
         return kvm_xen_hcall_xen_version(exit, cpu, exit->u.hcall.params[0],
                                          exit->u.hcall.params[1]);
-- 
2.39.1


