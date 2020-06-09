Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF0F1F46EA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 21:17:57 +0200 (CEST)
Received: from localhost ([::1]:37340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jijky-0007ZX-BX
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 15:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jijXi-0006Ub-Rr; Tue, 09 Jun 2020 15:04:14 -0400
Received: from charlie.dont.surf ([128.199.63.193]:40324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jijXf-0006jk-Or; Tue, 09 Jun 2020 15:04:14 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id B497CBF8EA;
 Tue,  9 Jun 2020 19:03:49 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v7 18/22] hw/block/nvme: do cmb/pmr init as part of pci init
Date: Tue,  9 Jun 2020 21:03:29 +0200
Message-Id: <20200609190333.59390-19-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200609190333.59390-1-its@irrelevant.dk>
References: <20200609190333.59390-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 14:38:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Message-Id: <20200514044611.734782-20-its@irrelevant.dk>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/nvme.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index b954e7b7b2fe..02a6a97df925 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1525,6 +1525,12 @@ static void nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev)
     pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
                      PCI_BASE_ADDRESS_MEM_TYPE_64, &n->iomem);
     msix_init_exclusive_bar(pci_dev, n->params.max_ioqpairs + 1, 4, NULL);
+
+    if (n->params.cmb_size_mb) {
+        nvme_init_cmb(n, pci_dev);
+    } else if (n->pmrdev) {
+        nvme_init_pmr(n, pci_dev);
+    }
 }
 
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
@@ -1586,12 +1592,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     n->bar.vs = 0x00010200;
     n->bar.intmc = n->bar.intms = 0;
 
-    if (n->params.cmb_size_mb) {
-        nvme_init_cmb(n, pci_dev);
-    } else if (n->pmrdev) {
-        nvme_init_pmr(n, pci_dev);
-    }
-
     for (i = 0; i < n->num_namespaces; i++) {
         nvme_init_namespace(n, &n->namespaces[i], &local_err);
         if (local_err) {
-- 
2.27.0


