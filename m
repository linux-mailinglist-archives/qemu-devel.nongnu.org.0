Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588873DA3D4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 15:21:05 +0200 (CEST)
Received: from localhost ([::1]:34326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95yC-0005dv-Eu
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 09:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m95wd-0004fH-7v
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:19:27 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m95wb-0004g1-5j
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:19:26 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so15582172pjb.3
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 06:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uYVg/PTIB3E4S7egIXwWJQliyCjkeCMDGtZ+ccfdCZg=;
 b=oPwTtbpF3k8uFQ0U8uJdyKvMBzpNOM2AsOrwTxkpxq2EkEggTm/Hynmi0TwCzX2jVw
 yuOkzvOKNcPE5F8OHgbLIKGCzlHy8xpvqhMa75dcPubLzpep8fKVeLY51RR7dcJyw6Ye
 pRbafx5Hx+VoQEioB0Zs/NnPVsYfMs5wcd6gGRvFSE2oaUI2PUZWv260v+4x98gq2rIh
 xoYhXcWmK4pi5i+j7rMhD2FwYvoHDffjBZ8Nwr/WLMfxhbuW9F+hB0zWRc2FlO4FNcdP
 qRAJHCvW3BGYQ74SkzJjRNpnq4Oxy7TqnppeeKnk/Gxhx7ti3JtUZE7ZjTQb5Hbd9Sy1
 XMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uYVg/PTIB3E4S7egIXwWJQliyCjkeCMDGtZ+ccfdCZg=;
 b=ffVk7PS/q2wEgBKE1hEgUn+SOyL/BBUSH8lcduModxN+XOZsx2MikPQuBdi3zPO8+t
 8h0hOnHQBeYt06/7H2caVgH88KkPBzwKArP/siiYum8Hr4vZW/EarE8TXFzRrzilpq9Y
 AccLuYjJ5Y18Qy2l/5sxfjruwGH+CYUdzl41MKgt/KWmfsRL5lFQ7KhAGb+fBVqs21gR
 RstFMpWZKu0DvfaPWTgHiuDy4lbkSSQ5TlSmwbQNv3KY67lvFcre890CG25qesbazSA2
 bQlBasdPYOm/tp0B5Z7ybzbIHei5lbGM6sS1jG6ob6nJ79PLqYQ2OWzMywLkLtuJjojw
 keIg==
X-Gm-Message-State: AOAM531/nFrZzGqDfaevb+b075fRDyBcNeHcFU3hAndwsKpiAfusosbZ
 xkOjo0qW+jWFLCwFOUZ6hi+8HI21TRnSSw==
X-Google-Smtp-Source: ABdhPJz1gb0uj84wj/UaWmz2Lwuj7XOWwW9CUEACai3+/nAR5gGuojUqS+HktW+FjcXNTbN3fdFSLg==
X-Received: by 2002:a65:644d:: with SMTP id s13mr3821416pgv.172.1627564763190; 
 Thu, 29 Jul 2021 06:19:23 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.242.235])
 by smtp.googlemail.com with ESMTPSA id b19sm3780598pfo.97.2021.07.29.06.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 06:19:22 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/acpi: use existing references to pci device struct within
 functions
Date: Thu, 29 Jul 2021 18:49:10 +0530
Message-Id: <20210729131910.520775-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no need to use fresh typecasts to get references to pci device structs
when there is an existing reference to pci device struct. Use existing reference.
Minor cleanup.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/pcihp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Make and make check passed.

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 054ee8cbc5..e0f68c4fcf 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -291,7 +291,7 @@ void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
 
     /* Only hotplugged devices need the hotplug capability. */
     if (dev->hotplugged &&
-        acpi_pcihp_get_bsel(pci_get_bus(PCI_DEVICE(dev))) < 0) {
+        acpi_pcihp_get_bsel(pci_get_bus(pdev)) < 0) {
         error_setg(errp, "Unsupported bus. Bus doesn't have property '"
                    ACPI_PCIHP_PROP_BSEL "' set");
         return;
@@ -371,8 +371,8 @@ void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
 {
     PCIDevice *pdev = PCI_DEVICE(dev);
 
-    trace_acpi_pci_unplug(PCI_SLOT(PCI_DEVICE(dev)->devfn),
-                          acpi_pcihp_get_bsel(pci_get_bus(PCI_DEVICE(dev))));
+    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn),
+                          acpi_pcihp_get_bsel(pci_get_bus(pdev)));
 
     /*
      * clean up acpi-index so it could reused by another device
-- 
2.25.1


