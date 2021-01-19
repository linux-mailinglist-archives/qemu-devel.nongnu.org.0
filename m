Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7AB2FB465
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:43:28 +0100 (CET)
Received: from localhost ([::1]:46410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1mbn-0008Kp-Vg
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVZ-0008JX-9U
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:37:01 -0500
Received: from mail-wm1-f48.google.com ([209.85.128.48]:51865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVX-0003Uy-E1
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:37:01 -0500
Received: by mail-wm1-f48.google.com with SMTP id m2so511108wmm.1
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 00:36:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+FrPA9D7tgOJmnuV/QM70BzMEZV7Pu2xLl9GXYEW1X4=;
 b=mSSW6eRjz8cNU9qKYhljx/G83WCPk4R4qAA5dZuU1zRsl5fQltQZxDWOIlYUQlee9A
 gQfRUu9mbZNeRTvcVsjWFkxHeVtN/+du0zQUcUKEQOdJRj5H7+Ja+Z8HVkv0uc3z4wfW
 Q+Gq5cpEn63u71Vtryt2aewipqpCRU6I3v2N0vk+uvDRV4gp4SvjCYoH0YWIdngxE4tI
 YuXhDWg2+CH5yegb+HkoBULZGE+95e72tkl3/4YdrLNO1Sr7pXi686FinXhBqs/MsrFQ
 tvYfCw+/LQaIzvM0YyuRFpbt74hurnQyXkYbjaIKUOr0iwnc2IIqVK6VK5z9iPphJcQ0
 FiTA==
X-Gm-Message-State: AOAM533i5nOw6XxqsUtt/6mvwAmXOODXjKh+7MiYA9xsooqPcoBqXGmQ
 tMkTEuGtKj1I+/z9j0UUzwWdDyz0Uv8=
X-Google-Smtp-Source: ABdhPJxhMLvj7kZJPKqVlwn91K69jZM6OYgwISFKZ5aDfdK77i5ZITJ4LYK1BxMx3Lffh7EFpkLQkA==
X-Received: by 2002:a1c:9cd8:: with SMTP id f207mr3019373wme.155.1611045417969; 
 Tue, 19 Jan 2021 00:36:57 -0800 (PST)
Received: from localhost.localdomain (pd9e83aed.dip0.t-ipconnect.de.
 [217.232.58.237])
 by smtp.gmail.com with ESMTPSA id z14sm540833wrm.5.2021.01.19.00.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 00:36:57 -0800 (PST)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/11] hw/m68k/next-cube: Move rtc into NeXTPC struct
Date: Tue, 19 Jan 2021 09:36:14 +0100
Message-Id: <20210119083617.6337-9-huth@tuxfamily.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119083617.6337-1-huth@tuxfamily.org>
References: <20210119083617.6337-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.48; envelope-from=th.huth@gmail.com;
 helo=mail-wm1-f48.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Move the rtc into the NeXTPC struct. Since this is the last
use of the 'backdoor' NextState pointer we can now remove that.

Probably the RTC should be its own device at some point: in hardware
there is a separate MCS1850 RTC chip connected to the Peripheral
Controller via a 1-bit serial interface.  That goes beyond the remit
of the current refactoring, though.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210115201206.17347-9-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 hw/m68k/next-cube.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index 7dcd39aab9..57f9e9f837 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -78,8 +78,6 @@ struct NeXTState {
     qemu_irq scsi_dma;
     qemu_irq scsi_reset;
     qemu_irq *fd_irq;
-
-    NextRtc rtc;
 };
 
 #define TYPE_NEXT_PC "next-pc"
@@ -89,9 +87,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(NeXTPC, NEXT_PC)
 struct NeXTPC {
     SysBusDevice parent_obj;
 
-    /* Temporary until all functionality has been moved into this device */
-    NeXTState *ns;
-
     M68kCPU *cpu;
 
     MemoryRegion mmiomem;
@@ -103,6 +98,8 @@ struct NeXTPC {
     uint8_t scsi_csr_2;
     uint32_t int_mask;
     uint32_t int_status;
+
+    NextRtc rtc;
 };
 
 /* Thanks to NeXT forums for this */
@@ -131,7 +128,7 @@ static void nextscr2_write(NeXTPC *s, uint32_t val, int size)
     static int phase;
     static uint8_t old_scr2;
     uint8_t scr2_2;
-    NextRtc *rtc = &s->ns->rtc;
+    NextRtc *rtc = &s->rtc;
 
     if (size == 4) {
         scr2_2 = (val >> 8) & 0xFF;
@@ -865,6 +862,11 @@ static void next_pc_reset(DeviceState *dev)
     /*     0x0000XX00 << vital bits */
     s->scr1 = 0x00011102;
     s->scr2 = 0x00ff0c80;
+
+    s->rtc.status = 0x90;
+
+    /* Load RTC RAM - TODO: provide possibility to load contents from file */
+    memcpy(s->rtc.ram, rtc_ram2, 32);
 }
 
 static void next_pc_realize(DeviceState *dev, Error **errp)
@@ -921,7 +923,6 @@ static void next_cube_init(MachineState *machine)
     MemoryRegion *bmapm2 = g_new(MemoryRegion, 1);
     MemoryRegion *sysmem = get_system_memory();
     const char *bios_name = machine->firmware ?: ROM_FILE;
-    NeXTState *ns = NEXT_MACHINE(machine);
     DeviceState *dev;
     DeviceState *pcdev;
 
@@ -941,13 +942,6 @@ static void next_cube_init(MachineState *machine)
     pcdev = qdev_new(TYPE_NEXT_PC);
     object_property_set_link(OBJECT(pcdev), "cpu", OBJECT(cpu), &error_abort);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(pcdev), &error_fatal);
-    /* Temporary while we refactor this code */
-    NEXT_PC(pcdev)->ns = ns;
-
-    ns->rtc.status = 0x90;
-
-    /* Load RTC RAM - TODO: provide possibility to load contents from file */
-    memcpy(ns->rtc.ram, rtc_ram2, 32);
 
     /* 64MB RAM starting at 0x04000000  */
     memory_region_add_subregion(sysmem, 0x04000000, machine->ram);
-- 
2.29.2


