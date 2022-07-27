Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F11B582496
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 12:38:59 +0200 (CEST)
Received: from localhost ([::1]:55894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGeRO-00079t-5w
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 06:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=RDWM=YA=kaod.org=clg@ozlabs.org>)
 id 1oGeGS-0006Ds-54; Wed, 27 Jul 2022 06:27:40 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:57441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=RDWM=YA=kaod.org=clg@ozlabs.org>)
 id 1oGeGQ-0004VR-CZ; Wed, 27 Jul 2022 06:27:39 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Lt92R4h7Sz4xCy;
 Wed, 27 Jul 2022 20:27:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lt92N6W5Cz4x1N;
 Wed, 27 Jul 2022 20:27:24 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <peter@pjd.dev>
Subject: [PATCH for 7.1 2/2] aspeed/fby35: Fix owner of the BMC RAM memory
 region
Date: Wed, 27 Jul 2022 12:27:14 +0200
Message-Id: <20220727102714.803041-3-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727102714.803041-1-clg@kaod.org>
References: <20220727102714.803041-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=RDWM=YA=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

A MachineState object is used as a owner of the RAM region and this
asserts in memory_region_init_ram() when QEMU is built with
CONFIG_QOM_CAST_DEBUG :

    /* This will assert if owner is neither NULL nor a DeviceState.
     * We only want the owner here for the purposes of defining a
     * unique name for migration. TODO: Ideally we should implement
     * a naming scheme for Objects which are not DeviceStates, in
     * which case we can relax this restriction.
     */
    owner_dev = DEVICE(owner);

Use the BMC and BIC objects as the owners of their memory regions.

Cc: Peter Delevoryas <peter@pjd.dev>
Fixes: 778e14cc5cd5 ("aspeed: Add AST2600 (BMC) to fby35")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/fby35.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index 79605f306462..90c04bbc3389 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -72,11 +72,13 @@ static void fby35_bmc_init(Fby35State *s)
 {
     DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
 
-    memory_region_init(&s->bmc_memory, OBJECT(s), "bmc-memory", UINT64_MAX);
-    memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram",
+    object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
+
+    memory_region_init(&s->bmc_memory, OBJECT(&s->bmc), "bmc-memory",
+                       UINT64_MAX);
+    memory_region_init_ram(&s->bmc_dram, OBJECT(&s->bmc), "bmc-dram",
                            FBY35_BMC_RAM_SIZE, &error_abort);
 
-    object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
     object_property_set_int(OBJECT(&s->bmc), "ram-size", FBY35_BMC_RAM_SIZE,
                             &error_abort);
     object_property_set_link(OBJECT(&s->bmc), "memory", OBJECT(&s->bmc_memory),
@@ -120,9 +122,11 @@ static void fby35_bic_init(Fby35State *s)
     s->bic_sysclk = clock_new(OBJECT(s), "SYSCLK");
     clock_set_hz(s->bic_sysclk, 200000000ULL);
 
-    memory_region_init(&s->bic_memory, OBJECT(s), "bic-memory", UINT64_MAX);
-
     object_initialize_child(OBJECT(s), "bic", &s->bic, "ast1030-a1");
+
+    memory_region_init(&s->bic_memory, OBJECT(&s->bic), "bic-memory",
+                       UINT64_MAX);
+
     qdev_connect_clock_in(DEVICE(&s->bic), "sysclk", s->bic_sysclk);
     object_property_set_link(OBJECT(&s->bic), "memory", OBJECT(&s->bic_memory),
                              &error_abort);
-- 
2.37.1


