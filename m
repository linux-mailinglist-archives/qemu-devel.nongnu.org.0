Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F94D31BA29
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:20:07 +0100 (CET)
Received: from localhost ([::1]:52930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdnK-00072b-8c
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjr-0005PY-Ca
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:31 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjp-0005Sn-OU
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:31 -0500
Received: by mail-ed1-x535.google.com with SMTP id h10so3264163edl.6
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OMCSlzKUEJNJSmXUjPhcprlREyEBG+IPJnwyqLAL74E=;
 b=GTu5ktkxTw0u8aZ7wLRk/FRqMcMz/2V2r/MJGhLxB0dLJthNOzSHmJXsFGl3kfYVkT
 oO26gtLOTuME+hkBd6oLQWSHWLhWlb6oDk4aF4WSZUoZ3lMgfaRTveHWW64cakDepAgG
 YdqD0BzeM+eXx5NoUF8OyFV7YH4uLm5MSzAUMnkw1Kr2SY+5zbr+BoS9qjTgJrPC1WtA
 V0WeGW3+9R8LpyY2MlTbWTw0AU9vedndhjp8qE+8jS2gSKjC8ZzZ6KoQdqZ41iu4keUJ
 uo15AmGeYLTgDrFO6OrZVwLzm6Iy3ohkFf0rGrPS9+Lxwi4j/sqnV8FTJr56fxXs7MS1
 vOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OMCSlzKUEJNJSmXUjPhcprlREyEBG+IPJnwyqLAL74E=;
 b=OIIVxcgHFoVk35MAR5eyEaTt9MH8IfiJTPXk6KalXXbv2RBWklWrAoiixu3iEQVJLk
 NmTRkBfVBw036aOXHJ89iZ7qwTnO02yWQRCmGMql/YBeap33NFNXcXdM5Bm/VtfPMpDZ
 ihmkvLOnoTlBUUnuoAu+9dPdZZR2gBZttpL/G4Ar0CuYx6f8MLStnPnQoY4vJza0Mieb
 xn3hth5vizkALljA7PyyTb8aTceXhn3eth/Y4Wmwq02LgcsK1WKT0Vbha3m6ejyv99aH
 NRFl5g61OxaoHN2gUhhpMntPlc3fV8irnx+EOiif0EvXeT5cZlr6JttAVGGbuMyuuFJR
 otVg==
X-Gm-Message-State: AOAM531iEgjWRjlbsS5eUn43yrM+P5CaXah0PCjYZmgpubmKlgI5evCB
 PUJ+hnQlz8HymdGRnHQZF+BMMeSzM8k=
X-Google-Smtp-Source: ABdhPJyRjKpp6qFuwZmG5RY+iYQXyTgnyc+YZbPgmTmPAnea3OyidelDYk5c6ozqsqSuwld/pzuEXg==
X-Received: by 2002:a05:6402:17aa:: with SMTP id
 j10mr15804165edy.184.1613394988616; 
 Mon, 15 Feb 2021 05:16:28 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/19] pc: add parser for OVMF reset block
Date: Mon, 15 Feb 2021 14:16:08 +0100
Message-Id: <20210215131626.65640-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: James Bottomley <jejb@linux.ibm.com>

OVMF is developing a mechanism for depositing a GUIDed table just
below the known location of the reset vector.  The table goes
backwards in memory so all entries are of the form

<data>|len|<GUID>

Where <data> is arbtrary size and type, <len> is a uint16_t and
describes the entire length of the entry from the beginning of the
data to the end of the guid.

The foot of the table is of this form and <len> for this case
describes the entire size of the table.  The table foot GUID is
defined by OVMF as 96b582de-1fb2-45f7-baea-a366c55a082d and if the
table is present this GUID is just below the reset vector, 48 bytes
before the end of the firmware file.

Add a parser for the ovmf reset block which takes a copy of the block,
if the table foot guid is found, minus the footer and a function for
later traversal to return the data area of any specified GUIDs.

Signed-off-by: James Bottomley <jejb@linux.ibm.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210204193939.16617-2-jejb@linux.ibm.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc_sysfw.c     | 122 +++++++++++++++++++++++++++++++++++++++--
 include/hw/i386/pc.h   |   4 ++
 include/sysemu/sev.h   |   1 +
 target/i386/sev_i386.h |   1 -
 4 files changed, 123 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 11172214f1..6404b5a86f 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -125,6 +125,113 @@ void pc_system_flash_cleanup_unused(PCMachineState *pcms)
     }
 }
 
