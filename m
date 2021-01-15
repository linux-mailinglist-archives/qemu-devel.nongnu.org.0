Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69722F8696
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 21:21:55 +0100 (CET)
Received: from localhost ([::1]:41824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0VbW-0006Jv-O7
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 15:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSH-0005wu-4r
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:21 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSF-0008Jn-Dh
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:20 -0500
Received: by mail-wm1-x329.google.com with SMTP id h17so8293101wmq.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 12:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s8uTdRNQNLyJc2a5BTXUw8GgoVjbscNIEvNw+cn6bTs=;
 b=b0UAPeg5328E2sC1f3S8uIpJ/iTd3H4PiyjKHe6KhhOKR+3u+emmjNieuy/IlA/+1g
 FRv+r0VrJ9HqMG0pknIAtCaz6XOAYe5TbMqpplv/nDred+1D2pEWz4OSyiXddCtH2mpI
 r8aVrh/bzuBzuYgDjEPcRQn6579poTgtojp441DdO8pXTzdcizT1zVJkYS7QhF2yfqCm
 4vO0VT926FR97vhPCHDx3CeECEc1X1UNFYO0P8VEsWqAfPvR6yXK5oa70GUva05t4a9m
 6fopcSMmhblN3nxZLa/D19vOFchWNMZJ2V8TjzqE+x/FC1TeI1liewOKkdMCOx5XtawZ
 4hKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s8uTdRNQNLyJc2a5BTXUw8GgoVjbscNIEvNw+cn6bTs=;
 b=d/XVQBDMqmPaOubZtrFPtQ8UyyWtlDxko6IZU9VDxKtakTVqHkJPLfYvw8XS0eUk1K
 uEvwvwqYDRlZ0WIvcVXBcMH+kvFue6o7PIxk3gC2nm9FPuTpMK1KdWwoFxGxg9OPIHqH
 FPrphFo8LVwfHB1NWss14rAGbo35aLVnn6ORxIVDjiVEh5AEOjsK46iscTqG1XV0jXll
 nE3B1Vq+qxBoxa8C6gW4tapJic8I+KdIMC3QsQuTf1HXTyGZf4jdjMnaXMaXi10Bz1MS
 Jioh+45dph5sJBb3E4SW8S3g+kV5w0Mug4lqpSTYWhiveKdteMg3zKa6lXORIPaKE5tf
 Dexw==
X-Gm-Message-State: AOAM533gCpb/PO764UzErvK4shAfggf3WqpiUcVjfCRvM06G9zVXTQPh
 N4apaLK9HRUS2/lVsxGmVLcTWfzKkbbYPQ==
X-Google-Smtp-Source: ABdhPJyO/YTJ8UrLDF5ck61fx4vs+GmmCfdrthxO4O4WtxSP6GlnRxsHNzULcMEEfwwP8XBRv2j4GQ==
X-Received: by 2002:a1c:2d92:: with SMTP id
 t140mr10529622wmt.114.1610741537840; 
 Fri, 15 Jan 2021 12:12:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b3sm10353807wrn.70.2021.01.15.12.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:12:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] hw/m68k/next-cube: Move rtc into NeXTPC struct
Date: Fri, 15 Jan 2021 20:12:03 +0000
Message-Id: <20210115201206.17347-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115201206.17347-1-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the rtc into the NeXTPC struct. Since this is the last
use of the 'backdoor' NextState pointer we can now remove that.

Probably the RTC should be its own device at some point: in hardware
there is a separate MCS1850 RTC chip connected to the Peripheral
Controller via a 1-bit serial interface.  That goes beyond the remit
of the current refactoring, though.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/m68k/next-cube.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index 5a8fc24ed35..3c83b874c56 100644
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
@@ -88,9 +86,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(NeXTPC, NEXT_PC)
 struct NeXTPC {
     SysBusDevice parent_obj;
 
-    /* Temporary until all functionality has been moved into this device */
-    NeXTState *ns;
-
     M68kCPU *cpu;
 
     MemoryRegion mmiomem;
@@ -102,6 +97,8 @@ struct NeXTPC {
     uint8_t scsi_csr_2;
     uint32_t int_mask;
     uint32_t int_status;
+
+    NextRtc rtc;
 };
 
 /* Thanks to NeXT forums for this */
@@ -130,7 +127,7 @@ static void nextscr2_write(NeXTPC *s, uint32_t val, int size)
     static int phase;
     static uint8_t old_scr2;
     uint8_t scr2_2;
-    NextRtc *rtc = &s->ns->rtc;
+    NextRtc *rtc = &s->rtc;
 
     if (size == 4) {
         scr2_2 = (val >> 8) & 0xFF;
@@ -864,6 +861,11 @@ static void next_pc_reset(DeviceState *dev)
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
@@ -920,7 +922,6 @@ static void next_cube_init(MachineState *machine)
     MemoryRegion *bmapm2 = g_new(MemoryRegion, 1);
     MemoryRegion *sysmem = get_system_memory();
     const char *bios_name = machine->firmware ?: ROM_FILE;
-    NeXTState *ns = NEXT_MACHINE(machine);
     DeviceState *dev;
     DeviceState *pcdev;
 
@@ -940,13 +941,6 @@ static void next_cube_init(MachineState *machine)
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
2.20.1


