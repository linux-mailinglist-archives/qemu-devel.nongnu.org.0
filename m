Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB57555B966
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 13:51:05 +0200 (CEST)
Received: from localhost ([::1]:47692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5nGi-00051H-D5
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 07:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=170689b83=niklas.cassel@wdc.com>)
 id 1o5nDj-0002du-R8; Mon, 27 Jun 2022 07:47:59 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:27951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=170689b83=niklas.cassel@wdc.com>)
 id 1o5nDi-0004c0-6a; Mon, 27 Jun 2022 07:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656330478; x=1687866478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/XRS686Jgp9vsnd/AQ+15ypNKDwCGi9eNYLuPIuNsQg=;
 b=q2jiBOLRuMNDDpVhjwwznAGDH1TETc5yUMAmR4cAWpEydXLYQocI9sMG
 47BEbmTgUv6gJ/EcJHFWaaUygzUdOM6AO0XRgALEWbng5BrbKIWVlM0N0
 xT1lg90s5lRKnaKq6pqD3VJVYzofL0v9nvVZ/xxc9t5zB7GbZLjKadkq3
 gUgM2uEfng4MH6jajDKB6qenpctefT6X0S4/YFAgB2TR/XBxKWPYYVbnQ
 GMvrzud2wZl9qUgaGYHjk25lfhTFttvBRDvcxODeNWDbHeE3QYIp0/JM2
 a0AWimGG7O2QZPKnnS4+5oXCGXj0wGOFiWcZ5nuvzAoDBurM3D/2Bay3g Q==;
X-IronPort-AV: E=Sophos;i="5.92,226,1650902400"; d="scan'208";a="316298965"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jun 2022 19:47:54 +0800
IronPort-SDR: yNYy67df0x9ZchhGXmYkDM/pPtshJAJFLeg4FT1VOCw2Xqegk7f0vnpF+pO8iUmf3hgInL9uro
 ZrgEt59BSsDYqIa7CrvppiisOUc7Jvg0DDKCCRYvgv0zvr5hUiJMbZ1GlCpRJecxviJQLQgr7X
 YBtSeb9kOP4fjidPS/NYoQY8S54sbdl++mDpPjj+1OZJ3byZxAuO2LhdF3GpDCDPlgBPN1rv1o
 uSMnKcUJkU6JKoxQSNUV6IXbOQHsisw13TQAUrB2P5OT21Tw4mOCfnAgflRrkmjyE7sJdCqF7f
 9L80Gc0WFG4y5TaJdCEOlns2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jun 2022 04:10:17 -0700
IronPort-SDR: RYbwNveoem9AwVWxrl9uzFZXJl7ZunenVkOUefRzSHAOsrlI8QsxqaVsQtWvLGfb0edGc9LpL/
 nVLFXgJjAdMoz0tIqgZ3ZuydhaWBGeSMBJAMRCP63S0LBZhX8GIGGPyHtB68UttH5Aqk0bXcZX
 KoyHdz85FoKug2CtmAvwfJjxaUpndC8o5rjSzranFU1eJR/H0taJ7SBW2dRV7iPIQgzGxZM0z6
 1B/d0hCMRqI2voV1LW+GKphN58Tbi/WjZnvc7O/cX55gAVlVxDslUf/0krmi2WGZpMbLLN/eyN
 Zz8=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.108])
 by uls-op-cesaip01.wdc.com with ESMTP; 27 Jun 2022 04:47:52 -0700
To: kbusch@kernel.org,
	its@irrelevant.dk
Cc: damien.lemoal@wdc.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH v2 2/4] hw/nvme: store a pointer to the NvmeSubsystem in the
 NvmeNamespace
Date: Mon, 27 Jun 2022 13:47:29 +0200
Message-Id: <20220627114731.356462-3-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627114731.356462-1-niklas.cassel@wdc.com>
References: <20220627114731.356462-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=170689b83=niklas.cassel@wdc.com; helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Niklas Cassel <niklas.cassel@wdc.com>
From:  Niklas Cassel via <qemu-devel@nongnu.org>

Each NvmeNamespace can be used by serveral controllers,
but a NvmeNamespace can at most belong to a single NvmeSubsystem.
Store a pointer to the NvmeSubsystem, if the namespace was realized
with a NvmeSubsystem.

This will be used by a follow up patch.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 hw/nvme/ns.c   | 1 +
 hw/nvme/nvme.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 870c3ca1a2..8bee3e8b3b 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -559,6 +559,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
         if (!qdev_set_parent_bus(dev, &subsys->bus.parent_bus, errp)) {
             return;
         }
+        ns->subsys = subsys;
     }
 
     if (nvme_ns_setup(ns, errp)) {
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 0711b9748c..5487e2db40 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -167,6 +167,7 @@ typedef struct NvmeNamespace {
     int32_t         nr_active_zones;
 
     NvmeNamespaceParams params;
+    NvmeSubsystem *subsys;
 
     struct {
         uint32_t err_rec;
-- 
2.36.1


