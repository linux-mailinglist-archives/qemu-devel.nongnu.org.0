Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF7668C91E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:08:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP9ek-0004pw-0e; Mon, 06 Feb 2023 17:08:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9ec-0004nl-Po; Mon, 06 Feb 2023 17:08:02 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9eb-0007ML-6n; Mon, 06 Feb 2023 17:08:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=37y9ArJrRmR4NtNGG3nAwkdKsOPah8Log7LmL+4MKtU=; b=d09bvFKWsVFcOTnfli4xLYY1VZ
 HreyLBCzXxS7o41dlPyahn2tup6iJ1wjKrbbICxfs+I4LM0tMcYCqFrzZrOjEI+s5wdfaBM8GY7Yj
 n53TvjB5a5uvj9oYUUhKrOH+kcy1kYCOVp7qL9T4QW5dRJTtcf+t8tQDkeoa0ynUc/HhihBl77YuK
 mpT/6VxYztBpGWUUFYLwt7tMf7C0xsdRZ3airZVIM9wDKd3en8GjM8WIX7CFyipaSx8YqvA881KUX
 IkQPdfLKlRUtz+5auWzta8118dWTusJq0v9CscE7UXrTMu63D4EK2v64XgQqhV0JNSWLVxCv1v5SE
 G4EfAkuVXwDVQTxDALaVKnNt8vHmqnb+6ksJiaHR9j2T/6MYPhTQIlLMl6VjqMslZp53hRq23IpeX
 OgwiHIc2gfErUz3Kg6X7BD291udAVZNrJqo4sbOHqs9E9xhb57ddXZc/4Z0ByY/+mWTt726cuCWFU
 9Rsx2dg6vzFp0xiew+hvBhjkE48c/rN8ayjZffoUrIw1A7FBnfeZZ/C3PnrUzsiqeBy8dPDeMOfZt
 iOUbm8PdofqMxdiyLK2lXflBHoR+KJro94mi0bTrf+Ut16V/qpCmBYWSJDca1ttAIv/uY3COPZItw
 XJ3+Rmj6Kyece6zp9GYH/ZGiBDtOcFHVUCF7E8Rx0=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9e2-00039N-JX; Mon, 06 Feb 2023 22:07:30 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Mon,  6 Feb 2023 22:07:19 +0000
Message-Id: <20230206220722.125814-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230206220722.125814-1-mark.cave-ayland@ilande.co.uk>
References: <20230206220722.125814-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 5/8] hw/misc/macio: Remove some single use local variables
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

Drop some local variables that could just be substituted at the single
place they were used. This makes the code shorter and simpler.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <165a4ea190af7c09832f50f02004fad82f704898.1674001242.git.balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/macio/macio.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 4d7223cc85..ae2a9a960d 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -53,10 +53,8 @@
  */
 static void macio_escc_legacy_setup(MacIOState *s)
 {
-    ESCCState *escc = ESCC(&s->escc);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(escc);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(&s->escc);
     MemoryRegion *escc_legacy = g_new(MemoryRegion, 1);
-    MemoryRegion *bar = &s->bar;
     int i;
     static const int maps[] = {
         0x00, 0x00, /* Command B */
@@ -80,16 +78,15 @@ static void macio_escc_legacy_setup(MacIOState *s)
         memory_region_add_subregion(escc_legacy, maps[i], port);
     }
 
-    memory_region_add_subregion(bar, 0x12000, escc_legacy);
+    memory_region_add_subregion(&s->bar, 0x12000, escc_legacy);
 }
 
 static void macio_bar_setup(MacIOState *s)
 {
-    ESCCState *escc = ESCC(&s->escc);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(escc);
-    MemoryRegion *bar = &s->bar;
+    SysBusDevice *sbd = SYS_BUS_DEVICE(&s->escc);
+    MemoryRegion *bar = sysbus_mmio_get_region(sbd, 0);
 
-    memory_region_add_subregion(bar, 0x13000, sysbus_mmio_get_region(sbd, 0));
+    memory_region_add_subregion(&s->bar, 0x13000, bar);
     macio_escc_legacy_setup(s);
 }
 
-- 
2.30.2


