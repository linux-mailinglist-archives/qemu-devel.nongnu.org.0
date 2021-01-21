Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 599722FF3D5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:09:50 +0100 (CET)
Received: from localhost ([::1]:34154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fL2-0004O6-OF
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI1-0002AK-8s
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:06:41 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fHq-0005kB-1m
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:06:41 -0500
Received: by mail-wr1-x42a.google.com with SMTP id b5so2801648wrr.10
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8nqbDtQMOkOBn+f1BN8Oersk3By9xmyRL8fthJDxmjo=;
 b=OMYJb446YdwVx3Sz8joU7T+kM3g+emdeUmUmwAJmP0vm/vDp7u+KoFvNVdsomURPgQ
 o8jmaVyH7rXr6AzQFWQ77UrYuipREuLGezUFC7ROY/DxecXDUxBxL4Zi11K+zNoqhgNa
 Nz4a976Gm6t6oJxYkK4gSIz0CTG9IfrrdmA2KQVF8Jx/VkHZFyquNJupMjbFJPAKtV3D
 8OXI0LfmcMymb7WdjBfKkNJ2rvN5tcGiz+CA28H5wRYnKC7QNTTHQZe9d07a3dLQMP5A
 KqFM4GPPFw+3OnGWvkxqH2JcOFXtCOpCo0ytQcCIQ4oY5t+DMZrSbu4P2L773LvyhjI2
 M4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8nqbDtQMOkOBn+f1BN8Oersk3By9xmyRL8fthJDxmjo=;
 b=YhDYxr2EJXKJgr+rzeKjlRhFdrOCCIICzqkLeEKMVt4X7tcauO9QwpGwuDAwRxLPe6
 g+DGOssqQGApPo477X5bZXlIsLkbmIi/beXjuHUZxgKyy2ycgxtJWI2WsRY42Db+lHvJ
 3JYJCQb4e/X9gSmHQYG5rKwC/q0o6mtPPcyp0zyZINZHeEAlfpGZ2hbEQGb0Re5fHkU4
 N3ytcUp1FnzvPetB/0iishABWY4NzXZZqsr1p5bHFSgiOqNx+93pW/BNmLNSKLWfhmRa
 kgY+yNLHn30Au5VIDtjheohaIkcG7PK6U/eL6FC/i220KK5qWqqbLwmir+B472W+cQAS
 pwuQ==
X-Gm-Message-State: AOAM532nsUpQlOqd5cKnyr2371RUqek64y0iyfX4WkY9ScWV3Rp83h5i
 dPPg9p9JhFA1Pv/DjN27enEuGQ==
X-Google-Smtp-Source: ABdhPJwzMvBAbqpOlExYPPxe5bpK6FypAR3AzDi/RSUnBIf7sW3mvG+lnpX5SVzqCQd+0SDavFSgqw==
X-Received: by 2002:adf:f512:: with SMTP id q18mr899200wro.55.1611255985413;
 Thu, 21 Jan 2021 11:06:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/25] Convert CMSDK timer, watchdog,
 dualtimer to Clock framework
Date: Thu, 21 Jan 2021 19:05:57 +0000
Message-Id: <20210121190622.22000-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset converts the CMSDK timer, watchdog and dualtimer devices
to use the Clock framework instead of an integer property specifying
a frequency in Hz. The series is quito a lot of patches but they
should be mostly small and I hope easy to review.

The motivation here is the upcoming Arm SSE-300 model: this has a
new kind of timer device, which I wanted to write in the modern style
with a Clock input. That meant the ARMSSE container object needed
to know about Clocks, so converting the existing devices it used
to Clocks seemed like a good first step.

The series as a whole is a migration compat break for the machines
involved: mps2-an385, mps2-an386, mps2-an500, mps2-an511, mps2-an505,
mps2-an521, musca-a, musca-b1, lm3s811evb, lm3s6965evb.

Series structure:
 * patches adding new clock and ptimer API functions
 * add tests for the devices
 * add Clock inputs to devices, which do nothing for now
 * wire up the clocks in the code that uses the devices
 * make the devices use the clocks and ignore the frq properties
 * remove the setting of the frq properties in code using the devices
 * remove the frq properties from the devices
 
The new ptimer and clock functions are probably the most interesting part:
 * ptimer_set_period_from_clock(ptimer, clk, divisor)
   is for setting the period of a ptimer directly from a Clock (possibly
   accounting for the frequency being divided by some integer first) --
   this avoids possible rounding errors if we went via ptimer_set_period()
   or ptimer_set_freq()
 * clock_has_source()
   returns true if an input Clock has been connected to an output clock;
   this is for devices to be able to check in their realize method that
   a mandatory clock was wired up by the board
(More detailed info and rationale in patches 1 and 2.)

