Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F0E2FB66D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:43:52 +0100 (CET)
Received: from localhost ([::1]:37214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rIV-0004Zb-1P
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rF3-0002eU-Cl; Tue, 19 Jan 2021 08:40:17 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:42203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rF0-0003SW-Vq; Tue, 19 Jan 2021 08:40:17 -0500
Received: by mail-io1-xd36.google.com with SMTP id z22so12880980ioh.9;
 Tue, 19 Jan 2021 05:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oiihH8sKNgK5xD8DeghnjaSCCliV7K2EmcdKNzWFMnc=;
 b=UHaRsLyi5NJoG8COyy6jkxtOyIZODSFFa/1bT4dujU9af284rVM3EEbEyPCvqxLHUi
 IuHVk5Sd9U7YqhUKq/ZZvA5KPHpIYO67FW7Kj++qOEV6noarNeLpz3BVDDcHiy2+Eki0
 Bw/K49KtxOZ5R44OO4WJPwaeJJId5WTAB0x1qNxeEvWxe4JiDT75ly0IGxMTs1s/IX8k
 /83m4sYHWwSxL3fWyJoIqVWkwqT8Huiihmwa8rcwJdcHvUrYC/PUnAaF7j/G4Prsp3AX
 0bL/3UKXXcYh1b5YBAK8mKPmKZHo4kgqmgUttCFICTqRO0FJoiw94uE8S/O4B+uD2dK3
 rjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oiihH8sKNgK5xD8DeghnjaSCCliV7K2EmcdKNzWFMnc=;
 b=ki6mgueQwWUYtApC/crnOixx1dWGttD45qZNA5udwVzJ7FSFSl0Xq6vuPAnkc1tmWx
 xEwTINFLvhHH3Taku3653VwBIg22vgsQk4KF8N6+/oZRHlLOy8C0xoF62JDkcHb9WHRa
 KyXxt4TvvnwUVJbjP+fYrNPdKxmqfjlD7yQiZ2x4Ju+sRr45e8C+FXAJtM0QDsenGNwL
 vfj+eTho4Yr0ZAlgEDcxUDJLiFC3Sdf7f4CnUQmS/wG8K3HgDlL4b3v2MA9Ir43XCul/
 Nl9RBJajn0uGLtdaR17sOrIDFqBop8iCY3nJ6X8bpecNEHjBJg69WZL1XTCEFyRDGdTp
 5PAw==
X-Gm-Message-State: AOAM532t/iuBh5MTheLZjJH4UaH1rcP30+5DOxyIHmr/hiHbQkSq7b2K
 FHtye0Nm3i+vA5uoncPtD+M=
X-Google-Smtp-Source: ABdhPJxfh5HQNrYxvZ1KHzBQCjgpfg1wXcw9SNejJBLULXklP2CIK+qbeNWq4gn4DHJLpavuJRjaDg==
X-Received: by 2002:a05:6e02:19cc:: with SMTP id
 r12mr3507627ill.4.1611063613054; 
 Tue, 19 Jan 2021 05:40:13 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id s6sm11089546ild.45.2021.01.19.05.40.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 05:40:12 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 00/10] hw/ssi: imx_spi: Fix various bugs in the imx_spi
 model
Date: Tue, 19 Jan 2021 21:38:56 +0800
Message-Id: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd36.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This v8 series is based on the following 2 versions:

- v5 series sent from Bin
  http://patchwork.ozlabs.org/project/qemu-devel/list/?series=223919
- v7 series sent from Philippe
  http://patchwork.ozlabs.org/project/qemu-devel/list/?series=224612

This series fixes a bunch of bugs in current implementation of the imx
spi controller, including the following issues:

- remove imx_spi_update_irq() in imx_spi_reset()
- chip select signal was not lower down when spi controller is disabled
- round up the tx burst length to be multiple of 8
- transfer incorrect data when the burst length is larger than 32 bit
- spi controller tx and rx fifo endianness is incorrect
- remove pointless variable (s->burst_length) initialization (Philippe)
- rework imx_spi_reset() to keep CONREG register value (Philippe)
- rework imx_spi_read() to handle block disabled (Philippe)
- rework imx_spi_write() to handle block disabled (Philippe)

Tested with upstream U-Boot v2020.10 (polling mode) and VxWorks 7
(interrupt mode).

Changes in v8:
- keep the controller disable logic in the ECSPI_CONREG case
  in imx_spi_write()

Changes in v7:
- remove the RFC tag

Changes in v6:
- new patch: [RFC] remove pointless variable initialization
- new patch: [RFC] rework imx_spi_reset() to keep CONREG register value
- new patch: [RFC] rework imx_spi_read() to handle block disabled
- new patch: [RFC] rework imx_spi_write() to handle block disabled

Changes in v5:
- rename imx_spi_hard_reset() to imx_spi_soft_reset()
- round up the burst length to be multiple of 8

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
  hw/ssi: imx_spi: Round up the burst length to be multiple of 8
  hw/ssi: imx_spi: Correct the burst length > 32 bit transfer logic
  hw/ssi: imx_spi: Correct tx and rx fifo endianness

Philippe Mathieu-Daudé (4):
  hw/ssi: imx_spi: Remove pointless variable initialization
  hw/ssi: imx_spi: Rework imx_spi_reset() to keep CONREG register value
  hw/ssi: imx_spi: Rework imx_spi_read() to handle block disabled
  hw/ssi: imx_spi: Rework imx_spi_write() to handle block disabled

Xuzhou Cheng (1):
  hw/ssi: imx_spi: Disable chip selects when controller is disabled

 include/hw/ssi/imx_spi.h |   5 +-
 hw/ssi/imx_spi.c         | 138 +++++++++++++++++++++++++++++------------------
 2 files changed, 90 insertions(+), 53 deletions(-)

-- 
2.7.4


