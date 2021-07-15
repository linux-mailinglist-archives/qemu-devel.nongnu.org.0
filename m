Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F66D3CA388
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 19:04:30 +0200 (CEST)
Received: from localhost ([::1]:57722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m44mj-0004Xh-2B
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 13:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m44kI-00028i-LV; Thu, 15 Jul 2021 13:01:58 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:15159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m44kF-0008Vq-Ba; Thu, 15 Jul 2021 13:01:58 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 40DD0746353;
 Thu, 15 Jul 2021 19:01:52 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C2AA57462E0; Thu, 15 Jul 2021 19:01:51 +0200 (CEST)
Message-Id: <19d42ade295d5297aa624a9eb757b8df18cf64d6.1626367844.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1626367844.git.balaton@eik.bme.hu>
References: <cover.1626367844.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 2/2] i2c/smbus_eeprom: Add feature bit to SPD data
Date: Thu, 15 Jul 2021 18:50:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>, f4bug@amsat.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the differential clock input feature bit to the generated SPD
data. Most guests don't seem to care but pegasos2 firmware version 1.2
checks for this bit and stops with unsupported module type error if
it's not present. Since this feature is likely present on real memory
modules add it in the general code rather than patching the generated
SPD data in pegasos2 board only.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
I've tested it with the firmware of pegasos2, sam460ex, fuloong2e and
g3beige (latter is not upstream yet) that are the only ones using this
function currently. Probably this could go in via PPC tree with my
other pegasos2 fix if respective maitainers ack this patch.

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
2.21.4


