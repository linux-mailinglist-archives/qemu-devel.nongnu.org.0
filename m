Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCB737092B
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 00:15:57 +0200 (CEST)
Received: from localhost ([::1]:55934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcxu0-0004Db-Kx
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 18:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcxsF-0002gX-8H
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:14:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcxsD-0002aU-CM
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619907244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQEHfDE+JrcYDdGyYEwmUMz8pjZ+sA6tQdb28AJwisA=;
 b=VYcYL72K5dzCIqlIe8LD054IYB/8Z51Y/8sTTXr+wuiSsLSXKW5xK3SbWvwD1HgnU4N4SH
 Y8mFjnPsqkXIbowfjwhDOzJAXSieaG35BL/EPtwI9oNczFJlh9704WY6udqV2IOhAdbhYO
 f+4uTpk3plHFCgWAUFoRVnFeddew8L0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-4o5PxwSqMf-0S6LRa35o_g-1; Sat, 01 May 2021 18:14:03 -0400
X-MC-Unique: 4o5PxwSqMf-0S6LRa35o_g-1
Received: by mail-wr1-f71.google.com with SMTP id
 t18-20020adfdc120000b02900ffe4432d8bso1280946wri.6
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 15:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lQEHfDE+JrcYDdGyYEwmUMz8pjZ+sA6tQdb28AJwisA=;
 b=cyNU6H1yNCmmQ9BNUmjkizfI2hvgAhvtXxbJBom77ZxsVZGx9313QPwiswJbQ+OaO2
 bNr7tk+hAoAyrLUYNos9APfpIPCJVPY3AfL2P8t8lY6Udkks0TKsi0+W11vf/IQM59MK
 fKxVlRDrUD9QhzWi40keAGwSoF+0cl6S9t3hS4kW9ajje0+pOhbELVs5s5bHWtnLJ/ni
 HMS92bghxVMcECd5rX22P4W0s8e1fCQ8Reyw1IdTaax21ta6ZKRAR1zBaFPUjgAAbmtm
 Fw2rRsdeG0qcHGD+45oyLFQPl8SRcVzL5kHJP1g5CmY7pGzE/hBMmAnNgl+6HGondo2X
 /nIw==
X-Gm-Message-State: AOAM532QTbKwBrchWr12dhj1S+kP+Gnqsft1emr2/22TdpgBUPu7yz3Y
 7AtbkkiB0eBz+O0Lbj3jskDIItn8JFXOV9YCb4gO6w3GRYxnB2CdnGWd0MF0ZVDpMEKDcQgXp5S
 x0KJM/cP+qLAmTm8r1vIZN4z0jg7Mfxo8aOOTLKcWkRoKwljqTLl1OtdaUWPiimT6
X-Received: by 2002:a5d:6210:: with SMTP id y16mr15892470wru.13.1619907241927; 
 Sat, 01 May 2021 15:14:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQHwpfvfIJRwsYDv7KMkyDsDIT5KfLJX+LbxJJ0zjyzb+SEoi6oEYhuwRfHS3q4UTm6agdWw==
X-Received: by 2002:a5d:6210:: with SMTP id y16mr15892455wru.13.1619907241801; 
 Sat, 01 May 2021 15:14:01 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id q7sm7006742wrr.62.2021.05.01.15.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 15:14:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] hw/rtc/mc146818rtc: Convert to 3-phase reset
 (Resettable interface)
Date: Sun,  2 May 2021 00:13:50 +0200
Message-Id: <20210501221350.501946-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210501221350.501946-1-philmd@redhat.com>
References: <20210501221350.501946-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

TYPE_MC146818_RTC is an ISA device, so its DeviceClass::reset()
handler is called automatically when its qbus parent is reset
(we don't need to register it manually).

We have 2 reset() methods: a generic one and the qdev one.
Merge them into a reset_enter handler (keeping the IRQ lowering
to a reset_exit one), and remove the qemu_register_reset() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/rtc/mc146818rtc.c | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 5d0fcacd0c0..6bf075ba8ce 100644
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
 
@@ -998,15 +981,32 @@ static Property mc146818rtc_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void rtc_resetdev(DeviceState *d)
+static void rtc_reset_enter(Object *obj, ResetType type)
 {
-    RTCState *s = MC146818_RTC(d);
+    RTCState *s = MC146818_RTC(obj);
 
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
+
+    if (s->lost_tick_policy == LOST_TICK_POLICY_SLEW) {
+        s->irq_coalesced = 0;
+        s->irq_reinject_on_ack_count = 0;
+    }
+}
+
+static void rtc_reset_exit(Object *obj)
+{
+    RTCState *s = MC146818_RTC(obj);
+
+    qemu_irq_lower(s->irq);
 }
 
 static void rtc_build_aml(ISADevice *isadev, Aml *scope)
@@ -1033,11 +1033,13 @@ static void rtc_build_aml(ISADevice *isadev, Aml *scope)
 static void rtc_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
 
     dc->realize = rtc_realizefn;
-    dc->reset = rtc_resetdev;
     dc->vmsd = &vmstate_rtc;
+    rc->phases.enter = rtc_reset_enter;
+    rc->phases.exit = rtc_reset_exit;
     isa->build_aml = rtc_build_aml;
     device_class_set_props(dc, mc146818rtc_properties);
 }
-- 
2.26.3


