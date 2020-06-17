Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94CD1FD039
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 17:02:29 +0200 (CEST)
Received: from localhost ([::1]:39126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlZa8-0001qV-QS
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 11:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jlZO1-0003M2-3y
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 10:49:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36741
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jlZNy-0001lZ-BS
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 10:49:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592405393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RtliEl+YCN3TfhiPvfmCF89LvF3CEG5dcqYVRAtnlzo=;
 b=h5NNodtx1mVLpy5RYqsdRF44EgIcqOXyhydykeWUtxJx0yFcZJjjeMHFRrnctbsZgtcHB4
 Xh8/MVMNyD24pV5GMD1hOWpIXTtRGO8iWnhni5+lrKxggvS1oToPRYymv5CafMW2AyBvI2
 gVSR5YicvdSf5QBDlext+fBE6yZ9vqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-luSJxr7bOMyitVRSqMil8g-1; Wed, 17 Jun 2020 10:49:49 -0400
X-MC-Unique: luSJxr7bOMyitVRSqMil8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FCB2100CCCB;
 Wed, 17 Jun 2020 14:49:48 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-44.ams2.redhat.com [10.36.114.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68B427CAA0;
 Wed, 17 Jun 2020 14:49:47 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 25/43] hw/block/nvme: factor out controller identify setup
Date: Wed, 17 Jun 2020 16:48:51 +0200
Message-Id: <20200617144909.192176-26-kwolf@redhat.com>
In-Reply-To: <20200617144909.192176-1-kwolf@redhat.com>
References: <20200617144909.192176-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 01:42:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Message-Id: <20200609190333.59390-20-its@irrelevant.dk>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/nvme.c | 49 ++++++++++++++++++++++++++-----------------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 02a6a97df9..e10fc774fc 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1533,32 +1533,11 @@ static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev)
     }
 }
 
-static void nvme_realize(PCIDevice *pci_dev, Error **errp)
+static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 {
-    NvmeCtrl *n = NVME(pci_dev);
     NvmeIdCtrl *id = &n->id_ctrl;
-    Error *local_err = NULL;
-
-    int i;
-    uint8_t *pci_conf;
-
-    nvme_check_constraints(n, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    nvme_init_state(n);
-
-    nvme_init_blk(n, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    nvme_init_pci(n, pci_dev);
+    uint8_t *pci_conf = pci_dev->config;
 
-    pci_conf = pci_dev->config;
     id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
     id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
     strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
@@ -1591,6 +1570,30 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 
     n->bar.vs = 0x00010200;
     n->bar.intmc = n->bar.intms = 0;
+}
+
+static void nvme_realize(PCIDevice *pci_dev, Error **errp)
+{
+    NvmeCtrl *n = NVME(pci_dev);
+    Error *local_err = NULL;
+
+    int i;
+
+    nvme_check_constraints(n, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    nvme_init_state(n);
+    nvme_init_blk(n, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    nvme_init_pci(n, pci_dev);
+    nvme_init_ctrl(n, pci_dev);
 
     for (i = 0; i < n->num_namespaces; i++) {
         nvme_init_namespace(n, &n->namespaces[i], &local_err);
-- 
2.25.4


