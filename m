Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609C3654812
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 22:57:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8TXx-00060b-Jc; Thu, 22 Dec 2022 16:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TXu-0005zv-VZ
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 16:56:10 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TXs-00079G-TW
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 16:56:10 -0500
Received: by mail-ej1-x62c.google.com with SMTP id qk9so7984918ejc.3
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 13:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WO7iVynT/sEzTHQRGzivhFt/eqGQoyfPA70WfNKwLOg=;
 b=r8aK67xYtN7byddt2ja6SDNAZSuUkzinXBmBfDN6EXe9Hi6j7BaDxLCL2/xXx3IanF
 08Wh+sUQVipBtmii0Pemt/DWy8qK11Lkzaasa8aeTXfU2eQcpsXnv13VS1SUt39VIY+A
 /WeQupkoRFe4NCBsKymdyayfdRYH4IkOZ1eLRIpHm0x3Xa0gvAVWaWGjxTkg5Nqc0YFI
 LmTBW0eW6heCKhoB5IlTY+gI66Wyy3wexGCSVgLzAhoCTj4T8b3W5QqYF+l8dzBmZ7lw
 3qrUDYvWa3iibIEeGLkOv0Rg1fEMkkRXd0ivrXte7ACWAx9K4FsFX5i/fNdDA8HlkcoL
 3KCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WO7iVynT/sEzTHQRGzivhFt/eqGQoyfPA70WfNKwLOg=;
 b=41m/xA1OB3A/NVD23L+fSbBFR6Y/+59DhzzyhhUNyTZ3NbTK6+Isimz/PBK++c8haZ
 hvKB/KlZYxy6JTi/ROaqq2TQn6/B0gU8HdS5BNCxEL6ulO/f4nNRjJ3oXBSNr8+0TyTV
 kryxi2ubndg4cYQ08cpTre058c6d3MlOusUTLhzVCv6tYsw+5H+qqD9yOt3Iyc6QMzTV
 Yu4szu4cbXppzHauGB1Dq1aSqNGp4FZr9ciRDht5NhnhzeDvIH7uZmqbteTSTe5ayoEq
 65lIucOh5IFvuPpAZxKh9RpH5GWq/iE1Pdhy25ckf9CsDzo6jaoOkWyFc9do/qOZmTHm
 0iOw==
X-Gm-Message-State: AFqh2kq027CYxRt4R+BNSW3U+PeyapyWQ4QJzt6qgMUVtTRDpfgKbClr
 BhcWMwgpZOdKVh3OmTBPIdOw1CThCzS2gvgAogg=
X-Google-Smtp-Source: AMrXdXv83/+HvK/EcdqE+SnXeiZihONsPv7C08cMlk8kYuYV61QSm+LEvwPqS0JzW7Ju1YoYH1aY1Q==
X-Received: by 2002:a17:906:d044:b0:7c0:e7a7:50b with SMTP id
 bo4-20020a170906d04400b007c0e7a7050bmr4888865ejb.48.1671746167393; 
 Thu, 22 Dec 2022 13:56:07 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a170906168200b00808c5e283e8sm664876ejd.178.2022.12.22.13.56.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Dec 2022 13:56:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 1/6] hw/arm/aspeed: Fix smpboot[] on big-endian hosts
Date: Thu, 22 Dec 2022 22:55:44 +0100
Message-Id: <20221222215549.86872-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221222215549.86872-1-philmd@linaro.org>
References: <20221222215549.86872-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

ARM CPUs fetch instructions in little-endian.

smpboot[] encoded instructions are written in little-endian.
This is fine on little-endian host, but on big-endian ones
the smpboot[] array ends swapped. Use the const_le32()
macro so the instructions are always in little-endian in the
smpboot[] array.

Fixes: 9bb6d14081 ("aspeed: Add boot stub for smp booting")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 55f114ef72..adff9a0d73 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -194,22 +194,22 @@ static void aspeed_write_smpboot(ARMCPU *cpu,
          * r1 = AST_SMP_MBOX_FIELD_ENTRY
          * r0 = AST_SMP_MBOX_FIELD_GOSIGN
          */
-        0xee100fb0,  /* mrc     p15, 0, r0, c0, c0, 5 */
-        0xe21000ff,  /* ands    r0, r0, #255          */
-        0xe59f201c,  /* ldr     r2, [pc, #28]         */
-        0xe1822000,  /* orr     r2, r2, r0            */
+        const_le32(0xee100fb0),     /* mrc     p15, 0, r0, c0, c0, 5 */
+        const_le32(0xe21000ff),     /* ands    r0, r0, #255          */
+        const_le32(0xe59f201c),     /* ldr     r2, [pc, #28]         */
+        const_le32(0xe1822000),     /* orr     r2, r2, r0            */
 
-        0xe59f1018,  /* ldr     r1, [pc, #24]         */
-        0xe59f0018,  /* ldr     r0, [pc, #24]         */
+        const_le32(0xe59f1018),     /* ldr     r1, [pc, #24]         */
+        const_le32(0xe59f0018),     /* ldr     r0, [pc, #24]         */
 
-        0xe320f002,  /* wfe                           */
-        0xe5904000,  /* ldr     r4, [r0]              */
-        0xe1520004,  /* cmp     r2, r4                */
-        0x1afffffb,  /* bne     <wfe>                 */
-        0xe591f000,  /* ldr     pc, [r1]              */
-        AST_SMP_MBOX_GOSIGN,
-        AST_SMP_MBOX_FIELD_ENTRY,
-        AST_SMP_MBOX_FIELD_GOSIGN,
+        const_le32(0xe320f002),     /* wfe                           */
+        const_le32(0xe5904000),     /* ldr     r4, [r0]              */
+        const_le32(0xe1520004),     /* cmp     r2, r4                */
+        const_le32(0x1afffffb),     /* bne     <wfe>                 */
+        const_le32(0xe591f000),     /* ldr     pc, [r1]              */
+        const_le32(AST_SMP_MBOX_GOSIGN),
+        const_le32(AST_SMP_MBOX_FIELD_ENTRY),
+        const_le32(AST_SMP_MBOX_FIELD_GOSIGN)
     };
 
     rom_add_blob_fixed("aspeed.smpboot", poll_mailbox_ready,
-- 
2.38.1


