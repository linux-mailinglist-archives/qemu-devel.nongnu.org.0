Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C5A6A0937
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:00:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVB0H-0006Ay-Td; Thu, 23 Feb 2023 07:47:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+41cf4015458c36e783b0+7123+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pVAzc-0003WG-Ok
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:46:37 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+41cf4015458c36e783b0+7123+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pVAzW-0004ln-C2
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=CjTMTzvcKwx4ckBDdMdcff0ETvUjmknoHIRPgcZ39w8=; b=LsX4yjYxzgtFf9m1tTJg/g7a8q
 /DTkbiwqf4FEmMcPqW8mOnwsiTg1mBrbyO4jGC9yU6kGoA8DTrORYByXXPXdShRv4ITelVFiIC7Rc
 LmEd3Sj2K8jvlYznGBi+1jSY6kE/nkY8sgHYi94o54appaq7qGKhwzaNMOVirN+PjoNv2bl83eopx
 tpgF3qdMXB4dJlrW6beNU/V2nQaVe4EmzKcapYW161I9Lfp3AQdQj7YWfiAaozGTd0vAruhVoKo7h
 uROsjPDEq2j3GTFRz1/EsOHCApZW7NcvFJsPmpHVGdVZYpwZQfkgIm4zN4rZ0fT0XJgrfgIqD8QC+
 vNu6UNzg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pVAzJ-00Cujm-30; Thu, 23 Feb 2023 12:46:19 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pVAzJ-00DYrv-2c; Thu, 23 Feb 2023 12:46:17 +0000
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
Subject: [PATCH v13 45/60] i386/xen: Implement HYPERVISOR_grant_table_op and
 GNTTABOP_[gs]et_verson
Date: Thu, 23 Feb 2023 12:45:58 +0000
Message-Id: <20230223124613.3231331-46-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230223124613.3231331-1-dwmw2@infradead.org>
References: <20230223124613.3231331-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+41cf4015458c36e783b0+7123+infradead.org+dwmw2@desiato.srs.infradead.org;
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

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_gnttab.c  | 31 ++++++++++++++++++++
 hw/i386/kvm/xen_gnttab.h  |  5 ++++
 target/i386/kvm/xen-emu.c | 60 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
index 72e87aea6a..b54a94e2bd 100644
--- a/hw/i386/kvm/xen_gnttab.c
+++ b/hw/i386/kvm/xen_gnttab.c
@@ -180,3 +180,34 @@ int xen_gnttab_map_page(uint64_t idx, uint64_t gfn)
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
index c94ee4feee..e570bd7c26 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -34,6 +34,7 @@
 #include "hw/xen/interface/hvm/params.h"
 #include "hw/xen/interface/vcpu.h"
 #include "hw/xen/interface/event_channel.h"
+#include "hw/xen/interface/grant_table.h"
 
 #include "xen-compat.h"
 
@@ -1166,6 +1167,61 @@ static bool kvm_xen_hcall_sched_op(struct kvm_xen_exit *exit, X86CPU *cpu,
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
@@ -1176,6 +1232,10 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
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


