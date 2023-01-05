Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D95A365EF09
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:43:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRRd-0000B7-Ma; Thu, 05 Jan 2023 09:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDRRE-00006X-JE
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:41:49 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDRRC-0003gf-4I
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:41:48 -0500
Received: by mail-wm1-x335.google.com with SMTP id ja17so28172022wmb.3
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 06:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p1bd5FHNKdTesBkkzYYqtQBUW8rR1SSO2CgSCTIRLow=;
 b=G51wMLeozsTBY5T49HrFnHhkiYQ6fDCOtpu9YLTmfOCyMtUTtadDDf21bNZsPiGWOj
 mddN3q/WVNatBeblU5muvOM+BmoaCwto9lsyJgyObga0n3yzu1MnLjBQrl47qhaOFug7
 /UPRh0QGnJEkgtTr3jA2UZe+KEDLGryJfaK+wwBU1KUa0AXDe1DTptyF8y8QpTvnr+Rj
 bXJE4aks0Yb0C1Vn8mGNISazc6UOukpMjwxW0dWHB6LnNC/ocwS2RKRLyiBNTgiph+Go
 4es78WWDU0BExhHga8XQIS4VklLn2v2KbsROEmyLip3t0FgY+RWI8J9T4zyHEOtqbra+
 3N3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p1bd5FHNKdTesBkkzYYqtQBUW8rR1SSO2CgSCTIRLow=;
 b=EA8GuSMC4MvF7BujRFab4tvC/HL3kvfB0tSC6V4boLv7mEQAGkr4w/Em77z1ZuFdX7
 MPp2EPRMVMZ1vYXBUIdM402u1fjIjblA0puq5Gf6rcbd3KeKrMHGswDeF6t3DgQVDo7s
 VzEQxIKEiPtrYzI57Z5+WX7Wx+fpOgkemcNh/tw7X7cvBphtAOY2PdH5FrQIRAawydzS
 i+C8G1PMcq4BP1pxA9N2x6ssREGq6BwOasXL2amo61wrnGunP7gwuPsdHJqAgVupaXQO
 WUd0juXlcYJicck3KUkCVIFs/YFc+qoUtUVIxLVaeBs34R8Va54WXUV1qdGcAeLasKoz
 Me6g==
X-Gm-Message-State: AFqh2kr1P9GtDIkCFLCvo1ABTmueFVlrwdTQBOgcaY5yNHIcs/me/whQ
 TIaenzMJpknKKCQaDKDw9uBetoHcJU9DJxQP
X-Google-Smtp-Source: AMrXdXtZx0gwJKhqFcgw4PhV1d9kW14Lgcfr7DkOXP9qehmm7Moi74E0OA6yiFoUNTJGvn8CsD2aLw==
X-Received: by 2002:a05:600c:354b:b0:3d0:4993:d45b with SMTP id
 i11-20020a05600c354b00b003d04993d45bmr38012861wmq.4.1672929704051; 
 Thu, 05 Jan 2023 06:41:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j25-20020a05600c1c1900b003cfa80443a0sm2984884wms.35.2023.01.05.06.41.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jan 2023 06:41:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/pci-host: Use register definitions from PCI standard
Date: Thu,  5 Jan 2023 15:41:42 +0100
Message-Id: <20230105144142.51990-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
 hw/pci-host/uninorth.c | 30 +++++++++++-------------------
 3 files changed, 15 insertions(+), 23 deletions(-)

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
index 8396c91d59..342baff12a 100644
--- a/hw/pci-host/uninorth.c
+++ b/hw/pci-host/uninorth.c
@@ -277,11 +277,11 @@ static void pci_unin_internal_init(Object *obj)
 static void unin_main_pci_host_realize(PCIDevice *d, Error **errp)
 {
     /* cache_line_size */
-    d->config[0x0C] = 0x08;
+    d->config[PCI_CACHE_LINE_SIZE] = 0x08;
     /* latency_timer */
-    d->config[0x0D] = 0x10;
+    d->config[PCI_LATENCY_TIMER] = 0x10;
     /* capabilities_pointer */
-    d->config[0x34] = 0x00;
+    d->config[PCI_CAPABILITY_LIST] = 0x00;
 
     /*
      * Set kMacRISCPCIAddressSelect (0x48) register to indicate PCI
@@ -296,30 +296,22 @@ static void unin_main_pci_host_realize(PCIDevice *d, Error **errp)
 
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


