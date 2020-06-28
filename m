Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BDB20C876
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Jun 2020 16:31:20 +0200 (CEST)
Received: from localhost ([::1]:38656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpYL1-0007cT-Ae
	for lists+qemu-devel@lfdr.de; Sun, 28 Jun 2020 10:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEh-0006HT-2u
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 10:24:47 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEd-0004iv-VQ
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 10:24:46 -0400
Received: by mail-wr1-x442.google.com with SMTP id o11so14033388wrv.9
 for <qemu-devel@nongnu.org>; Sun, 28 Jun 2020 07:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SgwIMScr/FIQnW8BnMJTzdrdEBtyQPvg038hPjzvKgw=;
 b=DmLjHksG4vO/ptD6HFqYBPrTo4WYlILaUNvZcw+idizCY/oRkwwWVZ4RghhTBfHnW2
 fo6lP9TJ7mBzXlJJNYGAdW/r+ZmxDJ02iASOvfUy+tZ0DixaAc9afnqGMU+3KzDu+klk
 kYNr0hbinaRIvohzRWrJRSY4cZDKjv07YsE/Qi/GZLE4mlgj2Gz3Q0ZHtPgnXqTbhyyZ
 nietcuGRTi9bo37Ts98fdLL2fp5BKm25s9NLS8RxLPHjykAfjCs6N3YrMhKcKTPwplI3
 gPFtHbCGHX1MW9XRZ9QAN0L3wIBFtMTd413vNabXYI5pOZuEdc0B+rxWz8NraEooGYwL
 7k5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SgwIMScr/FIQnW8BnMJTzdrdEBtyQPvg038hPjzvKgw=;
 b=HpcT59+uWjS8HMb8gTzFRvs2gVkEuDyuph0X9GF8GfSORAdBee4Us4ElQ0huKXikAT
 nH8d4YdNvdmOp5KCRgvtoApx6lQMgctAnD3MhM+QrFmCx+1DY6+w6ubXLoDLPizIVQHC
 q6pSy7xA6rtw8YwJ/UAxbdm2fEIOHogrGSkbYmwS8l3tZxnSVgdW39rJNEM2AL3/ZUXh
 5xSvh3L+Fr7t8MFD9OKyLi3yrxi/Qs6O+r52/GkzjRFl7UPoLPdO9AsHZGDTGMNSHxKo
 X3+t5I7yIkQrvpXBInrpLmueCAPm0Qo05+ySe4xeePdbUEWyDR2tLx+Z57qSx+1mjToE
 vIvw==
X-Gm-Message-State: AOAM532wsA/tLnWDfLu5eheQsLSeqX9xcIddmYPJ7dqQRPJeAfvOWWTx
 uBT5wOyRkTdJ9qJ+0wdsr+GxEQ==
X-Google-Smtp-Source: ABdhPJwSFcnv5oLabyjIHDO5iWK7sshs2ohETV+fDSjs2CImc7QSAbyD34twQKgSACarO6z6poXqTQ==
X-Received: by 2002:adf:f38f:: with SMTP id m15mr11548083wro.173.1593354282790; 
 Sun, 28 Jun 2020 07:24:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5321555wml.42.2020.06.28.07.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 07:24:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/17] hw/arm/spitz: Use max111x properties to set initial
 values
Date: Sun, 28 Jun 2020 15:24:21 +0100
Message-Id: <20200628142429.17111-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200628142429.17111-1-peter.maydell@linaro.org>
References: <20200628142429.17111-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new max111x qdev properties to set the initial input
values rather than calling max111x_set_input(); this means that
on system reset the inputs will correctly return to their initial
values.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/spitz.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 11e413723f4..93a25edcb5b 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -731,11 +731,14 @@ static void spitz_ssp_attach(SpitzMachineState *sms)
                           qdev_get_gpio_in(sms->mpu->gpio, SPITZ_GPIO_TP_INT));
 
     bus = qdev_get_child_bus(sms->mux, "ssi2");
-    sms->max1111 = ssi_create_slave(bus, "max1111");
+    sms->max1111 = qdev_new("max1111");
     max1111 = sms->max1111;
-    max111x_set_input(sms->max1111, MAX1111_BATT_VOLT, SPITZ_BATTERY_VOLT);
-    max111x_set_input(sms->max1111, MAX1111_BATT_TEMP, 0);
-    max111x_set_input(sms->max1111, MAX1111_ACIN_VOLT, SPITZ_CHARGEON_ACIN);
+    qdev_prop_set_uint8(sms->max1111, "input1" /* BATT_VOLT */,
+                        SPITZ_BATTERY_VOLT);
+    qdev_prop_set_uint8(sms->max1111, "input2" /* BATT_TEMP */, 0);
+    qdev_prop_set_uint8(sms->max1111, "input3" /* ACIN_VOLT */,
+                        SPITZ_CHARGEON_ACIN);
+    ssi_realize_and_unref(sms->max1111, bus, &error_fatal);
 
     qdev_connect_gpio_out(sms->mpu->gpio, SPITZ_GPIO_LCDCON_CS,
                         qdev_get_gpio_in(sms->mux, 0));
-- 
2.20.1


