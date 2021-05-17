Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91981383BCC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:59:11 +0200 (CEST)
Received: from localhost ([::1]:59560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihWI-0007iN-J4
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lihNz-0008GM-8H
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:50:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lihNv-00039r-CA
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621273830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hRToPB7aVX8q9xnZeseUZTykg3nheLziCrX7lqUCi3Q=;
 b=TIw4iPIggEwlCCzfmPWm8WonbeIOFwVQw3TahEprhzCXFFOEsIMJ5ZSXqAbEC8H9n7NoFt
 AlAeiuKhIS0YMa/JgHcBZywY721OOfgl3GmDjvMDfmAlu/+gJzk8yOAp9z/eYImiN5RTf4
 IWMDl0QRKdBuV9XeTI7iJkGiZTD/nGE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-W322edHPOGmPlMvjPa5pRg-1; Mon, 17 May 2021 13:50:28 -0400
X-MC-Unique: W322edHPOGmPlMvjPa5pRg-1
Received: by mail-ed1-f69.google.com with SMTP id
 ba15-20020a0564021acfb029038d3b33d7ffso1646481edb.23
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hRToPB7aVX8q9xnZeseUZTykg3nheLziCrX7lqUCi3Q=;
 b=WNhvzbnEH5ymGB76HhVGxSf1NUISADjjmOImtNeb5+COxQsWnRHgeKnwZq9h4r1VD9
 mrrkAVGY1APflNIinV8d0/DlVElv1yBwUKNqIJxUbfxZVULjOUZASBVIYNKieQ6NKrm2
 vkVAtX7s4E/TU1Dsmbimv+0H5cAOycIA65bGhdbsI9WEfe5s3VKiuSwuE7mbhiD3TRnr
 rWqPVvbs8k5ALb+4P/fquJAVnOTu0RWMVnOP4lsyC8TDC3Rg9j8insCf0xC7KWpPXh0K
 rGOEI7zuc3bLR2QrQu/xFQY3JyKzafkFd+HL3Gy+KPGMsm7aq7Hdk6r63QCDrFUCIRnz
 WTsQ==
X-Gm-Message-State: AOAM532gGVxfgIkNi++H7Ze3j4AzNqNlRTNAFJMIfWVMgbL/oAInLn7p
 m5D1hFuAF+Vj1VMugHssAQxDayH76pasbNxHLbI/fMSuOsY0gSsIdRWcu4LHQsPIZFjfhV+bHc0
 Q3yYsVp9qROJRTCX7I0ssGCOp05JcGMofI2M+o1XzGmVYEt1Dte5ILnGO17PPv6G5
X-Received: by 2002:a17:907:7629:: with SMTP id
 jy9mr1194519ejc.34.1621273826984; 
 Mon, 17 May 2021 10:50:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzODUm3mVPwuOlFVr10c9JlN9Z6uTvJ41uIv8E7SHmszJEhEAC2RWiHaq++zdOshgjCLcWwaQ==
X-Received: by 2002:a17:907:7629:: with SMTP id
 jy9mr1194499ejc.34.1621273826749; 
 Mon, 17 May 2021 10:50:26 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x9sm11516147edv.22.2021.05.17.10.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:50:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v3 8/8] hw/mips/jazz: Inline fdctrl_init_sysbus()
Date: Mon, 17 May 2021 19:49:47 +0200
Message-Id: <20210517174947.1199649-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517174947.1199649-1-philmd@redhat.com>
References: <20210517174947.1199649-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is only one call site for fdctrl_init_sysbus(), and this
function is specific to the jazz machines, not part of the
SYSBUS_FDC API. Move it locally with the machine code, and
remove its declaration in "hw/block/fdc.h".

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/block/fdc.h |  3 ---
 hw/block/fdc-sysbus.c  | 16 ----------------
 hw/mips/jazz.c         | 16 ++++++++++++++++
 3 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/include/hw/block/fdc.h b/include/hw/block/fdc.h
index 06612218630..ac99d6bcaa0 100644
--- a/include/hw/block/fdc.h
+++ b/include/hw/block/fdc.h
@@ -1,7 +1,6 @@
 #ifndef HW_FDC_H
 #define HW_FDC_H
 
-#include "exec/hwaddr.h"
 #include "qapi/qapi-types-block.h"
 #include "hw/sysbus.h"
 
@@ -12,8 +11,6 @@
 
 void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds);
 void sysbus_fdc_init_drives(SysBusDevice *dev, DriveInfo **fds);
-void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
-                        hwaddr mmio_base, DriveInfo **fds);
 
 FloppyDriveType isa_fdc_get_drive_type(ISADevice *fdc, int i);
 int cmos_get_fd_drive_type(FloppyDriveType fd0);
diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index 74c7c8f2e01..5c7e49bcc3f 100644
--- a/hw/block/fdc-sysbus.c
+++ b/hw/block/fdc-sysbus.c
@@ -103,22 +103,6 @@ void sysbus_fdc_init_drives(SysBusDevice *dev, DriveInfo **fds)
     fdctrl_init_drives(&fdc->state.bus, fds);
 }
 
-void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
-                        hwaddr mmio_base, DriveInfo **fds)
-{
-    DeviceState *dev;
-    SysBusDevice *sbd;
-
-    dev = qdev_new("sysbus-fdc");
-    qdev_prop_set_int32(dev, "dma-channel", dma_chann);
-    sbd = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(sbd, &error_fatal);
-    sysbus_connect_irq(sbd, 0, irq);
-    sysbus_mmio_map(sbd, 0, mmio_base);
-
-    sysbus_fdc_init_drives(sbd, fds);
-}
-
 static void sysbus_fdc_common_initfn(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index dba2088ed1a..13f26c5991f 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -143,6 +143,22 @@ static void mips_jazz_do_transaction_failed(CPUState *cs, hwaddr physaddr,
 }
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
+static void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
+                               hwaddr mmio_base, DriveInfo **fds)
+{
+    DeviceState *dev;
+    SysBusDevice *sbd;
+
+    dev = qdev_new("sysbus-fdc");
+    qdev_prop_set_int32(dev, "dma-channel", dma_chann);
+    sbd = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(sbd, &error_fatal);
+    sysbus_connect_irq(sbd, 0, irq);
+    sysbus_mmio_map(sbd, 0, mmio_base);
+
+    sysbus_fdc_init_drives(sbd, fds);
+}
+
 static void mips_jazz_init(MachineState *machine,
                            enum jazz_model_e jazz_model)
 {
-- 
2.26.3


