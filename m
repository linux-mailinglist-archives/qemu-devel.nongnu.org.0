Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ECC698CC9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 07:27:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSXiW-0003ct-NM; Thu, 16 Feb 2023 01:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pSXhw-0003Ix-6q
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:25:28 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+33d3adc5578b079b0cf9+7116+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pSXhk-0006xW-JG
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=LLJPy7DqV+l+nIcju20OyNIXv35l1133LhXKTbxCUD4=; b=r3mNdwPNHIEwTWuBk7K1g4Q3bP
 4tRDKIcOu70XN1ZQnYRqHlaZ4G0ZcJDlXUO8t2CVWer2ineknNUGHvQu/LJcuQb3Lvov4Z+cMsz5Z
 Vcflk1qpAl3u0cYE7TTsr+j2TCeXlWg2S3x9wdU2TRruae18r1hMAluuPjPI+Ctb2RZqE6XXQT+4d
 LkA5VQ8EnpjBs+9iCJcdeCJcz9M3ROadGq2QQs5/V17hPD5VZrxW2SLsnjnSndzvkYmog6jhOU8S5
 jrz85Vyv/Ne6Ko9LnGrDTZ1FKO22L88iP1XISGw6mPQ5Pk4fwgFoj0x9rcnmbm/EXksAHzzPFRVuQ
 p4ZbMq/w==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pSXhI-0089xp-J7; Thu, 16 Feb 2023 06:24:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pSXhI-008w8v-1s; Thu, 16 Feb 2023 06:24:48 +0000
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
Subject: [PATCH v11 42/59] kvm/i386: Add xen-gnttab-max-frames property
Date: Thu, 16 Feb 2023 06:24:27 +0000
Message-Id: <20230216062444.2129371-43-dwmw2@infradead.org>
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 accel/kvm/kvm-all.c       |  1 +
 include/sysemu/kvm_int.h  |  1 +
 include/sysemu/kvm_xen.h  |  1 +
 target/i386/kvm/kvm.c     | 34 ++++++++++++++++++++++++++++++++++
 target/i386/kvm/xen-emu.c |  6 ++++++
 5 files changed, 43 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f242e36316..dc5b0bb434 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3704,6 +3704,7 @@ static void kvm_accel_instance_init(Object *obj)
     s->notify_vmexit = NOTIFY_VMEXIT_OPTION_RUN;
     s->notify_window = 0;
     s->xen_version = 0;
+    s->xen_gnttab_max_frames = 64;
 }
 
 /**
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 7f945bc763..39ce4d36f6 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -120,6 +120,7 @@ struct KVMState
     uint32_t notify_window;
     uint32_t xen_version;
     uint32_t xen_caps;
+    uint16_t xen_gnttab_max_frames;
 };
 
 void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index 1edff29541..7fee28dec7 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -25,6 +25,7 @@ void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id);
 void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type);
 void kvm_xen_set_callback_asserted(void);
 int kvm_xen_set_vcpu_virq(uint32_t vcpu_id, uint16_t virq, uint16_t port);
+uint16_t kvm_xen_get_gnttab_max_frames(void);
 
 #define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
                                  KVM_XEN_HVM_CONFIG_ ## cap))
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f6ae70c831..6d112ccddd 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5865,6 +5865,33 @@ static void kvm_arch_set_xen_version(Object *obj, Visitor *v,
     }
 }
 
+static void kvm_arch_get_xen_gnttab_max_frames(Object *obj, Visitor *v,
+                                               const char *name, void *opaque,
+                                               Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    uint16_t value = s->xen_gnttab_max_frames;
+
+    visit_type_uint16(v, name, &value, errp);
+}
+
+static void kvm_arch_set_xen_gnttab_max_frames(Object *obj, Visitor *v,
+                                               const char *name, void *opaque,
+                                               Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    Error *error = NULL;
+    uint16_t value;
+
+    visit_type_uint16(v, name, &value, &error);
+    if (error) {
+        error_propagate(errp, error);
+        return;
+    }
+
+    s->xen_gnttab_max_frames = value;
+}
+
 void kvm_arch_accel_class_init(ObjectClass *oc)
 {
     object_class_property_add_enum(oc, "notify-vmexit", "NotifyVMexitOption",
@@ -5890,6 +5917,13 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
                                           "Xen version to be emulated "
                                           "(in XENVER_version form "
                                           "e.g. 0x4000a for 4.10)");
+
+    object_class_property_add(oc, "xen-gnttab-max-frames", "uint16",
+                              kvm_arch_get_xen_gnttab_max_frames,
+                              kvm_arch_set_xen_gnttab_max_frames,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "xen-gnttab-max-frames",
+                                          "Maximum number of grant table frames");
 }
 
 void kvm_set_max_apic_id(uint32_t max_apic_id)
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index ec82170261..c57620ca51 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -1235,6 +1235,12 @@ int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     return 0;
 }
 
+uint16_t kvm_xen_get_gnttab_max_frames(void)
+{
+    KVMState *s = KVM_STATE(current_accel());
+    return s->xen_gnttab_max_frames;
+}
+
 int kvm_put_xen_state(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
-- 
2.39.0


