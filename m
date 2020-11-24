Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ADE2C2228
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 10:56:36 +0100 (CET)
Received: from localhost ([::1]:36840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khV3r-0006Rj-Kr
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 04:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khUxR-0007aP-9n; Tue, 24 Nov 2020 04:49:57 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khUxP-0006Qw-Pi; Tue, 24 Nov 2020 04:49:57 -0500
Received: by mail-wr1-x431.google.com with SMTP id i2so2584261wrs.4;
 Tue, 24 Nov 2020 01:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NfRI0+56SFFtHGyrX9unE7nGxVbOu1hWXRLHpH7OE80=;
 b=G5ccGzqTQyIITHD7IcZUmDnczwnQEeINoKcSuoAW6gaaJm7JHfgeQPSSCOepWg5HSr
 Y7n5baj+PbvQ1fej0rDZP7uQ54XDb7OqLyE8nWkzy0SKLRSHT6ASEWawKz6WQU7OcxrU
 V5o5jeVQwKhCae08xjIKxMahsrW9QgxtVUAgBgZGgZzHh1cwDg/C/jATR/DvHH+BhzFY
 SH0Lbgz6C7M8Y6bGc/KBFtPI7oOSaMq1c3i74zpmxShw10sIa8PWznz1u4JqbBVHOIe7
 BgPYMwzVCLv2Bhqg80Yd+alwY4sJKgQF1plcbf7wLcORO5KEYNspiWCDK49yo/IzCdbZ
 OkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NfRI0+56SFFtHGyrX9unE7nGxVbOu1hWXRLHpH7OE80=;
 b=a1FRHLdmZ+TOpQbiW/Tl6Bod/ucxEe1P2gL/2HuyGiLjo7C2YJZJNoGVRvaa7W/LZy
 +zqfOjxAZ9yeqlsVUN+maHMC0ssXMuQEY5jLopfoM386uJAK8xVZA2lpUhTDshVmzHr6
 4OeHunfCOSLfUp71RgBkpT3iT9Zayu2mr3k6yil/UraiF2c6O7v+XhX9QskPX0LSDVqp
 NmRXvErfrLJOhMxLSksexNwKZm6nm4Mxe4BrNLrV/xZs7PM3gDCc5dPfZ7WD5IAKqm5E
 RtoachG1V/i5nDbjEsqtkQs06Skh6yX2tWGKyo1QqyQ2B2fBfEPcUqpjymLCW+vnrzQj
 c8MA==
X-Gm-Message-State: AOAM533AVrGxQRv5Wt79sxcOpTiePk9j13P+FJpuCzRcGfqlaxlk48LR
 wPPHUq31Dg78moOrMuxamuTottaVRAc=
X-Google-Smtp-Source: ABdhPJxi1zfmtR+drn0VQuVmAuyyGkUJw6l4d6UBQ0Z3YknDsTq6pqzv/nLxmYIB1vOGQQVAoptsgA==
X-Received: by 2002:adf:a549:: with SMTP id j9mr4251967wrb.199.1606211393726; 
 Tue, 24 Nov 2020 01:49:53 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id w15sm24813651wrp.52.2020.11.24.01.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 01:49:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2? 2/4] hw/arm/exynos4210: Add SD bus QOM alias on the
 SoC
Date: Tue, 24 Nov 2020 10:49:39 +0100
Message-Id: <20201124094941.485767-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201124094941.485767-1-f4bug@amsat.org>
References: <20201124094941.485767-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to select a particular SD bus from the command
line, add a QOM alias on the SoC (using an unique name).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/exynos4210.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index ced2769b102..a60f08d372a 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -408,6 +408,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
 
     /*** SD/MMC host controllers ***/
     for (n = 0; n < EXYNOS4210_SDHCI_NUMBER; n++) {
+        g_autofree char *bus_name = NULL;
         DeviceState *carddev;
         BlockBackend *blk;
         DriveInfo *di;
@@ -432,6 +433,10 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
         sysbus_mmio_map(busdev, 0, EXYNOS4210_SDHCI_ADDR(n));
         sysbus_connect_irq(busdev, 0, s->irq_table[exynos4210_get_irq(29, n)]);
 
+        /* Alias controller SD bus to the SoC itself */
+        bus_name = g_strdup_printf("sd-bus%d", n);
+        object_property_add_alias(OBJECT(s), bus_name, OBJECT(dev), "sd-bus");
+
         di = drive_get(IF_SD, 0, n);
         blk = di ? blk_by_legacy_dinfo(di) : NULL;
         carddev = qdev_new(TYPE_SD_CARD);
-- 
2.26.2


