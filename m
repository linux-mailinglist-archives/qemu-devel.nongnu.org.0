Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C100F45151B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 21:23:14 +0100 (CET)
Received: from localhost ([::1]:52310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmiVV-0003KE-Tm
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 15:23:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmiSI-0006Oz-3J
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 15:19:55 -0500
Received: from [2a00:1450:4864:20::333] (port=35436
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmiSF-0001wY-1H
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 15:19:53 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so236085wme.0
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 12:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/FrkFAbtSj7hzBVDrw01oKq3F/1xZxwyEpzR3lX7oDg=;
 b=Kylfp+Gui4WPeSZsM6GOeYTN0xf/SFLTnkhK6B203QzpZmFP4DwLsVkfxhcDapeoo5
 2u8RJm5m3PK8bPdCz16JODMt6njyhiz7NBF4/QMRflDpIHQCaQsWZ9ScpRsmVVmPhhCt
 aCwJViteF3kUYbrHQRAiC3sseWhGV+aAoK5Z9fLGDoVLUk/vp3SggNBJKde68Zb2b1Np
 PDug6Lw02dsROY+1Ysvx99yu5LNWgenplBmjrU56FS7beYVgn0boTSEHfyQ7m1Tbp1KP
 1ox418c5/VOOEpKbixJtIfj5JIu4fS5V4mlkBTE6/phgaRE0B64x0JFov9MqD27ttxKo
 sN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/FrkFAbtSj7hzBVDrw01oKq3F/1xZxwyEpzR3lX7oDg=;
 b=4/uvZzL4u8/w53KXVGLafgrf9mXQ6V+jnVaOx+h+7C5CXDVeB9SmeQXndQkty4C96r
 3qjB2DsKbJN+sXpGwOlGnbXEOcBCRHTvP3z/DVGrCEAXz3vRokBHbQOTwdBmXh8hI8MY
 2avrcp8ilyJ1i1bhbIfyFQBr42rM5l9Z7Qgk7Sh05r2mk/cTd4RnrE7uFcRguYZrtSWo
 6/BDuv4GFNTRP8aORQuiwp5IQr3H7h6GRJLr6uN7qTAGhUtmjJhi3oN+dgBNXKej/N0f
 V4NHoj/YeiWpTXPfzojxQLyXhpgF9tVjZfFZwm/Y8aakE5djEVAtm+3EYHf5NjbTQN2f
 CT/Q==
X-Gm-Message-State: AOAM530mJu+lClaaDE8+hyw0FGQUPu7CWBkVslb26ZW7Uq/P3wf8TSZg
 ZDHAcx+aANmAGLijPUMuG6kDDSiWtp46Ng==
X-Google-Smtp-Source: ABdhPJwFl+ImXnDxpOHNJsPs+F3TI4doNAGCttjqJNQuRjvrsV6AvhFpNXM+Tb/BMEQAEuuwpw4Zkg==
X-Received: by 2002:a05:600c:4e07:: with SMTP id
 b7mr59920769wmq.8.1637007589422; 
 Mon, 15 Nov 2021 12:19:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm15419033wrs.48.2021.11.15.12.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 12:19:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] hw/intc/arm_gicv3: Set GICR_TYPER.Last correctly when
 nb_redist_regions > 1
Date: Mon, 15 Nov 2021 20:19:44 +0000
Message-Id: <20211115201946.327770-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115201946.327770-1-peter.maydell@linaro.org>
References: <20211115201946.327770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'Last' bit in the GICR_TYPER GICv3 redistributor register is
supposed to be set to 1 if this is the last redistributor in a series
of contiguous redistributor pages.  Currently we set Last only for
the redistributor for CPU (num_cpu - 1).  This only works if there is
a single redistributor region; if there are multiple redistributor
regions then we need to set the Last bit for the last redistributor
in each region.

This doesn't cause any problems currently because only the KVM GICv3
supports multiple redistributor regions, and it ignores the value in
GICv3State::gicr_typer.  But we need to fix this before we can enable
support for multiple regions in the emulated GICv3.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/arm_gicv3_common.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 8e47809398b..8de9205b386 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -297,7 +297,7 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
 static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
 {
     GICv3State *s = ARM_GICV3_COMMON(dev);
-    int i, rdist_capacity;
+    int i, rdist_capacity, cpuidx;
 
     /* revision property is actually reserved and currently used only in order
      * to keep the interface compatible with GICv2 code, avoiding extra
@@ -355,7 +355,6 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < s->num_cpu; i++) {
         CPUState *cpu = qemu_get_cpu(i);
         uint64_t cpu_affid;
-        int last;
 
         s->cpu[i].cpu = cpu;
         s->cpu[i].gic = s;
@@ -375,7 +374,6 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
          *  PLPIS == 0 (physical LPIs not supported)
          */
         cpu_affid = object_property_get_uint(OBJECT(cpu), "mp-affinity", NULL);
-        last = (i == s->num_cpu - 1);
 
         /* The CPU mp-affinity property is in MPIDR register format; squash
          * the affinity bytes into 32 bits as the GICR_TYPER has them.
@@ -384,13 +382,22 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
                      (cpu_affid & 0xFFFFFF);
         s->cpu[i].gicr_typer = (cpu_affid << 32) |
             (1 << 24) |
-            (i << 8) |
-            (last << 4);
+            (i << 8);
 
         if (s->lpi_enable) {
             s->cpu[i].gicr_typer |= GICR_TYPER_PLPIS;
         }
     }
+
+    /*
+     * Now go through and set GICR_TYPER.Last for the final
+     * redistributor in each region.
+     */
+    cpuidx = 0;
+    for (i = 0; i < s->nb_redist_regions; i++) {
+        cpuidx += s->redist_region_count[i];
+        s->cpu[cpuidx - 1].gicr_typer |= GICR_TYPER_LAST;
+    }
 }
 
 static void arm_gicv3_finalize(Object *obj)
-- 
2.25.1


