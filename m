Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4885C6A8245
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:32:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi6E-0000t3-IZ; Thu, 02 Mar 2023 07:31:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5n-0000Pi-1a
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5k-0002zd-Q1
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Txe4M816XmIffZZqdC4SuhYSf44w2I/H7VuXLs++INg=;
 b=MQwrRSNxycXGl/l2Gost8oU+tiAO8D7VF9/t3D8ykobzYsqFbRq+f4R/GjBV3y7gz1uCbm
 YIzJLtO+LLnUfHNtsiMD50acdwQEME0jcrtoLNc0YTZKAJmYYSPO0dHjGo4mRCA0sl+iPA
 HoidRd3VOik9b/sKEEv3QCYC4Cx/1q4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-368-lHXiIVSlMhuIKwgdSjOLxQ-1; Thu, 02 Mar 2023 07:31:23 -0500
X-MC-Unique: lHXiIVSlMhuIKwgdSjOLxQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e9d0925341so5687407wmb.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Txe4M816XmIffZZqdC4SuhYSf44w2I/H7VuXLs++INg=;
 b=dgOlsyxzeV0o/TbAzMFMZyT0FmjO/Ux/l6FmfU9s7h3X/SH8XaKqxGus4r8ef7DgGG
 ao18krTzPYawIO9pj33XbOXb7Mn+HVDVQHUBz/tg+QksdfQ71Fso/brP9XuJKOC4A1uA
 ITLDXELr3FDXwHpoHueI9E3S1/F7LqvPgnMQZq1vIEwjwewBdkj0J1xDUoLuwgtjuQ5Q
 swIaDITsLF47OC0yNBWPrPGccZQbdbo02AfQq6pq1pvbM7tAS/JoIutlKE6FiqXBm/in
 VGChz2juiQUUBCjo3r2Bxo0YMQhVMUjPr6+HjgtH+JyZb6KnXKFOPGb8a2oopup0ztpV
 rxgw==
X-Gm-Message-State: AO0yUKV5kgnOfXAHQPbLjhz5FX2dbbOqCQoFkhgT9OVsJX3DlnHB0IdT
 GdA2wJRhowzCg3RdWnUZ4zbcX49IBPG3qkXGGlhLr9pJVxurjOW7j1CzHXbRQnsDRFUr9Wx+eJ2
 gx9eZql1eRuzNnR0iwHu2BJVKp8X2knm51lBljtFV5NgTRpw5AxIeRy6KpCH4kodiE/z+hOfptS
 s=
X-Received: by 2002:a05:600c:3296:b0:3eb:3971:a2aa with SMTP id
 t22-20020a05600c329600b003eb3971a2aamr7690274wmp.25.1677760281544; 
 Thu, 02 Mar 2023 04:31:21 -0800 (PST)
X-Google-Smtp-Source: AK7set/iWNJLOkdhRh1QzfSonnaAOQU6Ei09zlAJDVPiXnggfAK2bi8LcHfGZkkcNs6L/vxok+/KCQ==
X-Received: by 2002:a05:600c:3296:b0:3eb:3971:a2aa with SMTP id
 t22-20020a05600c329600b003eb3971a2aamr7690259wmp.25.1677760281301; 
 Thu, 02 Mar 2023 04:31:21 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c458900b003e1f6e18c95sm3130609wmo.21.2023.03.02.04.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 16/62] i386/xen: manage and save/restore Xen guest long_mode
 setting
Date: Thu,  2 Mar 2023 13:29:43 +0100
Message-Id: <20230302123029.153265-17-pbonzini@redhat.com>
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

Xen will "latch" the guest's 32-bit or 64-bit ("long mode") setting when
the guest writes the MSR to fill in the hypercall page, or when the guest
sets the event channel callback in HVM_PARAM_CALLBACK_IRQ.

KVM handles the former and sets the kernel's long_mode flag accordingly.
The latter will be handled in userspace. Keep them in sync by noticing
when a hypercall is made in a mode that doesn't match qemu's idea of
the guest mode, and resyncing from the kernel. Do that same sync right
before serialization too, in case the guest has set the hypercall page
but hasn't yet made a system call.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/kvm/xen_overlay.c | 62 +++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_overlay.h |  4 +++
 target/i386/kvm/xen-emu.c | 12 ++++++++
 3 files changed, 78 insertions(+)

diff --git a/hw/i386/kvm/xen_overlay.c b/hw/i386/kvm/xen_overlay.c
index a2441e2b4e4a..8685d879594e 100644
--- a/hw/i386/kvm/xen_overlay.c
+++ b/hw/i386/kvm/xen_overlay.c
@@ -44,6 +44,7 @@ struct XenOverlayState {
     MemoryRegion shinfo_mem;
     void *shinfo_ptr;
     uint64_t shinfo_gpa;
+    bool long_mode;
 };
 
 struct XenOverlayState *xen_overlay_singleton;
