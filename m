Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1003F698D1B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 07:35:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSXiN-0003Q1-OM; Thu, 16 Feb 2023 01:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pSXhl-0003Cn-Ag
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:25:20 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pSXhe-0006vH-0f
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:25:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=B9vAX6ou0MZZG+m6Bxfegu0VH1GW8r3yPBcD2MFrlh8=; b=Z/bjClPDi3N/iGAgXJq+mNIiTp
 pi6KW7IO5rR5XiQeebQXC9xBBX12TJ83Cl7K8Qso4ag7XuznH/GakFQ7HJydBzpWc12f7iEUilWCq
 SA/oTietUSWUsE3ork+Jf56VsO9tOPyMs9CFBK7L5QEG6UhSeBgd7V/FbA9W16YisxFw+BZKN8lrV
 +mDeRcbEfFiEXKWZvDYLnL6a0+mAC0zmS5f/uEdags+uzE8A2pWYRfN6mpc+3xU0bUABVeEugDam7
 HJUZf3o+fcIg2KusEOSr3uoDawqBnqxPw5TvwVdXq7LwbdE+6SIUGKXqaJWVg0inKInjX7GxKp/Pr
 sTwB4cDQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pSXhJ-0089y5-AG; Thu, 16 Feb 2023 06:24:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pSXhJ-008w9o-0y; Thu, 16 Feb 2023 06:24:49 +0000
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
Subject: [PATCH v11 54/59] i386/xen: Implement HYPERVISOR_physdev_op
Date: Thu, 16 Feb 2023 06:24:39 +0000
Message-Id: <20230216062444.2129371-55-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230216062444.2129371-1-dwmw2@infradead.org>
References: <20230216062444.2129371-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org;
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

Just hook up the basic hypercalls to stubs in xen_evtchn.c for now.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_evtchn.c     |  25 ++++++++
 hw/i386/kvm/xen_evtchn.h     |  11 ++++
 target/i386/kvm/xen-compat.h |  19 ++++++
 target/i386/kvm/xen-emu.c    | 118 +++++++++++++++++++++++++++++++++++
 4 files changed, 173 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 7412139154..ca9f15698f 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -1347,6 +1347,31 @@ int xen_evtchn_set_port(uint16_t port)
     return ret;
 }
 
