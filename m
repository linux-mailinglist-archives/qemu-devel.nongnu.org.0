Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C519658E4D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 16:25:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAuko-00019G-7p; Thu, 29 Dec 2022 10:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAukm-000191-82
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 10:23:32 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAukk-0007oT-FH
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 10:23:31 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so11113687wms.0
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 07:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QJga/ZgW/BZLuSjOrg65Qd9hnGWRDub8ZZsHqX5Js1Y=;
 b=S5yLeBiw3Huwg8EuUIUUtIeGpByS/KbMa+7VKP9mubPRtWlxl89+dqCtsFjL62epuK
 CJchzRxOW/YoHMCPYSyJH9sCYnCwZqOK84hLR+Z7tI6qXzp8tgQ0LO9IRT8S0dY6mTeb
 wyT/SQoP7z0T0bW6l3ex/OWEuOETOsMs2WxixaRnSAylvd0Dv2cjcq7V1AEt4XmGopGA
 f5flEK9FYOM9tW33LIogZlEzjRf7CMwZQpR4WzLQTCsXCGEYq2KNMXJ0ReWFvGIq3qeS
 JU5Pfn/wIRqGuStJ75xWuWOmNZOqS60iXRYvdvk+LpirF/qknHxcXBJqs3psDSwtLell
 zd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QJga/ZgW/BZLuSjOrg65Qd9hnGWRDub8ZZsHqX5Js1Y=;
 b=Tsg+2L40Y3QgJ8FZBgzGi8xFGVuHBuvA60yqhBRTW7sDeiN+sM8N0aVixty82OszK4
 8mHkrTKo0/XQYpOih9BPyoncHQDB8nWiYXUH53Dy024kuRxAMPRWW2IIZwuK59xF7a6t
 p+dxq5WSdv/Xq3mEcgOraPnSrZsvgxRjZEVcld1yTf18wnwJq8xnm1WyPiq1RrRU3oLA
 ymKs9kmx1ZFnR6p/cjlpBkTS02GTFY988rZXV/f9oX+s1pT63cgqYJ0GNQvQSIw/op+N
 wRDK3c6sKWMo5z0+sjx/AgeIm2ciIXaBiFQhvBSLkdrhEwEaRvLw9GEEjye0Z/izB+AQ
 rVOg==
X-Gm-Message-State: AFqh2kpHWLlZ/ZssO2HMq9sUI7XYLJQ3CYzFBmnMAjpOIkR72O7Xic1g
 1ijB6fe51N0aWLCyNNYKa6bhdQqqFPiAVBAy
X-Google-Smtp-Source: AMrXdXuaM+KPEZ/qq0MJk236fP601IU2LT938PtI0APVt80kwNrtG5d0yeUFzuE4VckiAa2zf6rLGw==
X-Received: by 2002:a05:600c:3b29:b0:3cf:d18e:528b with SMTP id
 m41-20020a05600c3b2900b003cfd18e528bmr20798117wms.39.1672327408322; 
 Thu, 29 Dec 2022 07:23:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b003a6125562e1sm27700845wms.46.2022.12.29.07.23.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Dec 2022 07:23:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Peter Delevoryas <peter@pjd.dev>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH 0/9] hw/arm/aspeed_ast10x0: Map more peripherals & few more
 fixes
Date: Thu, 29 Dec 2022 16:23:16 +0100
Message-Id: <20221229152325.32041-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Trying to fix some bugs triggered running Zephyr.

Still 2 bugs:

1/
uart:~$ sensor get SYSCLK
[00:00:23.592,000] <err> os: ***** USAGE FAULT *****
[00:00:23.593,000] <err> os:   Illegal use of the EPSR
[00:00:23.593,000] <err> os: r0/a1:  0x00033448  r1/a2:  0x00000000  r2/a3:  0x00047f50
[00:00:23.593,000] <err> os: r3/a4:  0x00000000 r12/ip:  0x00000000 r14/lr:  0x00000fbd
[00:00:23.593,000] <err> os:  xpsr:  0x60000000
[00:00:23.593,000] <err> os: Faulting instruction address (r15/pc): 0x00000000
[00:00:23.593,000] <err> os: >>> ZEPHYR FATAL ERROR 0: CPU exception on CPU 0
[00:00:23.594,000] <err> os: Current thread: 0x38248 (shell_uart)
[00:00:23.601,000] <err> os: Halting system

