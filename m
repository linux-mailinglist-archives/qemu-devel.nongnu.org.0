Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8894888F6
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 12:44:33 +0100 (CET)
Received: from localhost ([::1]:45356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Wci-0003f5-KZ
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 06:44:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6WaE-0001We-Qk
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 06:42:00 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:47025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6WaC-0008B1-TU
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 06:41:58 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M3UEW-1n5yLo00ri-000Z1i; Sun, 09
 Jan 2022 12:41:54 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] macfb: fix VRAM dirty memory region logging
Date: Sun,  9 Jan 2022 12:41:48 +0100
Message-Id: <20220109114149.1275322-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109114149.1275322-1-laurent@vivier.eu>
References: <20220109114149.1275322-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lWGqtRzm0AJy9m3SXAKm/Jm5Vtoba5S0ATlHELdWahtZRaiPNQ1
 xEO9HstrzpqdO7qUXHpnJH0UcuvIMAncCc4rFENw0yvhFABS0ac0bSt9heZIumWIUN1k8AT
 pQ0tWXBnN17yqCcJ/4UCu4bwk5cPV0aW7H5/JJHEyJkHZ+K78YZ/fIHi3IiSLPmUf/HumIi
 mrNIxOgjaLJK3/rSxP6GA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:an5SeAdvRo0=:EgAV60IX5/ktsnBCmdF5au
 z+BcIMokywC3PUaXcEkO9mxRs0WVMb/2GN5Cb0PGbXG3AIvA5crl3bZu41u6woyaY+qOyxEKE
 n8+F5lQxLtxNjf62vWOfSw6o9ywCRGisa1Baraw+yVeRsZ+VyYsFFStwSlg/3F7/7jz9D1gAP
 3eXBwXV27L8uaNCOcJESCvcyRewd0OZYzF4/H1BtlQUCGmxRENanFxK94BQxo+0MH7da3xUPz
 EDTFPeX4rTx/+5mgc2/bNf92QmbJL/VKoIm2Mvyos6cAU3pbtdSZTsuZf5989D4D8fYaKSQvx
 umsSbW/evTd4tNTsYa4JITE/UvbcDtwPOaom0iO9UNF/3w3ufVMUlGD1EH7o9G62bRX+dFWjj
 NDqDCNXv/42gnLX8roPU3VpYORIeF9/KSK5p7gZ8dfPT1cz98BB1GL3E6haAm+8vkPrIVnkjm
 Jt8qz1s6aGcUi78z6qKFUe9c3FOyDQgmVGs3pG1Y3atTacYPu1Zj/IWW22SRQ/4JeUJGFmFYN
 UbEHI5NUN2KrVMlKtm9qAN4nuEG4vGC7MVXjMfqJzHgM83ug1iC3b6zQxHF+ylbI6ifUL/fA+
 tHGESURvrH8Btgyjq79h+/7UeLueFiZxsuvfkQNhR8cmPJO+gomRn1/SdyWHFFJNJyZkgBvv+
 zFW+eGo4kxRNTB1Zfq14CSxf6r38nPbX15zD+ut7umqxLc6VevQrCfISBJ2OfNyZa9pg=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The macfb VRAM memory region was configured with coalescing rather than dirty
memory logging enabled, causing some areas of the screen not to redraw after
a full screen update.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 8ac919a065 ("hw/m68k: add Nubus macfb video card")
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220108164147.30813-1-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 277d3e663331..4bd7c3ad6a5a 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -661,9 +661,9 @@ static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
 
     memory_region_init_ram(&s->mem_vram, OBJECT(dev), "macfb-vram",
                            MACFB_VRAM_SIZE, &error_abort);
+    memory_region_set_log(&s->mem_vram, true, DIRTY_MEMORY_VGA);
     s->vram = memory_region_get_ram_ptr(&s->mem_vram);
     s->vram_bit_mask = MACFB_VRAM_SIZE - 1;
-    memory_region_set_coalescing(&s->mem_vram);
 
     s->vbl_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, macfb_vbl_timer, s);
     macfb_update_mode(s);
-- 
2.33.1


