Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3CA65F2E8
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:38:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDUAx-00087w-Vl; Thu, 05 Jan 2023 12:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDUAv-00083F-3Z
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:37:09 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDUAt-0006Ap-Cp
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:37:08 -0500
Received: by mail-wr1-x435.google.com with SMTP id m7so2406005wrn.10
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 09:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nh8sFNt/MgMslzFaLFWHZDavtwEbM+zn5xp0sJxXPCs=;
 b=EMdIonighqO4PR/CrOBsujTEsz53L7yqxJF9JmGhGUSQIRAhIbpQSHiw6lhNuKKojO
 6L21Pr7eDe3jGyeS8IypBXL3WFxSmcb2fEKXpHSQIScdC2pb/RGxHxXk/Wm+FddTQirx
 g8IWGIpWY6ppMxFh/5ZaSSNZVIK31YrRHORMULR+nCNjGAUW2umXchqRzGjcX4owByHM
 VxN22LH8fz/+Olbd6h6dPO171PdWoXhcWYj1ALTPkScAmS3gV5UwcQEaCf8zeVMH9AG8
 j2EPYGLhOnVZmmQVB5IgoQJM0H060IDqus7CvQK7d+WyUWdkwubs09y0W57q14rlEz+1
 brMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nh8sFNt/MgMslzFaLFWHZDavtwEbM+zn5xp0sJxXPCs=;
 b=7Hn+zWD2ScNA/VlH35hzBlA8Doufl+ZEwT+DR2Sv+t+Mj3wpCoeNRDiqAOPgC+XKQI
 /LN+DifTFihWCOa3DdzeHsU0ROvpxvGZZovhy/0RYv4XhPMeOeV0cF8axoawhmLQEIar
 4UYEdSv6g+yb+wu7h6mMZC9eTOSdHOeUYfVebdIF2XgA8hWAyQxDYs2u0SX0y+x3Jbca
 lF9ZKxluDa9iv3Edo/IqrPzGBD9cDN3Ll0FSmLdBGFQC5lbBynsjtyr+H367pwEnoMEh
 izHyaQiiLCjaGPFR50/klCf+dTnzU1efXoLAb+hOh8vbUkdFjSt9wYEW6oNrHmWr0Pza
 W2ew==
X-Gm-Message-State: AFqh2kpL7uxHjQKkcoVUG4cTr/DuiodDKmJvX/mLeRVXTnI9pdxXU3yD
 FsDlIzxznmDmGBvG9+TTbrqxOebjRn8hg0Qx
X-Google-Smtp-Source: AMrXdXv6ghPaNhYzkZDDIEUrhjCnDCPRO63VRjR8dIcXC5jJikzGwpEUb4lAriiiZoxkSIhoQ6Rf8Q==
X-Received: by 2002:a05:6000:705:b0:267:e918:d1e6 with SMTP id
 bs5-20020a056000070500b00267e918d1e6mr32176218wrb.51.1672940225446; 
 Thu, 05 Jan 2023 09:37:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o6-20020adfa106000000b002423620d356sm37778832wro.35.2023.01.05.09.37.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jan 2023 09:37:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bernhard Beschow <shentey@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2] hw/pci-host: Use register definitions from PCI standard
Date: Thu,  5 Jan 2023 18:37:02 +0100
Message-Id: <20230105173702.56610-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

No need to document magic values when the definition names
from "standard-headers/linux/pci_regs.h" are self-explicit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/grackle.c  |  2 +-
 hw/pci-host/raven.c    |  6 +++---
 hw/pci-host/uninorth.c | 33 +++++++++++----------------------
 3 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
index 95945ac0f4..2a45cc13c3 100644
--- a/hw/pci-host/grackle.c
+++ b/hw/pci-host/grackle.c
@@ -91,7 +91,7 @@ static void grackle_init(Object *obj)
 
 static void grackle_pci_realize(PCIDevice *d, Error **errp)
 {
-    d->config[0x09] = 0x01;
+    d->config[PCI_CLASS_PROG] = 0x01;
 }
 
 static void grackle_pci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 7a105e4a63..c47259a851 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -329,9 +329,9 @@ static void raven_realize(PCIDevice *d, Error **errp)
     char *filename;
     int bios_size = -1;
 
-    d->config[0x0C] = 0x08; // cache_line_size
-    d->config[0x0D] = 0x10; // latency_timer
-    d->config[0x34] = 0x00; // capabilities_pointer
+    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
+    d->config[PCI_LATENCY_TIMER] = 0x10;
+    d->config[PCI_CAPABILITY_LIST] = 0x00;
 
     memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios", BIOS_SIZE,
                                      &error_fatal);
diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
index 8396c91d59..38b38c8a00 100644
--- a/hw/pci-host/uninorth.c
+++ b/hw/pci-host/uninorth.c
@@ -276,12 +276,9 @@ static void pci_unin_internal_init(Object *obj)
 
 static void unin_main_pci_host_realize(PCIDevice *d, Error **errp)
 {
-    /* cache_line_size */
-    d->config[0x0C] = 0x08;
-    /* latency_timer */
-    d->config[0x0D] = 0x10;
-    /* capabilities_pointer */
-    d->config[0x34] = 0x00;
+    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
+    d->config[PCI_LATENCY_TIMER] = 0x10;
+    d->config[PCI_CAPABILITY_LIST] = 0x00;
 
     /*
      * Set kMacRISCPCIAddressSelect (0x48) register to indicate PCI
@@ -296,30 +293,22 @@ static void unin_main_pci_host_realize(PCIDevice *d, Error **errp)
 
 static void unin_agp_pci_host_realize(PCIDevice *d, Error **errp)
 {
-    /* cache_line_size */
-    d->config[0x0C] = 0x08;
-    /* latency_timer */
-    d->config[0x0D] = 0x10;
-    /* capabilities_pointer
-    d->config[0x34] = 0x80; */
+    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
+    d->config[PCI_LATENCY_TIMER] = 0x10;
+    /* d->config[PCI_CAPABILITY_LIST] = 0x80; */
 }
 
 static void u3_agp_pci_host_realize(PCIDevice *d, Error **errp)
 {
-    /* cache line size */
-    d->config[0x0C] = 0x08;
-    /* latency timer */
-    d->config[0x0D] = 0x10;
+    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
+    d->config[PCI_LATENCY_TIMER] = 0x10;
 }
 
 static void unin_internal_pci_host_realize(PCIDevice *d, Error **errp)
 {
-    /* cache_line_size */
-    d->config[0x0C] = 0x08;
-    /* latency_timer */
-    d->config[0x0D] = 0x10;
-    /* capabilities_pointer */
-    d->config[0x34] = 0x00;
+    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
+    d->config[PCI_LATENCY_TIMER] = 0x10;
+    d->config[PCI_CAPABILITY_LIST] = 0x00;
 }
 
 static void unin_main_pci_host_class_init(ObjectClass *klass, void *data)
-- 
2.38.1


