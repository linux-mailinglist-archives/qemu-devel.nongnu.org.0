Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CC3692B37
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 00:33:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQcrd-00068d-G5; Fri, 10 Feb 2023 18:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQcrb-000684-4s
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:31:31 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQcrY-0007qE-NT
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:31:30 -0500
Received: by mail-wr1-x42d.google.com with SMTP id y1so6690053wru.2
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 15:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QGuPT6na6ZOMImjVznTFeUyZRr+VxZ3/v7FhbrE4GUA=;
 b=cs5rtO/wNZRV/JQHntB3KRY+mQg/0TVskuXfDXiP0dp3C5E6vv4hAzlO+T6FassBXZ
 GNMrzPFL5hDOdKjD+Xt8ukJg3Ftmr9CV5SuS9nSvb2vfYnKvRsKegsqp6R0rG+8SmM7u
 NxX6qJfBGJzvvyZfKItdJdzJzbWwSYEQn5kgnHc0GPgwZb74jAb8QT+ffboPUl+3AtRY
 UEcjlVLqBz0dWKxQdkX5hGk6ksYtZWneS3jrCRJ2A8pX8IZSTVFpveyjGb8yNiGaV7Ok
 ho7iFeAFY2eNDjsDLz96MxhoK1kKUgJ+eywfSVZAN9XxFP4TU+t9QiNSSHWzZnuq++2i
 8GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QGuPT6na6ZOMImjVznTFeUyZRr+VxZ3/v7FhbrE4GUA=;
 b=RxlL0Clv4CLWuY4KLV9/6TqXyvElJ3PWr/8EkhOryr+zus5OpGvbv7fZVcToehhjmX
 2Qfd6wuT+7b1iPKM70ST2cdEVVtKUqC3/zrY3Mh9wRN/xB2kMHNuA6HA6jpdT6Xg+tv1
 BmbqJ+9nuMsmZGYriXBheSYsjjawU8F41sxfdex/tDGCM+Vh/4Hr12+lT8sQvXo/JIZp
 tRZ9ZttEIsAoveF5yUAMsVY9KPyfezOSn4nya/tmVqUSB6WQDrPBFzNRXX/JPfa24jDb
 nb8u9e9aO7wDFmBlZM2I1BS5dlMGDN2Av1A6t2RvNVlYW6pHFjcbAw5bpFLVjIP34iH6
 Fz8g==
X-Gm-Message-State: AO0yUKXHwWn6pmXkCz7BDPz5an8okWGRwmzJM1geNrspHNYLS4mPQZBr
 wUSSbAx7tTep3oFJxsDAOitzJfRy3J4ep4y7
X-Google-Smtp-Source: AK7set9J4w/OnNqpxaLBd2r+/TjsfNGNdp9aE2YDg7/KTrN+fvAWVwz2kWKGVZHCZYx6lW1Ua3O34A==
X-Received: by 2002:a5d:4b90:0:b0:2c4:848:bbd4 with SMTP id
 b16-20020a5d4b90000000b002c40848bbd4mr7425919wrt.36.1676071884213; 
 Fri, 10 Feb 2023 15:31:24 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g16-20020adfe410000000b002bfae1398bbsm4629060wrm.42.2023.02.10.15.31.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 15:31:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/3] hw/rtc/mc146818rtc: Rename RTCState -> MC146818RtcState
Date: Sat, 11 Feb 2023 00:31:14 +0100
Message-Id: <20230210233116.80311-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230210233116.80311-1-philmd@linaro.org>
References: <20230210233116.80311-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

