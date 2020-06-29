Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DF720D0E5
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 20:38:17 +0200 (CEST)
Received: from localhost ([::1]:57490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpyfY-0006oq-Ul
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 14:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpyV9-0000nN-6L; Mon, 29 Jun 2020 14:27:32 -0400
Received: from charlie.dont.surf ([128.199.63.193]:45960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpyV2-0000eA-FP; Mon, 29 Jun 2020 14:27:29 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 37E79BF81C;
 Mon, 29 Jun 2020 18:26:59 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 17/17] hw/block/nvme: bump supported version to v1.3
Date: Mon, 29 Jun 2020 20:26:42 +0200
Message-Id: <20200629182642.1170387-18-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629182642.1170387-1-its@irrelevant.dk>
References: <20200629182642.1170387-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 14:26:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Bump the supported NVM Express version to v1.3.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 hw/block/nvme.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 9f0b9de73307..fbe9b2d50895 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -57,6 +57,7 @@
 #define NVME_MAX_IOQPAIRS 0xffff
 #define NVME_REG_SIZE 0x1000
 #define NVME_DB_SIZE  4
+#define NVME_SPEC_VER 0x00010300
 #define NVME_CMB_BIR 2
 #define NVME_PMR_BIR 2
 #define NVME_TEMPERATURE 0x143
@@ -2103,6 +2104,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->ieee[0] = 0x00;
     id->ieee[1] = 0x02;
     id->ieee[2] = 0xb3;
+    id->ver = cpu_to_le32(NVME_SPEC_VER);
     id->oacs = cpu_to_le16(0);
 
     /*
@@ -2148,7 +2150,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_CSS(n->bar.cap, 1);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
 
-    n->bar.vs = 0x00010200;
+    n->bar.vs = NVME_SPEC_VER;
     n->bar.intmc = n->bar.intms = 0;
 }
 
-- 
2.27.0


