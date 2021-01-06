Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8010A2EB8AF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:51:50 +0100 (CET)
Received: from localhost ([::1]:56630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzrR-0005NR-JP
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:51:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzeu-0005xF-IP; Tue, 05 Jan 2021 22:38:52 -0500
Received: from ozlabs.org ([203.11.71.1]:57095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzes-0006NF-I1; Tue, 05 Jan 2021 22:38:52 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpH67YWz9sWg; Wed,  6 Jan 2021 14:38:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904311;
 bh=LhukejFda9iGOng0hclp5G8zINQEyYAwY8mhFJAsHe0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UzTFQIYipr3qCRGBgc1OdBegIfYQWfnhkmArd/NXLtu9Pv/SnmXkzJ+ckFl6QiX3I
 a1ULaGPsVNkT1nymzxB+RkqrBLpYshvP6dRd71rh1BrNqpQoITKPMnjyiezip3RIoy
 hTSFow7wNVld49cd5XOvPsAVPmAD3eEbEWWeLffI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 15/22] ppc: Fix build with --without-default-devices
Date: Wed,  6 Jan 2021 14:38:09 +1100
Message-Id: <20210106033816.232598-16-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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

Linking of the qemu-system-ppc64 fails on a POWER9 host when
--without-default-devices is passed to configure:

$ ./configure --without-default-devices \
              --target-list=ppc64-softmmu && make

...

libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o: In function `ppce500_init_mpic_kvm':
/home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/e500.c:777: undefined reference to `kvm_openpic_connect_vcpu'
libqemu-ppc64-softmmu.fa.p/hw_ppc_spapr_irq.c.o: In function `spapr_irq_check':
/home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/spapr_irq.c:189: undefined reference to `xics_kvm_has_broken_disconnect'
libqemu-ppc64-softmmu.fa.p/hw_intc_spapr_xive.c.o: In function `spapr_xive_post_load':
/home/greg/Work/qemu/qemu-ppc/build/../hw/intc/spapr_xive.c:530: undefined reference to `kvmppc_xive_post_load'

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
		if_true: files('openpic_kvm.c'))

Go for the latter with OPENPIC, XICS and XIVE.

This went unnoticed so far because CI doesn't test the build with
--without-default-devices and KVM enabled on a POWER host.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <160883056791.253005.14924294027763955653.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/Kconfig     | 10 ----------
 hw/intc/meson.build |  9 ++++++---
 hw/ppc/Kconfig      |  5 -----
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 468d548ca7..fa2695e58d 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -30,11 +30,6 @@ config ARM_GIC_KVM
     default y
     depends on ARM_GIC && KVM
 
-config OPENPIC_KVM
-    bool
-    default y
-    depends on OPENPIC && KVM
-
 config XICS
     bool
     depends on POWERNV || PSERIES
@@ -43,11 +38,6 @@ config XICS_SPAPR
     bool
     select XICS
 
-config XICS_KVM
-    bool
-    default y
-    depends on XICS && KVM
-
 config ALLWINNER_A10_PIC
     bool
 
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 68da782ad2..b6c9218908 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -39,7 +39,8 @@ specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_true: files('loongson_lioint
 specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gic.c'))
 specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
 specific_ss.add(when: 'CONFIG_OMPIC', if_true: files('ompic.c'))
-specific_ss.add(when: 'CONFIG_OPENPIC_KVM', if_true: files('openpic_kvm.c'))
+specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_OPENPIC'],
+		if_true: files('openpic_kvm.c'))
 specific_ss.add(when: 'CONFIG_POWERNV', if_true: files('xics_pnv.c', 'pnv_xive.c'))
 specific_ss.add(when: 'CONFIG_PPC_UIC', if_true: files('ppc-uic.c'))
 specific_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_ic.c', 'bcm2836_control.c'))
@@ -50,8 +51,10 @@ specific_ss.add(when: 'CONFIG_SH4', if_true: files('sh_intc.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clint.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
-specific_ss.add(when: 'CONFIG_XICS_KVM', if_true: files('xics_kvm.c'))
+specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
+		if_true: files('xics_kvm.c'))
 specific_ss.add(when: 'CONFIG_XICS_SPAPR', if_true: files('xics_spapr.c'))
 specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
-specific_ss.add(when: 'CONFIG_XIVE_KVM', if_true: files('spapr_xive_kvm.c'))
+specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
+		if_true: files('spapr_xive_kvm.c'))
 specific_ss.add(when: 'CONFIG_XIVE_SPAPR', if_true: files('spapr_xive.c'))
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 982d55f587..e35710c7c3 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -139,11 +139,6 @@ config XIVE_SPAPR
     depends on PSERIES
     select XIVE
 
-config XIVE_KVM
-    bool
-    default y
-    depends on XIVE_SPAPR && KVM
-
 # Only used by 64-bit targets
 config FW_CFG_PPC
     bool
-- 
2.29.2


