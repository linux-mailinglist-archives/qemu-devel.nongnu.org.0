Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD0D2EB89E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:48:40 +0100 (CET)
Received: from localhost ([::1]:47646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzoN-0001c6-Tt
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:48:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzev-00060Q-VD; Tue, 05 Jan 2021 22:38:53 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:53591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzes-0006NO-Uv; Tue, 05 Jan 2021 22:38:53 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpJ0Drpz9sWY; Wed,  6 Jan 2021 14:38:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904312;
 bh=0HkYjTvE4+W9GZZOQ7j9KWCd4otBBf/gN/dEiX3bLQ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IN1Qo9x2hViQR9pxHNILHaGyb1aNwtFujDyHoR+jgCHlb6dBwBgtDr5FpYBMZwb09
 Lux99OyxeIMlh8A4tWkA67YzfsoyXU/UzwkAuqxsXeF1avCEN3xXiBdL/XhFWTzpW/
 ZkkXWintHCopKjBpFImaKK/DDQxUxBWo1Spmi180=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 17/22] pnv: Fix reverse dependency on PCI express root ports
Date: Wed,  6 Jan 2021 14:38:11 +1100
Message-Id: <20210106033816.232598-18-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

qemu-system-ppc64 built with --without-default-devices crashes:

Type 'pnv-phb4-root-port' is missing its parent 'pcie-root-port-base'
Aborted (core dumped)

Have POWERNV to select PCIE_PORT. This is done through a
new PCI_POWERNV config in hw/pci-host/Kconfig since POWERNV
doesn't have a direct dependency on PCI. For this reason,
PCI_EXPRESS and MSI_NONBROKEN are also moved under
PCI_POWERNV.

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <160883058299.253005.342913177952681375.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/pci-host/Kconfig     | 5 +++++
 hw/pci-host/meson.build | 2 +-
 hw/ppc/Kconfig          | 3 +--
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 036a61877a..eb03f0489d 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -60,3 +60,8 @@ config PCI_BONITO
     select PCI
     select UNIMP
     bool
+
+config PCI_POWERNV
+    select PCI_EXPRESS
+    select MSI_NONBROKEN
+    select PCIE_PORT
diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
index e6d1b89684..da9d1a9964 100644
--- a/hw/pci-host/meson.build
+++ b/hw/pci-host/meson.build
@@ -23,7 +23,7 @@ pci_ss.add(when: 'CONFIG_VERSATILE_PCI', if_true: files('versatile.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
 
-specific_ss.add(when: 'CONFIG_POWERNV', if_true: files(
+specific_ss.add(when: 'CONFIG_PCI_POWERNV', if_true: files(
   'pnv_phb3.c',
   'pnv_phb3_msi.c',
   'pnv_phb3_pbcq.c',
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index a213994ebf..d11dc30509 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -29,8 +29,7 @@ config POWERNV
     select XICS
     select XIVE
     select FDT_PPC
-    select PCI_EXPRESS
-    select MSI_NONBROKEN
+    select PCI_POWERNV
 
 config PPC405
     bool
-- 
2.29.2


