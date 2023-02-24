Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05CB6A1810
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:37:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTZp-0006kd-UH; Fri, 24 Feb 2023 03:37:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTZm-0006k9-SN
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:37:10 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTZl-000194-3D
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:37:10 -0500
Received: by mail-pf1-x42c.google.com with SMTP id n2so1745922pfo.12
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wHh60naRfd/Nqp5u7EjO9AbkXjhoET7UR+xrIio9oyc=;
 b=gAfaxBmD5mR+I+e4yPX+r94KDmtBg8tfQPxTSxOOnz1eo7Y7vOqrrigDudCLWdk9P0
 Cen16ViHOWP2uwfwW22IlsSArZN/eKnD3tB9bwZcQz32DmDeRTLGWpOHlm2UvyVFzF4V
 s3bnAWBVQBep+T5LNFoUNZQq7UAjGog+ffEanuGzbEYOfOANKM6SoiKkXYLQz284tVmQ
 4VR/a3bhCr/7Gjf2eIdk+S8IgCkoiblb4vPJXuy+qnNUX1b1myDoGnM+/X6pvgm7mSPx
 pq8xbWTu/LOsxmWCXYFZoi8E2A4oniL45JYKQITMTO8yIIBR8oEl6D7+t5iK8Uj5uSc6
 WObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wHh60naRfd/Nqp5u7EjO9AbkXjhoET7UR+xrIio9oyc=;
 b=PodDj2VJ4l41G4RZhby+1Owzj4ocfIP4atFl1f+6wn/qd+vjBhI8g8JwwuoNAYZ0BR
 5zi1FFDSshnlH4hYtGRgsj4t2DFArV68Zbux3dMhjLQoE2fQ+OmeEcGv1j4EJ4PctD1t
 vuEPi85q+gXujm0RdRRCW+bdNj8D4u1T5wBb5GIdU5Ng8dU+aLoHIULPmR4vOyM+YRJ0
 3RkhSQlRXPtwPpRWNjYZUhW1NAbGCaBqb3t5mETZOufZwcgfG0l96wyv+cAN3brmktaE
 S7taSNZiWEZ9yxAsuuVX8KwdBo7Mqsc8zl4kV4J9zvxr9DAgx6ZE5ARyh2mkujM4ilzz
 YIrg==
X-Gm-Message-State: AO0yUKUccMGV1twyulPw3xV3KCoawHEXhsGjRbmJuNMD8qO9oQWVUuMk
 6hTK0Ir4BRbS5nWHjEFUeEVCRc0DqjjHqLq3
X-Google-Smtp-Source: AK7set9kclb7nFSL3SO9QTh4pfEFrU/iTtkR8EbImPRY7fAwGukRM83IW9Q8zFbmFQvSg4iSG8/NZg==
X-Received: by 2002:aa7:9599:0:b0:593:ebc7:a6d2 with SMTP id
 z25-20020aa79599000000b00593ebc7a6d2mr13704382pfj.21.1677227827452; 
 Fri, 24 Feb 2023 00:37:07 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 e3-20020aa78243000000b005dd98927cc5sm2507945pfn.76.2023.02.24.00.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 00:37:07 -0800 (PST)
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
Subject: [PATCH V4 0/8] Add basic ACPI support for risc-v virt
Date: Fri, 24 Feb 2023 14:06:53 +0530
Message-Id: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42c.google.com
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

This series adds the basic ACPI support for the RISC-V virt machine. 
Currently only RINTC interrupt controller specification is approved by the
UEFI forum. External interrupt controller support in ACPI is in progress.

The basic infrastructure changes are mostly leveraged from ARM.

This adds support for RINTC and RHCT tables as specified in below ECR links
which are approved by UEFI forum.
RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view

These changes are also available @
https://github.com/vlsunil/qemu/tree/acpi_b1_us_review_V4

Changes since V3:
	1) Added back acpi_align_size() wrapper as per Drew's feedback
	2) Updated RB tags

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
 hw/riscv/virt-acpi-build.c | 396 +++++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c            |  40 ++++
 include/hw/riscv/virt.h    |   6 +
 6 files changed, 456 insertions(+), 6 deletions(-)
 create mode 100644 hw/riscv/virt-acpi-build.c

-- 
2.34.1


