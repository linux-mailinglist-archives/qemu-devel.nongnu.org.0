Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A99024478D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 11:58:43 +0200 (CEST)
Received: from localhost ([::1]:39580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6WTy-00067J-4i
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 05:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnS-00079l-3o
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:46 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39045
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnQ-00035w-2E
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597396483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RdmpmrMElCNaVrxMEyBFO3Mxt6qDIJ7MNPRDYW7tDkI=;
 b=SQb0Ctb0gEdddFw0UUiT9h9i6jZU/QzWuXRoHig05/ial5g+OWYBy2SvLl5DPVGCWmrC2m
 DXYoI9njf6ynsbp3UXrGkvb5PY1cMXOp5Jo03Jlhqq5Bjj/cDR5JiF7lCRQ68Beb3d/Fhr
 nItIqcK24pu3MIgvkrztEeuGIZOgSmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-onjIHcNmM6-zXSB3ppN0ng-1; Fri, 14 Aug 2020 05:14:41 -0400
X-MC-Unique: onjIHcNmM6-zXSB3ppN0ng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 859291853DA0
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:14:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42A0760C04;
 Fri, 14 Aug 2020 09:14:40 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 102/150] meson: convert hw/pci-host
Date: Fri, 14 Aug 2020 05:12:38 -0400
Message-Id: <20200814091326.16173-103-pbonzini@redhat.com>
In-Reply-To: <20200814091326.16173-1-pbonzini@redhat.com>
References: <20200814091326.16173-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 01:57:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/Makefile.objs          |  2 +-
 hw/meson.build            |  1 +
 hw/pci-host/Makefile.objs | 24 ------------------------
 hw/pci-host/meson.build   | 31 +++++++++++++++++++++++++++++++
 4 files changed, 33 insertions(+), 25 deletions(-)
 delete mode 100644 hw/pci-host/Makefile.objs
 create mode 100644 hw/pci-host/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index f28da5869d..0038cf89d9 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -22,7 +22,7 @@ devices-dirs-y += net/
 devices-dirs-y += rdma/
 devices-dirs-y += nvram/
 devices-dirs-y += pci/
-devices-dirs-$(CONFIG_PCI) += pci-bridge/ pci-host/
+devices-dirs-$(CONFIG_PCI) += pci-bridge/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/meson.build b/hw/meson.build
index ed25644237..ca36e486e7 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,6 +1,7 @@
 subdir('core')
 subdir('mem')
 subdir('nubus')
+subdir('pci-host')
 subdir('pcmcia')
 subdir('rtc')
 subdir('scsi')
diff --git a/hw/pci-host/Makefile.objs b/hw/pci-host/Makefile.objs
deleted file mode 100644
index e422e0aca0..0000000000
--- a/hw/pci-host/Makefile.objs
+++ /dev/null
@@ -1,24 +0,0 @@
-common-obj-$(CONFIG_PAM) += pam.o
-
-# PPC devices
-common-obj-$(CONFIG_PREP_PCI) += prep.o
-common-obj-$(CONFIG_GRACKLE_PCI) += grackle.o
-# NewWorld PowerMac
-common-obj-$(CONFIG_UNIN_PCI) += uninorth.o
-# PowerPC E500 boards
-common-obj-$(CONFIG_PPCE500_PCI) += ppce500.o
-
-# ARM devices
-common-obj-$(CONFIG_VERSATILE_PCI) += versatile.o
-
-common-obj-$(CONFIG_PCI_SABRE) += sabre.o
-common-obj-$(CONFIG_PCI_BONITO) += bonito.o
-common-obj-$(CONFIG_PCI_I440FX) += i440fx.o
-common-obj-$(CONFIG_XEN_IGD_PASSTHROUGH) += xen_igd_pt.o
-common-obj-$(CONFIG_PCI_EXPRESS_Q35) += q35.o
-common-obj-$(CONFIG_PCI_EXPRESS_GENERIC_BRIDGE) += gpex.o
-common-obj-$(CONFIG_PCI_EXPRESS_XILINX) += xilinx-pcie.o
-
-common-obj-$(CONFIG_PCI_EXPRESS_DESIGNWARE) += designware.o
-obj-$(CONFIG_POWERNV) += pnv_phb4.o pnv_phb4_pec.o
-obj-$(CONFIG_POWERNV) += pnv_phb3.o pnv_phb3_msi.o pnv_phb3_pbcq.o
diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
new file mode 100644
index 0000000000..cd52f6ff1c
--- /dev/null
+++ b/hw/pci-host/meson.build
@@ -0,0 +1,31 @@
+pci_ss = ss.source_set()
+pci_ss.add(when: 'CONFIG_PAM', if_true: files('pam.c'))
+pci_ss.add(when: 'CONFIG_PCI_BONITO', if_true: files('bonito.c'))
+pci_ss.add(when: 'CONFIG_PCI_EXPRESS_DESIGNWARE', if_true: files('designware.c'))
+pci_ss.add(when: 'CONFIG_PCI_EXPRESS_GENERIC_BRIDGE', if_true: files('gpex.c'))
+pci_ss.add(when: 'CONFIG_PCI_EXPRESS_Q35', if_true: files('q35.c'))
+pci_ss.add(when: 'CONFIG_PCI_EXPRESS_XILINX', if_true: files('xilinx-pcie.c'))
+pci_ss.add(when: 'CONFIG_PCI_I440FX', if_true: files('i440fx.c'))
+pci_ss.add(when: 'CONFIG_PCI_SABRE', if_true: files('sabre.c'))
+pci_ss.add(when: 'CONFIG_XEN_IGD_PASSTHROUGH', if_true: files('xen_igd_pt.c'))
+
+# PPC devices
+pci_ss.add(when: 'CONFIG_PREP_PCI', if_true: files('prep.c'))
+pci_ss.add(when: 'CONFIG_GRACKLE_PCI', if_true: files('grackle.c'))
+# NewWorld PowerMac
+pci_ss.add(when: 'CONFIG_UNIN_PCI', if_true: files('uninorth.c'))
+# PowerPC E500 boards
+pci_ss.add(when: 'CONFIG_PPCE500_PCI', if_true: files('ppce500.c'))
+
+# ARM devices
+pci_ss.add(when: 'CONFIG_VERSATILE_PCI', if_true: files('versatile.c'))
+
+softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
+
+specific_ss.add(when: 'CONFIG_POWERNV', if_true: files(
+  'pnv_phb3.c',
+  'pnv_phb3_msi.c',
+  'pnv_phb3_pbcq.c',
+  'pnv_phb4.c',
+  'pnv_phb4_pec.c'
+))
-- 
2.26.2



