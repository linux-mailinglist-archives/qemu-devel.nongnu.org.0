Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853F456305C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 11:38:46 +0200 (CEST)
Received: from localhost ([::1]:55650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7D6r-0003yA-4S
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 05:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o7D2d-0001iX-1q
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:34:23 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39352 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o7D2a-0003Ef-JW
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:34:22 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKeGPv75iutYAAA--.2820S7;
 Fri, 01 Jul 2022 17:34:09 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH 05/11] hw/rtc/ls7a_rtc: Fix rtc enable and disable function
Date: Fri,  1 Jul 2022 17:34:01 +0800
Message-Id: <20220701093407.2150607-6-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxKeGPv75iutYAAA--.2820S7
X-Coremail-Antispam: 1UD129KBjvJXoWxur1xuw43Xw4DtF47ZFyrZwb_yoWrur4UpF
 W3Jas7KF12qFs29rs7Grn8Ww1UAanrG3yxKrnrCan5Aa48Zwn7GFykJ3y8ZFWvvFykXr43
 A3yfWF45KF12krJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Fix ls7a rtc enable and disable function. When rtc disabled, it do
not support to read or write, but the real time is still continue,
so we need not neither save the time nor update the rtc offset.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
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
2.31.1