+#define OVMF_TABLE_FOOTER_GUID "96b582de-1fb2-45f7-baea-a366c55a082d"
+
+static uint8_t *ovmf_table;
+static int ovmf_table_len;
+
+static void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
+{
+    uint8_t *ptr;
+    QemuUUID guid;
+    int tot_len;
+
+    /* should only be called once */
+    if (ovmf_table) {
+        return;
+    }
+
+    if (flash_size < TARGET_PAGE_SIZE) {
+        return;
+    }
+
+    /*
+     * if this is OVMF there will be a table footer
+     * guid 48 bytes before the end of the flash file.  If it's
+     * not found, silently abort the flash parsing.
+     */
+    qemu_uuid_parse(OVMF_TABLE_FOOTER_GUID, &guid);
+    guid = qemu_uuid_bswap(guid); /* guids are LE */
+    ptr = flash_ptr + flash_size - 48;
+    if (!qemu_uuid_is_equal((QemuUUID *)ptr, &guid)) {
+        return;
+    }
+
+    /* if found, just before is two byte table length */
+    ptr -= sizeof(uint16_t);
+    tot_len = le16_to_cpu(*(uint16_t *)ptr) - sizeof(guid) - sizeof(uint16_t);
+
+    if (tot_len <= 0) {
+        return;
+    }
+
+    ovmf_table = g_malloc(tot_len);
+    ovmf_table_len = tot_len;
+
+    /*
+     * ptr is the foot of the table, so copy it all to the newly
+     * allocated ovmf_table and then set the ovmf_table pointer
+     * to the table foot
+     */
+    memcpy(ovmf_table, ptr - tot_len, tot_len);
+    ovmf_table += tot_len;
+}
+
+bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
+                               int *data_len)
+{
+    uint8_t *ptr = ovmf_table;
+    int tot_len = ovmf_table_len;
+    QemuUUID entry_guid;
+
+    if (qemu_uuid_parse(entry, &entry_guid) < 0) {
+        return false;
+    }
+
+    if (!ptr) {
+        return false;
+    }
+
+    entry_guid = qemu_uuid_bswap(entry_guid); /* guids are LE */
+    while (tot_len >= sizeof(QemuUUID) + sizeof(uint16_t)) {
+        int len;
+        QemuUUID *guid;
+
+        /*
+         * The data structure is
+         *   arbitrary length data
+         *   2 byte length of entire entry
+         *   16 byte guid
+         */
+        guid = (QemuUUID *)(ptr - sizeof(QemuUUID));
+        len = le16_to_cpu(*(uint16_t *)(ptr - sizeof(QemuUUID) -
+                                        sizeof(uint16_t)));
+
+        /*
+         * just in case the table is corrupt, wouldn't want to spin in
+         * the zero case
+         */
+        if (len < sizeof(QemuUUID) + sizeof(uint16_t)) {
+            return false;
+        } else if (len > tot_len) {
+            return false;
+        }
+
+        ptr -= len;
+        tot_len -= len;
+        if (qemu_uuid_is_equal(guid, &entry_guid)) {
+            if (data) {
+                *data = ptr;
+            }
+            if (data_len) {
+                *data_len = len - sizeof(QemuUUID) - sizeof(uint16_t);
+            }
+            return true;
+        }
+    }
+    return false;
+}
+
 /*
  * Map the pcms->flash[] from 4GiB downward, and realize.
  * Map them in descending order, i.e. pcms->flash[0] at the top,
@@ -192,10 +299,17 @@ static void pc_system_flash_map(PCMachineState *pcms,
             flash_mem = pflash_cfi01_get_memory(system_flash);
             pc_isa_bios_init(rom_memory, flash_mem, size);
 
-            /* Encrypt the pflash boot ROM, if necessary */
-            flash_ptr = memory_region_get_ram_ptr(flash_mem);
-            flash_size = memory_region_size(flash_mem);
-            sev_encrypt_flash(flash_ptr, flash_size, &error_fatal);
+            /* Encrypt the pflash boot ROM */
+            if (sev_enabled()) {
+                flash_ptr = memory_region_get_ram_ptr(flash_mem);
+                flash_size = memory_region_size(flash_mem);
+                /*
+                 * OVMF places a GUIDed structures in the flash, so
+                 * search for them
+                 */
+                pc_system_parse_ovmf_flash(flash_ptr, flash_size);
+                sev_encrypt_flash(flash_ptr, flash_size, &error_fatal);
+            }
         }
     }
 }
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 5f93540a43..c9d194a5e7 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -3,6 +3,7 @@
 
 #include "qemu/notify.h"
 #include "qapi/qapi-types-common.h"
+#include "qemu/uuid.h"
 #include "hw/boards.h"
 #include "hw/block/fdc.h"
 #include "hw/block/flash.h"
@@ -191,6 +192,9 @@ ISADevice *pc_find_fdc0(void);
 void pc_system_flash_create(PCMachineState *pcms);
 void pc_system_flash_cleanup_unused(PCMachineState *pcms);
 void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
+bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
+                               int *data_len);
+
 
 /* acpi-build.c */
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
index 5c5a13c6ca..882e8a4fb1 100644
--- a/include/sysemu/sev.h
+++ b/include/sysemu/sev.h
@@ -16,6 +16,7 @@
 
 #include "sysemu/kvm.h"
 
+bool sev_enabled(void);
 int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
 int sev_inject_launch_secret(const char *hdr, const char *secret,
diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index 4db6960f60..bd9f00a908 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -28,7 +28,6 @@
 #define SEV_POLICY_DOMAIN       0x10
 #define SEV_POLICY_SEV          0x20
 
-extern bool sev_enabled(void);
 extern uint64_t sev_get_me_mask(void);
 extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
-- 
2.29.2



