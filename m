Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01594157EDC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 16:35:08 +0100 (CET)
Received: from localhost ([::1]:35112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1B5X-00032y-1U
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 10:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41629)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhabin@linux.alibaba.com>) id 1j150s-00078x-Qm
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 04:05:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhabin@linux.alibaba.com>) id 1j150n-0004IP-Pq
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 04:05:50 -0500
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:33718)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhabin@linux.alibaba.com>)
 id 1j150n-0004BN-GT
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 04:05:49 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04397; MF=zhabin@linux.alibaba.com;
 NM=1; PH=DS; RN=10; SR=0; TI=SMTPD_---0TpbD1jB_1581325533; 
Received: from localhost(mailfrom:zhabin@linux.alibaba.com
 fp:SMTPD_---0TpbD1jB_1581325533) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 10 Feb 2020 17:05:33 +0800
From: Zha Bin <zhabin@linux.alibaba.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] x86: virtio-mmio: support virtio-mmio with MSI for x86
Date: Mon, 10 Feb 2020 17:05:21 +0800
Message-Id: <946b71e77a34666a9b8c419c5a467d1628b50fa0.1581305609.git.zhabin@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1581305609.git.zhabin@linux.alibaba.com>
References: <cover.1581305609.git.zhabin@linux.alibaba.com>
In-Reply-To: <cover.1581305609.git.zhabin@linux.alibaba.com>
References: <cover.1581305609.git.zhabin@linux.alibaba.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 47.88.44.36
X-Mailman-Approved-At: Mon, 10 Feb 2020 10:31:30 -0500
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
Cc: virtio-dev@lists.oasis-open.org, zhabin@linux.alibaba.com, slp@redhat.com,
 mst@redhat.com, jasowang@redhat.com, jing2.liu@linux.intel.com,
 qemu-devel@nongnu.org, chao.p.peng@linux.intel.com, gerry@linux.alibaba.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liu Jiang <gerry@linux.alibaba.com>

virtio-mmio supports a generic MSI irq domain for all archs. This
patch adds the x86 architecture support.

Signed-off-by: Liu Jiang <gerry@linux.alibaba.com>
Co-developed-by: Zha Bin <zhabin@linux.alibaba.com>
Signed-off-by: Zha Bin <zhabin@linux.alibaba.com>
Co-developed-by: Jing Liu <jing2.liu@linux.intel.com>
Signed-off-by: Jing Liu <jing2.liu@linux.intel.com>
Co-developed-by: Chao Peng <chao.p.peng@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 arch/x86/kernel/apic/msi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/apic/msi.c b/arch/x86/kernel/apic/msi.c
index 159bd0c..2fcd602 100644
--- a/arch/x86/kernel/apic/msi.c
+++ b/arch/x86/kernel/apic/msi.c
@@ -45,7 +45,11 @@ static void __irq_msi_compose_msg(struct irq_cfg *cfg, struct msi_msg *msg)
 		MSI_DATA_VECTOR(cfg->vector);
 }
 
-static void irq_msi_compose_msg(struct irq_data *data, struct msi_msg *msg)
+/*
+ * x86 PCI-MSI/HPET/DMAR related method.
+ * Also can be used as arch specific method for virtio-mmio MSI.
+ */
+void irq_msi_compose_msg(struct irq_data *data, struct msi_msg *msg)
 {
 	__irq_msi_compose_msg(irqd_cfg(data), msg);
 }
@@ -166,6 +170,11 @@ static void irq_msi_update_msg(struct irq_data *irqd, struct irq_cfg *cfg)
 	return ret;
 }
 
+struct irq_domain *arch_msi_root_irq_domain(void)
+{
+	return x86_vector_domain;
+}
+
 /*
  * IRQ Chip for MSI PCI/PCI-X/PCI-Express Devices,
  * which implement the MSI or MSI-X Capability Structure.
-- 
1.8.3.1


