Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700B4686875
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:38:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEB4-0002Lf-Tz; Wed, 01 Feb 2023 09:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+c61c7683afee22e62f8e+7101+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pNE9j-0001PG-VL
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:32:12 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+c61c7683afee22e62f8e+7101+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pNE9g-00036d-Re
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:32:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=RIDt67H/EKcXn8yhYQkRkNbjhldv6xEBgbGCvDGm+gY=; b=dpLB+/FVVWTfjTn4Jec8HyL6Dy
 Gkk5JjOhpGb0fP+do2UQQeA0Npe9KTgISEgEXxESFS3oFy7/fI9TPjsAOrDnZ5ei9ZBauxuVZue8U
 Ss7ogLtFVz4km8oO39gmdPiFxlHSKe7yOrHDvhPNLz3zgVJIABCQO0HIp/aM5ViDGjpmFnH5FVw65
 bjyYVRiDhBUIKJ9Dw03C94QRJWiZGykI/sKw70cTdBc4CaMbk+4tghMgI0AmY9bK8TPgnh+Jtu+HS
 jwUZDFU1NF9Iy2a3lK7RrrCWYkmsjYcYZKsvxDcLUA2XdzHVp60R8Bo9pRE+vaKQlEvtoLrytZ4hX
 EpYju8uA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pNE8q-004nyG-2d; Wed, 01 Feb 2023 14:31:17 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pNE9P-007Jqs-1H; Wed, 01 Feb 2023 14:31:51 +0000
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
Subject: [PATCH v10 15/59] i386/xen: add pc_machine_kvm_type to initialize
 XEN_EMULATE mode
Date: Wed,  1 Feb 2023 14:31:04 +0000
Message-Id: <20230201143148.1744093-16-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230201143148.1744093-1-dwmw2@infradead.org>
References: <20230201143148.1744093-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+c61c7683afee22e62f8e+7101+infradead.org+dwmw2@desiato.srs.infradead.org;
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

The xen_overlay device (and later similar devices for event channels and
grant tables) need to be instantiated. Do this from a kvm_type method on
the PC machine derivatives, since KVM is only way to support Xen emulation
for now.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/pc.c         | 11 +++++++++++
 include/hw/i386/pc.h |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6e592bd969..9169305f4f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -89,6 +89,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/virtio/virtio-pmem-pci.h"
 #include "hw/virtio/virtio-mem-pci.h"
+#include "hw/i386/kvm/xen_overlay.h"
 #include "hw/mem/memory-device.h"
 #include "sysemu/replay.h"
 #include "target/i386/cpu.h"
@@ -1844,6 +1845,16 @@ static void pc_machine_initfn(Object *obj)
     cxl_machine_init(obj, &pcms->cxl_devices_state);
 }
 
+int pc_machine_kvm_type(MachineState *machine, const char *kvm_type)
+{
+#ifdef CONFIG_XEN_EMU
+    if (xen_mode == XEN_EMULATE) {
+        xen_overlay_create();
+    }
+#endif
+    return 0;
+}
+
 static void pc_machine_reset(MachineState *machine, ShutdownCause reason)
 {
     CPUState *cs;
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 88a120bc23..00c15e78bc 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -293,12 +293,15 @@ extern const size_t pc_compat_1_5_len;
 extern GlobalProperty pc_compat_1_4[];
 extern const size_t pc_compat_1_4_len;
 
+extern int pc_machine_kvm_type(MachineState *machine, const char *vm_type);
+
 #define DEFINE_PC_MACHINE(suffix, namestr, initfn, optsfn) \
     static void pc_machine_##suffix##_class_init(ObjectClass *oc, void *data) \
     { \
         MachineClass *mc = MACHINE_CLASS(oc); \
         optsfn(mc); \
         mc->init = initfn; \
+        mc->kvm_type = pc_machine_kvm_type; \
     } \
     static const TypeInfo pc_machine_type_##suffix = { \
         .name       = namestr TYPE_MACHINE_SUFFIX, \
-- 
2.39.0


