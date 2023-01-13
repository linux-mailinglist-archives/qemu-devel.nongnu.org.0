Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED4566A3D5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 21:04:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGQFH-0003Vl-8W; Fri, 13 Jan 2023 15:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGQFF-0003Us-0E
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:01:45 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGQFD-0006kb-7T
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:01:44 -0500
Received: by mail-wm1-x334.google.com with SMTP id m3so15973381wmq.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 12:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4h32Jp869ZqboavElIPakrsSsrqP8c1Xy1WEU51P8z8=;
 b=vy1NDW2b8KQqG+096/fDeOCSOB9pljhDQn3VUQrjqLJ3+j/0ofIBo/qhQjyF4quVTY
 6G7ctubWc92GMA+DCs+xLCJplrYNAbEqZKZMtOaQHH+oXnCrzeVMkgX0z+L1ObdQSUPT
 kQZsj8/5/MQ8a6Tt+MQGjpyROLvTxLt6qfISVEDaKPRygmmQn12f2srVRf0EO2XWgy55
 2L4L4lZB/tZigslDXTfNsTo9d4LraTrpS+EDgo8nva8oVgFmDqll820zzCPMTfvnlbb+
 HUj0i3pHW74alG1M6uchPP4cSCFoLCUTlWwuoD3vx726IBMCPJfEYTFWVrc791Glfscl
 jb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4h32Jp869ZqboavElIPakrsSsrqP8c1Xy1WEU51P8z8=;
 b=1fHAWJRLrhGjfonPFq42jHaUhcY0euRqapvTaSehnpU1VnL3AsEKOFhFXaMGoo2rQK
 zWc3Y+83CiHl5UoxLLbfjSRUBcAxVKJlM4W4dU78vdKPWQpxUDP8SKJQAzKP8coKmAhn
 20VlAa3l2z7re37Q0hxmf5CGU6LuhiKSfFQcRljnSDjk8i1y2um2gaz6GySfZIJtEACW
 IPTCE7januTqaucAigBFGnvCoqCJ2iAUBK7/4SfC57t/L1Y2v8RvrjD/+ohbbJKx0NNA
 Hh65RJYaXfORxb6KiD3TgL4l4C2GCvMnitT67QUT3WUPhLcr/6eXqRrPNaCeCCkxyYv5
 gkuA==
X-Gm-Message-State: AFqh2koVZrOnU/vmSTdo0sF2f9SckZ1TkpNncZXnk9VAYxA2nWkZ9ESV
 vh1KGOkimxUn0QWU6IDUFN+Obd7/sh3/MFaC
X-Google-Smtp-Source: AMrXdXvbOy4rnQLsrZvKqPs3pvNuXQ/HDc0JQMb78qkoA20sj3GDEeO3E6A7oANujI/RV6DoryWWvw==
X-Received: by 2002:a05:600c:4f4f:b0:3d8:e0d3:ee24 with SMTP id
 m15-20020a05600c4f4f00b003d8e0d3ee24mr60245630wmq.37.1673640101616; 
 Fri, 13 Jan 2023 12:01:41 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a7bcd0f000000b003d9a71ee54dsm24909242wmj.36.2023.01.13.12.01.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 12:01:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/4] hw: QOM housekeeping around IOTHREAD / IRQ types
Date: Fri, 13 Jan 2023 21:01:34 +0100
Message-Id: <20230113200138.52869-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

- remove unused code
- use recent QOM macros
- use CamelCase typedef

Philippe Mathieu-Daudé (4):
  iothread: Remove unused IOThreadClass / IOTHREAD_CLASS
  hw/irq: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
  hw/or-irq: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
  hw: Replace qemu_or_irq typedef by OrIRQState

 hw/arm/exynos4210.c                  |  4 ++--
 hw/arm/mps2-tz.c                     |  2 +-
 hw/core/irq.c                        |  9 ++++-----
 hw/core/or-irq.c                     | 18 +++++++++---------
 hw/pci-host/raven.c                  |  2 +-
 include/hw/arm/armsse.h              |  6 +++---
 include/hw/arm/bcm2835_peripherals.h |  2 +-
 include/hw/arm/exynos4210.h          |  4 ++--
 include/hw/arm/stm32f205_soc.h       |  2 +-
 include/hw/arm/stm32f405_soc.h       |  2 +-
 include/hw/arm/xlnx-versal.h         |  6 +++---
 include/hw/arm/xlnx-zynqmp.h         |  2 +-
 include/hw/or-irq.h                  |  5 +----
 iothread.c                           |  4 ----
 14 files changed, 30 insertions(+), 38 deletions(-)

-- 
2.38.1


