Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E590426A29
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 13:52:38 +0200 (CEST)
Received: from localhost ([::1]:58240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYoQX-0005gl-A8
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 07:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJn-0006Lu-N3
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:39 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:41009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJb-0006zB-Vi
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:37 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M5fdC-1mfxz43XRa-0079fU; Fri, 08
 Oct 2021 13:45:25 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/13] macfb: fix up 1-bit pixel encoding
Date: Fri,  8 Oct 2021 13:45:15 +0200
Message-Id: <20211008114518.757615-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008114518.757615-1-laurent@vivier.eu>
References: <20211008114518.757615-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NYhvQT87mPicdZtbQdoA4RbkTTDMXxrw3ilKComPyspDR7+INo4
 hAe8bx13olRboGH41jGpr8aWEKeAPmxsfwJh+RdJsAxaDP7fV7OOr84dSJHVw+HgdDonmC1
 eYWgVGZsUHQ0YSpoQCNNkoRCZsUheyrN7PXsvunyGOPy+0wb0AFdarAwGxTSDPQVRLI/sSv
 UbYUEgJuRk/1oeT8bTuBQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OIkROugdI1Q=:J6+RR8OJ831ca3DKOoI0j+
 1AvmDfaTL5XJ+oPdPMsVP3mi1ieCS+ABGfaeg9rSUYo/nROq8M7XTYFlHQMGgmqrCjadiKws5
 Esto5PhCZpdvq9k/KZ7Q3sY/gA+z7nYx44VHgPwaa0lNobkmh5o6R3rUVaIRDu43FeHprcpmS
 DxL0qVsUKfNu/GjOoGsYoSVPS5arBFjJBm0msKPrHIG46dzfbGcimDZF0rKN9cGWYm2IFa3ji
 xptUyhhC7m8FnQpGBDEvaE4/Czi0O2us1fRGfR9wvkBAGMi9PKjgfumK2cgKf91XMvr6KolyS
 UxlpIJV9engmGmsxRSDAnrqkcTH7DKR8gul+PXz0QcMt+1KNcsgD4bC8UgfBchMXoYDfq6zWb
 uc3ix0AP6AHe8L6XEg3n39fAtNIh5+x8obhwR4ky9H2YCneRQYGrVhIVyqAE5WcCBtnIE0wBa
 yRKignMj9ytKJwA8ZDWSUIPEzGYmJrfOAxavfO+62s2/on7NqZJwqR6yV3hDfiKkSHkpzPdP1
 3BSFCxfdcyyHEk9+xEK9dP3DRiDCeoooy2+AqZeiPmx2FXoN5NJc9tBRwsF0AJVyMUhOAosH5
 yMx/sW+ARZUik4BhYHnxiKHX2Xqcj59HxzUKnECZvFP/iO4RQ+d+PMlJY97dlyat8M/74mjO1
 rSn6byEB6awDFXB79ZoANbD7OI+lnWZm2MtFQ28+O09gT7j6nOLZV5qXhC0R8jD8fgte4/+FR
 K8GTJQdV4gN0kginnNuPoQAT8mttdTfZeXq0BQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The MacOS driver expects the RGB values for the pixel to be in entries 0 and 1
of the colour palette.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211007221253.29024-11-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 2759fb5e34d1..e49c8b6f4b52 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -128,7 +128,9 @@ static void macfb_draw_line1(MacfbState *s, uint8_t *d, uint32_t addr,
     for (x = 0; x < width; x++) {
         int bit = x & 7;
         int idx = (macfb_read_byte(s, addr) >> (7 - bit)) & 1;
-        r = g = b  = ((1 - idx) << 7);
+        r = s->color_palette[idx * 3];
+        g = s->color_palette[idx * 3 + 1];
+        b = s->color_palette[idx * 3 + 2];
         addr += (bit == 7);
 
         *(uint32_t *)d = rgb_to_pixel32(r, g, b);
-- 
2.31.1


