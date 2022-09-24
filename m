Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BD25E8CCB
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 14:57:57 +0200 (CEST)
Received: from localhost ([::1]:59292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc4jE-0003CD-AD
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 08:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oc4GR-0008TF-OO; Sat, 24 Sep 2022 08:28:11 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:62714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oc4GQ-0001EM-6R; Sat, 24 Sep 2022 08:28:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 348E375A167;
 Sat, 24 Sep 2022 14:28:06 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 15E1A75A166; Sat, 24 Sep 2022 14:28:06 +0200 (CEST)
Message-Id: <74d9bf4891e2ccceb52bb6ca6b54fd3f37a9fb04.1664021647.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1664021647.git.balaton@eik.bme.hu>
References: <cover.1664021647.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 16/25] ppc440_uc.c: Move some macros to ppc4xx.h
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 24 Sep 2022 14:28:06 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

These are used by both the SDRAM controller model and system DCRs. In
preparation to move SDRAM controller in its own file move these macros
to the ppc4xx.h header.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/ppc440_uc.c      | 4 ----
 include/hw/ppc/ppc4xx.h | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 46daecab19..0a41274d63 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -380,10 +380,6 @@ enum {
     PESDR1_RSTSTA = 0x365,
 };
 
-#define SDR0_DDR0_DDRM_ENCODE(n)  ((((unsigned long)(n)) & 0x03) << 29)
-#define SDR0_DDR0_DDRM_DDR1       0x20000000
-#define SDR0_DDR0_DDRM_DDR2       0x40000000
-
 static uint32_t dcr_read_sdr(void *opaque, int dcrn)
 {
     ppc4xx_sdr_t *sdr = opaque;
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index ff88385ac0..10c6dd535f 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -111,6 +111,10 @@ struct Ppc4xxEbcState {
 };
 
 /* SDRAM DDR controller */
+#define SDR0_DDR0_DDRM_ENCODE(n)  ((((unsigned long)(n)) & 0x03) << 29)
+#define SDR0_DDR0_DDRM_DDR1       0x20000000
+#define SDR0_DDR0_DDRM_DDR2       0x40000000
+
 #define TYPE_PPC4xx_SDRAM_DDR "ppc4xx-sdram-ddr"
 OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxSdramDdrState, PPC4xx_SDRAM_DDR);
 struct Ppc4xxSdramDdrState {
-- 
2.30.4


