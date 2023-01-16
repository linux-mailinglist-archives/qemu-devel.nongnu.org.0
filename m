Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F9766D132
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 22:59:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHXVB-0006yC-3z; Mon, 16 Jan 2023 16:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHXUr-0006jL-Qe
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:29 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pHXUn-0003ZX-0f
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9twugSPlfLNIeIml8MfizQnOxUkYNm+EHURku2UiPYA=; b=pQCrb3T8zByFxxbhJmIIJ/rQoD
 4RwTYCAcN9zO5kJs5NjBflHeLCN/1eNV/AH6e3wugxzZmzLuC5LpXA/zjWyHsAAIwhBpQebKF95Wm
 wdxxM4iJWOxAbuLRrx1fahp7Lez5S55QwnBANP0q8btn9qDiNtV/a7MKpWS/dnLvThdHeI4WVVNst
 TayIGPUaDgqjG7EtTw0zRmqG7CHAPNijPFLzZXt3KFEa+FGqX2/x1Hm4HrG4uh4ogMXz3c6DzW+lr
 uf5J5ErGzCCyvnYQJd/TIGmhs7lrBsE3TNhlEmi0HH+JhUDiSDaIXi4Fk3ntHNXtmt+bvCTy13kzh
 waDby1Rg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHXUl-0097Vd-IF; Mon, 16 Jan 2023 21:58:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pHXUX-004iQb-2f; Mon, 16 Jan 2023 21:58:09 +0000
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
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v7 44/51] i386/xen: Implement HYPERVISOR_grant_table_op and
 GNTTABOP_[gs]et_verson
Date: Mon, 16 Jan 2023 21:57:58 +0000
Message-Id: <20230116215805.1123514-45-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116215805.1123514-1-dwmw2@infradead.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+fb0b8ce1ba8490165fd5+7085+infradead.org+dwmw2@casper.srs.infradead.org;
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

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_gnttab.c  | 31 ++++++++++++++++++++
 hw/i386/kvm/xen_gnttab.h  |  5 ++++
 target/i386/kvm/xen-emu.c | 60 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
index 311f48bfdb..cdcfea5be3 100644
--- a/hw/i386/kvm/xen_gnttab.c
+++ b/hw/i386/kvm/xen_gnttab.c
@@ -186,3 +186,34 @@ int xen_gnttab_map_page(uint64_t idx, uint64_t gfn)
     return 0;
 }
 
+int xen_gnttab_set_version_op(struct gnttab_set_version *set)
+{
+    int ret;
+
+    switch (set->version) {
+    case 1:
+        ret = 0;
+        break;
+
+    case 2:
+        /* Behave as before set_version was introduced. */
+        ret = -ENOSYS;
+        break;
+
+    default:
+        ret = -EINVAL;
+    }
+
+    set->version = 1;
+    return ret;
+}
+
+int xen_gnttab_get_version_op(struct gnttab_get_version *get)
+{
+    if (get->dom != DOMID_SELF && get->dom != xen_domid) {
+        return -ESRCH;
+    }
+
+    get->version = 1;
+    return 0;
+}
diff --git a/hw/i386/kvm/xen_gnttab.h b/hw/i386/kvm/xen_gnttab.h
index a7caa94c83..79579677ba 100644
--- a/hw/i386/kvm/xen_gnttab.h
+++ b/hw/i386/kvm/xen_gnttab.h
@@ -15,4 +15,9 @@
 void xen_gnttab_create(void);
 int xen_gnttab_map_page(uint64_t idx, uint64_t gfn);
 
+struct gnttab_set_version;
+struct gnttab_get_version;
+int xen_gnttab_set_version_op(struct gnttab_set_version *set);
+int xen_gnttab_get_version_op(struct gnttab_get_version *get);
+
 #endif /* QEMU_XEN_GNTTAB_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 59e4a9d4ac..fa2d3e5615 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -33,6 +33,7 @@
 #include "standard-headers/xen/hvm/params.h"
 #include "standard-headers/xen/vcpu.h"
 #include "standard-headers/xen/event_channel.h"
+#include "standard-headers/xen/grant_table.h"
 
 #include "xen-compat.h"
 
@@ -1137,6 +1138,61 @@ static bool kvm_xen_hcall_sched_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static bool kvm_xen_hcall_gnttab_op(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                    int cmd, uint64_t arg, int count)
+{
+    CPUState *cs = CPU(cpu);
+    int err;
+
+    switch (cmd) {
+    case GNTTABOP_set_version: {
+        struct gnttab_set_version set;
+
+        qemu_build_assert(sizeof(set) == 4);
+        if (kvm_copy_from_gva(cs, arg, &set, sizeof(set))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_gnttab_set_version_op(&set);
+        if (!err && kvm_copy_to_gva(cs, arg, &set, sizeof(set))) {
+            err = -EFAULT;
+        }
+        break;
+    }
+    case GNTTABOP_get_version: {
+        struct gnttab_get_version get;
+
+        qemu_build_assert(sizeof(get) == 8);
+        if (kvm_copy_from_gva(cs, arg, &get, sizeof(get))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_gnttab_get_version_op(&get);
+        if (!err && kvm_copy_to_gva(cs, arg, &get, sizeof(get))) {
+            err = -EFAULT;
+        }
+        break;
+    }
+    case GNTTABOP_query_size:
+    case GNTTABOP_setup_table:
+    case GNTTABOP_copy:
+    case GNTTABOP_map_grant_ref:
+    case GNTTABOP_unmap_grant_ref:
+    case GNTTABOP_swap_grant_ref:
+        return false;
+
+    default:
+        /* Xen explicitly returns -ENOSYS to HVM guests for all others */
+        err = -ENOSYS;
+        break;
+    }
+
+    exit->u.hcall.result = err;
+    return true;
+}
+
 static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
 {
     uint16_t code = exit->u.hcall.input;
@@ -1147,6 +1203,10 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     }
 
     switch (code) {
+    case __HYPERVISOR_grant_table_op:
+        return kvm_xen_hcall_gnttab_op(exit, cpu, exit->u.hcall.params[0],
+                                       exit->u.hcall.params[1],
+                                       exit->u.hcall.params[2]);
     case __HYPERVISOR_sched_op:
         return kvm_xen_hcall_sched_op(exit, cpu, exit->u.hcall.params[0],
                                       exit->u.hcall.params[1]);
-- 
2.39.0


