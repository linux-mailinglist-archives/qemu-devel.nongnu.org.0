Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96BF676715
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 16:21:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJFf3-0002B1-Vi; Sat, 21 Jan 2023 10:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFf1-00029X-U0; Sat, 21 Jan 2023 10:20:03 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFf0-0005ep-0R; Sat, 21 Jan 2023 10:20:03 -0500
Received: by mail-ej1-x62e.google.com with SMTP id v6so20786083ejg.6;
 Sat, 21 Jan 2023 07:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tU6Jk+zwzPrJt9pMjO3BEjB9c4BsylYnyegphPxSBBg=;
 b=j1r6QEpqf6JxItl0apZ3bIAsmhmFVViUxmDS0kmmK1a32byIngk9+qvUc3bNWUzhCt
 dav7NMOiSlV9Py0djShtEK+JBZI7zovLfq/ycNx6xoiQLP5MRCA7jZZ1Hvmki0Eyt1Bf
 HiUvltM7PAsc+l33HPlckNv/9/SLcSB9pDxz1wiQsGZhc/b3lwUIA17nIf0ZgCbL2ZUf
 ipzysSoxGpaYli9oih5g8VSWFZrC7DWCJds9lWyN+FlHGf637d5nvP0i2ywetSQ6nwOa
 x0bsf7HUPd5qONNjQAMlPb20kkfeH9g2z+6ojZApCbI3Cd0S6gvckkQCRWj/UOVzhcu5
 43pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tU6Jk+zwzPrJt9pMjO3BEjB9c4BsylYnyegphPxSBBg=;
 b=p0U/hNM80HzDSqAmYrI/0NMPw095ab8PXuGMOw0SyxRi7t+tMlR4TT2B76ycZsn5rB
 CgOvjNzmaP8F/yRjA8vaM7s/SMk9ky2aS4UK8AqrXKcC6ezMURkGzxu3RJYANxed8Cd6
 go/8S6bZ4109tab26QQdplVD7v6LJn//j7zmc1qRypllAZwS3VLo8azqfpca02sJcth9
 bcvT8q6mcWFlQuuE2XoY1RaJNpxEnmRb8qpe259vX6/myHwbwgRwA5lV7hLbXzJ4Mdnn
 POoVs/uzUKIrZDxLHasuNNVRgFae+bYpRKUd8Aw9Qwx367r2l7/ehexuc1qxO3mWovGu
 W6zg==
X-Gm-Message-State: AFqh2koQKDnFdeTkipqJ7M8up5cHrYIsw1APRiZvhScBjg493KPPsJZI
 tL3cw1w/xq5o553dsDegavfBMjn297LLgg==
X-Google-Smtp-Source: AMrXdXs0a1hYuVlbN93yMdgia4pXvyQHuSvzV7IWIP8XjU1wIkJpoNJoDcrnCf4wMBMg38PTd/S8bA==
X-Received: by 2002:a17:907:20a1:b0:870:23c5:8a81 with SMTP id
 pw1-20020a17090720a100b0087023c58a81mr20677826ejb.41.1674314400550; 
 Sat, 21 Jan 2023 07:20:00 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906101400b0085ff05d5dbdsm14162567ejm.173.2023.01.21.07.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 07:20:00 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 7/7] hw/i386/pc: Unexport pc_madt_cpu_entry()
Date: Sat, 21 Jan 2023 16:19:41 +0100
Message-Id: <20230121151941.24120-8-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121151941.24120-1-shentey@gmail.com>
References: <20230121151941.24120-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

pc_madt_cpu_entry() is now only used in target/i386/cpu, so move it
there, and unexport and rename it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/i386/pc.h    |  4 ----
 hw/acpi/acpi-x86-stub.c |  6 ------
 hw/i386/acpi-common.c   | 33 ---------------------------------
 target/i386/cpu.c       | 37 +++++++++++++++++++++++++++++++++++--
 4 files changed, 35 insertions(+), 45 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 66e3d059ef..9ab1818812 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -191,10 +191,6 @@ bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
                                int *data_len);
 void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
 
