Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D51650C8C8
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 11:47:52 +0200 (CEST)
Received: from localhost ([::1]:56832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niCMo-0002cL-Jo
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 05:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1niCIm-0000aY-9s
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 05:43:40 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:38687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1niCIi-0001ob-EG
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 05:43:39 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4A1C6746E07;
 Sat, 23 Apr 2022 11:43:31 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C6D7A746399; Sat, 23 Apr 2022 11:43:30 +0200 (CEST)
Message-Id: <cc6e99fd498a9ae358ebce787fc04ab6e8201879.1650706617.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1650706617.git.balaton@eik.bme.hu>
References: <cover.1650706617.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 2/3] hw/audio/ac97: Remove unimplemented reset functions
Date: Sat, 23 Apr 2022 11:36:57 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Victor Colombo <victor.colombo@eldorado.org.br>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The warm_reset() and cold_reset() functions are not implemented and do
nothing so no point in calling them or keep around as dead code.
Therefore remove them for now.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/audio/ac97.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index 6b1c12bece..6584aa749e 100644
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
2.30.4


