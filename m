Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAC3669F97
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:15:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMGE-0001Nq-4w; Fri, 13 Jan 2023 10:46:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMFq-0001Lg-5B
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:06 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMFo-0005iA-Dx
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:05 -0500
Received: by mail-wm1-x32b.google.com with SMTP id ja17so15550551wmb.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d1fzshqbgAk9siGlvQhCRtVRnTKByAhV7Wsl31zfTwU=;
 b=RfVbcEiwDC4PYLWyOC/ibMy0CpBCY+rP4FS29sVAQ2RvR7OfzBgtLOPvT9qftzkahB
 Lhv7USjRmotMYJVKuQxfDpemRrdyL0KY0f4IulfEgNrw6mUNlUJv3k+KJSkZlvhAsSyA
 2SL0pqbao54UoGJvEKTJ3wowrOAuxk52p7c8K2A6QTwkFZhNjnihgTfuANLIyM46tGN0
 5g9bnDWWG6iLQKAxlqkBnpdgAoUeXgBLtv/q+dzA9a7KH9unew7W3j0Yo4klWOU4OMNI
 ySFoDs/fT1aEKa8GRTb8do4wBMbsBEcevIJ1cxJYW+YUCoKkAjszAL3ZseSMCu9h7oxT
 0Ykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d1fzshqbgAk9siGlvQhCRtVRnTKByAhV7Wsl31zfTwU=;
 b=K6V9fKQNthEqk57N7Fd/XRI+YkoEQKiooS98HtpWLgNEF7+gzlBLKfSexBlonR4yVx
 XdgVUG9CxBXJtTiLf3kpvrlSCkrFx0HdKThUKAIvrTMbnHngNxnCk9Z3cD6WzSpcuGQd
 aJmgx6D61p0f9KbVgXJRgf8m4ZuXhvkrX/pLaB1r/Xqzxucuk3CKFCMJAv6bZKRJ10Uh
 fvyRtXPkKD8q2K9N1MFRZLgbBWScGDcjBXmILGkHVy3626pKjDnkn9ElcM5H0yiRiJ+J
 O5ONAGwHWpydCqz8N9wf9rAB0d6sIFbUuHUycQuwTvS26aqScFL1lOyThQaFqpOuW9Zn
 QavQ==
X-Gm-Message-State: AFqh2ko+xhYQZOzj1To3qEr6HRmhtQ5NQs/kzyLBYBgMSoJ6JsoA1DVh
 GSQQ6RgbC1yt4a3qPe5TO1DKLu57aOLqyrps
X-Google-Smtp-Source: AMrXdXv/jr58YNjAy2gAo8qjmU7wDJ89l3g3UsNvTETqWI/z5y4kx+gc4vT3S6j0cJF3IRbbBuy2Fw==
X-Received: by 2002:a05:600c:5405:b0:3da:632:a8d with SMTP id
 he5-20020a05600c540500b003da06320a8dmr8979222wmb.10.1673624763447; 
 Fri, 13 Jan 2023 07:46:03 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a05600c220e00b003d99fad7511sm24171746wml.22.2023.01.13.07.46.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:46:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 06/46] hw/mips/gt64xxx_pci: Let the GT64120 manage the lower
 512MiB hole
Date: Fri, 13 Jan 2023 16:44:52 +0100
Message-Id: <20230113154532.49979-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Per the comment in the Malta board, the [0x0000.0000-0x2000.0000]
range is decoded by the GT64120, so move the "empty_slot" there.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20221209151533.69516-3-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/devices/mips-softmmu/common.mak | 1 -
 hw/mips/Kconfig                         | 1 +
 hw/mips/gt64xxx_pci.c                   | 8 ++++++++
 hw/mips/malta.c                         | 7 -------
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index 88aff94625..a125e74f24 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -24,7 +24,6 @@ CONFIG_IDE_ISA=y
 CONFIG_PFLASH_CFI01=y
 CONFIG_I8259=y
 CONFIG_MC146818RTC=y
-CONFIG_EMPTY_SLOT=y
 CONFIG_MIPS_CPS=y
 CONFIG_MIPS_ITU=y
 CONFIG_MALTA=y
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index d6bbbe7069..8f7bce38fb 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -64,4 +64,5 @@ config FW_CFG_MIPS
 config GT64120
     bool
     select PCI
+    select EMPTY_SLOT
     select I8259
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 81232514c5..7ba052a2e0 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -28,6 +28,7 @@
 #include "qemu/log.h"
 #include "hw/pci/pci_device.h"
 #include "hw/pci/pci_host.h"
+#include "hw/misc/empty_slot.h"
 #include "migration/vmstate.h"
 #include "hw/intc/i8259.h"
 #include "hw/irq.h"
@@ -1200,6 +1201,13 @@ static void gt64120_realize(DeviceState *dev, Error **errp)
                                 PCI_DEVFN(18, 0), TYPE_PCI_BUS);
 
     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
+
+    /*
+     * The whole address space decoded by the GT-64120A doesn't generate
+     * exception when accessing invalid memory. Create an empty slot to
+     * emulate this feature.
+     */
+    empty_slot_init("GT64120", 0, 0x20000000);
 }
 
 static void gt64120_pci_realize(PCIDevice *d, Error **errp)
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 44d88a24a7..c8fc420e4f 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -53,7 +53,6 @@
 #include "sysemu/runstate.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "hw/misc/empty_slot.h"
 #include "sysemu/kvm.h"
 #include "semihosting/semihost.h"
 #include "hw/mips/cps.h"
@@ -1399,12 +1398,6 @@ void mips_malta_init(MachineState *machine)
     /* Northbridge */
     dev = sysbus_create_simple("gt64120", -1, NULL);
     pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
-    /*
-     * The whole address space decoded by the GT-64120A doesn't generate
-     * exception when accessing invalid memory. Create an empty slot to
-     * emulate this feature.
-     */
-    empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
     piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
-- 
2.38.1


