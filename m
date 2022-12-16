Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C877164F40E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:25:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IV5-0006lL-PL; Fri, 16 Dec 2022 16:44:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IUF-00066A-Dv
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:25 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IUC-0000iy-GJ
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:23 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so5041472wmh.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=W1JmqKacM9m8zOcJKdX5kBax+NSgUM13DsFDzRHKMZY=;
 b=IpRsAea5we80r3KV7DT0PYJpVWBWz2DVg6RZjWbKAf1bVt3Qf0rOKuj13chZAgWnwX
 wdh2lNgpkduWKHJAJIDfzRjT6SMCFxQVCSrbLNvXAWwiUQBXKPJqlstI5m07q4c4Iqu5
 a7vqxFdUthhoGXbkoQ3EXko9XFm/v6mAveRkMZTWNEHkgI7fcpkJnPBjrkMjNmXD80HJ
 7IdVkM4YnEYkkvAdoDpMFggNEqLyn3rz2KkeO78BEH/Gcx+oegbGOg6EkyxVk+BTxWOG
 TNzOiv/dfvhCGYKK7cf0ohzM9VuBkZ6IagxeH+78/swV/r/5FaDNQIcFt3ATOnI5dQLe
 W4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W1JmqKacM9m8zOcJKdX5kBax+NSgUM13DsFDzRHKMZY=;
 b=ca0m+8S4d2Rm/3LbCJZ8O3jxQePnDQI3zMLnYTWkzHGPC315a8TgPJ0yRHyR6/OkvG
 GiEkqItnhO6egUK7MsdXeFNHOAmUxN/TXGBoDELpG2wsLtE61WElVSlfNkQRudexRWKs
 eUqzyg/B5WlIhLBE0sptYW+hLnwaon0T2J0Bay9M0gVPqtj3XZEwIq1YGVRmoGrkoLg2
 TbjdpNH6GygS4lKhqrmYjG1Qqp6fQed3otFc5nwcNvl4ELQNL+TS92sbtmqRy0RXawzg
 fLiXt5EfrVNI7shbSyJqatlrmKyDPskVKb+7gXeLXnuJcXSO7iWPcKhm41Wn8AapWDA6
 9j/g==
X-Gm-Message-State: AFqh2kooo3TXhrW5twRwaDszRjWvBgxbymYsvkdjV+m/x9OMJAodN27N
 5p31jupEDytx/F6Yh1B0YAE6Kb9+k4v1qd8C
X-Google-Smtp-Source: AMrXdXt1fAT774BbM6h2sIdnSCpgP55+E8kmmLasHD+qV9Np8UdggKPBc1nKdAnXdohCF8GMVPOEiA==
X-Received: by 2002:a7b:c856:0:b0:3d3:4406:8a2e with SMTP id
 c22-20020a7bc856000000b003d344068a2emr3159801wml.15.1671226998129; 
 Fri, 16 Dec 2022 13:43:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/36] hw/intc/xics: Reset TYPE_ICS objects with
 device_cold_reset()
Date: Fri, 16 Dec 2022 21:42:42 +0000
Message-Id: <20221216214244.1391647-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

The realize method for the TYPE_ICS class uses qemu_register_reset()
to register a reset handler, as a workaround for the fact that
currently objects which directly inherit from TYPE_DEVICE don't get
automatically reset.  However, the reset function directly calls
ics_reset(), which is the function that implements the legacy reset
method.  This means that only the parent class's data gets reset, and
a subclass which also needs to handle reset, like TYPE_PHB3_MSI, has
to register its own reset function.

Make the TYPE_ICS reset function call device_cold_reset() instead:
this will handle reset for both the parent class and the subclass,
and will work whether the classes are using legacy reset or 3-phase
reset. This allows us to remove the reset function that the subclass
currently has to set up.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221125115240.3005559-6-peter.maydell@linaro.org
---
 hw/intc/xics.c             | 2 +-
 hw/pci-host/pnv_phb3_msi.c | 7 -------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index dcd021af668..dd130467ccc 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -593,7 +593,7 @@ static void ics_reset(DeviceState *dev)
 
 static void ics_reset_handler(void *dev)
 {
-    ics_reset(dev);
+    device_cold_reset(dev);
 }
 
 static void ics_realize(DeviceState *dev, Error **errp)
diff --git a/hw/pci-host/pnv_phb3_msi.c b/hw/pci-host/pnv_phb3_msi.c
index 2f4112907b8..ae908fd9e41 100644
--- a/hw/pci-host/pnv_phb3_msi.c
+++ b/hw/pci-host/pnv_phb3_msi.c
@@ -239,11 +239,6 @@ static void phb3_msi_reset(DeviceState *dev)
     msi->rba_sum = 0;
 }
 
-static void phb3_msi_reset_handler(void *dev)
-{
-    phb3_msi_reset(dev);
-}
-
 void pnv_phb3_msi_update_config(Phb3MsiState *msi, uint32_t base,
                                 uint32_t count)
 {
@@ -272,8 +267,6 @@ static void phb3_msi_realize(DeviceState *dev, Error **errp)
     }
 
     msi->qirqs = qemu_allocate_irqs(phb3_msi_set_irq, msi, ics->nr_irqs);
-
-    qemu_register_reset(phb3_msi_reset_handler, dev);
 }
 
 static void phb3_msi_instance_init(Object *obj)
-- 
2.25.1


