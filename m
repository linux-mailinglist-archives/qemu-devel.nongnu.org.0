Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D3965F247
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:09:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMN-0000oi-Bg; Thu, 05 Jan 2023 11:44:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM1-0000Yu-8l
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:33 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLy-0007Nx-8k
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:32 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso1776511wms.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5SjlNN0Q6eegKF4lgc+ItSkFv4TSnZq46y/byWdrbtE=;
 b=tQr6otgFj0AWru8PBTY4y30StmfEOHh96EWjLbCDssCaBlDpgRZYu/JCj3QO/BSL/u
 m14DlXT/5cJU6f8mq+inVy+u+RJPzOitktj9v3xv0JDVw/CZLYqpH8JAz2wlBxMYJmAn
 1t0TvSojs8Nyxqi2xMRWhljFip/fOE42KhhRWBtCsUAS8BKYMUzrEj4Wh2sQKRb3o2tN
 Ixm8AgfaBXzqlXRol/MnHM7eWDkRyOPaWv+V8SZPYp5nCuYOQaaT5KHHOAgqITH5N8WR
 ehNaGObHYkZ2ETPNXzLSUhpbu+jOZrwRUwiV2aQ+2kjvZVtUDtkCgVL9kIibSy0oWIY/
 KUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5SjlNN0Q6eegKF4lgc+ItSkFv4TSnZq46y/byWdrbtE=;
 b=6wwQgSNe9tvrdidPdVb9zxVkQuw+WV4g3p3cmmU2KSvjLrqqENYQmWeEVRyLyUsgGW
 tGF0p58sgjvAKBtugAdFSvK3WVDFXMZnGcARWN3ijSHvyXAdxvF4XlIct+9iy8l9al+R
 /dblCRPNILpQ/jl3S1RoieHWV3rmQ/3fCgNlH9AfL6EAZGDNZplHrZzAQg3cj5uOUbE1
 VHjUeaGdqKbmc2k10acXqBbPZOGbctMp06ykhzpF3ZYXX9+ZPq5s51IIQSd3ijhJUrYo
 oduf4BiwSpqMML7qcCNVzRUZuQumqraXQ+YtYlyAgkJgrfXOJUzNXgOAFpnadUmJX8/L
 W/fw==
X-Gm-Message-State: AFqh2koQ0WcgNgCx4a7hubUtLKKlHH8c5PYjO6GldUP95a58rt8L2vpd
 VW25ECc6JZxIuY0lUmklJsSLiGK+gRJBkXYA
X-Google-Smtp-Source: AMrXdXuTnkdG20D4/3ZRToiAkRDWHs3KNtvcQIuWx6yCf/+YZSUmqXnOIJGQnWXLUMmvdn5ted78tw==
X-Received: by 2002:a05:600c:3493:b0:3d2:370b:97f4 with SMTP id
 a19-20020a05600c349300b003d2370b97f4mr41176082wmq.16.1672937067542; 
 Thu, 05 Jan 2023 08:44:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/34] hw/timer/imx_epit: improve comments
Date: Thu,  5 Jan 2023 16:43:53 +0000
Message-Id: <20230105164417.3994639-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Axel Heider <axel.heider@hensoldt.net>

Fix typos, add background information

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/imx_epit.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index ec0fa440d72..2841fbaa1c8 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -96,13 +96,14 @@ static void imx_epit_set_freq(IMXEPITState *s)
     }
 }
 
+/*
+ * This is called both on hardware (device) reset and software reset.
+ */
 static void imx_epit_reset(DeviceState *dev)
 {
     IMXEPITState *s = IMX_EPIT(dev);
 
-    /*
-     * Soft reset doesn't touch some bits; hard reset clears them
-     */
+    /* Soft reset doesn't touch some bits; hard reset clears them */
     s->cr &= (CR_EN|CR_ENMOD|CR_STOPEN|CR_DOZEN|CR_WAITEN|CR_DBGEN);
     s->sr = 0;
     s->lr = EPIT_TIMER_MAX;
@@ -214,6 +215,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
         ptimer_transaction_begin(s->timer_cmp);
         ptimer_transaction_begin(s->timer_reload);
 
+        /* Update the frequency. Has been done already in case of a reset. */
         if (!(s->cr & CR_SWR)) {
             imx_epit_set_freq(s);
         }
@@ -254,7 +256,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
         break;
 
     case 1: /* SR - ACK*/
-        /* writing 1 to OCIF clear the OCIF bit */
+        /* writing 1 to OCIF clears the OCIF bit */
         if (value & 0x01) {
             s->sr = 0;
             imx_epit_update_int(s);
@@ -352,8 +354,18 @@ static void imx_epit_realize(DeviceState *dev, Error **errp)
                           0x00001000);
     sysbus_init_mmio(sbd, &s->iomem);
 
+    /*
+     * The reload timer keeps running when the peripheral is enabled. It is a
+     * kind of wall clock that does not generate any interrupts. The callback
+     * needs to be provided, but it does nothing as the ptimer already supports
+     * all necessary reloading functionality.
+     */
     s->timer_reload = ptimer_init(imx_epit_reload, s, PTIMER_POLICY_LEGACY);
 
+    /*
+     * The compare timer is running only when the peripheral configuration is
+     * in a state that will generate compare interrupts.
+     */
     s->timer_cmp = ptimer_init(imx_epit_cmp, s, PTIMER_POLICY_LEGACY);
 }
 
-- 
2.25.1


