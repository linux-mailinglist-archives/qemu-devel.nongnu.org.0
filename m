Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087E5699A55
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:42:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShKG-00045s-UI; Thu, 16 Feb 2023 11:41:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKE-0003wg-JV
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:41:38 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKC-0000Ux-T1
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:41:38 -0500
Received: by mail-pl1-x62c.google.com with SMTP id v23so2628581plo.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P07BINPsU3rITDcFle9rbSUKznPea6L7qdsHyvHdjZA=;
 b=jx90z2tgnL0nTM35WGQh0VH5AYwL6JzfJ6DvijE9Hs8tjCM1EwuSlmOEfZFb/TiHeY
 0gpO9wLWOoap/vf5/FC79Jvgp4DRkhhOoTi1M9klnWnsOGqJNrEcYrADmm1inLHJhBM/
 ucmxoaF0a8DOARk1Zw6vV2/NFpZcmcl6BI4piDdmCym5ha5IhGDApxvsJgo0kVxhlZVO
 kI5JLbyxe8DYFoVs5W8elMWlGBR0P8yWxMnN7g6DiCfrMSm88SGv2/ehyYMBQ0FLiGz8
 J7m0U36rNR3MK0s4x7Kr1qIx2eAjwo5qCW7p3rMnaeQBvWOZchBcW0FteNopchyy4G5q
 cD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P07BINPsU3rITDcFle9rbSUKznPea6L7qdsHyvHdjZA=;
 b=04k/EZk1MKrx8QW5b44vi8pty7c/rnX44UtEY5ox8G+12ZnM9tG99Y2cat1B70x64I
 SIg+oP5T5dK+yQCfDCXqnken3I6p1CKbYBE+YKScAJaAHXGzL5J0QqrHPMNXeqqdzSvd
 ++gOFlIQGmWh7x+r5C+FLxKCMHqGK86A+02LUjSh73kp/SZMx88ydt6jUdVGmL5owAM0
 ZJZS3aaXwnugSwfHYD8jNUntDfxVS9l9pBaZIehkx2CXTnuDHWgwPTamGMiiGcC1FLMp
 q9VIscjPut1Tt+LQht964PV88Bzi6u86GIlGHmyZ62lQgaXoncbaqIEVhm2xKJGMRiBX
 qWqA==
X-Gm-Message-State: AO0yUKWZ4hThtJu8XJjnpKszURG+j31s5Rin7UuUZCkxqIOHgS3GEzlm
 U8nGvqiJVRE7JZMfq9lr16w56hd9FcuaohzK
X-Google-Smtp-Source: AK7set8sqlygkV+umGArVON4T+JHiaw4Ag8YuF8gRWpu3pZ90ZVcQMDevNXBq6xGPOA3o9HgD/RX2Q==
X-Received: by 2002:a05:6a20:6a0b:b0:bc:6e88:7f58 with SMTP id
 p11-20020a056a206a0b00b000bc6e887f58mr7441207pzk.51.1676565692263; 
 Thu, 16 Feb 2023 08:41:32 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 q20-20020a638c54000000b004fbd10af99asm1385243pgn.60.2023.02.16.08.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:41:31 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V3 0/8] Add basic ACPI support for risc-v virt
Date: Thu, 16 Feb 2023 22:11:17 +0530
Message-Id: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series adds the basic ACPI support for the RISC-V virt machine. 
Currently only RINTC interrupt controller specification is approved by the
UEFI forum. External interrupt controller support in ACPI is in progress.

The basic infrastructure changes are mostly leveraged from ARM.

This adds support for RINTC and RHCT tables as specified in below ECR links
which are approved by UEFI forum.
RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view

These changes are also available @
https://github.com/vlsunil/qemu/tree/acpi_b1_us_review_V3

Changes since V2:
	1) Squashed commits and updated commit message as per feedback from Daniel.
	2) Addressed comments from Drew.
	3) Updated tags.

Changes since V1:
	1) Addressed comments from Bin Meng.
	2) Made acpi switch default AUTO similar to other architectures.
	3) Re-based and added RB and ACKs.

The series is tested using SBI HVC console and initrd.

Test instructions:
1) Build Qemu with ACPI support (this series)

2) Build EDK2 as per instructions in
https://github.com/vlsunil/riscv-uefi-edk2-docs/wiki/RISC-V-Qemu-Virt-support

3) Build Linux with ACPI support using below branch
https://github.com/vlsunil/linux/commits/acpi_b1_us_review_ipi17_V2
after enabling SBI HVC and SBI earlycon options.

CONFIG_RISCV_SBI_V01=y
CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
CONFIG_HVC_RISCV_SBI=y

4) Build buildroot.

Run with below command.
qemu-system-riscv64   -nographic \
-drive file=Build/RiscVVirtQemu/RELEASE_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1 \
-machine virt -smp 16 -m 2G \
-kernel arch/riscv/boot/Image \
-initrd buildroot/output/images/rootfs.cpio \
-append "root=/dev/ram ro console=hvc0 earlycon=sbi"


Sunil V L (8):
  hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
  hw/riscv/virt: Add a switch to disable ACPI
  hw/riscv/virt: Add memmap pointer to RiscVVirtState
  hw/riscv/virt: Enable basic ACPI infrastructure
  hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
  hw/riscv/virt: virt-acpi-build.c: Add RHCT Table
  hw/riscv/virt.c: Initialize the ACPI tables
  MAINTAINERS: Add entry for RISC-V ACPI

 MAINTAINERS                |  18 +-
 hw/riscv/Kconfig           |   1 +
 hw/riscv/meson.build       |   1 +
 hw/riscv/virt-acpi-build.c | 387 +++++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c            |  40 ++++
 include/hw/riscv/virt.h    |   6 +
 6 files changed, 447 insertions(+), 6 deletions(-)
 create mode 100644 hw/riscv/virt-acpi-build.c

-- 
2.34.1


