Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550213C792D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 23:44:16 +0200 (CEST)
Received: from localhost ([::1]:38544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3QCN-0007Cx-DX
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 17:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m3Pyy-0005dS-Ve
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:30:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m3Pyw-0006Ch-CC
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626211821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5OvCtSzp3DCcoDIRJ5JtutjOeaaHfnL+GClD4uDG3rU=;
 b=ByG/0bJfSx5nRMrxrDuWUj18J3KtSY69SYWVZTJx/9iLYMChBM3+hBnzwG80m5pKp8oVbf
 JaMbhjBimBUeVJbhd5C9B9Fo1qX3bGDFKBWUvj60lRsLaLNzx+Tsir2PfcqsKDmx33mIhv
 gJai94NFImnaF37Zk2PWLlvh7XX4SME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-Q2Aj_R2iNtqz_PH1uUFg4Q-1; Tue, 13 Jul 2021 17:30:19 -0400
X-MC-Unique: Q2Aj_R2iNtqz_PH1uUFg4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9330E1084F53;
 Tue, 13 Jul 2021 21:30:18 +0000 (UTC)
Received: from [172.30.41.16] (ovpn-112-106.phx2.redhat.com [10.3.112.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 832D210016F7;
 Tue, 13 Jul 2021 21:30:08 +0000 (UTC)
Subject: [PULL 3/3] vfio/pci: Add pba_offset PCI quirk for BAIDU KUNLUN AI
 processor
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Jul 2021 15:30:08 -0600
Message-ID: <162621180826.487037.11803928274271944648.stgit@omen>
In-Reply-To: <162621155674.487037.8788212042441164398.stgit@omen>
References: <162621155674.487037.8788212042441164398.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.williamson@redhat.com, Cai Huoqing <caihuoqing@baidu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cai Huoqing <caihuoqing@baidu.com>

Fix pba_offset initialization value for BAIDU KUNLUN Virtual
Function device. The KUNLUN hardware returns an incorrect
value for the VF PBA offset, and add a quirk to instead
return a hardcoded value of 0xb400.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
Link: https://lore.kernel.org/r/20210713093743.942-1-caihuoqing@baidu.com
[aw: comment & whitespace tuning]
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/pci.c            |    8 ++++++++
 include/hw/pci/pci_ids.h |    3 +++
 2 files changed, 11 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 971273fd458b..e1ea1d8a23b5 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1499,6 +1499,14 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
         if (vdev->vendor_id == PCI_VENDOR_ID_CHELSIO &&
             (vdev->device_id & 0xff00) == 0x5800) {
             msix->pba_offset = 0x1000;
+        /*
+         * BAIDU KUNLUN Virtual Function devices for KUNLUN AI processor
+         * return an incorrect value of 0x460000 for the VF PBA offset while
+         * the BAR itself is only 0x10000.  The correct value is 0xb400.
+         */
+        } else if (vfio_pci_is(vdev, PCI_VENDOR_ID_BAIDU,
+                               PCI_DEVICE_ID_KUNLUN_VF)) {
+            msix->pba_offset = 0xb400;
         } else if (vdev->msix_relo == OFF_AUTOPCIBAR_OFF) {
             error_setg(errp, "hardware reports invalid configuration, "
                        "MSIX PBA outside of specified BAR");
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 5c14681b82eb..11abe22d4604 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -227,6 +227,9 @@
 #define PCI_VENDOR_ID_FREESCALE          0x1957
 #define PCI_DEVICE_ID_MPC8533E           0x0030
 
+#define PCI_VENDOR_ID_BAIDU              0x1d22
+#define PCI_DEVICE_ID_KUNLUN_VF          0x3685
+
 #define PCI_VENDOR_ID_INTEL              0x8086
 #define PCI_DEVICE_ID_INTEL_82378        0x0484
 #define PCI_DEVICE_ID_INTEL_82441        0x1237



