Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF78156305B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 11:38:45 +0200 (CEST)
Received: from localhost ([::1]:55652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7D6m-0003yF-QU
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 05:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o7D2e-0001iz-3R
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:34:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39364 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o7D2a-0003Ei-JW
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:34:23 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKeGPv75iutYAAA--.2820S8;
 Fri, 01 Jul 2022 17:34:09 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH 06/11] hw/rtc/ls7a_rtc: Use tm struct pointer as arguments in
 toy_time_to_val()
Date: Fri,  1 Jul 2022 17:34:02 +0800
Message-Id: <20220701093407.2150607-7-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxKeGPv75iutYAAA--.2820S8
X-Coremail-Antispam: 1UD129KBjvJXoW7AF4kGFyfJr15Jry8Wr18uFg_yoW8Xr4Dpr
 4fCas3tFsrt3y29ryfArWqvF18Ja9Fg3yrXFWDAr4v9an5Ars7XFyDXay0qrWUXFZ3XF1f
 Xa43XFy5Wa1UZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Use pointer as arguments in toy_time_to_val() instead of struct tm.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/rtc/ls7a_rtc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
index a36aeea9dd..85cd2d22a5 100644
--- a/hw/rtc/ls7a_rtc.c
+++ b/hw/rtc/ls7a_rtc.c
@@ -125,15 +125,15 @@ static inline void toy_val_to_time_year(uint64_t toy_year, struct tm *tm)
 }
 
 /* parse struct tm to toy value */
-static inline uint64_t toy_time_to_val_mon(struct tm tm)
+static inline uint64_t toy_time_to_val_mon(struct tm *tm)
 {
     uint64_t val = 0;
 
-    val = FIELD_DP32(val, TOY, MON, tm.tm_mon + 1);
-    val = FIELD_DP32(val, TOY, DAY, tm.tm_mday);
-    val = FIELD_DP32(val, TOY, HOUR, tm.tm_hour);
-    val = FIELD_DP32(val, TOY, MIN, tm.tm_min);
-    val = FIELD_DP32(val, TOY, SEC, tm.tm_sec);
+    val = FIELD_DP32(val, TOY, MON, tm->tm_mon + 1);
+    val = FIELD_DP32(val, TOY, DAY, tm->tm_mday);
+    val = FIELD_DP32(val, TOY, HOUR, tm->tm_hour);
+    val = FIELD_DP32(val, TOY, MIN, tm->tm_min);
+    val = FIELD_DP32(val, TOY, SEC, tm->tm_sec);
     return val;
 }
 
@@ -235,7 +235,7 @@ static uint64_t ls7a_rtc_read(void *opaque, hwaddr addr, unsigned size)
     case SYS_TOYREAD0:
         if (toy_enabled(s)) {
             qemu_get_timedate(&tm, s->offset_toy);
-            val = toy_time_to_val_mon(tm);
+            val = toy_time_to_val_mon(&tm);
         } else {
             /* return 0 when toy disabled */
             val = 0;
-- 
2.31.1


