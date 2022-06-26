Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746EB55B365
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:12:25 +0200 (CEST)
Received: from localhost ([::1]:48294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WkB-0004cM-Hj
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMT-0003uF-Gq
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:47:54 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMS-0000AK-5G
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oSpM6Xi7UMvwmFWkzMU6tKEbxnTapoCEtahCdc3oDiI=; b=ptnqUNk8PmtBP4P1lDe+IgmmYr
 620Q8H4X5agP4hpwEYpyKuw3tD51eJf0+8vM8rI+X5TBLz3gMCZ4TLLWTpVk/MjvDzQb33mLOg8yU
 U1H/wv5AIfBBuMt4HGvnYtRYblml+zVWhkLBcYEKBtd56XK8T2RWGofYY8RGRHi0Gfvt3YGRphfmz
 M0iB6t6jhh1Rndvr6ve4bbeoiax63AGwLA/boabCPPprHPhEUj1z74KfBJaNOrymSni8TfccU7uU3
 xhpUbdg4BBgdruI+AEhIvWhD9r4bKgRHEJsxfrbC0I0xbK0ni4wvWU8Evwbyq39P3ygFPZlvHVgDC
 vTO/yY7sJ0UbKwS3/xZnLYtOIGf/VQCLxYIwrTnISvSj66yf/BNFXWyjN3HPc2HREXhCN8IvjmQ1S
 gCP+seGOwU+6KplcoClLPaBz5XPE9EoD23AOKj4WtmNoi0PvzhNmM9Z7/6btYtzyP+4UmLf2HrFGD
 1bTH1cmYBSaYR6uO1Hf2Lray4VAtgqaH/Zfcw4QlB5P7yoIOHTVF5l8SAyEx0wVsoeA7yOzbLJuyL
 M/s/nwbrcer6hlwjhsCIod7wAmKGKx5mwlQxzK150tXR4+xopfaEvGWN6S3gVH8sMOlNyQh9bRtAO
 zv3ppmPgcN+tPCNa1gFHSnGEFADfm36rt1DOzoLU0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WL4-0007KY-5J; Sun, 26 Jun 2022 18:46:30 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:08 +0100
Message-Id: <20220626174531.969187-33-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 32/55] ps2: use ps2_raise_irq() instead of calling update_irq()
 directly
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
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220624134109.881989-33-mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 24c9853d37..a14281bc54 100644
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
2.30.2


