Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F4C651FFE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:59:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7atd-00047q-KA; Tue, 20 Dec 2022 06:34:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7atZ-000458-Nt
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:34:55 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7atX-000807-QA
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:34:53 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so10922506wmh.0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwQz7LfMVtzoHUrBPaHv4lNXbKHJnpkJXHPaGfYBvc0=;
 b=aHB2jpMIHhBJDFKG9VVvlyD8Poxkq6XiNS8rXhLSRKUW+tiJ9xSsLcKfQ5mhEs+zh9
 /7dZIJEOgVLTYsNpNWeNSFXhhD8xQ1De9VgyoqXhhe9pAz8RkeCl4foMifNrJ2D2UlB3
 dNqGgZ8JtopMzpEooXDNsRagn0wWM+Z4wIiQ8VZocVzXxn0KHElomBUIz+slJ4xHj4+T
 CZcNCNmpkDEIV9tu/GAO0iwDBUU1hcRt0/GhSE4s6oLf2KyQt65W2HmPHwoXluTFHk/g
 Bsfz5JkoXKhWr+wieW54PR/U6TRN/Y4qc3unpLV4pcy6/JP/GLOTfekE8mwt2Oh3ArH+
 pW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwQz7LfMVtzoHUrBPaHv4lNXbKHJnpkJXHPaGfYBvc0=;
 b=40EQN/d0Wynd7eR8pQphsEyCxoyD5X3KuDG1C7WmQeuGeu2cD91/dWsflqbhHznb79
 UO0HPuCUR5UMrPfevGqS75pg5/VSt4SJFtFPTxSMdBvsnPP+OtFSHX6IHRWvScaC4WFQ
 R4l0ND1DV8m5bhiidjsguyBGNEw5RSumlWh6kBJxFvqNPCuo4GXiHrHISnvjYRGBzUfc
 F5oHlvvkuPsWnjtz8OMByvM4kO8N0Yckk1AU7NMvkBpI6QHlaC5G786n4UOs4Q2+aoQw
 pX6cEVHhFCiHz+VVo6potwhHYb/D6N+L4LAgHqYx5+tmbKWEdEJctdSSo+P+urWBrlS8
 etew==
X-Gm-Message-State: AFqh2krUbrL4hHqPVXjQ/Qqdkyc3HnqhLCcy3MtpH5Q1yKarNbDTYSD0
 hHd51+D/b7uV3aX1WaHTFr547TZDEArtgGzGbDI=
X-Google-Smtp-Source: AMrXdXsbc0C7rS8aB9oG7n7czRym9kRwrPTeljlVDdBKHWzC1MmojcPxbt8Fot5do5qGrDPwqWHnIw==
X-Received: by 2002:a05:600c:3644:b0:3d2:39dc:4ab9 with SMTP id
 y4-20020a05600c364400b003d239dc4ab9mr1379200wmq.13.1671536090239; 
 Tue, 20 Dec 2022 03:34:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a05600c491800b003c6bbe910fdsm25284213wmp.9.2022.12.20.03.34.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:34:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 2/7] hw/mips/gt64xxx_pci: Let the GT64120 manage the lower
 512MiB hole
Date: Tue, 20 Dec 2022 12:34:31 +0100
Message-Id: <20221220113436.14299-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220113436.14299-1-philmd@linaro.org>
References: <20221220113436.14299-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
index 416161f833..c2b5f322fc 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -26,7 +26,6 @@ CONFIG_IDE_ISA=y
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
index 19d0d9889f..1b9ac7f792 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -28,6 +28,7 @@
 #include "qemu/log.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_host.h"
+#include "hw/misc/empty_slot.h"
 #include "migration/vmstate.h"
 #include "hw/intc/i8259.h"
 #include "hw/irq.h"
@@ -1162,6 +1163,13 @@ static void gt64120_realize(DeviceState *dev, Error **errp)
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
index c0a2e0ab04..ba92022f87 100644
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
@@ -1393,12 +1392,6 @@ void mips_malta_init(MachineState *machine)
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


