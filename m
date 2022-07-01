Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F9D56309A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 11:48:17 +0200 (CEST)
Received: from localhost ([::1]:45490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7DG5-0007u9-1b
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 05:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o7D8Z-00009O-Ab
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:40:31 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41870 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o7D8V-0002rH-Ii
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:40:31 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKeGPv75iutYAAA--.2820S3;
 Fri, 01 Jul 2022 17:34:07 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH 01/11] hw/rtc/ls7a_rtc: Fix uninitialied bugs and toymatch
 writing function
Date: Fri,  1 Jul 2022 17:33:57 +0800
Message-Id: <20220701093407.2150607-2-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxKeGPv75iutYAAA--.2820S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGw1fWry8Gr1kAw1ftF13Arb_yoW5Ar1kpF
 W5Cwn5ta42yFsFgrZrCr4kAF15J3yqyryfXr98Cwsa934kXrs0gFykXrW7JFyUXFZ3uF4r
 ua1rZrn0qF43trJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

1. Initialize the tm struct in toymatch_write() and ls7a_toy_start() to
   fix uninitialized bugs.
2. Fix toymatch_val_to_time function. By the document, when we calculate
   the expiration year, we should first get current year, and replace the
   0-5 bits with toymatch's 26-31 bits.

Fixes: Coverity CID 1489766, 1489763

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/rtc/ls7a_rtc.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
index fe6710310f..b88a90de8b 100644
--- a/hw/rtc/ls7a_rtc.c
+++ b/hw/rtc/ls7a_rtc.c
@@ -148,8 +148,9 @@ static inline uint64_t toy_time_to_val_year(struct tm tm)
     return year;
 }
 
-static inline void toymatch_val_to_time(uint64_t val, struct tm *tm)
+static inline void toymatch_val_to_time(LS7ARtcState *s, uint64_t val, struct tm *tm)
 {
+    qemu_get_timedate(tm, s->offset_toy);
     tm->tm_sec = FIELD_EX32(val, TOY_MATCH, SEC);
     tm->tm_min = FIELD_EX32(val, TOY_MATCH, MIN);
     tm->tm_hour = FIELD_EX32(val, TOY_MATCH, HOUR);
@@ -158,17 +159,18 @@ static inline void toymatch_val_to_time(uint64_t val, struct tm *tm)
     tm->tm_year += (FIELD_EX32(val, TOY_MATCH, YEAR) - (tm->tm_year & 0x3f));
 }
 
-static void toymatch_write(LS7ARtcState *s, struct tm *tm, uint64_t val, int num)
+static void toymatch_write(LS7ARtcState *s, uint64_t val, int num)
 {
     int64_t now, expire_time;
+    struct tm tm = {};
 
     /* it do not support write when toy disabled */
     if (toy_enabled(s)) {
         s->toymatch[num] = val;
         /* caculate expire time */
         now = qemu_clock_get_ms(rtc_clock);
-        toymatch_val_to_time(val, tm);
-        expire_time = now + (qemu_timedate_diff(tm) - s->offset_toy) * 1000;
+        toymatch_val_to_time(s, val, &tm);
+        expire_time = now + (qemu_timedate_diff(&tm) - s->offset_toy) * 1000;
         timer_mod(s->toy_timer[num], expire_time);
     }
 }
@@ -223,7 +225,7 @@ static void ls7a_toy_start(LS7ARtcState *s)
 {
     int i;
     uint64_t expire_time, now;
-    struct tm tm;
+    struct tm tm = {};
     /*
      * need to recaculate toy offset
      * and expire time when enable it.
@@ -236,7 +238,7 @@ static void ls7a_toy_start(LS7ARtcState *s)
 
     /* recaculate expire time and enable timer */
     for (i = 0; i < TIMER_NUMS; i++) {
-        toymatch_val_to_time(s->toymatch[i], &tm);
+        toymatch_val_to_time(s, s->toymatch[i], &tm);
         expire_time = now + (qemu_timedate_diff(&tm) - s->offset_toy) * 1000;
         timer_mod(s->toy_timer[i], expire_time);
     }
@@ -352,13 +354,13 @@ static void ls7a_rtc_write(void *opaque, hwaddr addr,
         }
         break;
     case SYS_TOYMATCH0:
-        toymatch_write(s, &tm, val, 0);
+        toymatch_write(s, val, 0);
         break;
     case SYS_TOYMATCH1:
-        toymatch_write(s, &tm, val, 1);
+        toymatch_write(s, val, 1);
         break;
     case SYS_TOYMATCH2:
-        toymatch_write(s, &tm, val, 2);
+        toymatch_write(s, val, 2);
         break;
     case SYS_RTCCTRL:
         /* get old ctrl */
-- 
2.31.1


