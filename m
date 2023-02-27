Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E55E6A44F6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:44:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeYF-0001UT-VF; Mon, 27 Feb 2023 09:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6644499f1bfadfc93882+7127+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pWeVn-0006L5-Q0
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:58 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+6644499f1bfadfc93882+7127+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pWeVX-0004aw-Ab
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=lEVYqh+Ron0TgGlcAnQ6tS5jhj9zJABm2A7GkgVZk7g=; b=LUYZxEQ3uRqwJZZkizT3zPGmA/
 Y+5loSEMZk9IHAVkjQtbqP3VOjuRlidEVc9qt6obfxLvPfPZVEo7VhMPMPDlp7MxQFNRNrqUO0lZi
 XTPM5j3whY6pu44DOvvFOc7sK7LuLcvOmpIY7JXmEzOJhgi/wU4uotdIfRifhvw4gMfjZ37VOT58L
 EyqFb96oVgPgs+jJLlS0WjlDo5/90rhwovsC9VtkEGd8KYmsA8SUaajmiFXfZ1KcIw+TwuAwld5QS
 9SJIPmRWA6oMt3cpv9ZHbwbnOJGeZ80ILDeCKQ8zDY0rmZKrpqd2fObYMSY+tdwZ65Ai/qLTZs7xp
 P6umCmdA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pWeV7-00EFCL-19; Mon, 27 Feb 2023 14:29:23 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pWeV7-0027D1-0l; Mon, 27 Feb 2023 14:29:13 +0000
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
Subject: [PATCH v14 42/60] kvm/i386: Add xen-gnttab-max-frames property
Date: Mon, 27 Feb 2023 14:28:50 +0000
Message-Id: <20230227142908.503517-43-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227142908.503517-1-dwmw2@infradead.org>
References: <20230227142908.503517-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+6644499f1bfadfc93882+7127+infradead.org+dwmw2@desiato.srs.infradead.org;
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
index 2b20030281..49afa0eb9e 100644
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
index 9e22c9fa02..46be631726 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -1238,6 +1238,12 @@ int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
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