-/* hw/i386/acpi-common.c */
-void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
-                       GArray *entry, bool force_enabled);
-
 /* sgx.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
 
diff --git a/hw/acpi/acpi-x86-stub.c b/hw/acpi/acpi-x86-stub.c
index d0d399d26b..9662a594ad 100644
--- a/hw/acpi/acpi-x86-stub.c
+++ b/hw/acpi/acpi-x86-stub.c
@@ -1,12 +1,6 @@
 #include "qemu/osdep.h"
-#include "hw/i386/pc.h"
 #include "hw/i386/acpi-build.h"
 
-void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
-                       GArray *entry, bool force_enabled)
-{
-}
-
 Object *acpi_get_i386_pci_host(void)
 {
        return NULL;
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 0d1a2bb8aa..0041623aeb 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -28,44 +28,11 @@
 #include "hw/acpi/acpi_cpu_interface.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/utils.h"
-#include "hw/i386/pc.h"
 #include "target/i386/cpu.h"
 
 #include "acpi-build.h"
 #include "acpi-common.h"
 
-void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
-                       GArray *entry, bool force_enabled)
-{
-    uint32_t apic_id = apic_ids->cpus[uid].arch_id;
-    /* Flags – Local APIC Flags */
-    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
-                     1 /* Enabled */ : 0;
-
-    /* ACPI spec says that LAPIC entry for non present
-     * CPU may be omitted from MADT or it must be marked
-     * as disabled. However omitting non present CPU from
-     * MADT breaks hotplug on linux. So possible CPUs
-     * should be put in MADT but kept disabled.
-     */
-    if (apic_id < 255) {
-        /* Rev 1.0b, Table 5-13 Processor Local APIC Structure */
-        build_append_int_noprefix(entry, 0, 1);       /* Type */
-        build_append_int_noprefix(entry, 8, 1);       /* Length */
-        build_append_int_noprefix(entry, uid, 1);     /* ACPI Processor ID */
-        build_append_int_noprefix(entry, apic_id, 1); /* APIC ID */
-        build_append_int_noprefix(entry, flags, 4); /* Flags */
-    } else {
-        /* Rev 4.0, 5.2.12.12 Processor Local x2APIC Structure */
-        build_append_int_noprefix(entry, 9, 1);       /* Type */
-        build_append_int_noprefix(entry, 16, 1);      /* Length */
-        build_append_int_noprefix(entry, 0, 2);       /* Reserved */
-        build_append_int_noprefix(entry, apic_id, 4); /* X2APIC ID */
-        build_append_int_noprefix(entry, flags, 4);   /* Flags */
-        build_append_int_noprefix(entry, uid, 4);     /* ACPI Processor UID */
-    }
-}
-
 static void build_ioapic(GArray *entry, uint8_t id, uint32_t addr, uint32_t irq)
 {
     /* Rev 1.0b, 5.2.8.2 IO APIC */
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6ac50506a7..b05062bc57 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -38,8 +38,8 @@
 #ifndef CONFIG_USER_ONLY
 #include "exec/address-spaces.h"
 #include "hw/acpi/acpi_cpu_interface.h"
+#include "hw/acpi/aml-build.h"
 #include "hw/boards.h"
-#include "hw/i386/pc.h"
 #include "hw/i386/sgx-epc.h"
 #endif
 
@@ -7108,6 +7108,39 @@ static const struct SysemuCPUOps i386_sysemu_ops = {
     .write_elf64_qemunote = x86_cpu_write_elf64_qemunote,
     .legacy_vmsd = &vmstate_x86_cpu,
 };
+
+static void x86_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
+                               GArray *entry, bool force_enabled)
+{
+    uint32_t apic_id = apic_ids->cpus[uid].arch_id;
+    /* Flags – Local APIC Flags */
+    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
+                     1 /* Enabled */ : 0;
+
+    /*
+     * ACPI spec says that LAPIC entry for non present
+     * CPU may be omitted from MADT or it must be marked
+     * as disabled. However omitting non present CPU from
+     * MADT breaks hotplug on linux. So possible CPUs
+     * should be put in MADT but kept disabled.
+     */
+    if (apic_id < 255) {
+        /* Rev 1.0b, Table 5-13 Processor Local APIC Structure */
+        build_append_int_noprefix(entry, 0, 1);       /* Type */
+        build_append_int_noprefix(entry, 8, 1);       /* Length */
+        build_append_int_noprefix(entry, uid, 1);     /* ACPI Processor ID */
+        build_append_int_noprefix(entry, apic_id, 1); /* APIC ID */
+        build_append_int_noprefix(entry, flags, 4); /* Flags */
+    } else {
+        /* Rev 4.0, 5.2.12.12 Processor Local x2APIC Structure */
+        build_append_int_noprefix(entry, 9, 1);       /* Type */
+        build_append_int_noprefix(entry, 16, 1);      /* Length */
+        build_append_int_noprefix(entry, 0, 2);       /* Reserved */
+        build_append_int_noprefix(entry, apic_id, 4); /* X2APIC ID */
+        build_append_int_noprefix(entry, flags, 4);   /* Flags */
+        build_append_int_noprefix(entry, uid, 4);     /* ACPI Processor UID */
+    }
+}
 #endif
 
 static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
@@ -7143,7 +7176,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &i386_sysemu_ops;
-    acpuac->madt_cpu = pc_madt_cpu_entry;
+    acpuac->madt_cpu = x86_madt_cpu_entry;
 #endif /* !CONFIG_USER_ONLY */
 
     cc->gdb_arch_name = x86_gdb_arch_name;
-- 
2.39.1


