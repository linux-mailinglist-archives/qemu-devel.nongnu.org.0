Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A156F4BC6EC
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 09:14:41 +0100 (CET)
Received: from localhost ([::1]:49070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLKt6-0003DO-N2
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 03:14:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLKpP-0001bX-EC; Sat, 19 Feb 2022 03:10:53 -0500
Received: from [2a00:1450:4864:20::42a] (port=43928
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLKoR-0002nk-Dm; Sat, 19 Feb 2022 03:10:45 -0500
Received: by mail-wr1-x42a.google.com with SMTP id i14so18145789wrc.10;
 Sat, 19 Feb 2022 00:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ZUXssCLE4uYCmcYOb1P8/KGnx32KSVKOBHryyB/asE=;
 b=kLxFP+Blp+NIQ1nLNvw2GibXH2vrhl4ngSAFQxUzPWvHWAkHdMaQji6si+QXA8NzMj
 mnZxLs/KniFW0FDbuaJO0CY58Za006M1x+GOEmqwv/pg5mUNLLCqUN52BDPsma/KXdNG
 jR2GCiCOWRTsV7wqVJ7uSbASq9FdZ3FGonqJh23A3duimwsHM/yofqycJ1vu8wUCf+Zn
 4tezzLtv4W7T+5WoXmTlp6WxgmAXfpbmJCal/FB1ABoUQ0g4Gw3O6KJc7uSL7HRL2iTZ
 7ywyOZ74t49Z6y0mBQAbnq4mSrvUNeszc6CTBMm5OscLS7l5cjdRUWtMpVQPj0v7KrOZ
 9MMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ZUXssCLE4uYCmcYOb1P8/KGnx32KSVKOBHryyB/asE=;
 b=jUI+qJ+2sN3oH1PSDnK6FUOK2YQ8cpWzP6KuENpIZVHKdNWo8Y8RCu6wMK67+rrxLn
 e0v/64Q1funu/YxpnaDIRSexRCIaxnkxs7KHFbs6/I30yHNOaLMgmN0pWirOs76GXMOg
 qez3i8sjX+bHqDNlcWpNqAzLln7eovymTIcywlwxncXbllQkrvmTBIcFkg9xlOtlXx/s
 tZ5eYNcmEonrV8r8hzHU7BZHyjOOqJuHQrVeE9kwVZRX2VXa6voUtTwyqa6n0mzu1T5I
 BTe+9mB5LP5RI3DAh5b5K3KRSLc2FGYawfUTiat2EZLdWS0ZYQnMXNYIcLSsHfy0BuwQ
 Lv4Q==
X-Gm-Message-State: AOAM530zls6q31MOghvRUfzUP1NGQDzGzL83NxoaU1MWSIfPqvG3CimR
 1ayracM6kqZXx9P7qaBQPIn7jD0T0Fk/Kw==
X-Google-Smtp-Source: ABdhPJzhnaUmCBeWnaKxVtVrEuszYVvSX0UINL1jmDxgdyT7JGzLm/mpZzcZX1ci087ffzyEm8YLCA==
X-Received: by 2002:adf:e8c5:0:b0:1e4:7c8a:21a7 with SMTP id
 k5-20020adfe8c5000000b001e47c8a21a7mr8768647wrn.516.1645258189411; 
 Sat, 19 Feb 2022 00:09:49 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800a:bb8:1:6510:42ac:bb55:9590])
 by smtp.gmail.com with ESMTPSA id 12sm19940719wry.111.2022.02.19.00.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 00:09:49 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] hw/ide: share bmdma read and write functions between
 piix.c and via.c
Date: Sat, 19 Feb 2022 10:08:18 +0200
Message-Id: <20220219080818.327683-2-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220219080818.327683-1-liavalb@gmail.com>
References: <20220219080818.327683-1-liavalb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: jsnow@redhat.com, Liav Albani <liavalb@gmail.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of letting each implementation to duplicate this code, we can
share these functions between IDE PIIX3/4 and VIA implementations.

Signed-off-by: Liav Albani <liavalb@gmail.com>
---
 hw/ide/pci.c         | 47 ++++++++++++++++++++++++++++++++++++++++
 hw/ide/piix.c        | 50 ++-----------------------------------------
 hw/ide/via.c         | 51 ++------------------------------------------
 include/hw/ide/pci.h |  4 ++++
 4 files changed, 55 insertions(+), 97 deletions(-)

diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 84ba733548..c8b867659a 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -502,6 +502,53 @@ static const struct IDEDMAOps bmdma_ops = {
     .reset = bmdma_reset,
 };
 
