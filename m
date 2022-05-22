Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4301153055D
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 21:09:51 +0200 (CEST)
Received: from localhost ([::1]:57746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqxa-00074I-Dm
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 15:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqC7-0008Im-7M; Sun, 22 May 2022 14:20:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBo-0003q6-S4; Sun, 22 May 2022 14:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3A7i0Kme/mlZT1wSvyyrCrdhe7oXf3JQeJDZbBncgTk=; b=huIMNZoD3IXENr1h6JNf52qac9
 5rUEtYH175DtqTJ1v+5/GxKCVu2SYY1GGwg5tFdU3j27gw6+nmoQp9Tm3pabUeU1MDNabWjzcCx06
 NimoytEV9hgAA+8vPwBTX+oDNbcUg9ailmYh2BonPMAuHEQLesvVl+OHV3MxsxoDY4CVaw+A9Oyit
 oGaRwK5zbS+gVMuMFn/4cjLTYeXf0UAwCLUJ23JhWPR3HY6RYIOUxDJDelKE8b64UDYIT0JKqXZLS
 CseYcjD/uTeEDdH1l/8AHO9MIDczsA+WI38AQMMiJUe+hzVD7W+W6GmsM83YmECwlhLI0eMrFn4I7
 pgBzZiOjhYhAghwoiMEFcNDFNfRvb9SK74AjoU7SpkY4a9jgTTVkiYfc4oGrXtezdu+6ItyY5bGeb
 uZ1KRvHGtIXpeH7Amu+e63wte6JMEIgfwTkISh/qbZMa2gKkgqgpAx/GUVMu6JFdUDIPBWCpIItwo
 83YngRIkJ8zvX17vP8EuPgnNS8aN/CX/5NqEcgw+2aYOlh2PmQAbxpdz+1+yN+scskfh+TMEIk+MS
 m5pt0NQziowWOsezJcReSU0WD+ktPAffEAH30QWCfwYXPie/ONR1rPnRwahmimD2WYKejfXnLqokH
 /OvidLtPNnYpAVj62WalhkCCUUlwqmnGlOrxEXbyA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAN-0007pH-Hm; Sun, 22 May 2022 19:18:59 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:18 +0100
Message-Id: <20220522181836.864-33-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 32/50] ps2: use ps2_raise_irq() instead of calling
 update_irq() directly
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

This consolidates the logic of raising the PS2 IRQ into one single function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 8b76ce1cdc..55a2ac08c2 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -557,7 +557,7 @@ uint32_t ps2_read_data(PS2State *s)
         s->update_irq(s->update_arg, 0);
         /* reassert IRQs if data left */
         if (q->count) {
-            s->update_irq(s->update_arg, 1);
+            ps2_raise_irq(s);
         }
     }
     return val;
-- 
2.20.1


