Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFA13E51D0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:11:56 +0200 (CEST)
Received: from localhost ([::1]:35014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJ7K-00050C-VI
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mDJ6Z-00047u-HJ; Tue, 10 Aug 2021 00:11:07 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:44861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mDJ6W-000470-G5; Tue, 10 Aug 2021 00:11:07 -0400
Received: by mail-oi1-x229.google.com with SMTP id w6so27054765oiv.11;
 Mon, 09 Aug 2021 21:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=njxWMkv2+EaP0kqKDqzOIBFjNBpUtXvw399rua1kgCw=;
 b=kobG7R2ijwZojCi0UHAehiIF6oNDIJMJ3Kd59vcSyADK1I6b4Rlyq4riSjpJu8bzDl
 Hm1zQgYkbCTmKxZITkrJxE0X1HIw6bGrXZLUmNi/2lBAIRCdeUFTGFTjxuaXJxdZiK+I
 ktghctx9MkGw6vyNOSQ8ehZRUve5mrmy/jP16dioBbkGGgQGIKufWMmIKFBnLqiyh1Sm
 WpSE/HwMUBVsVxNMWFCkcK4ldVogoeEg9Cf5+h4tCha31XTjn19CmSjVMOQp1dIvBL2l
 rFs5SbcGbLOe30z1dHJuiYnDPbiWWWDS5AenUuSJjLYQoiNOlxwHhjn/TRRDPEDrmDBH
 MyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=njxWMkv2+EaP0kqKDqzOIBFjNBpUtXvw399rua1kgCw=;
 b=gQKwOweN/5jTRLCW200yMcqdcopMGLYhYeedXj7pGEruo8hMKUT0cG8MwNNS2cPayC
 Rov4VmPuFovm1qqh5tOiLdFuuHPkmPMX4kmUfGZACNHrsoWhHsSZ4h+b/3CV4jAmyWm7
 fiv/O4pfB/Ps8c4vj9faq7OchYNoIyS5TS7q7TS+6h1j7oAwr4mlrzx5fK659Q9IkPXu
 rO+oM4if2y+bgnz3qlQfXr0EzZ7SLSoOq4bpjb5aUrajH3bHn2pzgnBvv1p1MvvhvI3j
 j29kpZ+ydBKLXeCmNO4b1kUKf/UT7m25r/MBntNf3fxcSg+jC0OYtNmNjFDh2LAIGs9N
 Vqvw==
X-Gm-Message-State: AOAM532UtujLllIKcxkJJuYpMfRuOZe4+poOr9zTYygVEhgjbJ/kXAlK
 gxPy+ppjByK2xcFLx3lGiqM=
X-Google-Smtp-Source: ABdhPJySKRaVMeJkLQd1G/EOK99yVkod7Y3iYluTz1CLUFGGQKa6TX5KoOqfujbFCPpGioKnR0lLAA==
X-Received: by 2002:a05:6808:2109:: with SMTP id
 r9mr1925828oiw.101.1628568662464; 
 Mon, 09 Aug 2021 21:11:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 r15sm3696079oth.7.2021.08.09.21.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 21:11:02 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] fsl-imx6ul: add SAI1/2/3 and ASRC as unimplemented devices
Date: Mon,  9 Aug 2021 21:10:59 -0700
Message-Id: <20210810041059.553384-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define SAI1/2/3 and ASRC as unimplemented devices to avoid random
Linux kernel crashes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/fsl-imx6ul.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index e0128d7316..48b60eb3ce 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -534,6 +534,13 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
      */
     create_unimplemented_device("sdma", FSL_IMX6UL_SDMA_ADDR, 0x4000);
 
+    /*
+     * SAI
+     */
+    create_unimplemented_device("sai1", FSL_IMX6UL_SAI1_ADDR, 0x4000);
+    create_unimplemented_device("sai2", FSL_IMX6UL_SAI2_ADDR, 0x4000);
+    create_unimplemented_device("sai3", FSL_IMX6UL_SAI3_ADDR, 0x4000);
+
     /*
      * PWM
      */
@@ -542,6 +549,11 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("pwm3", FSL_IMX6UL_PWM3_ADDR, 0x4000);
     create_unimplemented_device("pwm4", FSL_IMX6UL_PWM4_ADDR, 0x4000);
 
+    /*
+     * ASRC
+     */
+    create_unimplemented_device("asrc", FSL_IMX6UL_ASRC_ADDR, 0x4000);
+
     /*
      * CAN
      */
-- 
2.25.1


