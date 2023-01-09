Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C8B662510
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:08:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqqz-0005tr-TJ; Mon, 09 Jan 2023 07:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqqw-0005sN-In
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:02:10 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqqu-0001zG-QY
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:02:10 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so6486111wms.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ItM+Iu1qenI4Asn3N+2BGwmWBIaMxDGBPbjt9fpGqnQ=;
 b=QNyTlnb1IY5R8p1K69couobceFCbFLhHPSPShrq9QFxGb/ZzkuLLvM9mMQNPxO6yV5
 cISFisfXVVzhsw//OvO+6U4GpPXQDPNsRCElS15o4yqw6BE5zEsFVy8YOeQHug6yLEAu
 fnpVVl4u0iyYIBHwgq0EAsNAiwqsylchJjV1pHimcwm8MVbuFe8MUNp5gqGE+zyE+EKT
 8t7tSRB0l3px2h0WZO0hHMS8Y90wNxD2TvN/Ps5w01LtDNFMUHuWlm9+Hp0PGJodSHy0
 Ms40iRB8JITDuqRIbYGFASE7dwYV3P9RM5RWE9TkgKB0La6Vv6B/HUKP/j2fabLaOrOd
 cSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ItM+Iu1qenI4Asn3N+2BGwmWBIaMxDGBPbjt9fpGqnQ=;
 b=GnEey4tBtkeyS/xh8gQnM6btQusEgE/HpG1Fp02dVrM1XaNq3wk5MucLHjBny6ZZWr
 AF70/Qx6zd4t5OGVtt97bbZky5omN03HmY+tnf18iQ/10ZUOYV/eIRgR1b8danqAfc1D
 kT+V47szHkwCw0CXEUTE1ICH2hvVMwWWmxQj3DeCbBetnkZMJM+fhcrlI8DzZAMBP1pM
 pqnHGi7ivbA0jC8VBrh+X0zaYj994Pl3XSG4SyJR5up7HuxvT7HKltuTSgAR3SL6RW+J
 x+6qgA9Rvq3uI48d6Er7N6jJdpOwwnZwZlsKOp8ueTHl6e9iXYX8bYjYXpaBM4jEQmD/
 uqqQ==
X-Gm-Message-State: AFqh2kofi7kCKTXjLC8Ga62ahT9AkmVeTJpiMfMrSk2sK5JmjmNT7i2T
 B5eTolgu546ZQANsAirbPNTCtpdjfAknl1Rw
X-Google-Smtp-Source: AMrXdXtnWqrLPnCf+G0xfs/2irFKLQfhikRUXYDcqIwYnRhXyjhIyQ53QRw+gzh+yRxd2be5mMwkPg==
X-Received: by 2002:a05:600c:3ca8:b0:3d9:e8b3:57fa with SMTP id
 bg40-20020a05600c3ca800b003d9e8b357famr4610956wmb.30.1673265727223; 
 Mon, 09 Jan 2023 04:02:07 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 he12-20020a05600c540c00b003d9ddc82450sm10914942wmb.45.2023.01.09.04.02.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:02:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Magnus Damm <magnus.damm@gmail.com>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 2/5] hw/microblaze/petalogix: Add FLASH_SECTOR_SIZE definitions
Date: Mon,  9 Jan 2023 13:01:51 +0100
Message-Id: <20230109120154.2868-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120154.2868-1-philmd@linaro.org>
References: <20230109120154.2868-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_ml605_mmu.c      | 3 ++-
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index a24fadddca..1888900156 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -45,6 +45,7 @@
 
 #define LMB_BRAM_SIZE  (128 * KiB)
 #define FLASH_SIZE     (32 * MiB)
+#define FLASH_SECTOR_SIZE   (64 * KiB)
 
 #define BINARY_DEVICE_TREE_FILE "petalogix-ml605.dtb"
 
@@ -107,7 +108,7 @@ petalogix_ml605_init(MachineState *machine)
      * 10th paremeter 0 means little-endian */
     pflash_cfi01_register(FLASH_BASEADDR, "petalogix_ml605.flash", FLASH_SIZE,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          64 * KiB, 2, 0x89, 0x18, 0x0000, 0x0, 0);
+                          FLASH_SECTOR_SIZE, 2, 0x89, 0x18, 0x0000, 0x0, 0);
 
 
     dev = qdev_new("xlnx.xps-intc");
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 9d959d1ad8..d14eff2514 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -40,6 +40,7 @@
 
 #define LMB_BRAM_SIZE  (128 * KiB)
 #define FLASH_SIZE     (16 * MiB)
+#define FLASH_SECTOR_SIZE   (64 * KiB)
 
 #define BINARY_DEVICE_TREE_FILE "petalogix-s3adsp1800.dtb"
 
@@ -87,7 +88,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
     pflash_cfi01_register(FLASH_BASEADDR,
                           "petalogix_s3adsp1800.flash", FLASH_SIZE,
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
+                          FLASH_SECTOR_SIZE, 1, 0x89, 0x18, 0x0000, 0x0, 1);
 
     dev = qdev_new("xlnx.xps-intc");
     qdev_prop_set_uint32(dev, "kind-of-intr",
-- 
2.38.1


