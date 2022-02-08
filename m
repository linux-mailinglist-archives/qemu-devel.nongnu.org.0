Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342184AE26A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 20:44:57 +0100 (CET)
Received: from localhost ([::1]:50316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHWQ4-0001fU-Ap
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 14:44:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHU6m-0003jf-Cb
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:16:52 -0500
Received: from [2a00:1450:4864:20::430] (port=38526
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHU6h-0002NT-VM
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 12:16:51 -0500
Received: by mail-wr1-x430.google.com with SMTP id s10so29436607wra.5
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 09:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X+5q8Q245RMXKO+FXIQP2z10d5lBl/C2tAq9zh99WDw=;
 b=IClUJYyQkhtkPpKMZmFwxgEZnJBygzTsZLIKirMwPUI2NacdoEtEgkdIDA9AzNB50e
 KUJrEQAi1I2euB9pBYGW5IpPbeWrsvpXFaQ2Y3/NHWItXjpCMwO1Q2OEKly/TVFkR8iH
 WTKOnWJuHpXK7uj0agXsJPgaExzGkdp5FNkBZSSovjmy7xQ/OsDuYU4rd7PHHv603lQh
 p8vQ7sNK/CfvLSzQ1DTu7f/6Pw7vk8KGtKoDAU8rY8fZqsRCShHa6nehwyTxtNaIpjU+
 Du0LyeKOw3ipugoWJDQcWWnBrXfO2rJBOvil4ZAd0BCVhCq/GdSoBkt96GnA77VhH0um
 h6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X+5q8Q245RMXKO+FXIQP2z10d5lBl/C2tAq9zh99WDw=;
 b=IuqcCh6kNEP/d2PUOL/hHSbRi57SjfJ6Jo93oKQtsHuE5BYRzqE7Oa+O/zMoVTV4+y
 6HLh2r2FA+yq/opqILQOijNtJ1eqiitD+a1KQopor15e75gJFMjLVzmSbre/2sdXgDVJ
 OcnvGgkxe6BY0O5ZVwMtc2hGW5K7jT160afRtrLyPsDW4yy3EUZQwGxZQUGDXYmWqA/w
 btDawIoKUhMATigBGsDdtPmNksFL6bKbEiQd/ByTYuVOkAMWhtFxEhdbdMOjBqnT0qSW
 wShC9tsDGpKH1D/0Bs09b5Gh9yS08zauYFkIAK17MDataJjczAozbs9fL1fKAfsX2V5I
 5+LA==
X-Gm-Message-State: AOAM531KHhQWXFfNJRYgXaqFCPPG+EzrALGrg1jVTJr37J8A1V/VLlPI
 cqgt8KQ9gkqeEKpTM87rXyWVnPko/YvqQQ==
X-Google-Smtp-Source: ABdhPJxXY28XE2ctkTVEzkmeQNyNG3YQYFT6v4JcYG/UoR8a0nRGCMiu95pH7iSwuxY7XurVfb1sUg==
X-Received: by 2002:a5d:4089:: with SMTP id o9mr2689911wrp.634.1644340605938; 
 Tue, 08 Feb 2022 09:16:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t14sm2718680wmq.43.2022.02.08.09.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 09:16:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/armv7m: Handle disconnected clock inputs
Date: Tue,  8 Feb 2022 17:16:43 +0000
Message-Id: <20220208171643.3486277-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-stable@nongnu.org, Richard Petri <git@rpls.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the armv7m object, handle clock inputs that aren't connected.
This is always an error for 'cpuclk'. For 'refclk' it is OK for this
to be disconnected, but we need to handle it by not trying to connect
a sourceless-clock to the systick device.

This fixes a bug where on the mps2-an521 and similar boards (which
do not have a refclk) the systick device incorrectly reset with
SYST_CSR.CLKSOURCE 0 ("use refclk") rather than 1 ("use CPU clock").

Cc: qemu-stable@nongnu.org
Reported-by: Richard Petri <git@rpls.de>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The other option would be to have clock_has_source() look not
just at clk->source but somehow walk up the clock tree to see
if it can find something that looks like a "root". That seems
overcomplicated...
---
 hw/arm/armv7m.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index ceb76df3cd4..41cfca0f223 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -284,6 +284,12 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    /* cpuclk must be connected; refclk is optional */
+    if (!clock_has_source(s->cpuclk)) {
+        error_setg(errp, "armv7m: cpuclk must be connected");
+        return;
+    }
+
     memory_region_add_subregion_overlap(&s->container, 0, s->board_memory, -1);
 
     s->cpu = ARM_CPU(object_new_with_props(s->cpu_type, OBJECT(s), "cpu",
@@ -420,8 +426,18 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
                                     &s->sysreg_ns_mem);
     }
 
-    /* Create and map the systick devices */
-    qdev_connect_clock_in(DEVICE(&s->systick[M_REG_NS]), "refclk", s->refclk);
+    /*
+     * Create and map the systick devices. Note that we only connect
+     * refclk if it has been connected to us; otherwise the systick
+     * device gets the wrong answer for clock_has_source(refclk), because
+     * it has an immediate source (the ARMv7M's clock object) but not
+     * an ultimate source, and then it won't correctly auto-select the
+     * CPU clock as its only possible clock source.
+     */
+    if (clock_has_source(s->refclk)) {
+        qdev_connect_clock_in(DEVICE(&s->systick[M_REG_NS]), "refclk",
+                              s->refclk);
+    }
     qdev_connect_clock_in(DEVICE(&s->systick[M_REG_NS]), "cpuclk", s->cpuclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), errp)) {
         return;
@@ -438,8 +454,10 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
          */
         object_initialize_child(OBJECT(dev), "systick-reg-s",
                                 &s->systick[M_REG_S], TYPE_SYSTICK);
-        qdev_connect_clock_in(DEVICE(&s->systick[M_REG_S]), "refclk",
-                              s->refclk);
+        if (clock_has_source(s->refclk)) {
+            qdev_connect_clock_in(DEVICE(&s->systick[M_REG_S]), "refclk",
+                                  s->refclk);
+        }
         qdev_connect_clock_in(DEVICE(&s->systick[M_REG_S]), "cpuclk",
                               s->cpuclk);
 
-- 
2.25.1


