Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B517D20CA58
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Jun 2020 22:24:04 +0200 (CEST)
Received: from localhost ([::1]:40016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpdqN-0000bv-Oe
	for lists+qemu-devel@lfdr.de; Sun, 28 Jun 2020 16:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jpdnz-0005tZ-KS
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 16:21:35 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:47701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jpdny-0004Ep-1e
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 16:21:35 -0400
X-Originating-IP: 82.252.130.88
Received: from localhost.localdomain (lns-bzn-59-82-252-130-88.adsl.proxad.net
 [82.252.130.88]) (Authenticated sender: jcd@tribudubois.net)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 826C7FF803;
 Sun, 28 Jun 2020 20:21:30 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, peter.chubb@nicta.com.au,
 f4bug@amsat.org
Subject: [PATCH 3/3] Select MDIO device 2 and 1 as PHY devices for i.MX6UL EVK
 board.
Date: Sun, 28 Jun 2020 22:20:58 +0200
Message-Id: <fb41992126c091a71d76ab3d1898959091f60583.1593296112.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1593296112.git.jcd@tribudubois.net>
References: <cover.1593296112.git.jcd@tribudubois.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.183.199; envelope-from=jcd@tribudubois.net;
 helo=relay9-d.mail.gandi.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/28 16:21:22
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The i.MX6UL EVK 14x14 board uses:
- PHY 2 for FEC 1
- PHY 1 for FEC 2

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---
 hw/arm/mcimx6ul-evk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index 2f845cedfce..9033d3f8f38 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -40,6 +40,8 @@ static void mcimx6ul_evk_init(MachineState *machine)
 
     s = FSL_IMX6UL(object_new(TYPE_FSL_IMX6UL));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
+    object_property_set_uint(OBJECT(s), 2, "fec1-phy-num", &error_fatal);
+    object_property_set_uint(OBJECT(s), 1, "fec2-phy-num", &error_fatal);
     qdev_realize(DEVICE(s), NULL, &error_fatal);
 
     memory_region_add_subregion(get_system_memory(), FSL_IMX6UL_MMDC_ADDR,
-- 
2.25.1


