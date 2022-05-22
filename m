Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EA053052E
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 20:33:13 +0200 (CEST)
Received: from localhost ([::1]:45568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqO8-0008LT-PX
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 14:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAv-0006uk-1U; Sun, 22 May 2022 14:19:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAq-0003ZY-IN; Sun, 22 May 2022 14:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Nru0O6d8b5ve64QWJ+ZnYfsswh9BbWWpItYe9mXnFA=; b=AgTEuPfyZvNyXoLwSu3iLby5YM
 bRMfuGiAJhBaQL+0e9/+EzIyZgdC/Mt2ktBO7V7l9V5nrR8Y5sQtKHeQDdyW6+fkwUci8aR/o5EBW
 e5OPJHfO0MiBEDEJBuSCBcFmnFzMB3bw/Z51ew2GeHXxiKEOcUZVFL9oGKepiRhIBHQ8T43iOGeW+
 t9zGR0C4AU5X0NS8hBsyqgL7s90hqK5PNpxn8EZjPkrO9GGr1VYujwtJRn8ONQ/qTsHQVoU7L52su
 KKqOlintxpROJ4+eNvEKjorQcYfJhhSn45uvCp0H/tQ4f8ryz+oqMHvWiMFcOOHJe1RnI5pGm4YyT
 n6158qSPqjDgOzU7Rv615uciZNKarefR0zT9zgmkJWdmHVAZl/6xXBpFGAh61yHyeOT8gES6QEMMc
 pGxOV9NRNc7cphXA8yqE9TFAUbCfjLCT3asazi5tEZulrSJm7C9sQNREwp+Z0U6X085q0CmwQe26H
 vCVZWfqDl0Rl6aBlIJKC+Kiy29knTg2xUcTxg63bGeA7bDz+na4owTf/+oTy5xpUj6yLtKQ/25/vY
 R5y72mcLhrRT+ZlODbI+0OuXDlHV+aDvGv4ZKlKCQzcIhzWYqZYMfWAr56/4Q1XeEPzem76anhB0b
 x9aZO3SkOCqfpK9l4/epAcKgMkmjI+rKmjj3JJFLY=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9k-0007pH-St; Sun, 22 May 2022 19:18:21 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:17:58 +0100
Message-Id: <20220522181836.864-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 12/50] ps2: don't use vmstate_register() in ps2_kbd_init()
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

Since PS2_KBD_DEVICE is a qdev device then vmstate_ps2_keyboard can be registered
using the DeviceClass vmsd field instead. There is no need to use
qdev_set_legacy_instance_id() to ensure migration compatibility since the first 2
parameters to vmstate_register() are NULL and 0 respectively.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 1d223de59f..04360c7f74 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1232,7 +1232,6 @@ void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
     trace_ps2_kbd_init(s);
     ps2->update_irq = update_irq;
     ps2->update_arg = update_arg;
-    vmstate_register(NULL, 0, &vmstate_ps2_keyboard, s);
 
     return s;
 }
@@ -1274,6 +1273,7 @@ static void ps2_kbd_class_init(ObjectClass *klass, void *data)
 
     dc->realize = ps2_kbd_realize;
     device_class_set_parent_reset(dc, ps2_kbd_reset, &ps2dc->parent_reset);
+    dc->vmsd = &vmstate_ps2_keyboard;
 }
 
 static const TypeInfo ps2_kbd_info = {
-- 
2.20.1


