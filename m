Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252BC58A0F8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 20:58:16 +0200 (CEST)
Received: from localhost ([::1]:46426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJg2x-0006an-6F
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 14:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJfmb-0005Im-75; Thu, 04 Aug 2022 14:41:21 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:38796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJfmZ-0004vd-Gl; Thu, 04 Aug 2022 14:41:20 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id 125so324046vsd.5;
 Thu, 04 Aug 2022 11:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=C8+iSN8Sq8LnJrJ+scvTGegOBPXQ4FxtOiuX9S1DAWY=;
 b=SJKWlEv/0Um5aex05L95Pl/T6HeTWWrxVbqIgNKMwPyG8B+B37x4GzyKmujLniukdT
 IFahkTETTB0HpSdID54mErATIy1AERruOqfRLlEHQUDMb3S0VGa+XMOVwiQYkOx77U5j
 odSVHfOwP4wtk19ct+5Ah0bomhcLu+O3JMigMtB4inCP+anpTfsq3weJaU0XpJGnkauz
 2Xtamc0xmDAGynAMm6ogwS2FVPOlipNKtoy2+YDtAD3EMLmUe+gaRDARX9BCOh7XWSWV
 Fr2MSG1atSwkcv4GGHH/PrUCOLXq3K9UscuJos6Z06c6zvEdVDcvTJAA/WIYAJ8ajok7
 oTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=C8+iSN8Sq8LnJrJ+scvTGegOBPXQ4FxtOiuX9S1DAWY=;
 b=GEiSjbpvtk1xNtJ0DhxqW03ANkPLiNwCpjLUjbvfAUY2q+ET/ttu0tYFBQEA8bmuTW
 WzDhHqDhu4vNyCGsI0VuDpwCmnLLPr2cnUn4jsQ98J7IgxJVtf74CJR+XlYN7BFdHaPd
 VfAQDnzBiDUnpSFlu7T9VLq7qhyL2diPxgOuvQP0M/qFuzgf402Qgg7MUSZqXIceo3v+
 DIH4CVjIeyeHZtXNtSn4uUD40wAbeWXxBb+RtupLZEIongnMJ7Y6Lev5p+AJJAbXYlRU
 AUiTZuWhpqXEDOrMDp/7PI1CIO5+id91Rgg7Fc4p02BzCU4h1mnPRVI3tZwjLPySOj97
 R+gg==
X-Gm-Message-State: ACgBeo0y1GM8ipavUoRb3yvKr5J3czri4efFM6T7t0x9c5EDvkjc2ehq
 RlxSmm4CBguxqVB+aSelUKfHQO/p5HU=
X-Google-Smtp-Source: AA6agR4FqSB5fLWATr0RytwEXlzrt0HPrcebwWqkZZIqhgpN3vev4dplm+43JvjfGRkpI9sKAiB92Q==
X-Received: by 2002:a67:db0d:0:b0:388:6e87:fd17 with SMTP id
 z13-20020a67db0d000000b003886e87fd17mr1533586vsj.64.1659638477935; 
 Thu, 04 Aug 2022 11:41:17 -0700 (PDT)
Received: from balboa.ibmuc.com ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 a12-20020ab00c0c000000b003875ff95a29sm1592583uak.30.2022.08.04.11.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 11:41:17 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 1/1] hw/ppc: sam460ex.c: store all GPIO lines in mal_irqs[]
Date: Thu,  4 Aug 2022 15:41:11 -0300
Message-Id: <20220804184111.2770822-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220804184111.2770822-1-danielhb413@gmail.com>
References: <20220804184111.2770822-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2f.google.com
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
Acked-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220803233204.2724202-1-danielhb413@gmail.com>
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


