Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361E63EA239
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:41:39 +0200 (CEST)
Received: from localhost ([::1]:46020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7DW-00028i-77
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76K-0005FD-Ss
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:12 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76G-0007ph-7A
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:12 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 f12-20020a05600c4e8c00b002e6bdd6ffe2so799790wmq.5
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eLtRSxQp9aI5LH5KqNaJoE/wJcjISdPkDQo/OmFkPck=;
 b=jI744wL1TpAKshvebWyfa5xIKsxb8m3hnKx8eqvE8b0XD+xEzYhadWHloHSkAZ1BLr
 TFXYVFCy3FN6clRnCrJ8uKNm3EJZE7hsPNTacs55Ag8gQqN+CXmslOUs6nacu9ePWRl8
 tpI+o5unD0sVHCyNO13VDSC+nHHwc7+RvVDzMS1sRNSbqVSgv2VAfzYs8JmfIQDtNlFV
 dVys1bwN70MI5ctMGKDum9YgbXYC/l6+XaX7Kkf49TqEmcP7T1VC36zm9RdPoGLu74OP
 sCtE2ntUboyemN3PHtcEBvOznee+WeGbsHFliZRYFU5CBlnoj3SIWx7Ejb3gM90JZkrY
 fXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eLtRSxQp9aI5LH5KqNaJoE/wJcjISdPkDQo/OmFkPck=;
 b=MvEuuNjh9cbvHkRb+Qas0yUKIdVQVKOIH8wViIsXTIwJuxW2ZNK3BriCYNW9H0BTIq
 8B+s7/4HChgwBuMLJ1aWF1mZUP/+jRs0EMpIziPRTZNHPSFZBkVhRnxXQ0HyR/yB7mPQ
 Sue3Xah5mNxUr8R4ikvR6szit/HyIe4Vqw6jAXubb2WUAkJTJq3imtPrVE0ffkgpr2Ln
 qT4fcpX7q5BBiPEKnaAZPAnP0Qyw70vt+Cr2m01uaR94uqFPEmkHIm4DCcGhgLHdix/N
 d7qNdhZM+jZ2dH0yh2x3MrOgTAYfQB6ymq0e41a7wnxafeOydMQXxhXJI/YDXvmMtBd8
 baCA==
X-Gm-Message-State: AOAM530EIrTRnxvDsCKFuAH8oEVwWNlyC31af2UIQ/WXpVnedFACeH+n
 Kcy2+9DwZxumccRQ0TJ/Gr/X/Q==
X-Google-Smtp-Source: ABdhPJzC5rHmFrcMWttRQdGnhLdxmiCm/iTcX2cq90mMKBFEgAP+nIFL880sqhjPGxZIXGNj8Gg6XQ==
X-Received: by 2002:a1c:a905:: with SMTP id s5mr13589971wme.16.1628760846668; 
 Thu, 12 Aug 2021 02:34:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 08/25] hw/arm/mps2.c: Connect up armv7m clocks
Date: Thu, 12 Aug 2021 10:33:39 +0100
Message-Id: <20210812093356.1946-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connect up the armv7m clocks on the mps2-an385/386/500/511.

Connect up the armv7m object's clocks on the MPS boards defined in
mps2.c.  The documentation for these FPGA images doesn't specify what
systick reference clock is used (if any), so for the moment we
provide a 1MHz refclock, which will result in no behavioural change
from the current hardwired 1MHz clock implemented in
armv7m_systick.c:systick_scale().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 81413b7133e..3671f49ad7b 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -86,6 +86,7 @@ struct MPS2MachineState {
     CMSDKAPBWatchdog watchdog;
     CMSDKAPBTimer timer[2];
     Clock *sysclk;
+    Clock *refclk;
 };
 
 #define TYPE_MPS2_MACHINE "mps2"
@@ -99,6 +100,15 @@ OBJECT_DECLARE_TYPE(MPS2MachineState, MPS2MachineClass, MPS2_MACHINE)
 /* Main SYSCLK frequency in Hz */
 #define SYSCLK_FRQ 25000000
 
+/*
+ * The Application Notes don't say anything about how the
+ * systick reference clock is configured. (Quite possibly
+ * they don't have one at all.) This 1MHz clock matches the
+ * pre-existing behaviour that used to be hardcoded in the
+ * armv7m_systick implementation.
+ */
+#define REFCLK_FRQ (1 * 1000 * 1000)
+
 /* Initialize the auxiliary RAM region @mr and map it into
  * the memory map at @base.
  */
@@ -146,6 +156,9 @@ static void mps2_common_init(MachineState *machine)
     mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
     clock_set_hz(mms->sysclk, SYSCLK_FRQ);
 
+    mms->refclk = clock_new(OBJECT(machine), "REFCLK");
+    clock_set_hz(mms->refclk, REFCLK_FRQ);
+
     /* The FPGA images have an odd combination of different RAMs,
      * because in hardware they are different implementations and
      * connected to different buses, giving varying performance/size
@@ -223,6 +236,8 @@ static void mps2_common_init(MachineState *machine)
     default:
         g_assert_not_reached();
     }
+    qdev_connect_clock_in(armv7m, "cpuclk", mms->sysclk);
+    qdev_connect_clock_in(armv7m, "refclk", mms->refclk);
     qdev_prop_set_string(armv7m, "cpu-type", machine->cpu_type);
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     object_property_set_link(OBJECT(&mms->armv7m), "memory",
-- 
2.20.1


