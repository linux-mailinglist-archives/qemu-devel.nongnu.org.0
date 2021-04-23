Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B404B369D84
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:41:06 +0200 (CEST)
Received: from localhost ([::1]:43238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la5Q1-0006Nk-S4
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la5MC-00043T-Au; Fri, 23 Apr 2021 19:37:11 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la5MA-0007n7-Ly; Fri, 23 Apr 2021 19:37:07 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e7so40881932wrs.11;
 Fri, 23 Apr 2021 16:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oXtiyIQkCO8DxortvAo+V9Aj7SVkgMJYsUxCMH52wCs=;
 b=jv+VRfvZUhBnpJTBeeLznRttupVWrlECaC6n7LgyfOQcUaY8t7LGetWmzYb/1S4gqC
 hTuXHcPGf3FKNUft+OO1h6gMlwrcI09n0YWqskFRYNlsy/KPFDSyjHs0gE6ukOediKMr
 jblo1B4tIiJRlUVhBZRGBWNvleeYjhyyLGxvycx8M+5tIhy0mTAyUFvS1n/stjdy6r+U
 fd5uM1VyDREa+rpRFIYX2iUcadLS1M95zjhS9cI9eVVwY3QZzWSj2vWUUqUYmDsxoLYw
 ELxOvIpq/q6Y6shjXlLu8wVrOyMDCN/Br4HqXGwqBuFeB3b6RfBGtWERbd63vbnA3/Fs
 Jukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oXtiyIQkCO8DxortvAo+V9Aj7SVkgMJYsUxCMH52wCs=;
 b=WH+BeJ6u5WyX+giWicRLtr+sfmZCaWJSfrKkFxXCuVqthp3B7u4GUVDggwvBn6u15v
 Od02hTTLShoaGFRDulNtVYSZagM0dfKuVwOpGrBpZKHBA0ym4KUJP/tymfO8AfRPU8EX
 rzfSOM+cBPTG3meGOuHIcpd+18JUYXX/mm0F9W3NWLK6wpXw20JzEGxktad5wiXphY8A
 FIR8ggKTP1Or9Q4cn0Qxd0SZ48336TbsQ0FsNpWtdyuFBgMKTIqaUripo68CRSSSO+T3
 M/3y2tzI/sDIdFPN45VUoKrHlRqo16SweR4Xrs78nDg9B5pd12LkxCVZBvdT3e3yNusq
 Xwvg==
X-Gm-Message-State: AOAM533Y17z0nV5HcN1orJYGrKVxovr8BWSo6C+QfDuoCeVg89ZGzOhR
 qvO2L8C5mxgQzefc/TkCTZIFlfAckE40tw==
X-Google-Smtp-Source: ABdhPJxrMmmh0ioykZVerL75uE4P5wwgPKgGaUOt13ZznflJtHcooYKLd3ovxMsX8IZZChKuIbU8Ww==
X-Received: by 2002:a5d:460b:: with SMTP id t11mr7681781wrq.310.1619221024310; 
 Fri, 23 Apr 2021 16:37:04 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u9sm9514035wmc.38.2021.04.23.16.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 16:37:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/rtc/mc146818rtc: Qdev'ify reset()
Date: Sat, 24 Apr 2021 01:36:52 +0200
Message-Id: <20210423233652.3042941-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210423233652.3042941-1-f4bug@amsat.org>
References: <20210423233652.3042941-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_MC146818_RTC is an ISA device, so its DeviceClass::reset()
handler is called automatically when its qbus parent is reset.

We have 2 reset() methods: a generic one and the qdev one.
Merge them into the qdev reset handler, rename it, and remove
the qemu_register_reset() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/rtc/mc146818rtc.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 5d0fcacd0c0..710adeb9aaa 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -872,22 +872,6 @@ static void rtc_notify_suspend(Notifier *notifier, void *data)
     rtc_set_memory(ISA_DEVICE(s), 0xF, 0xFE);
 }
 
-static void rtc_reset(void *opaque)
-{
-    RTCState *s = opaque;
-
-    s->cmos_data[RTC_REG_B] &= ~(REG_B_PIE | REG_B_AIE | REG_B_SQWE);
-    s->cmos_data[RTC_REG_C] &= ~(REG_C_UF | REG_C_IRQF | REG_C_PF | REG_C_AF);
-    check_update_timer(s);
-
-    qemu_irq_lower(s->irq);
-
-    if (s->lost_tick_policy == LOST_TICK_POLICY_SLEW) {
-        s->irq_coalesced = 0;
-        s->irq_reinject_on_ack_count = 0;
-    }
-}
-
 static const MemoryRegionOps cmos_ops = {
     .read = cmos_ioport_read,
     .write = cmos_ioport_write,
@@ -962,7 +946,6 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
     memory_region_add_coalescing(&s->coalesced_io, 0, 1);
 
     qdev_set_legacy_instance_id(dev, RTC_ISA_BASE, 3);
-    qemu_register_reset(rtc_reset, s);
 
     object_property_add_tm(OBJECT(s), "date", rtc_get_date);
 
@@ -998,17 +981,29 @@ static Property mc146818rtc_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void rtc_resetdev(DeviceState *d)
+static void rtc_reset(DeviceState *dev)
 {
-    RTCState *s = MC146818_RTC(d);
+    RTCState *s = MC146818_RTC(dev);
 
     /* Reason: VM do suspend self will set 0xfe
      * Reset any values other than 0xfe(Guest suspend case) */
     if (s->cmos_data[0x0f] != 0xfe) {
         s->cmos_data[0x0f] = 0x00;
     }
+
+    s->cmos_data[RTC_REG_B] &= ~(REG_B_PIE | REG_B_AIE | REG_B_SQWE);
+    s->cmos_data[RTC_REG_C] &= ~(REG_C_UF | REG_C_IRQF | REG_C_PF | REG_C_AF);
+    check_update_timer(s);
+
+    qemu_irq_lower(s->irq);
+
+    if (s->lost_tick_policy == LOST_TICK_POLICY_SLEW) {
+        s->irq_coalesced = 0;
+        s->irq_reinject_on_ack_count = 0;
+    }
 }
 
+
 static void rtc_build_aml(ISADevice *isadev, Aml *scope)
 {
     Aml *dev;
@@ -1036,7 +1031,7 @@ static void rtc_class_initfn(ObjectClass *klass, void *data)
     ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
 
     dc->realize = rtc_realizefn;
-    dc->reset = rtc_resetdev;
+    dc->reset = rtc_reset;
     dc->vmsd = &vmstate_rtc;
     isa->build_aml = rtc_build_aml;
     device_class_set_props(dc, mc146818rtc_properties);
-- 
2.26.3


