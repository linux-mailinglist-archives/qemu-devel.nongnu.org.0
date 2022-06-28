Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275D555C0EA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 14:23:42 +0200 (CEST)
Received: from localhost ([::1]:53224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6AFo-0007fi-HG
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 08:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=171ad38db=niklas.cassel@wdc.com>)
 id 1o6AEk-0006Nt-TN; Tue, 28 Jun 2022 08:22:34 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:15504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=171ad38db=niklas.cassel@wdc.com>)
 id 1o6AEh-0006TM-KZ; Tue, 28 Jun 2022 08:22:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656418949; x=1687954949;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HJTSrKwLut5ZKnHOe8aGXc4DlbMTOL8yIrcYaxpj8Mc=;
 b=ccHJ1ljoxhJ+xjrLXJMlRaKg+5JizN8RAefPZE/vJPzpO6TYflZ3rOE7
 WBomL2HTe7lFgpZ1aKDhDq7b47XhZFHnkquJojva3cDGyuUOnsCnMiMph
 NItrXU1YWg6krF6aj7nAxRNWVmhDonIseqhKp/sQszlkpRDUPdVKfdk5R
 1r52uc9WH76/PMrIt3EcL/EKi0CnAeHMBvFAvdI8KONC3atYfiaj/VlJZ
 STTQtMHIO96CijyE9V2rH9bFQEAT1Pc89rJlT+jdHQ5XvaGtoY9/lNoZC
 9Sx4MoFsIBDsU5sJJGKbNRohVSR5cwdO08s62fpbQp4NA7M4NBpQKFC6K g==;
X-IronPort-AV: E=Sophos;i="5.92,227,1650902400"; d="scan'208";a="209156964"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jun 2022 20:22:22 +0800
IronPort-SDR: U3ciiSCwDvgbdWFBFNe/kvkW642tOj2xXFy238bsAu0r01iy0TYpP7yPidmynMdEJzBcePnVLR
 a7FDCJQYyYG7E28GKp7Y2OAM48Q3OPwaVlmTpa5hMBYA1d0/2gqfqkmNGzSbq9ofX0cLDz856y
 MbnT8SI3MHLO3hls8l00YmKn4T9tapLi62agw45lmUbLu3+6EfpxFZz/PnvYa2me4/SK+hUdHc
 +O1s8HwWRWb8n2eGJSWpDmdscHQmmoKSHoDM06A2UDN9S0UQVa4JdOv92yuqKiDbygqlxFHE3G
 tfdUaLPVaWtYZ8aU3uC1uVFj
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2022 04:44:45 -0700
IronPort-SDR: 5N1G5BumggmcT6kLC9vKYEx3SGOG/c5Z/nXa1AUkPEVbxj9kF8/BHCjl9b6uLs2lau2Xu1n1l6
 JPWKnIHRQdfkqxfp3GxmKuLo+mDRPSYoN194+LOumTKqezWRwrMJNSlgvzlcbypzglFmjVnzrP
 2T8GLDFMUd1k9HyVf8PAUr7M7QFZ1AaWuT0Zka8x3yrZvK3fSa2HD24KvV5kpl2qAQhEVyctZR
 Bt7/PLGQHWLL3IDf8cBy8nm8CSfALkzvMsh4DeehfjblXfXv7WWVsAHzfqRjdK8mkrM+Nopsd3
 nRc=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.cphwdc) ([10.225.164.111])
 by uls-op-cesaip01.wdc.com with ESMTP; 28 Jun 2022 05:22:22 -0700
To: kbusch@kernel.org,
	its@irrelevant.dk
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hch@infradead.org,
 Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH] hw/nvme: force nvme-ns param 'shared' to false if no
 nvme-subsys node
Date: Tue, 28 Jun 2022 14:22:09 +0200
Message-Id: <20220628122209.415725-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=171ad38db=niklas.cassel@wdc.com; helo=esa3.hgst.iphmx.com
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

Since commit 916b0f0b5264 ("hw/nvme: change nvme-ns 'shared' default")
the default value of nvme-ns param 'shared' is set to true, regardless
if there is a nvme-subsys node or not.

On a system without a nvme-subsys node, a namespace will never be able
to be attached to more than one controller, so for this configuration,
it is counterintuitive for this parameter to be set by default.

Force the nvme-ns param 'shared' to false for configurations where
there is no nvme-subsys node, as the namespace will never be able to
attach to more than one controller anyway.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 hw/nvme/ns.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 870c3ca1a2..62a1f97be0 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -546,6 +546,8 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
     int i;
 
     if (!n->subsys) {
+        /* If no subsys, the ns cannot be attached to more than one ctrl. */
+        ns->params.shared = false;
         if (ns->params.detached) {
             error_setg(errp, "detached requires that the nvme device is "
                        "linked to an nvme-subsys device");
-- 
2.36.1


