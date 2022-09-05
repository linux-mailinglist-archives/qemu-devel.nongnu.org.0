Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508DD5AD902
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 20:27:14 +0200 (CEST)
Received: from localhost ([::1]:41174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVGoS-0007Ji-Mw
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 14:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVGkg-00027m-SR
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 14:23:18 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVGkX-000264-F8
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 14:23:18 -0400
Received: by mail-pl1-x631.google.com with SMTP id v5so9127903plo.9
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 11:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=SeHNAeBlear1oln8Wk6+tsh0AHrkZiXRlUMMSCjo9+k=;
 b=QiSyAcRU1n2tLNWgh0eeirpvBKeYP3SavHb4/ZRhPPtruxZp0C918hibYCn1DfiKRM
 N+rqSnesGUIK5CLvfvQhKCHJy0ECwPpzMHoqWAyjOIAE6GSAAL7vD/RSZGqnZtNQgH01
 zN7pnfbJUI691iy6K1qNAPs+MP4lcQ5WCBmqjy9YIMgscwFLoLaQBoFE6ljpJ4tC2jEM
 nPmcbAL3Z94776YvrogY6vbtF/YNu1pTVtIpFdULJgUPwEzTW5fPzfUPClChgia3BQM0
 E9keHXxXnR8NeDV/YHk91BFx3FjEVX4Ea+/+ulcbWcBuu1GR8EL6Zl1KDzGzlaiuba42
 DGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=SeHNAeBlear1oln8Wk6+tsh0AHrkZiXRlUMMSCjo9+k=;
 b=slZ6emtjl3sOFHXd4dDclPYt44ydacPqk/mlNduV2stO35dWXlzylUpuugOU9QByzt
 1XKllDSl3+MgYz6mHjZuIw88sMb1gmY1J/x9faQIQAvChSNJh9AUhqnEEBIn/1LOgonH
 NP0gaI0vD7TmiIls/JU477Gf/SIzTK5FMHSp+yokOwZfyH4L5+Z0LeakT+LUwEr8EOz2
 EvoWCCphq9XxKJpk8Ac+4Gd0Pki1b8kMDZHhYmxEGcYfLEZmwIIOMdqVmBE6CWqU2EA6
 SciQxG4oPbRRhY2rhOe5dtm6gsGlsiZ69u1orgVzqtO5c5+fX9Da32Afo+Z0ShvflkJl
 qCqQ==
X-Gm-Message-State: ACgBeo1mxWiPEdT8VoFdeyGh1x6/BukPFRuao0JlJg+BN01IU77lF1qA
 Uj6U0I2QrEqfc+dUZMDooCKd7w==
X-Google-Smtp-Source: AA6agR4LTWXZ23y2Y0rsAXQYrcgwiDPMz2/F+8xt6W+WbLBXkhlghjLX+MTITLZIXVcs4jgKoyIsLg==
X-Received: by 2002:a17:903:244d:b0:175:3ead:4586 with SMTP id
 l13-20020a170903244d00b001753ead4586mr28513867pls.28.1662402187979; 
 Mon, 05 Sep 2022 11:23:07 -0700 (PDT)
Received: from localhost.localdomain ([49.206.11.92])
 by smtp.gmail.com with ESMTPSA id
 z7-20020aa79587000000b005321340753fsm8046724pfj.103.2022.09.05.11.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 11:23:07 -0700 (PDT)
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
Subject: [PATCH V2 0/3] hw/riscv: virt: Enable booting S-mode firmware from
 pflash
Date: Mon,  5 Sep 2022 23:52:35 +0530
Message-Id: <20220905182238.374545-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x631.google.com
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
 hw/nvram/fw_cfg.c         | 49 +++++++++++++++++++++++++++++++++++++++
 hw/riscv/boot.c           | 28 ++++++++++++++++++++++
 hw/riscv/virt.c           | 31 ++++++++++++++++++-------
 include/hw/nvram/fw_cfg.h |  3 +++
 include/hw/riscv/boot.h   |  1 +
 7 files changed, 104 insertions(+), 90 deletions(-)

-- 
2.25.1


