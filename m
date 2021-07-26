Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E8A3D6504
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 18:59:38 +0200 (CEST)
Received: from localhost ([::1]:44316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m83x3-0001Ho-Rs
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 12:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m83vl-0007l8-KE
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:58:17 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:46776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m83vj-0004vC-T8
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:58:17 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so913168pji.5
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 09:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrnAM9OtU559p3/5DEFSvb97GHwmTAh1xbV3NDIG6ck=;
 b=Ne/DqKqQpKkuGUdh40FdlhzCDnt4cvob4H4XzqE2y96HtuS8v+mxb7fLSEe+WYlCoT
 hAGnhcNoy515xUgAoVrrlqjT/sn/wJe4pfO4JiDJtu/E9+hxyHIjJPbMTnxKxkZUKoWV
 aDvpGbE01fqHtQldODIBMdTJgFBlrF8CjVaeOfIeztxGZ4fXHLPYcXKWEGbp2bCOyHBA
 Eif+UAawsX+O2H+36yje3egEpjYxSR8qoKXEw5WILpujvpdykC2a1lqHE/5RqDB4AM1Y
 WXQgPnKH/7elNVPobohZLLkkb1kFCVBNwNpc44zIr53+Gv7AFn6bA3446Wz4QY4tJ8FV
 ADaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrnAM9OtU559p3/5DEFSvb97GHwmTAh1xbV3NDIG6ck=;
 b=gVYePQs/lRMnYzEdRtCpyfXzKJ2llle+rsqo+URaiuYyh7HfcmCfcONgszXGpEpbA0
 wNi5nHaN7d1reZLEMnkQ3ZrX5cpt/fE8kdWbHoc0WPW8C1W5ne74awG5hzQe9KwDcDHb
 RJP6K9pGB44c+pqtN5Jfmdyg66Keifh5hT/3jPzfM1ZDXS5VwVZ1jv4c8MKDUVAajcm2
 Df/QO95xZyX1it/iSqGA8jPy0HM5zDbt6NQg0InVGdtFxq779jebluaBop5jc5UPBHMN
 2j6qV3oURoOLvBIICF8Lt5AJcKw2i604ZqVtEz7q0ZEV9SSGKW4Jb+lbj5R9L2uTRg0Q
 fbww==
X-Gm-Message-State: AOAM5306JyF8nXBoiPvTUbcjT6+1gdcxq11rFvk7ifciJRxfDXaafvjD
 GBdPuk0YEH2UnpStTx282yCqaO4OKWsqBA==
X-Google-Smtp-Source: ABdhPJx3Jh33tWDyNHrNP/2s6hlixSUlOGm7KfpRN7B5Nu/MbgPuXubXfV4ZHEJudMbIskWbsHOp9A==
X-Received: by 2002:a63:580a:: with SMTP id m10mr19228266pgb.254.1627318694287; 
 Mon, 26 Jul 2021 09:58:14 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.238.202])
 by smtp.googlemail.com with ESMTPSA id x4sm571663pfb.27.2021.07.26.09.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 09:58:13 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] hw/acpi: add an assertion check for non-null return from
 acpi_get_i386_pci_host
Date: Mon, 26 Jul 2021 22:27:43 +0530
Message-Id: <20210726165743.232073-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1032.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, jusual@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All existing code using acpi_get_i386_pci_host() checks for a non-null
return value from this function call. Instead of returning early when the value
returned is NULL, assert instead. Since there are only two possible host buses
for i386 - q35 and i440fx, a null value return from the function does not make
sense in most cases and is likely an error situation.

Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/pcihp.c      |  8 ++++++++
 hw/i386/acpi-build.c | 15 ++++++---------
 2 files changed, 14 insertions(+), 9 deletions(-)

changelog:
v1: initial patch
v2: removed comment addition - that can be sent as a separate patch.
v3: added assertion for null host values for all cases except one.

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index f4d706e47d..054ee8cbc5 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -116,6 +116,12 @@ static void acpi_set_pci_info(void)
     bsel_is_set = true;
 
     if (!host) {
+        /*
+         * This function can be eventually called from
+         * qemu_devices_reset() -> acpi_pcihp_reset() even
+         * for architectures other than i386. Hence, we need
+         * to ignore null values for host here.
+         */
         return;
     }
 
@@ -136,6 +142,8 @@ static void acpi_pcihp_disable_root_bus(void)
         return;
     }
 
+    assert(host);
+
     bus = PCI_HOST_BRIDGE(host)->bus;
     if (bus) {
         /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 17836149fe..83fb1d55c0 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -321,9 +321,7 @@ static void acpi_get_pci_holes(Range *hole, Range *hole64)
 
     pci_host = acpi_get_i386_pci_host();
 
-    if (!pci_host) {
-        return;
-    }
+    assert(pci_host);
 
     range_set_bounds1(hole,
                       object_property_get_uint(pci_host,
@@ -1769,9 +1767,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
         pci_host = acpi_get_i386_pci_host();
 
-        if (pci_host) {
-            bus = PCI_HOST_BRIDGE(pci_host)->bus;
-        }
+        assert(pci_host);
+
+        bus = PCI_HOST_BRIDGE(pci_host)->bus;
 
         if (bus) {
             Aml *scope = aml_scope("PCI0");
@@ -2389,9 +2387,8 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
     QObject *o;
 
     pci_host = acpi_get_i386_pci_host();
-    if (!pci_host) {
-        return false;
-    }
+
+    assert(pci_host);
 
     o = object_property_get_qobject(pci_host, PCIE_HOST_MCFG_BASE, NULL);
     if (!o) {
-- 
2.25.1


