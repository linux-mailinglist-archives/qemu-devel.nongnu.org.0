Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A61333457
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:22:50 +0100 (CET)
Received: from localhost ([::1]:50522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqMz-0005z5-Kf
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:22:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAw-0003YQ-VM; Tue, 09 Mar 2021 23:10:23 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:55963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAv-0004E7-Au; Tue, 09 Mar 2021 23:10:22 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWf0SZYz9sX2; Wed, 10 Mar 2021 15:10:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349406;
 bh=uJfNzO/IH/PKiESK8g5yg4+400F3gnzkruuBjogzggs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eLCNl026PJj7kOhBi77/2+xRX8xoKd2J7qP85C2mWAzbl2vEH7TD1Fi/6rJGnkuuT
 DdhF07d+6I4WebKLs/VyuABBp3plbYHTAjo3bxJ+Ltni7NHxj7OEs+tIvunVb0ERS1
 GD+zMwvL5GUhugyR0QpI12iFO5/US+U3MFeCGhYc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 14/20] hw/ppc: e500: Add missing <ranges> in the eTSEC node
Date: Wed, 10 Mar 2021 15:09:56 +1100
Message-Id: <20210310041002.333813-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310041002.333813-1-david@gibson.dropbear.id.au>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
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

The eTSEC node should provide an empty <ranges> property in the
eTSEC node, otherwise of_translate_address() in the Linux kernel
fails to get the eTSEC register base, reporting:

  OF: ** translation for device /platform@f00000000/ethernet@0/queue-group **
  OF: bus is default (na=1, ns=1) on /platform@f00000000/ethernet@0
  OF: translating address: 00000000
  OF: parent bus is default (na=1, ns=1) on /platform@f00000000
  OF: no ranges; cannot translate

Per devicetree spec v0.3 [1] chapter 2.3.8:

  If the property is not present in a bus node, it is assumed that
  no mapping exists between children of the node and the parent
  address space.

This is why of_translate_address() aborts the address translation.
Apparently U-Boot devicetree parser seems to be tolerant with
missing <ranges> as this was not noticed when testing with U-Boot.
The empty <ranges> property is present in all kernel shipped dtsi
files for eTSEC, Let's add it to conform with the spec.

[1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf

Fixes: fdfb7f2cdb2d ("e500: Add support for eTSEC in device tree")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <1614158919-9473-1-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/e500.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 01517a6c6c..1d94485ac8 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -231,6 +231,7 @@ static int create_devtree_etsec(SysBusDevice *sbdev, PlatformDevtreeData *data)
     assert(irq2 >= 0);
 
     qemu_fdt_add_subnode(fdt, node);
+    qemu_fdt_setprop(fdt, node, "ranges", NULL, 0);
     qemu_fdt_setprop_string(fdt, node, "device_type", "network");
     qemu_fdt_setprop_string(fdt, node, "compatible", "fsl,etsec2");
     qemu_fdt_setprop_string(fdt, node, "model", "eTSEC");
-- 
2.29.2


