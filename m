Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DC76597C5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 12:37:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBDfN-0006DU-Ho; Fri, 30 Dec 2022 06:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfL-0006BQ-Hd
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:35:11 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfJ-0003p5-Od
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:35:11 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso8482706wms.5
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 03:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NA/uioDCXzu43BeOx2mahIgOlYK6aPYVtQ1C36Sxbew=;
 b=O5kAA7pjg2hunz7nv1eGONF5Jv0Pc3xZuvQI71yGgmQ0g82+hg/RQyGZ9xzej2GYRY
 YkkFKcD4+BVNWiSmF0XCaTL+ofhInxlt73pzDBRmYLLZacewL92865m0L/Lcqul5nxK2
 gKYHdsPNXfZlaosPbKQj+mtqEoeuy3DviFLpTcg6pi2CeVT2v6/RFVJxgNWXd8HDCuuT
 PN08ihN/zS21FXlAM3A2643s4nqZA5QBfMj4sj2B0h7n5857dDTXyo0ohFc7LTgQHbXr
 ZC1HUbOfyrag+H2QN2ksF0fLDSKdRlyNSd+/NPCdRh5C25rvj3olm1J8q9FbgdUTifoa
 gpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NA/uioDCXzu43BeOx2mahIgOlYK6aPYVtQ1C36Sxbew=;
 b=2g8gA4wzUsq11cAICrOVrPYGQYiv0kryL7o6tU+Fh1ys5RPH8bb5u1+Lt/NgSD9bcl
 1mEZi3+qKmh9ynk92pw0+HClYJysFD2n8XSguSD3EjW3L4+8txsH7o83Jqt+tZLL4Q3R
 CqQH5YnFCT6oQqT8vPQSBbOQmefAQyD+jub1VbzAXjOQawQ5B5T91e/nrzjLIDHsPK++
 YyBaB+blP6DZU0PYVMxr/6BJO2BcWg5YxbqyGdTUJg1EBkcFI/kwm+oWxcxKQQZhR0sA
 gSdOHTqhw7UlAOPzJ7+is6Fm/5DyWKdC3ZxSnHI9zStDTzklOe0Zx2hRyKYA7uQ0+RmD
 okMg==
X-Gm-Message-State: AFqh2kqrRF5IQIZP88JSsn358un3McoBellGfnEzQQzDinJ1N2l2X2Wa
 ZwzbqLwYxZllqS6yfLlknr5WH+r7fuAIE75r
X-Google-Smtp-Source: AMrXdXsBAxEDDuabYxlCe4gldkjCn2ow3zych+9uXkascxJBwTAaN8hHPlo6shQBz7vSqLKnYzBziA==
X-Received: by 2002:a05:600c:4fcf:b0:3d1:d396:1ade with SMTP id
 o15-20020a05600c4fcf00b003d1d3961ademr22305552wmq.9.1672400107810; 
 Fri, 30 Dec 2022 03:35:07 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a5d5181000000b0024207478de3sm20190488wrv.93.2022.12.30.03.35.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Dec 2022 03:35:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 00/11] hw/arm/aspeed_ast10x0: Map more peripherals & few
 more fixes
Date: Fri, 30 Dec 2022 12:34:53 +0100
Message-Id: <20221230113504.37032-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Missing review: #3

Since v1:
- Fixed typo (Peter)
- Link HACE with sram insted of secsram
- Split patch #2 in 2, reworded it
- Cover more WDT registers (new patch)

---

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

Philippe Mathieu-Daudé (11):
  hw/watchdog/wdt_aspeed: Rename MMIO region size as 'iosize'
  hw/watchdog/wdt_aspeed: Extend MMIO range to cover more registers
  hw/watchdog/wdt_aspeed: Log unimplemented registers as UNIMP level
  hw/arm/aspeed: Use the IEC binary prefix definitions
  hw/misc/aspeed_hace: Do not crash if address_space_map() failed
  hw/arm/aspeed_ast10x0: Add various unimplemented peripherals
  hw/arm/aspeed_ast10x0: Map I3C peripheral
  hw/arm/aspeed_ast10x0: Map the secure SRAM
  hw/arm/aspeed_ast10x0: Map HACE peripheral
  hw/arm/aspeed_ast10x0: Add TODO comment to use Cortex-M4F
  tests/avocado: Test Aspeed Zephyr SDK v00.01.08 on AST1030 board

 hw/arm/aspeed_ast10x0.c          | 84 ++++++++++++++++++++++++++++++--
 hw/arm/aspeed_ast2600.c          |  5 +-
 hw/arm/aspeed_soc.c              |  6 +--
 hw/misc/aspeed_hace.c            | 21 +++++---
 hw/watchdog/wdt_aspeed.c         | 24 +++++++--
 include/hw/arm/aspeed_soc.h      | 14 ++++++
 include/hw/watchdog/wdt_aspeed.h |  4 +-
 tests/avocado/machine_aspeed.py  | 41 +++++++++++++++-
 8 files changed, 176 insertions(+), 23 deletions(-)

-- 
2.38.1


