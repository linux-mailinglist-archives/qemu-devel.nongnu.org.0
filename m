Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F36565171
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:56:03 +0200 (CEST)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IoE-0003Js-Ow
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITp-0001Go-54
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:57 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITn-0004xx-CG
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:56 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so13079048pjl.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=osLJKyNmPqnc7lVA+B9CIUOXsndu+uo/6mM5gEQ/mGQ=;
 b=MdlDS0+o4mb0+1uUOVR7Sl3ruOuGpMu1Gb/tvgcklsk9OL17JOOq9545SnJwNYANhC
 JBEWphkxflO4twyV0CzFcDxDgl2jwXBOa2rsx246NlNM4C7e/AWBy61xZwEiqMec193Z
 n7RUuTXmmY0TE7oNotgQBecR4xO3nJw2dy3u65BHS6NHrXzVH9zX7aRSUiEZ5X46Gtjy
 jsA5AfuF9NfM+8mYGN6Mvdg1o08g11eePvg3qufjn3FvPKsY60FNk1/T2lvB39gb5/aE
 f5aZnsQjVVSchI/CevJCC4/aKyTbdguOh3DPMgB2LN3jEKs7/0BDvssLuMJlR+0ToqGM
 Yu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=osLJKyNmPqnc7lVA+B9CIUOXsndu+uo/6mM5gEQ/mGQ=;
 b=Jk/S0Axyw6RmXqpdhkORHiD+3eZ8ezSLVpnwuH2R0daH+1NhF+xG3bAAMCOH+3fvw3
 FXVXNY2IDnMmUwzyTTnfR2yHYhT6GEDwXgLvZV4UFlCfnsuSJTKMEoCohPc0O3HRcxSA
 u4v7tq9Hx+Uj3qDrJqfUThKtDBjny3XrvZfIMzrw/VUmvjT+Z4ofc0ylW7kFGi4mEtWB
 FPzMuO8aR3j0tY6BAyzgXNj8qDcsNJXKJkn1yEzaGXDBP0u2jdrsDzcKZimneR4QZqaC
 9nGYHm9fFRqtUVYzPN4eDu9s4YkkD5xjEHX3AT2+R6sYe4zF/s6eQWBxVMV4ptEheuGa
 SJqw==
X-Gm-Message-State: AJIora9n9Pr9FpzawmCITf3KT07yJNleWvH9VZZ4g9P1MYjR2Sm/CK1y
 zbZCNRhC7MOT3zG7OR6yJsx0X7m6hJPfB5Mv
X-Google-Smtp-Source: AGRyM1vjksMjynrvwDp82IbufGPii9xoTpti6gZMMQ987xHmvSfKN8mhHjTeYbBvwvpi/78jWhliRw==
X-Received: by 2002:a17:902:e5cd:b0:16a:6f96:eb9 with SMTP id
 u13-20020a170902e5cd00b0016a6f960eb9mr35392888plf.69.1656927294537; 
 Mon, 04 Jul 2022 02:34:54 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 19/23] hw/rtc/ls7a_rtc: Fix rtc enable and disable function
Date: Mon,  4 Jul 2022 15:03:53 +0530
Message-Id: <20220704093357.983255-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Fix ls7a rtc enable and disable function. When rtc disabled, it do
not support to read or write, but the real time is still continue,
so we need not neither save the time nor update the rtc offset.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220701093407.2150607-6-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/rtc/ls7a_rtc.c | 60 ++++++-----------------------------------------
 1 file changed, 7 insertions(+), 53 deletions(-)

diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
index eb10cdb451..a36aeea9dd 100644
--- a/hw/rtc/ls7a_rtc.c
+++ b/hw/rtc/ls7a_rtc.c
@@ -72,9 +72,6 @@ struct LS7ARtcState {
      */
     int64_t offset_toy;
     int64_t offset_rtc;
-    uint64_t save_toy_mon;
-    uint64_t save_toy_year;
-    uint64_t save_rtc;
     int64_t data;
     int tidx;
     uint32_t toymatch[3];
@@ -140,14 +137,6 @@ static inline uint64_t toy_time_to_val_mon(struct tm tm)
     return val;
 }
 
