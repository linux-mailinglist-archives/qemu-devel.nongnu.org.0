Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA199412769
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 22:41:22 +0200 (CEST)
Received: from localhost ([::1]:59650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSQ6I-0000dC-Pg
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 16:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mSQ4g-0008B5-0S; Mon, 20 Sep 2021 16:39:38 -0400
Received: from mail.csgraf.de ([85.25.223.15]:53656 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mSQ4c-0000aV-Lm; Mon, 20 Sep 2021 16:39:37 -0400
Received: from localhost.localdomain
 (dynamic-095-115-125-107.95.115.pool.telefonica.de [95.115.125.107])
 by csgraf.de (Postfix) with ESMTPSA id 71A896080333;
 Mon, 20 Sep 2021 22:39:31 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH] allwinner-h3: Switch to SMC as PSCI conduit
Date: Mon, 20 Sep 2021 22:39:31 +0200
Message-Id: <20210920203931.66527-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Allwinner H3 SoC uses Cortex-A7 cores which support virtualization.
However, today we are configuring QEMU to use HVC as PSCI conduit.

That means HVC calls get trapped into QEMU instead of the guest's own
emulated CPU and thus break the guest's ability to execute virtualization.

Fix this by moving to SMC as conduit, freeing up HYP completely to the VM.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Fixes: 740dafc0ba0 ("hw/arm: add Allwinner H3 System-on-Chip")
---
 hw/arm/allwinner-h3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 27f1070145..f9b7ed1871 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -237,7 +237,7 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
 
         /* Provide Power State Coordination Interface */
         qdev_prop_set_int32(DEVICE(&s->cpus[i]), "psci-conduit",
-                            QEMU_PSCI_CONDUIT_HVC);
+                            QEMU_PSCI_CONDUIT_SMC);
 
         /* Disable secondary CPUs */
         qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off",
-- 
2.30.1 (Apple Git-130)


