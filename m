Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDB2698FB3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:25:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSaUJ-0006aa-7j; Thu, 16 Feb 2023 04:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSaUH-0006Zr-4z
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:23:33 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSaUF-0006mb-Mw
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:23:32 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso3661440wms.2
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 01:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QI7Wf9G0Jc39nSEj59pWqN6n18XGhfwLUbGwL8xNPRs=;
 b=lIRpQNVn2UeERbZn/Jw3ftlwGwvZYCfIQaqO7skkjjFM3uRzzskkC1EIcik16xL4BE
 qdOnDkUoCmTh3emsZpcQB9pu8fLEUVdMdSzYfwzaxXG0Rhgwm2mqIltvn0APmSmsmHQu
 J+v/CnfB5aDq2LnDd035Kqm7AEDKwUaVF7RzUcqECRMjKUTUxUQRAwMB+pjm/EEvkqvH
 LneoiIT3tzpXTlB/NG0ZCkY9kyEHcyQXALFf5TI8h1qZiJ9l1OnGO7z//k6txwhdJs9W
 +WdSnDTeJk6+Re4oXVF/7k6gsGQeEuZgWW/otHVpnyZBl+GaBr0FpALvn8qlNhjHnDdK
 X0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QI7Wf9G0Jc39nSEj59pWqN6n18XGhfwLUbGwL8xNPRs=;
 b=5S/hZIEDQmh9lkWiIly/Letam2ov6tgYzVbjU4WQANgo8OjFj/U85yAJLCYs69L6Ot
 ypaf0SGZCbLN/R4vMwam5NOpn6JcEE1Mb5yqGhgaoWEzkZGAIA+9yTY7WFO6SIyISp/a
 drqAKo1pTekZdCs3fg98TA6vWpq75S7oxR/noy9cnOR9VRo9IdqUr8utkCyQuClX/s9w
 2MM/t9M5dfnxij7oatIjpudqzC5LkzDenlLLT3w6qrOcJiSRVMxdv561YI6nGGYldBgA
 ZdFroNYQWkF0v87iY0i+m8CMJ+eA1XuPb6E2IklgmYUbXs7RggssjXDSMET8r4F2VMdU
 7/2Q==
X-Gm-Message-State: AO0yUKUAExyo809K7FkMtU54q/Us6dg555aXEq/WNQKntjBOBcGw6YFl
 J6adS30fr6MhCJMc7csQxAQXmeCJR7xU0xLc
X-Google-Smtp-Source: AK7set+26HELIrSjqWtcNByTvC7slqzdJsH5id9vBiixyX0/0FIfqBElqh+w4Z4z6TAfIvGfknVlXg==
X-Received: by 2002:a05:600c:1f1a:b0:3df:ee43:860b with SMTP id
 bd26-20020a05600c1f1a00b003dfee43860bmr4322069wmb.23.1676539409870; 
 Thu, 16 Feb 2023 01:23:29 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u22-20020a05600c211600b003e2058a7109sm3924358wml.14.2023.02.16.01.23.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Feb 2023 01:23:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Francisco Iglesias <francisco.iglesias@amd.com>
Cc: qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/arm: Add missing ZynqMP ZCU102 -> USB_DWC3 Kconfig
 dependency
Date: Thu, 16 Feb 2023 10:23:27 +0100
Message-Id: <20230216092327.2203-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since commit acc0b8b05a when running the ZynqMP ZCU102 board with
a QEMU configured using --without-default-devices, we get:

  $ qemu-system-aarch64 -M xlnx-zcu102
  qemu-system-aarch64: missing object type 'usb_dwc3'
  Abort trap: 6

Fix by adding the missing Kconfig dependency.

Fixes: acc0b8b05a ("hw/arm/xlnx-zynqmp: Connect ZynqMP's USB controllers")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2d157de9b8..b5aed4aff5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -389,6 +389,7 @@ config XLNX_ZYNQMP_ARM
     select XLNX_CSU_DMA
     select XLNX_ZYNQMP
     select XLNX_ZDMA
+    select USB_DWC3
 
 config XLNX_VERSAL
     bool
-- 
2.38.1


