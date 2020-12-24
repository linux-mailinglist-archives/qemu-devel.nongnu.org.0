Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA71C2E285D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 18:24:25 +0100 (CET)
Received: from localhost ([::1]:43876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksULg-0008L0-Un
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 12:24:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ksUKP-0006bn-4n
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 12:23:05 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:43055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ksUKN-0007cF-9L
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 12:23:04 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-4mVpu6rmNoqny9GP02pPSg-1; Thu, 24 Dec 2020 12:22:58 -0500
X-MC-Unique: 4mVpu6rmNoqny9GP02pPSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA604800D55;
 Thu, 24 Dec 2020 17:22:57 +0000 (UTC)
Received: from bahia.lan (ovpn-113-185.ams2.redhat.com [10.36.113.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BC3910016F4;
 Thu, 24 Dec 2020 17:22:56 +0000 (UTC)
Subject: [PATCH v3 2/3] ppc: Simplify reverse dependencies of POWERNV and
 PSERIES on XICS and XIVE
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Thu, 24 Dec 2020 18:22:55 +0100
Message-ID: <160883057560.253005.4206568349917633920.stgit@bahia.lan>
In-Reply-To: <160883056791.253005.14924294027763955653.stgit@bahia.lan>
References: <160883056791.253005.14924294027763955653.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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

Have PSERIES to select XICS and XIVE, and directly check PSERIES
in hw/intc/meson.build to enable build of the XICS and XIVE sPAPR
backends, like POWERNV already does. This allows to get rid of the
intermediate XICS_SPAPR and XIVE_SPAPR.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/intc/Kconfig     |    4 +---
 hw/intc/meson.build |    3 +--
 hw/ppc/Kconfig      |   14 ++------------
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index fa2695e58d56..c18d11142a8f 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -32,11 +32,9 @@ config ARM_GIC_KVM
=20
 config XICS
     bool
-    depends on POWERNV || PSERIES
=20
-config XICS_SPAPR
+config XIVE
     bool
-    select XICS
=20
 config ALLWINNER_A10_PIC
     bool
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index b6c9218908e3..53cba115690f 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -53,8 +53,7 @@ specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: file=
s('sifive_plic.c'))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
 =09=09if_true: files('xics_kvm.c'))
-specific_ss.add(when: 'CONFIG_XICS_SPAPR', if_true: files('xics_spapr.c'))
+specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('xics_spapr.c', 'sp=
apr_xive.c'))
 specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
 =09=09if_true: files('spapr_xive_kvm.c'))
-specific_ss.add(when: 'CONFIG_XIVE_SPAPR', if_true: files('spapr_xive.c'))
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index e35710c7c368..a213994ebf5d 100644
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
=20
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



