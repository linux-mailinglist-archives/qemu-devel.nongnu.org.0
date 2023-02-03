Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95A5689C4C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:56:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxTf-0001f5-1z; Fri, 03 Feb 2023 09:55:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxTa-0001ZL-NG
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:55:43 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxTY-0005qu-OD
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:55:42 -0500
Received: by mail-wr1-x429.google.com with SMTP id h16so4856207wrz.12
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U1UtAD1cxyxTdrK64YRV25P2sKPgBwmLWBAD4nN05ls=;
 b=q4O+smZKeQby8HBGS4pYTaumSRPE1EGF5VbFbCDCCGDcSImm4HEe4VQiNk4M1PodFN
 YlwZXv55pW2ueGjoJLN6hUxi+u2IFqQpQzpPbcalTiXRXvyVCWLpLyLk5nSM/jSU3ikn
 GfzlzUxz+t8g0g4nuk8CUMO5UWrgk6dnzA+TcJKEEO/KFk2ohJsTLPW0z9zeOEQocKwE
 clU/7+xEIL/6jxdTcKhdtGE0d4bUE8wYDyH5D9FmGQrdLhSnaOe72HGZQLu0SGfyIWj4
 KYbU79eWEsWjaIr5VvTGm5ndw3ZL12ivsHmHdfHavfdPcCmNsCe68xu3xdli3Z/2NmB6
 yUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U1UtAD1cxyxTdrK64YRV25P2sKPgBwmLWBAD4nN05ls=;
 b=o2sqis+ETWCjdbfoNr4R51Nftw/T0OZA8HEDl4Pzg1IzkTz5syTcYISlSF0EtcWk1c
 kCYQg3XdV+sxmlyM32DW57EUZiekakpQvnL8du8Dk1EC2ylUEiHih3wzEpReEccPCGIj
 SdFcC4BUigpu2569OMS/5TnWVZv7UxiShiLID/naoAXT099CEN512atJm/3oCTp6B2Pp
 cixWVYpzAh0hLZukwhe0xIFkYfmpzh3BgXt2GnG+JrVvnzrqLonFpqiH6xiQArtbbVfK
 gAbcO5fLAFdRSkX+57QtHNvfYJ2c3yHGtnUEFYiyNP8WQmcbNFhNF1dMFuvFCxcERjUo
 Rw6w==
X-Gm-Message-State: AO0yUKVXBQPvjkaM/wri0I8n/cIrrVYnxc+2GxF8GNk5QFtZ27FMJCYL
 Xl63Y1aHVQaXjpQS61/ei3mtbwPzOaRE2Ai0
X-Google-Smtp-Source: AK7set/hn/JlOUi+WNVHGgCkXzupniiCdZZp/wMwYYCupoAqZRSSF2I4qEiOG+TT7JaAgzqkc9EZ6Q==
X-Received: by 2002:a5d:420d:0:b0:2c3:ba99:44bc with SMTP id
 n13-20020a5d420d000000b002c3ba9944bcmr7819727wrq.68.1675436138396; 
 Fri, 03 Feb 2023 06:55:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4d10000000b002bbed1388a5sm2170114wrt.15.2023.02.03.06.55.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:55:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/15] hw: Use QOM alias properties and few QOM/QDev
 cleanups
Date: Fri,  3 Feb 2023 15:55:21 +0100
Message-Id: <20230203145536.17585-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

Since v1:
- Addressed Markus & Zoltan review comments
- Introduce/use qdev_unrealize_and_unref()

These patches are extracted from a QOM/QDev refactor series,
so they are preliminary cleanups noticed while working on it:

- Use correct type when calling qdev_prop_set_xxx()
- Unify some qdev properties in MIPS models
- Replace intermediate properties by link properties
- Remove DEFINE_PROP_DMAADDR() macro which is used one time
- Use qdev_realize_and_unref() instead of open-coding it

Philippe Mathieu-Daudé (15):
  hw/pci/pcie_sriov: Replace fprintf(error_pretty) -> 
    warn_reportf_err()
  hw/qdev: Introduce qdev_unrealize_and_unref()
  linux-user/syscall: Do not open-code qdev_unrealize_and_unref()
  hw/pci/pcie_sriov: Do not open-code qdev_unrealize_and_unref()
  hw/i386/sgx: Do not open-code qdev_realize_and_unref()
  hw/ppc/sam460ex: Correctly set MAL properties
  hw/arm/nrf51: Alias 'flash-size' QOM property in SoC object
  hw/arm/fsl-imx: Alias 'phy-num' QOM property in SoC object
  hw/usb/hcd-ohci: Include missing 'sysbus.h' header
  hw/display/sm501: Embed OHCI QOM child in chipset
  hw/display/sm501: Alias 'dma-offset' QOM property in chipset object
  hw/display/sm501: Unify common QOM properties
  hw/qdev: Remove DEFINE_PROP_DMAADDR() and 'hw/qdev-dma.h'
  hw/mips: Declare all length properties as unsigned
  hw/mips/itu: Pass SAAR using QOM link property

 hw/arm/fsl-imx25.c           |  3 +--
 hw/arm/fsl-imx6.c            |  3 +--
 hw/arm/fsl-imx6ul.c          |  8 ++++----
 hw/arm/fsl-imx7.c            | 12 ++++++------
 hw/arm/microbit.c            |  5 ++++-
 hw/arm/nrf51_soc.c           | 10 +---------
 hw/core/qdev.c               |  9 +++++++++
 hw/display/sm501.c           | 33 ++++++++++++++-------------------
 hw/i386/sgx.c                | 14 ++++++--------
 hw/intc/mips_gic.c           |  4 ++--
 hw/mips/boston.c             |  2 +-
 hw/mips/cps.c                | 35 ++++++++++++-----------------------
 hw/mips/malta.c              |  2 +-
 hw/misc/mips_cmgcr.c         |  2 +-
 hw/misc/mips_itu.c           | 30 ++++++++++++++++++++----------
 hw/nvram/nrf51_nvm.c         |  6 +++++-
 hw/pci/pcie_sriov.c          | 11 ++++-------
 hw/ppc/sam460ex.c            |  4 ++--
 hw/sh4/r2d.c                 |  2 +-
 hw/usb/hcd-ohci-pci.c        |  1 -
 hw/usb/hcd-ohci.c            |  3 +--
 hw/usb/hcd-ohci.h            |  1 +
 include/hw/arm/fsl-imx25.h   |  1 -
 include/hw/arm/fsl-imx6.h    |  1 -
 include/hw/arm/fsl-imx6ul.h  |  2 --
 include/hw/arm/fsl-imx7.h    |  1 -
 include/hw/arm/nrf51_soc.h   |  1 -
 include/hw/intc/mips_gic.h   |  4 ++--
 include/hw/misc/mips_cmgcr.h |  2 +-
 include/hw/misc/mips_itu.h   |  9 ++++-----
 include/hw/qdev-core.h       | 20 ++++++++++++++++++++
 include/hw/qdev-dma.h        | 16 ----------------
 linux-user/syscall.c         |  3 +--
 33 files changed, 125 insertions(+), 135 deletions(-)
 delete mode 100644 include/hw/qdev-dma.h

-- 
2.38.1


