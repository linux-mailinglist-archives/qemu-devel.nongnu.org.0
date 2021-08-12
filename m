Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2394E3EA21D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:35:29 +0200 (CEST)
Received: from localhost ([::1]:44882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE77Y-0007uw-6e
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76C-00051y-GY
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:04 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE768-0007jM-QP
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:03 -0400
Received: by mail-wr1-x430.google.com with SMTP id h13so7366175wrp.1
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s0OMlxss9RP7UU4o48PD7CRtF4U64YbpYKbZT9wm3Uo=;
 b=fb5Z0sWTlBxpgIis2SXydn9BRlAb4ndLyFtJ9WnHwai8jEjmLjGkVAX28/blQQUHio
 A51e+hDuHedIQRM9iGx0CW96Q48cIjdC1ZLsFJBd/tWIUT1Zeq+lLKW/npUXcxkde4ZQ
 ELDRonMLlGhaRmX3SBkaCYLQBqMA+nBfG6LwRWp2VdlggeSqX74SRE5j9U+ixPEEiCVf
 NhpkirNUCJxAAJ18l84cCrWa0Gv35kcpXaXteKbQPd0PR/4NglC5Al1VLl/AfJMSp0Y4
 DEWL8uQeu11njbjHfGHA+CmDPb6pFUP6gue9wQ+1H4Iw4Iz7M5lvoyjVlsWiiyCagcCI
 K6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s0OMlxss9RP7UU4o48PD7CRtF4U64YbpYKbZT9wm3Uo=;
 b=q8VWwSpTvT4JhIB4ihncjPcS1b9q3slRa1IMkxIG4UusGURyKcxfiYV9cplDkhMcvt
 YrHL9esgwdqfEBdzDX9+YJmidT6Y9QwqfvXDVO+52S1NaFzQNMIwXNftrap7alpQTekD
 DIhp0jBZo9i2S1yKisHI6FV00WdDAvr+3nSiG23qUmuK0sjVdMUBib+CY6opt4sfeEEI
 7emctLN4BeaKES7iiHo11e0br3NQnOiw5Zgryv5jFnZQNgLk+MGXGz+iXGayLPnwws7A
 AV0ZbP+DVtBcD0vCTsF7ciHqkLIwgU2qf8ydlVChr5/tODqc4WIvFT+UpPrbOKzZsK6V
 kKMQ==
X-Gm-Message-State: AOAM531duKFrH0NlUH+I68BMWrOetDChOuuqEwvlmUarn1I2KQfBCD4d
 n1MIG/0Wu3ZDHSNrtHKSEBy7eA==
X-Google-Smtp-Source: ABdhPJz8epqufsq3vvBKq2QZL9yasAhIpiZzXBwII72DpXLcjKCRNfWNo1hbRrMo3/aktx88q4YXug==
X-Received: by 2002:adf:cd86:: with SMTP id q6mr2853447wrj.385.1628760839053; 
 Thu, 12 Aug 2021 02:33:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:33:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 00/25] arm: Get rid of system_clock_scale global
Date: Thu, 12 Aug 2021 10:33:31 +0100
Message-Id: <20210812093356.1946-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is mostly a (big) refactoring to use Clocks instead of a global. 
Review of the new multiplier/divider functionality I've added to the
Clock API would also be interesting.  If you're a maintainer for an
M-profile board that isn't covered by 'make check-acceptance' then
I'd appreciate it if you have time to test that this series didn't
accidentally break your board...

The Arm v7M systick timer can run off one of two clocks
(guest-selectable by writing the SYST_CSR.CLKSOURCE control
register bit):
 * the main CPU clock
 * a separate 'reference clock' which the SoC and board may
   or may not wire up

Currently we model this as:
 * the global variable system_clock_scale is set to the period in ns
   of the CPU clock by the board or SoC level code
 * the reference clock is a fixed 1MHz, hardcoded in armv7m_systick.c

This is very old code, dating back to the first v7M support in 2007.
We now have a Clock API, so we can model clocks using something a bit
more complicat^Wsophisticated than a global variable.

The series starts with some refactoring to move the creation of
various sub-devices including the systick timers out of the nvic
object and into the 'armv7m' container object. The NVIC was doing some
of this for historical reasons, but it makes more sense to have all of
the "create subdevices and map them into the right place in the
peripheral region of the address space" be in one place. This also
means that when we start wiring Clocks up we don't have to go via the
NVIC to get from the armv7m object to the systick timers.

We then add clock inputs to the systick device, which are initially
ignored. Subsequent patches wire up those clock inputs in SoC and
board level code. Once all the boards have wired up their clocks, we
can change the systick device to use those instead of the
system_clock_scale global. Finally we can delete all the places
setting the global.

For some of the boards the systick reference clock is a fixed
multiple/division of the CPU clock. To support this, the "clock:
Provide builtin multiplier/divider" patch enhances the Clock API to
let you configure a Clock such that all its children are run at a
given ratio of the parent clock.

For the different boards I have taken a variety of approaches:
 * sometimes the refclk frequency was easy to determine from
   the SoC docs, and the patches implement that, changing the
   behaviour from the old 1MHz fixed refclk. This is in
   effect a very minor bugfix.
 * in a few cases I couldn't determine the refclk frequency, so
   I have implemented those boards to retain the old 1MHz
   value, as at least no-behavioural-change
 * some SoCs don't wire up the refclk at all; with this series
   we will correctly implement that (the SYST_CSR.CLKSOURCE control
   register bit in the systick device is then read-only), so
   again a minor bugfix
