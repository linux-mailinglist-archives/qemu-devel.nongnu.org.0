Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0CF5A754C
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 06:54:41 +0200 (CEST)
Received: from localhost ([::1]:56668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTFkN-0005gG-SX
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 00:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oTFjL-0004Kx-9j
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 00:53:35 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:39658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oTFjJ-0000W1-4v
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 00:53:34 -0400
Received: by mail-pg1-x530.google.com with SMTP id q9so12537702pgq.6
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 21:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=5S1k0UfW7PcX5X7JTXkjd9XtAaVsCGqGjoGRP8StfjU=;
 b=Jhe97V/7Y/aYkZ3nOAnipzTSRRRadCJt4G+LubWEC6gNfgj7LuFRzYEtDFfCSL7XT0
 YG0EvcJeQ7oJyc8VBaN3+o0blE2fyMRD2jsl03EL67JR1ybYkYdPyncFXPGtqIzbSo3q
 6z7AuEooSlm+MzobYM6RXvNNjUnS2ikBD+QMdZYsxWgzt1UMiuKKjOcCPG9XSPIL3jP/
 6WPQcCsYfqIzb/X9504ucX7VShRTyLCQZfS8oqwdHWWIgi0FdDVQ5QAOWmx8wEklnA/u
 /LSG+U0urqQPFnnIYN9yA765RCD+vi0NY5nuO94SK6ikuwVBzIaOwSkjQLCqB6TeQeW0
 HuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=5S1k0UfW7PcX5X7JTXkjd9XtAaVsCGqGjoGRP8StfjU=;
 b=GztYQbUjXCtL8BYmTOdetaTKpMJnDapJYfS9AdaQ8XxcX12QChvN9RvcvpXIzaxH9U
 7TaS72zlGgH92hU8Z/COPDZKAxm3HpCx+BZs5Y0UHWZz6B21EDmIqEEaS2ACHbEYWWls
 6rhIM+dbm8QR1dwt22AbT/g7QGqOJBZLXmo3UtGI+C1UVJrEdq+vltd7MS7HfP9kBqPM
 mkZwT8lU1bBWwOo1AY+awqkR8MyLlQfEfO5cmZ0sMjnVWX7h8xK57pNikwK8X7d8Af0W
 6LZv2wYDnTBb/LpgW/F8RZYtd/xI8GrtKp4h9ORdFb7mZSJ5Hm5dBspcxDsPstOOmCh8
 RmTg==
X-Gm-Message-State: ACgBeo1zgaXf+ROhnU2QjVilfdVKFfwaig+ScAGRN/Ld/BKjgFlxt56V
 27Fz07jB6WnRMeCXvVN2ZWgeyQ==
X-Google-Smtp-Source: AA6agR63fYYJuUTr79xiYmN/gllt7M9oO5FYTBUQbJxUKibNEn5YoSi1oIZX3grb4Tyy8X10vicfpg==
X-Received: by 2002:a63:3509:0:b0:42b:15a6:8267 with SMTP id
 c9-20020a633509000000b0042b15a68267mr20742051pga.570.1661921610956; 
 Tue, 30 Aug 2022 21:53:30 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.233.36])
 by smtp.googlemail.com with ESMTPSA id
 g12-20020a65594c000000b003fdc16f5de2sm2471961pgu.15.2022.08.30.21.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 21:53:30 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sergio Lopez <slp@redhat.com>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH REPOST] hw/i386/e820: remove legacy reserved entries for e820
Date: Wed, 31 Aug 2022 10:23:10 +0530
Message-Id: <20220831045311.33083-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::530;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

e820 reserved entries were used before the dynamic entries with fw config files
were intoduced. Please see the following change:
7d67110f2d9a6("pc: add etc/e820 fw_cfg file")

Identical support was introduced into seabios as well with the following commit:
ce39bd4031820 ("Add support for etc/e820 fw_cfg file")

Both the above commits are now quite old. QEMU machines 1.7 and newer no longer
use the reserved entries. Seabios uses fw config files and
dynamic e820 entries by default and only falls back to using reserved entries
when it has to work with old qemu (versions earlier than 1.7). Please see
functions qemu_cfg_e820() and qemu_early_e820(). It is safe to remove legacy
FW_CFG_E820_TABLE and associated code now as QEMU 7.0 has deprecated i440fx
machines 1.7 and older. It would be incredibly rare to run the latest qemu
version with a very old version of seabios that did not support fw config files
for e820.

As far as I could see, edk2/ovfm never supported reserved entries and uses fw
config files from the beginning. So there should be no incompatibilities with
ovfm as well.

CC: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/e820_memory_layout.c | 20 +-------------------
 hw/i386/e820_memory_layout.h |  8 --------
 hw/i386/fw_cfg.c             |  3 ---
 hw/i386/fw_cfg.h             |  1 -
 hw/i386/microvm.c            |  2 --
 5 files changed, 1 insertion(+), 33 deletions(-)

Please see:
https://patchwork.ozlabs.org/project/qemu-devel/patch/20220420043904.1225153-1-ani@anisinha.ca/
for the previous post. Now that we are in 7.2 devel cycle, time to push
this patch.

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
index 04f93780f9..7c239aa033 100644
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
index 52cafa003d..a591161c02 100644
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
2.34.1


