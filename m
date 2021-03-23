Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F301A346610
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:14:13 +0100 (CET)
Received: from localhost ([::1]:43534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkbc-0007u4-UE
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjgP-0005U5-To; Tue, 23 Mar 2021 12:15:06 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjgM-0007jb-Hp; Tue, 23 Mar 2021 12:15:04 -0400
Received: by mail-wm1-x32c.google.com with SMTP id p19so11375800wmq.1;
 Tue, 23 Mar 2021 09:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HbrBNw1rZqrHPhviLRhW2PghpzAbcjm/RCgXT7DkNTE=;
 b=ksj7LqJzTbHlc44lYx65DgjFFrEo0PpNto6KWjJ8hJDLOo8wT6DD8kTDuJx6Sz7EDC
 kYHDZkngJ3w9e02yYndhWgb7dEf/UqoVGJyUz0rY3qthShyKukGfQHqTwl7u0LqSH2u5
 2JEObyuBt1hx1uB5+LcU94FCSs9Q8a88IeNGFW2aX4y9ZwIaGqmhZiukbSo3W+Avh0Hn
 JZt64uo1ZFLX8GLQIq6L7qNhHFGM77OQY8/iTdIl8ev6Q6tLVuEKhv+opHAZ3f2g32O2
 WsUc3pyqrCkwZNtwNl6A9IV5rVtp/FJntZdn7yXvME4rV1O5MvE3DbPWfAg8ntB6JXgz
 QGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HbrBNw1rZqrHPhviLRhW2PghpzAbcjm/RCgXT7DkNTE=;
 b=tcS0WwrI8QQlB7lF/SfFHXE7NzyFVsuYW1eZVclTq54FR4jN2NkBF9ucVnD1WI8ITH
 YsdHqEvZYieG0s5PqM+u1fyYb05rO5GEI8dKR1aESMwzWeigQ27xvrTGh4mWtLUPhPTN
 Vho2/cKiGobFopIEW+IawjGPlstpYEyB4JN6qzyCLoL+PiBoW/EcqIj5V8XhFvyCmsFr
 aL7g133qonTwqZEUbHm+wUVkQnWIq6W1wzghR9s2fmOus/1txztVSeJDlzporNTWkn9g
 T9VT/GQVbdQjJO6ajqW8N/oOSZnCLE1Rw246gjWKqucSqJih4gImLBFs/dIN1Ba1jQ+W
 bhrA==
X-Gm-Message-State: AOAM530OCh/oevVJ/F2354IfbuGxzr4nBWURarC4A8ERJRFbFl9iMjr+
 zJ3/UsTqNmDiR29S4nKv7nYaUoCf9m0pjQ==
X-Google-Smtp-Source: ABdhPJxVKarlOvu3yxDnHW4vSCHa6FUdZoTWoBwzQUDWZXZhjSO+yJ1zSjhevHlkhlOBCmJemhvX3g==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr4120750wmc.59.1616516100617; 
 Tue, 23 Mar 2021 09:15:00 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v18sm25364270wru.85.2021.03.23.09.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:15:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] hw/display/bcm2835_fb: Remove DeviceReset() call in
 DeviceRealize()
Date: Tue, 23 Mar 2021 17:14:43 +0100
Message-Id: <20210323161443.245636-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323161443.245636-1-f4bug@amsat.org>
References: <20210323161443.245636-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When QDev objects have their DeviceReset handler set, they
shouldn't worry about calling it at realization stage (it
is handled by hw/core/qdev.c::device_set_realized).

Remove the pointless/confusing bcm2835_fb_reset() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/bcm2835_fb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index a9c2e57d1c6..d7a44771c44 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -421,8 +421,6 @@ static void bcm2835_fb_realize(DeviceState *dev, Error **errp)
     s->dma_mr = MEMORY_REGION(obj);
     address_space_init(&s->dma_as, s->dma_mr, TYPE_BCM2835_FB "-memory");
 
-    bcm2835_fb_reset(dev);
-
     s->con = graphic_console_init(dev, 0, &vgafb_ops, s);
     qemu_console_resize(s->con, s->config.xres, s->config.yres);
 }
-- 
2.26.2


