Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7843F3B1B
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 17:07:37 +0200 (CEST)
Received: from localhost ([::1]:37050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHSat-0003JK-Qk
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 11:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mHSZS-0002As-Tq
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 11:06:06 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mHSZN-0001Pz-9c
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 11:06:06 -0400
Received: by mail-pf1-x432.google.com with SMTP id 18so11331470pfh.9
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 08:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IZrA1/G7gmM6c5tdy9yh0H5T8UnZBRpyl0xLvyFi8LI=;
 b=uZ5ZEpWZTR1ngWX2hf6rOcaqN5vrAz0gzMKBIOpZmmRzGAt/jCQbSN6Y5s3tsngXzo
 JURKifKh5qIGAr+kEkDOs0qOVdUJfRk83rEUUX6oF1wLS3nj1D534sCkFrEWf/7pJrm/
 xjshLDJXHJl6bs0if/49fYfQxMh+6aCxeaWo3B0+0N9t1gTrbYgbj9kDw8mwx4qLVa5m
 boABEAEQN2+SEtLYkZ+VierE2kPbGnSPNnhiInPQoroubOVo1OJq3iqtEOMjloaJFmRL
 zDIms1ht2GSPXXQ1p3gVpELY/RD/PALsoOjFX0kS2O4gLACrCxXWTLo7y+c8n11Zz6s7
 mCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IZrA1/G7gmM6c5tdy9yh0H5T8UnZBRpyl0xLvyFi8LI=;
 b=eXZxiGP7WLAD99vSvc5IPZleYyM9F41fN1rGWofpjAEDrRM7CRoX8boDGVcNVddXc5
 uL/fKXQ3xqOjpHK9mjYCAzhX4NNMSkmRJ5FJlUFCxNNlAX7eVXnpJORjvqly8KAH+W/T
 5cIwZu9eUwHrkDo6ZtLK1ohiPhJdCZX2rH5MKsVINsSHAuaww42S0BjkAxNc7gXYJ9XF
 A0ToU5435q9lwHg3/R0Qc2t4yPcWpYZyWesRUsZdUbnidjj++A1PCHDuuBE7Bmy9K4Ya
 XrwGm82W3x6BwfCY48GWwexoX5Jz8DKwB4YZFm+srKOzatWaUasjSs7VfuFWjVR+FuKy
 xRNg==
X-Gm-Message-State: AOAM533QkZtrfWWfDfTgSbqv50LgFaBWpo9eu73C8hyrWwzEewG24Vjp
 aQfz9icOJ/gPOZzJ2MQhdo/exYTpoKLjEg==
X-Google-Smtp-Source: ABdhPJwAYt5CYrtWe9gEZiXk2lPwfq117iF9kWU9TVAKyvNDz5zk2AwiXaN3FKf3fnSFNl3N9iS5Xw==
X-Received: by 2002:a63:e70f:: with SMTP id b15mr24217734pgi.182.1629558357922; 
 Sat, 21 Aug 2021 08:05:57 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.136.252])
 by smtp.googlemail.com with ESMTPSA id
 x20sm10487328pfh.188.2021.08.21.08.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 08:05:57 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/acpi/pcihp: validate bsel property of the bus before
 unplugging device
Date: Sat, 21 Aug 2021 20:35:35 +0530
Message-Id: <20210821150535.763541-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x432.google.com
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
 philmd@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bsel property of the pci bus indicates whether the bus supports acpi hotplug.
We need to validate the presence of this property before performing any hotplug
related callback operations. Currently validation of the existence of this
property was absent from acpi_pcihp_device_unplug_cb() function but is present
in other hotplug/unplug callback functions. Hence, this change adds the missing
check for the above function.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/pcihp.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 0fd0c1d811..9982815a87 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -372,9 +372,15 @@ void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
                                  DeviceState *dev, Error **errp)
 {
     PCIDevice *pdev = PCI_DEVICE(dev);
+    int bsel = acpi_pcihp_get_bsel(pci_get_bus(pdev));
+
+    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn), bsel);
 
-    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn),
-                          acpi_pcihp_get_bsel(pci_get_bus(pdev)));
+    if (bsel < 0) {
+        error_setg(errp, "Unsupported bus. Bus doesn't have property '"
+                   ACPI_PCIHP_PROP_BSEL "' set");
+        return;
+    }
 
     /*
      * clean up acpi-index so it could reused by another device
-- 
2.25.1


