Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D185EE2A5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 19:12:14 +0200 (CEST)
Received: from localhost ([::1]:36988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odabV-0005DH-Vt
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 13:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org>)
 id 1odaDn-0003jH-I8; Wed, 28 Sep 2022 12:47:44 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:49729
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org>)
 id 1odaDk-0001Hp-U9; Wed, 28 Sep 2022 12:47:43 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Md2Tz5WYFz4xGl;
 Thu, 29 Sep 2022 02:47:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Md2Tx3KQbz4xGT;
 Thu, 29 Sep 2022 02:47:33 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/2] ast2600: Drop NEON from the CPU features
Date: Wed, 28 Sep 2022 18:47:19 +0200
Message-Id: <20220928164719.655586-3-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928164719.655586-1-clg@kaod.org>
References: <20220928164719.655586-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Currently, the CPU features exposed to the AST2600 QEMU machines are :

  half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
  vfpd32 lpae evtstrm

But, the features of the Cortex A7 CPU on the Aspeed AST2600 A3 SoC
are :

  half thumb fastmult vfp edsp vfpv3 vfpv3d16 tls vfpv4 idiva idivt
  lpae evtstrm

Drop NEON support in the Aspeed AST2600 SoC.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index dcdc9bc54456..af987fd418ec 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -330,6 +330,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
 
         object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000,
                                 &error_abort);
+        object_property_set_bool(OBJECT(&s->cpu[i]), "neon", false,
+                                &error_abort);
         object_property_set_link(OBJECT(&s->cpu[i]), "memory",
                                  OBJECT(s->memory), &error_abort);
 
-- 
2.37.3


