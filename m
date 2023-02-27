Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB096A44C0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:39:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe8m-0004xO-MT; Mon, 27 Feb 2023 09:06:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8b-0004hJ-A2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:59 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8V-0008Tj-Ks
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:55 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bx12so3194245wrb.11
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=08h5Sg79+cASqvgDSYHDJ7cpvTKNlaT94Ic05Ks8HVE=;
 b=zUtkzdcoewXrWXfPux5I8yv6KgCTkxyoc5zbh2pcH5CMYArFOOrjmtEvSVdIKruyzo
 HOVE+9PUZ2no0jPEX9zDi6omlLf3PjvOnYz48/Zd5vVW0e1lda9MMG5/4JkrKsU6woZZ
 e34nj6l8kxwl23bect04RdtNs0YnXhcWNpxHpbA90uar0B3SD9SRaoad+wmBXaUf2Je2
 6hX/PYethnKnXXNAFDONyFDN5HUDzOsDbhKGS80Ob3fHHlSnooFCohePvEKDbg6UU4n9
 9K6CdE3PzCh3I6ekbl37pzuhWI/v4wJP6AHPrNKzfwYaFXkPdiTPFw457IrekDlCD11P
 I7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=08h5Sg79+cASqvgDSYHDJ7cpvTKNlaT94Ic05Ks8HVE=;
 b=s206kmAxO2c/lSbri6+fWq03XHDPEmr+StBBigixh6NslhbnV8wezPCKTkVM/IfPnf
 9JYupizYukpCB8XlqdEcOtJC6FIxQ6u8OGAUPKCcu4cfLDIdsYBuSUFaIgnk5IxTxGy7
 uRyfbR/22xULJsuasWPQiQUpMwdBfVkBZ9MHQOYnb9u60GMjb597jkG6d48bHi1vrg+n
 pA+GcnoggBfN/9eaGz5BskSVgGaloODFWfpTehYDpu/ag3RW4m5AkAx/dEbdDmTbSVjj
 NMnFQFaW1LqHi60Ft6hn2KxG2S2LLjLhL1KVywOjapmGEdUfGXSFUqGdgFm0I7oi7UJa
 a7Yg==
X-Gm-Message-State: AO0yUKVOXRTBX6yt7J/fWfcfalDAwMEqFRzWPnfnFvtjtInTZ7wgMHEj
 x9h6T5RDKkc4E82STq8fsd38nfE0i3TATpp1
X-Google-Smtp-Source: AK7set/SYtT9sX1UUVcN9WNEH6Rn/GGEKPnhNPdNi5h8cuNWUl4/m8/RJhW7PpYX+6kQqt4XUvUo3w==
X-Received: by 2002:a5d:564a:0:b0:2c7:1d26:7686 with SMTP id
 j10-20020a5d564a000000b002c71d267686mr11201698wrw.3.1677506749385; 
 Mon, 27 Feb 2023 06:05:49 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a7bcb95000000b003e21f959453sm9374905wmi.32.2023.02.27.06.05.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:05:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 049/126] hw: Move ioapic*.h to intc/
Date: Mon, 27 Feb 2023 15:00:56 +0100
Message-Id: <20230227140213.35084-40-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

