Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8947A2D49F7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:19:09 +0100 (CET)
Received: from localhost ([::1]:44622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4zU-0002UH-Kb
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vo-0004nt-Dx
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:11:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vg-0000Zi-BZ
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:11:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y6bcvJiA50tTF+KEnd2Ti5O08HtqauxYfsjzK0d3T08=;
 b=OHUx8UIzw0nde5Tx3edXaIDhLibbmTvv7eo7snXkVRSVeIEC88dM8yMPMvAdPNBTcq4Q2E
 NzMzftcEPTDzi/gXS1y4M1jiO8mJ+gpB2EpzeX9NxG4QiZ2P1XFbSUXjPW8+5PJx30DaUC
 mos51E6/qzyoe6x1TFpI4mK5zhune/Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-JkWrpRScMfKgvC-1MM6LuQ-1; Wed, 09 Dec 2020 13:11:05 -0500
X-MC-Unique: JkWrpRScMfKgvC-1MM6LuQ-1
Received: by mail-wm1-f71.google.com with SMTP id h68so874845wme.5
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y6bcvJiA50tTF+KEnd2Ti5O08HtqauxYfsjzK0d3T08=;
 b=ljUz1iwJXPrUI6yLwCeEc06rtvWeATJ/wSvzKLa/Ssl20uHOusABtdk8QzQeMLvccC
 KLfPJ/SU4ClNKvJv9s1T2xJmL467oJg0oe4IepMEzTw+IB43N71nKPQdTo/IlqSM3XeD
 CvO1ArQmBXER9v7t+hBHNCG64Mz0FVGiQju9KOv+ZIPahKEARADjqVIReu3kJJT/qslx
 iqFgn2DJ5Fzhb8MxM9Xw0/xBaQecf3ieN/rOHLA8+rW1hd9848RJDtVQxftLDAhAWPLc
 Qmkj2wjyeql0jfYEEwkj1Vzk7fFRMd36M3OmRu7XPk6jOkscBsufKxBGEZUrvyPrN2wU
 vuLw==
X-Gm-Message-State: AOAM532owOuJ/F5JN2QJnIe0szczMBn6ZLFZuUTLLD1NLvs1yqFDSmrk
 NwbykrCHvglkfzPnep8qVuffojfnKdDeoxYEb4vSi0bXHOITrPHDxSMRC6qSDU8qoeM0wj/+/FF
 t6xCLMge9gOvG2mwBl0CgPuHw3sH3vbvwhvdvI8nmairwJ6UWJWwhkTp5BZr2
X-Received: by 2002:a5d:5643:: with SMTP id j3mr3915104wrw.43.1607537463226;
 Wed, 09 Dec 2020 10:11:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNLCBYbVVM21GeNCJmDYViuE2h4niXugg8Lo13vN+xj+xUn+5inYcwsfbDyW7F8GcGCDHTuw==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr3915078wrw.43.1607537462928;
 Wed, 09 Dec 2020 10:11:02 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id q15sm4847710wrw.75.2020.12.09.10.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:11:02 -0800 (PST)
Date: Wed, 9 Dec 2020 13:10:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 56/65] acpi: cpuhp: introduce 'firmware performs eject'
 status/control bits
Message-ID: <20201209180546.721296-57-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Adds bit #4 to status/control field of CPU hotplug MMIO interface.
New bit will be used OSPM to mark CPUs as pending for removal by firmware,
when it calls _EJ0 method on CPU device node. Later on, when firmware
sees this bit set, it will perform CPU eject which will clear bit #4
as well.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20201207140739.3829993-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/specs/acpi_cpu_hotplug.txt | 19 ++++++++++++++-----
 include/hw/acpi/cpu.h           |  1 +
 hw/acpi/cpu.c                   | 12 +++++++++++-
 hw/acpi/trace-events            |  2 ++
 4 files changed, 28 insertions(+), 6 deletions(-)

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
MST


