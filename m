Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BF35F3819
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:49:44 +0200 (CEST)
Received: from localhost ([::1]:43960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofTJn-0000ES-Aa
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7t-00023Q-I0; Mon, 03 Oct 2022 16:33:26 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:42622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7q-00044o-A9; Mon, 03 Oct 2022 16:33:20 -0400
Received: by mail-ej1-x62d.google.com with SMTP id kg6so9313771ejc.9;
 Mon, 03 Oct 2022 13:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qSl8q2Yt18pzhM/m9zS0hfHCT0al6gLgVR8k+IN87Qc=;
 b=Eu9PIVkD8GOx0QVI/F9ZGum5KdEHex6zUN+XHSzqWatXXsyrdAgK+SHKDllwLd9KCG
 LJr0bmy2kn2/W/glWfV972aEg/fko+r8lN0uQmUcLIlMhBbIJRDOp6e0tLWgCICmAlzd
 S9tIIP3b2n+pAJwNqrFD9KhNm+Hnatejx+aVVmUAab5dg1ckRxbyu+ou3qEpGucN9bZV
 QyhaSWJ3iKIV6C7U+1yKY7e9d6IJL8Cba/7heYsguyxz31yvONjCAl8FzyPm8dCKdSmX
 dd0RIhJgBQMF3mqNycsnU1uqEGUozrEP7WQdcJMpxSiNxBOjtPgbyHepw3alAoy3fZnX
 OX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qSl8q2Yt18pzhM/m9zS0hfHCT0al6gLgVR8k+IN87Qc=;
 b=rIMsw6vioqHw9642Q0PabXd15dAYEq+RyGnLNLcFF5ZOwbS4QI68FA3tlCOMZ2Rzwx
 1rQDcYQKu8YfNlAlQ+fPCPVl8H7n9UWCXS8VemwEmLuo5sHMUuNvV2tQGw8Zn9y81B5W
 Gag+2bCke8b1UqC1gA1prIIRTtFJkgw9oqgBZ3MO38xLmp0/iRlTUDFcvHptS8DXgOWm
 yhZ6E1S9GykNLLvMwKBF3G+PC80Uagw+LULRAUprNLeLiYnTucF7Kpzn9ytzYj00KUJx
 OjKz7VtwF2T7xg1rvBn/6pyjpNKBKAoTyLL8S6W0CT+BE31kbZi+VWSVTWRJG8cQMNXr
 snEw==
X-Gm-Message-State: ACrzQf3CW2l/ZEgavQSobMPAHyQ8v8GTJxVuAlQdxDSoV8iUmtum1ASh
 nIv1UCI5iCOJ6dUr79FuN/EcVMvRtKs=
X-Google-Smtp-Source: AMsMyM7jLWnZucuC0UAg12mg9HicHT2QIUHqADYNAg1FeBsDiCIWiqBJEKkxUm3vwMVfFhJCs5AzoQ==
X-Received: by 2002:a17:907:3f0b:b0:781:e783:2773 with SMTP id
 hq11-20020a1709073f0b00b00781e7832773mr15837244ejc.610.1664829194519; 
 Mon, 03 Oct 2022 13:33:14 -0700 (PDT)
Received: from localhost.localdomain ([46.183.103.8])
 by smtp.gmail.com with ESMTPSA id
 lb9-20020a170907784900b0073ddd36ba8csm5978087ejc.145.2022.10.03.13.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 13:33:14 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 10/13] hw/sd/sdhci-internal: Unexport ESDHC defines
Date: Mon,  3 Oct 2022 22:31:39 +0200
Message-Id: <20221003203142.24355-11-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003203142.24355-1-shentey@gmail.com>
References: <20221003203142.24355-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
2.37.3


