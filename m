Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3BE694E0F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:33:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcfg-000873-Bo; Mon, 13 Feb 2023 12:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfd-000850-6K
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:17 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfY-0005Q6-Q2
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:16 -0500
Received: by mail-ej1-x629.google.com with SMTP id hx15so33658600ejc.11
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TXFY8RzSCMNNu6cwNWQKcxAMCKvEa/Y+pT6lemvRtLU=;
 b=HSu9aVASCy33as6Gci59JyPmVnoREyGgy2X7ZPSsNKYXrX5zZ0GE9ODYeffvXHOzeh
 /aLee2Tu73e03nFWrKBRUKt1Njjeq9YfScw2GZY7Zf8yZ/MXvK8tS1D3aofBB3/piFNu
 5Ld1FTJnE0SDYSrSBHQVYWsIDJi/+3ZpudnR7Xjtj97FdW7bAlgeYsUCbMf7y94MnFa4
 kt0+Aisc6PzGGIsXbK+hbkKBEA7Hz9db39x8CuovaMRXRkqVZsT/sIWLKRC8Ef5uGjIc
 8yHTUsU/Fa3p9De9xyzZRXFwBh7OtF5WuX7NFGyxILLXq/moatwfc/zrMGRqVUGe8PkQ
 89Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TXFY8RzSCMNNu6cwNWQKcxAMCKvEa/Y+pT6lemvRtLU=;
 b=c0CeuY9evASMs5WpanJqsNR3I3Ur93/9//WIZTgyySMJYtuQa1jAogxziVNmus1CbU
 gmMPbEL+7mzh4oTNUpKWz+Z4WhLLfeLLJ7Po2PRZm6pMNlyr/pXS5DCH1vUha4dSRKvB
 nR0j8WnJYSnfk2ktKFiEwTwHMA0w/AALbG7IGKGiWhNVox1yWwWxe4Q79AnA6QOaOnV3
 7d9xKMwYBg+EThuQ4N5YrZeIPsy+LZvg9X6MvXhXNTvMmc9lHQGm6PbraaAdwFc/PvBv
 9qAWzn/BePIVtHz0cm/VW/JEPBqCCISIFUJUTJVHiecqapLpqPkYMzMfQzMbO7soriIs
 dL5w==
X-Gm-Message-State: AO0yUKXWvFUitgvA66gJSfU5+AMhaCe1jduFgAoSHPAfFoFTcSXsV7CS
 dwPhyd/Fc4duAC/0KHYPrC4t69/rDjY=
X-Google-Smtp-Source: AK7set/eLZDpZYy5XRrXvGif2uTrK6ywzH79HeuRN7Up3CIq7hTRaTjwjMTaaj5z+yvoxujmiDenAg==
X-Received: by 2002:a17:906:4483:b0:84d:4e4f:1f85 with SMTP id
 y3-20020a170906448300b0084d4e4f1f85mr25789059ejo.59.1676309471228; 
 Mon, 13 Feb 2023 09:31:11 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906684b00b008aea5e0938esm6988699ejs.183.2023.02.13.09.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 09:31:10 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 10/12] hw: Move ioapic*.h to intc/
Date: Mon, 13 Feb 2023 18:30:31 +0100
Message-Id: <20230213173033.98762-11-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213173033.98762-1-shentey@gmail.com>
References: <20230213173033.98762-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The ioapic sources reside in hw/intc already. Move the headers there as
well.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 MAINTAINERS                                 | 1 +
 include/hw/i386/x86.h                       | 2 +-
 include/hw/{i386 => intc}/ioapic.h          | 6 +++---
 include/hw/{i386 => intc}/ioapic_internal.h | 8 ++++----
 hw/i386/kvm/ioapic.c                        | 3 +--
 hw/i386/pc.c                                | 2 +-
 hw/i386/pc_q35.c                            | 2 +-
 hw/intc/apic.c                              | 2 +-
 hw/intc/ioapic.c                            | 4 ++--
 hw/intc/ioapic_common.c                     | 4 ++--
 target/i386/whpx/whpx-all.c                 | 2 +-
 11 files changed, 18 insertions(+), 18 deletions(-)
 rename include/hw/{i386 => intc}/ioapic.h (93%)
 rename include/hw/{i386 => intc}/ioapic_internal.h (96%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96e25f62ac..20460ce254 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1708,6 +1708,7 @@ F: include/hw/char/parallel.h
 F: include/hw/dma/i8257.h
 F: include/hw/i2c/pm_smbus.h
 F: include/hw/input/i8042.h
+F: include/hw/intc/ioapic*
 F: include/hw/isa/i8259_internal.h
 F: include/hw/isa/superio.h
 F: include/hw/timer/hpet.h
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 6f52f8fe95..5256c1e848 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -23,8 +23,8 @@
 #include "hw/i386/topology.h"
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
diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/intc/ioapic_internal.h
similarity index 96%
rename from include/hw/i386/ioapic_internal.h
rename to include/hw/intc/ioapic_internal.h
index e8ff338d7f..37b8565539 100644
--- a/include/hw/i386/ioapic_internal.h
+++ b/include/hw/intc/ioapic_internal.h
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
index cbca3f5db5..b6c353346c 100644
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
index 28434612af..da2fa11b6f 100644
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
2.39.1


