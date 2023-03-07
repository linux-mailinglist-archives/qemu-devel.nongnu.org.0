Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395F76AD82F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:16:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRUO-0006k5-Jy; Tue, 07 Mar 2023 02:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRTS-0005Ka-3B
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:11:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRTQ-0005qr-AY
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678173059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aEBetiDaMkDNBsywl2bM7y1ypQmFiG8L6J2ljxol76w=;
 b=LAjNIrF+xOlkDvfLuEFdBkpBg37lsnG4aDvuu9TWj6xYrakkrgPIKmJW3/HZRTSMT2OY1Z
 31JIH/+lj2CgbX3jW8Ex5x9vcQxptgdTx2D7r9Wxrae+NZgDuCwg2Dlka7Pkshbll8lvKE
 TrG7V2YabBHh1VxET15qoWZQ3bAFIhY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-8xSl0jQLMI2ABOIF5IGxWw-1; Tue, 07 Mar 2023 02:10:53 -0500
X-MC-Unique: 8xSl0jQLMI2ABOIF5IGxWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BA0C1C08968;
 Tue,  7 Mar 2023 07:10:53 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3BFF40C10FA;
 Tue,  7 Mar 2023 07:10:49 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 40/51] tests/qtest/libqos/e1000e: Export macreg functions
Date: Tue,  7 Mar 2023 15:08:05 +0800
Message-Id: <20230307070816.34833-41-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

They will be useful for igb testing.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 tests/qtest/libqos/e1000e.c | 12 ------------
 tests/qtest/libqos/e1000e.h | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index 28fb305..925654c 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -36,18 +36,6 @@
 
 #define E1000E_RING_LEN (0x1000)
 
-static void e1000e_macreg_write(QE1000E *d, uint32_t reg, uint32_t val)
-{
-    QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
-    qpci_io_writel(&d_pci->pci_dev, d_pci->mac_regs, reg, val);
-}
-
-static uint32_t e1000e_macreg_read(QE1000E *d, uint32_t reg)
-{
-    QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
-    return qpci_io_readl(&d_pci->pci_dev, d_pci->mac_regs, reg);
-}
-
 void e1000e_tx_ring_push(QE1000E *d, void *descr)
 {
     QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
diff --git a/tests/qtest/libqos/e1000e.h b/tests/qtest/libqos/e1000e.h
index 5e2b201..30643c8 100644
--- a/tests/qtest/libqos/e1000e.h
+++ b/tests/qtest/libqos/e1000e.h
@@ -42,6 +42,18 @@ struct QE1000E_PCI {
     QE1000E e1000e;
 };
 
+static inline void e1000e_macreg_write(QE1000E *d, uint32_t reg, uint32_t val)
+{
+    QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
+    qpci_io_writel(&d_pci->pci_dev, d_pci->mac_regs, reg, val);
+}
+
+static inline uint32_t e1000e_macreg_read(QE1000E *d, uint32_t reg)
+{
+    QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
+    return qpci_io_readl(&d_pci->pci_dev, d_pci->mac_regs, reg);
+}
+
 void e1000e_wait_isr(QE1000E *d, uint16_t msg_id);
 void e1000e_tx_ring_push(QE1000E *d, void *descr);
 void e1000e_rx_ring_push(QE1000E *d, void *descr);
-- 
2.7.4