A couple of bits of food-for-thought as a result of working with the
relatively-new Clock APIs:
 * it might be worth thinking about whether we can have a fairly
   lightweight implementation of a clock-divider or clock-multiplier,
   because I feel they are pretty common. (For this series I opted
   just to handle this via the ptimer_set_period_from_clock()
   divisor argumuent.)
 * it feels a little awkward that devices with an input Clock need
   to do ptimer_set_period_from_clock() or similar both in their
   realize method (to cope with fixed-frequency input clocks, because
   the clock callback functions are not called when board setup code
   creates and configures those) and in the clock callback function
   (to cope with variable-frequency clocks)
 * I found it odd that ptimer's period representation is 64.32
   fixedpoint 2^-32 ns units, whereas Clock's is only 32.32
   (so ptimer can handle much larger periods than Clock can.)
   I forget why we didn't go for the same representation in Clock
   as we have for ptimer...
 * there's no MAINTAINERS entry for the Clock framework

I don't think these need to be blockers on this series, though.

thanks
-- PMM

Peter Maydell (25):
  ptimer: Add new ptimer_set_period_from_clock() function
  clock: Add new clock_has_source() function
  tests: Add a simple test of the CMSDK APB timer
  tests: Add a simple test of the CMSDK APB watchdog
  tests: Add a simple test of the CMSDK APB dual timer
  hw/timer/cmsdk-apb-timer: Rename CMSDKAPBTIMER struct to CMSDKAPBTimer
  hw/timer/cmsdk-apb-timer: Add Clock input
  hw/timer/cmsdk-apb-dualtimer: Add Clock input
  hw/watchdog/cmsdk-apb-watchdog: Add Clock input
  hw/arm/armsse: Rename "MAINCLK" property to "MAINCLK_FRQ"
  hw/arm/armsse: Wire up clocks
  hw/arm/mps2: Inline CMSDK_APB_TIMER creation
  hw/arm/mps2: Create and connect SYSCLK Clock
  hw/arm/mps2-tz: Create and connect ARMSSE Clocks
  hw/arm/musca: Create and connect ARMSSE Clocks
  hw/arm/stellaris: Convert SSYS to QOM device
  hw/arm/stellaris: Create Clock input for watchdog
  hw/timer/cmsdk-apb-timer: Convert to use Clock input
  hw/timer/cmsdk-apb-dualtimer: Convert to use Clock input
  hw/watchdog/cmsdk-apb-watchdog: Convert to use Clock input
  tests/qtest/cmsdk-apb-watchdog-test: Test clock changes
  hw/arm/armsse: Use Clock to set system_clock_scale
  arm: Don't set freq properties on CMSDK timer, dualtimer, watchdog,
    ARMSSE
  arm: Remove frq properties on CMSDK timer, dualtimer, watchdog, ARMSSE
  hw/arm/stellaris: Remove board-creation reset of STELLARIS_SYS

 docs/devel/clocks.rst                    |  16 +++
 include/hw/arm/armsse.h                  |  14 +-
 include/hw/clock.h                       |  15 ++
 include/hw/ptimer.h                      |  22 +++
 include/hw/timer/cmsdk-apb-dualtimer.h   |   5 +-
 include/hw/timer/cmsdk-apb-timer.h       |  34 ++---
 include/hw/watchdog/cmsdk-apb-watchdog.h |   5 +-
 include/qemu/typedefs.h                  |   1 +
 hw/arm/armsse.c                          |  47 +++++--
 hw/arm/mps2-tz.c                         |  14 +-
 hw/arm/mps2.c                            |  28 +++-
 hw/arm/musca.c                           |  13 +-
 hw/arm/stellaris.c                       | 170 +++++++++++++++++------
 hw/core/ptimer.c                         |  34 +++++
 hw/timer/cmsdk-apb-dualtimer.c           |  53 +++++--
 hw/timer/cmsdk-apb-timer.c               |  55 ++++----
 hw/watchdog/cmsdk-apb-watchdog.c         |  29 ++--
 tests/qtest/cmsdk-apb-dualtimer-test.c   | 131 +++++++++++++++++
 tests/qtest/cmsdk-apb-timer-test.c       |  76 ++++++++++
 tests/qtest/cmsdk-apb-watchdog-test.c    | 132 ++++++++++++++++++
 MAINTAINERS                              |   3 +
 tests/qtest/meson.build                  |   3 +
 22 files changed, 758 insertions(+), 142 deletions(-)
 create mode 100644 tests/qtest/cmsdk-apb-dualtimer-test.c
 create mode 100644 tests/qtest/cmsdk-apb-timer-test.c
 create mode 100644 tests/qtest/cmsdk-apb-watchdog-test.c

-- 
2.20.1


