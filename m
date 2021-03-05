Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FC032F008
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:29:53 +0100 (CET)
Received: from localhost ([::1]:36098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDKq-0007dB-Q9
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIDCv-00073R-6Q
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:21:41 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIDCt-0007RY-Mr
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:21:40 -0500
Received: by mail-wm1-x336.google.com with SMTP id o2so1960648wme.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 08:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RFA8710d7y21V9/sjoSrymWAAotgH49b0pKscVplcYw=;
 b=o7MlH9Oodd972e/C8geXVcLvys+HAUlS7CXcRnu6GzIzKmbVyiLFPRroXo1dlQABUK
 NUcBCKHr9TfpISblbhSaNCY/fR6N2mI1OfTw8iAPhz4OUcvtsGIKAcFFhC+pS8REyHmY
 fDgb8U0NbpPRtNFOaICXwS32ASUGAdixoS3JHXkhzeeYVxj85clBE8BY+gyFUJ0cxfJX
 sb7+beLwvA8BoOQLWYcGcKyozAHbWVxbjat7AKE4Mwthtj2VMydFphcKXZNBcNjTdiYD
 olpoQ+4eTEMbGhy/OgDrbrEQNGzljd10uS5CnLrdLziD7vH/IQ06pjH8ZTuiudByWe9G
 m7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RFA8710d7y21V9/sjoSrymWAAotgH49b0pKscVplcYw=;
 b=pui45PT9NHUd0sksIkdDY1528BMaIMf62ibpxhTWkawl/Za/sniVz96vyY+spDMRLz
 xOn+0FJJu7iJ2W1luT9sZj5v8i+vUDa9fo80ifJMVnl68Eu2f2mXiMcx4bIBwJOv4OUq
 PKQ0qzBKk5DvETgogIMKTL2TLIB/lwuVpPXdcrJ4LKOPD8mVmME/1uUv+cyIkclYAdRi
 GR9FlZGPPUSzMHDlCJSJgLTxsmDc5fpAkvg7KFKEJ6bDd3VIfWNW877pNEt2O+EOosjK
 wmgMbHIhGASWyDsKxQMyD77DE/flIL3PQ69ON2vWUQm48TsZpkdAtW+N19N2e91iOkA7
 IGaA==
X-Gm-Message-State: AOAM532vY77L0DLJCABkQi6KJVeV6VJ7ui7eMYtCYZAdQiWxBtfpF/ik
 OBu3irCfG3tQnvAhZZsv+WAWLFPmKuo=
X-Google-Smtp-Source: ABdhPJxlYv1yidtuaDF1acJQiIzyeN/7Y8hpel7K5gREIdKoxE6sGOwqOG69nLLHIGMecruNogeZMg==
X-Received: by 2002:a1c:bb89:: with SMTP id l131mr9936815wmf.47.1614961297422; 
 Fri, 05 Mar 2021 08:21:37 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c3sm5033116wrr.29.2021.03.05.08.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 08:21:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] hw/mips/gt64xxx: Let the GT64120 manage the lower 512MiB
 hole
Date: Fri,  5 Mar 2021 17:21:07 +0100
Message-Id: <20210305162107.2233203-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210305162107.2233203-1-f4bug@amsat.org>
References: <20210305162107.2233203-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the comment in the Malta board, the [0x0000.0000-0x2000.0000]
range is decoded by the GT64120, so move the "empty_slot" there.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/gt64xxx_pci.c | 8 ++++++++
 hw/mips/malta.c       | 7 -------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 43349d6837d..a3926e5cb8a 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -29,6 +29,7 @@
 #include "hw/mips/mips.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
+#include "hw/misc/empty_slot.h"
 #include "hw/southbridge/piix.h"
 #include "migration/vmstate.h"
 #include "hw/intc/i8259.h"
@@ -1206,6 +1207,13 @@ static void gt64120_realize(DeviceState *dev, Error **errp)
 
     memory_region_init_io(&s->ISD_mem, OBJECT(dev), &isd_mem_ops, s,
                           "gt64120-isd", 0x1000);
+
+    /*
+     * The whole address space decoded by the GT-64120A doesn't generate
+     * exception when accessing invalid memory. Create an empty slot to
+     * emulate this feature.
+     */
+    empty_slot_init("GT64120", 0, 0x20000000);
 }
 
 PCIBus *gt64120_register(qemu_irq *pic)
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9afc0b427bf..b2469f8ee78 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -56,7 +56,6 @@
 #include "sysemu/runstate.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "hw/misc/empty_slot.h"
 #include "sysemu/kvm.h"
 #include "hw/semihosting/semihost.h"
 #include "hw/mips/cps.h"
@@ -1396,12 +1395,6 @@ void mips_malta_init(MachineState *machine)
 
     /* Northbridge */
     pci_bus = gt64120_register(s->i8259);
-    /*
-     * The whole address space decoded by the GT-64120A doesn't generate
-     * exception when accessing invalid memory. Create an empty slot to
-     * emulate this feature.
-     */
-    empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
     dev = piix4_create(pci_bus, &isa_bus, &smbus);
-- 
2.26.2


