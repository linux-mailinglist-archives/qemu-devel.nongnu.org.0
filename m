Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3CA31B868
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:53:46 +0100 (CET)
Received: from localhost ([::1]:34868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcRl-0008Sb-86
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:53:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQ1-0006et-QS
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:51:57 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcPw-0003kp-Vv
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:51:57 -0500
Received: by mail-wr1-x430.google.com with SMTP id 7so8562619wrz.0
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zKBxTWgyl2c0Ezu3w8Ywtxl02/Y89qRFPX4kamMcCvU=;
 b=RQNh6QOmkr4lRQW3u7oQmOT68A+FVCCUin9ejKjaZHCAA0/SdKnXxOncbf0xRAJUw4
 RqDQTAN7tnMd6P+fChQ7uoIwRdfiNoS6VW1Nw1QIwa6bpVB/SxYE74gSCDhtQo4rVMvA
 CKCNNIwNbp8aXbb+U0bL/bwU14KOwni6hT+iJGXTgpDWccDJCT0v9kcmnCvWJet5d3lx
 8p3hARBkq+fVxQT3J4RLlvmKr3T1lVfsnpxAgjp9uEMKWO4STFTh7s4jdIiOhrfCPyt3
 ichDCMq5jlylAezosnM3uXlL9MfNJVCUeMVMDcs52IJMyN3etq5INLgH4pBcbXmi/Dq6
 8hYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zKBxTWgyl2c0Ezu3w8Ywtxl02/Y89qRFPX4kamMcCvU=;
 b=Mu9RZVPWb1wfKQpNJ95T9oJyVLERJx1+OVh2fl1pMI/sFsnbRhu9+hRxx/iTh6W80j
 J3FCDp5MG1efWCQRbnP04kLSpdBTUEn5bl9haVFD8qFJ1PdRSgX18ZMX0WMiXYQSyak6
 BXFd2BA6BJl4i3zm25XAA83W53Fo+ZwkHsdVKTgjx/ei79QWocZ1vjuCEjOAA5me2yxc
 R9veEyfBXE/2n9ghHBE3f5n4cO5lnsn3rBxy0WELtKfdL5IKJy8qClLfhgoZ6rjJRs/r
 8m6Vb6hL7Lrma8Cp98Yd+6S5+REUg9TlP8zsBrR4ugYe7h2+7pFipuX+F9FY+zV/O4dw
 nfTw==
X-Gm-Message-State: AOAM532nFOBxjb9pn+G3fMpKaLJu1mftsIh/+eLRXfxsBpBA3G+MMixx
 jK9AlUANWm1VmdlFc1W+C6eblA==
X-Google-Smtp-Source: ABdhPJxJ8ZZ2GRoLkLicMwjYJU+zKGFkIm3c4ZHTs1wttAfQiMiGa1+n3C6pAUgCCNpnmfBZqT5nLg==
X-Received: by 2002:adf:b611:: with SMTP id f17mr18118727wre.8.1613389911279; 
 Mon, 15 Feb 2021 03:51:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:51:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/24] hw/arm: New board model mps3-an524
Date: Mon, 15 Feb 2021 11:51:14 +0000
Message-Id: <20210215115138.20465-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchseries implements a new board model in the mps2/mps3 family,
based on Application Note AN524:
https://developer.arm.com/documentation/dai0524/latest/

v1->v2 changes (very minor):
 * renamed have-switches to has_switches
 * added missing initializations of num_leds and has_switches
   for new board model
Patches still needing review: 10 - 18, 20


Like the other MPS models, this board is an FPGA image; the AN524
image is based on the SSE-200, like the mps2-an521, but it is
for the MPS3 board rather than the MPS2+. The major differences
are QSPI flash and USB (which we don't model), and support for
2GB of RAM (which we do). Since the MPS3 is very similar to the
MPS2, I've implemented mps3-an524 as a subclass of TYPE_MPS2TZ_MACHINE,
sharing most of the code with mps2-an505 and mps2-an521.

The motivation for this model is two-fold:
 * Linaro's Zephyr team would like it, so they can test their
    code targeting the MPS3 on QEMU
 * It's a useful stepping-stone towards a future MPS family model
   which uses the SSE-300 and Cortex-M55. All the "make various bits
   of mps2-tz.c be driven by per-board data structures rather than
   hardcoding them" changes will be needed for that future board model.
   This way they can be code-reviewed now, rather than making the
   future patchseries even bigger (it will be pretty large even so,
   because of all the "implement SSE-300 model" patches).

thanks
-- PMM


Peter Maydell (24):
  hw/arm/mps2-tz: Make SYSCLK frequency board-specific
  hw/misc/mps2-scc: Support configurable number of OSCCLK values
  hw/arm/mps2-tz: Correct the OSCCLK settings for mps2-an505 and
    mps2-an511
  hw/arm/mps2-tz: Make the OSCCLK settings be configurable per-board
  hw/misc/mps2-fpgaio: Make number of LEDs configurable by board
  hw/misc/mps2-fpgaio: Support SWITCH register
  hw/arm/mps2-tz: Make FPGAIO switch and LED config per-board
  hw/arm/mps2-tz: Condition IRQ splitting on number of CPUs, not board
    type
  hw/arm/mps2-tz: Make number of IRQs board-specific
  hw/misc/mps2-scc: Implement CFG_REG5 and CFG_REG6 for MPS3 AN524
  hw/arm/mps2-tz: Correct wrong interrupt numbers for DMA and SPI
  hw/arm/mps2-tz: Allow PPCPortInfo structures to specify device
    interrupts
  hw/arm/mps2-tz: Move device IRQ info to data structures
  hw/arm/mps2-tz: Size the uart-irq-orgate based on the number of UARTs
  hw/arm/mps2-tz: Allow boards to have different PPCInfo data
  hw/arm/mps2-tz: Make RAM arrangement board-specific
  hw/arm/mps2-tz: Set MachineClass default_ram info from RAMInfo data
  hw/arm/mps2-tz: Support ROMs as well as RAMs
  hw/arm/mps2-tz: Get armv7m_load_kernel() size argument from RAMInfo
  hw/arm/mps2-tz: Add new mps3-an524 board
  hw/arm/mps2-tz: Stub out USB controller for mps3-an524
  hw/arm/mps2-tz: Provide PL031 RTC on mps3-an524
  docs/system/arm/mps2.rst: Document the new mps3-an524 board
  hw/arm/mps2: Update old infocenter.arm.com URLs

 docs/system/arm/mps2.rst         |  24 +-
 include/hw/arm/armsse.h          |   4 +-
 include/hw/misc/armsse-cpuid.h   |   2 +-
 include/hw/misc/armsse-mhu.h     |   2 +-
 include/hw/misc/iotkit-secctl.h  |   2 +-
 include/hw/misc/iotkit-sysctl.h  |   2 +-
 include/hw/misc/iotkit-sysinfo.h |   2 +-
 include/hw/misc/mps2-fpgaio.h    |   8 +-
 include/hw/misc/mps2-scc.h       |  10 +-
 hw/arm/mps2-tz.c                 | 632 +++++++++++++++++++++++++------
 hw/arm/mps2.c                    |   5 +
 hw/misc/armsse-cpuid.c           |   2 +-
 hw/misc/armsse-mhu.c             |   2 +-
 hw/misc/iotkit-sysctl.c          |   2 +-
 hw/misc/iotkit-sysinfo.c         |   2 +-
 hw/misc/mps2-fpgaio.c            |  43 ++-
 hw/misc/mps2-scc.c               |  93 ++++-
 17 files changed, 680 insertions(+), 157 deletions(-)

-- 
2.20.1


