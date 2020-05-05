Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2031C6228
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 22:37:54 +0200 (CEST)
Received: from localhost ([::1]:42414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jW4K8-0006AF-Qz
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 16:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jW4Iu-0004hV-1s; Tue, 05 May 2020 16:36:36 -0400
Received: from charlie.dont.surf ([128.199.63.193]:57580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jW4Ir-0007q0-4r; Tue, 05 May 2020 16:36:34 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id AD282BF9A4;
 Tue,  5 May 2020 20:36:30 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] hw/block/nvme: allow use of any valid msix vector
Date: Tue,  5 May 2020 22:36:03 +0200
Message-Id: <20200505203603.278339-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505203603.278339-1-its@irrelevant.dk>
References: <20200505203603.278339-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 16:36:30
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
 Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

If the device uses MSI-X, any of the 2048 MSI-X interrupt vectors are
valid. If the device is not using MSI-X, vector will and can only be
zero at this point.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 2b072bbb21e7..755ced8b03fb 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -646,7 +646,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeCmd *cmd)
         trace_nvme_err_invalid_create_cq_vector(vector);
         return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
     }
-    if (unlikely(vector > n->num_queues)) {
+    if (unlikely(vector > PCI_MSIX_FLAGS_QSIZE)) {
         trace_nvme_err_invalid_create_cq_vector(vector);
         return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
     }
-- 
2.26.2


