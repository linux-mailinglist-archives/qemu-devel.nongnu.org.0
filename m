Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9C7405013
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 14:28:18 +0200 (CEST)
Received: from localhost ([::1]:50796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOJA9-0000z4-2f
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 08:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mOJ8E-0007nI-DI
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:26:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mOJ6H-0004mt-8g
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:26:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631190255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d7G9afcLSqJHPuwOeSlGmfa2uhgVZM6GeGdaZfkrsi8=;
 b=ITViDX6VqSAuvtZg5BlNkn/1KhHwdXDnMJNz7EkfsEo3iR71Dme9JB2reAXDF6JnU2I3pc
 mAXSu5F3GZDEXxu04fiSkn8iNEQHXy3T2JovJXr8JrfrO/7Ww5x4/0Uo/22t1TuJXUeiVX
 KsYAUFRYQsAgUhDRaAHhAAi7l3GTFKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-C1W3HS2oPyqR4D143pdNWQ-1; Thu, 09 Sep 2021 08:24:14 -0400
X-MC-Unique: C1W3HS2oPyqR4D143pdNWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4576B5074B;
 Thu,  9 Sep 2021 12:24:13 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 891685C261;
 Thu,  9 Sep 2021 12:24:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] hw/rtc/pl031: Send RTC_CHANGE QMP event
Date: Thu,  9 Sep 2021 14:24:02 +0200
Message-Id: <20210909122402.127977-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PL031 currently is not able to report guest RTC change to the QMP
monitor as opposed to mc146818 or spapr RTCs. This patch adds the call
to qapi_event_send_rtc_change() when the Load Register is written. The
value that is reported corresponds to the difference between the new
RTC value and the RTC value elapsed since the base.

For instance adding 20s to the guest RTC value will report 20:
{'timestamp': {'seconds': 1631189494, 'microseconds': 16932},
'event': 'RTC_CHANGE', 'data': {'offset': 20}}

Adding another extra 20s to the guest RTC value will report 40:
{'timestamp': {'seconds': 1631189498, 'microseconds': 9708},
'event': 'RTC_CHANGE', 'data': {'offset': 40}}

To compute the offset we need to track the origin tick_offset (the one
computed at init time). So we need to migrate that field, which is done
in a dedicated subsection. The migration of this subsection is disabled
for machine types less or equal than 6.1.

After migration, adding an extra 20s on the destination returns 60:
{'timestamp': {'seconds': 1631189522, 'microseconds': 13081},
'event': 'RTC_CHANGE', 'data': {'offset': 60}}

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

Tested with the following script run on guest:

  #!/bin/sh
  old=$(hwclock --show | cut -f1-7 -d' ')
  oldabs=$(date +%s -d "$old")
  newabs=$(expr $oldabs + $1)
  new=$(date -d @"$newabs")
  echo Old: $oldabs $old
  echo New: $newabs $new
  hwclock --set --date "$new"

This was tested with both -rtc base=2010-12-03T01:02:00 and base=utc
qemu options. As far as I can see the reported value match what
is observed on x86 (except on x86 the values are not exactly the one
used on guest, ie. 18 for instance instead of 20).

Without migrating the original tick_offset (ie. original_tick_offset
taking the destination init tick_offset value), a delta is observed. I
don't know whether it is a bug. At firt glance I had the
impression it worked without the migration scheme but this delta
urged me to migrate the original_offset too.
---
 hw/core/machine.c      |  4 +++-
 hw/rtc/meson.build     |  2 +-
 hw/rtc/pl031.c         | 25 +++++++++++++++++++++++++
 include/hw/rtc/pl031.h |  2 ++
 4 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 067f42b528f..e93cc4ab39d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,7 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_6_1[] = {};
