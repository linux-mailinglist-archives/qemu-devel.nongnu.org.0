Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442C02F3362
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:57:57 +0100 (CET)
Received: from localhost ([::1]:33908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzL7M-0000vv-Aa
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5E-0007l9-FS; Tue, 12 Jan 2021 09:55:44 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:55195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kzL5B-0004j5-Ou; Tue, 12 Jan 2021 09:55:44 -0500
Received: by mail-pj1-x102e.google.com with SMTP id cq1so1540862pjb.4;
 Tue, 12 Jan 2021 06:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6JkyBkYAckjgDlGoWxaUiUStT7GzBw8f+Vd8Us2poEQ=;
 b=RktSvR9thgQCq59D/Uxp3WROn6CZ09IZDh7WG2lSKjEV3i9I/BAk4tnmJeZ90WOKgw
 /GFtfnQCrerqS5rbQ6rdSdqy2LTAozypY2gkbPciDcyjsEa84NxhONdm52zVn1dl8RqD
 Ip+NtMLWXlIfREfCYTBzmieAN2HaBPaTK8j8USIi8ynS/eGfcIYhrQjKFnNBjaQIlVJD
 EnjjMWuv3OiUadcjoc9qZfFeXnjaoG0R5U9f2vNY7k+NCu2DCMv6Vt04ziKKAkNTE2UM
 P5p/2iGYq34w/7Lyv8U2AnLh0gfzQyWSNzl/Z68wusAmbOyZDhaEQ2/1eIpYAls38NmS
 F3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6JkyBkYAckjgDlGoWxaUiUStT7GzBw8f+Vd8Us2poEQ=;
 b=KDwtLqZmkEpXAaoH6w+8wWlsaubkFI/jqHawo9IMBUffBvH3rTBUf2arOOkEM2wSaX
 i5fddN36504s8ovjqWpLRQVt2aE5SGblPKxlBno74D16gClML7RXsErqzL8v62G230u4
 lXsZD4pVYRdjpGDgH6MBfAJz2PVbe0dSp8swYS6Eahp8cMHZgdE1O8tCPsJF5mLO14b9
 wdLWAxontBigut0thchWJetIemQsj/BQluZ+aJjoJ9g8ydMGsDXZDRc95MJG9MXTLwe8
 qmst+ViEGdmMoKiPidCY1NOTjHgIau9ouhUa5s2xO+OzJP+RkVmSQzhQrwcm9dswk+oW
 G+QA==
X-Gm-Message-State: AOAM532bR0+qCeyxCwFXeWAGv/sdRun28h8ry2Si+v/c6Rf6WJ4MtOhC
 eJYfRRI4w+JnklxpLm0YCdI=
X-Google-Smtp-Source: ABdhPJxouh1w1J4FT1OWPI+/KHOKk2bZNs9RKletchAolCTesmfVn/Bg80CPsdb+N/XJOXvBAOrWRA==
X-Received: by 2002:a17:90a:de94:: with SMTP id
 n20mr5206727pjv.196.1610463340191; 
 Tue, 12 Jan 2021 06:55:40 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id l141sm3593938pfd.124.2021.01.12.06.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:55:39 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5 0/6] hw/ssi: imx_spi: Fix various bugs in the imx_spi model
Date: Tue, 12 Jan 2021 22:55:20 +0800
Message-Id: <20210112145526.31095-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102e.google.com
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
- round up the tx burst length to be multiple of 8
- transfer incorrect data when the burst length is larger than 32 bit
- spi controller tx and rx fifo endianness is incorrect

Tested with upstream U-Boot v2020.10 (polling mode) and VxWorks 7
(interrupt mode).

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

Xuzhou Cheng (1):
  hw/ssi: imx_spi: Disable chip selects when controller is disabled

 include/hw/ssi/imx_spi.h |  5 ++++-
 hw/ssi/imx_spi.c         | 46 +++++++++++++++++++++++++++++-----------
 2 files changed, 38 insertions(+), 13 deletions(-)

-- 
2.25.1