+int xen_physdev_map_pirq(struct physdev_map_pirq *map)
+{
+    return -ENOTSUP;
+}
+
+int xen_physdev_unmap_pirq(struct physdev_unmap_pirq *unmap)
+{
+    return -ENOTSUP;
+}
+
+int xen_physdev_eoi_pirq(struct physdev_eoi *eoi)
+{
+    return -ENOTSUP;
+}
+
+int xen_physdev_query_pirq(struct physdev_irq_status_query *query)
+{
+    return -ENOTSUP;
+}
+
+int xen_physdev_get_free_pirq(struct physdev_get_free_pirq *get)
+{
+    return -ENOTSUP;
+}
+
 struct xenevtchn_handle *xen_be_evtchn_open(void)
 {
     struct xenevtchn_handle *xc = g_new0(struct xenevtchn_handle, 1);
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 5a71ffb753..352c875976 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -62,4 +62,15 @@ int xen_evtchn_bind_interdomain_op(struct evtchn_bind_interdomain *interdomain);
 int xen_evtchn_bind_vcpu_op(struct evtchn_bind_vcpu *vcpu);
 int xen_evtchn_reset_op(struct evtchn_reset *reset);
 
+struct physdev_map_pirq;
+struct physdev_unmap_pirq;
+struct physdev_eoi;
+struct physdev_irq_status_query;
+struct physdev_get_free_pirq;
+int xen_physdev_map_pirq(struct physdev_map_pirq *map);
+int xen_physdev_unmap_pirq(struct physdev_unmap_pirq *unmap);
+int xen_physdev_eoi_pirq(struct physdev_eoi *eoi);
+int xen_physdev_query_pirq(struct physdev_irq_status_query *query);
+int xen_physdev_get_free_pirq(struct physdev_get_free_pirq *get);
+
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-compat.h b/target/i386/kvm/xen-compat.h
index 448336de92..7f30180cc2 100644
--- a/target/i386/kvm/xen-compat.h
+++ b/target/i386/kvm/xen-compat.h
@@ -48,4 +48,23 @@ struct compat_xen_add_to_physmap_batch {
     COMPAT_HANDLE(int) errs;
 };
 
+struct compat_physdev_map_pirq {
+    domid_t domid;
+    uint16_t pad;
+    /* IN */
+    int type;
+    /* IN (ignored for ..._MULTI_MSI) */
+    int index;
+    /* IN or OUT */
+    int pirq;
+    /* IN - high 16 bits hold segment for ..._MSI_SEG and ..._MULTI_MSI */
+    int bus;
+    /* IN */
+    int devfn;
+    /* IN (also OUT for ..._MULTI_MSI) */
+    int entry_nr;
+    /* IN */
+    uint64_t table_base;
+} __attribute__((packed));
+
 #endif /* QEMU_I386_XEN_COMPAT_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 389acd0c42..e8e7092c66 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -1517,6 +1517,121 @@ static bool kvm_xen_hcall_gnttab_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static bool kvm_xen_hcall_physdev_op(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                     int cmd, uint64_t arg)
+{
+    CPUState *cs = CPU(cpu);
+    int err;
+
+    switch (cmd) {
+    case PHYSDEVOP_map_pirq: {
+        struct physdev_map_pirq map;
+
+        if (hypercall_compat32(exit->u.hcall.longmode)) {
+            struct compat_physdev_map_pirq *map32 = (void *)&map;
+
+            if (kvm_copy_from_gva(cs, arg, map32, sizeof(*map32))) {
+                return -EFAULT;
+            }
+
+            /*
+             * The only thing that's different is the alignment of the
+             * uint64_t table_base at the end, which gets padding to make
+             * it 64-bit aligned in the 64-bit version.
+             */
+            qemu_build_assert(sizeof(*map32) == 36);
+            qemu_build_assert(offsetof(struct physdev_map_pirq, entry_nr) ==
+                              offsetof(struct compat_physdev_map_pirq, entry_nr));
+            memmove(&map.table_base, &map32->table_base, sizeof(map.table_base));
+        } else {
+            if (kvm_copy_from_gva(cs, arg, &map, sizeof(map))) {
+                err = -EFAULT;
+                break;
+            }
+        }
+        err = xen_physdev_map_pirq(&map);
+        /*
+         * Since table_base is an IN parameter and won't be changed, just
+         * copy the size of the compat structure back to the guest.
+         */
+        if (!err && kvm_copy_to_gva(cs, arg, &map,
+                                    sizeof(struct compat_physdev_map_pirq))) {
+            err = -EFAULT;
+        }
+        break;
+    }
+    case PHYSDEVOP_unmap_pirq: {
+        struct physdev_unmap_pirq unmap;
+
+        qemu_build_assert(sizeof(unmap) == 8);
+        if (kvm_copy_from_gva(cs, arg, &unmap, sizeof(unmap))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_physdev_unmap_pirq(&unmap);
+        if (!err && kvm_copy_to_gva(cs, arg, &unmap, sizeof(unmap))) {
+            err = -EFAULT;
+        }
+        break;
+    }
+    case PHYSDEVOP_eoi: {
+        struct physdev_eoi eoi;
+
+        qemu_build_assert(sizeof(eoi) == 4);
+        if (kvm_copy_from_gva(cs, arg, &eoi, sizeof(eoi))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_physdev_eoi_pirq(&eoi);
+        if (!err && kvm_copy_to_gva(cs, arg, &eoi, sizeof(eoi))) {
+            err = -EFAULT;
+        }
+        break;
+    }
+    case PHYSDEVOP_irq_status_query: {
+        struct physdev_irq_status_query query;
+
+        qemu_build_assert(sizeof(query) == 8);
+        if (kvm_copy_from_gva(cs, arg, &query, sizeof(query))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_physdev_query_pirq(&query);
+        if (!err && kvm_copy_to_gva(cs, arg, &query, sizeof(query))) {
+            err = -EFAULT;
+        }
+        break;
+    }
+    case PHYSDEVOP_get_free_pirq: {
+        struct physdev_get_free_pirq get;
+
+        qemu_build_assert(sizeof(get) == 8);
+        if (kvm_copy_from_gva(cs, arg, &get, sizeof(get))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_physdev_get_free_pirq(&get);
+        if (!err && kvm_copy_to_gva(cs, arg, &get, sizeof(get))) {
+            err = -EFAULT;
+        }
+        break;
+    }
+    case PHYSDEVOP_pirq_eoi_gmfn_v2: // FreeBSD 13 makes this hypercall
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
 static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
 {
     uint16_t code = exit->u.hcall.input;
@@ -1558,6 +1673,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     case __HYPERVISOR_memory_op:
         return kvm_xen_hcall_memory_op(exit, cpu, exit->u.hcall.params[0],
                                        exit->u.hcall.params[1]);
+    case __HYPERVISOR_physdev_op:
+        return kvm_xen_hcall_physdev_op(exit, cpu, exit->u.hcall.params[0],
+                                        exit->u.hcall.params[1]);
     case __HYPERVISOR_xen_version:
         return kvm_xen_hcall_xen_version(exit, cpu, exit->u.hcall.params[0],
                                          exit->u.hcall.params[1]);
-- 
2.39.0


