Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B886560126
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:20:24 +0200 (CEST)
Received: from localhost ([::1]:35396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6XcE-0001oW-3i
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1D-0000YD-DX; Wed, 29 Jun 2022 08:42:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1A-0004km-SO; Wed, 29 Jun 2022 08:42:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zeUe91RzqCtnUmAJKwgek5Z3Zbp3wlvpdy0+5F4vtKI=; b=pxrK7wSePh3XKRChvKSTRhvZdM
 +AlzyE1MYAZwG13Uoe/Sm0GlUbggfgGPagZQBJl28cmEARxExswTm0Np7KndrgFN6+PcsO+egjK5K
 eXITSDIdmgUgNB1av1QwYu01fYPUeoxWe2LPqdvROIbBouv9zfMLEzcdaZgLam20OVQXIh4yl8pSr
 l6MI5YIRg+dDjqQ+8uFd+KbiLlCVoZevw14uew8UyX7H2HEfonZBIi6cNc1lZ9KdG6T4ZxhEtBUQA
 qDh9y0QfYn+0/f5lmt55+e2yLbcQe2S2dM8ZGmGrl2xqdkttQWMZcUIJ1GUnFAs28R8J8nPr8ex7W
 6iBxFYqnLUFjBUTNuVkY/VsjiSIR7eM6IVFDkwO0ou/q6oMlXBFQBB+LPiOcnq3wijX38tWEWLd7Q
 SGV0B2XJT8ir7T/frTwGuq4U+ZYwBGZDBxkndcWY6JqcoHQHz5GMuI5x8yWf1Lf55pL9f8QhdMFbm
 XS7R/58fpTnSo5Hp1YHWtnlQqcJMCY7sgKrbFZiAxA+mnnGXyGZRYSwTz+lF+XIzhoScjsNHgaAyY
 Tyb9VfZb5ZLilc/7X/HByCAi9SkpCdaJK0ZYWDAhweHMkwzWv3RHWF9PjmgUpMM1CKNjAvhmDOmHV
 RUZNw/4+E5hz4ecuy0+cHdB0fbaodVHOIvYQBVFmI=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6WzZ-0002tZ-RW; Wed, 29 Jun 2022 13:40:26 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:10 +0100
Message-Id: <20220629124026.1077021-25-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 24/40] lasips2: introduce port IRQ and new lasips2_port_init()
 function
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

Introduce a new lasips2_port_init() QOM init function for the LASIPS2_PORT type
and use it to initialise a new gpio for use as a port IRQ. Add a new qemu_irq
representing the gpio as a new irq field within LASIPS2Port.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c         | 8 ++++++++
 include/hw/input/lasips2.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 49e5c90b73..6b53153838 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -322,9 +322,17 @@ static const TypeInfo lasips2_info = {
     .class_init    = lasips2_class_init,
 };
 
+static void lasips2_port_init(Object *obj)
+{
+    LASIPS2Port *s = LASIPS2_PORT(obj);
+
+    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
+}
+
 static const TypeInfo lasips2_port_info = {
     .name          = TYPE_LASIPS2_PORT,
     .parent        = TYPE_DEVICE,
+    .instance_init = lasips2_port_init,
     .instance_size = sizeof(LASIPS2Port),
     .abstract      = true,
 };
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 4c4b471737..a05f26cbd9 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -41,6 +41,7 @@ struct LASIPS2Port {
     uint8_t buf;
     bool loopback_rbne;
     bool birq;
+    qemu_irq irq;
 };
 
 #define TYPE_LASIPS2_KBD_PORT "lasips2-kbd-port"
-- 
2.30.2


