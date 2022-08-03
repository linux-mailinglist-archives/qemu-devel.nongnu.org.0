Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3895894E1
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 01:36:00 +0200 (CEST)
Received: from localhost ([::1]:39094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJNuB-0006ux-8t
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 19:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJNqr-0002vO-MJ; Wed, 03 Aug 2022 19:32:43 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:42562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJNqm-0006PY-Mr; Wed, 03 Aug 2022 19:32:32 -0400
Received: by mail-vs1-xe36.google.com with SMTP id b124so7793312vsc.9;
 Wed, 03 Aug 2022 16:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=kmScqutY1YfFscB33sfOGjazwSAsGFJdWP/qNQopDsA=;
 b=XASkMASkmqx7tUpeX2j08iygHNw+zoi5/Q6g48XbU4e4ItyXo56tVc91yP8y4/qeJd
 a5vFBF30ZaX7fMgYJJu7U3G7bz87/8BWWdBXdhG12lZLVh4xFCyVumH3CeSAVLcm5xPL
 rODAMhGfinsbTsT/ezQCZw8HxcSZf0KbGm6eMW6lZx1swGWUxG/ykKNLS0N/4dd8OX4x
 LPa5rBV89LnnqDU19SmoBhk04Srk20MPPnpMUnQ0Keg9TNxV+WLxtBC9w+qWNifSGORt
 TJJwA1vA6K8GC6qpoGguz7X4xKmGcdnm7q/kqjYzqCdAXQEt3hvlHNLGegtrOyhoYu8z
 f0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=kmScqutY1YfFscB33sfOGjazwSAsGFJdWP/qNQopDsA=;
 b=vKqrFfwrr3ZxWzljb9MYmDiaM9d65f5ymaf+NARVTUts9VCpFQZN1nEOI6m5SdQSh5
 R29AKXcnGDyNkGcAYuW1xFHGGUZBVB8Vsc1lXSzR9nztTy6soLaADIDQ7UnMIOvv0p+F
 4jtdkfBNkQMGuBiRolCPIshsRPNELUk8yyp9Uq6hvUBTcXhr9R3itq7mFrbnmfuKjPir
 dDGqhQNzuRmwW2ryPGllC55qeACLsmUrlroJ8Fzr3FlEW75L3uJ7mSa+fwXSB9CW2KM1
 nsAvLcZ8QNFcocLS4LoFUaot/jt+XL1+d38uXR924HwmFSQ4WXxZbmyfJl7H4873krVz
 1u2g==
X-Gm-Message-State: ACgBeo1hp2CtwIGysj09JVlFFheRz5/HJTJLP+jezBHzGjZWnsytXc/t
 lUz6UDdeQRwUQV4mtAapo4cuCCAhtl0=
X-Google-Smtp-Source: AA6agR7ftX1pfqG5Q3w3noBa6zCjTvq8Ejecnn67l381MSDal/uDyOKeqkVtUPXLYicg1KAtuBfi3Q==
X-Received: by 2002:a67:f4c3:0:b0:388:5198:3275 with SMTP id
 s3-20020a67f4c3000000b0038851983275mr2124580vsn.3.1659569537929; 
 Wed, 03 Aug 2022 16:32:17 -0700 (PDT)
Received: from balboa.ibmuc.com ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 f46-20020ab049f1000000b00384dd6e53b8sm11144501uad.34.2022.08.03.16.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 16:32:17 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH] hw/ppc: sam460ex.c: store all GPIO lines in mal_irqs[]
Date: Wed,  3 Aug 2022 20:32:04 -0300
Message-Id: <20220803233204.2724202-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're not storing all GPIO lines we're retrieving with
qdev_get_gpio_in() in mal_irqs[]. We're storing just the last one in the
first index:

    for (i = 0; i < ARRAY_SIZE(mal_irqs); i++) {
        mal_irqs[0] = qdev_get_gpio_in(uic[2], 3 + i);
    }
    ppc4xx_mal_init(env, 4, 16, mal_irqs);

mal_irqs is used in ppc4xx_mal_init() to assign the IRQs to MAL:

    for (i = 0; i < 4; i++) {
        mal->irqs[i] = irqs[i];
    }

Since only irqs[0] has been initialized, mal->irqs[1,2,3] are being
zeroed.

This doesn´t seem to trigger any apparent issues at this moment, but
Cedric's QOMification of the MAL device [1] is executing a
sysbus_connect_irq() that will fail if we do not store all GPIO lines
properly.

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00497.html

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: BALATON Zoltan <balaton@eik.bme.hu>
Fixes: 706e944206d7 ("hw/ppc/sam460ex: Drop use of ppcuic_init()")
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/sam460ex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 7e8da657c2..0357ee077f 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -384,7 +384,7 @@ static void sam460ex_init(MachineState *machine)
 
     /* MAL */
     for (i = 0; i < ARRAY_SIZE(mal_irqs); i++) {
-        mal_irqs[0] = qdev_get_gpio_in(uic[2], 3 + i);
+        mal_irqs[i] = qdev_get_gpio_in(uic[2], 3 + i);
     }
     ppc4xx_mal_init(env, 4, 16, mal_irqs);
 
-- 
2.36.1


