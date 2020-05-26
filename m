Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA501B3893
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 09:12:48 +0200 (CEST)
Received: from localhost ([::1]:45266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jR9Yt-00068a-OY
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 03:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39502)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jR9Vt-0000ap-JO
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 03:09:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jR9Vs-0007Hz-Nr
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 03:09:41 -0400
Received: from charlie.dont.surf ([128.199.63.193]:60188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jR9Vo-00078Y-NE; Wed, 22 Apr 2020 03:09:36 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 758D4BF758;
 Wed, 22 Apr 2020 07:09:33 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v3 01/16] nvme: fix pci doorbell size calculation
Date: Wed, 22 Apr 2020 09:09:12 +0200
Message-Id: <20200422070927.373048-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200422070927.373048-1-its@irrelevant.dk>
References: <20200422070927.373048-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:19:11
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The size of the BAR is 0x1000 (main registers) + 8 bytes for each
queue. Currently, the size of the BAR is calculated like so:

    n->reg_size = pow2ceil(0x1004 + 2 * (n->num_queues + 1) * 4);

Since the 'num_queues' parameter already accounts for the admin queue,
this should in any case not need to be incremented by one. Also, the
size should be initialized to (0x1000).

    n->reg_size = pow2ceil(0x1000 + 2 * n->num_queues * 4);

This, with the default value of num_queues (64), we will set aside room
for 1 admin queue and 63 I/O queues (4 bytes per doorbell, 2 doorbells
per queue).

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 9b453423cf2c..1d7d7fb3c67a 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -54,6 +54,9 @@
 #include "trace.h"
 #include "nvme.h"
 
+#define NVME_REG_SIZE 0x1000
+#define NVME_DB_SIZE  4
+
 #define NVME_GUEST_ERR(trace, fmt, ...) \
     do { \
         (trace_##trace)(__VA_ARGS__); \
@@ -1403,7 +1406,9 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
     pcie_endpoint_cap_init(pci_dev, 0x80);
 
     n->num_namespaces = 1;
-    n->reg_size = pow2ceil(0x1004 + 2 * (n->num_queues + 1) * 4);
+
+    /* num_queues is really number of pairs, so each has two doorbells */
+    n->reg_size = pow2ceil(NVME_REG_SIZE + 2 * n->num_queues * NVME_DB_SIZE);
     n->ns_size = bs_size / (uint64_t)n->num_namespaces;
 
     n->namespaces = g_new0(NvmeNamespace, n->num_namespaces);
-- 
2.26.2


