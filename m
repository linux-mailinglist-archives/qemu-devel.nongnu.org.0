Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56956A827D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:42:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiAC-0005mi-9q; Thu, 02 Mar 2023 07:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6z-0002g3-OT
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi6y-0003LH-3p
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:32:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=57EiPY489a/W7S1NewslxP2EKb/16URbgqcakb48AwA=;
 b=Q3EWVB5U3s6pNvlJznCTcwGOu8oB2kAHoJwi6Owv3PV2Bw6Fn5axwGthLP91kaPsWifp5T
 vhTH8rj0iCc7Bgxl9aA8Ne/Wtrs2QtAwWPAWF5pGgUf4umS6uHhdCAHNBtLIsldSsnPurG
 LpB+4RUJV3DxAjJlxjQOfvAMe6qT04o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-Bq1KX90IP3amjiNtJAmw1g-1; Thu, 02 Mar 2023 07:32:38 -0500
X-MC-Unique: Bq1KX90IP3amjiNtJAmw1g-1
Received: by mail-wm1-f69.google.com with SMTP id
 e17-20020a05600c219100b003e21fa60ec1so1019847wme.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:32:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=57EiPY489a/W7S1NewslxP2EKb/16URbgqcakb48AwA=;
 b=Snt0FRU97Imde8hVpLljWieHQdbkImLlkRDf6wCoXpbsZBZx1wcxuHNkJjH+zcCOpk
 o5fvaMr+3P39jeZ2C7U8HRTBeEWQC8h4Ug2aex/EnKq5aNeC1rjHHgY2g39C3s/nvpr7
 PDJQKPelgwHIqVtI4H4bYMiXO/7++hGveBRlJsFMx41gA5nUqSByitMcinuAZ+QoRgxO
 0Sq1RG0QlYiGSA2TA1T2b4L0IN7MrOxvoxe+Ec7fnyHGFzegmnYzXNamvApcj+E5fyLX
 wnoNSLqjmq3X/3PD/DunlGu9bVYKnZv6xNgIq9+ZuGUHZumBZbPa0toVI5LuMYYyS5/I
 DK1A==
X-Gm-Message-State: AO0yUKVGLyXqlBd1oaMe08poMhwdRqhU4XSajy+026+U897QkjOurmwB
 Qf55ss5y+vqba5XC4HekRn2Eak8n5Sloh4EVCMI5WfYAJmPeBbfIXAc0jtT2X7TaOd1fiKjb34L
 1/zeDJWpO9wIBHwttvP2/iGdTY75VHPmfYhAQ/g4ZEvZgUd6KrfUzENXACBzSlZF5CZLUgwpn7D
 k=
X-Received: by 2002:adf:d0cb:0:b0:2c5:76bd:c0f3 with SMTP id
 z11-20020adfd0cb000000b002c576bdc0f3mr7551661wrh.6.1677760356491; 
 Thu, 02 Mar 2023 04:32:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8Qqh8DuUylGvaMSEhRmjQ6NXyusIY5snskLG4JsbQlJW0Iv/hfUzS6S6JfBC5yWfTSewMT/A==
X-Received: by 2002:adf:d0cb:0:b0:2c5:76bd:c0f3 with SMTP id
 z11-20020adfd0cb000000b002c576bdc0f3mr7551648wrh.6.1677760356195; 
 Thu, 02 Mar 2023 04:32:36 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a5d4b86000000b002c5691f13eesm14996988wrt.50.2023.03.02.04.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:32:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 42/62] kvm/i386: Add xen-gnttab-max-frames property
Date: Thu,  2 Mar 2023 13:30:09 +0100
Message-Id: <20230302123029.153265-43-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 511d3eb9a0da..3d8e400bbf86 100644
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
index 7f945bc7633e..39ce4d36f684 100644
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
index 2b200302810b..49afa0eb9e43 100644
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
index 3c3795506dbe..a73c49aabba5 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5880,6 +5880,33 @@ static void kvm_arch_set_xen_version(Object *obj, Visitor *v,
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
@@ -5905,6 +5932,13 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
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
index 9e22c9fa025f..46be63172686 100644
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
2.39.1


