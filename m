Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28B656514A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:49:53 +0200 (CEST)
Received: from localhost ([::1]:37148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IiG-0000dy-Q9
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITu-0001dK-7E
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:35:02 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:35540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITs-000521-HB
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:35:01 -0400
Received: by mail-pf1-x42c.google.com with SMTP id x4so8470729pfq.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KLxJ4chZNuNpDDQM5NlCpPKbylj0kM6OFqhANtAh+c4=;
 b=tfJnwHHOcW4hxiHZB+asP7qW8X2X0KhPR9yVoKGchdafW57f8TfNhqGo/hgB/Qft1I
 oVJpspguugYx6VGOqXre48GcIVnpI5p/LJRE4ZRd4g2CChp2luMsLiL2IjbBg7Wv2c4D
 qtjp5U4nHxBy33EJBQMxkRWammOVTKqrKeMiAtIT0fnlnUqUSl21KbXpp0RVEqRftUYj
 GRQh9Cpfi4JjDhDrsyNIZDM9pxlaXkvbfm3b1EDeuUgp82jaOXPl6NgpfKiaZi9YGYAA
 K1FR1AHyN1i5PKFKv8314AErGV8zneTaIjs1m0R5JZKIBisuZo0lCljCIofNFvhrSSg7
 ZUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KLxJ4chZNuNpDDQM5NlCpPKbylj0kM6OFqhANtAh+c4=;
 b=NoyA3xTQcuPCFTwUWPnRLCbkqAKna7rf/yyqZxC0bNrLwYZkYQoDl4QqvbK3nfJ+Is
 iM3/HPgNu9nbWNXL2oY8gP1yX6kKH3C8PzdaBvqvfikCDjdVrQiv5T5fOZYCiOX3o8Ll
 5e2+S2sP3sHgb4XJ3+AKlzAV7hljHEaly4KRUWPYV1MvTDCXlf+T3dp5+JOCyhIt5wUB
 5S7sH30xxYlSnOS7PcKcRlLpOCjMh1GJfL3puWCY+9xftISMkVLMdUjUQxzlBuMdEnGx
 3guFvO+EkW2kfi379kw4ygRK9AKU3RCEwanUJDnzIJz++DdiDpJ4tLIEex7mvH2mExNl
 9MuQ==
X-Gm-Message-State: AJIora8aXXdvP9oQJS6mvhC78R5AV7b5ghp6paSS2ugrD68ZeDfnGl4o
 oiqMjyIAoiNZfvScT6AUh4pEA/uZ47bpkRiE
X-Google-Smtp-Source: AGRyM1tfSdhDXWPQ36Xrirp3gS3aevqL21/3ht76RLbqn389jRMKau1qxLhRkaVntKwyBGFFCNzw+g==
X-Received: by 2002:a63:106:0:b0:40d:2db:1c92 with SMTP id
 6-20020a630106000000b0040d02db1c92mr24748337pgb.571.1656927299234; 
 Mon, 04 Jul 2022 02:34:59 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 21/23] hw/rtc/ls7a_rtc: Fix 'calculate' spelling errors
Date: Mon,  4 Jul 2022 15:03:55 +0530
Message-Id: <20220704093357.983255-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Fix 'calculate' spelling errors.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220701093407.2150607-8-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/rtc/ls7a_rtc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
index 85cd2d22a5..e8b75701e4 100644
--- a/hw/rtc/ls7a_rtc.c
+++ b/hw/rtc/ls7a_rtc.c
@@ -156,7 +156,7 @@ static void toymatch_write(LS7ARtcState *s, uint64_t val, int num)
     /* it do not support write when toy disabled */
     if (toy_enabled(s)) {
         s->toymatch[num] = val;
-        /* caculate expire time */
+        /* calculate expire time */
         now = qemu_clock_get_ms(rtc_clock);
         toymatch_val_to_time(s, val, &tm);
         expire_time = now + (qemu_timedate_diff(&tm) - s->offset_toy) * 1000;
@@ -171,7 +171,7 @@ static void rtcmatch_write(LS7ARtcState *s, uint64_t val, int num)
     /* it do not support write when toy disabled */
     if (rtc_enabled(s)) {
         s->rtcmatch[num] = val;
-        /* caculate expire time */
+        /* calculate expire time */
         expire_ns = ticks_to_ns(val) - ticks_to_ns(s->offset_rtc);
         timer_mod_ns(s->rtc_timer[num], expire_ns);
     }
@@ -181,7 +181,7 @@ static void ls7a_toy_stop(LS7ARtcState *s)
 {
     int i;
 
-    /* delete timers, and when re-enabled, recaculate expire time */
+    /* delete timers, and when re-enabled, recalculate expire time */
     for (i = 0; i < TIMER_NUMS; i++) {
         timer_del(s->toy_timer[i]);
     }
@@ -191,7 +191,7 @@ static void ls7a_rtc_stop(LS7ARtcState *s)
 {
     int i;
 
-    /* delete timers, and when re-enabled, recaculate expire time */
+    /* delete timers, and when re-enabled, recalculate expire time */
     for (i = 0; i < TIMER_NUMS; i++) {
         timer_del(s->rtc_timer[i]);
     }
@@ -205,7 +205,7 @@ static void ls7a_toy_start(LS7ARtcState *s)
 
     now = qemu_clock_get_ms(rtc_clock);
 
-    /* recaculate expire time and enable timer */
+    /* recalculate expire time and enable timer */
     for (i = 0; i < TIMER_NUMS; i++) {
         toymatch_val_to_time(s, s->toymatch[i], &tm);
         expire_time = now + (qemu_timedate_diff(&tm) - s->offset_toy) * 1000;
@@ -218,7 +218,7 @@ static void ls7a_rtc_start(LS7ARtcState *s)
     int i;
     uint64_t expire_time;
 
-    /* recaculate expire time and enable timer */
+    /* recalculate expire time and enable timer */
     for (i = 0; i < TIMER_NUMS; i++) {
         expire_time = ticks_to_ns(s->rtcmatch[i]) - ticks_to_ns(s->offset_rtc);
         timer_mod_ns(s->rtc_timer[i], expire_time);
-- 
2.34.1