+GlobalProperty hw_compat_6_1[] = {
+    { "pl031", "migrate-original-tick-offset", "false" },
+};
 const size_t hw_compat_6_1_len = G_N_ELEMENTS(hw_compat_6_1);
 
 GlobalProperty hw_compat_6_0[] = {
diff --git a/hw/rtc/meson.build b/hw/rtc/meson.build
index 7cecdee5ddb..8fd8d8f9a71 100644
--- a/hw/rtc/meson.build
+++ b/hw/rtc/meson.build
@@ -2,7 +2,7 @@
 softmmu_ss.add(when: 'CONFIG_DS1338', if_true: files('ds1338.c'))
 softmmu_ss.add(when: 'CONFIG_M41T80', if_true: files('m41t80.c'))
 softmmu_ss.add(when: 'CONFIG_M48T59', if_true: files('m48t59.c'))
-softmmu_ss.add(when: 'CONFIG_PL031', if_true: files('pl031.c'))
+specific_ss.add(when: 'CONFIG_PL031', if_true: files('pl031.c'))
 softmmu_ss.add(when: 'CONFIG_TWL92230', if_true: files('twl92230.c'))
 softmmu_ss.add(when: ['CONFIG_ISA_BUS', 'CONFIG_M48T59'], if_true: files('m48t59-isa.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-rtc.c'))
diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
index 2bbb2062ac8..51dc14559c5 100644
--- a/hw/rtc/pl031.c
+++ b/hw/rtc/pl031.c
@@ -24,6 +24,8 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
+#include "qemu/timer.h"
+#include "qapi/qapi-events-misc-target.h"
 
 #define RTC_DR      0x00    /* Data read register */
 #define RTC_MR      0x04    /* Match register */
@@ -138,6 +140,7 @@ static void pl031_write(void * opaque, hwaddr offset,
     switch (offset) {
     case RTC_LR:
         s->tick_offset += value - pl031_get_count(s);
+        qapi_event_send_rtc_change(s->tick_offset - s->original_tick_offset);
         pl031_set_alarm(s);
         break;
     case RTC_MR:
@@ -190,6 +193,7 @@ static void pl031_init(Object *obj)
     qemu_get_timedate(&tm, 0);
     s->tick_offset = mktimegm(&tm) -
         qemu_clock_get_ns(rtc_clock) / NANOSECONDS_PER_SECOND;
+    s->original_tick_offset = s->tick_offset;
 
     s->timer = timer_new_ns(rtc_clock, pl031_interrupt, s);
 }
@@ -287,6 +291,24 @@ static const VMStateDescription vmstate_pl031_tick_offset = {
     }
 };
 
+static bool pl031_original_tick_offset_needed(void *opaque)
+{
+    PL031State *s = opaque;
+
+    return s->migrate_original_tick_offset;
+}
+
+static const VMStateDescription vmstate_pl031_original_tick_offset = {
+    .name = "pl031/original-tick-offset",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pl031_original_tick_offset_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(original_tick_offset, PL031State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_pl031 = {
     .name = "pl031",
     .version_id = 1,
@@ -305,6 +327,7 @@ static const VMStateDescription vmstate_pl031 = {
     },
     .subsections = (const VMStateDescription*[]) {
         &vmstate_pl031_tick_offset,
+        &vmstate_pl031_original_tick_offset,
         NULL
     }
 };
@@ -320,6 +343,8 @@ static Property pl031_properties[] = {
      */
     DEFINE_PROP_BOOL("migrate-tick-offset",
                      PL031State, migrate_tick_offset, true),
+    DEFINE_PROP_BOOL("migrate-original-tick-offset",
+                     PL031State, migrate_original_tick_offset, true),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/include/hw/rtc/pl031.h b/include/hw/rtc/pl031.h
index 9fd4be1abba..e1a12753d7d 100644
--- a/include/hw/rtc/pl031.h
+++ b/include/hw/rtc/pl031.h
@@ -37,6 +37,8 @@ struct PL031State {
     uint32_t tick_offset;
     bool tick_offset_migrated;
     bool migrate_tick_offset;
+    uint32_t original_tick_offset;
+    bool migrate_original_tick_offset;
 
     uint32_t mr;
     uint32_t lr;
-- 
2.26.3


