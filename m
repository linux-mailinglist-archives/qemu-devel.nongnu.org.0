Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD6A411470
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 14:30:17 +0200 (CEST)
Received: from localhost ([::1]:48446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSIR6-0006ej-Pj
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 08:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mSIMl-0003Xl-My
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 08:25:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mSIMi-0004No-4k
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 08:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632140742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pPkyoO4nNHJGaPC8tme6jYcFmt9MYoMhyoF4+cz5dts=;
 b=M/zK/zoHX/dUxbci1BKhVhxxwW5Numd9Jj/G+Xmiak3FH3PbmVDiybLfUZBiGqTL14XyFF
 I6Bj/pZb0kQdMR1ef65Q8G2kI/SNgV33OjECpvA2NOArtr80XSnOoZh33COCTaOtgmiIiX
 tZhVHh+2xfOBfRZCk97ZdKmeuK+PknU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224--6p_3oY5OSaz_OKOpaiiXQ-1; Mon, 20 Sep 2021 08:25:41 -0400
X-MC-Unique: -6p_3oY5OSaz_OKOpaiiXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C911B1084684;
 Mon, 20 Sep 2021 12:25:40 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E092160C2B;
 Mon, 20 Sep 2021 12:25:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2] hw/rtc/pl031: Send RTC_CHANGE QMP event
Date: Mon, 20 Sep 2021 14:25:35 +0200
Message-Id: <20210920122535.269988-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
value which is reported corresponds to the difference between the guest
reference time and the reference time kept in softmmu/rtc.c.

For instance adding 20s to the guest RTC value will report 20. Adding
an extra 20s to the guest RTC value will report 20 + 20 = 40.

The inclusion of qapi/qapi-types-misc-target.h in hw/rtl/pl031.c
require to compile the PL031 with specific_ss.add() to avoid
./qapi/qapi-types-misc-target.h:18:13: error: attempt to use poisoned
"TARGET_<ARCH>".

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

---

v1 -> v2:
- Use Peter's implementation and remove subsection

Tested with the following script run on guest:

  #!/bin/sh
  old=$(hwclock --show | cut -f1-7 -d' ')
  oldabs=$(date +%s -d "$old")
  newabs=$(expr $oldabs + $1)
  new=$(date -d @"$newabs")
  echo Old: $oldabs $old
  echo New: $newabs $new
  hwclock --set --date "$new"

and compared with x86 behavior.
---
 hw/rtc/meson.build |  2 +-
 hw/rtc/pl031.c     | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

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
index 2bbb2062ac8..e7ced90b025 100644
--- a/hw/rtc/pl031.c
+++ b/hw/rtc/pl031.c
@@ -24,6 +24,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
+#include "qapi/qapi-events-misc-target.h"
 
 #define RTC_DR      0x00    /* Data read register */
 #define RTC_MR      0x04    /* Match register */
@@ -136,10 +137,17 @@ static void pl031_write(void * opaque, hwaddr offset,
     trace_pl031_write(offset, value);
 
     switch (offset) {
-    case RTC_LR:
+    case RTC_LR: {
+        struct tm tm;
+
         s->tick_offset += value - pl031_get_count(s);
+
+        qemu_get_timedate(&tm, s->tick_offset);
+        qapi_event_send_rtc_change(qemu_timedate_diff(&tm));
+
         pl031_set_alarm(s);
         break;
+    }
     case RTC_MR:
         s->mr = value;
         pl031_set_alarm(s);
-- 
2.26.3


