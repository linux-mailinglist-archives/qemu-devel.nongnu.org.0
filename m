Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF5F6535E3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:09:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Qz-0001o7-1B; Wed, 21 Dec 2022 13:03:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QS-0001PO-MT
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QR-0004QE-43
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mBXTBGajaokMJvdkoc0LkDvuy3n+VaY2gFUkXO8juRo=;
 b=Tg1/41R8ejI7FaeyFAGqQap38C6SOKF+gZqQhnx3Ua1YIQPKB0on5+1pL1SUAklb+Qwn0i
 CGSJ9EnYnjK/AAcfe6PIfxQgr8wo4KLc5uHX40+AdYbWqsSMeafHef1yUp7rpMeV9lYGlo
 7VsCSVMdENtBMQ+DbsQTG2C06nT96Wk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-380-p39R_vxzOP6M8EXFxEJmDw-1; Wed, 21 Dec 2022 13:02:39 -0500
X-MC-Unique: p39R_vxzOP6M8EXFxEJmDw-1
Received: by mail-ed1-f71.google.com with SMTP id
 y20-20020a056402271400b0046c9a6ec30fso11826310edd.14
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mBXTBGajaokMJvdkoc0LkDvuy3n+VaY2gFUkXO8juRo=;
 b=sGMjgOUR+wjy6udEYMALsLYu/0Ei53m2TGAX8KPYp+PIBBxqjpPp/K/LRSUvQ2VYLj
 upSrtXohTP9PyrI9JzekUSUt3Zgt/d8JoeKSFOhWNABhY9B4mQuoknmvmUbhMALv2m80
 W+hof9cN31D0li6KyRIKJJSpivjuhk97yj93UZ2FkyouCdY+tUIghNone5TZCmezz1Cp
 gsYermt77Yv/7Oq61JaYgaWBGTV7dNtLt0m7NxUb/cnRGnnq9OuO1UmF2O0LpXBex2bO
 Kv/xBlvP0KaSI+HGUg9gkDNR1C/PzYu6vsziAihMGTrJCQ5RZZ1U27aYicJvzL1Ijl8Y
 ScCw==
X-Gm-Message-State: AFqh2kowrldQ3TY2AIZMg+aYV1vq0ro62/LZ4329FHsxcSc7Pot7y41j
 CKdy/MZufmcE7TVCFL77RkXBKCc9Jp14ULjIcX1b3XgxDI0IQgNfOZIYJtpkS6W58pwcFQ/Q+0T
 mIRSNCOlmI+Y10FYSQHrrvboAFhvxEQk/DaJN1MdgrIXNTkYgafIYcWjb+SZFXtu37/M=
X-Received: by 2002:aa7:db53:0:b0:45c:835c:c6d0 with SMTP id
 n19-20020aa7db53000000b0045c835cc6d0mr2226366edt.1.1671645757496; 
 Wed, 21 Dec 2022 10:02:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsxw6kZ7+op+G3lb/5o5VC7AQ4s53+S420ySuAN/3IkV3xkGunyv8Zokxo+38FJRnOrj71/gA==
X-Received: by 2002:aa7:db53:0:b0:45c:835c:c6d0 with SMTP id
 n19-20020aa7db53000000b0045c835cc6d0mr2226348edt.1.1671645757215; 
 Wed, 21 Dec 2022 10:02:37 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a1709060cca00b00829e391b9ffsm3921080ejh.84.2022.12.21.10.02.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/24] KVM: remove support for kernel-irqchip=off
Date: Wed, 21 Dec 2022 19:01:37 +0100
Message-Id: <20221221180141.839616-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
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

-machine kernel-irqchip=off is broken for many guest OSes; kernel-irqchip=split
is the replacement that works, so remove the deprecated support for the former.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/deprecated.rst       |  7 -------
 docs/about/removed-features.rst | 10 ++++++++++
 hw/i386/amd_iommu.c             |  2 +-
 hw/i386/intel_iommu.c           |  4 ++--
 include/hw/i386/apic_internal.h |  2 +-
 target/i386/cpu-sysemu.c        | 15 +++++++++++----
 6 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 93affe3669ff..5414289ffaf3 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -58,13 +58,6 @@ and will cause a warning.
 The replacement for the ``nodelay`` short-form boolean option is ``nodelay=on``
 rather than ``delay=off``.
 
