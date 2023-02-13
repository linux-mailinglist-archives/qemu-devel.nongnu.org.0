Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE956694E15
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:33:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcfi-00087m-Ke; Mon, 13 Feb 2023 12:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfd-00084z-67
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:17 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfZ-0005NO-W5
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:16 -0500
Received: by mail-ej1-x634.google.com with SMTP id sa10so33659496ejc.9
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xYV5QNqikJXvVa9yuB52tQumknaV5O5E9rgc+0ATyx8=;
 b=cnLErfY8oSWZXtJLgXyGEFkF7RGwHZ6YqjUWtvt7BvV/DGYNEg0QsqwZQBatDpFZrq
 KqqTcSvs3+sBInrMCCvK8pZElSEdD4d2WCDbvllOEmXn7V8bND1Eyfd1zWoYRoP1fitW
 ZP2XZgB6cCSV9sQOOLckXCwAguOzfpPFvtIADF17pM4BSJ3eUsH+SPSupnkC5haSJrgk
 LidsiJZW0GEvVb8EuiVKkzjREqu5GUfTnDgfO2roeoz+rAB5QsDEJUHZIzpBNP+n1LWT
 mKhpjgH+mS2vdiG6mUx5aopZTpKLKPK9DJzvcKLaxHXVVjwmPzO3HWacmbTaknG3LuEo
 Af7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xYV5QNqikJXvVa9yuB52tQumknaV5O5E9rgc+0ATyx8=;
 b=xzHITatsRwsa29Hkn3boKazi1B5YTvOPQmElvA6fRVswboSLVujlugzP6vDVdk0vcf
 YgOThF/ewuhMItiCmD7VX+xdTNahyz7FuHdoKE7YKPD5R1o3Nky9BgDOd9tBKwGCBryM
 l5SP+YhiyGcRiFaZF0GSAaTPCC5wpcIXmRNJH5De0sXlnN3rynLAmWhtf+ilYfxwio2o
 gI6EfNblDfM+ITgHR0ifzRthc8AQJ/QAj2xXRSeb8LJOghBVrBQDFfZFqnUKhYKHMg+W
 vp0ZeI3SSHYJmuDqgRQx0ISxaI1036rq9XT9STIS0WbRc+ZyRecAd9sX2VNCpH1wuv2w
 gzRg==
X-Gm-Message-State: AO0yUKUIKvlhlMGZniTWMv7evcy5ElXbmGH+IgaXHaHUlJsvVvLLDgJh
 C2xJ0lNgaE5kkjlfhbSSK/G1DliwNfc=
X-Google-Smtp-Source: AK7set/kf/vhzwM/pO/361hYVCqZ3Oe8Rec90OPNPb3EkTfGyZl3nbmWsY1ANXQydNP9e3iolU5+8A==
X-Received: by 2002:a17:906:3896:b0:87b:db53:3829 with SMTP id
 q22-20020a170906389600b0087bdb533829mr26588391ejd.46.1676309472841; 
 Mon, 13 Feb 2023 09:31:12 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906684b00b008aea5e0938esm6988699ejs.183.2023.02.13.09.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 09:31:12 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 11/12] hw/i386/ich9: Clean up includes
Date: Mon, 13 Feb 2023 18:30:32 +0100
Message-Id: <20230213173033.98762-12-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213173033.98762-1-shentey@gmail.com>
References: <20230213173033.98762-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/i386/ich9.h | 8 +++++---
 hw/i386/acpi-build.c   | 1 +
 hw/isa/lpc_ich9.c      | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index d29090a9b7..3125863049 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -1,11 +1,13 @@
 #ifndef HW_ICH9_H
 #define HW_ICH9_H
 
-#include "hw/sysbus.h"
-#include "hw/i386/pc.h"
 #include "hw/isa/apm.h"
-#include "hw/acpi/acpi.h"
 #include "hw/acpi/ich9.h"
+#include "hw/intc/ioapic.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
+#include "exec/memory.h"
+#include "qemu/notify.h"
 #include "qom/object.h"
 
 void ich9_generate_smi(void);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b67dcbbb37..1bb73c3e9a 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -59,6 +59,7 @@
 #include "hw/acpi/pcihp.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/ich9.h"
+#include "hw/i386/pc.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci-host/i440fx.h"
 #include "hw/pci-host/q35.h"
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index e3385ca7be..ce946760bb 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -40,8 +40,8 @@
 #include "hw/irq.h"
 #include "hw/isa/apm.h"
 #include "hw/pci/pci.h"
-#include "hw/pci/pci_bridge.h"
 #include "hw/i386/ich9.h"
+#include "hw/i386/pc.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ich9.h"
 #include "hw/pci/pci_bus.h"
-- 
2.39.1


