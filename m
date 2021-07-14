Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDB33C932E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 23:38:14 +0200 (CEST)
Received: from localhost ([::1]:44978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ma5-0001fe-Vg
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 17:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m3mXq-0006Iy-Im
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 17:35:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m3mXo-0008Ur-8f
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 17:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626298550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oLczu4HaeJ74gqxO+7xyw4h43vECNzg786r9wk/eK/g=;
 b=dqhQVfN2qr1w5B3tHj/aLOjYI3IGNSFZBXchNwhsto+WRN5feKUodJ9o487pW8Jo2bgx/x
 /mqZzShqhcWoo2qdKP6IpyU37nz7clj+j2j7wVw2mEtbEasxnJWeP0sbKDcBGaRbu49th1
 rRao91mC09NYJHOz/iyDSqUfFalwX0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-JLYlBCfWOeKqoyEom-pOWQ-1; Wed, 14 Jul 2021 17:35:49 -0400
X-MC-Unique: JLYlBCfWOeKqoyEom-pOWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D1E6100C619;
 Wed, 14 Jul 2021 21:35:48 +0000 (UTC)
Received: from [172.30.41.16] (ovpn-112-106.phx2.redhat.com [10.3.112.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7BBF100EB3E;
 Wed, 14 Jul 2021 21:35:44 +0000 (UTC)
Subject: [PULL v2 2/3] vfio/pci: Change to use vfio_pci_is()
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 14 Jul 2021 15:35:44 -0600
Message-ID: <162629854462.830787.5340033998653938340.stgit@omen>
In-Reply-To: <162629838902.830787.15967554940825048991.stgit@omen>
References: <162629838902.830787.15967554940825048991.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Make use of vfio_pci_is() helper function.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
Link: https://lore.kernel.org/r/20210713014831.742-1-caihuoqing@baidu.com
[aw: commit log wording]
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/pci.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index ab4077aad23e..971273fd458b 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3058,14 +3058,14 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         }
     }
 
-    if (vdev->vendor_id == PCI_VENDOR_ID_NVIDIA) {
+    if (vfio_pci_is(vdev, PCI_VENDOR_ID_NVIDIA, PCI_ANY_ID)) {
         ret = vfio_pci_nvidia_v100_ram_init(vdev, errp);
         if (ret && ret != -ENODEV) {
             error_report("Failed to setup NVIDIA V100 GPU RAM");
         }
     }
 
-    if (vdev->vendor_id == PCI_VENDOR_ID_IBM) {
+    if (vfio_pci_is(vdev, PCI_VENDOR_ID_IBM, PCI_ANY_ID)) {
         ret = vfio_pci_nvlink2_init(vdev, errp);
         if (ret && ret != -ENODEV) {
             error_report("Failed to setup NVlink2 bridge");



