Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58865612D51
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:29:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGnW-0008Ps-4V; Sun, 30 Oct 2022 18:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGnS-0008Pe-W5
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:28:51 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGnQ-00073d-0S
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:28:50 -0400
Received: by mail-wm1-x331.google.com with SMTP id t4so6224060wmj.5
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0vvYP4ZGU4K61SMUnZu/h3MvvvZqqwS28llLPqNgicU=;
 b=BcaU4mAX0HzAY7LE+vDgayMHIbxzDeUcpuqGrHiQsRjI5866H69L7gDqG2AyyHS/Tg
 x5HHc0295RHXpabI20sxRc2MByK5HPg+F3x3EWD58wwur89psQJA5jIbe7fzo9/Yqgy8
 csEcNdWvuEke9/tbYtKKR4mX0JNozey2eFq8yONjd0RGCC0bcqFU8sOb9pkm99vGbAUP
 0W9Dz/h7l8l72F1eBp25ppqquZUath0r7kOYq6P3cMEBLHHW8MZl6GrLePKIkx8lb2+Y
 A0dnpX770JLs+stE+EkFk3Z8/QadZraeOIG19TppMxj8UYVjQ+jGe/P7EMVGnB+dTt+C
 fICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0vvYP4ZGU4K61SMUnZu/h3MvvvZqqwS28llLPqNgicU=;
 b=2Dhns5x/SY4prIjsjwnZBybXIQ4PrDeQpxzTvWTb9g1rdXdtZwM4mrv1q1cWzcqdRp
 ZupNXuKkxfoxN5Dpfz3C5Gm3+VjXbxX6PZ3ObKtqjDKkoLcsg2qdAVwRgRkx/HQfSPXs
 5Xmxa4DAfy2UdMhTv0TSiKS9uXr7JaywZq5wGp2f7XjiTe0wXORqmsrXkVKeFOi4dupE
 zNIvJXZSidoxxGXN9SBOw9APRSOzSc1U1Q46sa1X+CUzpYiruNUYpi2zcc4AqY4g5cOV
 F0Ib3+7B1J3LZWucObic7rCU5cUoqZheNHMsEbuNoECLWzWNsd2n0+2kVEeITYckJAJC
 kkIA==
X-Gm-Message-State: ACrzQf0haJo8gZtKKKMoJNSRPHwAFj/RthtLot6VkLENauu+7rsiRf0E
 vhPCCYVS00dYwLRAPPe5GLQ55cpIjRRqaw==
X-Google-Smtp-Source: AMsMyM7OlM7DC8ucgLnFiFtBB4FzH8U8Hyi07q7hrQ8yZx0N7dpAQnsT3M/Cz4OM/Z8SO3aew6Pz4Q==
X-Received: by 2002:a7b:c404:0:b0:3b4:faca:cf50 with SMTP id
 k4-20020a7bc404000000b003b4facacf50mr16156671wmi.67.1667168925294; 
 Sun, 30 Oct 2022 15:28:45 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a05600c511700b003cf54b77bfesm5554817wms.28.2022.10.30.15.28.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:28:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>
Subject: [PULL 00/55] MIPS patches for 2022-10-30
Date: Sun, 30 Oct 2022 23:27:46 +0100
Message-Id: <20221030222841.42377-1-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea534ad:

  Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26 10:53:49 -0400)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/mips-20221030

for you to fetch changes up to 487099aee951e4966936acd3e9afd24c69de85ea:

  hw/mips/malta: Use bootloader helper to set BAR registers (2022-10-30 23:08:10 +0100)

----------------------------------------------------------------
MIPS patches queue

- Convert nanoMIPS disassembler from C++ to C (Milica Lazarevic)
- Consolidate VT82xx/PIIX south bridges (Bernhard Beschow)
- Remove unused MAX_IDE_BUS definition (Zoltan Balaton)
- Fix branch displacement for BEQZC/BNEZC (David Daney)
- Don't set link_up for Boston's xilinx-pcie (Jiaxun Yang)
- Use bootloader API to set BAR registers in Malta (Jiaxun Yang)

Unfortunately I couldn't run my usual test suite, but I ran the
best testing I can do in the current time frame :/
----------------------------------------------------------------

BALATON Zoltan (1):
  hw: Remove unused MAX_IDE_BUS define

