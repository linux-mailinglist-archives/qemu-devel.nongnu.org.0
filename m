Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797EA28A0FE
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Oct 2020 19:29:17 +0200 (CEST)
Received: from localhost ([::1]:33976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRIgG-0001wc-7i
	for lists+qemu-devel@lfdr.de; Sat, 10 Oct 2020 13:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRIdV-0000Kq-Dj
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 13:26:25 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:53890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRIdT-0003q1-GO
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 13:26:25 -0400
Received: by mail-wm1-x336.google.com with SMTP id f21so12873693wml.3
 for <qemu-devel@nongnu.org>; Sat, 10 Oct 2020 10:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1GpPJZ9w2q7wdq5ROEZ1R6FoK2rk5jTQejf4wl8xDy0=;
 b=VVrifjyQZ5rFdf9UVYE54ad2VpsIftP3c5UogKXk6YKbrndUpMfUrCwuOsagdrGbqs
 CGlSORsP4f3OSHO5YCe+Qi3IjyGEjLaypm2JfxZfhniAxqQ107SrDEkXkPvedCq6Jdsx
 GbG6N3RLVkkiX/oFDCgRCjFwsFzExFk5+Y5wQ4qdWuZhMJG42tD+ewT5Cz7/LkD3cGgU
 2YPgMwdFUhJJ/nf2QiWjfCNHIYP1/99trAVVZu0Uo/eDFdS9S6wokQN9aMPUcBkvKfFp
 4bNQtvpvSQAfcQCh3wXjfYuMqCdaQK3xMImqfI0j8cQm7v5kph0c3MTnziefGoKh5vDi
 H5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1GpPJZ9w2q7wdq5ROEZ1R6FoK2rk5jTQejf4wl8xDy0=;
 b=ZukoeqieyAk00GwUfc+3GHOh4jKZW7crXRWoPQ0HiVCkFUX+gIYJ3y3HnlOACAUZwz
 eMp6azhIIbZXZE6wCN9fa+ejfIYZtRtbwcdmrkJo3tZ2hIaJDPctgkqaKRDyQS6WLcbi
 ZIE+dmvpb6UahYwGlo6Uzl7YW5axze28Pl6598rZwuXCz11pSq7L9brRO0fjoBAhS3MK
 1RK+2c786XwlUbbUjy9FF9kJ/hU2rCEDIsCJtFp995Pv3teUNTyWUC9Y+4oxlg7gbsXF
 lazDil8EUaYpnYQPCeiVwHdmNfVnck5N0s3nJSJLVlRaPHIPFok/HJd91C++wcOuGWAW
 nyXw==
X-Gm-Message-State: AOAM5309IiVgE23syY+4pC4wZWecg+W6Dc1GOPZ3rpe8t4zgCqr37IGc
 wNvWIDBn1ogJxA0E77xcwPOxA9gK1/4=
X-Google-Smtp-Source: ABdhPJyf/dWFYjpPxCTFXJ/HUtDexXI3sKmXB0iV4bJAMoC6IaawWgyB152zn7cCau8wB9oTo9F12g==
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr3404302wmh.78.1602350780814;
 Sat, 10 Oct 2020 10:26:20 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id i11sm16786068wre.32.2020.10.10.10.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2020 10:26:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/20] hw/mips: Set CPU frequency
Date: Sat, 10 Oct 2020 19:25:57 +0200
Message-Id: <20201010172617.3079633-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All the MIPS cores emulated by QEMU provides the Coproc#0
'Count' register which can be used as a free running timer.

Since it's introduction in 2005 this timer uses a fixed
frequency of 100 MHz (for a CPU freq of 200 MHz).
While this is not an issue with Linux guests, it makes
some firmwares behave incorrectly.

The Clock API allow propagating clocks. It is particularly
useful when hardware dynamicly changes clock frequencies.

To be able to model such MIPS hardware, we need to refactor
the MIPS hardware code to handle clocks.

This series is organized as follow:

1/ qdev/clock patches already reviewed but not merged

2/ refactor the CP0 timer period to allow dynamic changes

3/ MIPS CPU get an optional input clock

4/ set correct CPU frequencies to all boards

I used a MIPSsim test suggested by Thomas.
The test is available on the list:
https://mid.mail-archive.com/20200928171539.788309-17-f4bug@amsat.org

Possible follow up:
- QOM'ify the GIC
- let the GIC handle dynamic clock changes

Missing review: patches 6-20

Regards,

Phil.

Luc Michel (1):
  hw/core/clock: add the clock_new helper function

Philippe Mathieu-Daudé (19):
  util/cutils: Introduce freq_to_str() to display Hertz units
  qdev-monitor: Display frequencies scaled to SI unit
  hw/qdev-clock: Display error hint when clock is missing from device
  target/mips: Move cpu_mips_get_random() with CP0 helpers
  target/mips/cp0_timer: Explicit unit in variable name
  target/mips/cp0_timer: Document TIMER_PERIOD origin
  target/mips: Move cp0_count_ns to CPUMIPSState
  target/mips/cpu: Calculate the CP0 timer period using the CPU
    frequency
  target/mips/cpu: Make cp0_count_rate a property
  target/mips/cpu: Allow the CPU to use dynamic frequencies
  hw/mips/r4k: Explicit CPU frequency is 200 MHz
  hw/mips/fuloong2e: Set CPU frequency to 533 MHz
  hw/mips/mipssim: Correct CPU frequency
  hw/mips/jazz: Correct CPU frequencies
  hw/mips/cps: Expose input clock and connect it to CPU cores
  hw/mips/boston: Set CPU frequency to 1 GHz
  hw/mips/malta: Set CPU frequency to 320 MHz
  hw/mips/cps: Do not allow use without input clock
  target/mips/cpu: Display warning when CPU is used without input clock

 include/hw/clock.h       | 13 ++++++++++
 include/hw/mips/cps.h    |  2 ++
 include/qemu/cutils.h    | 12 ++++++++++
 target/mips/cpu.h        | 14 +++++++++++
 target/mips/internal.h   |  2 +-
 hw/core/clock.c          | 15 ++++++++++++
 hw/core/qdev-clock.c     | 11 +++++++++
 hw/mips/boston.c         | 13 ++++++++++
 hw/mips/cps.c            |  8 +++++++
 hw/mips/fuloong2e.c      |  8 ++++++-
 hw/mips/jazz.c           | 16 ++++++++++++-
 hw/mips/malta.c          | 20 +++++++++++++---
 hw/mips/mipssim.c        | 12 +++++++++-
 hw/mips/r4k.c            |  8 ++++++-
 qdev-monitor.c           |  8 ++++---
 target/mips/cp0_helper.c | 25 ++++++++++++++++++++
 target/mips/cp0_timer.c  | 51 ++++++++++------------------------------
 target/mips/cpu.c        | 40 ++++++++++++++++++++++++++++++-
 util/cutils.c            | 14 +++++++++++
 19 files changed, 242 insertions(+), 50 deletions(-)

-- 
2.26.2


