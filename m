Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B7F24D38B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:10:51 +0200 (CEST)
Received: from localhost ([::1]:56552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k94wb-0007xR-Uz
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94EP-0003IQ-MJ
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94EG-0001l0-2F
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H1/obpthDPiI++kV8GyCWd8c/EELxIwncGfunuXqk48=;
 b=MrHXS9lNEkhO0t7hjz2P4NCHW5aL1MCgjYQP+GLMevTUS01aP7uK3syMNAH5PFDlsjdQMl
 QLPaMxMN+baJrE9Q+1gaVMF1/qZZVsukBLqpglrXkcPRt0uKQuGuE08AhdkhFHtWUsizz8
 2AbfH9gDmX+qvqYGm2P9CzjWwhjfXbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-eYxQJbyaOYyr9Rt8tY1Npw-1; Fri, 21 Aug 2020 06:24:57 -0400
X-MC-Unique: eYxQJbyaOYyr9Rt8tY1Npw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2616F1009442
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:24:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB717756DD;
 Fri, 21 Aug 2020 10:24:55 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 104/152] meson: convert hw/pci-bridge
Date: Fri, 21 Aug 2020 06:22:41 -0400
Message-Id: <20200821102329.29777-105-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:26:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
 hw/Makefile.objs            |  1 -
 hw/meson.build              |  1 +
 hw/pci-bridge/Makefile.objs | 10 ----------
 hw/pci-bridge/meson.build   | 14 ++++++++++++++
 4 files changed, 15 insertions(+), 11 deletions(-)
 delete mode 100644 hw/pci-bridge/Makefile.objs
 create mode 100644 hw/pci-bridge/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 0038cf89d9..3513040d4a 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -22,7 +22,6 @@ devices-dirs-y += net/
 devices-dirs-y += rdma/
 devices-dirs-y += nvram/
 devices-dirs-y += pci/
-devices-dirs-$(CONFIG_PCI) += pci-bridge/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/meson.build b/hw/meson.build
index ca36e486e7..a7301f21e8 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,6 +1,7 @@
 subdir('core')
 subdir('mem')
 subdir('nubus')
+subdir('pci-bridge')
 subdir('pci-host')
 subdir('pcmcia')
 subdir('rtc')
diff --git a/hw/pci-bridge/Makefile.objs b/hw/pci-bridge/Makefile.objs
deleted file mode 100644
index 47065f87d9..0000000000
--- a/hw/pci-bridge/Makefile.objs
+++ /dev/null
@@ -1,10 +0,0 @@
-common-obj-y += pci_bridge_dev.o
-common-obj-$(CONFIG_PCIE_PORT) += pcie_root_port.o gen_pcie_root_port.o pcie_pci_bridge.o
-common-obj-$(CONFIG_PXB) += pci_expander_bridge.o
-common-obj-$(CONFIG_XIO3130) += xio3130_upstream.o xio3130_downstream.o
-common-obj-$(CONFIG_IOH3420) += ioh3420.o
-common-obj-$(CONFIG_I82801B11) += i82801b11.o
-# NewWorld PowerMac
-common-obj-$(CONFIG_DEC_PCI) += dec.o
-# Sun4u
-common-obj-$(CONFIG_SIMBA) += simba.o
diff --git a/hw/pci-bridge/meson.build b/hw/pci-bridge/meson.build
new file mode 100644
index 0000000000..daab8acf2a
--- /dev/null
+++ b/hw/pci-bridge/meson.build
@@ -0,0 +1,14 @@
+pci_ss = ss.source_set()
+pci_ss.add(files('pci_bridge_dev.c'))
+pci_ss.add(when: 'CONFIG_I82801B11', if_true: files('i82801b11.c'))
+pci_ss.add(when: 'CONFIG_IOH3420', if_true: files('ioh3420.c'))
+pci_ss.add(when: 'CONFIG_PCIE_PORT', if_true: files('pcie_root_port.c', 'gen_pcie_root_port.c', 'pcie_pci_bridge.c'))
+pci_ss.add(when: 'CONFIG_PXB', if_true: files('pci_expander_bridge.c'))
+pci_ss.add(when: 'CONFIG_XIO3130', if_true: files('xio3130_upstream.c', 'xio3130_downstream.c'))
+
+# NewWorld PowerMac
+pci_ss.add(when: 'CONFIG_DEC_PCI', if_true: files('dec.c'))
+# Sun4u
+pci_ss.add(when: 'CONFIG_SIMBA', if_true: files('simba.c'))
+
+softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
-- 
2.26.2



