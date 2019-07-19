Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5646E2F3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 10:54:53 +0200 (CEST)
Received: from localhost ([::1]:43184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoOfF-0004q8-54
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 04:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58176)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <wrfsh@yandex-team.ru>) id 1hoOf3-0004RB-JJ
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 04:54:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wrfsh@yandex-team.ru>) id 1hoOf2-0007H9-HM
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 04:54:41 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:53614)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wrfsh@yandex-team.ru>)
 id 1hoOf2-0007FB-1W
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 04:54:40 -0400
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
 [IPv6:2a02:6b8:0:1402::301])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 1D4EB2E0DA6;
 Fri, 19 Jul 2019 11:54:37 +0300 (MSK)
Received: from smtpcorp1j.mail.yandex.net (smtpcorp1j.mail.yandex.net
 [2a02:6b8:0:1619::137])
 by mxbackcorp1g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 Hy39YMWM6O-samWH0AQ; Fri, 19 Jul 2019 11:54:37 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1563526477; bh=+WfJ0HJMNoavbAAEXXxMw47cWyAha9VzrdzQ9BfpK2c=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=FTUxiOmQQ1ZWdq2YUHKJCiYU8mpcnwDfNopOZEqVu0Ch7TABDGQzQvywCw5+3RQNb
 j9YOgf4U5zTUATexaBGUfN4ZewpHBO177gMIea2CCluf1LusnTYRrcsa5Dm6whV6du
 6ftT/UQUkvnT3fyhz6SBaHLNeTsm2RMfzUgKfuZE=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red.dhcp.yndx.net (dynamic-red.dhcp.yndx.net
 [2a02:6b8:0:40c:f68c:50ff:fee9:44bd])
 by smtpcorp1j.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 kfk3o9hyAQ-saAG455S; Fri, 19 Jul 2019 11:54:36 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client certificate not present)
From: Evgeny Yakovlev <wrfsh@yandex-team.ru>
To: qemu-devel@nongnu.org,
	mst@redhat.com
Date: Fri, 19 Jul 2019 11:54:29 +0300
Message-Id: <1563526469-15588-1-git-send-email-wrfsh@yandex-team.ru>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 95.108.205.193
Subject: [Qemu-devel] [PATCH] i386/acpi: show PCI Express bus on pxb-pcie
 expanders
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Show PCIe host bridge PNP id with PCI host bridge as a compatible id
when expanding a pcie bus.

Signed-off-by: Evgeny Yakovlev <wrfsh@yandex-team.ru>
---
 hw/i386/acpi-build.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d281ffa..0675952 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1908,10 +1908,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             scope = aml_scope("\\_SB");
             dev = aml_device("PC%.02X", bus_num);
             aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
-            aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
             aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
             if (pci_bus_is_express(bus)) {
+                aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
+                aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
                 aml_append(dev, build_q35_osc_method());
+            } else {
+                aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
             }
 
             if (numa_node != NUMA_NODE_UNASSIGNED) {
-- 
2.7.4


