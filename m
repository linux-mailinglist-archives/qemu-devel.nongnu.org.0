Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D732D9519
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 10:23:26 +0100 (CET)
Received: from localhost ([::1]:48426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kok4i-0008MT-8X
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 04:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kok0k-00042z-Sq; Mon, 14 Dec 2020 04:19:20 -0500
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:43543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kok0i-0000hw-ME; Mon, 14 Dec 2020 04:19:18 -0500
Received: by mail-il1-x143.google.com with SMTP id c18so15149579iln.10;
 Mon, 14 Dec 2020 01:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qmCemYoZi4aGhNWuryybG7gyT1vNo0cxkXFgXArH9/w=;
 b=nOFgwIhi8MEtvAVK0L+nH7lkopjUGeu4AV5HCmx9EW9I5mM4E7hDP2QiVA5y7K0x9R
 QI+/AA5T3JvDSubyxw4aFi/2bf3tiRJVoBRJgWboSdeefO8pYIyE7MrpNd8OH4NYMQ6U
 WH8HYO+mFSGOUSAZ+Sqewmgt/4v9OwQ2Vj2IizfMsU01fIrP7rf7ZMDdJjGXUvA4dUnV
 v2x0DBx/rlefMoZgop+dMUiRiC6oO/GlGfrqV6kn/uAxndiacmUo2VL4Uwr303slphNv
 h0/xIhpFih2wFQUplk8Hwq1sDcYXTKKM4oKltEX9SivDjnFuC+ZgUGYYoD7IYWyiiFir
 PkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qmCemYoZi4aGhNWuryybG7gyT1vNo0cxkXFgXArH9/w=;
 b=HOFqrbqiIdKrfjGENQgfMOwG9mYnar/bp6+JnD/bh0248RJhvhDoY0wxCK0V/zdMsv
 0TPhO5SJA1YApDWW8yDUs6oamah3zRiaCjeRFwyifC1G2f1mSTBfaVuJhd3XxEll56WO
 4ZiZ+bfS6IrnSOVg3kl5iFkciukmyjenWv1zC0SuTBDuheaY2hZjwpHZ6SUd8oXacILX
 QJ1ym4bnhcyUFXkpEgLKEkFX1U0TA0Zijh/wMPUbKAwj7KJO4Il+XR+Nkped8F8eJLb5
 nMYJewNT9fDtH6iQFrJw6E66Shhoi/LueAjWAUzzOEZWcK1Xy8XmGbFHlQV8exgWeaOp
 lltg==
X-Gm-Message-State: AOAM532EsbWpl0j5SlB/dZ6z0OqvsWRir3xAsQgM8cCFqP9ePklEaOt4
 yOk0JIo8/BbXzP9DbWEltaswmDYUnCA=
X-Google-Smtp-Source: ABdhPJzUV3G7Wqf7unaNVPvndNo4DND5OIaN7EuCYzTDy6JKwf5mSb8mbhDqGD6dRsw4vRpyYF+yoQ==
X-Received: by 2002:a05:6e02:1ba3:: with SMTP id
 n3mr4504006ili.10.1607937555490; 
 Mon, 14 Dec 2020 01:19:15 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id o10sm11618094ili.82.2020.12.14.01.19.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Dec 2020 01:19:15 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/arm: sabrelite: Connect the Ethernet PHY at address 6
Date: Mon, 14 Dec 2020 17:18:58 +0800
Message-Id: <1607937538-69471-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
References: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=bmeng.cn@gmail.com; helo=mail-il1-x143.google.com
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

---

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


