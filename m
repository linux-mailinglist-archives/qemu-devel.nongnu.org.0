Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AFB150ED2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 18:43:00 +0100 (CET)
Received: from localhost ([::1]:45274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyfkR-0002qj-OA
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 12:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42405)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rsta2@o2online.de>) id 1iyfj3-0002Jc-Cp
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 12:41:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rsta2@o2online.de>) id 1iyfj2-0003KH-E9
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 12:41:33 -0500
Received: from mail1454c50.megamailservers.eu ([91.136.14.54]:52974
 helo=mail266c50.megamailservers.eu)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <rsta2@o2online.de>)
 id 1iyfiz-0002vb-Cm; Mon, 03 Feb 2020 12:41:30 -0500
X-Authenticated-User: 017626146082@o2online.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megamailservers.eu;
 s=maildub; t=1580744483;
 bh=UEdoKkBekSSPy6Qva+zTYSGw/Rf/PxDmGz4nNClJIFw=;
 h=From:To:Cc:Subject:Date:From;
 b=g+vyjUW3mtpmUo7qWoMTJkoXtilP06Y4BQASpVpatLAQRs/rwHKcr+BITr4d4Vqxg
 pVSZBhaU7EgQwvWvtI2Smg4p1pZuXOR3LtWBODobZ+zbFu3hWOe88/LLOgNqWyZMrJ
 s7MjQusGqd/zgbsCYqzZMF+hxoPxZUClHLwHNO5A=
Feedback-ID: rsta2@o2online.
Received: from desktop2.localnet (178-21-1-177.ilmprovider.net [178.21.1.177])
 (authenticated bits=0)
 by mail266c50.megamailservers.eu (8.14.9/8.13.1) with ESMTP id 013FfLPU022990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 3 Feb 2020 15:41:23 +0000
From: Rene Stange <rsta2@o2online.de>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>
Subject: [PATCH v2 2/2] bcm2835_dma: Re-initialize xlen in TD mode
Date: Mon, 03 Feb 2020 16:40:51 +0100
Message-ID: <5397138.k0qeMALlIp@desktop2>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CTCH-RefID: str=0001.0A0B0201.5E383F23.0053, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-VOD: Unknown
X-CTCH-Spam: Unknown
X-CTCH-Score: 0.000
X-CTCH-Rules: 
X-CTCH-Flags: 0
X-CTCH-ScoreCust: 0.000
X-CSC: 0
X-CHA: v=2.3 cv=PNJxBsiC c=1 sm=1 tr=0 a=oFQkuSNlBNCQRuITVo1IXg==:117
 a=oFQkuSNlBNCQRuITVo1IXg==:17 a=kj9zAlcOel0A:10 a=SvY40l2xVmRt99U1V6QA:9
 a=CjuIK1q_8ugA:10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 91.136.14.54
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Andrew Baumann <andrew.baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TD (two dimensions) DMA mode did not work, because the xlen variable
has not been re-initialized before each additional ylen run through
in bcm2835_dma_update(), which has been fixed.

Signed-off-by: Rene Stange <rsta2@o2online.de>
---
 hw/dma/bcm2835_dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
index 667d951a6f..ccff5ed55b 100644
--- a/hw/dma/bcm2835_dma.c
+++ b/hw/dma/bcm2835_dma.c
@@ -54,7 +54,7 @@
 static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
 {
     BCM2835DMAChan *ch = &s->chan[c];
-    uint32_t data, xlen, ylen;
+    uint32_t data, xlen, xlen_td, ylen;
     int16_t dst_stride, src_stride;
 
     if (!(s->enable & (1 << c))) {
@@ -82,6 +82,7 @@ static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
             dst_stride = 0;
             src_stride = 0;
         }
+        xlen_td = xlen;
 
         while (ylen != 0) {
             /* Normal transfer mode */
@@ -117,6 +118,7 @@ static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
             if (--ylen != 0) {
                 ch->source_ad += src_stride;
                 ch->dest_ad += dst_stride;
+                xlen = xlen_td;
             }
         }
         ch->cs |= BCM2708_DMA_END;
-- 
2.16.4





