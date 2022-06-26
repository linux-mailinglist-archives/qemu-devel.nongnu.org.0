Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C3E55B35B
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:06:43 +0200 (CEST)
Received: from localhost ([::1]:58188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5Weg-0000eJ-IU
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLC-0002TZ-9T
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:35 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLA-0008Pg-Ts
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cTTrpQLj1bbuK16iDEk6hUYWZTXUmrGhT9l4JDVXaxA=; b=UrcjsXRS2BTQrd9qhUiHrmjMC3
 b7CALBpCQwHPTEt21FSuyXh86tNY9IjZ2sg9mNPAotcDbUa6oY41yWFNMS9QVM7I5TKpvBG3/a7iv
 7k4gWR258azuZRr79/pfpnmz6VVXFlo0WeokR5MQTMjS1WaWmmEgGa4yYyP84zeJ92cbr0TuYjGaL
 Rs1gqLbJhbCN7+SiOcO4h1N4ecN63+042q9IEmZuSDFHYQXBAe2w7sNshWwHO64F3xPDPuWPZUcTu
 71J/1g+5iISO5YxanrcaYjws7jf72Co+jsQI5Bb/tOtUROaT1qZJeEe9qXSh7wI30jbE8+ZrFpDY3
 Q9gMS9TtfamCJ5J6ltltabaoZ3xVQ1T8B+2cPrSL5BQCo2/6AP/gbsEKxho98EPD92D/vXWPOlLtw
 s5RTQ2+7EBo6PzP5N2Nvgy4GVZIxKef1tycvMf4tY2qOXu2Dur3MkKrk9w/DH7ng+7IExWLtEiph8
 pyIs+SkJF+Fu3S56SrVrZ+kXBZ/uvQpERrAxC41eoyVZFskr9fjBCFne7uFMvNZlXwqG22+jeJ0bg
 F7lEPDEcnaJNFthFn7Rmrtvii6V3kwPJ7RR2NgK06XznHUYbY4c6KLYn90MxH1KQFIdzjDUsF+1nz
 Y7NHSpWF4nc9oP0W0aWLUrtHcP/MkJ3IFF20I1l7c=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WJx-0007KY-0j; Sun, 26 Jun 2022 18:45:20 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:44:49 +0100
Message-Id: <20220626174531.969187-14-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 13/55] ps2: don't use vmstate_register() in ps2_mouse_init()
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

Since PS2_MOUSE_DEVICE is a qdev device then vmstate_ps2_mouse can be registered
using the DeviceClass vmsd field instead. There is no need to use
qdev_set_legacy_instance_id() to ensure migration compatibility since the first 2
parameters to vmstate_register() are NULL and 0 respectively.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220624134109.881989-14-mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 97e9172ba5..9c046ac500 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1262,7 +1262,6 @@ void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
     trace_ps2_mouse_init(s);
     ps2->update_irq = update_irq;
     ps2->update_arg = update_arg;
-    vmstate_register(NULL, 0, &vmstate_ps2_mouse, s);
     return s;
 }
 
@@ -1291,6 +1290,7 @@ static void ps2_mouse_class_init(ObjectClass *klass, void *data)
     dc->realize = ps2_mouse_realize;
     device_class_set_parent_reset(dc, ps2_mouse_reset,
                                   &ps2dc->parent_reset);
+    dc->vmsd = &vmstate_ps2_mouse;
 }
 
 static const TypeInfo ps2_mouse_info = {
-- 
2.30.2


