Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AEE426A5F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 14:04:38 +0200 (CEST)
Received: from localhost ([::1]:55494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYoc8-0006QJ-Ua
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 08:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJo-0006Oy-L3
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:40 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:40743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJi-00072W-7O
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:40 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N5FtF-1mj9TL0qP7-011Eql; Fri, 08
 Oct 2021 13:45:22 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/13] macfb: use memory_region_init_ram() in
 macfb_common_realize() for the framebuffer
Date: Fri,  8 Oct 2021 13:45:10 +0200
Message-Id: <20211008114518.757615-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008114518.757615-1-laurent@vivier.eu>
References: <20211008114518.757615-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+YOIURghBOvBiZDnikeXkHAk2nh7Ga+lhIfGKTQ1jKRM9+tJycR
 2oqu8aFdxZDYJ+ORc8jG7prLB6K5IN8UplkQSRlft8NlQMwoqBFY1YeWmuWdXehzbQfONvj
 +jl5IVk4T0zZshi6qQyDQKmf8WwyW7vMTCgE7/jKptSRZaiAORz5lQFXJ/1rY6390ggEo5u
 NVyGFW9A+o6l/GpjkBGWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aDxXFUAJIzo=:EyUtUzsAGN2S3Z7jty80n3
 VG4jSDhLynyvQn5++ty/63mxa4U4wV41R1L1z1KtLlU/tCJgXu8GK9skhZHPYHzMN3FMVmRL6
 nmqKE5SSCm9kMevnvDo7NrGRzAqHAxRft8hHPPPbajMxYAGLkQucm12MSoUTItvAdnJ8hNeTs
 bzdLMo7PK7daeIMKL5hjpVoI0COX2SqQKEvHdV9iziqRPD2RCF++bAWNa/2h6BaDrAxnpBgsA
 /M9BGwM/A+5L7St5OKAu8sLsncW/K2xuCYk0Xk70zQJoSHBNk+By1rEBnpnoJe0C2iasBnmHa
 s6/tgB2mPtKguFxOLDGtnRnVIHdSDrmVYtKuB+whb8WGLwiI/xinTtpV6BNTmPEgleQlTRrn0
 u3zNQBd3oaYnJauajtx0/JX/d+30FQZz46iUCHBWaSgjKl9XjTGvxCqvzyN9e5M0MYRsam7KE
 b2VKOVhgnprqRievf1tyiG2rodI22oVi/jJ0MCq84rqxYzSR3C2aR/ieCzEYaMfCn/kkfabJz
 44TL4GF4fsan7kFgE4BZyGOh18nbBHUaoPt4VUllHJtvCxySk0JH8DACcPFQ8h89Su0LUfnvf
 FFbp5a+Ltg3rlh4vv43HceBsKEqHMTKeRKhSiGwzo0689v1pwEE9PKqyxmq10q3WpHf0V/ZUc
 E3q7f00Ym39zABAr4pMPG/HGIEBjyByPV0/EsZeLRTd0Y3EADcDTxFXlxd/wxjwwKA8LIVoBQ
 1NbcQpYq9ojtTj9rCDPqTKwra+pgCqp6ejlfvw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Currently macfb_common_realize() defines the framebuffer RAM memory region as
being non-migrateable but then immediately registers it for migration. Replace
memory_region_init_ram_nomigrate() with memory_region_init_ram() which is clearer
and does exactly the same thing.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211007221253.29024-6-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 39dab49026c3..f88f5a652394 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -367,11 +367,10 @@ static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
     memory_region_init_io(&s->mem_ctrl, OBJECT(dev), &macfb_ctrl_ops, s,
                           "macfb-ctrl", 0x1000);
 
-    memory_region_init_ram_nomigrate(&s->mem_vram, OBJECT(dev), "macfb-vram",
-                                     MACFB_VRAM_SIZE, &error_abort);
+    memory_region_init_ram(&s->mem_vram, OBJECT(dev), "macfb-vram",
+                           MACFB_VRAM_SIZE, &error_abort);
     s->vram = memory_region_get_ram_ptr(&s->mem_vram);
     s->vram_bit_mask = MACFB_VRAM_SIZE - 1;
-    vmstate_register_ram(&s->mem_vram, dev);
     memory_region_set_coalescing(&s->mem_vram);
 
     return true;
-- 
2.31.1


