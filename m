Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E972578AED
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:33:37 +0200 (CEST)
Received: from localhost ([::1]:52132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDWUp-00015q-Oj
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVbD-0001XE-9f
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:36:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVbB-0005yX-TN
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=grtuJwnLxJ+84zeCdJdWU0gax/R+q11RJLfjkVkXTgI=; b=F+HrOsmConosaq6qEGztGdwR9W
 c/cyohVMeNWdZ6aYE2Oh8WIARXueEbxzFyXG9CKzOprgrkGoPcus86Fqz5mX1YAee8ByNECvu7163
 P6yP27G/Q9KL9X8gjyBaIT2MO/EO71ZllM+yOVe8RqckBybWv3dhjoD0wtDmk7ViujnVm4WgXsLMR
 0lXAgwecZjyo5yc1/2vX8j68UBANWZvrwXIsSDvGtCipfdGgOJAeKMCl7sY4St+jYQV7MFlgqnq9p
 KHfh8AGuK+NgRlW3j3xx/S6/sDdg2eCy841Lmi6orfFu0sJL0R3NKXflhmGyGpHujYNiT83NqFH37
 2LmRVYZWwkTxEjiaBPYzIRfccO5OMOa2MATFNmyrOV5zkLZ0vNVqvi0welO7jLJ82UUiOLvoZBMk5
 iXIDGYD+LXlkPWl1twOjFyOgzX7nZBWZ/FLdSCwz3g+x7CPHlUdl2MQPIkSTaqfAtR3VhHp/HBRYm
 BK3Nwty71CsN/9v9R5ec3Q23xbGc99PL3m3UzniTKKR9erOizDdDjaOaOVGWMfTH+e3fEKrxIjAfc
 qm68UwSSYmg2sBTF9KFv4uFSzzkYk44vcLi7XBs9YwuitIBl9kPKFx+W0PTyj1V88Np26MMv/4wJr
 uW03VqOgLjYaPszzapX67rW65yFH45Q7GuSAEF/WQ=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZh-000B51-2q; Mon, 18 Jul 2022 19:34:36 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:30 +0100
Message-Id: <20220718183339.124253-32-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 31/40] lasips2: switch register memory region to
 DEVICE_BIG_ENDIAN
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

The LASI device (and so also the LASIPS2 device) are only used for the HPPA
B160L machine which is a big endian architecture.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-32-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/lasips2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 09d909c843..7bf6077b58 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -245,7 +245,7 @@ static const MemoryRegionOps lasips2_reg_ops = {
         .min_access_size = 1,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
 };
 
 static void lasips2_realize(DeviceState *dev, Error **errp)
-- 
2.30.2


