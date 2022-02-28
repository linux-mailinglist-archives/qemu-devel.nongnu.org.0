Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BDD4C708D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 16:27:45 +0100 (CET)
Received: from localhost ([::1]:58460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOhw8-0000n3-BC
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 10:27:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nOhvC-0008PD-AB
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 10:26:46 -0500
Received: from [2607:f8b0:4864:20::62a] (port=46857
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nOhvA-00019t-A7
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 10:26:46 -0500
Received: by mail-pl1-x62a.google.com with SMTP id bd1so10987584plb.13
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 07:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j1pq6yAhgyTc3D0DQwZJ/Dhw/8RhskbShXKcbPDwvUA=;
 b=CPuYhvkBoxyjGlHT8fKg5RuZHqAuVlyPc0pwDmX4lZ1O1lT7roiIHyKuAc7+SobHZK
 t8O3xHqNC8FHqgVtxu31G5Q5rFrjQvlZbXp1C2cWMI/b3F3TqmSfIrejYbsTB8yrNpLf
 kIVWg0uPYn8T1J8ljls7lLS2FhajcVMJzAffx962glRa85jzIIbBJnj6dSe3+e04uQsw
 n/zU6VnyMswHAC2kFIS6swMDirTahtBald2uelTeBp2I0D+8YaAowhEVy01hMDiawNYN
 2ALWAAP5zN8G5VKHHYpE1Ke6l1BTAzfNCJQm0u7JKIhHnMk0w/zoleKqmge9qAe3LLgA
 zMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j1pq6yAhgyTc3D0DQwZJ/Dhw/8RhskbShXKcbPDwvUA=;
 b=osw7FFq1GDfPXQGVrvRZ91PWhwbs6WerTbP+RSI5Kg6ogRkMAMBYO5X5bGwL46cUMl
 O3L4vFy4hLQoD8x/Z6MLtHFlcckitiSHohKPSlyEYJ0UQdAjU2H4aOSc8+A7LZgQL81N
 mLFPfTy0BvDv3cDUU0OJNg44hQ2HG/EFOrstB4SYwgcIs9Ty8O07KifhGlqhYPGwfptP
 +UxlswQyGWpU7oo8ZifJyBPulYNxk6dxFchhlUbnm9bTABv51jB91gTJ+evHmSBzeuEj
 SlTo64wBqR5f1EI/gXLOvxBiQt2plCuZRLeUg7tswIZhQfpeUzr2IU8VsGvi/3F/tff/
 81HA==
X-Gm-Message-State: AOAM532E/091XWZMjg46jsYauY70BdT3SDoBb5oAshevjgakXynQoxc/
 gJWgpxWmFR0aQ4kW56eTftyE6g==
X-Google-Smtp-Source: ABdhPJwe/7mi+clX2Iuc8thL+fu/Yyyq+XgEq6JgrDikvFLq5yBCn60ps8HLDcOKKElDXWYIKJpm5g==
X-Received: by 2002:a17:902:d4cc:b0:151:3857:817b with SMTP id
 o12-20020a170902d4cc00b001513857817bmr15400124plg.139.1646062002704; 
 Mon, 28 Feb 2022 07:26:42 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.126.73])
 by smtp.googlemail.com with ESMTPSA id
 b1-20020a17090aa58100b001bcb7bad374sm14482211pjq.17.2022.02.28.07.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 07:26:42 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sergio Lopez <slp@redhat.com>
Subject: [RFC PATCH] hw/i386/e820: remove legacy reserved entries for e820
Date: Mon, 28 Feb 2022 20:56:20 +0530
Message-Id: <20220228152620.1474806-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

e820 reserved entries were used before the dynamic entries with fw config files
were intoduced into qemu with the following change:
7d67110f2d9a6("pc: add etc/e820 fw_cfg file")

Identical support was introduced into seabios as well with the following commit:
ce39bd4031820 ("Add support for etc/e820 fw_cfg file")

Both the above commits are now quite old. Seabios uses fw config files and
dynamic e820 entries by default and only falls back to using reserved entries
when it has to work with old qemu (versions earlier than 1.7). Please see
functions qemu_cfg_e820() and qemu_early_e820(). It is safe to remove legacy
FW_CFG_E820_TABLE and associated code. It would be incredibly rare to run the
latest qemu version with a very old version of seabios that did not support
fw config files for e820.

As far as I could see, edk2/ovfm never supported reserved entries and uses fw
config files from the beginning. So there should be no incompatibilities with
ovfm as well.

CC: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/i386/e820_memory_layout.c | 20 +-------------------
 hw/i386/e820_memory_layout.h |  8 --------
 hw/i386/fw_cfg.c             |  3 ---
 hw/i386/fw_cfg.h             |  1 -
 hw/i386/microvm.c            |  2 --
 5 files changed, 1 insertion(+), 33 deletions(-)

