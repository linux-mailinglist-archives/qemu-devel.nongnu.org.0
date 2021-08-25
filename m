Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6853F6DAD
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 05:23:12 +0200 (CEST)
Received: from localhost ([::1]:46650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIjVQ-0006bP-0j
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 23:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIjSY-0007xC-Ca
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 23:20:14 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:40950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mIjSW-0005h3-RN
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 23:20:14 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y190so20113746pfg.7
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 20:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bKbc+f4bQs5XTTICu9SVnSh/UAlBzY4g0vt/DD+jm+Y=;
 b=0c0pXkvS72WAGdRLEz37P8IcuNb5G1ganWehBOwfPczgRQHVvz3Ex3CQwdkRZBDHCJ
 BjjTYWV12vtIxT2KK/2k5MoQ/Tv/OtON1sOXgByXQsdTalXuAl1qIE52vnQbFZxppCTk
 roX5QKOs+iu8azSJAV05VYs9bo22ZShwiEeXcQSZcL+LUKqJ666W7tXQmxvE2PSVm51Q
 s1mw6YYKiGS6bjSIbo2c1r0BcnD3b/ksg+UwcNnr4YkqI1fHWdNBGmvXlex32WJiXh8h
 6T53i6KTJXMf61Nt1huiGs4rTFNHsMp7V9o7/2U3FBGIjFti/gpnvXROQjtKYM/z+Ku9
 B4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bKbc+f4bQs5XTTICu9SVnSh/UAlBzY4g0vt/DD+jm+Y=;
 b=ZKmwoQLiIKwtfSFw3PHEwBuY16l/1Coxf4JrtEOik9iMj/YY82gzztHp+HN/fn/Sab
 NRLB5SYx7mA45DEFB3+OikyotUNBpzURqCAZWqstlvjo0p62EqToohLJX2BwZHb3je7T
 R+iZRR2pWHvhBM0PFUi5hwsIbDdA4ujh2b4Zc/irRxQSuicQHUjEgbfynRO2nu1WXxEk
 Zx6AIrWVcrKFQtCECHpRdauxGR1GIHbJgXFrlaD/TG5oXgffZU2XaHrpTeEQx3iB8q+V
 SKcSxOaDk2AI5Qy34GcDisoiL2ZvkIemdIIqYISoTMJexAtWlBulVu0bGK3mT1KdBUEc
 pkLw==
X-Gm-Message-State: AOAM533r6i+jqBnpQzCNiZeO4ldr890ZPdOG73bHNJk/z7jJp+MkfE36
 wt1pzAzQOvLLHgoWzgrxAQc3fg==
X-Google-Smtp-Source: ABdhPJximQquIWJHjU7pkSq2VhXCoCsqo4KlQxeKHUoHfZzwgAryoiL4AEfsOdTxWy1/3Lpb3OEenA==
X-Received: by 2002:a63:1e4b:: with SMTP id p11mr40100930pgm.295.1629861611508; 
 Tue, 24 Aug 2021 20:20:11 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.155.195])
 by smtp.googlemail.com with ESMTPSA id c19sm3404895pjs.1.2021.08.24.20.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 20:20:11 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: mst@redhat.com
Subject: [PATCH 2/5] hw/acpi: use existing references to pci device struct
 within functions
Date: Wed, 25 Aug 2021 08:49:46 +0530
Message-Id: <20210825031949.919376-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825031949.919376-1-ani@anisinha.ca>
References: <20210825031949.919376-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42a.google.com
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
Cc: ani@anisinha.ca,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no need to use fresh typecasts to get references to pci device structs
when there is an existing reference to pci device struct. Use existing reference.
Minor cleanup.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/acpi/pcihp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index f4d706e47d..f610a25d2e 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -283,7 +283,7 @@ void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
 
     /* Only hotplugged devices need the hotplug capability. */
     if (dev->hotplugged &&
-        acpi_pcihp_get_bsel(pci_get_bus(PCI_DEVICE(dev))) < 0) {
+        acpi_pcihp_get_bsel(pci_get_bus(pdev)) < 0) {
         error_setg(errp, "Unsupported bus. Bus doesn't have property '"
                    ACPI_PCIHP_PROP_BSEL "' set");
         return;
@@ -363,8 +363,8 @@ void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
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


