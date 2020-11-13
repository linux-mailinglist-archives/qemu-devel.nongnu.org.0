Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F062B18E8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:19:05 +0100 (CET)
Received: from localhost ([::1]:53500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdWAa-0000wJ-L6
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:19:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdW8o-0007mS-D8
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:17:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdW8l-0003p5-Cz
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605262630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=moYTqjI8JygssS7c4zDeQta2IpodUgwisJxKXnGvI1Q=;
 b=EmWBQWpvQt98pyBrLiyYKEnARg+iq6fM0HSw7COJpDqnfT7lM7EvWgdaHQEkWOtg4lOrQK
 a1H7OEuKQVUZr9CZManBxb91w8C90oEuZdRKt0LxmMkpJDGx1lT1mNvKjenPp0g6OQA8ro
 Wth/ApjJoHJS8YpLrC4Sd//a5hJjiTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-I7zvhK4MMkufDCdCCtvqlw-1; Fri, 13 Nov 2020 05:17:08 -0500
X-MC-Unique: I7zvhK4MMkufDCdCCtvqlw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C92A1108E1B2;
 Fri, 13 Nov 2020 10:17:07 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 677DF55794;
 Fri, 13 Nov 2020 10:17:07 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 005/122] i386: do not use ram_size global
Date: Fri, 13 Nov 2020 05:15:07 -0500
Message-Id: <20201113101704.1438368-5-pbonzini@redhat.com>
In-Reply-To: <20201113101704.1438368-1-pbonzini@redhat.com>
References: <20201113101704.1438368-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the loader parameters instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/fw_cfg.c      | 2 +-
 hw/i386/vmport.c      | 3 ++-
 hw/i386/xen/xen-hvm.c | 2 +-
 hw/intc/apic_common.c | 3 ++-
 hw/smbios/smbios.c    | 8 ++++----
 5 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index e06579490c..b87f0e5070 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -118,7 +118,7 @@ FWCfgState *fw_cfg_arch_create(MachineState *ms,
      * "etc/max-cpus" actually being apic_id_limit
      */
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, apic_id_limit);
-    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
+    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, ms->ram_size);
 #ifdef CONFIG_ACPI
     fw_cfg_add_bytes(fw_cfg, FW_CFG_ACPI_TABLES,
                      acpi_tables, acpi_tables_len);
diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
index 20d605506b..490a57f52c 100644
--- a/hw/i386/vmport.c
+++ b/hw/i386/vmport.c
@@ -32,6 +32,7 @@
 #include "hw/isa/isa.h"
 #include "hw/i386/vmport.h"
 #include "hw/qdev-properties.h"
+#include "hw/boards.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/qtest.h"
@@ -188,7 +189,7 @@ static uint32_t vmport_cmd_ram_size(void *opaque, uint32_t addr)
         return -1;
     }
     cpu->env.regs[R_EBX] = 0x1177;
-    return ram_size;
+    return current_machine->ram_size;
 }
 
 static uint32_t vmport_cmd_get_hz(void *opaque, uint32_t addr)
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 9519c33c09..096c46fef1 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -1493,7 +1493,7 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
 #else
     xen_map_cache_init(NULL, state);
 #endif
-    xen_ram_init(pcms, ram_size, ram_memory);
+    xen_ram_init(pcms, ms->ram_size, ram_memory);
 
     qemu_add_vm_change_state_handler(xen_hvm_change_state_handler, state);
 
diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 81addd6390..67c24238b0 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -27,6 +27,7 @@
 #include "hw/i386/apic.h"
 #include "hw/i386/apic_internal.h"
 #include "trace.h"
+#include "hw/boards.h"
 #include "sysemu/hax.h"
 #include "sysemu/kvm.h"
 #include "hw/qdev-properties.h"
@@ -297,7 +298,7 @@ static void apic_common_realize(DeviceState *dev, Error **errp)
 
     /* Note: We need at least 1M to map the VAPIC option ROM */
     if (!vapic && s->vapic_control & VAPIC_ENABLE_MASK &&
-        !hax_enabled() && ram_size >= 1024 * 1024) {
+        !hax_enabled() && current_machine->ram_size >= 1024 * 1024) {
         vapic = sysbus_create_simple("kvmvapic", -1, NULL);
     }
     s->vapic = vapic;
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 6a3d39793b..f22c4f5b73 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -678,13 +678,13 @@ static void smbios_build_type_16_table(unsigned dimm_cnt)
     t->location = 0x01; /* Other */
     t->use = 0x03; /* System memory */
     t->error_correction = 0x06; /* Multi-bit ECC (for Microsoft, per SeaBIOS) */
-    size_kb = QEMU_ALIGN_UP(ram_size, KiB) / KiB;
+    size_kb = QEMU_ALIGN_UP(current_machine->ram_size, KiB) / KiB;
     if (size_kb < MAX_T16_STD_SZ) {
         t->maximum_capacity = cpu_to_le32(size_kb);
         t->extended_maximum_capacity = cpu_to_le64(0);
     } else {
         t->maximum_capacity = cpu_to_le32(MAX_T16_STD_SZ);
-        t->extended_maximum_capacity = cpu_to_le64(ram_size);
+        t->extended_maximum_capacity = cpu_to_le64(current_machine->ram_size);
     }
     t->memory_error_information_handle = cpu_to_le16(0xFFFE); /* Not provided */
     t->number_of_memory_devices = cpu_to_le16(dimm_cnt);
@@ -911,9 +911,9 @@ void smbios_get_tables(MachineState *ms,
 
 #define MAX_DIMM_SZ (16 * GiB)
 #define GET_DIMM_SZ ((i < dimm_cnt - 1) ? MAX_DIMM_SZ \
-                                        : ((ram_size - 1) % MAX_DIMM_SZ) + 1)
+                                        : ((current_machine->ram_size - 1) % MAX_DIMM_SZ) + 1)
 
-        dimm_cnt = QEMU_ALIGN_UP(ram_size, MAX_DIMM_SZ) / MAX_DIMM_SZ;
+        dimm_cnt = QEMU_ALIGN_UP(current_machine->ram_size, MAX_DIMM_SZ) / MAX_DIMM_SZ;
 
         smbios_build_type_16_table(dimm_cnt);
 
-- 
2.26.2


