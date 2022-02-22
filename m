Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742954BF7DF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 13:08:56 +0100 (CET)
Received: from localhost ([::1]:38706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMTyR-0006Rw-0e
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 07:08:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMTsR-0003gc-Sz
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 07:03:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nMTsK-0007PD-4U
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 07:02:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645531335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MRn/UueCSRqWV+WZjoRqNv6PQkOrFk+efUhVrJy/jnQ=;
 b=Pv1k3MDK2jpv9tneb4DN5ZmL77nwSybsXULI/NZZY2zxxkGGoGH0UB+OcMNHvSR4SnSEQy
 4jbwvrXoXFVvblXQMxPYRt/BxHV8Z6gceLgAs8OQ25z+y+4zC5Ux8qFpm4pm7rvzBFsVNJ
 zUIf+haAiNa1+YrGv+3A6O8aIEXk5v4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-JnX63StzMMmTQN_Aa6HuXA-1; Tue, 22 Feb 2022 07:02:14 -0500
X-MC-Unique: JnX63StzMMmTQN_Aa6HuXA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D8471800D50;
 Tue, 22 Feb 2022 12:02:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD80E7C0DA;
 Tue, 22 Feb 2022 12:02:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4EEE821A736E; Tue, 22 Feb 2022 13:02:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RFC 4/4] rtc: Have event RTC_CHANGE identify the RTC by QOM
 path
References: <20220221192123.749970-1-peter.maydell@linaro.org>
Date: Tue, 22 Feb 2022 13:02:07 +0100
In-Reply-To: <20220221192123.749970-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Mon, 21 Feb 2022 19:21:20 +0000")
Message-ID: <87a6ejnm80.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Event RTC_CHANGE is "emitted when the guest changes the RTC time" (and
the RTC supports the event).  What if there's more than one RTC?
Which one changed?  New @qom-path identifies it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
RFC because it's compile-tested only.  Worthwhile?  Let me know what you
think.

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


