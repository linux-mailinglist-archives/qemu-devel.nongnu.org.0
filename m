Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2C955E5D6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 17:55:51 +0200 (CEST)
Received: from localhost ([::1]:37388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6DZ8-0006gI-Mb
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 11:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xpXT=XD=kaod.org=clg@ozlabs.org>)
 id 1o6DRY-0003iG-T1; Tue, 28 Jun 2022 11:48:01 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:41423
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xpXT=XD=kaod.org=clg@ozlabs.org>)
 id 1o6DRV-0001oC-07; Tue, 28 Jun 2022 11:48:00 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LXTWX2Vbhz4xYL;
 Wed, 29 Jun 2022 01:47:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LXTWV2FtHz4xR1;
 Wed, 29 Jun 2022 01:47:50 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/3] aspeed/i2c: Change trace event for NORMAL_STOP states
Date: Tue, 28 Jun 2022 17:47:39 +0200
Message-Id: <20220628154740.1117349-3-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220628154740.1117349-1-clg@kaod.org>
References: <20220628154740.1117349-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=xpXT=XD=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Using a 'stop' string seems more appropriate than 'normal'.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 37ae1f2e04bd..9b41bc38964f 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -58,7 +58,7 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
                ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH) ?
                                                "slave-match|" : "",
                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_STOP) ?
-                                               "normal|" : "",
+                                               "stop|" : "",
                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, ABNORMAL) ?
                                                "abnormal"  : "");
 
-- 
2.35.3


