Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D722EB9AD
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 06:57:21 +0100 (CET)
Received: from localhost ([::1]:56916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx1ou-0006Rs-5G
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 00:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1nF-0004oV-GQ; Wed, 06 Jan 2021 00:55:37 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1nD-0004ux-Ta; Wed, 06 Jan 2021 00:55:37 -0500
Received: by mail-pf1-x429.google.com with SMTP id t8so1093201pfg.8;
 Tue, 05 Jan 2021 21:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GoRyg9SHz3SU7GVb6+KfUus8j+YhS4cNFNlNjHUUGco=;
 b=B/jW2r+pLXwu8clwVwOHii8sZ2Qg/M2UMn+Dssj+MxQJOJpKfJ3AsQr1An5TwG+Ddf
 ip5Xidu9OX/9pTRlmLBkKaNkRnb2/cLMQZiVZ6/M19toahn81p9rLxhZ7DTzwua6otSm
 6TsB2xL5DhUNMV9A69cLlbtYIMRTKwMOz9fXTlH+Z1JbHyY461XqutuM+oxf8b48NxDM
 UbI54xXMX/gwqPSvHtMhUWdB/E/+1QYi+Nz54YkQGAM80V6sIWHP/Kb3NJsSVpFZB01o
 R5S1yuiYFL07xKMZ/aoQnnbOszyDHJHBJP+/rrCPe0pEu01CDOU4tM3yL8DTH4rpsuPQ
 59Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GoRyg9SHz3SU7GVb6+KfUus8j+YhS4cNFNlNjHUUGco=;
 b=bSOhuMfhMjfB/boylPSgmpO46Zn5nP7CyV9nNYmE98e3K9lQaObMpUGr7wQvNSUbYD
 Oy7MvuTqgEdzomSaFWc5H1ZFYPB3NGtUDRpGg9zEvw/o/swy9prGky5aClMhYVJSPKU8
 AlSUMFJXuuc0ebv3Skyn/OBqs5wLpvskoq7t/TObhFIxqCdL+I+Wt2u4RHkA2rNBCG31
 plfgYO5kfaU2AUc8y22nEicYNN1YwkhkRvXKrXEIFpDLFDO0HJMBbBqRut7alaubTWbo
 Zd/VRAdYFPsYLKw8T4jHvz1eOL3UbE5FAVGIG6qXxR6sYrDiUpiO26SkIoIJEcP6fSWC
 Pt3w==
X-Gm-Message-State: AOAM530zhUZc7/mEzzDbEyB6JXQUxuVXkh6zEyKs1ESosCEMc5AJJq9W
 gGqkU9fAhfBvi6BrfzreKeo=
X-Google-Smtp-Source: ABdhPJwCkNzyz84eenQKejGpATQyx7D7zQlRZLKh84ND8uO9Dgt2cJk09jacCJOl+XXOV+Xou5r3ZA==
X-Received: by 2002:a65:6382:: with SMTP id h2mr2793618pgv.365.1609912533635; 
 Tue, 05 Jan 2021 21:55:33 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id c62sm1070503pfa.116.2021.01.05.21.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 21:55:33 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] hw/ssi: imx_spi: Fix various bugs in the imx_spi model
Date: Wed,  6 Jan 2021 13:55:18 +0800
Message-Id: <20210106055522.2031-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x429.google.com
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

- chip select signal was not lower down when spi controller is reset
- transfer incorrect data when the burst length is larger than 32 bit
- spi controller tx and rx fifo endianness is incorrect

Tested with upstream U-Boot v2020.10 (polling mode) and VxWorks 7
(interrupt mode).

Changes in v2:
- Fix the "Fixes" tag in the commit message
- Use ternary operator as Philippe suggested

Bin Meng (3):
  hw/ssi: imx_spi: Use a macro for number of chip selects supported
  hw/ssi: imx_spi: Correct the burst length > 32 bit transfer logic
  hw/ssi: imx_spi: Correct tx and rx fifo endianness

Xuzhou Cheng (1):
  hw/ssi: imx_spi: Disable chip selects in imx_spi_reset()

 include/hw/ssi/imx_spi.h |  5 ++++-
 hw/ssi/imx_spi.c         | 27 ++++++++++++++++++++-------
 2 files changed, 24 insertions(+), 8 deletions(-)

-- 
2.25.1


