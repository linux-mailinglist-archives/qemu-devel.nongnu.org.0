Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C00675468
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:29:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqVt-0002Uk-Pv; Fri, 20 Jan 2023 07:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIqVq-00027E-Ve
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:28:55 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIqVp-0000iW-0e
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:28:54 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so3546642wms.4
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 04:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FGfd+s93OXmBs1xShD51Cu54C0TFiZYgj8zpzf2YW5Y=;
 b=WlXXHnZ2syaih3huXt3wIS3At7kWXRjAuMnWrQg6l5JkcRd/fBElkYKJwMbheAkPkd
 FBIPPwcMiJAfaODB3NnDzN4SaC/NqwpVOgch/WXQFGnYkwLxm1svaAf9It0AyvfQUmht
 zMsBROX71V+oJyQsgeu7HtJIORaE2y/nBaOJBKO0Jj3bJ72q4dv6kwX4rYCR62Ftrftp
 O56Jwpe2LRVdnFQ7MDBfqDL9laB5BXT5YsdgGmAzmg68zdc0bFVnqEwSL8vomV97lmzt
 r1xeGlisbwQvi5Jw4l6RyKM1t+hY6KTHCMZlnYP+Fh4uuo99dzGCjhPHrOSOWSR2pkRW
 8cqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FGfd+s93OXmBs1xShD51Cu54C0TFiZYgj8zpzf2YW5Y=;
 b=0wxTKtLhr0pp00kGSEUDJniZR+Nt54U2hqQJMmSrtiQPQ9V4bWa2za2FEsEMaLO12p
 YYELXTPc4KxKgGCRmYPJvKDAbEhLcUR5Kaof37ERFVbhpuEOAy5pf4l0bm+9b4h5ilsj
 369p73ftvjwNngHInIgYfq9z9nhoz2/03Awjmtn2b5D2H/fwT4qIk088SA/XX5N5laSF
 48ajNxF+baeOePyTEVFdOj2R/BoCGL5AQU1UkYD5qb8akBwuTsCIH3xt650CU+m3ADW6
 LuO+uyVPjp7gk1k9ulbYobj25AlhZ437WKooCCUix/yR6uIGna+rjeNH7b122GPNeWjk
 Pj2A==
X-Gm-Message-State: AFqh2krxXwxlMkoputXcQpWs6+iFnfhmiythdsoOz8E0Ssg5Uwl5n1LR
 L3sQ+TIN6rsnGZh8UMBvarDFsDHgZVj0ulKA
X-Google-Smtp-Source: AMrXdXs+Q/LthPS4L2eg9P0MMAoa2XVNiohFk0OThXKHebUiVpj/GJlNDjcGrn2wPc46ScCCUjJH2Q==
X-Received: by 2002:a05:600c:210e:b0:3d9:ed30:6a73 with SMTP id
 u14-20020a05600c210e00b003d9ed306a73mr13892507wml.9.1674217728780; 
 Fri, 20 Jan 2023 04:28:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a05600c3ac400b003d9fa355387sm2082017wms.27.2023.01.20.04.28.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 04:28:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 2/2] tests/avocado: Truncate M2S-FG484 SOM SPI flash to 16MiB
Date: Fri, 20 Jan 2023 13:28:36 +0100
Message-Id: <20230120122836.81675-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120122836.81675-1-philmd@linaro.org>
References: <20230120122836.81675-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The M2S-FG484 SOM uses a 16 MiB SPI flash (Spansion
S25FL128SDPBHICO).  Since the test asset is bigger,
truncate it to the correct size to avoid when running
the test_arm_emcraft_sf2 test:

  qemu-system-arm: device requires 16777216 bytes, block backend provides 67108864 bytes

Add comment regarding the M2S-FG484 SOM hardware in
hw/arm/msf2-som.c.

Reported-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/msf2-som.c                   | 5 ++++-
 tests/avocado/boot_linux_console.py | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index a6df473ec9..7b3106c790 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -1,6 +1,9 @@
 /*
  * SmartFusion2 SOM starter kit(from Emcraft) emulation.
  *
+ * M2S-FG484 SOM hardware architecture specification:
+ *   https://www.emcraft.com/jdownloads/som/m2s/m2s-som-ha.pdf
+ *
  * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
@@ -87,7 +90,7 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
 
     /* Attach SPI flash to SPI0 controller */
     spi_bus = qdev_get_child_bus(dev, "spi0");
-    spi_flash = qdev_new("s25sl12801");
+    spi_flash = qdev_new("s25sl12801"); /* Spansion S25FL128SDPBHICO */
     qdev_prop_set_uint8(spi_flash, "spansion-cr2nv", 1);
     if (dinfo) {
         qdev_prop_set_drive_err(spi_flash, "drive",
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 49a4b22fe1..37600be4a2 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -399,6 +399,8 @@ def test_arm_emcraft_sf2(self):
         spi_hash = '65523a1835949b6f4553be96dec1b6a38fb05501'
         spi_path = self.fetch_asset(spi_url, asset_hash=spi_hash)
 
+        file_truncate(spi_path, 16 << 20) # Spansion S25FL128SDPBHICO is 16 MiB
+
         self.vm.set_console()
         kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE
         self.vm.add_args('-kernel', uboot_path,
-- 
2.38.1


