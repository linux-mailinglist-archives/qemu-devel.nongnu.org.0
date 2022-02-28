Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8824C6AB3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:37:15 +0100 (CET)
Received: from localhost ([::1]:56682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeL4-0007db-OO
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:37:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAe-00046v-8i
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAY-00078J-70
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646047581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mpcdpfKhZczd8z4YZ1dFbkWmNjzpKP/HLChZjwNTQYU=;
 b=QLk7TRqeP2AygXYV9t3doLb/mRp7mVpiTZqJZC4BJsL7pNvpHgVM0pGqewdRsFMEho+jFp
 94vTkVgqiU9c0yHdSiPZBiwT1l2BLfhJ2cXHYfUbZsKqokaw6ZbE6Eeq7Fl8CHKclRTXR8
 5ZRX/JSclrIekPSMDgOU9nQS1Kf23EA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-YsBZSFaPM6StXZOht-B9kQ-1; Mon, 28 Feb 2022 06:26:18 -0500
X-MC-Unique: YsBZSFaPM6StXZOht-B9kQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26509520E;
 Mon, 28 Feb 2022 11:26:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFCF776BF8;
 Mon, 28 Feb 2022 11:26:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D55C221E6921; Mon, 28 Feb 2022 12:26:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] rtc: Have event RTC_CHANGE identify the RTC by QOM path
Date: Mon, 28 Feb 2022 12:26:12 +0100
Message-Id: <20220228112613.520040-9-armbru@redhat.com>
In-Reply-To: <20220228112613.520040-1-armbru@redhat.com>
References: <20220228112613.520040-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Event RTC_CHANGE is "emitted when the guest changes the RTC time" (and
the RTC supports the event).  What if there's more than one RTC?
Which one changed?  New @qom-path identifies it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <87a6ejnm80.fsf@pond.sub.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 qapi/misc.json       | 4 +++-
 hw/ppc/spapr_rtc.c   | 4 +++-
 hw/rtc/mc146818rtc.c | 3 ++-
 hw/rtc/pl031.c       | 3 ++-
 4 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 0ab235e41f..b83cc39029 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -536,6 +536,8 @@
 # @offset: offset in seconds between base RTC clock (as specified
 #          by -rtc base), and new RTC clock value
 #
+# @qom-path: path to the RTC object in the QOM tree
+#
 # Note: This event is rate-limited.
 #       It is not guaranteed that the RTC in the system implements
 #       this event, or even that the system has an RTC at all.
@@ -550,4 +552,4 @@
 #
 ##
 { 'event': 'RTC_CHANGE',
-  'data': { 'offset': 'int' } }
+  'data': { 'offset': 'int', 'qom-path': 'str' } }
diff --git a/hw/ppc/spapr_rtc.c b/hw/ppc/spapr_rtc.c
index 79677cf550..d55b4b0c50 100644
--- a/hw/ppc/spapr_rtc.c
+++ b/hw/ppc/spapr_rtc.c
@@ -97,6 +97,7 @@ static void rtas_set_time_of_day(PowerPCCPU *cpu, SpaprMachineState *spapr,
                                  uint32_t nret, target_ulong rets)
 {
     SpaprRtcState *rtc = &spapr->rtc;
+    g_autofree const char *qom_path = NULL;
     struct tm tm;
     time_t new_s;
     int64_t host_ns;
@@ -120,7 +121,8 @@ static void rtas_set_time_of_day(PowerPCCPU *cpu, SpaprMachineState *spapr,
     }
 
     /* Generate a monitor event for the change */
-    qapi_event_send_rtc_change(qemu_timedate_diff(&tm));
+    qom_path = object_get_canonical_path(OBJECT(rtc));
+    qapi_event_send_rtc_change(qemu_timedate_diff(&tm), qom_path);
 
     host_ns = qemu_clock_get_ns(rtc_clock);
 
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 57c514e15c..ac9a60c90e 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -611,12 +611,13 @@ static void rtc_get_time(RTCState *s, struct tm *tm)
 static void rtc_set_time(RTCState *s)
 {
     struct tm tm;
+    g_autofree const char *qom_path = object_get_canonical_path(OBJECT(s));
 
     rtc_get_time(s, &tm);
     s->base_rtc = mktimegm(&tm);
     s->last_update = qemu_clock_get_ns(rtc_clock);
 
-    qapi_event_send_rtc_change(qemu_timedate_diff(&tm));
+    qapi_event_send_rtc_change(qemu_timedate_diff(&tm), qom_path);
 }
 
 static void rtc_set_cmos(RTCState *s, const struct tm *tm)
diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
index 60167c778f..b01d0e75d1 100644
--- a/hw/rtc/pl031.c
+++ b/hw/rtc/pl031.c
@@ -138,12 +138,13 @@ static void pl031_write(void * opaque, hwaddr offset,
 
     switch (offset) {
     case RTC_LR: {
+        g_autofree const char *qom_path = object_get_canonical_path(opaque);
         struct tm tm;
 
         s->tick_offset += value - pl031_get_count(s);
 
         qemu_get_timedate(&tm, s->tick_offset);
-        qapi_event_send_rtc_change(qemu_timedate_diff(&tm));
+        qapi_event_send_rtc_change(qemu_timedate_diff(&tm), qom_path);
 
         pl031_set_alarm(s);
         break;
-- 
2.35.1