-Userspace local APIC with KVM (x86, since 6.0)
-''''''''''''''''''''''''''''''''''''''''''''''
-
-Using ``-M kernel-irqchip=off`` with x86 machine types that include a local
-APIC is deprecated.  The ``split`` setting is supported, as is using
-``-M kernel-irqchip=off`` with the ISA PC machine type.
-
 hexadecimal sizes with scaling multipliers (since 6.0)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 7e12145c120d..78b332faf50a 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -616,6 +616,16 @@ x86 ``Icelake-Client`` CPU (removed in 7.1)
 There isn't ever Icelake Client CPU, it is some wrong and imaginary one.
 Use ``Icelake-Server`` instead.
 
+System accelerators
+-------------------
+
+Userspace local APIC with KVM (x86, removed 8.0)
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+``-M kernel-irqchip=off`` cannot be used on KVM if the CPU model includes
+a local APIC.  The ``split`` setting is supported, as is using ``-M
+kernel-irqchip=off`` when the CPU does not have a local APIC.
+
 System emulator machines
 ------------------------
 
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 725f69095b9e..bcd016f5c5a5 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1368,7 +1368,7 @@ static MemTxResult amdvi_mem_ir_write(void *opaque, hwaddr addr,
         return MEMTX_ERROR;
     }
 
-    apic_get_class()->send_msi(&to);
+    apic_get_class(NULL)->send_msi(&to);
 
     trace_amdvi_mem_ir_write(to.address, to.data);
     return MEMTX_OK;
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index a08ee85edf2a..98a5c304a7d7 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -396,7 +396,7 @@ static void vtd_generate_interrupt(IntelIOMMUState *s, hwaddr mesg_addr_reg,
 
     trace_vtd_irq_generate(msi.address, msi.data);
 
-    apic_get_class()->send_msi(&msi);
+    apic_get_class(NULL)->send_msi(&msi);
 }
 
 /* Generate a fault event to software via MSI if conditions are met.
@@ -3529,7 +3529,7 @@ static MemTxResult vtd_mem_ir_write(void *opaque, hwaddr addr,
         return MEMTX_ERROR;
     }
 
-    apic_get_class()->send_msi(&to);
+    apic_get_class(NULL)->send_msi(&to);
 
     return MEMTX_OK;
 }
diff --git a/include/hw/i386/apic_internal.h b/include/hw/i386/apic_internal.h
index c175e7e71816..968b6648b3a4 100644
--- a/include/hw/i386/apic_internal.h
+++ b/include/hw/i386/apic_internal.h
@@ -226,6 +226,6 @@ static inline int apic_get_bit(uint32_t *tab, int index)
     return !!(tab[i] & mask);
 }
 
-APICCommonClass *apic_get_class(void);
+APICCommonClass *apic_get_class(Error **errp);
 
 #endif /* QEMU_APIC_INTERNAL_H */
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index fc97213a73cf..28115edf44f7 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -247,12 +247,16 @@ void x86_cpu_machine_reset_cb(void *opaque)
     cpu_reset(CPU(cpu));
 }
 
-APICCommonClass *apic_get_class(void)
+APICCommonClass *apic_get_class(Error **errp)
 {
     const char *apic_type = "apic";
 
     /* TODO: in-kernel irqchip for hvf */
-    if (kvm_apic_in_kernel()) {
+    if (kvm_enabled()) {
+        if (!kvm_apic_in_kernel()) {
+            error_setg(errp, "KVM does not support userspace APIC");
+            return NULL;
+        }
         apic_type = "kvm-apic";
     } else if (xen_enabled()) {
         apic_type = "xen-apic";
@@ -266,10 +270,13 @@ APICCommonClass *apic_get_class(void)
 void x86_cpu_apic_create(X86CPU *cpu, Error **errp)
 {
     APICCommonState *apic;
-    ObjectClass *apic_class = OBJECT_CLASS(apic_get_class());
+    APICCommonClass *apic_class = apic_get_class(errp);
 
-    cpu->apic_state = DEVICE(object_new_with_class(apic_class));
+    if (!apic_class) {
+        return;
+    }
 
+    cpu->apic_state = DEVICE(object_new_with_class(OBJECT_CLASS(apic_class)));
     object_property_add_child(OBJECT(cpu), "lapic",
                               OBJECT(cpu->apic_state));
     object_unref(OBJECT(cpu->apic_state));
-- 
2.38.1


