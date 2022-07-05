Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19E75668EC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 13:10:10 +0200 (CEST)
Received: from localhost ([::1]:48830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8gRW-0007EV-01
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 07:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gHp-0006ox-1v
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:00:09 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:36691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gHm-0000fN-Tk
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:00:08 -0400
Received: by mail-pf1-x42c.google.com with SMTP id 3so1053429pfx.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 04:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CEQI5Tzq0ISDeB3fX3wDve+phtrCx3JrMsFA2JUk8Bg=;
 b=j/W8qN2KdHSPSKGm8jTEQw1hQi/siLuI4jZja+5czS9oCjdLqSvwH0PGtowTpR7coX
 YJZDfcJaSjVfPxS/dxc8nHDlphSg9v7HrsKEH2znPGIZf/xlxvGQRBW7Wq8yxEk2Y+FV
 VG8fDJT1IoMt9yLSMNt+Lka6OEJ71nGyzValy5HeccadNVzij5tbV7gk8mA1Vp7ccpK5
 v0YwX72qoouk0IpQjTLO0y56JyN2tsFohGwBVZcgoErvKhqmYiiKhBpOKX/3GqTpodDY
 bnnWtGpBgqvDGmmzbTcSy7uC3njk7HcDESBOdgwC2iFKhdZPk9vTYVBZp6rSbwE6Cd6z
 YJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CEQI5Tzq0ISDeB3fX3wDve+phtrCx3JrMsFA2JUk8Bg=;
 b=JsfeYtM43q/Rm1XjUvrtEo4PzAMPsEAZo6LXYcdS2NvzNOiPH4AmAiVcCJl+h7DkKK
 hrqX1d4wjXKA6dj/j/ygUoNHp/nPySCU+YBK8DcYOy8fNGezRMqaJO6glJMksCJqXmcA
 BH2dvIlJiu1JCdoT+Ln/O8VSnIZt8hUR58bvEv/Ebz02au4v2FDCTO0Hpc6n1/NGIIdJ
 D8MOBltbGz+CDcefN0xzEO/aaq87pHIpjO3qZf0TO7KlC/dDLpe7+8pkLDyeQfdudRlZ
 EGEzUfGZ80GjzgXXAshDiYKyaRUxpRynrxYnZvI+JDuy2hofVFu49SgbMmVVHpq3lCyr
 VvMw==
X-Gm-Message-State: AJIora+uY3SuVQlh0yuHOirgsRYfOicnT4f03PCZPdI8ecmKhe9FmC3M
 Fp1oGQPNioA75TyE8kBchmN8Uy2WS5dQJ97w
X-Google-Smtp-Source: AGRyM1sOKpCUCaywuoHKbVBFH5imDXzhvb/3pKP12jfzzOSCiMjtslQKcXUmBVDrvKDNm/17wDez+Q==
X-Received: by 2002:a05:6a00:150a:b0:525:3030:fe41 with SMTP id
 q10-20020a056a00150a00b005253030fe41mr41275481pfu.37.1657018804943; 
 Tue, 05 Jul 2022 04:00:04 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 d18-20020a170903231200b0016bf7981d0bsm508454plh.86.2022.07.05.04.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 04:00:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
	Thomas Huth <thuth@redhat.com>
Subject: [PULL 1/6] hw/rtc/ls7a_rtc: Drop unused inline functions
Date: Tue,  5 Jul 2022 16:29:51 +0530
Message-Id: <20220705105957.1144514-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705105957.1144514-1-richard.henderson@linaro.org>
References: <20220705105957.1144514-1-richard.henderson@linaro.org>
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

Remove toy_val_to_time_mon and toy_val_to_time_year as unused,
to avoid a build failure with clang.  Remove all of the other
inline markers too so that this does not creep back in.

Reviewed-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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


