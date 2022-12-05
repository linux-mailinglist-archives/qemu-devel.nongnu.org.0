Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4085642A53
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 15:24:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2CN2-00015E-04; Mon, 05 Dec 2022 09:23:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baiyw2@chinatelecom.cn>)
 id 1p26wX-0002H5-LU
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 03:35:18 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <baiyw2@chinatelecom.cn>) id 1p26wR-0004ku-ST
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 03:35:16 -0500
HMM_SOURCE_IP: 172.18.0.188:50838.1395665910
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-58.208.15.64 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 3C31E2800DB;
 Mon,  5 Dec 2022 16:24:12 +0800 (CST)
X-189-SAVE-TO-SEND: +baiyw2@chinatelecom.cn
Received: from  ([58.208.15.64])
 by app0023 with ESMTP id 4d020b1742d449f9acce0d043c900ac6 for mst@redhat.com; 
 Mon, 05 Dec 2022 16:24:26 CST
X-Transaction-ID: 4d020b1742d449f9acce0d043c900ac6
X-Real-From: baiyw2@chinatelecom.cn
X-Receive-IP: 58.208.15.64
X-MEDUSA-Status: 0
From: Yaowei Bai <baiyw2@chinatelecom.cn>
To: mst@redhat.com,
	pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	baiyw2@chinatelecom.cn
Subject: [PATCH] hw/rtc: fix crash caused by lost_clock >= 0 assertion
Date: Mon,  5 Dec 2022 16:23:35 +0800
Message-Id: <1670228615-2684-1-git-send-email-baiyw2@chinatelecom.cn>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=baiyw2@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 05 Dec 2022 09:22:55 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In our production environment a guest crashed with this log:

    qemu-kvm: /home/abuild/rpmbuild/BUILD/qemu-5.0.0/hw/rtc/mc146818rtc.c:201: periodic_timer_update: Assertion `lost_clock >= 0' failed.
    2022-09-26 10:00:28.747+0000: shutting down, reason=crashed

This happened after the host synced time with the NTP server which
we had adjusted backward the time because it mistakenly went faster
than the real time. Other people also have this problem:

    https://bugzilla.redhat.com/show_bug.cgi?id=2054781

After the host adjusted backward the time, the guset reconfigured the
period, this makes cur_clock smaller than last_periodic_clock in
periodic_timer_update function. However, the code assumes that cur_clock
is bigger than last_periodic_clock, which is not true in the situation
above. So we need to make it clear by introducing a if statement. With
this patch we can handle this crash situation to just reset the
next_periodic_time.

Signed-off-by: Yaowei Bai <baiyw2@chinatelecom.cn>
---
 hw/rtc/mc146818rtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 1ebb412..a397949 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -199,7 +199,9 @@ periodic_timer_update(RTCState *s, int64_t current_time, uint32_t old_period, bo
         next_periodic_clock = muldiv64(s->next_periodic_time,
                                 RTC_CLOCK_RATE, NANOSECONDS_PER_SECOND);
         last_periodic_clock = next_periodic_clock - old_period;
-        lost_clock = cur_clock - last_periodic_clock;
+        if (cur_clock > last_periodic_clock) {
+            lost_clock = cur_clock - last_periodic_clock;
+        }
         assert(lost_clock >= 0);
     }
 
-- 
2.7.4