2/
uart:~$ mcuboot
[00:01:04.990,000] <err> os: ***** BUS FAULT *****
[00:01:04.990,000] <err> os:   Instruction bus error
[00:01:04.991,000] <err> os: r0/a1:  0x00000000  r1/a2:  0x000ffff0  r2/a3:  0x00047ef0
[00:01:04.991,000] <err> os: r3/a4:  0x00000010 r12/ip:  0x6df7ecb5 r14/lr:  0x000188ed
[00:01:04.991,000] <err> os:  xpsr:  0x61000000
[00:01:04.991,000] <err> os: Faulting instruction address (r15/pc): 0x6df7ecb4
[00:01:04.991,000] <err> os: >>> ZEPHYR FATAL ERROR 0: CPU exception on CPU 0
[00:01:04.991,000] <err> os: Current thread: 0x38248 (shell_uart)
[00:01:04.994,000] <err> os: Halting system

----------------
IN:
PMSA MPU lookup for reading at 0x0001d400 mmu_idx 65 -> Hit (prot rwx)
0x0001d5a2:  6869       ldr      r1, [r5, #4]
0x0001d5a4:  4421       add      r1, r4
0x0001d5a6:  6883       ldr      r3, [r0, #8]
0x0001d5a8:  681c       ldr      r4, [r3]
0x0001d5aa:  463a       mov      r2, r7
0x0001d5ac:  4633       mov      r3, r6
0x0001d5ae:  46a4       mov      ip, r4
0x0001d5b0:  e8bd 41f0  pop.w    {r4, r5, r6, r7, r8, lr}
0x0001d5b4:  4760       bx       ip

PMSA MPU lookup for reading at 0x00000008 mmu_idx 65 -> Hit (prot rwx)
PMSA MPU lookup for execute at 0x6df7ecb4 mmu_idx 65 -> Hit (prot rwx)
Taking exception 3 [Prefetch Abort] on CPU 0
...at fault address 0x6df7ecb4
...with CFSR.IBUSERR
PMSA MPU lookup for writing at 0x00047ec8 mmu_idx 65 -> Hit (prot rwx)
PMSA MPU lookup for writing at 0x00047ecc mmu_idx 65 -> Hit (prot rwx)
PMSA MPU lookup for writing at 0x00047ed0 mmu_idx 65 -> Hit (prot rwx)
PMSA MPU lookup for writing at 0x00047ed4 mmu_idx 65 -> Hit (prot rwx)
PMSA MPU lookup for writing at 0x00047ed8 mmu_idx 65 -> Hit (prot rwx)
PMSA MPU lookup for writing at 0x00047edc mmu_idx 65 -> Hit (prot rwx)
PMSA MPU lookup for writing at 0x00047ee0 mmu_idx 65 -> Hit (prot rwx)
PMSA MPU lookup for writing at 0x00047ee4 mmu_idx 65 -> Hit (prot rwx)
...taking pending nonsecure exception 5
...loading from element 5 of non-secure vector table at 0x14
...loaded new PC 0xa0cd
----------------

HACE isn't really functional there. I probably screwed smth while wiring
the peripheral. Not obvious without access to the datasheet.

Philippe Mathieu-Daudé (9):
  hw/watchdog/wdt_aspeed: Map the whole MMIO range
  hw/arm/aspeed: Use the IEC binary prefix definitions
  hw/arm/aspeed_ast10x0: Add various unimplemented peripherals
  hw/arm/aspeed_ast10x0: Map I3C peripheral
  hw/arm/aspeed_ast10x0: Map the secure SRAM
  hw/arm/aspeed_ast10x0: Map HACE peripheral
  hw/misc/aspeed_hace: Do not crash if address_space_map() failed
  hw/arm/aspeed_ast10x0: Add TODO comment to use Cortex-M4F
  tests/avocado: Test Aspeed Zephyr SDK v00.01.08 on AST1030 board

 hw/arm/aspeed_ast10x0.c          | 84 ++++++++++++++++++++++++++++++--
 hw/arm/aspeed_ast2600.c          |  5 +-
 hw/arm/aspeed_soc.c              |  6 +--
 hw/misc/aspeed_hace.c            | 21 +++++---
 hw/watchdog/wdt_aspeed.c         | 12 +++--
 include/hw/arm/aspeed_soc.h      | 14 ++++++
 include/hw/watchdog/wdt_aspeed.h |  2 +-
 tests/avocado/machine_aspeed.py  | 41 +++++++++++++++-
 8 files changed, 163 insertions(+), 22 deletions(-)

-- 
2.38.1


