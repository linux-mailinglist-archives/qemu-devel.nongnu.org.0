Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBCE566509
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:31:19 +0200 (CEST)
Received: from localhost ([::1]:40036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dxm-0005Th-9P
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8dvK-00042g-AK
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:28:46 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:41705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8dvI-0003IX-ET
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:28:45 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 o31-20020a17090a0a2200b001ef7bd037bbso6523089pjo.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5KiDd2AUmsN7uSlao/kXNEITv5UGSEXvxglZYz0IYP0=;
 b=XsLDKIKYkBcQa41MJ8mVaFZpXCNWUwjJqD2EN72TtsmjrzIni5+D7JkapSIOlQqGC4
 9klFv5CO+uyWgUI4brrTxPj/AQMo/orMefWkR6JPA8e+2ldk9LunHjX2o9OaRNYlyuBv
 m5ghRzeKomX5EOI6wDD5qA5LUOike+nzO1HP9Gdloc2ozvloSdzQg8f5T19KqO77xMo+
 2RZLLmqXIBkzGJoEHSyDJHv2uISBY3vXapVHzfEnmi+Klrba8JCrc36bQ62+90F6zAsp
 +oD/a0bR5zWfg/8BCREZCxdH41Vb+ckg2yrSlfWh3peZVi9lGP3aoAxrsf9JbtW9ZgyD
 pA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5KiDd2AUmsN7uSlao/kXNEITv5UGSEXvxglZYz0IYP0=;
 b=0jPBLt0/Ws9jWsKnFq1vF6PcmRLU+Bar1mCeXYQwe+EGC1l2sRiQUVPURIk7P9ykV3
 ktY4KRu+87rnCLB7FH1sYMVhQ6oFEMTdCDv0UeA2tLooFjfHidwEPcTQXCZOOJMw6aH2
 souHirVvaZY9k/gAALF033f4SZ/KwGDC3MnpaUbjfqV0xa49PebOVH6WxxWA9ZSQ7bYs
 SoAnmFe8MJ8H36JslfXshI5AovpfziP94XvHu001pKve068bCxJBudBc/qj8rEYl7i5M
 EoQzOAJXdtF7RMrPjZksN6J2O1oqIub/4lCONcXsyEz3nXW0j/NB2M+jO6LY+xpwx3/q
 2yyQ==
X-Gm-Message-State: AJIora8+Px+img4ZTrbmqsgolYt8lEgLvCROowLPbn0SMxrj382BYx4E
 fxabf++LUd/P953wP42zPgQEIX0RQ7AKqwjm
X-Google-Smtp-Source: AGRyM1uyucb5IDSBzxiLtUzDPPPG2z818DJ0UnvgyuMYp9wHRoQHsv6pghQ4AlZ7ssfGOs99pLnqdw==
X-Received: by 2002:a17:903:40c9:b0:16a:2d26:5553 with SMTP id
 t9-20020a17090340c900b0016a2d265553mr40102099pld.31.1657009722475; 
 Tue, 05 Jul 2022 01:28:42 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 x13-20020a056a000bcd00b005206d4fd636sm22205591pfu.2.2022.07.05.01.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 01:28:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	yangxiaojuan@loongson.cn,
	gaosong@loongson.cn
Subject: [PATCH] hw/rtc/ls7a_rtc: Drop unused inline functions
Date: Tue,  5 Jul 2022 13:58:36 +0530
Message-Id: <20220705082836.1141160-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Remove toy_val_to_time_mon and toy_val_to_time_year as unused,
and to avoid a build failure with clang.  Remove all of the
other inline markers foo so that this does not creep back in.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/rtc/ls7a_rtc.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
index e8b75701e4..1f9e38a735 100644
--- a/hw/rtc/ls7a_rtc.c
+++ b/hw/rtc/ls7a_rtc.c
@@ -86,46 +86,31 @@ struct LS7ARtcState {
 };
 
 /* switch nanoseconds time to rtc ticks */
-static inline uint64_t ls7a_rtc_ticks(void)
+static uint64_t ls7a_rtc_ticks(void)
 {
     return qemu_clock_get_ns(rtc_clock) * LS7A_RTC_FREQ / NANOSECONDS_PER_SECOND;
 }
 
 /* switch rtc ticks to nanoseconds */
-static inline uint64_t ticks_to_ns(uint64_t ticks)
+static uint64_t ticks_to_ns(uint64_t ticks)
 {
     return ticks * NANOSECONDS_PER_SECOND / LS7A_RTC_FREQ;
 }
 
-static inline bool toy_enabled(LS7ARtcState *s)
+static bool toy_enabled(LS7ARtcState *s)
 {
     return FIELD_EX32(s->cntrctl, RTC_CTRL, TOYEN) &&
            FIELD_EX32(s->cntrctl, RTC_CTRL, EO);
 }
 
-static inline bool rtc_enabled(LS7ARtcState *s)
+static bool rtc_enabled(LS7ARtcState *s)
 {
     return FIELD_EX32(s->cntrctl, RTC_CTRL, RTCEN) &&
            FIELD_EX32(s->cntrctl, RTC_CTRL, EO);
 }
 
-/* parse toy value to struct tm */
-static inline void toy_val_to_time_mon(uint64_t toy_val, struct tm *tm)
-{
-    tm->tm_sec = FIELD_EX32(toy_val, TOY, SEC);
-    tm->tm_min = FIELD_EX32(toy_val, TOY, MIN);
-    tm->tm_hour = FIELD_EX32(toy_val, TOY, HOUR);
-    tm->tm_mday = FIELD_EX32(toy_val, TOY, DAY);
-    tm->tm_mon = FIELD_EX32(toy_val, TOY, MON) - 1;
-}
-
-static inline void toy_val_to_time_year(uint64_t toy_year, struct tm *tm)
-{
-    tm->tm_year = toy_year;
-}
-
 /* parse struct tm to toy value */
-static inline uint64_t toy_time_to_val_mon(struct tm *tm)
+static uint64_t toy_time_to_val_mon(const struct tm *tm)
 {
     uint64_t val = 0;
 
@@ -137,7 +122,7 @@ static inline uint64_t toy_time_to_val_mon(struct tm *tm)
     return val;
 }
 
-static inline void toymatch_val_to_time(LS7ARtcState *s, uint64_t val, struct tm *tm)
+static void toymatch_val_to_time(LS7ARtcState *s, uint64_t val, struct tm *tm)
 {
     qemu_get_timedate(tm, s->offset_toy);
     tm->tm_sec = FIELD_EX32(val, TOY_MATCH, SEC);
-- 
2.34.1


