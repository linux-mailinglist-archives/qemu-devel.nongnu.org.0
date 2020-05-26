Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435881D25FD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 06:48:11 +0200 (CEST)
Received: from localhost ([::1]:34444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZ5n0-0002qk-8A
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 00:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jZ5lT-0000S1-Sm; Thu, 14 May 2020 00:46:35 -0400
Received: from charlie.dont.surf ([128.199.63.193]:43720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jZ5lR-0003jh-Vt; Thu, 14 May 2020 00:46:35 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 31367BFDA3;
 Thu, 14 May 2020 04:46:30 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v6 01/20] hw/block/nvme: fix pci doorbell size calculation
Date: Thu, 14 May 2020 06:45:52 +0200
Message-Id: <20200514044611.734782-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514044611.734782-1-its@irrelevant.dk>
References: <20200514044611.734782-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 00:46:30
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


