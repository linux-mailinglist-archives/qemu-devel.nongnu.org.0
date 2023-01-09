Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC75A662590
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:29:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqj8-00039M-BV; Mon, 09 Jan 2023 06:54:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqj6-00038f-JE
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:54:04 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqj5-000896-62
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:54:04 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso6468699wms.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Ex3NPUGvPkrE4NbytzYcH01U3eur12SK2WO3g4Dkuc=;
 b=roX9pbyNuYzkTx5SFY4T28SUdC6McGy0ZFo+OU3EDN/uBL8CSDu0c/Jz4nzsxvSxC/
 PWl/ZbXVxMf76NngqO3p479YO0itIdX4kXx7+Fnx+kNOfhXfx6diBx27Xks/PYNL1Dkk
 PKSv+wiHAfuaIEef5sqMQrDUyyx0dKTb2Lj9/3z4GE/M22x7y6B8bfH1xeuJFwYhetQp
 ru9ouXwWk+tATYFui0G7bfilQAXhGSPoe+kjw47W+T9mKZQf2UpCC7SUKq5qr+ed2MeV
 k+Ytm0LmwBvYWKaifSN3Qf5tDtLgGLD1ggazYklEFtWotkmGNhkdhoZC/LdauWFPyHhk
 8IjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Ex3NPUGvPkrE4NbytzYcH01U3eur12SK2WO3g4Dkuc=;
 b=Jubb5yevPA9r5cAwWkXN5D2I2XQUn0Jf3bgst58Yrui3rwvI2ks3KeqwVG0mmM3RRo
 p+IAVPEmBSH694gmxfC6FaTr9AcZNnB1/jzo8O7arjXKCR60nDY1qqTeHGuhCeF7DVVF
 A1JaATflbbmjyVvpGg5pJoMOjXNgaOvlu1j9KD2eLo0c9VTda9ymn2Zx5OCYjs+hwdhk
 HHOMIsTm6X8d5dLHI86Wrl8odJf+I3wEapjiH96Mja3dHOKaV5PeKHdTrsrdbgMzB8CK
 iMs2YuZgWHQtmBAEWPsJ+KuO54wiQgF3qlNA6UaN8r0mJOgLxnX8szZvtInugxWMGBMU
 mrjw==
X-Gm-Message-State: AFqh2kqoFnT3FiZboeOR68C6t4P8DWu1WPHO4mLMk6uk5fJ1gmiNSFzx
 tgyA3odUgM73mjzJJZKdaJsXXOKJv1MYZ4Lo
X-Google-Smtp-Source: AMrXdXsStwz5FubuXkSg6FHw3LW3kjnDTRyqwHZjw0Xb3sCHCx4jCBzD6OZVq7XHNY8OJZWo/jS0vw==
X-Received: by 2002:a05:600c:3545:b0:3d9:a145:9ab with SMTP id
 i5-20020a05600c354500b003d9a14509abmr26827508wmq.39.1673265241710; 
 Mon, 09 Jan 2023 03:54:01 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a05600c458a00b003d35acb0fd7sm16646985wmo.34.2023.01.09.03.54.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:54:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 09/13] hw/arm/omap_sx1: Remove unused 'total_ram' definitions
Date: Mon,  9 Jan 2023 12:53:12 +0100
Message-Id: <20230109115316.2235-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
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

The total_ram_v1/total_ram_v2 definitions were never used.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/omap_sx1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 57829b3744..84b7059f7c 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -91,8 +91,6 @@ static const MemoryRegionOps static_ops = {
 #define flash0_size	(16 * 1024 * 1024)
 #define flash1_size	( 8 * 1024 * 1024)
 #define flash2_size	(32 * 1024 * 1024)
-#define total_ram_v1	(sdram_size + flash0_size + flash1_size + OMAP15XX_SRAM_SIZE)
-#define total_ram_v2	(sdram_size + flash2_size + OMAP15XX_SRAM_SIZE)
 
 static struct arm_boot_info sx1_binfo = {
     .loader_start = OMAP_EMIFF_BASE,
-- 
2.38.1


