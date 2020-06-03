Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0841ED2D3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 16:58:48 +0200 (CEST)
Received: from localhost ([::1]:33444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgUqt-00013S-5U
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 10:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1jgUlN-0007Oa-AF; Wed, 03 Jun 2020 10:53:05 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1jgUlM-0000X8-50; Wed, 03 Jun 2020 10:53:04 -0400
Received: by mail-pf1-x444.google.com with SMTP id a127so1741968pfa.12;
 Wed, 03 Jun 2020 07:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=YYfsQEI6mVVlenNuylQvqBQ8xAkbBa0s1Rzkbdr9zHg=;
 b=NTEbjkWR8sQo/c8oTzTusq/4q3wfwmes5QEGIuRenmemPVTH56u1p192YuJrcPYjGx
 FLRoTLq9zKLSx03O2ROMVfWq2mLxIyXKz56PYiHXWYgxCx4xMM9y3FYbRC86CaT4d9FO
 DGrQGthsMeYRuRm/Cbh98V+0KHAbygJTBv6mzRfGzjMUoJsvbfBRBFDxyx9INiq++MKD
 eMo2HpI6F9KNPk/R/PZtOLhyAcPU2Xffg4ZuVWRgSPd89gijES8byw0zjRtVGKVj3wIX
 lrJLp6wQDoVQzXWVSqsdliavAnTU8N+pQ047fV0Uo9wGdkeKO9qOA1qwgcwmEuDbPXrm
 7DgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=YYfsQEI6mVVlenNuylQvqBQ8xAkbBa0s1Rzkbdr9zHg=;
 b=oVKcjLbCLENuTXEdPBasov8FfFdaC0dJWezNy1Cutc6mIPkrb1yy4I95Oc73QuCqp2
 HzrSkInfSWTn8B/dfrFSsNkWCHAYnyKGLo8Tlea4LUK0Opa8eW6L18gQAU4JC1/lqBdR
 Bu/KW0TQWxQo4Gw9rgdH3riySG7/7sBwrjui7mDLgvqCuTc7+Zn6P8g85JZqraXRW77d
 80tlm1Jwk6X+MsXCPuf6SAsLukGj/1smvdvjVQ9ig4hx/yovwVdd2LwfNRGqJIBuCQwH
 1z7cFdwjBocKYcl42ujhy3ripCeEMUzRfPEB6+cbQ3rb5Q4g7ienTU5IEJh7bUtWB2CB
 tFtA==
X-Gm-Message-State: AOAM5330nwDIjdJD8e+Gj9ZD6jNUWVXyedfBq8mXzaA/CeeN7OfGyqM/
 Bq/1KsLoG7e95bI8LKwTkac=
X-Google-Smtp-Source: ABdhPJwi1AfGaoWkMN/i2xvo1UhP/V9wWBNzeKymJYbrkESSYuMopkeH1rXzKI2C4Q45h6XCK+wYgw==
X-Received: by 2002:a63:3503:: with SMTP id c3mr28232188pga.371.1591195981870; 
 Wed, 03 Jun 2020 07:53:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id p12sm2230061pfq.69.2020.06.03.07.53.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Jun 2020 07:53:00 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/2] sd: sdhci: Implement basic vendor specific register
 support
Date: Wed,  3 Jun 2020 07:52:56 -0700
Message-Id: <20200603145258.195920-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=groeck7@gmail.com; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Linux kernel's IMX code now uses vendor specific commands.
This results in endless warnings when booting the Linux kernel.

sdhci-esdhc-imx 2194000.usdhc: esdhc_wait_for_card_clock_gate_off:
	card clock still not gate off in 100us!.

Implement support for the vendor specific command implemented in IMX
SDHCI hardware to be able to avoid this warning.

Patch 1/2 implements vendor specific command support in the SDHCI core
code. At this time, only IMX vendor command support is implemented,
but the implementation is written with expandability in mind.

Patch 2/2 enables IMX SDHCI vendor extensions for all affected emulations.

v2:
- Added Reviewed-by: and Tested-by: tags to patch 1/2
- Added missing error checks to patch 2/2
- Added Tested-by: tag to patch 2/2

----------------------------------------------------------------
Guenter Roeck (2):
      sd: sdhci: Implement basic vendor specific register support
      hw: arm: Set vendor property for IMX SDHCI emulations

 hw/arm/fsl-imx25.c     |  6 ++++++
 hw/arm/fsl-imx6.c      |  6 ++++++
 hw/arm/fsl-imx6ul.c    |  2 ++
 hw/arm/fsl-imx7.c      |  2 ++
 hw/sd/sdhci-internal.h |  5 +++++
 hw/sd/sdhci.c          | 18 +++++++++++++++++-
 include/hw/sd/sdhci.h  |  5 +++++
 7 files changed, 43 insertions(+), 1 deletion(-)

