Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFFC4745BD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 15:59:41 +0100 (CET)
Received: from localhost ([::1]:38846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9HF-0004jw-Nu
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 09:59:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cai.huoqing@linux.dev>)
 id 1mx0dt-0001AA-BB
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 00:46:25 -0500
Received: from out1.migadu.com ([91.121.223.63]:17858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cai.huoqing@linux.dev>)
 id 1mx0dp-0000O4-Gk
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 00:46:24 -0500
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1639460760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MpfjDgSREp3uZ//Fu2Cdm4sglilwpPrHl7i64xK8FVI=;
 b=Nn2L5e144TkDwTIFfZGfVPFXzwOQh4GWw+19WR3JEQKaEGJop9HGKON9YWxA93jHQswLab
 YzJUCG9R4HXkKQPeTReVsYmICUifYFOvgl0D53D/VAC1turDeVaZ24BAojPCCdrmuZcFIy
 2cYS20vChd7evXM6r7nHT3xmr+pPGOQ=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: alex.williamson@redhat.com
Subject: [PATCH] vfio/pci: Don't setup VFIO MSI-X for Kunlun VF
Date: Tue, 14 Dec 2021 13:45:34 +0800
Message-Id: <20211214054534.6633-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: cai.huoqing@linux.dev
Received-SPF: pass client-ip=91.121.223.63; envelope-from=cai.huoqing@linux.dev;
 helo=out1.migadu.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 14 Dec 2021 09:54:44 -0500
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
Cc: Cai Huoqing <cai.huoqing@linux.dev>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No support MSI-X in BAIDU KUNLUN Virtual Function devices,
so add a quirk to avoid setuping VFIO MSI-X

Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
---
 hw/vfio/pci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 7b45353ce2..15f76bbe56 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1994,6 +1994,13 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
         ret = vfio_setup_pcie_cap(vdev, pos, size, errp);
         break;
     case PCI_CAP_ID_MSIX:
+        /*
+         * BAIDU KUNLUN Virtual Function devices for KUNLUN AI processor
+         * don't support MSI-X, so don't setup VFIO MSI-X here.
+         */
+        if (vdev->vendor_id == PCI_VENDOR_ID_BAIDU &&
+            vdev->device_id == PCI_DEVICE_ID_KUNLUN_VF)
+            break;
         ret = vfio_msix_setup(vdev, pos, errp);
         break;
     case PCI_CAP_ID_PM:
-- 
2.25.1


