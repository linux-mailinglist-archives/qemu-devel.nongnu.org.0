Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512D23BA8EA
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 16:25:40 +0200 (CEST)
Received: from localhost ([::1]:52794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzgaR-0000yk-Ds
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 10:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzgVM-0007kg-Fo
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:20:24 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzgVL-0000TD-2j
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:20:24 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso10918488wmh.4
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 07:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gGNpFpQ65DTmvgJho/8X8gH0JzWqfLCEmto+spU07GY=;
 b=fT7aQ1X2kIFi/OXIQ/P74DKNbB9xVXJtWKIFyIGkB2RSPWAOxEY99xJ1AUx6SDm1fa
 zt7RSr2IJ4yV29+el/4oqZmFWVmCEOzFuDvWUcf24VBbiFSBrXWLM/9CRwiEUgD2R5cy
 /2dx4RxCbFDawZTIh+grLaTsgr1T4OpfC9OXNBWpMYzsqNqH8gnzc71rdeq252zifhbM
 UriSSr/yIrIFeHU5cJv6T9wA78bxAcLQ/AwEQILcn0qzzikfPSVMC5G8Xxoo6I40Ka/h
 VeAIKFyk/hdJH+1mbRiIGrznTmc9EHoJ2AfCl1uGUGhT91fkzQ/37kqpLdepWMwnaYXu
 z0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gGNpFpQ65DTmvgJho/8X8gH0JzWqfLCEmto+spU07GY=;
 b=mlDSyMnPZxzQrnXkkvGLhA6K+OtiFh1GDUhfNwoS5HqrTbVCuwVL5Hi/imNkn3m96S
 SDQU7UiWwQWig+8UhukbCpxCC0fm50nEmJVhNNEROIMfB0w6lTjV5rjbDu+xj93eWoha
 SsmOsQqr7WoJaXQnZNxAib9AZ3yudlutHF1maN8e3I8sf7+GIJ+RnyEPT7vO871HR+1b
 kMIYYsQ7qjOZbNr6OGA00U7COK0ztHG/7sQ7kfQrsPxbPTUi0jhzyNVMabmGgWPw3hVA
 2AbdUH1C6lxQbWTOUGQsMNxrfZl0RpXZInZ4kNyFxNzZAtTBpTPnJ6t3vvsJ4hHiCX7d
 fD6Q==
X-Gm-Message-State: AOAM530Vh1jAS7ICTyk8n7h7QKHPBAK0b7xgwmMpBiaXwHADeZEJ1XZH
 /MIWOfwqh4ardbnBy+cAJqEBuR1NC/Wi2g==
X-Google-Smtp-Source: ABdhPJzEoIqFs2tcbEZQgbzyyt22QqHrY/fr3RZqKAOn3GtlgoAWJbELkWdTU8gZyt8QTTUQKVOJZA==
X-Received: by 2002:a1c:1d07:: with SMTP id d7mr5427366wmd.180.1625322021553; 
 Sat, 03 Jul 2021 07:20:21 -0700 (PDT)
Received: from x1w.. (184.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.184])
 by smtp.gmail.com with ESMTPSA id q6sm15930403wma.16.2021.07.03.07.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 07:20:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] dp8393x: Replace address_space_rw(is_write=1) by
 address_space_write()
Date: Sat,  3 Jul 2021 16:19:46 +0200
Message-Id: <20210703141947.352295-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210703141947.352295-1-f4bug@amsat.org>
References: <20210703141947.352295-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/dp8393x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index e0055b178b1..bbe241ef9db 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -814,8 +814,8 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         size = sizeof(uint16_t) * width;
         address = dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
         dp8393x_put(s, width, 0, 0);
-        address_space_rw(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-                         (uint8_t *)s->data, size, 1);
+        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
+                            (uint8_t *)s->data, size);
 
         /* Move to next descriptor */
         s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
@@ -844,8 +844,8 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     /* Pad short packets to keep pointers aligned */
     if (rx_len < padded_len) {
         size = padded_len - rx_len;
-        address_space_rw(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-            (uint8_t *)"\xFF\xFF\xFF", size, 1);
+        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
+                            (uint8_t *)"\xFF\xFF\xFF", size);
         address += size;
     }
 
-- 
2.31.1


