Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619102469B3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 17:25:23 +0200 (CEST)
Received: from localhost ([::1]:47784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7h0k-0006Rf-CF
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 11:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k7gK8-0002ON-5u
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 10:41:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31884
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k7gK5-0006p4-LB
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 10:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597675276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eiaFAJXIrf6BAIh0OylDB2lLg2Tw9yqbjMjHdWAqMeA=;
 b=AeSPX95glr7WipCUXKahq+x+qV7IlKMEcXlNa5iTeL8DjI5Y6AaM8J2j7vgrFLGzydtQs7
 TYY8RhRSNs0Ffa2LtZ+9d23eGR3zEJNkWaJy+VKLuQxor4Q7LSwquM8Arw+eko4wY9z8f+
 wQ6cNNu7gGZxd4GzFyCx42m/t8lXZwA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-LcqfBwaMNBO_AoPsfRjldw-1; Mon, 17 Aug 2020 10:41:15 -0400
X-MC-Unique: LcqfBwaMNBO_AoPsfRjldw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26F5881F001
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 14:41:14 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 593EF70C3D;
 Mon, 17 Aug 2020 14:41:13 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 106/150] meson: convert hw/net
Date: Mon, 17 Aug 2020 16:40:09 +0200
Message-Id: <20200817144053.345107-11-pbonzini@redhat.com>
In-Reply-To: <20200817143723.343284-1-pbonzini@redhat.com>
References: <20200817143723.343284-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 00:24:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
 hw/Makefile.objs         |  1 -
 hw/meson.build           |  1 +
 hw/net/Makefile.objs     | 59 -----------------------------------
 hw/net/can/Makefile.objs |  4 ---
 hw/net/can/meson.build   |  4 +++
 hw/net/meson.build       | 67 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 72 insertions(+), 64 deletions(-)
 delete mode 100644 hw/net/Makefile.objs
 delete mode 100644 hw/net/can/Makefile.objs
 create mode 100644 hw/net/can/meson.build
 create mode 100644 hw/net/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 748a718b0f..d0d7816118 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -18,7 +18,6 @@ devices-dirs-$(CONFIG_IPACK) += ipack/
 devices-dirs-$(CONFIG_IPMI) += ipmi/
 devices-dirs-y += isa/
 devices-dirs-y += misc/
-devices-dirs-y += net/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/meson.build b/hw/meson.build
index f704e51361..1f7b2c4fb9 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,5 +1,6 @@
 subdir('core')
 subdir('mem')
+subdir('net')
 subdir('nubus')
 subdir('nvram')
 subdir('pci')
