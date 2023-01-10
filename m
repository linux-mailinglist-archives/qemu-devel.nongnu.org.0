Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685AD663E8C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 11:48:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFBKd-0002VW-Jh; Tue, 10 Jan 2023 04:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFBKZ-0002Sh-Vd
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:54:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFBKY-0002kU-BE
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673344445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pe6YZFrDE63l1M5+V9HHnnK0BFcLeZS+MIYp2iMkSIs=;
 b=fUcyg/U71rsb7cwk2MUBAFIJStwM5iGa6F9V8TbNXfll/z+5hynnRkvYdGr6OJmjs2woNd
 xvBjZQS2ZcGnYkpY/0OixyAJrTBtVArS72G0iT2uKuj4HjN/sF6Xp/xMgZOJk1WhPGGdK+
 qYRpEgjXvW0rPLnrz0vuY5EvV6Gq7do=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-bQvlFxvtO--R1xPOpugX9Q-1; Tue, 10 Jan 2023 04:54:03 -0500
X-MC-Unique: bQvlFxvtO--R1xPOpugX9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 141FB802D2A;
 Tue, 10 Jan 2023 09:54:03 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2028E4085720;
 Tue, 10 Jan 2023 09:54:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Michael S Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v6 3/4] hw/rtc/mc146818rtc: Make the mc146818 RTC device
 target independent
Date: Tue, 10 Jan 2023 10:53:50 +0100
Message-Id: <20230110095351.611724-4-thuth@redhat.com>
In-Reply-To: <20230110095351.611724-1-thuth@redhat.com>
References: <20230110095351.611724-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The only reason for this code being target dependent was the IRQ-counting
related code in rtc_policy_slew_deliver_irq(). Since these functions have
been moved into a new, separate file (kvm_irqcount.c) which is now always
compiled and linked if necessary, we can get rid of the #ifdef TARGET_I386
switches in mc146818rtc.c and declare it in the softmmu_ss instead of
specific_ss, so that the code only gets compiled once for all targets.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/rtc/mc146818rtc.h |  1 +
 hw/rtc/mc146818rtc.c         | 14 --------------
 hw/rtc/meson.build           |  3 +--
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index 1db0fcee92..45bcd6f040 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -55,5 +55,6 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
                              qemu_irq intercept_irq);
 void rtc_set_memory(ISADevice *dev, int addr, int val);
 int rtc_get_memory(ISADevice *dev, int addr);
+void qmp_rtc_reset_reinjection(Error **errp);
 
 #endif /* HW_RTC_MC146818RTC_H */
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 947d68c257..bc1192b7ae 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -45,10 +45,6 @@
 #include "qapi/visitor.h"
 #include "hw/rtc/mc146818rtc_regs.h"
 
-#ifdef TARGET_I386
-#include "qapi/qapi-commands-misc-target.h"
-#endif
-
 //#define DEBUG_CMOS
 //#define DEBUG_COALESCED
 
@@ -112,7 +108,6 @@ static void rtc_coalesced_timer_update(RTCState *s)
 static QLIST_HEAD(, RTCState) rtc_devices =
     QLIST_HEAD_INITIALIZER(rtc_devices);
 
-#ifdef TARGET_I386
 void qmp_rtc_reset_reinjection(Error **errp)
 {
     RTCState *s;
@@ -145,13 +140,6 @@ static void rtc_coalesced_timer(void *opaque)
 
     rtc_coalesced_timer_update(s);
 }
-#else
-static bool rtc_policy_slew_deliver_irq(RTCState *s)
-{
-    assert(0);
-    return false;
-}
-#endif
 
 static uint32_t rtc_periodic_clock_ticks(RTCState *s)
 {
@@ -922,12 +910,10 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
     rtc_set_date_from_host(isadev);
 
     switch (s->lost_tick_policy) {
-#ifdef TARGET_I386
     case LOST_TICK_POLICY_SLEW:
         s->coalesced_timer =
             timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
         break;
-#endif
     case LOST_TICK_POLICY_DISCARD:
         break;
     default:
diff --git a/hw/rtc/meson.build b/hw/rtc/meson.build
index dc33973384..34a4d316fa 100644
--- a/hw/rtc/meson.build
+++ b/hw/rtc/meson.build
@@ -13,5 +13,4 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_rtc.c'))
 softmmu_ss.add(when: 'CONFIG_GOLDFISH_RTC', if_true: files('goldfish_rtc.c'))
 softmmu_ss.add(when: 'CONFIG_LS7A_RTC', if_true: files('ls7a_rtc.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-rtc.c'))
-
-specific_ss.add(when: 'CONFIG_MC146818RTC', if_true: files('mc146818rtc.c'))
+softmmu_ss.add(when: 'CONFIG_MC146818RTC', if_true: files('mc146818rtc.c'))
-- 
2.31.1


