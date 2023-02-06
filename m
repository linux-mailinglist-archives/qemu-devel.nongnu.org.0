Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12F168C91B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:08:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP9eY-0004hF-GM; Mon, 06 Feb 2023 17:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9eV-0004bz-Na; Mon, 06 Feb 2023 17:07:56 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9eS-0007Kz-Op; Mon, 06 Feb 2023 17:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xxCKmGelIoTop79r5c0SyK9bJF5wtRiTURPAndjhsM0=; b=UrHMCy2nybaJFkqH2co7kldCFi
 7iKXDDISxqGWY+2Vdm+9QAuDpD/XAyk+NRzvRfijZCoeyjKOdUXozPE7Xct7lEXXNL3OpmAqqnok5
 XlnJLdf3hTMeYDcr5kwV172p3SW4GWNIsrEACwwo55twcfzhqeK0pOfjqWWKAbOrd9t6NFvd8CrxD
 YAQo3yrA/Qwwc4A978sC4VlEjE1PFem1uAMlcb2dyJT5Y9+SiilJcvM+YCT1UlIHjikfhMwEjKuUy
 e8jzadt/jZ+T8N6boWkP2yc3oyzlCEqPeO6pJe4OWsyytPjjHypER0CT8iNhgO+uSv985YO7pWxlu
 4pIo8AumZ09meBDkSLAjpF06fTbwaqg14wgR4GKJKa0aIM5Drd/chk8yBG9h1VtBc4H5bZGdwlmb0
 sJ+GF9Gufj/3Q15slUhCjSkDYeNhOtqMXYqHCLA5M8GhxB4x42mPH++z61Krd5WmS8uqQwtiAf+Mv
 1CYDaSRmOS1OpjBv/1PxIQlNC3dP5k3pn7Il7gDWtAPbCPYVKJhKBRxv53tvdHYmstq/iiGVbgVXW
 9d/0MRTL/EYmP/ZxXBPuCHCAkaz6vM+bLXruGGbjc578KLdj1QzgRcP7il+HxOi2qZDbk3pv/pbXe
 Y592cpLKDRqb5OrDk/TgnzuOr8anf+qSMnwkQomGg=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9du-00039N-Bz; Mon, 06 Feb 2023 22:07:22 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Mon,  6 Feb 2023 22:07:17 +0000
Message-Id: <20230206220722.125814-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230206220722.125814-1-mark.cave-ayland@ilande.co.uk>
References: <20230206220722.125814-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 3/8] hw/misc/macio: Avoid some QOM casts
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

At several places we already have the object pointer with the right
type so we don't need to cast it back and forth. Avoiding these casts
improves readability.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <67b2d4700879c3b4cd574f1faa1a0d1950b3d0ee.1674001242.git.balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/macio/macio.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 08dbdd7fc0..0dfe372965 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -220,11 +220,11 @@ static void macio_oldworld_init(Object *obj)
     DeviceState *dev;
     int i;
 
-    object_initialize_child(OBJECT(s), "pic", &os->pic, TYPE_HEATHROW);
+    object_initialize_child(obj, "pic", &os->pic, TYPE_HEATHROW);
 
-    object_initialize_child(OBJECT(s), "cuda", &s->cuda, TYPE_CUDA);
+    object_initialize_child(obj, "cuda", &s->cuda, TYPE_CUDA);
 
-    object_initialize_child(OBJECT(s), "nvram", &os->nvram, TYPE_MACIO_NVRAM);
+    object_initialize_child(obj, "nvram", &os->nvram, TYPE_MACIO_NVRAM);
     dev = DEVICE(&os->nvram);
     qdev_prop_set_uint32(dev, "size", MACIO_NVRAM_SIZE);
     qdev_prop_set_uint32(dev, "it_shift", 4);
@@ -372,9 +372,9 @@ static void macio_newworld_init(Object *obj)
     NewWorldMacIOState *ns = NEWWORLD_MACIO(obj);
     int i;
 
-    object_initialize_child(OBJECT(s), "pic", &ns->pic, TYPE_OPENPIC);
+    object_initialize_child(obj, "pic", &ns->pic, TYPE_OPENPIC);
 
-    object_initialize_child(OBJECT(s), "gpio", &ns->gpio, TYPE_MACIO_GPIO);
+    object_initialize_child(obj, "gpio", &ns->gpio, TYPE_MACIO_GPIO);
 
     for (i = 0; i < 2; i++) {
         macio_init_ide(s, &ns->ide[i], i);
@@ -390,9 +390,9 @@ static void macio_instance_init(Object *obj)
     qbus_init(&s->macio_bus, sizeof(s->macio_bus), TYPE_MACIO_BUS,
               DEVICE(obj), "macio.0");
 
-    object_initialize_child(OBJECT(s), "dbdma", &s->dbdma, TYPE_MAC_DBDMA);
+    object_initialize_child(obj, "dbdma", &s->dbdma, TYPE_MAC_DBDMA);
 
-    object_initialize_child(OBJECT(s), "escc", &s->escc, TYPE_ESCC);
+    object_initialize_child(obj, "escc", &s->escc, TYPE_ESCC);
 }
 
 static const VMStateDescription vmstate_macio_oldworld = {
-- 
2.30.2


