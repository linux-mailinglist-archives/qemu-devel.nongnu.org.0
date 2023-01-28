Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C871F67F615
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 09:19:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLgK8-0006Pl-Ms; Sat, 28 Jan 2023 03:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pLgJN-0005sb-TZ
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 03:11:45 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pLgJK-0007rG-2l
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 03:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=TWLs688QHyji1/nAH28/+/Mfmo4rhtAVNlXgKhfauSs=; b=iTQgatbbHeGyfWxb6o04WFLoHM
 qIIti4h1SFd+8PYGN5weDfsxQ2/Qw0lJ6yxwgc2x+Rr45hQ4X8bKtc8m7pHJtBrZCgubjVQNttHjI
 tqhBHtxtNw6CEmrxMZC1o6L5wMhF/J52qCQhvSuslRGPXjAjTJ+efuiSabvfI/BpNkV+3woPJsT0Z
 VXLRzE/Zbat6T4hPIW2UasC38LQsyoQ0xLspqsJMPa6mZOCWcGSP2eEfSWL8MAuxmzmA81eN69t8O
 wTiD33ILOzTVCWxXP+dEG4j0Lux6k3cLLS0H2kzg+6nv2iuUXQZ7xL6TefT7P8LzBWulpnN1p1tw2
 DQYYwhEw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pLgIS-0039wo-35; Sat, 28 Jan 2023 08:10:56 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pLgIy-006mLP-2i; Sat, 28 Jan 2023 08:11:20 +0000
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
Subject: [PATCH v9 54/58] i386/xen: Implement HYPERVISOR_physdev_op
Date: Sat, 28 Jan 2023 08:11:09 +0000
Message-Id: <20230128081113.1615111-55-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230128081113.1615111-1-dwmw2@infradead.org>
References: <20230128081113.1615111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org;
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

Just hook up the basic hypercalls to stubs in xen_evtchn.c for now.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c     |  25 ++++++++
 hw/i386/kvm/xen_evtchn.h     |  11 ++++
 target/i386/kvm/xen-compat.h |  19 ++++++
 target/i386/kvm/xen-emu.c    | 118 +++++++++++++++++++++++++++++++++++
 4 files changed, 173 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 2b12469815..8cff78ddcb 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -1346,6 +1346,31 @@ int xen_evtchn_set_port(uint16_t port)
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
index ff5d20e901..e86ffc7644 100644
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
index be8c456136..54cdb75bad 100644
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
@@ -1551,6 +1666,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
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


