Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDD6652B01
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 02:31:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7naC-0004Ti-Qu; Tue, 20 Dec 2022 20:07:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7cc631609c1bd8ad3247+7059+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p7nZO-0002vr-G9
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:06:54 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7cc631609c1bd8ad3247+7059+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p7nZM-0004Hs-07
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=MDCy3pW6RJDHKxYem7bky9kqemLZovYKkCSPD0WS+D4=; b=HPmkGgmHVAOWGAoqQkdf4UZs3f
 hpcA7dYPS2aDa5F52/EPv8nFN3rYVOiIEpgVbzrp4/Iif9tLjLfrgw+z0FC25twv7XyNfR4vmXNp8
 tUMjoox4supwOEVg58TR97c+/YAa9i0ABsdJ/VX9J5Th8Jn6sEMeuIEuZJrrU8B3U+aXgPG/BHVBg
 8n6v5FkLHk1AlRJa4WyWq9E0DyhQQSXExWbNwYKc30IHW2iiBMS0NLT3KsEk+JBRBG7UMSSn9CjFE
 67b6fy4qOjPJKUBO4H2rfKxT5J9i4fMWiY2kN2GB7mfQBOJ8PSalshl6eMjKuiYpOONWl9SzQUUKp
 ZHBosvEQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1p7nYx-00DDGW-1k; Wed, 21 Dec 2022 01:06:34 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p7nYx-004CNZ-BM; Wed, 21 Dec 2022 01:06:27 +0000
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
Subject: [RFC PATCH v4 45/47] i386/xen: Implement HYPERVISOR_grant_table_op
 and GNTTABOP_[gs]et_verson
Date: Wed, 21 Dec 2022 01:06:21 +0000
Message-Id: <20221221010623.1000191-46-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221221010623.1000191-1-dwmw2@infradead.org>
References: <20221221010623.1000191-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+7cc631609c1bd8ad3247+7059+infradead.org+dwmw2@desiato.srs.infradead.org;
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
---
 hw/i386/kvm/xen_gnttab.c  | 31 ++++++++++++++++++++
 hw/i386/kvm/xen_gnttab.h  |  5 ++++
 target/i386/kvm/xen-emu.c | 60 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/hw/i386/kvm/xen_gnttab.c b/hw/i386/kvm/xen_gnttab.c
index 00627648ef..121c39f6e2 100644
--- a/hw/i386/kvm/xen_gnttab.c
+++ b/hw/i386/kvm/xen_gnttab.c
@@ -189,3 +189,34 @@ int xen_gnttab_map_page(uint64_t idx, uint64_t gfn)
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
index 4480b62f3e..f23057d82f 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -35,6 +35,7 @@
 #include "standard-headers/xen/hvm/params.h"
 #include "standard-headers/xen/vcpu.h"
 #include "standard-headers/xen/event_channel.h"
+#include "standard-headers/xen/grant_table.h"
 
 #include "xen-compat.h"
 
@@ -1090,6 +1091,61 @@ static bool kvm_xen_hcall_sched_op(struct kvm_xen_exit *exit, X86CPU *cpu,
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
@@ -1100,6 +1156,10 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
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
2.35.3


