Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFBD4421B3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:34:13 +0100 (CET)
Received: from localhost ([::1]:48252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhe0R-00052Z-VG
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mhdUt-0005Wp-Ea
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 16:01:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mhdUq-0002Ym-N9
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 16:01:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635796891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=64YzAeMTxpTka0dBKMNj/Z2BptY5+/OhpSprSy8xC6E=;
 b=A3mr3f9ksmM27mxU4PDNyLP8VmK+K33zf/6/xhbDHNJD2gXKw8rZE9rtNLV3sdiAjWKe1u
 roWHCCDKDbiFbTSQorLN9NgHmslb/W1TFWz+pX56La4WzXEFVWMmWTvPRzW4iubGZDjMUe
 KL4JlT1P0FFG2b2Oyqddzu0zOaYrJPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-2BtYe4JsMgO-Y2SkEFhCsQ-1; Mon, 01 Nov 2021 16:01:28 -0400
X-MC-Unique: 2BtYe4JsMgO-Y2SkEFhCsQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6597A10B3942;
 Mon,  1 Nov 2021 20:01:27 +0000 (UTC)
Received: from [172.30.41.16] (ovpn-113-78.phx2.redhat.com [10.3.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 302885F4F5;
 Mon,  1 Nov 2021 20:01:22 +0000 (UTC)
Subject: [PULL 1/2] vfio/pci: Add support for mmapping sub-page MMIO BARs
 after live migration
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 01 Nov 2021 14:01:21 -0600
Message-ID: <163579688196.3486201.2279683396245406860.stgit@omen>
In-Reply-To: <163579674962.3486201.2525541279968158386.stgit@omen>
References: <163579674962.3486201.2525541279968158386.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.williamson@redhat.com, Kunkun Jiang <jiangkunkun@huawei.com>,
 Nianyao Tang <tangnianyao@huawei.com>, Qixin Gan <ganqixin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kunkun Jiang <jiangkunkun@huawei.com>

We can expand MemoryRegions of sub-page MMIO BARs in
vfio_pci_write_config() to improve IO performance for some
devices. However, the MemoryRegions of destination VM are
not expanded any more after live migration. Because their
addresses have been updated in vmstate_load_state()
(vfio_pci_load_config) and vfio_sub_page_bar_update_mapping()
will not be called.

This may result in poor performance after live migration.
So iterate BARs in vfio_pci_load_config() and try to update
sub-page BARs.

Reported-by: Nianyao Tang <tangnianyao@huawei.com>
Reported-by: Qixin Gan <ganqixin@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
Link: https://lore.kernel.org/r/20211027090406.761-2-jiangkunkun@huawei.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/pci.c |   19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 5cdf1d4298a7..7b45353ce27f 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2453,7 +2453,12 @@ static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
 {
     VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
     PCIDevice *pdev = &vdev->pdev;
-    int ret;
+    pcibus_t old_addr[PCI_NUM_REGIONS - 1];
+    int bar, ret;
+
+    for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
+        old_addr[bar] = pdev->io_regions[bar].addr;
+    }
 
     ret = vmstate_load_state(f, &vmstate_vfio_pci_config, vdev, 1);
     if (ret) {
@@ -2463,6 +2468,18 @@ static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
     vfio_pci_write_config(pdev, PCI_COMMAND,
                           pci_get_word(pdev->config + PCI_COMMAND), 2);
 
+    for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
+        /*
+         * The address may not be changed in some scenarios
+         * (e.g. the VF driver isn't loaded in VM).
+         */
+        if (old_addr[bar] != pdev->io_regions[bar].addr &&
+            vdev->bars[bar].region.size > 0 &&
+            vdev->bars[bar].region.size < qemu_real_host_page_size) {
+            vfio_sub_page_bar_update_mapping(pdev, bar);
+        }
+    }
+
     if (msi_enabled(pdev)) {
         vfio_msi_enable(vdev);
     } else if (msix_enabled(pdev)) {



