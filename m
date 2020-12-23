Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078232E1927
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:59:56 +0100 (CET)
Received: from localhost ([::1]:36050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kry7n-0004Dy-4V
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:59:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krxbR-00062c-W6; Wed, 23 Dec 2020 01:26:30 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:35635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krxbQ-0001zn-9R; Wed, 23 Dec 2020 01:26:29 -0500
Received: by mail-qt1-x82b.google.com with SMTP id b9so10689367qtr.2;
 Tue, 22 Dec 2020 22:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DJuHHO8ZbiKmX8gRi7laW9cwXkwMAyTry16lt0sBt40=;
 b=bwOkSRv3o13aYj25tXdwbCIAjXTDsjOj5+80t6yIQG7w3UmzDmyhvOcDlUkYw1GYdh
 +yPujaboZX8+OlytksLMf5lfgdLobee2vYlBwc+XmkB5iDouFOwHtqyasTsNUMF8rZjt
 JuQTZJ1nQ9O45Blklu0BZVbYaqjWwAEsU31zC2RHfizBgmOXlgBjSu6uwhMcoVIPoN3N
 jgQ+363qJi8U5zwpCV4cNLC80KUagoq/ritiJ4cvuFMnIxs3DaXtStSlrRgzibW71x7h
 jID0RxJup/heRI0xilII9tFTTQcRMryVCNSE3bvhQYBKczTZcMKFbMpQHqw2wDOfM0Q0
 An5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DJuHHO8ZbiKmX8gRi7laW9cwXkwMAyTry16lt0sBt40=;
 b=YySB0ra4S243C4vnC4dQAAlhcK17LTWd1kHK5odoEdVQ/Jokrhx2WXvq+5/ypwn8Z3
 wOIuBqkghjZoXtjSrVFiHKtODPMKyg9AyaYWGbsTyvoe6p8IcprEshMBRge0XE/xKKrY
 V6zbY600qhcSQTvapObsGThIB3q3rvf5c2m6CqaRE/8P202Bu8Bf54gIC6CjRgKOASE0
 36hnEtEqGYdKqyWX8vT42UoOBdt3U1VF2N6swQGO7ob65kijUngSgX1kpNMe9etRcUaf
 ExsULLIuwPYUAdcegwnsyURBv08UWzv2VKX3fOZBEp56DXfZP3eBYJZSnMSsUQiw1/fP
 omRg==
X-Gm-Message-State: AOAM530xbCTkbNpLwhl5fnN8FHC2f+YE0DxaJ7zK4Kx5NC7eDCwUswFo
 xzOyUgqVhBdgkVZR0a+mG+c=
X-Google-Smtp-Source: ABdhPJy4KbuF1Mh1ZRb/x/rBR9SuD8p8nsiLXZP2mtzqxbXjrPcyPmPA4Tj/bjBPAVrONU3EV+16Qw==
X-Received: by 2002:ac8:5496:: with SMTP id h22mr24430382qtq.10.1608704787161; 
 Tue, 22 Dec 2020 22:26:27 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id q32sm14518589qtb.0.2020.12.22.22.26.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Dec 2020 22:26:26 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at address
 6
Date: Wed, 23 Dec 2020 14:26:06 +0800
Message-Id: <1608704767-9317-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82b.google.com
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
index 91d8c43..a3dbf85 100644
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
2.7.4