+uint64_t bmdma_default_read(void *opaque, hwaddr addr,
+                           unsigned size)
+{
+    BMDMAState *bm = opaque;
+    uint32_t val;
+
+    if (size != 1) {
+        return ((uint64_t)1 << (size * 8)) - 1;
+    }
+
+    switch (addr & 3) {
+    case 0:
+        val = bm->cmd;
+        break;
+    case 2:
+        val = bm->status;
+        break;
+    default:
+        val = 0xff;
+        break;
+    }
+
+    trace_bmdma_read_via(addr, val);
+    return val;
+}
+
+void bmdma_default_write(void *opaque, hwaddr addr,
+                        uint64_t val, unsigned size)
+{
+    BMDMAState *bm = opaque;
+
+    if (size != 1) {
+        return;
+    }
+
+    trace_bmdma_write_via(addr, val);
+    switch (addr & 3) {
+    case 0:
+        bmdma_cmd_writeb(bm, val);
+        break;
+    case 2:
+        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 0x06);
+        break;
+    default:;
+    }
+}
+
 void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d)
 {
     if (bus->dma == &bm->dma) {
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index ce89fd0aa3..fdf3a04cb1 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -35,55 +35,9 @@
 #include "hw/ide/pci.h"
 #include "trace.h"
 
-static uint64_t bmdma_read(void *opaque, hwaddr addr, unsigned size)
-{
-    BMDMAState *bm = opaque;
-    uint32_t val;
-
-    if (size != 1) {
-        return ((uint64_t)1 << (size * 8)) - 1;
-    }
-
-    switch(addr & 3) {
-    case 0:
-        val = bm->cmd;
-        break;
-    case 2:
-        val = bm->status;
-        break;
-    default:
-        val = 0xff;
-        break;
-    }
-
-    trace_bmdma_read(addr, val);
-    return val;
-}
-
-static void bmdma_write(void *opaque, hwaddr addr,
-                        uint64_t val, unsigned size)
-{
-    BMDMAState *bm = opaque;
-
-    if (size != 1) {
-        return;
-    }
-
-    trace_bmdma_write(addr, val);
-
-    switch(addr & 3) {
-    case 0:
-        bmdma_cmd_writeb(bm, val);
-        break;
-    case 2:
-        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 0x06);
-        break;
-    }
-}
-
 static const MemoryRegionOps piix_bmdma_ops = {
-    .read = bmdma_read,
-    .write = bmdma_write,
+    .read = bmdma_default_read,
+    .write = bmdma_default_write,
 };
 
 static void bmdma_setup_bar(PCIIDEState *d)
diff --git a/hw/ide/via.c b/hw/ide/via.c
index 82def819c4..13f27c9514 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -33,56 +33,9 @@
 #include "hw/ide/pci.h"
 #include "trace.h"
 
-static uint64_t bmdma_read(void *opaque, hwaddr addr,
-                           unsigned size)
-{
-    BMDMAState *bm = opaque;
-    uint32_t val;
-
-    if (size != 1) {
-        return ((uint64_t)1 << (size * 8)) - 1;
-    }
-
-    switch (addr & 3) {
-    case 0:
-        val = bm->cmd;
-        break;
-    case 2:
-        val = bm->status;
-        break;
-    default:
-        val = 0xff;
-        break;
-    }
-
-    trace_bmdma_read_via(addr, val);
-    return val;
-}
-
-static void bmdma_write(void *opaque, hwaddr addr,
-                        uint64_t val, unsigned size)
-{
-    BMDMAState *bm = opaque;
-
-    if (size != 1) {
-        return;
-    }
-
-    trace_bmdma_write_via(addr, val);
-    switch (addr & 3) {
-    case 0:
-        bmdma_cmd_writeb(bm, val);
-        break;
-    case 2:
-        bm->status = (val & 0x60) | (bm->status & 1) | (bm->status & ~val & 0x06);
-        break;
-    default:;
-    }
-}
-
 static const MemoryRegionOps via_bmdma_ops = {
-    .read = bmdma_read,
-    .write = bmdma_write,
+    .read = bmdma_default_read,
+    .write = bmdma_default_write,
 };
 
 static void bmdma_setup_bar(PCIIDEState *d)
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index d8384e1c42..159136f055 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -62,6 +62,10 @@ static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
 }
 
 void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
+uint64_t bmdma_default_read(void *opaque, hwaddr addr,
+                           unsigned size);
+void bmdma_default_write(void *opaque, hwaddr addr,
+                        uint64_t val, unsigned size);
 void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
 extern MemoryRegionOps bmdma_addr_ioport_ops;
 void pci_ide_create_devs(PCIDevice *dev);
-- 
2.35.1


