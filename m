Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124982EB8B7
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:55:03 +0100 (CET)
Received: from localhost ([::1]:36268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzuY-0000Cs-5O
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzet-0005tB-6K; Tue, 05 Jan 2021 22:38:51 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:34423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzeq-0006MO-5C; Tue, 05 Jan 2021 22:38:50 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpH5DkSz9sWS; Wed,  6 Jan 2021 14:38:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904311;
 bh=sScZOhoOb3h3fcosBl7ZWkjQcC9p45O2Og6oIAK7Fng=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b5Re7pk3SUj9EEbxVqXhvQJGuzT++MUesv5ZMeGqy2+s3Cnt75pn/BSzoWY0pO55B
 j/vrWJJ4VhmNvul7ldysYONaMYaCDTcbazlnvocJqjtteXCtiCDM64ITTgG2idWYwR
 5yl4Udew7GXYsjX7DSMv1zbsjD77m/ufOL86evsI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 16/22] ppc: Simplify reverse dependencies of POWERNV and
 PSERIES on XICS and XIVE
Date: Wed,  6 Jan 2021 14:38:10 +1100
Message-Id: <20210106033816.232598-17-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Have PSERIES to select XICS and XIVE, and directly check PSERIES
in hw/intc/meson.build to enable build of the XICS and XIVE sPAPR
backends, like POWERNV already does. This allows to get rid of the
intermediate XICS_SPAPR and XIVE_SPAPR.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <160883057560.253005.4206568349917633920.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/Kconfig     |  4 +---
 hw/intc/meson.build |  3 +--
 hw/ppc/Kconfig      | 14 ++------------
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index fa2695e58d..c18d11142a 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -32,11 +32,9 @@ config ARM_GIC_KVM
 
 config XICS
     bool
-    depends on POWERNV || PSERIES
 
-config XICS_SPAPR
+config XIVE
     bool
-    select XICS
 
 config ALLWINNER_A10_PIC
     bool
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index b6c9218908..53cba11569 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -53,8 +53,7 @@ specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
 		if_true: files('xics_kvm.c'))
-specific_ss.add(when: 'CONFIG_XICS_SPAPR', if_true: files('xics_spapr.c'))
+specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('xics_spapr.c', 'spapr_xive.c'))
 specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
 		if_true: files('spapr_xive_kvm.c'))
-specific_ss.add(when: 'CONFIG_XIVE_SPAPR', if_true: files('spapr_xive.c'))
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index e35710c7c3..a213994ebf 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -7,8 +7,8 @@ config PSERIES
     select PCI
     select SPAPR_VSCSI
     select VFIO if LINUX   # needed by spapr_pci_vfio.c
-    select XICS_SPAPR
-    select XIVE_SPAPR
+    select XICS
+    select XIVE
     select MSI_NONBROKEN
     select FDT_PPC
     select CHRP_NVRAM
@@ -129,16 +129,6 @@ config VIRTEX
     select XILINX_ETHLITE
     select FDT_PPC
 
-config XIVE
-    bool
-    depends on POWERNV || PSERIES
-
-config XIVE_SPAPR
-    bool
-    default y
-    depends on PSERIES
-    select XIVE
-
 # Only used by 64-bit targets
 config FW_CFG_PPC
     bool
-- 
2.29.2


