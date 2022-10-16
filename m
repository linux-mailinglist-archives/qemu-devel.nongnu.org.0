Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25775FFF39
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 14:38:43 +0200 (CEST)
Received: from localhost ([::1]:53730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok2ug-0002cO-Gd
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 08:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2ku-0002Xv-6N; Sun, 16 Oct 2022 08:28:36 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:44762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2ks-0000Re-Hy; Sun, 16 Oct 2022 08:28:35 -0400
Received: by mail-ej1-x636.google.com with SMTP id w18so19390617ejq.11;
 Sun, 16 Oct 2022 05:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WtEIJKc0Za2w7LkNpc+XYB5b7FTyMz3UDgQ3c6Pamy8=;
 b=JylHANz/NxFLncYjM07BEOn7wfjnHJsCvG6Z9+YXTf//6Bcu4sQ8GD0JvkGj1pRzQy
 3549MQ0vvYXbVQEK8B2dOt3EVW1ctMer5/O2uLeHy+gwhRrOlilD9fV13527U6BPreFM
 1KWTm3+muUIaP6m91G7wJWz4chfmCEdVgwVhtf4idHwdlbFeTDzcrhQRIl8qPee1TDK8
 jykoNy5ZLHk7YhwMw00vGVvSOx6ZnKJjyG2AhNs1ZCVNioXN2pNyp/dFI2oge9Brasbf
 gE763LCtKJIW+xirjDPNbKw+wt8bt+T/J40W+WG23qjX8QHUMjFjbEMIeMe1e5BHCnLy
 bS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WtEIJKc0Za2w7LkNpc+XYB5b7FTyMz3UDgQ3c6Pamy8=;
 b=TkhJKa+yoXMZGA5TQsl2ipH/3nqsscJlvKxN8D0mzxc+VWkP5XVY7nxbf4oXzEsLHM
 T8hrOANf7ACsEKFQlf19jrt6udlqUXmHKbFxzayy9+35OimMH5vymGwz4KviJ43ddK97
 ULepFzEsJo76IjNYQoyLFUedt4huDo7Q4J3//LnnnDjK3TfXpe5JCRQD5IhCFSEIr2Cf
 ZzmB6D6wZX0v+O/rdrEGd0o936IFPZXhPPJ2KKuh6O4rSkFHhua6MvKC4/VBSR1kQjBo
 NPwj2A/51k69s13dwOCvCI9VxxLlM05zCjktHfgyVG1923cPxmE/XcG26UQeSn1CmnEF
 UhqA==
X-Gm-Message-State: ACrzQf29OVSkjGoVYQJ+B6nJFu2yKHcw9ZaQnyugaTtLDf+DfvZYqCo7
 dNXorycD1niR9eRcJfYtrHR+73YOUDc=
X-Google-Smtp-Source: AMsMyM5mjiYtiPaalalX9SXXy3rGb/FHwZ0sVE5tSulgVloy5fuk2F0BTzmWAnr044Cy1+cdIrUQjg==
X-Received: by 2002:a17:907:7f0b:b0:78d:c16e:e5fc with SMTP id
 qf11-20020a1709077f0b00b0078dc16ee5fcmr5130415ejc.713.1665923311797; 
 Sun, 16 Oct 2022 05:28:31 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-006-139.89.14.pool.telefonica.de. [89.14.6.139])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa7c391000000b00456cbd8c65bsm5504467edq.6.2022.10.16.05.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 05:28:31 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Jan Kiszka <jan.kiszka@web.de>, Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 5/9] hw/sd/sdhci-internal: Unexport ESDHC defines
Date: Sun, 16 Oct 2022 14:27:33 +0200
Message-Id: <20221016122737.93755-6-shentey@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221016122737.93755-1-shentey@gmail.com>
References: <20221016122737.93755-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These defines aren't used outside of sdhci.c, so can be defined there.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci-internal.h | 20 --------------------
 hw/sd/sdhci.c          | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index e8c753d6d1..964570f8e8 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -288,26 +288,6 @@ enum {
 
 extern const VMStateDescription sdhci_vmstate;
 
-
-#define ESDHC_MIX_CTRL                  0x48
-
-#define ESDHC_VENDOR_SPEC               0xc0
-#define ESDHC_IMX_FRC_SDCLK_ON          (1 << 8)
-
-#define ESDHC_DLL_CTRL                  0x60
-
-#define ESDHC_TUNING_CTRL               0xcc
-#define ESDHC_TUNE_CTRL_STATUS          0x68
-#define ESDHC_WTMK_LVL                  0x44
-
-/* Undocumented register used by guests working around erratum ERR004536 */
-#define ESDHC_UNDOCUMENTED_REG27        0x6c
-
-#define ESDHC_CTRL_4BITBUS              (0x1 << 1)
-#define ESDHC_CTRL_8BITBUS              (0x2 << 1)
-
-#define ESDHC_PRNSTS_SDSTB              (1 << 3)
-
 /*
  * Default SD/MMC host controller features information, which will be
  * presented in CAPABILITIES register of generic SD host controller at reset.
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 0e5e988927..6da5e2c781 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1577,6 +1577,25 @@ static const TypeInfo sdhci_bus_info = {
 
 /* --- qdev i.MX eSDHC --- */
 
+#define ESDHC_MIX_CTRL                  0x48
+
+#define ESDHC_VENDOR_SPEC               0xc0
+#define ESDHC_IMX_FRC_SDCLK_ON          (1 << 8)
+
+#define ESDHC_DLL_CTRL                  0x60
+
+#define ESDHC_TUNING_CTRL               0xcc
+#define ESDHC_TUNE_CTRL_STATUS          0x68
+#define ESDHC_WTMK_LVL                  0x44
+
+/* Undocumented register used by guests working around erratum ERR004536 */
+#define ESDHC_UNDOCUMENTED_REG27        0x6c
+
+#define ESDHC_CTRL_4BITBUS              (0x1 << 1)
+#define ESDHC_CTRL_8BITBUS              (0x2 << 1)
+
+#define ESDHC_PRNSTS_SDSTB              (1 << 3)
+
 static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
 {
     SDHCIState *s = SYSBUS_SDHCI(opaque);
-- 
2.38.0


