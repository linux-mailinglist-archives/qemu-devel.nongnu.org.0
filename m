Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659122E20DE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 20:29:13 +0100 (CET)
Received: from localhost ([::1]:34452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks9ou-0004Qi-Fb
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 14:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ks9mj-00031z-FE
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 14:26:58 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:57212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ks9mh-0003hs-94
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 14:26:57 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-z_oto0nrPry1-2fGJ5gAhg-1; Wed, 23 Dec 2020 14:26:51 -0500
X-MC-Unique: z_oto0nrPry1-2fGJ5gAhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B89159;
 Wed, 23 Dec 2020 19:26:50 +0000 (UTC)
Received: from bahia.lan (ovpn-113-185.ams2.redhat.com [10.36.113.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7747560C04;
 Wed, 23 Dec 2020 19:26:48 +0000 (UTC)
Subject: [PATCH v2 1/2] ppc: Fix build with --without-default-devices
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Wed, 23 Dec 2020 20:26:47 +0100
Message-ID: <160875160729.98237.3219319022197329254.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
allnoconfig mode. Such reverse dependencies should rather be
handled with a 'select' statement, eg.

config OPENPIC
    select OPENPIC_KVM if KVM

or even better by getting rid of the intermediate _KVM config
and directly checking CONFIG_KVM in the meson.build file:

specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_OPENPIC'],
=09=09if_true: files('openpic_kvm.c'))

Go for the latter with OPENPIC, XICS and XIVE. While here also move
XIVE_SPAPR to hw/intc/Kconfig where it belongs.

This went unnoticed so far because CI doesn't test the build with
--without-default-devices and KVM enabled on a POWER host.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
v2: - check CONFIG_KVM in the meson.build as suggested by Paolo
---
 hw/intc/Kconfig     |   14 +++++---------
 hw/intc/meson.build |    9 ++++++---
 hw/ppc/Kconfig      |   15 ---------------
 3 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 468d548ca771..ee60d4bf7857 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -30,23 +30,19 @@ config ARM_GIC_KVM
     default y
     depends on ARM_GIC && KVM
=20
-config OPENPIC_KVM
-    bool
-    default y
-    depends on OPENPIC && KVM
-
 config XICS
     bool
-    depends on POWERNV || PSERIES
=20
 config XICS_SPAPR
     bool
     select XICS
=20
-config XICS_KVM
+config XIVE
     bool
-    default y
-    depends on XICS && KVM
+
+config XIVE_SPAPR
+    bool
+    select XIVE
=20
 config ALLWINNER_A10_PIC
     bool
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 68da782ad2c5..b6c9218908e3 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -39,7 +39,8 @@ specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_true:=
 files('loongson_lioint
 specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gic.c'))
 specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
 specific_ss.add(when: 'CONFIG_OMPIC', if_true: files('ompic.c'))
-specific_ss.add(when: 'CONFIG_OPENPIC_KVM', if_true: files('openpic_kvm.c'=
))
+specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_OPENPIC'],
+=09=09if_true: files('openpic_kvm.c'))
 specific_ss.add(when: 'CONFIG_POWERNV', if_true: files('xics_pnv.c', 'pnv_=
xive.c'))
 specific_ss.add(when: 'CONFIG_PPC_UIC', if_true: files('ppc-uic.c'))
 specific_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_ic.c', 'bcm2=
836_control.c'))
@@ -50,8 +51,10 @@ specific_ss.add(when: 'CONFIG_SH4', if_true: files('sh_i=
ntc.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clint.=
c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'=
))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
-specific_ss.add(when: 'CONFIG_XICS_KVM', if_true: files('xics_kvm.c'))
+specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
+=09=09if_true: files('xics_kvm.c'))
 specific_ss.add(when: 'CONFIG_XICS_SPAPR', if_true: files('xics_spapr.c'))
 specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
-specific_ss.add(when: 'CONFIG_XIVE_KVM', if_true: files('spapr_xive_kvm.c'=
))
+specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
+=09=09if_true: files('spapr_xive_kvm.c'))
 specific_ss.add(when: 'CONFIG_XIVE_SPAPR', if_true: files('spapr_xive.c'))
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 982d55f5875c..064bd6edd83d 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -129,21 +129,6 @@ config VIRTEX
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