@@ -96,9 +97,21 @@ static void xen_overlay_realize(DeviceState *dev, Error **errp)
 
     s->shinfo_ptr = memory_region_get_ram_ptr(&s->shinfo_mem);
     s->shinfo_gpa = INVALID_GPA;
+    s->long_mode = false;
     memset(s->shinfo_ptr, 0, XEN_PAGE_SIZE);
 }
 
+static int xen_overlay_pre_save(void *opaque)
+{
+    /*
+     * Fetch the kernel's idea of long_mode to avoid the race condition
+     * where the guest has set the hypercall page up in 64-bit mode but
+     * not yet made a hypercall by the time migration happens, so qemu
+     * hasn't yet noticed.
+     */
+    return xen_sync_long_mode();
+}
+
 static int xen_overlay_post_load(void *opaque, int version_id)
 {
     XenOverlayState *s = opaque;
@@ -107,6 +120,9 @@ static int xen_overlay_post_load(void *opaque, int version_id)
         xen_overlay_do_map_page(&s->shinfo_mem, s->shinfo_gpa);
         xen_overlay_set_be_shinfo(s->shinfo_gpa >> XEN_PAGE_SHIFT);
     }
+    if (s->long_mode) {
+        xen_set_long_mode(true);
+    }
 
     return 0;
 }
@@ -121,9 +137,11 @@ static const VMStateDescription xen_overlay_vmstate = {
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = xen_overlay_is_needed,
+    .pre_save = xen_overlay_pre_save,
     .post_load = xen_overlay_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT64(shinfo_gpa, XenOverlayState),
+        VMSTATE_BOOL(long_mode, XenOverlayState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -208,3 +226,47 @@ void *xen_overlay_get_shinfo_ptr(void)
 
     return s->shinfo_ptr;
 }
+
+int xen_sync_long_mode(void)
+{
+    int ret;
+    struct kvm_xen_hvm_attr xa = {
+        .type = KVM_XEN_ATTR_TYPE_LONG_MODE,
+    };
+
+    if (!xen_overlay_singleton) {
+        return -ENOENT;
+    }
+
+    ret = kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_GET_ATTR, &xa);
+    if (!ret) {
+        xen_overlay_singleton->long_mode = xa.u.long_mode;
+    }
+
+    return ret;
+}
+
+int xen_set_long_mode(bool long_mode)
+{
+    int ret;
+    struct kvm_xen_hvm_attr xa = {
+        .type = KVM_XEN_ATTR_TYPE_LONG_MODE,
+        .u.long_mode = long_mode,
+    };
+
+    if (!xen_overlay_singleton) {
+        return -ENOENT;
+    }
+
+    ret = kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &xa);
+    if (!ret) {
+        xen_overlay_singleton->long_mode = xa.u.long_mode;
+    }
+
+    return ret;
+}
+
+bool xen_is_long_mode(void)
+{
+    return xen_overlay_singleton && xen_overlay_singleton->long_mode;
+}
diff --git a/hw/i386/kvm/xen_overlay.h b/hw/i386/kvm/xen_overlay.h
index 00cff05bb0fd..5c46a0b03659 100644
--- a/hw/i386/kvm/xen_overlay.h
+++ b/hw/i386/kvm/xen_overlay.h
@@ -17,4 +17,8 @@ void xen_overlay_create(void);
 int xen_overlay_map_shinfo_page(uint64_t gpa);
 void *xen_overlay_get_shinfo_ptr(void);
 
+int xen_sync_long_mode(void);
+int xen_set_long_mode(bool long_mode);
+bool xen_is_long_mode(void);
+
 #endif /* QEMU_XEN_OVERLAY_H */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index ebea27caf634..be6d85f2cb7b 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -20,6 +20,8 @@
 #include "trace.h"
 #include "sysemu/runstate.h"
 
+#include "hw/i386/kvm/xen_overlay.h"
+
 #include "hw/xen/interface/version.h"
 #include "hw/xen/interface/sched.h"
 
@@ -282,6 +284,16 @@ int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
         return -1;
     }
 
+    /*
+     * The kernel latches the guest 32/64 mode when the MSR is used to fill
+     * the hypercall page. So if we see a hypercall in a mode that doesn't
+     * match our own idea of the guest mode, fetch the kernel's idea of the
+     * "long mode" to remain in sync.
+     */
+    if (exit->u.hcall.longmode != xen_is_long_mode()) {
+        xen_sync_long_mode();
+    }
+
     if (!do_kvm_xen_handle_exit(cpu, exit)) {
         /*
          * Some hypercalls will be deliberately "implemented" by returning
-- 
2.39.1


