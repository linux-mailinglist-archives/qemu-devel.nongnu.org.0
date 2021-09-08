Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B2B403CB5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:43:18 +0200 (CEST)
Received: from localhost ([::1]:45164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzjJ-0002LY-Ig
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzc3-0004Ig-24
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:47 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:43337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzbz-0003w6-DO
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:46 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MTznO-1mXJGW0HL8-00QxnB; Wed, 08
 Sep 2021 17:35:34 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/12] mac_via: move VIA1 reset logic from mac_via_reset() to
 mos6522_q800_via1_reset()
Date: Wed,  8 Sep 2021 17:35:24 +0200
Message-Id: <20210908153529.453843-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908153529.453843-1-laurent@vivier.eu>
References: <20210908153529.453843-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mGRE4x8hf0sqPHDyJhnCWll5dtKJ6b1Ftu7E3x+HH70PeAAE2wH
 PXbHV9mXIFTWWsmZY6be1aAqyqBvugaXxNLO9JaehR1ChdelP4I8rPdwcRe9JFDbPWydFwf
 6a+kKLQW2uadgSBEHhPVbmSsyWOc2peXlHwoCRW46faFvI9Mw6NuminTD068bt47ixmCkTu
 aOYkoTJtXaLV1FrXbg6qg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lUCLxtEORvw=:UpoWr/uSNVl6L+HYOJuHQf
 hciQSfse7a2G11RpO4Pmy2So8VMm1YBIBBQdomA6rfawWc0bBeRt3GA5nkDAR3WSlEcV1ZtMR
 vv2UFg0GFBbsLrRQ+43UJ+YUrTst3kvP+74gr8bAKi0lefpK9f0AaCkj1gjjFvsVSb/x8Vs6j
 VgEbSJUib2P5D+q9gAB7+RnOqzWuZdC9fB7paLpMLO0XvglLXDVFiSgMYugFgyWsxuJu4rHuA
 LShH07EmZbM2o5oDSNzFWQnFWoFy3FJ+//CiFw0DkGpprAMR4yRHkjyigHX7YqS6qZ4VWz/Ti
 EB9+1/+RCXFeVjyy6BPQYhROoVqcxpDoypme62JX/iLo/BUSvU9+fBOpd0asA2f+cnFBKvHeo
 SoBFn67Y9QdesJp2wF/KIusDruxBJ9alMiNkt1O+6aztTF2WloRW8fJPBvZWSPdGtvUaqjJb2
 fTbU0id9Dp+NTZ6zf1gyWzxVACYZOYMQEQLGpGV58isCqL38dpRj10UrFHfKDDfRxORfLbP0G
 /Bnm2iIWxRc6NSloQM2spa7zOOhYnD7haNh1I/7nUbm2PZbOeCxy+XAKUGSzpHmqSxLK33rhb
 fl5OFo2YAvo+T6bafb1q0Mze5Jo1sEzeeKyCmaBxerG7+d7RUNhUu00YU7eelup6YIIQe9qft
 vULlrBZFEDjmdX1h7R26vfTkFUZtl0IJ7MhCAppOYwaaInjwjnvKfLGBseCGn6+1sBIHBPdMD
 MZp5gPjU8vMjIT2t/3qs5YYw4lie5EPoNtl4Fg==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

After this change mac_via_reset() is now empty and can be removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210830102447.10806-8-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mac_via.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 47e221dd88cf..a2df17d9bed1 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -945,18 +945,6 @@ static const MemoryRegionOps mos6522_q800_via2_ops = {
     },
 };
 
-static void mac_via_reset(DeviceState *dev)
-{
-    MacVIAState *m = MAC_VIA(dev);
-    MOS6522Q800VIA1State *v1s = &m->mos6522_via1;
-    ADBBusState *adb_bus = &v1s->adb_bus;
-
-    adb_set_autopoll_enabled(adb_bus, true);
-
-    v1s->cmd = REG_EMPTY;
-    v1s->alt = REG_EMPTY;
-}
-
 static void mac_via_realize(DeviceState *dev, Error **errp)
 {
     MacVIAState *m = MAC_VIA(dev);
@@ -1072,7 +1060,6 @@ static void mac_via_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = mac_via_realize;
-    dc->reset = mac_via_reset;
 }
 
 static TypeInfo mac_via_info = {
@@ -1086,8 +1073,10 @@ static TypeInfo mac_via_info = {
 /* VIA 1 */
 static void mos6522_q800_via1_reset(DeviceState *dev)
 {
-    MOS6522State *ms = MOS6522(dev);
+    MOS6522Q800VIA1State *v1s = MOS6522_Q800_VIA1(dev);
+    MOS6522State *ms = MOS6522(v1s);
     MOS6522DeviceClass *mdc = MOS6522_GET_CLASS(ms);
+    ADBBusState *adb_bus = &v1s->adb_bus;
 
     mdc->parent_reset(dev);
 
@@ -1095,6 +1084,11 @@ static void mos6522_q800_via1_reset(DeviceState *dev)
     ms->timers[1].frequency = VIA_TIMER_FREQ;
 
     ms->b = VIA1B_vADB_StateMask | VIA1B_vADBInt | VIA1B_vRTCEnb;
+
+    /* ADB/RTC */
+    adb_set_autopoll_enabled(adb_bus, true);
+    v1s->cmd = REG_EMPTY;
+    v1s->alt = REG_EMPTY;
 }
 
 static void mos6522_q800_via1_init(Object *obj)
-- 
2.31.1


