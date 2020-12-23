Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2852E19B3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 09:12:17 +0100 (CET)
Received: from localhost ([::1]:41328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krzFo-0006MY-An
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 03:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1krzEg-0005oT-19
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 03:11:06 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:60284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1krzEb-0007bB-Cw
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 03:11:05 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-2B7zF4T_OAeIqHSOVbK0Nw-1; Wed, 23 Dec 2020 03:10:48 -0500
X-MC-Unique: 2B7zF4T_OAeIqHSOVbK0Nw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C4491842142;
 Wed, 23 Dec 2020 08:10:47 +0000 (UTC)
Received: from bahia.lan (ovpn-112-27.ams2.redhat.com [10.36.112.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B12635F9B5;
 Wed, 23 Dec 2020 08:10:45 +0000 (UTC)
Subject: [PATCH] ppc: Fix build with --without-default-devices
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Wed, 23 Dec 2020 09:10:44 +0100
Message-ID: <160871104474.106117.16441172468969132477.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linking of the qemu-system-ppc64 fails on a POWER9 host when
--without-default-devices is passed to configure:

$ ./configure --without-default-devices \
              --target-list=3Dppc64-softmmu && make

...

libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o: In function `ppce500_init_mpic_=
kvm':
/home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/e500.c:777: undefined referen=
ce to `kvm_openpic_connect_vcpu'
libqemu-ppc64-softmmu.fa.p/hw_ppc_spapr_irq.c.o: In function `spapr_irq_che=
ck':
/home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/spapr_irq.c:189: undefined re=
ference to `xics_kvm_has_broken_disconnect'
libqemu-ppc64-softmmu.fa.p/hw_intc_spapr_xive.c.o: In function `spapr_xive_=
post_load':
/home/greg/Work/qemu/qemu-ppc/build/../hw/intc/spapr_xive.c:530: undefined =
reference to `kvmppc_xive_post_load'

... and tons of other symbols belonging to the KVM backend of the
openpic, XICS and XIVE interrupt controllers.

It turns out that OPENPIC_KVM, XICS_KVM and XIVE_KVM are marked
to depend on KVM but this has no effect when minikconf runs in
allnoconfig mode. The correct way to express that some configuration
A requires some other configuration B to be true is "A select B".

Have OPENPIC, XICS and XIVE to select their KVM counterpart if KVM
is set. While here, fix POWERNV to select XIVE and XICS, just like
PSERIES, and drop the now useless XIVE related config clauses from
hw/ppc/Kconfig.

This went unnoticed so far because CI doesn't test the build with
--without-default-devices and KVM enabled on a POWER host.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/intc/Kconfig |   18 +++++++++++++-----
 hw/ppc/Kconfig  |   17 ++---------------
 2 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 468d548ca771..0a5c080c4f5c 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -19,6 +19,7 @@ config ARM_GIC
 config OPENPIC
     bool
     select MSI_NONBROKEN
+    select OPENPIC_KVM if KVM
=20
 config APIC
     bool
@@ -32,21 +33,28 @@ config ARM_GIC_KVM
=20
 config OPENPIC_KVM
     bool
-    default y
-    depends on OPENPIC && KVM
=20
 config XICS
     bool
-    depends on POWERNV || PSERIES
+    select XICS_KVM if KVM
=20
 config XICS_SPAPR
     bool
     select XICS
=20
+config XIVE
+    bool
+    select XIVE_KVM if KVM
+
+config XIVE_SPAPR
+    bool
+    select XIVE
+
 config XICS_KVM
     bool
-    default y
-    depends on XICS && KVM
+
+config XIVE_KVM
+    bool
=20
 config ALLWINNER_A10_PIC
     bool
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 982d55f5875c..037d9332e994 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -31,6 +31,8 @@ config POWERNV
     select FDT_PPC
     select PCI_EXPRESS
     select MSI_NONBROKEN
+    select XIVE
+    select XICS
=20
 config PPC405
     bool
@@ -129,21 +131,6 @@ config VIRTEX
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
-config XIVE_KVM
-    bool
-    default y
-    depends on XIVE_SPAPR && KVM
-
 # Only used by 64-bit targets
 config FW_CFG_PPC
     bool



