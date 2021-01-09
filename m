Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6C02EFF87
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:44:18 +0100 (CET)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDbN-0007ol-FC
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTi-00015X-6J; Sat, 09 Jan 2021 07:36:22 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTg-0001gV-GG; Sat, 09 Jan 2021 07:36:21 -0500
Received: by mail-pl1-x62d.google.com with SMTP id j1so7122157pld.3;
 Sat, 09 Jan 2021 04:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XsYyOi2OZpNJC/4Ru50m0sZSQZAyiL3Ec/GdFu9piXs=;
 b=MEmtSnpE7C/H1ANy6VQ2NYk8qxzplQE+2ouV8oKkLGia0lakMUNuy1aUDkyseCH/q/
 Gg37F1EvwNNxnRc6sZ7L30LZFOyfSwjZypgSoEGI/ziN7HgWehz6RRCKA2BcTuegYcJI
 vPg50M50oIxnXtAr9F7GWLS8X1pRVAb2FMHFa0hCkgO/m539h5XLarf6ro5WDK8fmCv3
 9c0Wshe7LymPoDg+9kmP28cyfVesLkzOAYCkSfiIi68xz/+hA9zLJ93sxb5YNjUUXpUw
 mLJ1C/5MZHS5pJ9um3ZcjHuxEBcxe2L96l4VUruGKpUrkcD2ybtcrxm4QG7Sy9h8oVi6
 pzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XsYyOi2OZpNJC/4Ru50m0sZSQZAyiL3Ec/GdFu9piXs=;
 b=Lx3AyAbDRDsQJ3PTskUm8oOHMeqtmaiLIfMzWJFrshjQ79b/YPo0Fg+aWWAcIPpGNb
 eoEqv9FOiZivkr0IlPJoKMigPbKzmmbLsMX4c1cslIGVP4z6nznSoAUfrlUPVjiUv5g6
 vlwh7k5AHjNxy7DKhbGB7aytKvL+3nucBFmQGo2vfz6/kW6JkIGrfrLvfxNpx1++Etwy
 dcTZSIREHWyH6cOWbijt7YIiqHrh6yLu3/zpk1DdJQdV/uyNe6iEuH8RbZnXFmbraWyV
 cdYAVAI47/g/wCzqwCRkSmR0sVGposObM2PBSX+cfPIjHkgo3Fx3gOXZ5o0wlQXZZN24
 0x5Q==
X-Gm-Message-State: AOAM532onYI/4s1+TwCZwJMa7kVgGk0lYBmJfblXk3ni4eMd2q1AR3nc
 Z0Hzoz29WcXt+KWpY/u5zUo=
X-Google-Smtp-Source: ABdhPJxgheoTQ4iQqcjKfnfozsUxwV5gPH4yE1oPXoIpGBmImUXOnHZUp5lrDvAs0SPdou/Q3zdA9Q==
X-Received: by 2002:a17:90b:3596:: with SMTP id
 mm22mr8603229pjb.235.1610195778931; 
 Sat, 09 Jan 2021 04:36:18 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id b10sm12840748pgh.15.2021.01.09.04.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 04:36:18 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 3/6] hw/ssi: imx_spi: Remove imx_spi_update_irq() in
 imx_spi_reset()
Date: Sat,  9 Jan 2021 20:35:42 +0800
Message-Id: <20210109123545.12001-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210109123545.12001-1-bmeng.cn@gmail.com>
References: <20210109123545.12001-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62d.google.com
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

Usually the approach is that the device on the other end of the line
is going to reset its state anyway, so there's no need to actively
signal an irq line change during the reset hook.

Move imx_spi_update_irq() out of imx_spi_reset(), along with the
disabling of chip selects, to a new function imx_spi_soft_reset()
that is called when the controller is disabled.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v3:
- new patch: remove imx_spi_update_irq() in imx_spi_reset()

 hw/ssi/imx_spi.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 8d429e703f..880939f595 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -241,9 +241,20 @@ static void imx_spi_reset(DeviceState *dev)
     imx_spi_rxfifo_reset(s);
     imx_spi_txfifo_reset(s);
 
+    s->burst_length = 0;
+}
+
+static void imx_spi_soft_reset(IMXSPIState *s)
+{
+    int i;
+
+    imx_spi_reset(DEVICE(s));
+
     imx_spi_update_irq(s);
 
-    s->burst_length = 0;
+    for (i = 0; i < ECSPI_NUM_CS; i++) {
+        qemu_set_irq(s->cs_lines[i], 1);
+    }
 }
 
 static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
@@ -351,12 +362,8 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
         s->regs[ECSPI_CONREG] = value;
 
         if (!imx_spi_is_enabled(s)) {
-            /* device is disabled, so this is a reset */
-            imx_spi_reset(DEVICE(s));
-
-            for (int i = 0; i < ECSPI_NUM_CS; i++) {
-                qemu_set_irq(s->cs_lines[i], 1);
-            }
+            /* device is disabled, so this is a soft reset */
+            imx_spi_soft_reset(s);
 
             return;
         }
-- 
2.25.1


