Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7696874B3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 05:54:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNRaW-0004Pp-UV; Wed, 01 Feb 2023 23:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRaL-0004O3-JK
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:52:36 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRaJ-0001Bw-VF
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:52:33 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 cq16-20020a17090af99000b0022c9791ac39so4433667pjb.4
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 20:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nb64h1xsaFuqQ2VM1naL2fQle0/1IVpMrtDUW4nJxgo=;
 b=mSeJQFbxooHXJrPYq7/zusSv1m0I+ODpOsUj1jwnM7y+cBhUUeY1LUigfy21vz/Zgk
 ok9ifs/ti9J9dSdga2OK7pxEAM8huKnoomqCwkWijJlDbPPxmh6L1M/ncqHIDl/ATqhT
 3DtSRXjZeXIBEIdyj2f+WeBrIYEYpjzbczSm1RcAu06HiS5FezO5AdOniqcHuQp+MvK5
 XXK6+o/PA0XzCpZ1IY4jJd2yWVIdo791jc2t9VpVH8w51piqByYgZQiO5y2oDphbao5n
 8WA36syQknLlG4Sr/SmV4Z7WOQShZ39u80/sBXrTOz9ueoRWDH38SjoaDyC9/VMK92qk
 M1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nb64h1xsaFuqQ2VM1naL2fQle0/1IVpMrtDUW4nJxgo=;
 b=LlzA7xQDEt1ewQDqAroaSDbCqV2wwuwHS/0Bp0rs/rVCU0O8jyPbPx0vlMtlWLk9M7
 7B6FBhVC5x9NtI1FGmaSkvMOtsmEygh1Uf8UqjvIi2Wva8gZD1VrH1eolS/SaYLDwIy9
 RFfL+7FjCU9lo3KBSI+lVYBITeIY+vTwWcP1hQ9iV+wD3XnwE0rwzy26Rnu8hkWbmfOe
 Nt4+y7IKVrM18VBCeMVo3g4BfiGrG+60ztpO5RB0OwrAv3NOaGrUV4D0mP2D/Hg5GTUd
 mD4JP3PT5XatSUbDLr9osFgPdrerodCqhQRSw7muOSEw1ct0RHYnZYWHFLcQP7DRa105
 7w7Q==
X-Gm-Message-State: AO0yUKWfpW2DiicLxAemhcfxECL8gQCib+xYKKYU3xTFDZHKKVwrsetx
 OY9r24jYdNASxUrSIn1pcqX1Jg==
X-Google-Smtp-Source: AK7set9zpgGfyrPwHSZ19yBiBnuI7uw8jmnluSw4vLIPqx6K5jalRewk+UMQYXfX6wOVa2BwHw7w4g==
X-Received: by 2002:a17:902:ec81:b0:196:7bfb:f0d1 with SMTP id
 x1-20020a170902ec8100b001967bfbf0d1mr6512302plg.34.1675313549814; 
 Wed, 01 Feb 2023 20:52:29 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902d70a00b001965540395fsm11222265ply.105.2023.02.01.20.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 20:52:29 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 00/10] Add basic ACPI support for risc-v virt
Date: Thu,  2 Feb 2023 10:22:13 +0530
Message-Id: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1030.google.com
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
Currently only INTC interrupt controller specification is approved by the
UEFI forum. External interrupt controller support in ACPI is in progress.

The basic infrstructure changes are mostly leveraged from ARM.

This adds support for INTC and RHCT tables as specified in below ECR links
which are approved by UEFI forum.
RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view

These changes are also available @
https://github.com/vlsunil/qemu/tree/acpi_b1_us_review

The series is tested using SBI HVC console and initrd.

Test instructions:
1) Build Qemu with ACPI support (this series)

2) Build EDK2 as per instructions in
https://github.com/vlsunil/riscv-uefi-edk2-docs/wiki/RISC-V-Qemu-Virt-support

3) Build Linux with ACPI support using below branch
https://github.com/vlsunil/linux/commits/acpi_b1_us_review_ipi17
after enabling SBI HVC and SBI earlycon options.

CONFIG_RISCV_SBI_V01=y
CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
CONFIG_HVC_RISCV_SBI=y

4) Build buildroot.

Run with below command.
qemu-system-riscv64   -nographic \
-drive file=Build/RiscVVirtQemu/RELEASE_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1 \
-machine virt,acpi=on -smp 16 -m 2G \
-kernel arch/riscv/boot/Image \
-initrd buildroot/output/images/rootfs.cpio \
-append "root=/dev/ram ro console=hvc0 earlycon=sbi"

Sunil V L (10):
  hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
  hw/riscv/virt: Add a switch to enable/disable ACPI
  hw/riscv/virt: Add memmap pointer to RiscVVirtState
  hw/riscv/virt: virt-acpi-build.c: Add basic ACPI tables
  hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
  hw/riscv/virt: virt-acpi-build.c: Add RHCT Table
  hw/riscv: meson.build: Build virt-acpi-build.c
  hw/riscv/Kconfig: virt: Enable ACPI config options
  hw/riscv/virt.c: Initialize the ACPI tables
  MAINTAINERS: Add entry for RISC-V ACPI

 MAINTAINERS                |   6 +
 hw/riscv/Kconfig           |   3 +
 hw/riscv/meson.build       |   1 +
 hw/riscv/virt-acpi-build.c | 391 +++++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c            |  48 +++++
 include/hw/riscv/virt.h    |   6 +
 6 files changed, 455 insertions(+)
 create mode 100644 hw/riscv/virt-acpi-build.c

-- 
2.38.0


