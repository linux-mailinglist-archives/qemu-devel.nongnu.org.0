Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64FB559B6F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:23:30 +0200 (CEST)
Received: from localhost ([::1]:60782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kDW-0004JA-LQ
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jb3-0002sB-Qa; Fri, 24 Jun 2022 09:43:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jb2-0005JY-AC; Fri, 24 Jun 2022 09:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fX2YWydvz3qBtZHdqqwv5PDkps8PSQHCcwTqVmy00qM=; b=FxCDTA+zkfbLxkE6rKzlWQKOme
 U6P1KjzZwzhKQ0Rb+7no4uuXBufTpvhTii+zSgps6HUfOTXpJS6hh3ZmQxov+hvq/nYroGATWQ5iJ
 9jFL0XhVhTh+Mx+2jXh4sSK6M2Yb+ltpy4RzT60iki+TbjKlosA1GtdPeL70jetqWsvm++aTmuG5d
 PpYJRoocIkZcNycBltgHZUR2v3inWE6BUGKjTKlVoVEXhmT0hmESatimzkTD8tBwwsWBAlcWTkMe8
 kTrd87yXFGBPomDU7W+RsG+VoKBcIh6QXRuesHToCaDBzoW3O6AeiD+1WQ0HFw7GbZGXY3KvSW6mI
 nRvJqq95p3BJ/l68Gj1KmaQ2CoYfopnb9Dj5AhTTONC4e1WNRkjFE5LbCy3EUR9aavMOJQ5ap9WaD
 iAZ5YLCg1DDKl4MZpJyDirmY+LX5ujTO1mN3lPCC4ybBfBigysEiBFEHJO4o1aQp5dDDNspCZP0FF
 rJ8/el6zk32MQqsfU9hUwC8diwWa2fY/3zeFuV2dcuFaFKG6k1cso6CNRo7rsenvGQWoLuG68q7qU
 Wd77zL4X7gmYOTo1ihhZDiLnqQOMMh821sgDvKRN1C232tAmGT0dBEe/yvxUhzhtDn4leAJw7ziRi
 5h2luKwAjYp2P+tpvaC51ONnaHlszB5ByYvmAt4XU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZQ-00037t-Lk; Fri, 24 Jun 2022 14:42:04 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:47 +0100
Message-Id: <20220624134109.881989-33-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 32/54] ps2: use ps2_raise_irq() instead of calling
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
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


