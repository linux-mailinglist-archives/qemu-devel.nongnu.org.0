Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34648B429
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 11:32:49 +0200 (CEST)
Received: from localhost ([::1]:50570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxTAe-0008Hh-Rs
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 05:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53416)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <thuth@redhat.com>) id 1hxT9A-0006Qi-MJ
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 05:31:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hxT99-00059t-Oe
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 05:31:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57396)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hxT95-000583-E8; Tue, 13 Aug 2019 05:31:11 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B01DF30832DC;
 Tue, 13 Aug 2019 09:31:10 +0000 (UTC)
Received: from thuth.com (ovpn-116-154.ams2.redhat.com [10.36.116.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F3967D49A;
 Tue, 13 Aug 2019 09:31:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Aug 2019 11:30:43 +0200
Message-Id: <20190813093047.27948-3-thuth@redhat.com>
In-Reply-To: <20190813093047.27948-1-thuth@redhat.com>
References: <20190813093047.27948-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 13 Aug 2019 09:31:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/6] tests/libqos: Make virtio-pci code
 independent from global_qtest
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Amit Shah <amit@kernel.org>, John Snow <jsnow@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The libqos library functions should never depend on global_qtest,
since these functions might be used in tests that track multiple
test states. So let's use the test state of the QPCIDevice instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/libqos/virtio-pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/libqos/virtio-pci.c b/tests/libqos/virtio-pci.c
index a622ca26ca..3f55c047a0 100644
--- a/tests/libqos/virtio-pci.c
+++ b/tests/libqos/virtio-pci.c
@@ -138,9 +138,9 @@ static bool qvirtio_pci_get_queue_isr_status(QVirtioDevice *d, QVirtQueue *vq)
             /* No ISR checking should be done if masked, but read anyway */
             return qpci_msix_pending(dev->pdev, vqpci->msix_entry);
         } else {
-            data = readl(vqpci->msix_addr);
+            data = qtest_readl(dev->pdev->bus->qts, vqpci->msix_addr);
             if (data == vqpci->msix_data) {
-                writel(vqpci->msix_addr, 0);
+                qtest_writel(dev->pdev->bus->qts, vqpci->msix_addr, 0);
                 return true;
             } else {
                 return false;
@@ -162,9 +162,9 @@ static bool qvirtio_pci_get_config_isr_status(QVirtioDevice *d)
             /* No ISR checking should be done if masked, but read anyway */
             return qpci_msix_pending(dev->pdev, dev->config_msix_entry);
         } else {
-            data = readl(dev->config_msix_addr);
+            data = qtest_readl(dev->pdev->bus->qts, dev->config_msix_addr);
             if (data == dev->config_msix_data) {
-                writel(dev->config_msix_addr, 0);
+                qtest_writel(dev->pdev->bus->qts, dev->config_msix_addr, 0);
                 return true;
             } else {
                 return false;
-- 
2.18.1


