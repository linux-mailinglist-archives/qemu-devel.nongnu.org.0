Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243293274FB
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 23:50:02 +0100 (CET)
Received: from localhost ([::1]:36642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGUsz-0004zT-5b
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 17:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGUrM-0004XM-8f; Sun, 28 Feb 2021 17:48:20 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:34720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGUrK-0000LH-OF; Sun, 28 Feb 2021 17:48:19 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 o7-20020a05600c4fc7b029010a0247d5f0so2135426wmq.1; 
 Sun, 28 Feb 2021 14:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EZzTlh2Ky6xsQIDRJNUZ/Otb2YLvRbwpc+dpWwoy74k=;
 b=rFj3X0mIjHeAan0+axva0B/vlVnNUktwu9V1fV62KH+gw1FkQU5u1kDZo0sWUMi/sJ
 8dnGm2q+X/lpA3URpfk/iMjcYk2vF55s4uHMMBbxHmSHePUl+GcNx0Hfp9+HgIkmXGON
 NXmFr0UN9NRx2RDDgFZOIqosh/fSi3qNKtkwQe2j2pb5ljAglV4u9lSQF5JR/1P8E7FJ
 4rHToNyYp4JCOglR/hKQgy8XnDc55E7zcEFRLSFdSZVKHdBVH1tswDz4LKp/D6OIhrD9
 L/qyQ+Q2/DNrCyXtgTJVvaBcI2O/bH6+C1MMDQDwoGgS85DzAgXxxehDvxUQpo/uHBki
 vgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=EZzTlh2Ky6xsQIDRJNUZ/Otb2YLvRbwpc+dpWwoy74k=;
 b=LGC/3iBqStuUvMH5aY/0MjddH9G50ajjCNQ1CqSPW4cU22Yz5SWReQw7kTWKZoUg61
 ZlQDyt0eX3fknDL4NM3V1gk5I1kZpQltSbQraiavt5OaO8E5O15Io2fKup4KOM7ZAlFQ
 9i+5n8yUOj/PObElfoVUGivvQ1KjwCrz/rg2vTE7epCWJP/2WQS/6fvdTpzd8nLCU8py
 KrxkPyjJS3BKQvQjlMJML0eNIKq+DDS4nk4E7HVHBmPHDRPiQE5SSMX3PAslZGbTVvFx
 YS8JZ/V79lMCdtA9lN8Er0SNcUor7qgwnKydqjrGCBy0iKrrCKgJtZWt9Axa7dFV01OW
 XMoA==
X-Gm-Message-State: AOAM533RPH/+JoLKdU59O4/FrpEipS5tz4MvAcwGDrDlY4JwE+WYdmnK
 IAFXF3mfkaOusFlyZ6oorcQmzAdBHtc=
X-Google-Smtp-Source: ABdhPJwwtKq4cxEsC0jiaTikmJpzf1uGPTi6fs8DTPoUWnZ5K9CRLr9V/q1DKMkm6q5LK8JvnhubnA==
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr12775367wmk.101.1614552495695; 
 Sun, 28 Feb 2021 14:48:15 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x8sm1042826wru.46.2021.02.28.14.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 14:48:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/i2c/npcm7xx_smbus: Simplify npcm7xx_smbus_init()
Date: Sun, 28 Feb 2021 23:48:13 +0100
Message-Id: <20210228224813.312532-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 Havard Skinnemoen <hskinnemoen@google.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The STATUS register will be reset to IDLE in
cnpcm7xx_smbus_enter_reset(), no need to preset
it in instance_init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/npcm7xx_smbus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
index 6b2f9e1aaad..e7e0ba66fe7 100644
--- a/hw/i2c/npcm7xx_smbus.c
+++ b/hw/i2c/npcm7xx_smbus.c
@@ -1040,7 +1040,6 @@ static void npcm7xx_smbus_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
 
     s->bus = i2c_init_bus(DEVICE(s), "i2c-bus");
-    s->status = NPCM7XX_SMBUS_STATUS_IDLE;
 }
 
 static const VMStateDescription vmstate_npcm7xx_smbus = {
-- 
2.26.2


