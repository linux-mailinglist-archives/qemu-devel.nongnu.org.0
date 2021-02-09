Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA27315014
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 14:23:44 +0100 (CET)
Received: from localhost ([::1]:51180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9SzW-0004O6-PW
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 08:23:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Swl-0002kE-Ql
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:20:51 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Swf-0000gt-Ie
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:20:51 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m13so21650287wro.12
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 05:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d86tePBRdT/Wa66ZnpeoY9R7MMLota3OwO1BIOPVBhg=;
 b=hWKpRV7F4fEO7pN+Ux32P9blPOhoeQWp5DYWryg166oFUR3+tZpcQ1uOeuC1M+nlUv
 R3dU3KuurRi1fJkdJLnB9/f5DFs/QRNPn5YKIPzyoXgejCHLHkue8f2WfXnhnXW6Qs/2
 CgBQyz1/l7h+QiX1mt6Hp6O3OIuHse9tM4ec+Fsha3orLQdicepUTG/R+VwHuZc3kbhR
 OJMU7gGNEj0sAWtEgVwmGz1sMPwrjbgfVt6W0gr6mwGqsbKxhaaLMBz12dzxz1H3epbB
 dcT3S06ptlSsaju39JXUOUTUdZcKgtGfBpIQntKDxbeAOjTgoCpHaAn5yI2Q7abN7eT2
 2K4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d86tePBRdT/Wa66ZnpeoY9R7MMLota3OwO1BIOPVBhg=;
 b=CHMuZjXz/hLzkDPv4B1GXIlFu0wTRcKkBBrzet9xtmFdkz98p27el5emOVYBovA5GB
 NecQu3sEWj/g+Vb773bjXWW7bDLYGOaU775o5M5kWMaBw/Du/gR+0gPX0q3Zo3WTVaRt
 37PkoYdnzgFal82FHUdUmyhQXL5i7TCRJ8zgjy9eRymCoLL1PZnkMu1cUAERRVBeho8U
 A6sv5094mi2BielXcY+90EgsObhYyiLIRP+m1TIgMaSxH7cp0Dp1VK3HufEDUY2/5dcz
 6rQ6w7ZquBChLyDLPFGBJ7SAhdClw6yBzqd2WbQAsJ99xa2nxyJ4fO/CRBmV1dIfx8R2
 Tk5w==
X-Gm-Message-State: AOAM532tXsYPcFwOuw8h6AsBRn1AoIUCWgXs/JxqJuAFFUc/VVkGUCKC
 Yazv73kdW7kwN0OHBhKwXI6JDw==
X-Google-Smtp-Source: ABdhPJx3J/L9XemB7YB9JMKIdQ1St34/M+uAyziTP9WJQTwqvCzWoZrc4HrFL2LbBPNltyNbHz5sfg==
X-Received: by 2002:adf:f549:: with SMTP id j9mr15987994wrp.347.1612876842933; 
 Tue, 09 Feb 2021 05:20:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm34752472wrh.16.2021.02.09.05.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 05:20:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] New APIs for the Clock framework
Date: Tue,  9 Feb 2021 13:20:36 +0000
Message-Id: <20210209132040.5091-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; this patchset proposes a couple of new APIs for Clock, which I
found I needed/wanted for a work-in-progress patchset.

In this v2, the only change from the RFC series is that as Luc
suggested I have made the clock-callback registration mechanisms
all take a new parameter specifying the mask of events which
the callback should be invoked for. (This is instead of calling
all callbacks on all events and requiring them to look at their
'events' argument to see if they should ignore the call.)

If people prefer I can keep hold of these patches until I have
the board-support series that makes use of them ready to post;
but I think if we're happy with the new APIs we could reasonably
put them in to the tree sooner (especially since patch 1 means
updates to all input Clock users).


The problem the first two patches are trying to solve is that I found
that I wanted the old value of the Clock's period when my device got a
notification about a frequency/period change. The current
ClockCallback API calls you after the period has changed, so the Clock
is already using the new period. I wanted this because my timer device
has a register that's basically a free-running up-counter; the value
of that counter can be calculated with:

  s->ticks_then + clock_ns_to_ticks(s->clk, now - s->ns_then);

where (ns_then, ticks_then) are a tuple of a QEMU_CLOCK_VIRTUAL time
and the tick count at that point. Whenever the clock frequency changes
we calculate a new (ns_then, ticks_then) to use as the baseline for
future counter value reads, but in order to do that we must calculate
ticks_then using the *old* clock period.

My solution to this is to add a ClockEvent argument to the callback
function, which is an enum:

  ClockPreUpdate : callback called before period change
  ClockUpdate : callback called after period change

When a callback function is registered a mask of event values tells
the framework which events the callback should be called for.

The problem the third patch addresses is that we don't have a function
for "tell me how many times this clock would tick in this length of
time". clock_ns_to_ticks() does the inverse of the clock_ticks_to_ns()
that we already have. Two points in particular where comment would be
useful:

 * I chose to make the overflow case (where a clock has a very short
   period and the specified length of time is very long, so the clock
   would tick more than UINT64_MAX times) just let the value wrap
   around, on the basis that usually this is being used to calculate a
   guest register value that's in a 64 bit or 32 bit register, and so
   wrap-around is the right behaviour.  But I'm not 100% set on this
   if somebody has a better idea.

 * The calculation needs to do a 96-bit / 64 bit => 64 bit division,
   for which the best thing we have is divu128(). This is particularly
   painful on 32-bit hosts. I don't suppose there's anything clever we
   can do to make this better ?

Patch 4 just uses clock_ns_to_ticks() in the one place in the
current codebase where we're currently using clock_ticks_to_ns()
and manual calculation.

thanks
-- PMM

Peter Maydell (4):
  clock: Add ClockEvent parameter to callbacks
  clock: Add ClockPreUpdate callback event type
  clock: Add clock_ns_to_ticks() function
  hw/timer/npcm7xx_timer: Use new clock_ns_to_ticks()

 docs/devel/clocks.rst            | 71 ++++++++++++++++++++++++++++----
 include/hw/clock.h               | 63 +++++++++++++++++++++++++++-
 include/hw/qdev-clock.h          | 17 +++++---
 hw/adc/npcm7xx_adc.c             |  2 +-
 hw/arm/armsse.c                  |  9 ++--
 hw/char/cadence_uart.c           |  4 +-
 hw/char/ibex_uart.c              |  4 +-
 hw/char/pl011.c                  |  5 ++-
 hw/core/clock.c                  | 23 +++++++++--
 hw/core/qdev-clock.c             |  8 ++--
 hw/mips/cps.c                    |  2 +-
 hw/misc/bcm2835_cprman.c         | 23 +++++++----
 hw/misc/npcm7xx_clk.c            | 26 ++++++++++--
 hw/misc/npcm7xx_pwm.c            |  2 +-
 hw/misc/zynq_slcr.c              |  5 ++-
 hw/timer/cmsdk-apb-dualtimer.c   |  5 ++-
 hw/timer/cmsdk-apb-timer.c       |  4 +-
 hw/timer/npcm7xx_timer.c         |  6 +--
 hw/watchdog/cmsdk-apb-watchdog.c |  5 ++-
 target/mips/cpu.c                |  2 +-
 20 files changed, 226 insertions(+), 60 deletions(-)

-- 
2.20.1


