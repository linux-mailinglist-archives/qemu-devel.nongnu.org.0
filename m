Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0712C5420A6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 03:33:19 +0200 (CEST)
Received: from localhost ([::1]:54126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nykZS-0004gl-2m
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 21:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=151ed2091=niklas.cassel@wdc.com>)
 id 1nykVQ-0001NM-1f; Tue, 07 Jun 2022 21:29:08 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:39779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=151ed2091=niklas.cassel@wdc.com>)
 id 1nykVN-0001J3-OT; Tue, 07 Jun 2022 21:29:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654651744; x=1686187744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pyVvaA7ikSO7bCSkAY0zFar1pWMQWr9SJvh//1rZ050=;
 b=DXLw8JwXDF3pHdEpD4dMtSHmILjzJ466lUN5N8YltQQwjXWuR8QGz6MB
 ZzGHSwVEXW3q/2G1ISiIyL2ANJTeww854EhhClHn6uyWqcOFGGgrY6m56
 Kxj47vGEpFpkN+SahfEWs9DNGigOfBMGpuO9uVMDbYIzwam3xgsiWpRdp
 ITluqYTWyOpJ+egs3kz8y55sQhM8ygJyawxlsU9fJUuUtJ10L/a5ejxaX
 dnlSDSCHJOq8y0RqSs+k1wYZLllaeFu6aOFWMfvC8J7h2g8YawVQHnbGd
 0nyXRT71EK1UOn2LTm5+YldoTcgJBFvnXJq6Eh3XLg1EEoAP2cImAxBIt A==;
X-IronPort-AV: E=Sophos;i="5.91,284,1647273600"; d="scan'208";a="207399236"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2022 09:29:00 +0800
IronPort-SDR: 0Sl8godhLVTcnQX+pN1PFZ3id5S6UqicUBRfR1UT14t5Qgy7ghzjZCK12iLs/Kf7qSmDecslWi
 kzqX0EmHKJESHwgJknIfneB4FlVbA/RJftBHCH7AGTuK25KoGjywxh3bxMGyfD2k+gGXMfFh4f
 uT8p4wlmBIjHXgQALCOf88cwuc8L47fKJuFJf1dBD0E8WW+iY0d49wd7q3cVZUKIoqbmzqWOTI
 cEwlEHPADEnqhNfsWWSphn/ckCEQTqycwv/8B1dDJqXAIx8g7yo0DgfYeFH8fOelyq6+1RDf6U
 dJSdfttT2c4llH6KD4405kgY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2022 17:47:50 -0700
IronPort-SDR: znK4jQgMGHu5Q5zQtVVWGa0hP/UP64KXzcCKMcxl6fFN3Zv7EnMqlBTKylJkJFO3ff+04mxcsy
 rqhoyukp9SiA3c+lkvXIt0qM+b3Ts4zT63NKG0IXKS2gqBfhSQCSqVNFtmfnMHch7AiaFj9oFx
 TaFlej1Y75UoUIOUoci4FBiEv0Jy0P/iwMyP6h++X45kbxxHqe2/W6mh85vxo4pqHTk2/iwddG
 JNiJE5lSG2frQmfP4ZfJ/nb5SLpSseMFjKdRZSH1tv+QCN9NL/qmMSUlcdKfKCy/c9uRGzbFjD
 UCo=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.64])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2022 18:29:00 -0700
To: kbusch@kernel.org,
	its@irrelevant.dk
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH 2/4] hw/nvme: store a pointer to the NvmeSubsystem in the
 NvmeNamespace
Date: Wed,  8 Jun 2022 03:28:48 +0200
Message-Id: <20220608012850.668695-3-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220608012850.668695-1-niklas.cassel@wdc.com>
References: <20220608012850.668695-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=151ed2091=niklas.cassel@wdc.com; helo=esa3.hgst.iphmx.com
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
index 1b9c9d1156..07759a973b 100644
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
index e41771604f..32333d0c89 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -162,6 +162,7 @@ typedef struct NvmeNamespace {
     int32_t         nr_active_zones;
 
     NvmeNamespaceParams params;
+    NvmeSubsystem *subsys;
 
     struct {
         uint32_t err_rec;
-- 
2.36.1


