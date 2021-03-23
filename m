Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E423465F4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:07:47 +0100 (CET)
Received: from localhost ([::1]:55618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkVO-0007L9-5h
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjgF-0005DY-Df; Tue, 23 Mar 2021 12:14:55 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjgD-0007eG-Nd; Tue, 23 Mar 2021 12:14:55 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so1407772wma.0; 
 Tue, 23 Mar 2021 09:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EYb7MCD9rAm74EVNp0mTMTFqaEPr7f8+yagDdP+XAac=;
 b=ovVZUhAKnS78InoOcEsbdnP1XHBrT8vxa9YB+OEakLJ+nRRw0lHq/B2TGLCrswQKKI
 14PzG66USogxaznvETy1GbVvOSCIxyNzzlycKBC3b3B+5shj+ufUX4+/Y1Bj93dDdgLt
 6/x6tB/3R/GbvYltWkMS+vd4TRJAeaRvbqBokVrNnq5Yqx3nbHwkS6qadqXGe3/WHQrs
 UEMjr/1kUFP68MgT1co/uD54WFCi3naT+VJ/aFm3KVu63WASdQ7BCHmP3K5OsM3eI7Go
 jLa9912F94YT+rYwWq2OG8IY1CoDoagTxCpGZgu54L4NToNmNOo/3v4lX1J65BwQeOQn
 VvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EYb7MCD9rAm74EVNp0mTMTFqaEPr7f8+yagDdP+XAac=;
 b=XpIOwggwfmKuXSPImw1/U5b6G40kslPQm1Lffno/b+Kd8kg3T+/v63/WcYpVY68QB5
 wE754UEVXFFfto6t/SlIQsI+0KRlXl8V7zr0uyPWOamGGi3OXXm9l98BKJnH+uPyIkiP
 ToiwZZNTAyW9tnTxoI29dlzbnP9oKoROusrPsdTIuxRMbFQlsxE5Lx5lDrQrLVwZHUDt
 EVV8PZU5tMsym3vhOw9EFw9HO+ovniRS6t+zaTdWR8pSze43SXG0W8usBG54hXtTMNSm
 Io8cK+s4wIHXhLB57KSqVRbzZu8VltKB6GD3gjplY43TEUPgOHWqs28nizYcSe+aW61E
 xFpA==
X-Gm-Message-State: AOAM533vG+FEaIGltMyBEAdy4TAY02UDYAgwqGdcOATG/2YLOWV/WAtD
 uDSwT7+sQ4+EQ+5J0Um+QhCNcT8Nr3rAAA==
X-Google-Smtp-Source: ABdhPJyurHrGugczQbHJUAUFmJxVug13ywT9+2OpwDPfF4rdak5ODxZBLNDEX5W1hvTxBBBiLgdxIA==
X-Received: by 2002:a1c:3954:: with SMTP id g81mr4100415wma.170.1616516091209; 
 Tue, 23 Mar 2021 09:14:51 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c9sm3192765wml.42.2021.03.23.09.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:14:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] hw/display/bcm2835_fb: Resize console on reset
Date: Tue, 23 Mar 2021 17:14:41 +0100
Message-Id: <20210323161443.245636-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323161443.245636-1-f4bug@amsat.org>
References: <20210323161443.245636-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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

We want to remove the bcm2835_fb_reset() call in bcm2835_fb_realize()
but doing triggers:

  hw/display/bcm2835_fb.c:131:13: runtime error: store to null pointer of type 'uint32_t' (aka 'unsigned int')
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/display/bcm2835_fb.c:131:13 in
  AddressSanitizer:DEADLYSIGNAL
  =================================================================
  ==195864==ERROR: AddressSanitizer: SEGV on unknown address 0x000000000000 (pc 0x555d1d51e6d6 bp 0x7ffd25a31160 sp 0x7ffd25a30fb0 T0)
  ==195864==The signal is caused by a WRITE memory access.
  ==195864==Hint: address points to the zero page.
     #0 0x555d1d51e6d6 in draw_line_src16 hw/display/bcm2835_fb.c:131:30
     #1 0x555d1dd88d5f in framebuffer_update_display hw/display/framebuffer.c:107:13
     #2 0x555d1d51d081 in fb_update_display hw/display/bcm2835_fb.c:203:5
     #3 0x555d1ccb93d6 in graphic_hw_update ui/console.c:279:9
     #4 0x555d1dbc92cb in gd_refresh ui/gtk.c:492:5
     #5 0x555d1ccef1fc in dpy_refresh ui/console.c:1734:13
     #6 0x555d1ccee09c in gui_update ui/console.c:209:5
     #7 0x555d201f3cf2 in timerlist_run_timers util/qemu-timer.c:586:9
     #8 0x555d201f4061 in qemu_clock_run_timers util/qemu-timer.c:600:12
     #9 0x555d201f5029 in qemu_clock_run_all_timers util/qemu-timer.c:682:25
    #10 0x555d200c6f6c in main_loop_wait util/main-loop.c:541:5
    #11 0x555d1f06ba93 in qemu_main_loop softmmu/runstate.c:725:9
    #12 0x555d1cafe6ae in main softmmu/main.c:50:5
    #13 0x7f6e6991b081 in __libc_start_main (/lib64/libc.so.6+0x27081)
    #14 0x555d1ca249ed in _start (/mnt/scratch/qemu/sanitizer_aa64/qemu-system-aarch64+0x22999ed)

  AddressSanitizer can not provide additional info.
  SUMMARY: AddressSanitizer: SEGV hw/display/bcm2835_fb.c:131:30 in draw_line_src16
  ==195864==ABORTING

The graphic console timer kicks before the display device is realized.
By calling qemu_console_resize() in bcm2835_fb_reset() we force the
creation of the graphic console surface early enough.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/bcm2835_fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 2be77bdd3a0..3e63d58e0b2 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -399,6 +399,7 @@ static void bcm2835_fb_reset(DeviceState *dev)
     s->config = s->initial_config;
 
     s->invalidate = true;
+    qemu_console_resize(s->con, s->initial_config.xres, s->initial_config.yres);
     s->lock = false;
 }
 
-- 
2.26.2


