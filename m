Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06FD440A99
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:29:01 +0200 (CEST)
Received: from localhost ([::1]:59422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsA8-0007mR-Qe
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrp4-0002iL-Nc
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:16 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrp2-0004ne-Bk
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:13 -0400
Received: by mail-wm1-x333.google.com with SMTP id y196so1227345wmc.3
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j9xcks9AuFxtWccNiBLQ8pMzUdOOv2w4rS19XW4UDNA=;
 b=Za8wkemoWyw9mrjg5H7ovyLSZwFyc3ewEWickrXG3r186Hw36HOGV2lF+PJBYW1KV/
 dp2VXl9OwqzpH7mZ1VvBPbVL1e3uKVsD0pIGMp7KcuHwJHiGtxOBxF2BFs3SIJJ+BB8U
 XkoveUMvgKpx3+36UH8m4iLTf1QGxYcnwcFtrFmvA/slcUyn0S6aysH9fLyElt6D+Kvh
 Q9/dIJtIZIAtvnIFPKK9a4C0vUa5YbfSnT6Gn4qYF1xYILN4IknmgI5fdPitTszfL2/a
 d7reiYtP7NHIFLgQG02FBIq52f0C1mozGMyf6z3PpGR7huxYW+yBD8YkNi9wQJYkS/p0
 PyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=j9xcks9AuFxtWccNiBLQ8pMzUdOOv2w4rS19XW4UDNA=;
 b=T580vXtXHjkNMlo4Y9KQae4jEZbWAmskPsva77yoDISB2ImTIlQGbXaVhJ620OeKR/
 bZAgHKZKi51ns45bYAqxA703p6sTfI6UQ+l9tVu7JNctlta3euqRtYVLxqd9Hj799jKg
 ZF0Gk5UY1WMGsgv6fqEjraEC9h3RfZok82u9Pwx8Rdqjpoie7k3H7tX01y/NHhiUt14O
 QllOOgGBQa00sL3Aa4iwG34E8prBX8qaNS20YLTLgx9YKENalEoHIkWaUbLRSnXtHaZJ
 60VV4asFWlGUcV/BXlcX6P9N7zt9KMNaJv77SaJ2FobsW3fcZXAVegEbSJi0gn8m6hpL
 W6Hg==
X-Gm-Message-State: AOAM531c5uq8iF7OM++u9/V5o82YtTwWW1rzPRJBwIzSQuYnhOnw0O4q
 p6FLzgAwU92SsQ7nkzfDmwk9tOrqFj0=
X-Google-Smtp-Source: ABdhPJxoP2ntFysRdKiNe9NKqU05Inev/CM+69EEzKAgo+O9Z0tLNznsy++wT/n6GU55U6+TWrpyyA==
X-Received: by 2002:a05:600c:2156:: with SMTP id
 v22mr5744393wml.159.1635613630741; 
 Sat, 30 Oct 2021 10:07:10 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 h7sm4303056wrt.64.2021.10.30.10.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:07:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/30] hw/char/sh_serial: Embed QEMUTimer in state struct
Date: Sat, 30 Oct 2021 19:05:56 +0200
Message-Id: <20211030170615.2636436-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Instead of allocating timer with timer_new store it directly in the
state struct. This makes it simpler to free it together with the device.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <fd01eb3720ec32dab06e03019f72f3e177033679.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/sh_serial.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index bc5e0c44048..5ee93dc732a 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -65,7 +65,7 @@ typedef struct {
     int rtrg;
 
     CharBackend chr;
-    QEMUTimer *fifo_timeout_timer;
+    QEMUTimer fifo_timeout_timer;
     uint64_t etu; /* Elementary Time Unit (ns) */
 
     qemu_irq eri;
@@ -353,11 +353,11 @@ static void sh_serial_receive1(void *opaque, const uint8_t *buf, int size)
                 if (s->rx_cnt >= s->rtrg) {
                     s->flags |= SH_SERIAL_FLAG_RDF;
                     if (s->scr & (1 << 6) && s->rxi) {
-                        timer_del(s->fifo_timeout_timer);
+                        timer_del(&s->fifo_timeout_timer);
                         qemu_set_irq(s->rxi, 1);
                     }
                 } else {
-                    timer_mod(s->fifo_timeout_timer,
+                    timer_mod(&s->fifo_timeout_timer,
                         qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 15 * s->etu);
                 }
             }
@@ -427,8 +427,8 @@ void sh_serial_init(MemoryRegion *sysmem,
                                  sh_serial_event, NULL, s, NULL, true);
     }
 
-    s->fifo_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                         sh_serial_timeout_int, s);
+    timer_init_ns(&s->fifo_timeout_timer, QEMU_CLOCK_VIRTUAL,
+                  sh_serial_timeout_int, s);
     s->etu = NANOSECONDS_PER_SECOND / 9600;
     s->eri = eri_source;
     s->rxi = rxi_source;
-- 
2.31.1


