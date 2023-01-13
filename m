Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92323669D2E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:06:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMIw-0003RP-6y; Fri, 13 Jan 2023 10:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIM-00036R-T3
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:47 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIK-0006bW-7w
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:41 -0500
Received: by mail-wm1-x332.google.com with SMTP id ay40so15565566wmb.2
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNrQ3qjy9n5lhxoh2Nx8ipN2K6i00834cU19JgIQQjA=;
 b=hAqvUSltCtM0WGXRMcPU2vLhEx/ly9W8vJQWPxx/LJG4jA+vG86Iove/12C9YktyX1
 pZkoGkKOGG0vuH8OfcJMkR8YJwn0Qa5+LgGcNn7l250/vBBfkJl6w64Pw36P4ycyAvRB
 DU+j8GLchx9EQGwcZy0Wjijey8NMU87WhKhwK3F+rtPxDBM6WtjjjPGfvVb4mXfMt1Ip
 OZzxIzRszlUvc3p5CnSXDHK6oS1SXJVRHyoJdvqGgs5bunYpj4QXX5eU2X+rDwOZSuZb
 gcx+bN939XOAtL+R+5SVe/GU7BF4FDOFN9YOnCL1BwxVeQ5QOom5d+H9YKq2uxg2enwt
 Jwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNrQ3qjy9n5lhxoh2Nx8ipN2K6i00834cU19JgIQQjA=;
 b=BstHbwXDmvo3mFe28C9+7FZRas3rnNNqbB8xurcl82Etbn5cIZtMTNVaVCet6eI1dg
 5NZjYvt45PwWWPAIiJ/P4GXY+CWgFGp2LcfkzCe03MaJt7MnoLx3BnYZT/X8kJOAh3a6
 CIeVhuTvNBSiXlW0a2Y+hsv4rMChrbvYN5zCCT+KTpftRF64AJJBksk94FNaO5D3Lc7A
 Bke7Pz9KUKLzDNQf1P73H9dbqT6wNxYlTuKsEOfQhdFRy2mKezNa7hlcVwXWAmTfkC+S
 E1S9w/bDOhr0SjaNjJ7Bykktpb/9eNrohGBRpuBbG5Z6U1uxDzTWfjlg7rFjIyGgnhSO
 Lthw==
X-Gm-Message-State: AFqh2kqj++RKr9MVMsXDG2Tm9ouVuLEMbLV5QBtrbvb1zzvdmMsOdVkB
 YFFyAFuA8+2stybrtiC9LPPX6M7R33/C05/0
X-Google-Smtp-Source: AMrXdXv8sRPlBFPbKx73f67lGoxSa9/GNxbS7ZZhPLJL9ZtkwoMU1osdcSQl3D3vs7Ks1i7/NDyQ+w==
X-Received: by 2002:a05:600c:4153:b0:3da:f0a:83d7 with SMTP id
 h19-20020a05600c415300b003da0f0a83d7mr7628666wmm.8.1673624918471; 
 Fri, 13 Jan 2023 07:48:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003d974076f13sm27186156wmo.3.2023.01.13.07.48.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:48:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 38/46] hw/rtc/mc146818rtc: Make the mc146818 RTC device target
 independent
Date: Fri, 13 Jan 2023 16:45:24 +0100
Message-Id: <20230113154532.49979-39-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

From: Thomas Huth <thuth@redhat.com>

The only reason for this code being target dependent was the IRQ-counting
related code in rtc_policy_slew_deliver_irq(). Since these functions have
been moved into a new, separate file (kvm_irqcount.c) which is now always
compiled and linked if necessary, we can get rid of the #ifdef TARGET_I386
switches in mc146818rtc.c and declare it in the softmmu_ss instead of
specific_ss, so that the code only gets compiled once for all targets.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20230110095351.611724-4-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/rtc/mc146818rtc.c         | 14 --------------
 hw/rtc/meson.build           |  3 +--
 include/hw/rtc/mc146818rtc.h |  1 +
 3 files changed, 2 insertions(+), 16 deletions(-)

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
-- 
2.38.1


