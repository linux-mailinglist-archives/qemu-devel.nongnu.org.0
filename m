Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DD65ADE8B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 06:29:08 +0200 (CEST)
Received: from localhost ([::1]:44178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVQCx-0004eZ-Jj
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 00:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVQ90-0007Lv-Hl
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 00:25:02 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVQ8y-0006qH-IG
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 00:25:02 -0400
Received: by mail-pl1-x62a.google.com with SMTP id jm11so10072351plb.13
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 21:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=NVyfWgqcvDs/tsdWPOSvuZpI5evcK8rjqm51UITCIAg=;
 b=LosM5ckSomxVvjMWYAnncYIdMM7OqstSGOwPeS6byqtxXoYmbrjKmCyZYJtSf//TW0
 JEOPBmvvvLSua5pk67O9OXkxWKePASeL+QCvRZfneYqI7rgtwY4Hfoh6KNPlGHBi52I2
 2SmNgQ0vRrk7JhoEwDspNMCtIjaFOta4YiHGOMsc2VfPrgG+3iL0VcFUx2vNq1Q6kidV
 PwzpRA8d6QhRIOPtNNRwUPNvUGW0U0acFdKJIb4GHNuXdIpmwjOdxAanVxUIWBUq+Hiu
 MXduuGH3Xl2t9gz6hsb5LznDBpODQGiewN7OwK+moCOYz3igtqYdMFeFWy0SDdSxc2dG
 JDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=NVyfWgqcvDs/tsdWPOSvuZpI5evcK8rjqm51UITCIAg=;
 b=NY2g55Qqnj1xzPCeL1Jt6x9V+s1onFtKCNAOGM5cFqlgKCcszThNFKrIxALqeJeBY/
 8JLqTr4f4EaLKXXkgc2a8Esk4vV2S4lEiZwE5BkLCM3BfZDKZ4flbHwriRi4+pjgP1GX
 LxEtNn57sqk0ZBlnQjVCX71Y+r76vT3R1XgrE0vWA5Owipsg1LZhI+LuLZz3Uv/bnY9G
 OezKVhRktW/GfBnbJEkLj48wL+y/wkDRt7USzMgnCURd3CxVHkMYF+7NV5BEmYhFijWf
 GFxRElAfheegdrc/pXS4s8tAT/fg8CQl9rsvX1wobmkltaGJGwAEzVNY/Fr9cYsCjrwC
 i78w==
X-Gm-Message-State: ACgBeo33fJUlFKG+5fOHu1y1Xq0IqOA1PkJNF4A+ourGCSF0KFBrcFnu
 8TVbMcJritfnab0ZH/XsLqlXdQ==
X-Google-Smtp-Source: AA6agR4STDFZ6T+bLmaAgl1+SSKrLlXh83EKQ0AWUuI2ofB82vibdK4NQuI+Jc9ibZh2LzkBm4rk/w==
X-Received: by 2002:a17:902:cf11:b0:172:6437:412d with SMTP id
 i17-20020a170902cf1100b001726437412dmr52240868plg.10.1662438299195; 
 Mon, 05 Sep 2022 21:24:59 -0700 (PDT)
Received: from localhost.localdomain ([49.206.11.92])
 by smtp.gmail.com with ESMTPSA id
 g10-20020aa796aa000000b00537f029c94bsm8724967pfk.183.2022.09.05.21.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 21:24:58 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V3 0/3] hw/riscv: virt: Enable booting S-mode firmware from
 pflash
Date: Tue,  6 Sep 2022 09:54:48 +0530
Message-Id: <20220906042451.379611-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

This series adds the support to boot S-mode FW like EDK2 from the flash. The
S-mode firmware should be kept in pflash unit 1.

When -kernel (and -initrd) option is also provided along with the flash,
the kernel (and initrd) will be loaded into fw_cfg table and opensbi will
branch to the flash address which will be the entry point of the S-mode
firmware. The S-mode FW then loads and launches the kernel.

When only -pflash option is provided in the command line, the kernel
will be located and loaded in the usual way by the S-mode firmware.

These patches are available in below branch.
https://github.com/vlsunil/qemu/tree/pflash_v2

The first two patches in this series are refactor patches.

These changes are tested with a WIP EDK2 port for virt machine. Below
are the instructions to build and test this feature.

1) Get EDK2 sources from below branches.
https://github.com/vlsunil/edk2/tree/virt_refactor_smode_v1
https://github.com/vlsunil/edk2-platforms/tree/virt_refactor_smode_v1

2) Build EDK2 for RISC-V
	export WORKSPACE=`pwd`
        export GCC5_RISCV64_PREFIX=riscv64-linux-gnu-
        export PACKAGES_PATH=$WORKSPACE/edk2:$WORKSPACE/edk2-platforms
        export EDK_TOOLS_PATH=$WORKSPACE/edk2/BaseTools
        source edk2/edksetup.sh
        make -C edk2/BaseTools clean
        make -C edk2/BaseTools
        make -C edk2/BaseTools/Source/C
        source edk2/edksetup.sh BaseTools
        build -a RISCV64  -p Platform/Qemu/RiscVVirt/RiscVVirt.dsc -t GCC5

3)Make the EDK2 image size to match with what qemu flash expects
truncate -s 32M Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd

4) Run
a) Boot to EFI shell (no -kernel / -initrd option)
qemu-system-riscv64  -nographic   -drive file=Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1  -machine virt -M 2G

b) With -kernel, -initrd and -pflash
qemu-system-riscv64  -nographic   -drive file=Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1  -machine virt -M 2G -kernel arch/riscv/boot/Image.gz -initrd rootfs.cpio 


Changes since V2:
	1) Moved the doc comment to .h file

Changes since V1:
	1) Modified code to support the use case when both -kernel and -pflash are configured.
	2) Refactor patches added to help (1) above.
	3) Cover letter added with test instructions.

Sunil V L (3):
  hw/arm,loongarch: Move load_image_to_fw_cfg() to common location
  hw/riscv: virt: Move create_fw_cfg() prior to loading kernel
  hw/riscv: virt: Enable booting S-mode firmware from pflash

 hw/arm/boot.c             | 49 ---------------------------------------
 hw/loongarch/virt.c       | 33 --------------------------
 hw/nvram/fw_cfg.c         | 32 +++++++++++++++++++++++++
 hw/riscv/boot.c           | 28 ++++++++++++++++++++++
 hw/riscv/virt.c           | 31 ++++++++++++++++++-------
 include/hw/nvram/fw_cfg.h | 21 +++++++++++++++++
 include/hw/riscv/boot.h   |  1 +
 7 files changed, 105 insertions(+), 90 deletions(-)

-- 
2.25.1


