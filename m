Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EDA2D1325
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 15:10:28 +0100 (CET)
Received: from localhost ([::1]:43118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmHDf-0003qk-Mm
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 09:10:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmHBE-00029K-3J
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:07:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmHBA-0002hg-VX
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607350071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hqgmaYWagE7onwHP2G1rcjN2RrtF1zWWqBf3bR/xTx4=;
 b=W3ppiolCBIiIbKj9JoQiQuLcv/p0UBe4KZaOBzctrk7fzIdnfXuFhCLwROZhxPCUmdXy1V
 ykMuBdPQCncKm/C2wK7GxUK3Ibtr66EYkxLF/jeK23CUiVcQwieENK74QIY+SJ5WQHi2f/
 +1DXj/iJodsT1NJ3sWsWpcJf5CXQQa0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-Z5vx-KqwOiC7-5d8qHAc4w-1; Mon, 07 Dec 2020 09:07:49 -0500
X-MC-Unique: Z5vx-KqwOiC7-5d8qHAc4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDF05107ACE3;
 Mon,  7 Dec 2020 14:07:48 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE58F1002393;
 Mon,  7 Dec 2020 14:07:47 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] acpi: cpuhp: introduce 'firmware performs eject'
 status/control bits
Date: Mon,  7 Dec 2020 09:07:33 -0500
Message-Id: <20201207140739.3829993-3-imammedo@redhat.com>
In-Reply-To: <20201207140739.3829993-1-imammedo@redhat.com>
References: <20201207140739.3829993-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
v2:
  - take into account fw_remove bit when checking for events in
    CPHP_GET_NEXT_CPU_WITH_EVENT_CMD
    (Ankur Arora <ankur.a.arora@oracle.com>)
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
 hw/acpi/cpu.c                   | 12 +++++++++++-
 hw/acpi/trace-events            |  2 ++
 4 files changed, 28 insertions(+), 6 deletions(-)

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
index f099b50927..1293204438 100644
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
@@ -159,7 +168,8 @@ static void cpu_hotplug_wr(void *opaque, hwaddr addr, uint64_t data,
 
                 do {
                     cdev = &cpu_st->devs[iter];
-                    if (cdev->is_inserting || cdev->is_removing) {
+                    if (cdev->is_inserting || cdev->is_removing ||
+                        cdev->fw_remove) {
                         cpu_st->selector = iter;
                         trace_cpuhp_acpi_cpu_has_events(cpu_st->selector,
                             cdev->is_inserting, cdev->is_removing);
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


