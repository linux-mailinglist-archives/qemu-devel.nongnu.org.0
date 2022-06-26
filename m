Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0111455B35A
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:06:40 +0200 (CEST)
Received: from localhost ([::1]:58072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5Wed-0000aP-Qz
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMN-0003bY-9E
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:47:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMK-00009a-8D
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:47:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SX5sGDsYhnrMkHelRj4QfC540JSg6IFOdLXbq5ato8M=; b=HVO2Mvx90L459+EEZKAqKA4gIX
 MMz+ahG6zRtZszxcenn6/nSdENt8+/SYmlcDHrwUyXREkOCu/SjG019tljS8ZaoFKQ8PoM5D06GQ4
 4u6BwQKvDEMzqNXB9tWtA+SVwlDI0q3VetAA4tRXGQlCtkv8BLkS66dCeEqZmYbJadMWAVVO2xoMr
 0hCnv2oee4QtCT8di2LgfaaFmruF0jgKaeQADTt1x39MSHrNE08ZFG/t+cYee2pAJFVC4rni2zIAr
 zkXa2H3TA9c9SjRYAeFfQAZ0JNDSI1vetDmFsPUIHUytsKdGHtxAj7q8Ihe3za7As//Kz4OFVBshl
 NlOih8HH3vSmS9thgR/k3bpsMFw3TwVwNSuYe2vrSCGOL/MXaVtpwM2TD5vAERVkqrlePGV2gtIWO
 16VAHbBQgGc2coVHCxbUgm4r2g4s3xnzygI1ydvmR4/Fg+2juCpL6gI5fzxT6PA5Dv+GWTTqFi6jJ
 XYZkik0gxCl0I4Bcddajl+ZJch2A50eRsF3m84+DkJrgjLYbD3pRNfaca5QbbbAjYIGteGfCYKEGj
 2Fl9/F0fvmkRBmvyR32taQdCTcljJMqCtqq79utKMoFRZJ8Pw0hR5+tXhJjIkr+vjx5ngdzb7+Ddb
 +vy3Qdj0Fq1gwTffK2LaMIaKmB8FCBrm+NqB/PpDs=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WKw-0007KY-OQ; Sun, 26 Jun 2022 18:46:22 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:06 +0100
Message-Id: <20220626174531.969187-31-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 30/55] pckbd: move ps2_kbd_init() and ps2_mouse_init() to
 i8042_mmio_realize()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move ps2_kbd_init() and ps2_mouse_init() from i8042_mm_init() to
i8042_mmio_realize() to further reduce the initialisation logic done in
i8042_mm_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220624134109.881989-31-mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 1ab76793ea..72843f770e 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -685,6 +685,9 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
 
     /* Note we can't use dc->vmsd without breaking migration compatibility */
     vmstate_register(NULL, 0, &vmstate_kbd, ks);
+
+    ks->kbd = ps2_kbd_init(kbd_update_kbd_irq, ks);
+    ks->mouse = ps2_mouse_init(kbd_update_aux_irq, ks);
 }
 
 static void i8042_mmio_init(Object *obj)
@@ -726,9 +729,6 @@ MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     s->irq_kbd = kbd_irq;
     s->irq_mouse = mouse_irq;
 
-    s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
-    s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
-
     return I8042_MMIO(dev);
 }
 
-- 
2.30.2


