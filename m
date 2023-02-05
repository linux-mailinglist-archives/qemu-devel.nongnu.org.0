Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F329068AF36
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:05:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObti-00013J-C2; Sun, 05 Feb 2023 05:05:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtZ-0000zH-Jh; Sun, 05 Feb 2023 05:05:15 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtW-0005JZ-O1; Sun, 05 Feb 2023 05:05:12 -0500
Received: by mail-oi1-x22e.google.com with SMTP id 20so6837280oix.5;
 Sun, 05 Feb 2023 02:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ydv4l9MXYHhhRfYq339RkzWonxTEWGRRNNHRsKfZbQ=;
 b=Qk0ywl9QH59qikEcyGtuTCH+6WfsBMSG5F4l896BWcx3zOoXqB6dDgnPK3ZYlSFlnD
 pscr1Zrh7Jygzw2RFK2HbsJFLYv6Kf3JsM8seSMbl+wTG7J8vhYqhbhATxId6FS0abx3
 rjD7jlEOlbZpWe/H2OIr0GdGTYOIhcsPfjWJKBeDLZx/yaxL/00Mj/Smvq4lSgif4rtz
 U/xxHz9ZvpJ+XlZiOXLn34DXTJ2XWv4k9QDt4p9pRdkXLy7x9C5dBbrnMnCbsI+aoI08
 CG81/XQg80OEICl+lq0lDUyBQRWDdh6GX5dl2tuevFtsF43A3lAZwsngedMnIehCf7XA
 nxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ydv4l9MXYHhhRfYq339RkzWonxTEWGRRNNHRsKfZbQ=;
 b=2Z/2VRyIWL0LtpTx0TZhv5gRqr0qlpLZ1Apx69ng0D/auw8goxH45ANenI6gvb/WPA
 0tgx5p0VpGM81G85QuBXkjpMhfWKuRcGt6Xof72yeHkWjEGJrRm3xCrHxl7hPZQYp2GO
 Hmb8v/YnYIuxD/eihBfYGqhJ/tBAbAZ2CuCEtJx09qonDdvl9Un0DTsyg48EKGl3/zlW
 sIzip0vdgDAyEXleupcpmsQCCtiLJ2OsGHpQnTv/LxgB3FEwjKnP7tiWcgoyA4EV5X9R
 KADCK/m25NxNbovNmok8e12SvByOYiL2ji8x4CFEaMW1Lar6vh5Hgm0YTXrYtg3TNKjF
 nkag==
X-Gm-Message-State: AO0yUKXJUkWxzDk5fsqfQCZFHXSUtlPBMOX1eZAY5x5esHBKZrkTQd8J
 UzRs6YcqJ5UZTD3nxYE+byC9tMxWcx0=
X-Google-Smtp-Source: AK7set8WPJUY6nz44PeRPD1KZj0cCNsUPxP/iJLjD6JiPv5oa5/+3EqWLqHV21u168RuSiIF7Emt6w==
X-Received: by 2002:a05:6808:190f:b0:360:e80e:26a9 with SMTP id
 bf15-20020a056808190f00b00360e80e26a9mr9277091oib.12.1675591509353; 
 Sun, 05 Feb 2023 02:05:09 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm2730924oie.47.2023.02.05.02.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:05:09 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 07/16] hw/ppc/e500.c: Avoid hardcoding parent device in
 create_devtree_etsec()
Date: Sun,  5 Feb 2023 07:04:40 -0300
Message-Id: <20230205100449.2352781-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205100449.2352781-1-danielhb413@gmail.com>
References: <20230205100449.2352781-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

The "platform" node is available through data->node, so use that instead
of making assumptions about the parent device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20230125130024.158721-4-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 48288c0b41..e3b29d1d97 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -241,7 +241,7 @@ static int create_devtree_etsec(SysBusDevice *sbdev, PlatformDevtreeData *data)
     int irq0 = platform_bus_get_irqn(pbus, sbdev, 0);
     int irq1 = platform_bus_get_irqn(pbus, sbdev, 1);
     int irq2 = platform_bus_get_irqn(pbus, sbdev, 2);
-    gchar *node = g_strdup_printf("/platform/ethernet@%"PRIx64, mmio0);
+    gchar *node = g_strdup_printf("%s/ethernet@%"PRIx64, data->node, mmio0);
     gchar *group = g_strdup_printf("%s/queue-group", node);
     void *fdt = data->fdt;
 
-- 
2.39.1


