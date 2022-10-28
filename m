Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289C3611832
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:53:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSTE-0007PF-QL; Fri, 28 Oct 2022 12:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooST9-0006PF-BB; Fri, 28 Oct 2022 12:44:31 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooST7-000178-Kq; Fri, 28 Oct 2022 12:44:31 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-13be3ef361dso6852566fac.12; 
 Fri, 28 Oct 2022 09:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMX+Kz19kv4Dbx4HjJwfRCtfz2Lp5Nk/7MnXxUku4sg=;
 b=qrc1Dcz4InvrKRr97/XqnnZCPwjGgiIl/UbSjWd6S92c5zbc0ra47FuLtN6qdzYpyd
 ANaBMOBPjLwms4OMK8kIZqYz5hvxX5yd2N4tKni0uE3wKbqwZoAEoeEQZbj73HmNjwcA
 vSnodRfPTkbmOSKNYQUaCB2h4gThpV/tjLiawY8Urq6LZ0s+pOqwUYnNQvkrSfecVpyG
 bfr9Xiohoc0q7103za0zhJoJxoLthmz+5mOCMGU/0xY2YjQLM2MfdkwQONHbiDQr2Eko
 G/YW7l6J30CyNO6tx6AQYfwlASITj1En7aAe20c7NK7e4VvRF3UdR1TkxQvK1yO75b6W
 PiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMX+Kz19kv4Dbx4HjJwfRCtfz2Lp5Nk/7MnXxUku4sg=;
 b=J2u9lFhC8B8rEb8QH6dURIQH6d25zFWs9CeXo49jUQy5IMwU3dYplO9MVkVV+WSb5v
 inHareEayuEGYUYBfZhUoa6qoYF52MORtIg36Al51MkDzSudthJQtuUObzqo/Te1XLgw
 703naqm+boXgXg2meisOFy57wpGfy2VhCpCXQY6uVsWYcJA7zhD7KGrZ4wqEDPVN5dee
 0gPX88WTtyynpjHitqTVcdf18dbN+ucIexVVK9xTZkk5Ee6LiuF1He1A5ugLgSc6o2/4
 U9obRCNO1Z7wNc0KR9A29ZpjonSngwcr2T1YrT53/U+RGEFtl4RWS1NeH2uw2tjtnMF+
 ll3w==
X-Gm-Message-State: ACrzQf3WOVrreV9bryCLsPWWSzFVuhil/PCBld2sGh8pKMXx+VrxqubI
 lg397gN1GvT7fvS1DZICkviBWDkIalgIUg==
X-Google-Smtp-Source: AMsMyM77pIC4SAiN652KQS12/L+BX6nOPGimGoeuhbeADImak2ZmbbMpcXNofdnseilJoR/OLIp+wA==
X-Received: by 2002:a05:6870:4195:b0:13c:8f93:8517 with SMTP id
 y21-20020a056870419500b0013c8f938517mr17367oac.147.1666975467913; 
 Fri, 28 Oct 2022 09:44:27 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:44:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 60/62] hw/sd/sdhci-internal: Unexport ESDHC defines
Date: Fri, 28 Oct 2022 13:39:49 -0300
Message-Id: <20221028163951.810456-61-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

These defines aren't used outside of sdhci.c, so can be defined there.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20221018210146.193159-4-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
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
2.37.3


