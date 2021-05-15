Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD332381784
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:14:51 +0200 (CEST)
Received: from localhost ([::1]:50652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhrJq-0001ec-I4
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9O-00064k-7j; Sat, 15 May 2021 06:04:02 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:60909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9K-0006W1-TE; Sat, 15 May 2021 06:04:01 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N1feo-1lWoWG33Si-0124Cv; Sat, 15
 May 2021 12:03:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/16] hw/rtc/mc146818rtc: Convert to 3-phase reset (Resettable
 interface)
Date: Sat, 15 May 2021 12:03:28 +0200
Message-Id: <20210515100335.1245468-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
References: <20210515100335.1245468-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ySd+7Fq0UBm4acjQNPswWkZ/9+YxobsWOAU0iX+t/iA/u0MQgWp
 6EcymnmUUA5OepU7CBj0ciWPxHSyXP58ewumiZ17MNyrF76lHEEn3Lg9ZI3JCkfMCcIz+pn
 3MIE3Uzox6dCxmpPmGUHi26IWPNVwx8Q25yiDG+Ma+KEqxtcXTvSIvNUXeGmJifDQTzMwAg
 bPtvfyZIQ/72yqupNDQlg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SOI2ISj2HnM=:O7wbSuzFVJrCnMEHCPasEY
 cu837r8zjq9+yo9+LzF3Gd52xbVpw2TgIpMOahxf/nHFQkwfYz+9dBaXzjJCGiJaaIQ1U4lCI
 9VIxELb+4F11Nug3PKQcj5+HBsdgHoEP6dolYe6+0qH+1YBgXTu2jNzzx855ZqBYGctQITa7z
 3IOyBjFl0/8EL04yvfIfVo5zOZC/hl8UGgz0YFm7k6KGC5B/qL5yT8JpKBFhgYdm4KcVP2A6Z
 /9ateLagfFyCloIL3by6J/0M1WHXvrEBT90LPLtpD4C2Ze/2QjJ5wmzEVSRZwB44Un82OW2ti
 ykaRfhadkdNa9CT4Sx6thRDmRnAk2Zr6GW+PDDvJHU3m/xx3xcqXIJP1aclsfr5/+44KC9Cbl
 HHopIbJ8YUKH3EK0lLx0CgatPeAXYVsSXPfEO37NpDo0EUMMvVVe5/tkh8qXd0/Ug1m7WBDS/
 ZwRI93S+kH2LXs7bUr2YuEU/T5eEU101LlHmkzb3f13tWBEeokL4x4F91tqj/62LzRTFihiBe
 HiHBAFMhk+BVO69uxZo9NI=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

TYPE_MC146818_RTC is an ISA device, so its DeviceClass::reset()
handler is called automatically when its qbus parent is reset
(we don't need to register it manually).

We have 2 reset() methods: a generic one and the qdev one.
Merge them into a reset_enter handler (keeping the IRQ lowering
to a reset_hold one), and remove the qemu_register_reset() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-Id: <20210502163931.552675-3-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/rtc/mc146818rtc.c | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 3d2d3854e716..4fbafddb226d 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -871,22 +871,6 @@ static void rtc_notify_suspend(Notifier *notifier, void *data)
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
@@ -961,7 +945,6 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
     memory_region_add_coalescing(&s->coalesced_io, 0, 1);
 
     qdev_set_legacy_instance_id(dev, RTC_ISA_BASE, 3);
-    qemu_register_reset(rtc_reset, s);
 
     object_property_add_tm(OBJECT(s), "date", rtc_get_date);
 
@@ -997,15 +980,32 @@ static Property mc146818rtc_properties[] = {
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
+static void rtc_reset_hold(Object *obj)
+{
+    RTCState *s = MC146818_RTC(obj);
+
+    qemu_irq_lower(s->irq);
 }
 
 static void rtc_build_aml(ISADevice *isadev, Aml *scope)
@@ -1032,11 +1032,13 @@ static void rtc_build_aml(ISADevice *isadev, Aml *scope)
 static void rtc_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
 
     dc->realize = rtc_realizefn;
-    dc->reset = rtc_resetdev;
     dc->vmsd = &vmstate_rtc;
+    rc->phases.enter = rtc_reset_enter;
+    rc->phases.hold = rtc_reset_hold;
     isa->build_aml = rtc_build_aml;
     device_class_set_props(dc, mc146818rtc_properties);
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-- 
2.31.1


