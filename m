Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEA36897D5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 12:38:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNuNH-0007vP-44; Fri, 03 Feb 2023 06:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNF-0007um-CP
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:36:57 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNC-0001Ag-Ar
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:36:57 -0500
Received: by mail-wr1-x432.google.com with SMTP id ba1so314338wrb.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 03:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TR+VT6mWulFtprMX/0aWWSf6NU7JTRRTCnR3RQnSJ/A=;
 b=aLGUAK+Vxgb1+133klDP6KhZwIkldsBCH+0VCw2v5NvTA+1FuqeERRyK5DxjrtBuT7
 WtFtow5XZB0sREudGblBZnDuC61w0mmt59LOvCnNohhzZb3WRBiz9JJbTAnAfq3dhaYg
 GxzT53+aN+5OZmf+W4ZA0FxDkPt95ToheIwNLNt6alblWKoqQh5r7XStqQQJe6fuhVtX
 KLadcB7/x8cUs8joB3V7CH8ZCUloZpR4wUNCyD2g7YXfX5wQjKIGb7uja0ylsCDJtUUT
 qdngJoV87Ed4398L/cUtngdjm/AqPSonAW5hJ+IollDu0+1/1wEzhY1t2dO2fG9UqgFc
 eoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TR+VT6mWulFtprMX/0aWWSf6NU7JTRRTCnR3RQnSJ/A=;
 b=OzI/q4iGYZTk8y6CXpUl/YWfSIqYmpVAY4jlZxx5PuWwEv0Tp9MfX2OEIUvZEf76JA
 +5PUR2EYnhgpS6tXR2wpiG+qTnfn0QKmtfzIwX3ynLefA8fEpl0ggB5ad1z1jF8SYMxe
 gRYrR5ID30hv54sZhP4St5V2sRLYn/6SzSq8nZc6h/Z6yzc+sdIOvEgbtTbO51W5NUNY
 atSqswQx6bEM6YHSS8CW9grguWN8bv0FRRvr4YeHgJP39KWcX5WNtJlmGnLngAdP5jUa
 udLrqPY9nAEny+jsTqu2PwtRaXgV/45BERgP5h2UYbrRFLOBmXqpFpQainYoJpdO8Ow2
 ab9w==
X-Gm-Message-State: AO0yUKW5tIhOP6ZjXjuZogtaotn7opP1QHHJg7aiWuSS5r+8wmyY+n7V
 ccmvI+FBMQZMYRoSX4yVCShWDtkQp6qI8KlT
X-Google-Smtp-Source: AK7set/MtUE40DsQsHY2+NxuFeKlimZiAB7rBg6xcDbvKrtQiU+PcJQhF4xXvVVHq1CFTRAQQhJhrA==
X-Received: by 2002:a5d:60c4:0:b0:2c3:b4c:a4f with SMTP id
 x4-20020a5d60c4000000b002c30b4c0a4fmr8239273wrt.67.1675424212329; 
 Fri, 03 Feb 2023 03:36:52 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a05600015ca00b002bfd137ecddsm1884866wry.11.2023.02.03.03.36.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 03:36:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/9] hw: Use QOM alias properties and few QOM/QDev cleanups
Date: Fri,  3 Feb 2023 12:36:41 +0100
Message-Id: <20230203113650.78146-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

These patches are extracted from a QOM/QDev refactor series,
so they are preliminary cleanups noticed while working on it:

- Use correct type when calling qdev_prop_set_xxx()
- Unify some qdev properties in MIPS models
- Replace intermediate properties by link properties
- Remove DEFINE_PROP_DMAADDR() macro which is used one time
- Use qdev_realize_and_unref() instead of open-coding it

Philippe Mathieu-Daudé (9):
  hw/i386/sgx: Do not open-code qdev_realize_and_unref()
  hw/ppc/sam460ex: Correctly set MAL properties
  hw/arm/nrf51: QOM-alias 'flash-size' property in SoC object
  hw/arm/fsl-imx: QOM-alias 'phy-num' property in SoC object
  hw/usb/hcd-ohci: Include missing 'sysbus.h' header
  hw/display/sm501: QOM-alias 'dma-offset' property in chipset object
  hw/qdev: Remove DEFINE_PROP_DMAADDR() and 'hw/qdev-dma.h'
  hw/mips: Declare all length properties as unsigned
  hw/mips/itu: Pass SAAR using QOM link property

 hw/arm/fsl-imx25.c           |  3 +--
 hw/arm/fsl-imx6.c            |  3 +--
 hw/arm/fsl-imx6ul.c          |  8 ++++----
 hw/arm/fsl-imx7.c            | 12 ++++++------
 hw/arm/microbit.c            |  5 ++++-
 hw/arm/nrf51_soc.c           | 10 +---------
 hw/display/sm501.c           | 22 +++++++++++-----------
 hw/i386/sgx.c                |  5 ++---
 hw/intc/mips_gic.c           |  4 ++--
 hw/mips/boston.c             |  2 +-
 hw/mips/cps.c                | 35 ++++++++++++-----------------------
 hw/mips/malta.c              |  2 +-
 hw/misc/mips_cmgcr.c         |  2 +-
 hw/misc/mips_itu.c           | 30 ++++++++++++++++++++----------
 hw/nvram/nrf51_nvm.c         |  6 +++++-
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
 include/hw/qdev-dma.h        | 16 ----------------
 29 files changed, 84 insertions(+), 113 deletions(-)
 delete mode 100644 include/hw/qdev-dma.h

-- 
2.38.1


