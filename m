Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524C735959D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 08:36:51 +0200 (CEST)
Received: from localhost ([::1]:53972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUkl8-0007NG-ET
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 02:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZM-0004ff-0c; Fri, 09 Apr 2021 02:24:40 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZJ-0001bZ-Rr; Fri, 09 Apr 2021 02:24:39 -0400
Received: by mail-ej1-x62b.google.com with SMTP id mh7so6822290ejb.12;
 Thu, 08 Apr 2021 23:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/OEqLEQHCmytseRt1FhXxp+Rob399wNsde0XeRnkGgQ=;
 b=ltZ+3820lLw6oC8xOjK05tEQA2ZV7Fjzd8OCarI9OfHsTY+NUKyaoYnOxRPhtsSRQm
 8uGBBx3oMvSTowr3SN33+jgx5Wp+bCKEKx4LqgyNCmlQISba3rl04LV+cot9vw8rNO92
 NobHeCeMMbo9VZFaZZl3Foopgh42a555jALD5/rqJ1fO7k8VwVdoQ3IRh/30Mcwor4l6
 sRCR2ONs8ovaSJGtwNawSnhFxVgd9K4ZdP3FI1t/ZDtpy9z4m8mhy5kkFLr5YpwoaJeF
 Cbd9OTiZCfRkCWBGki4i8JE31x093/IQUIwLmvu/PnzjT6F4BSZwXsK+8KVHL+wHyCBQ
 EHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/OEqLEQHCmytseRt1FhXxp+Rob399wNsde0XeRnkGgQ=;
 b=WMkVUPNypia5wYXssGgnQKJugGjE7XUurjxu74acreS70t9nTBrRLWZabwP4G7I0bm
 IoQCxpD8T3Y2V5vpnW/L4sYOUMETj0QZ4UGSEfvBQpLGEby9V5Jr6THlaXDloPk8Lvl7
 okLtYThEujMisblNYaWNo2lOsbQ2YWwVFzk11p1syXqd+rVeJOw+HKkgGOXXV0wJjHp7
 wzyafrXnrNN5SsCbXWtkqhWveOGv8gNwgwRdO7/7OzXklzv73L8NtYpS+m1v7yjfXBLN
 oSEiFB8jouCwhcVBL9xykSZZGnNzgvjVUl4eAZbvv2z5FGELkW5PiUHF5WtHOkQxuGtu
 F5ww==
X-Gm-Message-State: AOAM530dypJuvtEwn80wHsqMFxgTWCrkKXI/81k+hKpxC5vI0UoyhVhl
 9gy2h1rGrappENpXXE2MmuAF2cBlWey2EA==
X-Google-Smtp-Source: ABdhPJyXnHdzktWS6AwWRoja1N2Z48ZZJD7qGZxm922GmRaCtBWzMTSguBD/9KCt+SZT4bgDl6OVMg==
X-Received: by 2002:a17:906:170d:: with SMTP id
 c13mr14302431eje.491.1617949474885; 
 Thu, 08 Apr 2021 23:24:34 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id ay3sm845372edb.2.2021.04.08.23.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 23:24:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 6/9] hw/misc/bcm2835_cprman: Use
 qdev_ground_clock() helper
Date: Fri,  9 Apr 2021 08:23:58 +0200
Message-Id: <20210409062401.2350436-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210409062401.2350436-1-f4bug@amsat.org>
References: <20210409062401.2350436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ground clock isn't really an internal component of the CPRMAN
peripheral. Use the qdev_ground_clock() helper to access the board
ground plane.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/bcm2835_cprman.h | 1 -
 hw/misc/bcm2835_cprman.c         | 7 ++-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/hw/misc/bcm2835_cprman.h b/include/hw/misc/bcm2835_cprman.h
index 3df4ceedd2e..2996ccb4632 100644
--- a/include/hw/misc/bcm2835_cprman.h
+++ b/include/hw/misc/bcm2835_cprman.h
@@ -204,7 +204,6 @@ struct BCM2835CprmanState {
     uint32_t xosc_freq;
 
     Clock *xosc;
-    Clock *gnd;
 };
 
 #endif
diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
index 75e6c574d46..5039b7632b4 100644
--- a/hw/misc/bcm2835_cprman.c
+++ b/hw/misc/bcm2835_cprman.c
@@ -678,9 +678,6 @@ static void cprman_init(Object *obj)
     }
 
     s->xosc = clock_new(obj, "xosc");
-    s->gnd = clock_new(obj, "gnd");
-
-    clock_set(s->gnd, 0);
 
     memory_region_init_io(&s->iomem, obj, &cprman_ops,
                           s, "bcm2835-cprman", 0x2000);
@@ -697,7 +694,7 @@ static void connect_mux_sources(BCM2835CprmanState *s,
 
     /* For sources from 0 to 3. Source 4 to 9 are mux specific */
     Clock * const CLK_SRC_MAPPING[] = {
-        [CPRMAN_CLOCK_SRC_GND] = s->gnd,
+        [CPRMAN_CLOCK_SRC_GND] = qdev_ground_clock(),
         [CPRMAN_CLOCK_SRC_XOSC] = s->xosc,
         [CPRMAN_CLOCK_SRC_TD0] = td0,
         [CPRMAN_CLOCK_SRC_TD1] = td1,
@@ -708,7 +705,7 @@ static void connect_mux_sources(BCM2835CprmanState *s,
         Clock *src;
 
         if (mapping == CPRMAN_CLOCK_SRC_FORCE_GROUND) {
-            src = s->gnd;
+            src = qdev_ground_clock();
         } else if (mapping == CPRMAN_CLOCK_SRC_DSI0HSCK) {
             src = s->dsi0hsck_mux.out;
         } else if (i < CPRMAN_CLOCK_SRC_PLLA) {
-- 
2.26.3


