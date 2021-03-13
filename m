Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8BF339F48
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 17:57:30 +0100 (CET)
Received: from localhost ([::1]:53258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7Zx-0006gt-WA
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 11:57:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7XU-0005Ir-Se
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:54:56 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL7XT-0000mt-Hl
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:54:56 -0500
Received: by mail-wr1-x436.google.com with SMTP id d15so6461568wrv.5
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X9eAy7tAwcBfGFsgC+ZegGvTgLMi6sa09ssqoGaE5UA=;
 b=Q9P0ItsBzRhlq9Xb/cGEC7rUwjvR0jvS8AbWbicoLDELRUAS63FHsj6My0R2bAYxVx
 T4nuopia1GqwcJRZvEYfiPEaC20a40sZ4mktWd3ItZp1DTyyOnjFX0nsxaCSWieiJmdG
 Lv6kc97efig7b7CErsZ4b08uxp9MXfZH5ck0FFPvw8GR6GAI8oBKDLkhWqZgfJnVNVFY
 DN+MqrZUDFp5JgTpmGy2VUwug6w9YFr/Y2q6U4fCza7G4T1Waz+52y+I8O3kCsw5p2Rj
 FeQfm5cpKWsvnIW6sRTh56scu2cHSewOvpcBR1pcS/CObGmtj4FZSFQeENgnWlGCo5Yz
 lTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X9eAy7tAwcBfGFsgC+ZegGvTgLMi6sa09ssqoGaE5UA=;
 b=DNEtcq8RLhmhoYZ/RA4b2gkptSLhCbJDiaAILwWxS077vSfC87Y94s6f453WBkVsSb
 EOzo2ukL7ul+wI7lxC1Ch0IvMMd/W98hpjR8XvphRca0TbIzL1YdGeBR2X3SDF1Nu7M7
 q1qa6O/Er/iyPTtSfY2BaLRYQ9T8KOauNIidR03ps5muXFgBxP8b7hPD8X2V457m3e2a
 8anFF9hakZgi8XCc7LX5YwPN2c5OgYotD7tNe3OjClOZ//1NxyU2SrJA6VYFJLe8PRU0
 O5w1gawG4QzS87o7yKnVksDn00uDUhXgKUk9upP/9f5MuE/K8EDjpmFF9X9moXhCI/cS
 H9eg==
X-Gm-Message-State: AOAM533BpPNzcj/USM5BwkpGKkmVG726NbAhM6bt4citP8EndAHXgYtU
 H6gC/NMc8i2rEluHeybYSJqSHy4qctdXag==
X-Google-Smtp-Source: ABdhPJzBeWFWAeTkc71qoHNDZIPuangswSvVKxPrTAUq2jvtN/jz412tPABf0IddKlhUl4ZwcmbuZw==
X-Received: by 2002:adf:c641:: with SMTP id u1mr19743170wrg.332.1615654494088; 
 Sat, 13 Mar 2021 08:54:54 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h22sm8193007wmb.36.2021.03.13.08.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:54:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] hw/misc/led: Add yellow LED
Date: Sat, 13 Mar 2021 17:54:35 +0100
Message-Id: <20210313165445.2113938-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313165445.2113938-1-f4bug@amsat.org>
References: <20210313165445.2113938-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the yellow "lime" LED.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/led.h | 1 +
 hw/misc/led.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/hw/misc/led.h b/include/hw/misc/led.h
index aa359b87c20..29c08795708 100644
--- a/include/hw/misc/led.h
+++ b/include/hw/misc/led.h
@@ -27,6 +27,7 @@ typedef enum {          /* Coarse wavelength range */
     LED_COLOR_BLUE,     /* 475 nm */
     LED_COLOR_CYAN,     /* 500 nm */
     LED_COLOR_GREEN,    /* 535 nm */
+    LED_COLOR_YELLOW,   /* 567 nm */
     LED_COLOR_AMBER,    /* 590 nm */
     LED_COLOR_ORANGE,   /* 615 nm */
     LED_COLOR_RED,      /* 630 nm */
diff --git a/hw/misc/led.c b/hw/misc/led.c
index 5266d026d0b..f552b8b6483 100644
--- a/hw/misc/led.c
+++ b/hw/misc/led.c
@@ -20,6 +20,7 @@ static const char * const led_color_name[] = {
     [LED_COLOR_BLUE]    = "blue",
     [LED_COLOR_CYAN]    = "cyan",
     [LED_COLOR_GREEN]   = "green",
+    [LED_COLOR_YELLOW]  = "yellow",
     [LED_COLOR_AMBER]   = "amber",
     [LED_COLOR_ORANGE]  = "orange",
     [LED_COLOR_RED]     = "red",
-- 
2.26.2


