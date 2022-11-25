Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B37638921
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 12:53:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyXGF-0005dc-JG; Fri, 25 Nov 2022 06:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyXGE-0005bx-AJ
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:52:50 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyXGC-00039z-Kf
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:52:50 -0500
Received: by mail-wr1-x436.google.com with SMTP id cl5so6391571wrb.9
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 03:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q7QwRIJ7+JF6N2x5NqeLNiV3OMXYdz7GNPaIQ9AMgrE=;
 b=XTVE4DpXJVw6z6EV8X3Dx7NfrSpPK4+oRSFFAVqd5qvhaWyN8nUVlhLV5bF4++IGV4
 u7vpoOfdg+XTgaXqOtKi7MuR5AePQWu2v6NfC/0iqcCv7pk0G/KufzzpEGodFvBx7Tw6
 mq5cntrwCp+d0fISg5RghulN/nEHcejfbEGgypbzN6VXTkkAQSaQYClByHpx3OSjO2k+
 kqkIRyjoSELb++Z+mMqTDxTMYnBJzXsaTdkxckvjwriRYxOFRIWyLMd2opZw8nz8vASo
 ZpJQdsA2AmsyCw7edGy9PPQ0oKECc596a9uCH0X0t6YeHkKxKQxndjahnlGmXU1xwm6U
 Qokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q7QwRIJ7+JF6N2x5NqeLNiV3OMXYdz7GNPaIQ9AMgrE=;
 b=aFPSft6cLoNpTfBRifutgCMG2dlbHRM8l95eSvbcS3bKr4FlnFKrCwPxQwM4oee/QB
 FF0e3QkE0AIZ4Xn9Sby6u/z9z8uELu7C4OCPQe7/g48BblyxLzVrJGsKG/QFvcmfky0w
 SekmZMhPK/6AtTNgs5M9osum5IGtToDsgPV8D5QLaZnpqweiWuKYhXU6phCdvHkRJDSG
 lS9SscNriQ50VwwyE98D8SsVjsapzgXy8J8vyglbfSH/JKiD5ZLySSsRAYMdPK/QtaJL
 iWqF0vP9JHyJLbXnd4ATmDsprGmMmDVM8lWXTgKr+2AesL1RxfVf3LaRCqcn87sD58Xs
 HZ3g==
X-Gm-Message-State: ANoB5pncUckE79O+wPrRASuDHBj7KWq8C5iV1AQpw4n2u0vwsLjP/O8K
 hjiqdSkKE/fRteor3AIlbxVLBT9B4fTK4A==
X-Google-Smtp-Source: AA0mqf6WElggmOF82EqhuYw86XXlR8Bqps0bERtyLPwtYOM+lEkooRTjwOuQpX0Xq+xNGFzhhoszQQ==
X-Received: by 2002:adf:eb8f:0:b0:22e:48ee:dc64 with SMTP id
 t15-20020adfeb8f000000b0022e48eedc64mr22570649wrn.319.1669377167319; 
 Fri, 25 Nov 2022 03:52:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b003c6f8d30e40sm9728258wmq.31.2022.11.25.03.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 03:52:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 5/7] hw/intc/xics: Reset TYPE_ICS objects with
 device_cold_reset()
Date: Fri, 25 Nov 2022 11:52:38 +0000
Message-Id: <20221125115240.3005559-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221125115240.3005559-1-peter.maydell@linaro.org>
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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


