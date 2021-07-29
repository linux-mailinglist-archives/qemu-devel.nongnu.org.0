Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7249D3D9E03
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 09:05:32 +0200 (CEST)
Received: from localhost ([::1]:45610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m906k-0006qv-Ui
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 03:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m903A-00044C-TP; Thu, 29 Jul 2021 03:01:49 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46887 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m9037-0002iJ-Lx; Thu, 29 Jul 2021 03:01:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gb1fX5Lgnz9sX5; Thu, 29 Jul 2021 17:01:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1627542100;
 bh=qe6Vd5howK2H7l3/sMihCzBl+/mB0ivjbnIClOLBUiY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MoLHa2kUcIWSrlsV7kyICZJ3KO/9Ye4PKP/rs5cNrUWHq06LE+x9CjLfMiKjBGkCK
 6ubphEhT74lbNrgiKwmZhAj6mGxBjr/FLRdWZKiLAEVcB8tR+bnCB6rBxhRYoUkXeR
 +6JFyI2pdZ7AbY9zv6ac5inx1bq2HAC+otbvEAPM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 2/5] i2c/smbus_eeprom: Add feature bit to SPD data
Date: Thu, 29 Jul 2021 17:01:32 +1000
Message-Id: <20210729070135.422262-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729070135.422262-1-david@gibson.dropbear.id.au>
References: <20210729070135.422262-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Add the differential clock input feature bit to the generated SPD
data. Most guests don't seem to care but pegasos2 firmware version 1.2
checks for this bit and stops with unsupported module type error if
it's not present. Since this feature is likely present on real memory
modules add it in the general code rather than patching the generated
SPD data in pegasos2 board only.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <19d42ade295d5297aa624a9eb757b8df18cf64d6.1626367844.git.balaton@eik.bme.hu>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/i2c/smbus_eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
index 4d2bf99207..12c5741f38 100644
--- a/hw/i2c/smbus_eeprom.c
+++ b/hw/i2c/smbus_eeprom.c
@@ -276,7 +276,7 @@ uint8_t *spd_data_generate(enum sdram_type type, ram_addr_t ram_size)
     spd[18] = 12;   /* ~CAS latencies supported */
     spd[19] = (type == DDR2 ? 0 : 1); /* reserved / ~CS latencies supported */
     spd[20] = 2;    /* DIMM type / ~WE latencies */
-                    /* module features */
+    spd[21] = (type < DDR2 ? 0x20 : 0); /* module features */
                     /* memory chip features */
     spd[23] = 0x12; /* clock cycle time @ medium CAS latency */
                     /* data access time */
-- 
2.31.1


