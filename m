Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F4B5EE462
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 20:30:08 +0200 (CEST)
Received: from localhost ([::1]:56740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odbos-0005Yq-5e
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 14:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org>)
 id 1odaDm-0003jB-Eb; Wed, 28 Sep 2022 12:47:44 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:47523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org>)
 id 1odaDk-0001HU-NT; Wed, 28 Sep 2022 12:47:42 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Md2Tw6l1Qz4xGk;
 Thu, 29 Sep 2022 02:47:32 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Md2Tt4fyHz4xGZ;
 Thu, 29 Sep 2022 02:47:30 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/2] target/arm: Disable VFPv4-D32 when NEON is not available
Date: Wed, 28 Sep 2022 18:47:18 +0200
Message-Id: <20220928164719.655586-2-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928164719.655586-1-clg@kaod.org>
References: <20220928164719.655586-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

As the Cortex A7 MPCore Technical reference says :

  "When FPU option is selected without NEON, the FPU is VFPv4-D16 and
  uses 16 double-precision registers. When the FPU is implemented with
  NEON, the FPU is VFPv4-D32 and uses 32 double-precision registers.
  This register bank is shared with NEON."

Modify the mvfr0 register value of the cortex A7 to advertise only 16
registers when NEON is not available, and not 32 registers.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7ec3281da9aa..01dc74c32add 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1684,6 +1684,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->isar.id_isar6 = u;
 
         if (!arm_feature(env, ARM_FEATURE_M)) {
+            u = cpu->isar.mvfr0;
+            u = FIELD_DP32(u, MVFR0, SIMDREG, 1); /* 16 registers */
+            cpu->isar.mvfr0 = u;
+
             u = cpu->isar.mvfr1;
             u = FIELD_DP32(u, MVFR1, SIMDLS, 0);
             u = FIELD_DP32(u, MVFR1, SIMDINT, 0);
-- 
2.37.3


