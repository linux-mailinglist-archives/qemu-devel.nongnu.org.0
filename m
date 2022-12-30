Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5CB659863
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:44:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEGu-0000W2-6Y; Fri, 30 Dec 2022 07:14:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+3cbd6dee458626289faf+7068+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pBEG2-00087g-Vc
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:13:07 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+3cbd6dee458626289faf+7068+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pBEFw-00052i-2q
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:13:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=K4x/K13DqQHbiC/C54njW9QW62QjTPsqS6BtwVml5wg=; b=fXA5gOyI5T1Zeqk+FVJdM2WWkX
 t0+6s3LmQ57ot7nVqIYPCoTa2CaFYEEiO/3cu7byiQhf+ERz+Y+1GzrZwWTP70HDQPMXHmhZMtloz
 rhzm9USfWK7F6fjpsyZHFk2m0JTznsRy4EIfnlxPGsUVr/WgsrywbzGCCv44cXiH2oGqdHSGfDz9w
 KVgeYs5LNhgAyDaUpYtpB1ZGrjPmR0Yy/Abn9o73OAQ6P1NHxgzaHyxYzz5/9Ti9WQZzwZ3XhdLMK
 SYvaJNqkvdT4zlnAHY6kbDRGESXkxiR27O07OjII/Mf/w+IBd9TzJGtiJX6aUxsRCCCsXMCOOrZGD
 Qrz4vEmA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pBEFW-00Gpjg-1W; Fri, 30 Dec 2022 12:12:44 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pBEFa-005Ny2-2n; Fri, 30 Dec 2022 12:12:38 +0000
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
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: [RFC PATCH v5 33/52] hw/xen: Implement EVTCHNOP_bind_ipi
Date: Fri, 30 Dec 2022 12:12:16 +0000
Message-Id: <20221230121235.1282915-34-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221230121235.1282915-1-dwmw2@infradead.org>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+3cbd6dee458626289faf+7068+infradead.org+dwmw2@desiato.srs.infradead.org;
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
 hw/i386/kvm/xen_evtchn.c  | 69 +++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h  |  2 ++
 target/i386/kvm/xen-emu.c | 15 +++++++++
 3 files changed, 86 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index f8e7170a84..ae715c4af9 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -13,6 +13,7 @@
 #include "qemu/host-utils.h"
 #include "qemu/module.h"
 #include "qemu/main-loop.h"
+#include "qemu/log.h"
 #include "qapi/error.h"
 #include "qom/object.h"
 #include "exec/target_page.h"
@@ -226,6 +227,43 @@ static void inject_callback(XenEvtchnState *s, uint32_t vcpu)
     kvm_xen_inject_vcpu_callback_vector(vcpu, type);
 }
 
+static void deassign_kernel_port(evtchn_port_t port)
+{
+    struct kvm_xen_hvm_attr ha;
+    int ret;
+
+    ha.type = KVM_XEN_ATTR_TYPE_EVTCHN;
+    ha.u.evtchn.send_port = port;
+    ha.u.evtchn.flags = KVM_XEN_EVTCHN_DEASSIGN;
+
+    ret = kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &ha);
+    if (ret) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Failed to unbind kernel port %d: %s\n",
+                      port, strerror(ret));
+    }
+}
+
+static int assign_kernel_port(uint16_t type, evtchn_port_t port,
+                              uint32_t vcpu_id)
+{
+    CPUState *cpu = qemu_get_cpu(vcpu_id);
+    struct kvm_xen_hvm_attr ha;
+
+    if (!cpu) {
+        return -ENOENT;
+    }
+
+    ha.type = KVM_XEN_ATTR_TYPE_EVTCHN;
+    ha.u.evtchn.send_port = port;
+    ha.u.evtchn.type = type;
+    ha.u.evtchn.flags = 0;
+    ha.u.evtchn.deliver.port.port = port;
+    ha.u.evtchn.deliver.port.vcpu = kvm_arch_vcpu_id(cpu);
+    ha.u.evtchn.deliver.port.priority = KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL;
+
+    return kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &ha);
+}
+
 static bool valid_port(evtchn_port_t port)
 {
     if (!port) {
@@ -544,6 +582,12 @@ static int close_port(XenEvtchnState *s, evtchn_port_t port)
                               p->type_val, 0);
         break;
 
+    case EVTCHNSTAT_ipi:
+        if (s->evtchn_in_kernel) {
+            deassign_kernel_port(port);
+        }
+        break;
+
     default:
         break;
     }
@@ -633,3 +677,28 @@ int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq)
 
     return ret;
 }
+
+int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int ret;
+
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    if (!valid_vcpu(ipi->vcpu)) {
+        return -ENOENT;
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    ret = allocate_port(s, ipi->vcpu, EVTCHNSTAT_ipi, 0, &ipi->port);
+    if (!ret && s->evtchn_in_kernel) {
+        assign_kernel_port(EVTCHNSTAT_ipi, ipi->port, ipi->vcpu);
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+
+    return ret;
+}
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 0ea13dda3a..107f420848 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -19,9 +19,11 @@ struct evtchn_status;
 struct evtchn_close;
 struct evtchn_unmask;
 struct evtchn_bind_virq;
+struct evtchn_bind_ipi;
 int xen_evtchn_status_op(struct evtchn_status *status);
 int xen_evtchn_close_op(struct evtchn_close *close);
 int xen_evtchn_unmask_op(struct evtchn_unmask *unmask);
 int xen_evtchn_bind_virq_op(struct evtchn_bind_virq *virq);
+int xen_evtchn_bind_ipi_op(struct evtchn_bind_ipi *ipi);
 
 #endif /* QEMU_XEN_EVTCHN_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index f3d456f4b8..04f672c0ca 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -876,6 +876,21 @@ static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         }
         break;
     }
+    case EVTCHNOP_bind_ipi: {
+        struct evtchn_bind_ipi ipi;
+
+        qemu_build_assert(sizeof(ipi) == 8);
+        if (kvm_copy_from_gva(cs, arg, &ipi, sizeof(ipi))) {
+            err = -EFAULT;
+            break;
+        }
+
+        err = xen_evtchn_bind_ipi_op(&ipi);
+        if (!err && kvm_copy_to_gva(cs, arg, &ipi, sizeof(ipi))) {
+            err = -EFAULT;
+        }
+        break;
+    }
     default:
         return false;
     }
-- 
2.35.3