The ioapic sources reside in hw/intc already. Move the headers there
as well.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230213173033.98762-11-shentey@gmail.com>
[PMD: Keep ioapic_internal.h in hw/intc/, not under include/]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                                    | 1 +
 hw/i386/kvm/ioapic.c                           | 3 +--
 hw/i386/pc.c                                   | 2 +-
 hw/i386/pc_q35.c                               | 2 +-
 hw/intc/apic.c                                 | 2 +-
 hw/intc/ioapic.c                               | 4 ++--
 hw/intc/ioapic_common.c                        | 4 ++--
 {include/hw/i386 => hw/intc}/ioapic_internal.h | 8 ++++----
 include/hw/i386/x86.h                          | 2 +-
 include/hw/{i386 => intc}/ioapic.h             | 6 +++---
 target/i386/whpx/whpx-all.c                    | 2 +-
 11 files changed, 18 insertions(+), 18 deletions(-)
 rename {include/hw/i386 => hw/intc}/ioapic_internal.h (96%)
 rename include/hw/{i386 => intc}/ioapic.h (93%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 75dccf0b4e..2c7731aeb7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1711,6 +1711,7 @@ F: include/hw/char/parallel.h
 F: include/hw/dma/i8257.h
 F: include/hw/i2c/pm_smbus.h
 F: include/hw/input/i8042.h
+F: include/hw/intc/ioapic*
 F: include/hw/isa/i8259_internal.h
 F: include/hw/isa/superio.h
 F: include/hw/timer/hpet.h
diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
index 272e26b4a2..cd5ea5d60b 100644
--- a/hw/i386/kvm/ioapic.c
+++ b/hw/i386/kvm/ioapic.c
@@ -12,9 +12,8 @@
 
 #include "qemu/osdep.h"
 #include "monitor/monitor.h"
-#include "hw/i386/x86.h"
 #include "hw/qdev-properties.h"
-#include "hw/i386/ioapic_internal.h"
+#include "hw/intc/ioapic_internal.h"
 #include "hw/intc/kvm_irqcount.h"
 #include "sysemu/kvm.h"
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d257545018..7ad71b19aa 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -28,7 +28,6 @@
 #include "hw/i386/pc.h"
 #include "hw/char/serial.h"
 #include "hw/char/parallel.h"
-#include "hw/i386/ioapic.h"
 #include "hw/i386/topology.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/vmport.h"
@@ -47,6 +46,7 @@
 #include "multiboot.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/intc/i8259.h"
+#include "hw/intc/ioapic.h"
 #include "hw/timer/i8254.h"
 #include "hw/input/i8042.h"
 #include "hw/irq.h"
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index d35316878d..0afea6705c 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -43,11 +43,11 @@
 #include "hw/i386/ich9.h"
 #include "hw/i386/amd_iommu.h"
 #include "hw/i386/intel_iommu.h"
-#include "hw/i386/ioapic.h"
 #include "hw/display/ramfb.h"
 #include "hw/firmware/smbios.h"
 #include "hw/ide/pci.h"
 #include "hw/ide/ahci.h"
+#include "hw/intc/ioapic.h"
 #include "hw/usb.h"
 #include "hw/usb/hcd-uhci.h"
 #include "qapi/error.h"
diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 2d3e55f4e2..0ff060f721 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -20,7 +20,7 @@
 #include "qemu/thread.h"
 #include "hw/i386/apic_internal.h"
 #include "hw/i386/apic.h"
-#include "hw/i386/ioapic.h"
+#include "hw/intc/ioapic.h"
 #include "hw/intc/i8259.h"
 #include "hw/intc/kvm_irqcount.h"
 #include "hw/pci/msi.h"
diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
index 264262959d..6364ecab1b 100644
--- a/hw/intc/ioapic.c
+++ b/hw/intc/ioapic.c
@@ -24,10 +24,10 @@
 #include "qapi/error.h"
 #include "monitor/monitor.h"
 #include "hw/i386/apic.h"
-#include "hw/i386/ioapic.h"
-#include "hw/i386/ioapic_internal.h"
 #include "hw/i386/x86.h"
 #include "hw/intc/i8259.h"
+#include "hw/intc/ioapic.h"
+#include "hw/intc/ioapic_internal.h"
 #include "hw/pci/msi.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/kvm.h"
diff --git a/hw/intc/ioapic_common.c b/hw/intc/ioapic_common.c
index aa5f760871..b05f436dac 100644
--- a/hw/intc/ioapic_common.c
+++ b/hw/intc/ioapic_common.c
@@ -24,9 +24,9 @@
 #include "qemu/module.h"
 #include "migration/vmstate.h"
 #include "monitor/monitor.h"
-#include "hw/i386/ioapic.h"
-#include "hw/i386/ioapic_internal.h"
 #include "hw/intc/intc.h"
+#include "hw/intc/ioapic.h"
+#include "hw/intc/ioapic_internal.h"
 #include "hw/sysbus.h"
 
 /* ioapic_no count start from 0 to MAX_IOAPICS,
diff --git a/include/hw/i386/ioapic_internal.h b/hw/intc/ioapic_internal.h
similarity index 96%
rename from include/hw/i386/ioapic_internal.h
rename to hw/intc/ioapic_internal.h
index e8ff338d7f..37b8565539 100644
--- a/include/hw/i386/ioapic_internal.h
+++ b/hw/intc/ioapic_internal.h
@@ -19,11 +19,11 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef QEMU_IOAPIC_INTERNAL_H
-#define QEMU_IOAPIC_INTERNAL_H
+#ifndef HW_INTC_IOAPIC_INTERNAL_H
+#define HW_INTC_IOAPIC_INTERNAL_H
 
 #include "exec/memory.h"
-#include "hw/i386/ioapic.h"
+#include "hw/intc/ioapic.h"
 #include "hw/sysbus.h"
 #include "qemu/notify.h"
 #include "qom/object.h"
@@ -115,4 +115,4 @@ void ioapic_reset_common(DeviceState *dev);
 
 void ioapic_stat_update_irq(IOAPICCommonState *s, int irq, int level);
 
-#endif /* QEMU_IOAPIC_INTERNAL_H */
+#endif /* HW_INTC_IOAPIC_INTERNAL_H */
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index a09388b657..890dfad23e 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -22,8 +22,8 @@
 
 #include "hw/boards.h"
 #include "hw/nmi.h"
+#include "hw/intc/ioapic.h"
 #include "hw/isa/isa.h"
-#include "hw/i386/ioapic.h"
 #include "qom/object.h"
 
 struct X86MachineClass {
diff --git a/include/hw/i386/ioapic.h b/include/hw/intc/ioapic.h
similarity index 93%
rename from include/hw/i386/ioapic.h
rename to include/hw/intc/ioapic.h
index ef37b8a9fd..aa122e25e3 100644
--- a/include/hw/i386/ioapic.h
+++ b/include/hw/intc/ioapic.h
@@ -17,8 +17,8 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef HW_IOAPIC_H
-#define HW_IOAPIC_H
+#ifndef HW_INTC_IOAPIC_H
+#define HW_INTC_IOAPIC_H
 
 #define IOAPIC_NUM_PINS 24
 #define IO_APIC_DEFAULT_ADDRESS 0xfec00000
@@ -30,4 +30,4 @@
 
 void ioapic_eoi_broadcast(int vector);
 
-#endif /* HW_IOAPIC_H */
+#endif /* HW_INTC_IOAPIC_H */
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index e738d83e81..3d0c0b375f 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -19,7 +19,7 @@
 #include "sysemu/runstate.h"
 #include "qemu/main-loop.h"
 #include "hw/boards.h"
-#include "hw/i386/ioapic.h"
+#include "hw/intc/ioapic.h"
 #include "hw/i386/apic_internal.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
-- 
2.38.1


