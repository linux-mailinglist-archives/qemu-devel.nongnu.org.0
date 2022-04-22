Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB3150BB99
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 17:23:18 +0200 (CEST)
Received: from localhost ([::1]:57710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhv7t-00085d-HC
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 11:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nhv5m-00056P-3N
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:21:06 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:31646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nhv5i-0002rj-A6
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:21:04 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8DE03746E0D;
 Fri, 22 Apr 2022 17:20:59 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1A450746399; Fri, 22 Apr 2022 17:20:59 +0200 (CEST)
Message-Id: <57eb1f68f875c3898ab98caa5b71d39c4578c362.1650640480.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1650640480.git.balaton@eik.bme.hu>
References: <cover.1650640480.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 2/3] hw/audio/ac97: Remove unimplemented reset functions
Date: Fri, 22 Apr 2022 17:14:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The warm_reset() and cold_reset() functions are not implemented and do
nothing so no point in calling them or keep around as dead code.
Therefore remove them for now.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
v2: added TODO comment

 hw/audio/ac97.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index 0b1d8ce9c6..6e4f6125af 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -222,16 +222,6 @@ static void po_callback(void *opaque, int free);
 static void pi_callback(void *opaque, int avail);
 static void mc_callback(void *opaque, int avail);
 
-static void warm_reset(AC97LinkState *s)
-{
-    (void)s;
-}
-
-static void cold_reset(AC97LinkState *s)
-{
-    (void)s;
-}
-
 static void fetch_bd(AC97LinkState *s, AC97BusMasterRegs *r)
 {
     uint8_t b[8];
@@ -921,12 +911,7 @@ static void nabm_writel(void *opaque, uint32_t addr, uint32_t val)
         dolog("BDBAR[%d] <- 0x%x (bdbar 0x%x)\n", GET_BM(index), val, r->bdbar);
         break;
     case GLOB_CNT:
-        if (val & GC_WR) {
-            warm_reset(s);
-        }
-        if (val & GC_CR) {
-            cold_reset(s);
-        }
+        /* TODO: Handle WR or CR being set (warm/cold reset requests) */
         if (!(val & (GC_WR | GC_CR))) {
             s->glob_cnt = val & GC_VALID_MASK;
         }
-- 
2.30.2