Bernhard Beschow (25):
  hw/isa/vt82c686: Resolve chip-specific realize methods
  hw/isa/vt82c686: Resolve unneeded attribute
  hw/isa/vt82c686: Prefer pci_address_space() over get_system_memory()
  hw/isa/vt82c686: Reuse errp
  hw/isa/vt82c686: Introduce TYPE_VIA_IDE define
  hw/isa/vt82c686: Instantiate IDE function in host device
  hw/isa/vt82c686: Introduce TYPE_VT82C686B_USB_UHCI define
  hw/isa/vt82c686: Instantiate USB functions in host device
  hw/isa/vt82c686: Instantiate PM function in host device
  hw/isa/vt82c686: Instantiate AC97 and MC97 functions in host device
  hw/mips/fuloong2e: Inline vt82c686b_southbridge_init() and remove it
  hw/isa/vt82c686: Embed RTCState in host device
  hw/isa/vt82c686: Create rtc-time alias in boards instead
  hw/i386/pc: Create DMA controllers in south bridges
  hw/isa/piix3: Remove extra ';' outside of functions
  hw/isa/piix3: Add size constraints to rcr_ops
  hw/isa/piix3: Modernize reset handling
  hw/isa/piix3: Prefer pci_address_space() over get_system_memory()
  hw/isa/piix4: Rename wrongly named method
  hw/ide/piix: Introduce TYPE_ macros for PIIX IDE controllers
  hw/isa/piix3: Remove unused include
  hw/mips/malta: Reuse dev variable
  hw/isa/Kconfig: Fix dependencies of piix4 southbridge
  hw/isa/piix4: Add missing initialization
  hw/isa/piix4: Move pci_ide_create_devs() call to board code

David Daney (1):
  disas/mips: Fix branch displacement for BEQZC and BNEZC

Jiaxun Yang (3):
  hw/mips/boston: Don't set link_up for xilinx-pcie
  hw/mips: Use bl_gen_kernel_jump to generate bootloaders
  hw/mips/malta: Use bootloader helper to set BAR registers

Milica Lazarevic (24):
  disas/nanomips: Remove namespace img
  disas/nanomips: Extract enums out of the NMD class
  disas/nanomips: Delete NMD class field
  disas/nanomips: Delete NMD class second field
  disas/nanomips: Remove helper methods from class
  disas/nanomips: Remove __cond methods from class
  disas/nanomips: Remove disasm methods from class
  disas/nanomips: Remove Pool tables from the class
  disas/nanomips: Remove NMD class
  disas/nanomips: Move typedefs etc to nanomips.cpp
  disas/nanomips: Delete nanomips.h
  disas/nanomips: Remove #include <sstream>
  disas/nanomips: Delete copy functions
  disas/nanomips: Delete wrapper functions
  disas/nanomips: Replace std::string type
  disas/nanomips: Remove IMMEDIATE functions
  disas/nanomips: Remove CPR function
  disas/nanomips: Prevent memory leaking
  disas/nanomips: Remove function overloading
  disas/nanomips: Expand Dis_info struct
  disas/nanomips: Replace exception handling
  disas/nanomips: Replace Cpp enums for C enums
  disas/nanomips: Remove argument passing by ref
  disas/nanomips: Rename nanomips.cpp to nanomips.c

Philippe Mathieu-Daudé (1):
  hw/mips/bootloader: Allow bl_gen_jump_kernel to optionally set
    register

 configs/devices/mips-softmmu/common.mak      |    1 -
 configs/devices/mips64el-softmmu/default.mak |    1 -
 disas/meson.build                            |    2 +-
 disas/mips.c                                 |   12 +-
 disas/{nanomips.cpp => nanomips.c}           | 8186 +++++++++---------
 disas/nanomips.h                             | 1076 ---
 hw/alpha/dp264.c                             |    2 -
 hw/hppa/machine.c                            |    2 -
 hw/i386/pc.c                                 |    3 -
 hw/i386/pc_piix.c                            |    5 +-
 hw/ide/piix.c                                |    5 +-
 hw/ide/via.c                                 |    2 +-
 hw/isa/Kconfig                               |    9 +
 hw/isa/lpc_ich9.c                            |    3 +
 hw/isa/piix3.c                               |   28 +-
 hw/isa/piix4.c                               |   10 +-
 hw/isa/vt82c686.c                            |  120 +-
 hw/mips/bootloader.c                         |   28 +-
 hw/mips/boston.c                             |   14 +-
 hw/mips/fuloong2e.c                          |   48 +-
 hw/mips/malta.c                              |  139 +-
 hw/ppc/Kconfig                               |    1 -
 hw/ppc/pegasos2.c                            |   25 +-
 hw/ppc/prep.c                                |    2 -
 hw/sparc64/sun4u.c                           |    1 -
 hw/usb/vt82c686-uhci-pci.c                   |    4 +-
 include/hw/ide/piix.h                        |    7 +
 include/hw/isa/vt82c686.h                    |    4 +-
 include/hw/mips/bootloader.h                 |    8 +-
 29 files changed, 4181 insertions(+), 5567 deletions(-)
 rename disas/{nanomips.cpp => nanomips.c} (73%)
 delete mode 100644 disas/nanomips.h
 create mode 100644 include/hw/ide/piix.h

-- 
2.37.3