In some SoCs the refclk should theoretically be guest-programmable; we
didn't implement that before and we still don't. I've put in a few
comments noting this missing feature where relevant.

The other user of the system_clock_scale global is the GPTM timer in
the stellaris board, so there's a patch converting that to also use
Clock input.

There are also a few patches implementing minor cleanups I noticed
along the way that I felt would be in the way if I didn't fix them up
first.

NB: this series is a migration compat break for all the M-profile
boards, because it adds Clock objects to vmstate structs.

I've tested this with 'make check-acceptance', which tests the
emcraft-sf2 board, and I've run some stellaris and various MPS images
I have locally.  Other affected boards (microbit, netduino2,
netduinoplus2, stm32vldiscovery) are untested (though 'make check'
confirms that they at least don't crash on startup...).  Testing from
maintainers of those boards would be appreciated.

thanks
-- PMM

Peter Maydell (25):
  arm: Move M-profile RAS register block into its own device
  arm: Move systick device creation from NVIC to ARMv7M object
  arm: Move system PPB container handling to armv7m
  hw/timer/armv7m_systick: Add usual QEMU interface comment
  hw/timer/armv7m_systick: Add input clocks
  hw/arm/armv7m: Create input clocks
  armsse: Wire up systick cpuclk clock
  hw/arm/mps2.c: Connect up armv7m clocks
  clock: Provide builtin multiplier/divider
  hw/arm: Don't allocate separate MemoryRegions in stm32 SoC realize
  hw/arm/stm32f100: Wire up sysclk and refclk
  hw/arm/stm32f205: Wire up sysclk and refclk
  hw/arm/stm32f405: Wire up sysclk and refclk
  hw/arm/stm32vldiscovery: Delete trailing blank line
  hw/arm/nrf51: Wire up sysclk
  hw/arm/stellaris: split stellaris_sys_init()
  hw/arm/stellaris: Wire sysclk up to armv7m
  hw/arm/msf2_soc: Don't allocate separate MemoryRegions
  hw/arm/msf2: Use Clock input to MSF2_SOC instead of m3clk property
  hw/arm/msf2-soc: Wire up refclk
  hw/timer/armv7m_systick: Use clock inputs instead of
    system_clock_scale
  hw/arm/stellaris: Fix code style issues in GPTM code
  hw/arm/stellaris: Split stellaris-gptm into its own file
  hw/timer/stellaris-gptm: Use Clock input instead of system_clock_scale
  arm: Remove system_clock_scale global

 docs/devel/clocks.rst             |  23 ++
 include/hw/arm/armv7m.h           |  24 ++
 include/hw/arm/msf2-soc.h         |   8 +-
 include/hw/arm/nrf51_soc.h        |   2 +
 include/hw/arm/stm32f100_soc.h    |   8 +
 include/hw/arm/stm32f205_soc.h    |   8 +
 include/hw/arm/stm32f405_soc.h    |   3 +
 include/hw/clock.h                |  29 +++
 include/hw/intc/armv7m_nvic.h     |   8 -
 include/hw/misc/armv7m_ras.h      |  37 +++
 include/hw/timer/armv7m_systick.h |  36 ++-
 include/hw/timer/stellaris-gptm.h |  51 ++++
 hw/arm/armsse.c                   |  20 +-
 hw/arm/armv7m.c                   | 260 +++++++++++++++++++-
 hw/arm/mps2.c                     |  17 +-
 hw/arm/msf2-soc.c                 |  68 +++--
 hw/arm/msf2-som.c                 |   7 +-
 hw/arm/netduino2.c                |  12 +-
 hw/arm/netduinoplus2.c            |  12 +-
 hw/arm/nrf51_soc.c                |  20 +-
 hw/arm/stellaris.c                | 396 ++++--------------------------
 hw/arm/stm32f100_soc.c            |  47 +++-
 hw/arm/stm32f205_soc.c            |  47 +++-
 hw/arm/stm32f405_soc.c            |  30 +++
 hw/arm/stm32vldiscovery.c         |  13 +-
 hw/core/clock-vmstate.c           |  24 +-
 hw/core/clock.c                   |  29 ++-
 hw/intc/armv7m_nvic.c             | 274 +--------------------
 hw/misc/armv7m_ras.c              |  93 +++++++
 hw/timer/armv7m_systick.c         | 116 ++++++---
 hw/timer/stellaris-gptm.c         | 332 +++++++++++++++++++++++++
 MAINTAINERS                       |   2 +
 hw/arm/Kconfig                    |   1 +
 hw/misc/meson.build               |   2 +
 hw/timer/Kconfig                  |   3 +
 hw/timer/meson.build              |   1 +
 36 files changed, 1292 insertions(+), 771 deletions(-)
 create mode 100644 include/hw/misc/armv7m_ras.h
 create mode 100644 include/hw/timer/stellaris-gptm.h
 create mode 100644 hw/misc/armv7m_ras.c
 create mode 100644 hw/timer/stellaris-gptm.c

-- 
2.20.1


