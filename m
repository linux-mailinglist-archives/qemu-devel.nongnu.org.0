Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9705530A7A8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:32:17 +0100 (CET)
Received: from localhost ([::1]:37808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6YNM-0005rj-JD
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:32:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6YLU-0004Gc-PT
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:30:22 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6YLR-0003Yv-T0
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:30:20 -0500
Received: by mail-wr1-x42d.google.com with SMTP id 7so16399473wrz.0
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 04:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CV2Y2oGRe5J0uyLghoeskUluvVJnZKnrx9bsH+4fjss=;
 b=gkzCQ6YnKlPYqcGPw6V3OyjSF/zrkvXf4PpniIooiYtQ9OmbKEN4KkwmO6zTHL+s5H
 xwPLGyn9MUkuZTZc6gCRyXeMyVWrJMmHUUl7vMLlGBipWmoKKkaj3iLcazu3jDz8g9tV
 7zCCPTPPNn+KzvVbB5/4iI485bhVCD78sU9XvmyzoLKTaIWSbvCmtp+xcCJUvOggaCuQ
 ET4NsRWDVdrJ8NuvQvdqF9WUWUQswicot6s7P3beuWdY1PRpHjx4F1kSoyQsp0uf0Fpr
 /pGDUGUaXqfqfBgwdYEy8FCaQFseOgpXIMLm01pQFVAjlt1etMUdlFKZYQ4KaBwrLlmg
 hSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CV2Y2oGRe5J0uyLghoeskUluvVJnZKnrx9bsH+4fjss=;
 b=AvEBl+UjwIDr13E58Uf331k3mxof7IYkGoOp/8ZAOiwuiRfoldRQsri5L4ZXD4JRRB
 xQFBOf63/GmlOhzdN/1QRW5SK6i48gV26DzAOROmYQR/1grrARMKAZFZgQS6y/6IsUQ0
 72xPpDXJQa8zK2wrZqh65iXOfryQJSwONE4BxrcB/BmZz7bEux/aaojNqFexmZ7kWQeh
 NExCa6vVhvrGKph1fLvEsuTOtAa6gd7rNbW2CAyaUszO2x0IcHX4C+Jqv7OHZT+K76OU
 MQnZqKD3+Xp/Qjclh7YpEM/IL0rufY+p1CjHWb2XpmvwT3WINcxQZtVgJ4n6d8DV5UsD
 N2bw==
X-Gm-Message-State: AOAM530V+T+d5QbD5hgStdZnhAAmwf7RHQueMi/EwBgEum+dUNYelIrN
 1sY2oKl5m/MwQGXgskCRekzKvA==
X-Google-Smtp-Source: ABdhPJwqPpBCr40UABN7jigXvNNcfNuqvKH9wQ2UKHg9jy0h6VtiUvAQ6wNXo6O8bvIyi2nV9ijzmA==
X-Received: by 2002:a05:6000:1141:: with SMTP id
 d1mr17710688wrx.47.1612182616288; 
 Mon, 01 Feb 2021 04:30:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm20466278wmj.32.2021.02.01.04.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 04:30:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC 0/4] New APIs for the Clock framework
Date: Mon,  1 Feb 2021 12:30:09 +0000
Message-Id: <20210201123013.32308-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Luc Michel <luc@lmichel.fr>, Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; this patchset proposes a couple of new APIs for Clock, which I
found I needed/wanted for a work-in-progress patchset that includes a
model of a new timer device, the "System Timer" documented in the Arm
SSE-123 Example Subsystem Technical Reference Manual:
  https://developer.arm.com/documentation/101370/0000/system-time-components/system-timer?lang=en

It's going to be a little while before I post the patchseries with the
new timer device implementation, because I need to complete a model of
the SSE-300 SoC and an MPS board model that uses it; so I wanted to
put these out as an RFC to see if people agree on the APIs I'm
suggesting.

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

All callback functions are called for all events, and they look at the
'event' argument to see whether they need to do anything.  This means
that the patch has to update every ClockCallback in the codebase to
take the new argument and do nothing if it is not ClockUpdate, but
luckily there aren't many of them; this seemed better than trying to
manage multiple separate callback pointers.

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

Side note: there is currently no MAINTAINERS entry for the
clock framework. Any volunteers? It would cover

F: include/hw/clock.h
F: include/hw/qdev-clock.h
F: hw/core/clock.c
F: hw/core/qdev-clock.c
F: docs/devel/clocks.rst

thanks
-- PMM

Peter Maydell (4):
  clock: Add ClockEvent parameter to callbacks
  clock: Add ClockPreUpdate callback event type
  clock: Add clock_ns_to_ticks() function
  hw/timer/npcm7xx_timer: Use new clock_ns_to_ticks()

 docs/devel/clocks.rst            | 54 ++++++++++++++++++++++++++++++--
 include/hw/clock.h               | 52 +++++++++++++++++++++++++++++-
 hw/arm/armsse.c                  |  8 +++--
 hw/char/cadence_uart.c           |  5 ++-
 hw/char/ibex_uart.c              |  5 ++-
 hw/char/pl011.c                  |  5 ++-
 hw/core/clock.c                  |  5 ++-
 hw/misc/bcm2835_cprman.c         | 20 +++++++++---
 hw/misc/npcm7xx_clk.c            | 31 ++++++++++++++++--
 hw/misc/zynq_slcr.c              |  6 +++-
 hw/timer/cmsdk-apb-dualtimer.c   |  5 ++-
 hw/timer/cmsdk-apb-timer.c       |  5 ++-
 hw/timer/npcm7xx_timer.c         |  4 +--
 hw/watchdog/cmsdk-apb-watchdog.c |  5 ++-
 14 files changed, 188 insertions(+), 22 deletions(-)

-- 
2.20.1


