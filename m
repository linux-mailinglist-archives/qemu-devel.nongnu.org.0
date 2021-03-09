Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A985C3329CB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:10:11 +0100 (CET)
Received: from localhost ([::1]:39578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdzu-0001h3-NV
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdKI-0004jX-HM
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:27:10 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:39157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdKD-0006Ez-7J
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:27:10 -0500
Received: by mail-ed1-x536.google.com with SMTP id h10so20505729edl.6
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RFA8710d7y21V9/sjoSrymWAAotgH49b0pKscVplcYw=;
 b=BSjvmPHAIVVMSfZIVzs+16uxOxSkk81HRBA0kRvpV8nhzTnllQkIqUP8CLXe1mLlEo
 0nsRB3X2ZslglNoccglBj5hFHVLB9hjxA8aC9RTEQto4XkBUVsb5O8MzH/4vG5zoc2q3
 EDOUm9X9ZJBrvleGOXgPIIZnHL+4TpZTdsS7zBFgWuTIZaQTFF8r06ncxn7idOkndB5f
 2A+vSx7nonUs1Hbb5q57ybaxiP81ra0WgaGxINeP6/z5el2siAF7Ge7eOpAvJH8M2jN8
 Y6uSuTDwJWQcJKdwjKKpIx6UtDG5esZd3BiKTwrkWjZGOB8tG59wnDN6GpZxu44xYs17
 ZDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RFA8710d7y21V9/sjoSrymWAAotgH49b0pKscVplcYw=;
 b=I2jhQzfjNhIDbnlqUREK+FWzPrVvudN7aKu2fZnZhh6hbk7YHcwKIkrJ8G5OMWe4KU
 37y/KwJkRpm0rE3sgjawINz7yBHfKjZQZHesefpowXyqL4nBiGLGWQ7H+GKR1+DFTU93
 yRHAfjrg6OIOjHDBqgzW9iZu2Fer1iv9v9+kQJyAKqT/1wwzaRTc6ngPHPk9AADdsaGN
 qSqB3TiM8AMh4c7eChRpJDioDJuDyivH2kswSAay4f+C6rMfGjHowDe3NMjOu9St6dyj
 p7WRdTO/88HLKxIrgwoU2WHYk4mbS2+HyFWksNYjX1GVjye4nHIwiXG+KBleIfNz7PJw
 +jiw==
X-Gm-Message-State: AOAM530p+s+2ar4LlmjK/ANmzGG9fUip1PkdurYV78yATOocWWdkoaUD
 JsOfZr8fEI1juapxJ3HF3c4fft6pHl4=
X-Google-Smtp-Source: ABdhPJxwUkTSFGUX3GsQ956FVFaacpGs3ogL35e8zZVueABofAF5C5cafZZGvsyMxc6g0/Q6OxPWuQ==
X-Received: by 2002:aa7:d416:: with SMTP id z22mr4343910edq.239.1615300023694; 
 Tue, 09 Mar 2021 06:27:03 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b17sm8149195ejj.9.2021.03.09.06.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:27:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 6/6] hw/mips/gt64xxx: Let the GT64120 manage the lower
 512MiB hole
Date: Tue,  9 Mar 2021 15:26:30 +0100
Message-Id: <20210309142630.728014-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309142630.728014-1-f4bug@amsat.org>
References: <20210309142630.728014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x536.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
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


