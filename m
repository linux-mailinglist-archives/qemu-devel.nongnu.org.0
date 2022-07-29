Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8B058570D
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 01:03:30 +0200 (CEST)
Received: from localhost ([::1]:60700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHZ0y-0002Le-Rx
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 19:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHYz7-0000jV-W0
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:01:34 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:41490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHYz6-00010D-6V
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:01:33 -0400
Received: by mail-pf1-x42e.google.com with SMTP id k79so1589983pfd.8
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 16:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ziY0fpWKKJV5IPV8QpzIzXUwcWcfgSw4zQhSrURIRBg=;
 b=T9pDKMr44uzp3sKdO1JTN3Qs66ViAJq7O1wg5njBtueTRHtIBMXEQWGZgbrIs3yH3x
 1oU6ydo9lS02LeXOocUcowv68k8olAbpSiUEy2cILtqMUVe2zpfAPGRCAjKg7Jwo2HM3
 DjSMp9DN/re5EFwL5/FBhugTl9wonKK8wKWDRt83mqHll2H+qcluxJ+U8z8p2K8iZwAi
 Yagod1jtOU56UiFa+YGMWr/BNDbcURt7Bp6Iiz9GjjfcbQdWSq3TKbMtzsxFbPoRTxzD
 ztdwDx3j9JdzyrH8v5xzdXhBV4tJZXS6mq10l9tNTQke/brvFlpVcQgeemaFuFk2GCwZ
 qnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ziY0fpWKKJV5IPV8QpzIzXUwcWcfgSw4zQhSrURIRBg=;
 b=aoMLlIOeK/SIqKgmHaF6X8F4msN6JoFvuJirz1QeUQgQhSEYcpg4nQRpurcPhjhUW5
 XXl1+m0UMegCIwd89f87Im6BROy88ITI4Y5k6RJvo9dS9QIp1GsmQw5p0rUokSt+OX4O
 DPm2HEeaRsColFiprug5kpJ4AiFa2hlP6wMg5vto2zCzQtyOSqbG0zHpitumvxu+089J
 TbfttLPD6O9QKX40S+bDCM6bVBDv2MyYqFZIAiPEcYaGim+JzZz56mzKRCbR+WTXH9ex
 rZ24AxAbSMyJ0fZwfNgQStXQNUJ7jra4JdcN7nNrEvaXeaAEN1X+lZrg0GajckysnOW3
 cAiQ==
X-Gm-Message-State: AJIora+mZLS5A8oZaKRlvy2LUXwP1/Ign56Ap8chkR9fJNEI7kAqYVY3
 SFyRqylmjzl72oCOu9jccG+U/6ROy8+ddw==
X-Google-Smtp-Source: AGRyM1v2DMDCu9kPz/f3hkJSd7Wm7+fE7BfusWQYweG5BEE3BDehboLj/nw8pH2mJSYBg6aJAHPlMA==
X-Received: by 2002:a63:901:0:b0:41b:6d0b:e8b4 with SMTP id
 1-20020a630901000000b0041b6d0be8b4mr4635061pgj.327.1659135690114; 
 Fri, 29 Jul 2022 16:01:30 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a170902cf1000b0016d23e941f2sm4109023plg.258.2022.07.29.16.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 16:01:29 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH v3 00/11] OpenRISC Virtual Machine
Date: Sat, 30 Jul 2022 08:01:06 +0900
Message-Id: <20220729230117.3768312-1-shorne@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This is the OpenRISC Virtual Machine plaform which we are now using for OpenRISC
CI such as the wireguard testing that Jason has been working on.  I also have
recently used it to test glibc 2.36 and it worked well. Previous glibc testsuite
runs on my FPGA board took about 3 days, running on qemu virt now takes 6 hours.

The first few patches help get OpenRISC QEMU ready for the virtual machine.
There is one bug fix for GDB debugging there too.

Next we have the Virt patch followed by a separate patch to add PCI support
which is split out because it's a bit easier to review that way I thought.  The
next few patches are fixes to get the Multicore platform stable, such as adding
MTTCG support and fixing some interrupt and timer related bugs.

The platform is relatively stable now, but every few boots we get about 10
second hangs.  However, overall this is much more stable than the SMP support we
had before.  So I want to submit this for review and maybe upstream it before
tracking down these last issues which might take significant more time.

This is being tested with the or1k-5.20-updates kernel branch here:

  https://github.com/stffrdhrn/linux/commits/or1k-5.20-updates

  This tree has support for: OpenRISC PCI and virt_defconfig and an irqchip bug
  fix.

Changes since v2:
 - Changed goldfish_rtc endian property to boolean
 - Moved or1k timer init from init to reset
 - Removed cpu_openrisc_timer_has_advanced lock optimization in MTTCG patch,
   measuring revealed it did not help much.
Changes since v1:
 - Dropped semihosting support
 - Added PCI support
 - Added OpenRISC documentation
 - Added OpenRISC support for MTTCG
 - Support Configurating Goldfish RTC endianness
 - Added a few bug fix patches

Jason A. Donenfeld (1):
  hw/openrisc: virt: pass random seed to fdt

Stafford Horne (10):
  hw/openrisc: Split re-usable boot time apis out to boot.c
  target/openrisc: Fix memory reading in debugger
  goldfish_rtc: Add big-endian property
  hw/openrisc: Add the OpenRISC virtual machine
  hw/openrisc: Add PCI bus support to virt
  hw/openrisc: Initialize timer time at startup
  target/openrisc: Add interrupted CPU to log
  target/openrisc: Enable MTTCG
  target/openrisc: Interrupt handling fixes
  docs/system: openrisc: Add OpenRISC documentation

 configs/devices/or1k-softmmu/default.mak |   1 +
 configs/targets/or1k-softmmu.mak         |   1 +
 docs/system/openrisc/cpu-features.rst    |  15 +
 docs/system/openrisc/emulation.rst       |  17 +
 docs/system/openrisc/or1k-sim.rst        |  43 ++
 docs/system/openrisc/virt.rst            |  50 ++
 docs/system/target-openrisc.rst          |  72 +++
 docs/system/targets.rst                  |   1 +
 hw/m68k/virt.c                           |   1 +
 hw/openrisc/Kconfig                      |  12 +
 hw/openrisc/boot.c                       | 117 +++++
 hw/openrisc/cputimer.c                   |  22 +-
 hw/openrisc/meson.build                  |   2 +
 hw/openrisc/openrisc_sim.c               | 106 +----
 hw/openrisc/virt.c                       | 571 +++++++++++++++++++++++
 hw/rtc/goldfish_rtc.c                    |  37 +-
 include/hw/openrisc/boot.h               |  34 ++
 include/hw/rtc/goldfish_rtc.h            |   2 +
 target/openrisc/cpu.c                    |   1 -
 target/openrisc/cpu.h                    |   2 +
 target/openrisc/interrupt.c              |   4 +-
 target/openrisc/mmu.c                    |   8 +-
 target/openrisc/sys_helper.c             |  14 +-
 23 files changed, 1019 insertions(+), 114 deletions(-)
 create mode 100644 docs/system/openrisc/cpu-features.rst
 create mode 100644 docs/system/openrisc/emulation.rst
 create mode 100644 docs/system/openrisc/or1k-sim.rst
 create mode 100644 docs/system/openrisc/virt.rst
 create mode 100644 docs/system/target-openrisc.rst
 create mode 100644 hw/openrisc/boot.c
 create mode 100644 hw/openrisc/virt.c
 create mode 100644 include/hw/openrisc/boot.h

-- 
2.37.1


