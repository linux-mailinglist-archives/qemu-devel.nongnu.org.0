Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C85834F8C1
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 08:28:54 +0200 (CEST)
Received: from localhost ([::1]:42850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRULV-0006hF-Jm
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 02:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRUIJ-0004Xm-SO; Wed, 31 Mar 2021 02:25:36 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:43475 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRUIF-0000ot-Vk; Wed, 31 Mar 2021 02:25:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F9GX64yQqz9sVq; Wed, 31 Mar 2021 17:25:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617171926;
 bh=+xII9Tn5VdditCA3Ix6IXV2ua4b9i7tHzfjOHeULzJE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UqTcmuHIRwAlzmfHwN5iOtfLNGIxBYUdVTRaDx6AGKheC+C5oYWrhyMzopbmQZ3EN
 Jwy4ywUSrf6AibfbgcTvEvH4CODaHG36LykymjercDHLlsi/jeTK7qs7W8nN7vvBQ6
 WQ6X9zuj7cng160X+vew9uReHkpGDhNd1W7VtjHY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 1/5] hw/ppc: e500: Add missing #address-cells and #size-cells
 in the eTSEC node
Date: Wed, 31 Mar 2021 17:25:20 +1100
Message-Id: <20210331062524.335749-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331062524.335749-1-david@gibson.dropbear.id.au>
References: <20210331062524.335749-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Per devicetree spec v0.3 [1] chapter 2.3.5:

The #address-cells and #size-cells properties are not inherited
from ancestors in the devicetree. They shall be explicitly defined.
If missing, a client program should assume a default value of 2
for #address-cells, and a value of 1 for #size-cells.

These properties are currently missing, causing the <reg> property
of the queue-group subnode to be incorrectly parsed using default
values.

[1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf

Fixes: fdfb7f2cdb2d ("e500: Add support for eTSEC in device tree")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20210311081608.66891-1-bmeng.cn@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/e500.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 1d94485ac8..79467ac512 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -237,6 +237,8 @@ static int create_devtree_etsec(SysBusDevice *sbdev, PlatformDevtreeData *data)
     qemu_fdt_setprop_string(fdt, node, "model", "eTSEC");
     qemu_fdt_setprop(fdt, node, "local-mac-address", etsec->conf.macaddr.a, 6);
     qemu_fdt_setprop_cells(fdt, node, "fixed-link", 0, 1, 1000, 0, 0);
+    qemu_fdt_setprop_cells(fdt, node, "#size-cells", 1);
+    qemu_fdt_setprop_cells(fdt, node, "#address-cells", 1);
 
     qemu_fdt_add_subnode(fdt, group);
     qemu_fdt_setprop_cells(fdt, group, "reg", mmio0, 0x1000);
-- 
2.30.2


