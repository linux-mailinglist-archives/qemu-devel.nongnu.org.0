Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FC4662540
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:16:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqr5-0005vg-EK; Mon, 09 Jan 2023 07:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqr1-0005ub-Fh
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:02:15 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqqz-00023H-UG
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:02:15 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso6503035wmq.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TvirG+eigIopPOcx2cPrBXxTDVIETYN2my256Wba2R8=;
 b=NOg7+6knm0CCQUleysD4aDkuoTjxSl7z9cZ2+DcygWil0uXACfG7ia2ai8B5IviQnx
 /X/aaCcJzDltuBjxJ4aXgeMxRE+QrO9iKpf3pm2kUXgOtoNYPlSmqM4hn2FusOnDDhCE
 DwJlj13j9tRAuw20IvYm5axZ1b3rsloLEoJr5BBbfjjTljKfoKpiPHLIArmzMIsUfWMT
 JbpUe/pT3nGHJHr+dPTadR2Q1U2SpeQoUtmMpD4QN0jYba9cB148/bSWef5WBybs8fBV
 Erfv3NZsJThtosyeE+MslPqThUPHynwo/XzfiEJsGIyRT4YzxLvGnRkL8C6p4wNO07LT
 gaxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TvirG+eigIopPOcx2cPrBXxTDVIETYN2my256Wba2R8=;
 b=p+hS4TH+0ZiFAGeA3QxBKg1nP6FmFZscAYZT7A9T8JO+APBbMeAKZEr7//JwPohE8e
 KuPUZr8IkUlfwM+i/lOTT9w6B2u16AaFNFIYJcpzMGNcwKmW6k3P5gab/NZT6z+J0CdJ
 zCuOO3zbipU2rZpu6ZhRsCsne64gy0aOpWE1osdnOELD9CC7Ib5N/g/wLk0ss9WjkOTs
 EUzV0XYlHlOBbeuWGXPLngIkhuXQ1CyGu6V8cEpxJt/9dohR5dCkifm9Z6D2F/VDA71F
 f/jKUzGvtwh6I1nQ1P+XCUqUXw1mS3bIevzxVDp7jzW8goCnMrJGwr78Oz7eZMDDr1TC
 II3g==
X-Gm-Message-State: AFqh2kolfeYd9IjIwTgWnMgRvlcO7g7ueagai9vhx173jw5mrIgK0LMy
 c9E104N5vtc1dmTppvGpCEtrk8dTMjF26VE+
X-Google-Smtp-Source: AMrXdXuw3UqW3PaOv/WGNrfhIZbfOgP2qfoKeOG8sNd3bjf1j4tAPDsxdr3gBqQiOWdcMaSqqnZ7KA==
X-Received: by 2002:a05:600c:3d12:b0:3d2:392b:3165 with SMTP id
 bh18-20020a05600c3d1200b003d2392b3165mr45822556wmb.12.1673265732392; 
 Mon, 09 Jan 2023 04:02:12 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b003d1f2c3e571sm17369906wmq.33.2023.01.09.04.02.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:02:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Magnus Damm <magnus.damm@gmail.com>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 3/5] hw/mips/malta: Add the FLASH_SECTOR_SIZE definition
Date: Mon,  9 Jan 2023 13:01:52 +0100
Message-Id: <20230109120154.2868-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120154.2868-1-philmd@linaro.org>
References: <20230109120154.2868-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Ease code review by using the IEC binary prefix definition
for the FLASH_SIZE.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index c0a2e0ab04..e645ba1322 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -69,7 +69,8 @@
 #define FPGA_ADDRESS        0x1f000000ULL
 #define RESET_ADDRESS       0x1fc00000ULL
 
-#define FLASH_SIZE          0x400000
+#define FLASH_SIZE          (4 * MiB)
+#define FLASH_SECTOR_SIZE   (64 * KiB)
 
 typedef struct {
     MemoryRegion iomem;
@@ -1289,7 +1290,7 @@ void mips_malta_init(MachineState *machine)
     fl = pflash_cfi01_register(FLASH_ADDRESS, "mips_malta.bios",
                                FLASH_SIZE,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               65536,
+                               FLASH_SECTOR_SIZE,
                                4, 0x0000, 0x0000, 0x0000, 0x0000, be);
     bios = pflash_cfi01_get_memory(fl);
     fl_idx++;
-- 
2.38.1


