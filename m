Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94162EBA14
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 07:39:07 +0100 (CET)
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx2TL-0001tu-0F
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 01:39:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx2Po-0000TB-UK; Wed, 06 Jan 2021 01:35:28 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:41429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx2Pn-0006Nn-ES; Wed, 06 Jan 2021 01:35:28 -0500
Received: by mail-pl1-x632.google.com with SMTP id y8so1058956plp.8;
 Tue, 05 Jan 2021 22:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CXG7bK3DGo/swZLf3xUG4CksXWWUngcawbrNPY8Gm1o=;
 b=LHZ6mdL7ECrIk0DSUNHKlIRmiWe71383NBHMeAggswZHKZiSZ3xctUiFSL9YSrgbgx
 Q+WZ0tYqT5D6NeaQObm5XZNuXcTtMqOFTlAf+YOXOgP9bqApsTc3YebU/JHTe48+m6B3
 gl5iHUT1wP+QXYvjXgijBittEE3MjeOGqGnHM/8bnMlDuvaL4Rvr5D1xI5hwZGOZ47Kk
 S6wDqynDhzewulPPGEh1nTDcgj7s9MqTquzZD4js6IAkaZOESylDF7RtBXkKEzXoBBNu
 O89e4CPHMv7FPkMtc4lZIWzO9jptOrgtF4xabbZG49+NB1T9pBXDRndXDQzDdidQDjy5
 UiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CXG7bK3DGo/swZLf3xUG4CksXWWUngcawbrNPY8Gm1o=;
 b=GSHUQB3M+UtTaLIMELKaxFLP2KAUNJWbaHPD+rQUCXYTpZJgdP2udXwcQWFoSnUhCE
 orKCbYLyhhdKnvI/DJ5EjqLHtLEW3EPP1MmNKx1cdZHvbabBvYHEHTZ32mKjKsTK0EXu
 9kxsQO1MYyN6178nkVu/ZA5dwJnqB+L2hhv/0+SePYtdQ+RMFAyVsXZbmFZPcxn1XwfO
 cmXzzoXF/RugwCxusdsrJj5w5qXoHdTiRyiQhtzzyObYSgMQvuIwXJlgqdAsdr/R1dvw
 7qbvN//K4lAPlCpBKayNnl076l8SlriN9M9Tbvf88YnRbxYQN4moaCGqx/KD8Tv2EJSO
 oYhA==
X-Gm-Message-State: AOAM531uQyK7Am+3t5hRvd2aveLyWjv3+bHAmspOB/mlN9/0OI8o4fL8
 jy3XDEG7bgdE2y36/Q3FEw7gJOqFxi4=
X-Google-Smtp-Source: ABdhPJyOtT/Dzea5HsTFMD2HJVEVlpVqcOS2hxl0kKuEjQyj7KLnuly37ZqQkh1gQxB5lisfFE3RYg==
X-Received: by 2002:a17:902:6b87:b029:dc:3402:18af with SMTP id
 p7-20020a1709026b87b02900dc340218afmr3126456plk.29.1609914924141; 
 Tue, 05 Jan 2021 22:35:24 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id cu4sm1132976pjb.18.2021.01.05.22.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 22:35:23 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at address
 6
Date: Wed,  6 Jan 2021 14:35:03 +0800
Message-Id: <20210106063504.10841-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106063504.10841-1-bmeng.cn@gmail.com>
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present, when booting U-Boot on QEMU sabrelite, we see:

  Net:   Board Net Initialization Failed
  No ethernet found.

U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
board, the Ethernet PHY is at address 6. Adjust this by updating the
"fec-phy-num" property of the fsl_imx6 SoC object.

With this change, U-Boot sees the PHY but complains MAC address:

  Net:   using phy at 6
  FEC [PRIME]
  Error: FEC address not set.

This is due to U-Boot tries to read the MAC address from the fuse,
which QEMU does not have any valid content filled in. However this
does not prevent the Ethernet from working in QEMU. We just need to
set up the MAC address later in the U-Boot command shell, by:

  => setenv ethaddr 00:11:22:33:44:55

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---

(no changes since v1)

 hw/arm/sabrelite.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 91d8c43a7e..a3dbf85e0e 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -51,6 +51,10 @@ static void sabrelite_init(MachineState *machine)
 
     s = FSL_IMX6(object_new(TYPE_FSL_IMX6));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
+
+    /* Ethernet PHY address is 6 */
+    object_property_set_int(OBJECT(s), "fec-phy-num", 6, &error_fatal);
+
     qdev_realize(DEVICE(s), NULL, &error_fatal);
 
     memory_region_add_subregion(get_system_memory(), FSL_IMX6_MMDC_ADDR,
-- 
2.25.1


