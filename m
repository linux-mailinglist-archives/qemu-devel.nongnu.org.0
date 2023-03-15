Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CBD6BB6A3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 15:54:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcSVP-0003fK-PM; Wed, 15 Mar 2023 10:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcSUx-0003as-JA; Wed, 15 Mar 2023 10:53:04 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcSUv-0002qT-Qd; Wed, 15 Mar 2023 10:53:03 -0400
Received: by mail-il1-x12f.google.com with SMTP id j6so6016771ilr.7;
 Wed, 15 Mar 2023 07:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678891980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5PnGZtY31aXe2GrzxKEjapHT5JLsmRDhcXFx6YyQDfs=;
 b=Ile5HKm0X+R2UqK5rFcJcnr6KDKhvBL4W6sf83gXMY2uKk+aZnuClUP9rvcyZaIdS8
 osAvq7086x4pdcHqwTcNkWP7qd/8hBzLXnah5114ow4WWthZxk47daUE2aIjKV9t2PRI
 fHQfy3lZR1RMyxm/SwGPQWuzE96udfqD5iYFlwx/Iut1Cgwmqga98cYZkRtO8ytoJU3O
 TI1J7IDPicmrE0FCy4Jx8zf2AE87eT+WeiwL9q8Zlba7hDgjAzIhASCKfB2Ofp7vBS0R
 wthg5SioLChEv4UkPq5lwJHaBQRpopw9q2cRf0Tf3NFfZTgf/wvQQrEhI29326VHdjo8
 mcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678891980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5PnGZtY31aXe2GrzxKEjapHT5JLsmRDhcXFx6YyQDfs=;
 b=nEq1yOraVK29fAdLahjbiknTWZirRpSU0ZvxW1zu+Q64zeNB+tXn3N+x0boudRmJiQ
 iuSSGujoH5x1QOjZvf4B2uC/PJT3qNUSp2NLHxGxCaBEaUGxLFZoSnmEoRioasE2IWBU
 WiWPk8sO+s6kFiFEPKcxUWX6d84/k2KlNaIAOyLBlP/7MQWF2q6E/ksfc3Kp3kKHV51Z
 fqHXQu0DLqEiIbI79PJDax2+84MBrEkuC+qo36td72cA72J6b4qBklay5xkk1mweZcrP
 BwhubGk3A+X9nFaOYE/QI4Y0c/JweWjr3+NrxYaY4A6zOg5sQRsknVWgPjapR+pTrpja
 jsaQ==
X-Gm-Message-State: AO0yUKXnDoAPqCIVY9Ogz0bVxjmw1qwy8kdJqQDPAZ04ys3YsA8TiEcI
 5eN00nPJZ9Mtvafe+hhCzNs=
X-Google-Smtp-Source: AK7set8esn6aA6jNoaJvvhAJZMcqTP4m1k+xZDGJfM6AF42Fls6hgDNLGLOWVjn834oewmcF+BiYKg==
X-Received: by 2002:a05:6e02:10c1:b0:317:c80f:b416 with SMTP id
 s1-20020a056e0210c100b00317c80fb416mr4584998ilj.20.1678891980316; 
 Wed, 15 Mar 2023 07:53:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a92600f000000b003230864f757sm1625327ilb.68.2023.03.15.07.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 07:53:00 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/5] fsl-imx7: Add fec[12]-phy-connected properties
Date: Wed, 15 Mar 2023 07:52:47 -0700
Message-Id: <20230315145248.1639364-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315145248.1639364-1-linux@roeck-us.net>
References: <20230315145248.1639364-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=groeck7@gmail.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add fec[12]-phy-connected properties and use it to set phy-connected
and phy-consumer properties for imx_fec.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/fsl-imx7.c         | 20 ++++++++++++++++++++
 include/hw/arm/fsl-imx7.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index afc7480799..9e41d4b677 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -395,7 +395,23 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
 
     /*
      * Ethernet
+     *
+     * We must use two loops since phy_connected affects the other interface
+     * and we have to set all properties before calling sysbus_realize().
      */
+    for (i = 0; i < FSL_IMX7_NUM_ETHS; i++) {
+        object_property_set_bool(OBJECT(&s->eth[i]), "phy-connected",
+                                 s->phy_connected[i], &error_abort);
+        /*
+         * If the MDIO bus on this controller is not connected, assume the
+         * other controller provides support for it.
+         */
+        if (!s->phy_connected[i]) {
+            object_property_set_link(OBJECT(&s->eth[1 - i]), "phy-consumer",
+                                     OBJECT(&s->eth[i]), &error_abort);
+        }
+    }
+
     for (i = 0; i < FSL_IMX7_NUM_ETHS; i++) {
         static const hwaddr FSL_IMX7_ENETn_ADDR[FSL_IMX7_NUM_ETHS] = {
             FSL_IMX7_ENET1_ADDR,
@@ -601,6 +617,10 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
 static Property fsl_imx7_properties[] = {
     DEFINE_PROP_UINT32("fec1-phy-num", FslIMX7State, phy_num[0], 0),
     DEFINE_PROP_UINT32("fec2-phy-num", FslIMX7State, phy_num[1], 1),
+    DEFINE_PROP_BOOL("fec1-phy-connected", FslIMX7State, phy_connected[0],
+                     true),
+    DEFINE_PROP_BOOL("fec2-phy-connected", FslIMX7State, phy_connected[1],
+                     true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 355bd8ea83..54ea2f0890 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -82,6 +82,7 @@ struct FslIMX7State {
     ChipideaState      usb[FSL_IMX7_NUM_USBS];
     DesignwarePCIEHost pcie;
     uint32_t           phy_num[FSL_IMX7_NUM_ETHS];
+    bool               phy_connected[FSL_IMX7_NUM_ETHS];
 };
 
 enum FslIMX7MemoryMap {
-- 
2.39.2


