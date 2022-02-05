Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B314AAAC9
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 19:09:02 +0100 (CET)
Received: from localhost ([::1]:42014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGPUb-00052K-9H
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 13:09:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nGPLx-0007F8-B9
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 13:00:05 -0500
Received: from [2a00:1450:4864:20::531] (port=39507
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nGPLv-00010k-0o
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 13:00:04 -0500
Received: by mail-ed1-x531.google.com with SMTP id u18so20186826edt.6
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 10:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gdaiRf8PkxIZRVB4nxAd0RX/qVncmh/Pfk2cqHlLhF8=;
 b=HON3ferHI0+yyBFBDO8y7xjYpyhl+HZ87eyewHOXKtptYFaYTMT9eVOqfVxRCQsjK1
 +phR0C1YaQwBaWaloAbjOeg4RH5Xuhdvng6rdeh+sPK9wJgUudF4+4Xa86otnqwJ1O2v
 LhpkZNH5adnt4BRJEsUfwd8T5ROWZ2jYJT+ZKZnMdyxOsfRKERF1za6e7U8YmRobZoNo
 7mDIwbcztoeZ5VgkoKZUwI5CXMns/K3KkLXxJZ36T5v6z/Rupwv0xK0bDDvxfwUnTVXt
 8+qpxpbw417w4w67qrgoFDh7Rp9E1zKuwicYzXLFNUK9XR2YrBHKrbp2In5PyB1V1qro
 cP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gdaiRf8PkxIZRVB4nxAd0RX/qVncmh/Pfk2cqHlLhF8=;
 b=eBJAbYPy52G7nfGMaxDmJiJ1pypRkoFziPBomfbMJ28ppwoUov1uVDvimsYJg4JW/+
 P96vJtLtYqFSWIjutapSyobgNkE2f7HivGwysvOac+Fp5RSMDL8iAwNBqlMlE1teB9sC
 vTW03ALDxS25y4TsOEtfKo4nVKFkLnpqUo4pLv86g5tU1E/wTeRzGdTnZHR5wEaUEQuT
 oVQdV+gvrEmQx8z414Hepumo3SNJgDRCvfuMzXZPHnyMdwx2jC6iqLGIkKlydN57lKs2
 p2yCtzdDuGUFGxVbHIX3QhoWeeB/R+I3Bq/JucRNe4hzR62LDPhLM4yzn02MWifjUDSs
 9ygQ==
X-Gm-Message-State: AOAM532dRtgsOoXByRtyAFcGiBeY58YRg5JPH77xM7FCqkETFxES/aJ0
 CpMqHNkqcHkxl6751YNmWJPwFC6OUHO5LA==
X-Google-Smtp-Source: ABdhPJwxMtetDhTBdKWQ9PfHMZvvc82n4qQNyEhMbemM3eZKsoO0fdLF9YyB6WSmtxFlArtMNaaGNw==
X-Received: by 2002:aa7:dc05:: with SMTP id b5mr5576141edu.197.1644084001431; 
 Sat, 05 Feb 2022 10:00:01 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-230-134.89.12.pool.telefonica.de. [89.12.230.134])
 by smtp.gmail.com with ESMTPSA id e2sm1820660ejr.210.2022.02.05.10.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 10:00:01 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] mc146818rtc: Unexport RTCState
Date: Sat,  5 Feb 2022 18:59:13 +0100
Message-Id: <20220205175913.31738-3-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220205175913.31738-1-shentey@gmail.com>
References: <20220205175913.31738-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that RTCState isn't used outside mc146818rtc.c any more, it can be
unexported to prevent outside code to depend on its details.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/rtc/mc146818rtc.c         | 34 ++++++++++++++++++++++++++++++++++
 include/hw/rtc/mc146818rtc.h | 35 +----------------------------------
 2 files changed, 35 insertions(+), 34 deletions(-)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index e61a0cced4..e3980ac663 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -26,6 +26,7 @@
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 #include "qemu/bcd.h"
+#include "qemu/queue.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
@@ -41,7 +42,9 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qapi/qapi-events-misc-target.h"
+#include "qapi/qapi-types-machine.h"
 #include "qapi/visitor.h"
+#include "qom/object.h"
 #include "hw/rtc/mc146818rtc_regs.h"
 
 #ifdef TARGET_I386
@@ -74,6 +77,37 @@
 #define RTC_CLOCK_RATE            32768
 #define UIP_HOLD_LENGTH           (8 * NANOSECONDS_PER_SECOND / 32768)
 
+OBJECT_DECLARE_SIMPLE_TYPE(RTCState, MC146818_RTC)
+
+struct RTCState {
+    ISADevice parent_obj;
+
+    MemoryRegion io;
+    MemoryRegion coalesced_io;
+    uint8_t cmos_data[128];
+    uint8_t cmos_index;
+    int32_t base_year;
+    uint64_t base_rtc;
+    uint64_t last_update;
+    int64_t offset;
+    qemu_irq irq;
+    int it_shift;
+    /* periodic timer */
+    QEMUTimer *periodic_timer;
+    int64_t next_periodic_time;
+    /* update-ended timer */
+    QEMUTimer *update_timer;
+    uint64_t next_alarm_time;
+    uint16_t irq_reinject_on_ack_count;
+    uint32_t irq_coalesced;
+    uint32_t period;
+    QEMUTimer *coalesced_timer;
+    Notifier clock_reset_notifier;
+    LostTickPolicy lost_tick_policy;
+    Notifier suspend_notifier;
+    QLIST_ENTRY(RTCState) link;
+};
+
 static void rtc_set_time(RTCState *s);
 static void rtc_update_time(RTCState *s);
 static void rtc_set_cmos(RTCState *s, const struct tm *tm);
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index 5b45b22924..0dc2cb2605 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -9,43 +9,10 @@
 #ifndef HW_RTC_MC146818RTC_H
 #define HW_RTC_MC146818RTC_H
 
-#include "qapi/qapi-types-machine.h"
-#include "qemu/queue.h"
-#include "qemu/timer.h"
 #include "hw/isa/isa.h"
-#include "qom/object.h"
+#include "qemu/typedefs.h"
 
 #define TYPE_MC146818_RTC "mc146818rtc"
-OBJECT_DECLARE_SIMPLE_TYPE(RTCState, MC146818_RTC)
-
-struct RTCState {
-    ISADevice parent_obj;
-
-    MemoryRegion io;
-    MemoryRegion coalesced_io;
-    uint8_t cmos_data[128];
-    uint8_t cmos_index;
-    int32_t base_year;
-    uint64_t base_rtc;
-    uint64_t last_update;
-    int64_t offset;
-    qemu_irq irq;
-    int it_shift;
-    /* periodic timer */
-    QEMUTimer *periodic_timer;
-    int64_t next_periodic_time;
-    /* update-ended timer */
-    QEMUTimer *update_timer;
-    uint64_t next_alarm_time;
-    uint16_t irq_reinject_on_ack_count;
-    uint32_t irq_coalesced;
-    uint32_t period;
-    QEMUTimer *coalesced_timer;
-    Notifier clock_reset_notifier;
-    LostTickPolicy lost_tick_policy;
-    Notifier suspend_notifier;
-    QLIST_ENTRY(RTCState) link;
-};
 
 #define RTC_ISA_IRQ 8
 #define RTC_ISA_BASE 0x70
-- 
2.35.1