diff --git a/hw/i386/e820_memory_layout.c b/hw/i386/e820_memory_layout.c
index bcf9eaf837..06970ac44a 100644
--- a/hw/i386/e820_memory_layout.c
+++ b/hw/i386/e820_memory_layout.c
@@ -11,29 +11,11 @@
 #include "e820_memory_layout.h"
 
 static size_t e820_entries;
-struct e820_table e820_reserve;
 struct e820_entry *e820_table;
 
 int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
 {
-    int index = le32_to_cpu(e820_reserve.count);
-    struct e820_entry *entry;
-
-    if (type != E820_RAM) {
-        /* old FW_CFG_E820_TABLE entry -- reservations only */
-        if (index >= E820_NR_ENTRIES) {
-            return -EBUSY;
-        }
-        entry = &e820_reserve.entry[index++];
-
-        entry->address = cpu_to_le64(address);
-        entry->length = cpu_to_le64(length);
-        entry->type = cpu_to_le32(type);
-
-        e820_reserve.count = cpu_to_le32(index);
-    }
-
-    /* new "etc/e820" file -- include ram too */
+    /* new "etc/e820" file -- include ram and reserved entries */
     e820_table = g_renew(struct e820_entry, e820_table, e820_entries + 1);
     e820_table[e820_entries].address = cpu_to_le64(address);
     e820_table[e820_entries].length = cpu_to_le64(length);
diff --git a/hw/i386/e820_memory_layout.h b/hw/i386/e820_memory_layout.h
index 2a0ceb8b9c..daf41cc4b4 100644
--- a/hw/i386/e820_memory_layout.h
+++ b/hw/i386/e820_memory_layout.h
@@ -16,20 +16,12 @@
 #define E820_NVS        4
 #define E820_UNUSABLE   5
 
-#define E820_NR_ENTRIES 16
-
 struct e820_entry {
     uint64_t address;
     uint64_t length;
     uint32_t type;
 } QEMU_PACKED __attribute((__aligned__(4)));
 
-struct e820_table {
-    uint32_t count;
-    struct e820_entry entry[E820_NR_ENTRIES];
-} QEMU_PACKED __attribute((__aligned__(4)));
-
-extern struct e820_table e820_reserve;
 extern struct e820_entry *e820_table;
 
 int e820_add_entry(uint64_t address, uint64_t length, uint32_t type);
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index a283785a8d..72a42f3c66 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -36,7 +36,6 @@ const char *fw_cfg_arch_key_name(uint16_t key)
         {FW_CFG_ACPI_TABLES, "acpi_tables"},
         {FW_CFG_SMBIOS_ENTRIES, "smbios_entries"},
         {FW_CFG_IRQ0_OVERRIDE, "irq0_override"},
-        {FW_CFG_E820_TABLE, "e820_table"},
         {FW_CFG_HPET, "hpet"},
     };
 
@@ -127,8 +126,6 @@ FWCfgState *fw_cfg_arch_create(MachineState *ms,
 #endif
     fw_cfg_add_i32(fw_cfg, FW_CFG_IRQ0_OVERRIDE, 1);
 
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_E820_TABLE,
-                     &e820_reserve, sizeof(e820_reserve));
     fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
                     sizeof(struct e820_entry) * e820_get_num_entries());
 
diff --git a/hw/i386/fw_cfg.h b/hw/i386/fw_cfg.h
index 275f15c1c5..86ca7c1c0c 100644
--- a/hw/i386/fw_cfg.h
+++ b/hw/i386/fw_cfg.h
@@ -17,7 +17,6 @@
 #define FW_CFG_ACPI_TABLES      (FW_CFG_ARCH_LOCAL + 0)
 #define FW_CFG_SMBIOS_ENTRIES   (FW_CFG_ARCH_LOCAL + 1)
 #define FW_CFG_IRQ0_OVERRIDE    (FW_CFG_ARCH_LOCAL + 2)
-#define FW_CFG_E820_TABLE       (FW_CFG_ARCH_LOCAL + 3)
 #define FW_CFG_HPET             (FW_CFG_ARCH_LOCAL + 4)
 
 FWCfgState *fw_cfg_arch_create(MachineState *ms,
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 4b3b1dd262..f2101e7293 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -324,8 +324,6 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, machine->smp.max_cpus);
     fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
     fw_cfg_add_i32(fw_cfg, FW_CFG_IRQ0_OVERRIDE, 1);
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_E820_TABLE,
-                     &e820_reserve, sizeof(e820_reserve));
     fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
                     sizeof(struct e820_entry) * e820_get_num_entries());
 
-- 
2.25.1


