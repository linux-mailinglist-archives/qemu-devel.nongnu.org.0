Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433A7530521
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 20:23:54 +0200 (CEST)
Received: from localhost ([::1]:56004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqF7-0003oG-AP
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 14:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAq-0006u6-VZ; Sun, 22 May 2022 14:19:32 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAm-0003Z3-7O; Sun, 22 May 2022 14:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Fwx/I/vPtmESsSn7/kCagHh78QfUAB1qwIAGxuaxGA=; b=cTLE71MQdd7TKJagptoK6mdTih
 tT8WuDy1W1+P/jY/CfHN21kCDhCGgySuS1b1ZhQYL4KXsZhJmZ+pxJiV0LajQ3M49/3rLitmnxOg1
 zjc2vFwEsUqfo6CtrvCfgRe4ftafHzNKBKV9fUhlHwVeVPG4lLZ3lb8+oaGGqQ7ShERSQj3TxWMUN
 SCpaFTg29ppK9WW409e8lApx/4vD/D2v5NDyG47J2mzTLhnPB2JYMLZZjHzOcDdg20QDzDhOIk/ql
 h9bvc6zNqNpCw9wlCbH5LuqxDLKjzzCfV2+zMRtmre/o/+cNSCvFoCrZvcRw5fiHuC2CepEypSpV+
 4Ib9FdbiBM6QJFfmsmrYszBvlCAtoULfO+41m3dhqzYdpB6KGvvSBgcIy3QYaIMyZF/afzuyJYxen
 u4PMxzOacCP6DxPAWFVYylKRGFQ65LqTqnnOkvtZgy3t8s+VluzrB+/tZ8MaDeSz95CvDibtAfPrw
 /W2tOXfgpvLVmNWFicTrVMV/0ULNbrvNJUYkNA2bbbmGpgD6FMaAb00Wttw892yFh6jCx8FZia48X
 1+Zi8/N9FFTiFPYDhy6gugUdjjNbFI8Xvj5onMJEOYfSETI+996DLpLfRaA4mrwGitTsA73Pvlpfh
 j/i0t+YUrL7Kx1/KO6hSHMiCAy4LuoTiK+K//FQV0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9b-0007pH-R1; Sun, 22 May 2022 19:18:16 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:17:55 +0100
Message-Id: <20220522181836.864-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 09/50] ps2: remove duplicate setting of scancode_set in
 ps2_kbd_init()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The default value for scancode_set is already set in ps2_reset() so there is no
need to duplicate this in ps2_kbd_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 5990eb6f79..555abb5392 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1227,7 +1227,6 @@ void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
     trace_ps2_kbd_init(s);
     ps2->update_irq = update_irq;
     ps2->update_arg = update_arg;
-    s->scancode_set = 2;
     vmstate_register(NULL, 0, &vmstate_ps2_keyboard, s);
     qemu_input_handler_register((DeviceState *)s,
                                 &ps2_keyboard_handler);
-- 
2.20.1


