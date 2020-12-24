Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EEF2E285E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 18:26:21 +0100 (CET)
Received: from localhost ([::1]:47244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksUNY-0001Rg-VF
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 12:26:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ksUKX-0006yi-2h
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 12:23:13 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:58845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ksUKV-0007er-H3
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 12:23:12 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-BJrDzNZ-PXSzJfMgdRz66w-1; Thu, 24 Dec 2020 12:23:06 -0500
X-MC-Unique: BJrDzNZ-PXSzJfMgdRz66w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15C4CDF8A4;
 Thu, 24 Dec 2020 17:23:05 +0000 (UTC)
Received: from bahia.lan (ovpn-113-185.ams2.redhat.com [10.36.113.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8D551A8A9;
 Thu, 24 Dec 2020 17:23:03 +0000 (UTC)
Subject: [PATCH v3 3/3] pnv: Fix reverse dependency on PCI express root ports
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Thu, 24 Dec 2020 18:23:03 +0100
Message-ID: <160883058299.253005.342913177952681375.stgit@bahia.lan>
In-Reply-To: <160883056791.253005.14924294027763955653.stgit@bahia.lan>
References: <160883056791.253005.14924294027763955653.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-system-ppc64 built with --without-default-devices crashes:

Type 'pnv-phb4-root-port' is missing its parent 'pcie-root-port-base'
Aborted (core dumped)

Have POWERNV to select PCIE_PORT. This is done through a
new PCI_POWERNV config in hw/pci-host/Kconfig since POWERNV
doesn't have a direct dependency on PCI. For this reason,
PCI_EXPRESS and MSI_NONBROKEN are also moved under
PCI_POWERNV.

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/pci-host/Kconfig     |    5 +++++
 hw/pci-host/meson.build |    2 +-
 hw/ppc/Kconfig          |    3 +--
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 036a61877a73..eb03f0489d08 100644
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
index e6d1b896848c..da9d1a9964a8 100644
--- a/hw/pci-host/meson.build
+++ b/hw/pci-host/meson.build
@@ -23,7 +23,7 @@ pci_ss.add(when: 'CONFIG_VERSATILE_PCI', if_true: files('=
versatile.c'))
=20
 softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
=20
-specific_ss.add(when: 'CONFIG_POWERNV', if_true: files(
+specific_ss.add(when: 'CONFIG_PCI_POWERNV', if_true: files(
   'pnv_phb3.c',
   'pnv_phb3_msi.c',
   'pnv_phb3_pbcq.c',
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index a213994ebf5d..d11dc30509df 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -29,8 +29,7 @@ config POWERNV
     select XICS
     select XIVE
     select FDT_PPC
-    select PCI_EXPRESS
-    select MSI_NONBROKEN
+    select PCI_POWERNV
=20
 config PPC405
     bool



