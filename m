Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F04A6A4496
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:36:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeYq-0002cH-Lp; Mon, 27 Feb 2023 09:33:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00d7f2b94bb5c8854cf5+7127+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pWeVg-0005RC-3M
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:57 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00d7f2b94bb5c8854cf5+7127+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pWeVN-0004WS-64
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=zpE7NfUYMeb9QTKsxgYxtwFRUJK9W2TiNaQeyONMRtE=; b=SA63BEPBFJTFpT1lr2GtJnwElI
 mRC4e2XCQKqk0az8kFb9yoX9M7vu8VUftTBO3+j/pYCSKhxG8IFTSHqUdty+DV2vY33WiPudGdnvn
 3UJebcw0oB/37Uq/jL3MPAeS4YqC0qbtPT8iSGW6J4UsaU6mWZum9/Txci7hvFguDz00+jH0pHaM5
 bN+NplSaUgh1G2v0mXY9ZZX4AqXmbesPjvnXPgkuOQNMN4/VQKkiR+3cwuLh6i7wZSgik2jAqI2Oq
 3yWD6457LvbnqxvQAqhE3ndnA/OSH3nLsfTh+keohiUQl57VqzoqxZ3uSjPS0S3tnPQpA7pOosKXg
 mdq0tKYQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pWeV8-000AU3-6w; Mon, 27 Feb 2023 14:29:14 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pWeV8-0027EB-0b; Mon, 27 Feb 2023 14:29:14 +0000
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
Subject: [PATCH v14 58/60] kvm/i386: Add xen-evtchn-max-pirq property
Date: Mon, 27 Feb 2023 14:29:06 +0000
Message-Id: <20230227142908.503517-59-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227142908.503517-1-dwmw2@infradead.org>
References: <20230227142908.503517-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+00d7f2b94bb5c8854cf5+7127+infradead.org+dwmw2@casper.srs.infradead.org;
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

The default number of PIRQs is set to 256 to avoid issues with 32-bit MSI
devices. Allow it to be increased if the user desires.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 accel/kvm/kvm-all.c       |  1 +
 hw/i386/kvm/xen_evtchn.c  | 21 +++++++++++----------
 include/sysemu/kvm_int.h  |  1 +
 include/sysemu/kvm_xen.h  |  1 +
 target/i386/kvm/kvm.c     | 34 ++++++++++++++++++++++++++++++++++
 target/i386/kvm/xen-emu.c |  6 ++++++
 6 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index dc5b0bb434..3b7881e949 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3705,6 +3705,7 @@ static void kvm_accel_instance_init(Object *obj)
     s->notify_window = 0;
     s->xen_version = 0;
     s->xen_gnttab_max_frames = 64;
+    s->xen_evtchn_max_pirq = 256;
 }
 
 /**
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 1840ce0bef..75e55be0e7 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -302,17 +302,18 @@ void xen_evtchn_create(void)
     }
 
     /*
-     * We could parameterise the number of PIRQs available if needed,
-     * but for now limit it to 256. The Xen scheme for encoding PIRQ#
-     * into an MSI message is not compatible with 32-bit MSI, as it
-     * puts the high bits of the PIRQ# into the high bits of the MSI
-     * message address, instead of using the Extended Destination ID
-     * in address bits 4-11 which perhaps would have been a better
-     * choice. So to keep life simple, just stick with 256 as the
-     * default, which conveniently doesn't need to set anything
-     * outside the low 32 bits of the address.
+     * The Xen scheme for encoding PIRQ# into an MSI message is not
+     * compatible with 32-bit MSI, as it puts the high bits of the
+     * PIRQ# into the high bits of the MSI message address, instead of
+     * using the Extended Destination ID in address bits 4-11 which
+     * perhaps would have been a better choice.
+     *
+     * To keep life simple, kvm_accel_instance_init() initialises the
+     * default to 256. which conveniently doesn't need to set anything
+     * outside the low 32 bits of the address. It can be increased by
+     * setting the xen-evtchn-max-pirq property.
      */
-    s->nr_pirqs = 256;
+    s->nr_pirqs = kvm_xen_get_evtchn_max_pirq();
 
     s->nr_pirq_inuse_words = DIV_ROUND_UP(s->nr_pirqs, 64);
     s->pirq_inuse_bitmap = g_new0(uint64_t, s->nr_pirq_inuse_words);
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index 39ce4d36f6..a641c974ea 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -121,6 +121,7 @@ struct KVMState
     uint32_t xen_version;
     uint32_t xen_caps;
     uint16_t xen_gnttab_max_frames;
+    uint16_t xen_evtchn_max_pirq;
 };
 
 void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index b2aafaf7ab..595abfbe40 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -26,6 +26,7 @@ void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, int type);
 void kvm_xen_set_callback_asserted(void);
 int kvm_xen_set_vcpu_virq(uint32_t vcpu_id, uint16_t virq, uint16_t port);
 uint16_t kvm_xen_get_gnttab_max_frames(void);
+uint16_t kvm_xen_get_evtchn_max_pirq(void);
 
 #define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
                                  KVM_XEN_HVM_CONFIG_ ## cap))
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index b497225fbd..4decd2559b 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5907,6 +5907,33 @@ static void kvm_arch_set_xen_gnttab_max_frames(Object *obj, Visitor *v,
     s->xen_gnttab_max_frames = value;
 }
 
+static void kvm_arch_get_xen_evtchn_max_pirq(Object *obj, Visitor *v,
+                                             const char *name, void *opaque,
+                                             Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    uint16_t value = s->xen_evtchn_max_pirq;
+
+    visit_type_uint16(v, name, &value, errp);
+}
+
+static void kvm_arch_set_xen_evtchn_max_pirq(Object *obj, Visitor *v,
+                                             const char *name, void *opaque,
+                                             Error **errp)
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
+    s->xen_evtchn_max_pirq = value;
+}
+
 void kvm_arch_accel_class_init(ObjectClass *oc)
 {
     object_class_property_add_enum(oc, "notify-vmexit", "NotifyVMexitOption",
@@ -5939,6 +5966,13 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
                               NULL, NULL);
     object_class_property_set_description(oc, "xen-gnttab-max-frames",
                                           "Maximum number of grant table frames");
+
+    object_class_property_add(oc, "xen-evtchn-max-pirq", "uint16",
+                              kvm_arch_get_xen_evtchn_max_pirq,
+                              kvm_arch_set_xen_evtchn_max_pirq,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "xen-evtchn-max-pirq",
+                                          "Maximum number of Xen PIRQs");
 }
 
 void kvm_set_max_apic_id(uint32_t max_apic_id)
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 96a9082196..bad3131d08 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -1765,6 +1765,12 @@ uint16_t kvm_xen_get_gnttab_max_frames(void)
     return s->xen_gnttab_max_frames;
 }
 
+uint16_t kvm_xen_get_evtchn_max_pirq(void)
+{
+    KVMState *s = KVM_STATE(current_accel());
+    return s->xen_evtchn_max_pirq;
+}
+
 int kvm_put_xen_state(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
-- 
2.39.0


