Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E0A2CF4CF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 20:32:45 +0100 (CET)
Received: from localhost ([::1]:46088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klGou-0000wu-I0
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 14:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1klEc3-0007MA-IX
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:11:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1klEbJ-0006fO-0u
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:11:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607101793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ekVYCvjOoDZtty0c3QtIsTdzejAGQctlL5G19DBS6x0=;
 b=gFkRkgvth36Wn1tet8SKKoBqBO3o5EAAxDKlUCbgCQ5Lr0dxWndH4K5jLHd31fZaQEmV+O
 59af7M5PP9ayyjJ36yWgU75jXZXcM57bbepYD76NYLFBCHyH4hie+8ikmZ1yej+GO6MV6d
 iowDTYsnkJM4CVHFIltOR8dGjAvd+nA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-pkVMpksmOEO4FcRIfaAcsg-1; Fri, 04 Dec 2020 12:09:49 -0500
X-MC-Unique: pkVMpksmOEO4FcRIfaAcsg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0202107ACE4;
 Fri,  4 Dec 2020 17:09:48 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D568119630;
 Fri,  4 Dec 2020 17:09:47 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] acpi: cpuhp: introduce 'firmware performs eject'
 status/control bits
Date: Fri,  4 Dec 2020 12:09:33 -0500
Message-Id: <20201204170939.1815522-3-imammedo@redhat.com>
In-Reply-To: <20201204170939.1815522-1-imammedo@redhat.com>
References: <20201204170939.1815522-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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
Cc: lersek@redhat.com, ankur.a.arora@oracle.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adds bit #4 to status/control field of CPU hotplug MMIO interface.
New bit will be used OSPM to mark CPUs as pending for removal by firmware,
when it calls _EJ0 method on CPU device node. Later on, when firmware
sees this bit set, it will perform CPU eject which will clear bit #4
as well.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v1:
  - rearrange status/control bits description (Laszlo)
  - add clear bit #4 on eject
  - drop toggling logic from bit #4, it can be only set by guest
    and clear as part of cpu eject
  - exclude boot CPU from remove request
  - add trace events for new bit
---
 include/hw/acpi/cpu.h           |  1 +
 docs/specs/acpi_cpu_hotplug.txt | 19 ++++++++++++++-----
 hw/acpi/cpu.c                   |  9 +++++++++
 hw/acpi/trace-events            |  2 ++
 4 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
index 0eeedaa491..d71edde456 100644
--- a/include/hw/acpi/cpu.h
+++ b/include/hw/acpi/cpu.h
@@ -22,6 +22,7 @@ typedef struct AcpiCpuStatus {
     uint64_t arch_id;
     bool is_inserting;
     bool is_removing;
+    bool fw_remove;
     uint32_t ost_event;
     uint32_t ost_status;
 } AcpiCpuStatus;
diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hotplug.txt
index 9bb22d1270..9bd59ae0da 100644
--- a/docs/specs/acpi_cpu_hotplug.txt
+++ b/docs/specs/acpi_cpu_hotplug.txt
@@ -56,8 +56,11 @@ read access:
               no device check event to OSPM was issued.
               It's valid only when bit 0 is set.
            2: Device remove event, used to distinguish device for which
-              no device eject request to OSPM was issued.
-           3-7: reserved and should be ignored by OSPM
+              no device eject request to OSPM was issued. Firmware must
+              ignore this bit.
+           3: reserved and should be ignored by OSPM
+           4: if set to 1, OSPM requests firmware to perform device eject.
+           5-7: reserved and should be ignored by OSPM
     [0x5-0x7] reserved
     [0x8] Command data: (DWORD access)
           contains 0 unless value last stored in 'Command field' is one of:
@@ -79,10 +82,16 @@ write access:
                selected CPU device
             2: if set to 1 clears device remove event, set by OSPM
                after it has emitted device eject request for the
-               selected CPU device
+               selected CPU device.
             3: if set to 1 initiates device eject, set by OSPM when it
-               triggers CPU device removal and calls _EJ0 method
-            4-7: reserved, OSPM must clear them before writing to register
+               triggers CPU device removal and calls _EJ0 method or by firmware
+               when bit #4 is set. In case bit #4 were set, it's cleared as
+               part of device eject.
+            4: if set to 1, OSPM hands over device eject to firmware.
+               Firmware shall issue device eject request as described above
+               (bit #3) and OSPM should not touch device eject bit (#3) in case
+               it's asked firmware to perform CPU device eject.
+            5-7: reserved, OSPM must clear them before writing to register
     [0x5] Command field: (1 byte access)
           value:
             0: selects a CPU device with inserting/removing events and
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index f099b50927..811218f673 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -71,6 +71,7 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr addr, unsigned size)
         val |= cdev->cpu ? 1 : 0;
         val |= cdev->is_inserting ? 2 : 0;
         val |= cdev->is_removing  ? 4 : 0;
+        val |= cdev->fw_remove  ? 16 : 0;
         trace_cpuhp_acpi_read_flags(cpu_st->selector, val);
         break;
     case ACPI_CPU_CMD_DATA_OFFSET_RW:
@@ -148,6 +149,14 @@ static void cpu_hotplug_wr(void *opaque, hwaddr addr, uint64_t data,
             hotplug_ctrl = qdev_get_hotplug_handler(dev);
             hotplug_handler_unplug(hotplug_ctrl, dev, NULL);
             object_unparent(OBJECT(dev));
+            cdev->fw_remove = false;
+        } else if (data & 16) {
+            if (!cdev->cpu || cdev->cpu == first_cpu) {
+                trace_cpuhp_acpi_fw_remove_invalid_cpu(cpu_st->selector);
+                break;
+            }
+            trace_cpuhp_acpi_fw_remove_cpu(cpu_st->selector);
+            cdev->fw_remove = true;
         }
         break;
     case ACPI_CPU_CMD_OFFSET_WR:
diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index afbc77de1c..f91ced477d 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -29,6 +29,8 @@ cpuhp_acpi_clear_inserting_evt(uint32_t idx) "idx[0x%"PRIx32"]"
 cpuhp_acpi_clear_remove_evt(uint32_t idx) "idx[0x%"PRIx32"]"
 cpuhp_acpi_ejecting_invalid_cpu(uint32_t idx) "0x%"PRIx32
 cpuhp_acpi_ejecting_cpu(uint32_t idx) "0x%"PRIx32
+cpuhp_acpi_fw_remove_invalid_cpu(uint32_t idx) "0x%"PRIx32
+cpuhp_acpi_fw_remove_cpu(uint32_t idx) "0x%"PRIx32
 cpuhp_acpi_write_ost_ev(uint32_t slot, uint32_t ev) "idx[0x%"PRIx32"] OST EVENT: 0x%"PRIx32
 cpuhp_acpi_write_ost_status(uint32_t slot, uint32_t st) "idx[0x%"PRIx32"] OST STATUS: 0x%"PRIx32
 
-- 
2.27.0