-static inline uint64_t toy_time_to_val_year(struct tm tm)
-{
-    uint64_t year;
-
-    year = tm.tm_year;
-    return year;
-}
-
 static inline void toymatch_val_to_time(LS7ARtcState *s, uint64_t val, struct tm *tm)
 {
     qemu_get_timedate(tm, s->offset_toy);
@@ -191,14 +180,6 @@ static void rtcmatch_write(LS7ARtcState *s, uint64_t val, int num)
 static void ls7a_toy_stop(LS7ARtcState *s)
 {
     int i;
-    struct tm tm;
-    /*
-     * save time when disabled toy,
-     * because toy time not add counters.
-     */
-    qemu_get_timedate(&tm, s->offset_toy);
-    s->save_toy_mon = toy_time_to_val_mon(tm);
-    s->save_toy_year = toy_time_to_val_year(tm);
 
     /* delete timers, and when re-enabled, recaculate expire time */
     for (i = 0; i < TIMER_NUMS; i++) {
@@ -209,11 +190,6 @@ static void ls7a_toy_stop(LS7ARtcState *s)
 static void ls7a_rtc_stop(LS7ARtcState *s)
 {
     int i;
-    uint64_t time;
-
-    /* save rtc time */
-    time = ls7a_rtc_ticks() + s->offset_rtc;
-    s->save_rtc = time;
 
     /* delete timers, and when re-enabled, recaculate expire time */
     for (i = 0; i < TIMER_NUMS; i++) {
@@ -226,14 +202,7 @@ static void ls7a_toy_start(LS7ARtcState *s)
     int i;
     uint64_t expire_time, now;
     struct tm tm = {};
-    /*
-     * need to recaculate toy offset
-     * and expire time when enable it.
-     */
-    toy_val_to_time_mon(s->save_toy_mon, &tm);
-    toy_val_to_time_year(s->save_toy_year, &tm);
 
-    s->offset_toy = qemu_timedate_diff(&tm);
     now = qemu_clock_get_ms(rtc_clock);
 
     /* recaculate expire time and enable timer */
@@ -247,14 +216,7 @@ static void ls7a_toy_start(LS7ARtcState *s)
 static void ls7a_rtc_start(LS7ARtcState *s)
 {
     int i;
-    uint64_t expire_time, now;
-
-    /*
-     * need to recaculate rtc offset
-     * and expire time when enable it.
-     */
-    now = ls7a_rtc_ticks();
-    s->offset_rtc = s->save_rtc - now;
+    uint64_t expire_time;
 
     /* recaculate expire time and enable timer */
     for (i = 0; i < TIMER_NUMS; i++) {
@@ -271,23 +233,21 @@ static uint64_t ls7a_rtc_read(void *opaque, hwaddr addr, unsigned size)
 
     switch (addr) {
     case SYS_TOYREAD0:
-        /* if toy disabled, read save toy time */
         if (toy_enabled(s)) {
             qemu_get_timedate(&tm, s->offset_toy);
             val = toy_time_to_val_mon(tm);
         } else {
-            /* read save mon val */
-            val = s->save_toy_mon;
+            /* return 0 when toy disabled */
+            val = 0;
         }
         break;
     case SYS_TOYREAD1:
-        /* if toy disabled, read save toy time */
         if (toy_enabled(s)) {
             qemu_get_timedate(&tm, s->offset_toy);
             val = tm.tm_year;
         } else {
-            /* read save year val */
-            val = s->save_toy_year;
+            /* return 0 when toy disabled */
+            val = 0;
         }
         break;
     case SYS_TOYMATCH0:
@@ -303,11 +263,11 @@ static uint64_t ls7a_rtc_read(void *opaque, hwaddr addr, unsigned size)
         val = s->cntrctl;
         break;
     case SYS_RTCREAD0:
-        /* if rtc disabled, read save rtc time */
         if (rtc_enabled(s)) {
             val = ls7a_rtc_ticks() + s->offset_rtc;
         } else {
-            val = s->save_rtc;
+            /* return 0 when rtc disabled */
+            val = 0;
         }
         break;
     case SYS_RTCMATCH0:
@@ -457,9 +417,6 @@ static void ls7a_rtc_realize(DeviceState *dev, Error **errp)
     }
     d->offset_toy = 0;
     d->offset_rtc = 0;
-    d->save_toy_mon = 0;
-    d->save_toy_year = 0;
-    d->save_rtc = 0;
 
 }
 
@@ -515,9 +472,6 @@ static const VMStateDescription vmstate_ls7a_rtc = {
     .fields = (VMStateField[]) {
         VMSTATE_INT64(offset_toy, LS7ARtcState),
         VMSTATE_INT64(offset_rtc, LS7ARtcState),
-        VMSTATE_UINT64(save_toy_mon, LS7ARtcState),
-        VMSTATE_UINT64(save_toy_year, LS7ARtcState),
-        VMSTATE_UINT64(save_rtc, LS7ARtcState),
         VMSTATE_UINT32_ARRAY(toymatch, LS7ARtcState, TIMER_NUMS),
         VMSTATE_UINT32_ARRAY(rtcmatch, LS7ARtcState, TIMER_NUMS),
         VMSTATE_UINT32(cntrctl, LS7ARtcState),
-- 
2.34.1