diff --git a/hw/net/Makefile.objs b/hw/net/Makefile.objs
deleted file mode 100644
index 7ccbf72ea7..0000000000
--- a/hw/net/Makefile.objs
+++ /dev/null
@@ -1,59 +0,0 @@
-common-obj-$(CONFIG_DP8393X) += dp8393x.o
-common-obj-$(CONFIG_XEN) += xen_nic.o
-common-obj-$(CONFIG_NE2000_COMMON) += ne2000.o
-
-# PCI network cards
-common-obj-$(CONFIG_NE2000_PCI) += ne2000-pci.o
-common-obj-$(CONFIG_EEPRO100_PCI) += eepro100.o
-common-obj-$(CONFIG_PCNET_PCI) += pcnet-pci.o
-common-obj-$(CONFIG_PCNET_COMMON) += pcnet.o
-common-obj-$(CONFIG_E1000_PCI) += e1000.o e1000x_common.o
-common-obj-$(CONFIG_E1000E_PCI_EXPRESS) += net_tx_pkt.o net_rx_pkt.o
-common-obj-$(CONFIG_E1000E_PCI_EXPRESS) += e1000e.o e1000e_core.o e1000x_common.o
-common-obj-$(CONFIG_RTL8139_PCI) += rtl8139.o
-common-obj-$(CONFIG_VMXNET3_PCI) += net_tx_pkt.o net_rx_pkt.o
-common-obj-$(CONFIG_VMXNET3_PCI) += vmxnet3.o
-common-obj-$(CONFIG_TULIP) += tulip.o
-
-common-obj-$(CONFIG_SMC91C111) += smc91c111.o
-common-obj-$(CONFIG_LAN9118) += lan9118.o
-common-obj-$(CONFIG_NE2000_ISA) += ne2000-isa.o
-common-obj-$(CONFIG_OPENCORES_ETH) += opencores_eth.o
-common-obj-$(CONFIG_XGMAC) += xgmac.o
-common-obj-$(CONFIG_MIPSNET) += mipsnet.o
-common-obj-$(CONFIG_XILINX_AXI) += xilinx_axienet.o
-common-obj-$(CONFIG_ALLWINNER_EMAC) += allwinner_emac.o
-common-obj-$(CONFIG_ALLWINNER_SUN8I_EMAC) += allwinner-sun8i-emac.o
-common-obj-$(CONFIG_IMX_FEC) += imx_fec.o
-
-common-obj-$(CONFIG_CADENCE) += cadence_gem.o
-common-obj-$(CONFIG_STELLARIS_ENET) += stellaris_enet.o
-common-obj-$(CONFIG_LANCE) += lance.o
-common-obj-$(CONFIG_LASI_82596) += lasi_i82596.o
-common-obj-$(CONFIG_I82596_COMMON) += i82596.o
-common-obj-$(CONFIG_SUNHME) += sunhme.o
-common-obj-$(CONFIG_FTGMAC100) += ftgmac100.o
-common-obj-$(CONFIG_SUNGEM) += sungem.o
-
-common-obj-$(CONFIG_ETRAXFS) += etraxfs_eth.o
-common-obj-$(CONFIG_COLDFIRE) += mcf_fec.o
-obj-$(CONFIG_MILKYMIST) += milkymist-minimac2.o
-obj-$(CONFIG_PSERIES) += spapr_llan.o
-obj-$(CONFIG_XILINX_ETHLITE) += xilinx_ethlite.o
-
-common-obj-$(CONFIG_VIRTIO_NET) += net_rx_pkt.o
-obj-$(CONFIG_VIRTIO_NET) += virtio-net.o
-common-obj-$(call land,$(CONFIG_VIRTIO_NET),$(CONFIG_VHOST_NET)) += vhost_net.o
-common-obj-$(call lnot,$(call land,$(CONFIG_VIRTIO_NET),$(CONFIG_VHOST_NET))) += vhost_net-stub.o
-common-obj-$(CONFIG_ALL) += vhost_net-stub.o
-
-common-obj-$(CONFIG_ETSEC) += fsl_etsec/etsec.o fsl_etsec/registers.o \
-			fsl_etsec/rings.o fsl_etsec/miim.o
-
-common-obj-$(CONFIG_ROCKER) += rocker/rocker.o rocker/rocker_fp.o \
-                               rocker/rocker_desc.o rocker/rocker_world.o \
-                               rocker/rocker_of_dpa.o
-obj-$(call lnot,$(CONFIG_ROCKER)) += rocker/qmp-norocker.o
-
-common-obj-$(CONFIG_CAN_BUS) += can/
-common-obj-$(CONFIG_MSF2) += msf2-emac.o
diff --git a/hw/net/can/Makefile.objs b/hw/net/can/Makefile.objs
deleted file mode 100644
index 9f0c4ee332..0000000000
--- a/hw/net/can/Makefile.objs
+++ /dev/null
@@ -1,4 +0,0 @@
-common-obj-$(CONFIG_CAN_SJA1000) += can_sja1000.o
-common-obj-$(CONFIG_CAN_PCI) += can_kvaser_pci.o
-common-obj-$(CONFIG_CAN_PCI) += can_pcm3680_pci.o
-common-obj-$(CONFIG_CAN_PCI) += can_mioe3680_pci.o
diff --git a/hw/net/can/meson.build b/hw/net/can/meson.build
new file mode 100644
index 0000000000..c9cfeb7954
--- /dev/null
+++ b/hw/net/can/meson.build
@@ -0,0 +1,4 @@
+softmmu_ss.add(when: 'CONFIG_CAN_SJA1000', if_true: files('can_sja1000.c'))
+softmmu_ss.add(when: 'CONFIG_CAN_PCI', if_true: files('can_kvaser_pci.c'))
+softmmu_ss.add(when: 'CONFIG_CAN_PCI', if_true: files('can_pcm3680_pci.c'))
+softmmu_ss.add(when: 'CONFIG_CAN_PCI', if_true: files('can_mioe3680_pci.c'))
diff --git a/hw/net/meson.build b/hw/net/meson.build
new file mode 100644
index 0000000000..4a7051b54a
--- /dev/null
+++ b/hw/net/meson.build
@@ -0,0 +1,67 @@
+softmmu_ss.add(when: 'CONFIG_DP8393X', if_true: files('dp8393x.c'))
+softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen_nic.c'))
+softmmu_ss.add(when: 'CONFIG_NE2000_COMMON', if_true: files('ne2000.c'))
+
+# PCI network cards
+softmmu_ss.add(when: 'CONFIG_NE2000_PCI', if_true: files('ne2000-pci.c'))
+softmmu_ss.add(when: 'CONFIG_EEPRO100_PCI', if_true: files('eepro100.c'))
+softmmu_ss.add(when: 'CONFIG_PCNET_PCI', if_true: files('pcnet-pci.c'))
+softmmu_ss.add(when: 'CONFIG_PCNET_COMMON', if_true: files('pcnet.c'))
+softmmu_ss.add(when: 'CONFIG_E1000_PCI', if_true: files('e1000.c', 'e1000x_common.c'))
+softmmu_ss.add(when: 'CONFIG_E1000E_PCI_EXPRESS', if_true: files('net_tx_pkt.c', 'net_rx_pkt.c'))
+softmmu_ss.add(when: 'CONFIG_E1000E_PCI_EXPRESS', if_true: files('e1000e.c', 'e1000e_core.c', 'e1000x_common.c'))
+softmmu_ss.add(when: 'CONFIG_RTL8139_PCI', if_true: files('rtl8139.c'))
+softmmu_ss.add(when: 'CONFIG_TULIP', if_true: files('tulip.c'))
+softmmu_ss.add(when: 'CONFIG_VMXNET3_PCI', if_true: files('net_tx_pkt.c', 'net_rx_pkt.c'))
+softmmu_ss.add(when: 'CONFIG_VMXNET3_PCI', if_true: files('vmxnet3.c'))
+
+softmmu_ss.add(when: 'CONFIG_SMC91C111', if_true: files('smc91c111.c'))
+softmmu_ss.add(when: 'CONFIG_LAN9118', if_true: files('lan9118.c'))
+softmmu_ss.add(when: 'CONFIG_NE2000_ISA', if_true: files('ne2000-isa.c'))
+softmmu_ss.add(when: 'CONFIG_OPENCORES_ETH', if_true: files('opencores_eth.c'))
+softmmu_ss.add(when: 'CONFIG_XGMAC', if_true: files('xgmac.c'))
+softmmu_ss.add(when: 'CONFIG_MIPSNET', if_true: files('mipsnet.c'))
+softmmu_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('xilinx_axienet.c'))
+softmmu_ss.add(when: 'CONFIG_ALLWINNER_EMAC', if_true: files('allwinner_emac.c'))
+softmmu_ss.add(when: 'CONFIG_ALLWINNER_SUN8I_EMAC', if_true: files('allwinner-sun8i-emac.c'))
+softmmu_ss.add(when: 'CONFIG_IMX_FEC', if_true: files('imx_fec.c'))
+softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-emac.c'))
+
+softmmu_ss.add(when: 'CONFIG_CADENCE', if_true: files('cadence_gem.c'))
+softmmu_ss.add(when: 'CONFIG_STELLARIS_ENET', if_true: files('stellaris_enet.c'))
+softmmu_ss.add(when: 'CONFIG_LANCE', if_true: files('lance.c'))
+softmmu_ss.add(when: 'CONFIG_LASI_I82596', if_true: files('lasi_i82596.c'))
+softmmu_ss.add(when: 'CONFIG_I82596_COMMON', if_true: files('i82596.c'))
+softmmu_ss.add(when: 'CONFIG_SUNHME', if_true: files('sunhme.c'))
+softmmu_ss.add(when: 'CONFIG_FTGMAC100', if_true: files('ftgmac100.c'))
+softmmu_ss.add(when: 'CONFIG_SUNGEM', if_true: files('sungem.c'))
+
+softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_eth.c'))
+softmmu_ss.add(when: 'CONFIG_COLDFIRE', if_true: files('mcf_fec.c'))
+specific_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-minimac2.c'))
+specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_llan.c'))
+specific_ss.add(when: 'CONFIG_XILINX_ETHLITE', if_true: files('xilinx_ethlite.c'))
+
+softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('net_rx_pkt.c'))
+specific_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-net.c'))
+
+softmmu_ss.add(when: ['CONFIG_VIRTIO_NET', 'CONFIG_VHOST_NET'], if_true: files('vhost_net.c'), if_false: files('vhost_net-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost_net-stub.c'))
+
+softmmu_ss.add(when: 'CONFIG_ETSEC', if_true: files(
+  'fsl_etsec/etsec.c',
+  'fsl_etsec/miim.c',
+  'fsl_etsec/registers.c',
+  'fsl_etsec/rings.c',
+))
+
+softmmu_ss.add(when: 'CONFIG_ROCKER', if_true: files(
+  'rocker/rocker.c',
+  'rocker/rocker_desc.c',
+  'rocker/rocker_fp.c',
+  'rocker/rocker_of_dpa.c',
+  'rocker/rocker_world.c',
+), if_false: files('rocker/qmp-norocker.c'))
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('rocker/qmp-norocker.c'))
+
+subdir('can')
-- 
2.26.2



