Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8032F05E7
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 09:17:27 +0100 (CET)
Received: from localhost ([::1]:51656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyVug-0004mi-Do
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 03:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyVsc-0002pS-2P; Sun, 10 Jan 2021 03:15:18 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:42226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyVsa-0005wV-9A; Sun, 10 Jan 2021 03:15:17 -0500
Received: by mail-pg1-x52f.google.com with SMTP id g15so10546158pgu.9;
 Sun, 10 Jan 2021 00:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uth7qFYZcAGIlpDOu6/OFlBV9OZB6Hp44dj92RTEM2Y=;
 b=aj6nIjKftcjdfPVQivkwQ1BVAO+XE4P9ILDpZV6dlITFk+zxIPFqYbbTnYFC3BzC0q
 45TwuCIzcbWlSlkExS/akjD5DLQHPNUDaSi+GTL4tnXZjUldppclIcCCHJWvW4Vatiad
 P9kYfckqggtpPv99Cb9/CpjgfD6C6m3DOqlnm+A+uB+Ls7gUnxlVCqZiDjGSkRG3IhtG
 hN+9m+vwvCG2HZEqm++lEVxegm5U+ZtMIR45b4c7WtCSXfEvhT0YaGKISdiew3Z/iQ7b
 vU99eQaXWCP58ZL62AvA9h5L3RiGxTJ1qOfntIIBORCxYI29N/O9/WNu0uU+w/9ACeTR
 EkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uth7qFYZcAGIlpDOu6/OFlBV9OZB6Hp44dj92RTEM2Y=;
 b=Oj7Xce5Y3KxxleID+Oq9ybrrEbeUjmJwwReRmiT7Zytz5CcXnbCJaXxPIU3NT9BSYz
 NXzqeGg4JgL+knEXOVnbVXfm2whJe9lbds3NiNTfhVyS8Yjbn6Y3EPLMszqsqYuquYI7
 zv4vZRwqLM088OvubS6wmPEcOyAXgXhdlPaRL+1KqcT6t8PXUVEKNcTSAfeIVTFmOOPT
 TEnzgsXzLEsOty1nDBpV5aNxc+NYX3m0yICVlrMJwWRnXTsyL/zdMzD9qXYKCb7GIFMZ
 hWa+NCpNSI1Ao/EOJdYMcUrJf/JkaQ8vaAfGcrGJqGm9TWlFsNuE0wjMM08aE4oeFr5z
 WwnA==
X-Gm-Message-State: AOAM532rUV7BZIzLeI1QrVDyUpOtaa4pn1f0wxTjZEGunDDAyxNEcvbL
 tmGIQlwPSo308PuenZ7TXPM=
X-Google-Smtp-Source: ABdhPJxi0nX+MxBktlLtavI/gTen/FDHpyrYlkwkn/Am7JOaXZlztnn+QfqRqbY0M5T5gLvpH6GPAg==
X-Received: by 2002:a63:5d10:: with SMTP id r16mr14606872pgb.406.1610266514474; 
 Sun, 10 Jan 2021 00:15:14 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id jx4sm13519070pjb.24.2021.01.10.00.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 00:15:13 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 0/6] hw/ssi: imx_spi: Fix various bugs in the imx_spi model
Date: Sun, 10 Jan 2021 16:14:23 +0800
Message-Id: <20210110081429.10126-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52f.google.com
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

This series fixes a bunch of bugs in current implementation of the imx
spi controller, including the following issues:

- chip select signal was not lower down when spi controller is disabled
- remove imx_spi_update_irq() in imx_spi_reset()
- transfer incorrect data when the burst length is larger than 32 bit
- spi controller tx and rx fifo endianness is incorrect

Tested with upstream U-Boot v2020.10 (polling mode) and VxWorks 7
(interrupt mode).

Changes in v4:
- adujst the patch 2,3 order
- rename imx_spi_soft_reset() to imx_spi_hard_reset() to avoid confusion
- s/normal/common/ in the commit message
- log the burst length value in the log message

Changes in v3:
- new patch: remove imx_spi_update_irq() in imx_spi_reset()
- Move the chip selects disable out of imx_spi_reset()
- new patch: log unimplemented burst length
- Simplify the tx fifo endianness handling

Changes in v2:
- Fix the "Fixes" tag in the commit message
- Use ternary operator as Philippe suggested

Bin Meng (5):
  hw/ssi: imx_spi: Use a macro for number of chip selects supported
  hw/ssi: imx_spi: Remove imx_spi_update_irq() in imx_spi_reset()
  hw/ssi: imx_spi: Log unimplemented burst length
  hw/ssi: imx_spi: Correct the burst length > 32 bit transfer logic
  hw/ssi: imx_spi: Correct tx and rx fifo endianness

Xuzhou Cheng (1):
  hw/ssi: imx_spi: Disable chip selects when controller is disabled

 include/hw/ssi/imx_spi.h |  5 ++++-
 hw/ssi/imx_spi.c         | 42 ++++++++++++++++++++++++++++------------
 2 files changed, 34 insertions(+), 13 deletions(-)

-- 
2.25.1