RTCState only represents a Motorola MC146818 model,
not any RTC chipset. Rename the structure as MC146818RtcState
using:

  $ sed -i -e s/RTCState/MC146818RtcState/g $(git grep -wl RTCState)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/piix4.c               |   2 +-
 hw/isa/vt82c686.c            |   2 +-
 hw/rtc/mc146818rtc.c         | 116 +++++++++++++++++------------------
 include/hw/rtc/mc146818rtc.h |   6 +-
 4 files changed, 63 insertions(+), 63 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index de60ceef73..e2fafc3b13 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -47,7 +47,7 @@ struct PIIX4State {
     qemu_irq cpu_intr;
     qemu_irq *isa;
 
-    RTCState rtc;
+    MC146818RtcState rtc;
     PCIIDEState ide;
     UHCIState uhci;
     PIIX4PMState pm;
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 3f9bd0c04d..67cbb658aa 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -550,7 +550,7 @@ struct ViaISAState {
     qemu_irq cpu_intr;
     qemu_irq *isa_irqs;
     ViaSuperIOState via_sio;
-    RTCState rtc;
+    MC146818RtcState rtc;
     PCIIDEState ide;
     UHCIState uhci[2];
     ViaPMState pm;
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index ba612a151d..08f6c0e0c5 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -71,19 +71,19 @@
 
 #define RTC_ISA_BASE 0x70
 
-static void rtc_set_time(RTCState *s);
-static void rtc_update_time(RTCState *s);
-static void rtc_set_cmos(RTCState *s, const struct tm *tm);
-static inline int rtc_from_bcd(RTCState *s, int a);
-static uint64_t get_next_alarm(RTCState *s);
+static void rtc_set_time(MC146818RtcState *s);
+static void rtc_update_time(MC146818RtcState *s);
+static void rtc_set_cmos(MC146818RtcState *s, const struct tm *tm);
+static inline int rtc_from_bcd(MC146818RtcState *s, int a);
+static uint64_t get_next_alarm(MC146818RtcState *s);
 
-static inline bool rtc_running(RTCState *s)
+static inline bool rtc_running(MC146818RtcState *s)
 {
     return (!(s->cmos_data[RTC_REG_B] & REG_B_SET) &&
             (s->cmos_data[RTC_REG_A] & 0x70) <= 0x20);
 }
 
-static uint64_t get_guest_rtc_ns(RTCState *s)
+static uint64_t get_guest_rtc_ns(MC146818RtcState *s)
 {
     uint64_t guest_clock = qemu_clock_get_ns(rtc_clock);
 
@@ -91,7 +91,7 @@ static uint64_t get_guest_rtc_ns(RTCState *s)
         guest_clock - s->last_update + s->offset;
 }
 
-static void rtc_coalesced_timer_update(RTCState *s)
+static void rtc_coalesced_timer_update(MC146818RtcState *s)
 {
     if (s->irq_coalesced == 0) {
         timer_del(s->coalesced_timer);
@@ -104,19 +104,19 @@ static void rtc_coalesced_timer_update(RTCState *s)
     }
 }
 
-static QLIST_HEAD(, RTCState) rtc_devices =
+static QLIST_HEAD(, MC146818RtcState) rtc_devices =
     QLIST_HEAD_INITIALIZER(rtc_devices);
 
 void qmp_rtc_reset_reinjection(Error **errp)
 {
-    RTCState *s;
+    MC146818RtcState *s;
 
     QLIST_FOREACH(s, &rtc_devices, link) {
         s->irq_coalesced = 0;
     }
 }
 
-static bool rtc_policy_slew_deliver_irq(RTCState *s)
+static bool rtc_policy_slew_deliver_irq(MC146818RtcState *s)
 {
     kvm_reset_irq_delivered();
     qemu_irq_raise(s->irq);
@@ -125,7 +125,7 @@ static bool rtc_policy_slew_deliver_irq(RTCState *s)
 
 static void rtc_coalesced_timer(void *opaque)
 {
-    RTCState *s = opaque;
+    MC146818RtcState *s = opaque;
 
     if (s->irq_coalesced != 0) {
         s->cmos_data[RTC_REG_C] |= 0xc0;
@@ -140,7 +140,7 @@ static void rtc_coalesced_timer(void *opaque)
     rtc_coalesced_timer_update(s);
 }
 
-static uint32_t rtc_periodic_clock_ticks(RTCState *s)
+static uint32_t rtc_periodic_clock_ticks(MC146818RtcState *s)
 {
     int period_code;
 
@@ -158,7 +158,7 @@ static uint32_t rtc_periodic_clock_ticks(RTCState *s)
  * is just due to period adjustment.
  */
 static void
-periodic_timer_update(RTCState *s, int64_t current_time, uint32_t old_period, bool period_change)
+periodic_timer_update(MC146818RtcState *s, int64_t current_time, uint32_t old_period, bool period_change)
 {
     uint32_t period;
     int64_t cur_clock, next_irq_clock, lost_clock = 0;
@@ -234,7 +234,7 @@ periodic_timer_update(RTCState *s, int64_t current_time, uint32_t old_period, bo
 
 static void rtc_periodic_timer(void *opaque)
 {
-    RTCState *s = opaque;
+    MC146818RtcState *s = opaque;
 
     periodic_timer_update(s, s->next_periodic_time, s->period, false);
     s->cmos_data[RTC_REG_C] |= REG_C_PF;
@@ -255,7 +255,7 @@ static void rtc_periodic_timer(void *opaque)
 }
 
 /* handle update-ended timer */
-static void check_update_timer(RTCState *s)
+static void check_update_timer(MC146818RtcState *s)
 {
     uint64_t next_update_time;
     uint64_t guest_nsec;
@@ -306,7 +306,7 @@ static void check_update_timer(RTCState *s)
     }
 }
 
-static inline uint8_t convert_hour(RTCState *s, uint8_t hour)
+static inline uint8_t convert_hour(MC146818RtcState *s, uint8_t hour)
 {
     if (!(s->cmos_data[RTC_REG_B] & REG_B_24H)) {
         hour %= 12;
@@ -317,7 +317,7 @@ static inline uint8_t convert_hour(RTCState *s, uint8_t hour)
     return hour;
 }
 
-static uint64_t get_next_alarm(RTCState *s)
+static uint64_t get_next_alarm(MC146818RtcState *s)
 {
     int32_t alarm_sec, alarm_min, alarm_hour, cur_hour, cur_min, cur_sec;
     int32_t hour, min, sec;
@@ -410,7 +410,7 @@ static uint64_t get_next_alarm(RTCState *s)
 
 static void rtc_update_timer(void *opaque)
 {
-    RTCState *s = opaque;
+    MC146818RtcState *s = opaque;
     int32_t irqs = REG_C_UF;
     int32_t new_irqs;
 
@@ -439,7 +439,7 @@ static void rtc_update_timer(void *opaque)
 static void cmos_ioport_write(void *opaque, hwaddr addr,
                               uint64_t data, unsigned size)
 {
-    RTCState *s = opaque;
+    MC146818RtcState *s = opaque;
     uint32_t old_period;
     bool update_periodic_timer;
 
@@ -557,7 +557,7 @@ static void cmos_ioport_write(void *opaque, hwaddr addr,
     }
 }
 
-static inline int rtc_to_bcd(RTCState *s, int a)
+static inline int rtc_to_bcd(MC146818RtcState *s, int a)
 {
     if (s->cmos_data[RTC_REG_B] & REG_B_DM) {
         return a;
@@ -566,7 +566,7 @@ static inline int rtc_to_bcd(RTCState *s, int a)
     }
 }
 
-static inline int rtc_from_bcd(RTCState *s, int a)
+static inline int rtc_from_bcd(MC146818RtcState *s, int a)
 {
     if ((a & 0xc0) == 0xc0) {
         return -1;
@@ -578,7 +578,7 @@ static inline int rtc_from_bcd(RTCState *s, int a)
     }
 }
 
-static void rtc_get_time(RTCState *s, struct tm *tm)
+static void rtc_get_time(MC146818RtcState *s, struct tm *tm)
 {
     tm->tm_sec = rtc_from_bcd(s, s->cmos_data[RTC_SECONDS]);
     tm->tm_min = rtc_from_bcd(s, s->cmos_data[RTC_MINUTES]);
@@ -597,7 +597,7 @@ static void rtc_get_time(RTCState *s, struct tm *tm)
         rtc_from_bcd(s, s->cmos_data[RTC_CENTURY]) * 100 - 1900;
 }
 
-static void rtc_set_time(RTCState *s)
+static void rtc_set_time(MC146818RtcState *s)
 {
     struct tm tm;
     g_autofree const char *qom_path = object_get_canonical_path(OBJECT(s));
@@ -609,7 +609,7 @@ static void rtc_set_time(RTCState *s)
     qapi_event_send_rtc_change(qemu_timedate_diff(&tm), qom_path);
 }
 
-static void rtc_set_cmos(RTCState *s, const struct tm *tm)
+static void rtc_set_cmos(MC146818RtcState *s, const struct tm *tm)
 {
     int year;
 
@@ -633,7 +633,7 @@ static void rtc_set_cmos(RTCState *s, const struct tm *tm)
     s->cmos_data[RTC_CENTURY] = rtc_to_bcd(s, year / 100);
 }
 
-static void rtc_update_time(RTCState *s)
+static void rtc_update_time(MC146818RtcState *s)
 {
     struct tm ret;
     time_t guest_sec;
@@ -649,7 +649,7 @@ static void rtc_update_time(RTCState *s)
     }
 }
 
-static int update_in_progress(RTCState *s)
+static int update_in_progress(MC146818RtcState *s)
 {
     int64_t guest_nsec;
 
@@ -678,7 +678,7 @@ static int update_in_progress(RTCState *s)
 static uint64_t cmos_ioport_read(void *opaque, hwaddr addr,
                                  unsigned size)
 {
-    RTCState *s = opaque;
+    MC146818RtcState *s = opaque;
     int ret;
     if ((addr & 1) == 0) {
         return 0xff;
@@ -741,21 +741,21 @@ static uint64_t cmos_ioport_read(void *opaque, hwaddr addr,
 
 void rtc_set_memory(ISADevice *dev, int addr, int val)
 {
-    RTCState *s = MC146818_RTC(dev);
+    MC146818RtcState *s = MC146818_RTC(dev);
     if (addr >= 0 && addr <= 127)
         s->cmos_data[addr] = val;
 }
 
 int rtc_get_memory(ISADevice *dev, int addr)
 {
-    RTCState *s = MC146818_RTC(dev);
+    MC146818RtcState *s = MC146818_RTC(dev);
     assert(addr >= 0 && addr <= 127);
     return s->cmos_data[addr];
 }
 
 static void rtc_set_date_from_host(ISADevice *dev)
 {
-    RTCState *s = MC146818_RTC(dev);
+    MC146818RtcState *s = MC146818_RTC(dev);
     struct tm tm;
 
     qemu_get_timedate(&tm, 0);
@@ -770,7 +770,7 @@ static void rtc_set_date_from_host(ISADevice *dev)
 
 static int rtc_pre_save(void *opaque)
 {
-    RTCState *s = opaque;
+    MC146818RtcState *s = opaque;
 
     rtc_update_time(s);
 
@@ -779,7 +779,7 @@ static int rtc_pre_save(void *opaque)
 
 static int rtc_post_load(void *opaque, int version_id)
 {
-    RTCState *s = opaque;
+    MC146818RtcState *s = opaque;
 
     if (version_id <= 2 || rtc_clock == QEMU_CLOCK_REALTIME) {
         rtc_set_time(s);
@@ -810,7 +810,7 @@ static int rtc_post_load(void *opaque, int version_id)
 
 static bool rtc_irq_reinject_on_ack_count_needed(void *opaque)
 {
-    RTCState *s = (RTCState *)opaque;
+    MC146818RtcState *s = (MC146818RtcState *)opaque;
     return s->irq_reinject_on_ack_count != 0;
 }
 
@@ -820,7 +820,7 @@ static const VMStateDescription vmstate_rtc_irq_reinject_on_ack_count = {
     .minimum_version_id = 1,
     .needed = rtc_irq_reinject_on_ack_count_needed,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT16(irq_reinject_on_ack_count, RTCState),
+        VMSTATE_UINT16(irq_reinject_on_ack_count, MC146818RtcState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -832,19 +832,19 @@ static const VMStateDescription vmstate_rtc = {
     .pre_save = rtc_pre_save,
     .post_load = rtc_post_load,
     .fields = (VMStateField[]) {
-        VMSTATE_BUFFER(cmos_data, RTCState),
-        VMSTATE_UINT8(cmos_index, RTCState),
+        VMSTATE_BUFFER(cmos_data, MC146818RtcState),
+        VMSTATE_UINT8(cmos_index, MC146818RtcState),
         VMSTATE_UNUSED(7*4),
-        VMSTATE_TIMER_PTR(periodic_timer, RTCState),
-        VMSTATE_INT64(next_periodic_time, RTCState),
+        VMSTATE_TIMER_PTR(periodic_timer, MC146818RtcState),
+        VMSTATE_INT64(next_periodic_time, MC146818RtcState),
         VMSTATE_UNUSED(3*8),
-        VMSTATE_UINT32_V(irq_coalesced, RTCState, 2),
-        VMSTATE_UINT32_V(period, RTCState, 2),
-        VMSTATE_UINT64_V(base_rtc, RTCState, 3),
-        VMSTATE_UINT64_V(last_update, RTCState, 3),
-        VMSTATE_INT64_V(offset, RTCState, 3),
-        VMSTATE_TIMER_PTR_V(update_timer, RTCState, 3),
-        VMSTATE_UINT64_V(next_alarm_time, RTCState, 3),
+        VMSTATE_UINT32_V(irq_coalesced, MC146818RtcState, 2),
+        VMSTATE_UINT32_V(period, MC146818RtcState, 2),
+        VMSTATE_UINT64_V(base_rtc, MC146818RtcState, 3),
+        VMSTATE_UINT64_V(last_update, MC146818RtcState, 3),
+        VMSTATE_INT64_V(offset, MC146818RtcState, 3),
+        VMSTATE_TIMER_PTR_V(update_timer, MC146818RtcState, 3),
+        VMSTATE_UINT64_V(next_alarm_time, MC146818RtcState, 3),
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription*[]) {
@@ -857,7 +857,7 @@ static const VMStateDescription vmstate_rtc = {
    BIOS will read it and start S3 resume at POST Entry */
 static void rtc_notify_suspend(Notifier *notifier, void *data)
 {
-    RTCState *s = container_of(notifier, RTCState, suspend_notifier);
+    MC146818RtcState *s = container_of(notifier, MC146818RtcState, suspend_notifier);
     rtc_set_memory(ISA_DEVICE(s), 0xF, 0xFE);
 }
 
@@ -873,7 +873,7 @@ static const MemoryRegionOps cmos_ops = {
 
 static void rtc_get_date(Object *obj, struct tm *current_tm, Error **errp)
 {
-    RTCState *s = MC146818_RTC(obj);
+    MC146818RtcState *s = MC146818_RTC(obj);
 
     rtc_update_time(s);
     rtc_get_time(s, current_tm);
@@ -882,7 +882,7 @@ static void rtc_get_date(Object *obj, struct tm *current_tm, Error **errp)
 static void rtc_realizefn(DeviceState *dev, Error **errp)
 {
     ISADevice *isadev = ISA_DEVICE(dev);
-    RTCState *s = MC146818_RTC(dev);
+    MC146818RtcState *s = MC146818_RTC(dev);
 
     s->cmos_data[RTC_REG_A] = 0x26;
     s->cmos_data[RTC_REG_B] = 0x02;
@@ -949,7 +949,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
 {
     DeviceState *dev;
     ISADevice *isadev;
-    RTCState *s;
+    MC146818RtcState *s;
 
     isadev = isa_new(TYPE_MC146818_RTC);
     dev = DEVICE(isadev);
@@ -969,17 +969,17 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
 }
 
 static Property mc146818rtc_properties[] = {
-    DEFINE_PROP_INT32("base_year", RTCState, base_year, 1980),
-    DEFINE_PROP_UINT16("iobase", RTCState, io_base, RTC_ISA_BASE),
-    DEFINE_PROP_UINT8("irq", RTCState, isairq, RTC_ISA_IRQ),
-    DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", RTCState,
+    DEFINE_PROP_INT32("base_year", MC146818RtcState, base_year, 1980),
+    DEFINE_PROP_UINT16("iobase", MC146818RtcState, io_base, RTC_ISA_BASE),
+    DEFINE_PROP_UINT8("irq", MC146818RtcState, isairq, RTC_ISA_IRQ),
+    DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", MC146818RtcState,
                                lost_tick_policy, LOST_TICK_POLICY_DISCARD),
     DEFINE_PROP_END_OF_LIST(),
 };
 
 static void rtc_reset_enter(Object *obj, ResetType type)
 {
-    RTCState *s = MC146818_RTC(obj);
+    MC146818RtcState *s = MC146818_RTC(obj);
 
     /* Reason: VM do suspend self will set 0xfe
      * Reset any values other than 0xfe(Guest suspend case) */
@@ -1000,14 +1000,14 @@ static void rtc_reset_enter(Object *obj, ResetType type)
 
 static void rtc_reset_hold(Object *obj)
 {
-    RTCState *s = MC146818_RTC(obj);
+    MC146818RtcState *s = MC146818_RTC(obj);
 
     qemu_irq_lower(s->irq);
 }
 
 static void rtc_build_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
-    RTCState *s = MC146818_RTC(adev);
+    MC146818RtcState *s = MC146818_RTC(adev);
     Aml *dev;
     Aml *crs;
 
@@ -1045,7 +1045,7 @@ static void rtc_class_initfn(ObjectClass *klass, void *data)
 static const TypeInfo mc146818rtc_info = {
     .name          = TYPE_MC146818_RTC,
     .parent        = TYPE_ISA_DEVICE,
-    .instance_size = sizeof(RTCState),
+    .instance_size = sizeof(MC146818RtcState),
     .class_init    = rtc_class_initfn,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_ACPI_DEV_AML_IF },
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index 45bcd6f040..11631af7e3 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -16,9 +16,9 @@
 #include "qom/object.h"
 
 #define TYPE_MC146818_RTC "mc146818rtc"
-OBJECT_DECLARE_SIMPLE_TYPE(RTCState, MC146818_RTC)
+OBJECT_DECLARE_SIMPLE_TYPE(MC146818RtcState, MC146818_RTC)
 
-struct RTCState {
+struct MC146818RtcState {
     ISADevice parent_obj;
 
     MemoryRegion io;
@@ -46,7 +46,7 @@ struct RTCState {
     Notifier clock_reset_notifier;
     LostTickPolicy lost_tick_policy;
     Notifier suspend_notifier;
-    QLIST_ENTRY(RTCState) link;
+    QLIST_ENTRY(MC146818RtcState) link;
 };
 
 #define RTC_ISA_IRQ 8
-- 
2.38.1


