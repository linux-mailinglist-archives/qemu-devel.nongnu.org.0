Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2884864FD24
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 01:08:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6hD4-0008Ee-5L; Sat, 17 Dec 2022 19:07:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p6hCm-0008CV-V7
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 19:07:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p6hCk-0001sm-Mk
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 19:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671322018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l9lbTFd1mcD6R3iKvDYN90sQlYkqt7eTwm6+gS8Z4XU=;
 b=W8802xgO2T3rjbd7J42ayoQ2gInkWqQ0G54Up6lrZGi989zSKN2iw4IWfTF8M17O0xSVoM
 rXMAFMsa0ImW1DYanMCT/2po9W5z/28/UxywvtpohTWVq5StNWGi6fdTdXaoeRlro1f3Eg
 iEcvt9ZmoYas9H8eTmrPXX8hVKF4ChI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-140-ia-bUiSrMBahMje8AIwQGw-1; Sat, 17 Dec 2022 19:06:56 -0500
X-MC-Unique: ia-bUiSrMBahMje8AIwQGw-1
Received: by mail-ed1-f72.google.com with SMTP id
 j11-20020aa7c40b000000b0046b45e2ff83so4088345edq.12
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 16:06:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l9lbTFd1mcD6R3iKvDYN90sQlYkqt7eTwm6+gS8Z4XU=;
 b=bHtAVJvjnuD6cR3rZei9Ejio0P8X744EDQmOud54NpibYrOD9mZb1O8UcUHhatOw8r
 9UWh00+5emF3NMKAo/P0LpPAv79z8tHGvy/nW0lvEPIWzRX1HacvaZ5d8kL+LbSVuOmW
 0zz/yAYKzYvw4UXsh9obKezOT6ZZYsFK7IJgo9ldVV76IrXHlwL9SpuL2sBqnDToYbJy
 i/DsuI5h0g7X5kKuRdOLteIdKulDajRXGmUYavbRbgIkGwPUgLk29XxRu7SzxXdbcOC3
 LawZevbuGS7Zdi/Z6H3orr6UiI0zaMgsqcHdaD+MolwjeTOkcovjSWDBlfJ+HEz2kWDn
 /45A==
X-Gm-Message-State: ANoB5pkaFAG5W7TjHa/1rxPrcMCNixGVBbpap8NoKqjZiLpUZD+FYoam
 Ge1v/cSJBdqFmGIOFGuEvcngcqBKTqO5AQPYVubYM9M6PbtcU3zXo/pCPfPq9CIaNRQWdUEl1EB
 ws+G4XxOZK8dfWmM6kiG8GyBroQeY/DeIibNSFd3K72yrWZ980hb3+4YoDR42Uckvp0o=
X-Received: by 2002:a05:6402:3644:b0:461:2288:6808 with SMTP id
 em4-20020a056402364400b0046122886808mr33360199edb.21.1671322014573; 
 Sat, 17 Dec 2022 16:06:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7U65OPq3JD9bf2hA91SrDYzxm9+uUugc/W8Oa/sIFzMaW9+nb5aLvUnR20skPX5Me7ng73pA==
X-Received: by 2002:a05:6402:3644:b0:461:2288:6808 with SMTP id
 em4-20020a056402364400b0046122886808mr33360188edb.21.1671322014196; 
 Sat, 17 Dec 2022 16:06:54 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a170906b01500b007ae1e528390sm2509734ejy.163.2022.12.17.16.06.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Dec 2022 16:06:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] KVM: remove support for kernel-irqchip=off
Date: Sun, 18 Dec 2022 01:06:46 +0100
Message-Id: <20221218000649.686882-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
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
 docs/about/removed-features.rst |  7 +++++++
 hw/i386/amd_iommu.c             |  2 +-
 hw/i386/intel_iommu.c           |  4 ++--
 include/hw/i386/apic_internal.h |  2 +-
 target/i386/cpu-sysemu.c        | 15 +++++++++++----
 6 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index b28f50b22fa9..f1575a52cb4d 100644
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
index 91c9dce6d6e0..76c2178cd39e 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -625,6 +625,13 @@ MIPS "Trap-and-Emulate" KVM support (removed in 8.0)
 The MIPS "Trap-and-Emulate" KVM host and guest support was removed
 from Linux in 2021, and is not supported anymore by QEMU either.
 
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


