Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11DA6A7D61
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:13:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXezG-0003nL-VZ; Thu, 02 Mar 2023 04:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezF-0003n5-GA
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:12:29 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezD-0004RT-Mb
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:12:29 -0500
Received: by mail-pj1-x1034.google.com with SMTP id x34so16221368pjj.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 01:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=48+hgz9/Juk6w/2pKOwPQmeW67lTY993JS5TzWJoJ1A=;
 b=GoPWestVzEEtdFJP7IYjGIN6CyYOUHfrWRqJO/Npzn8DPGGydGcKBcbGyofrtg5gPr
 mJPfqX1EbkLn6Zuq4nZ6sslX2//OXziaxW8+QB+NgKD+YgXfqTzWp1AS3z5zPishK8sS
 xjTJjaX6jpKtXMuqZncmpehFVd+rnZTDHvBoyzoLtSSt+meGbLwGAp+J02Bt21+uHCNL
 vAPUOAiHKRIEhNGAnVZ38aKgH3vv95TL3ZLvjlB2gUM/K/LwDKVNeCanSg8GKXXYiVID
 5cIX+9h8DYwR3+WaJoaGAT23B/czWUhPcu3NOKZZ8UQHEIvmIG4/dwhOtQqHu5fHcFUL
 uDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=48+hgz9/Juk6w/2pKOwPQmeW67lTY993JS5TzWJoJ1A=;
 b=n7oKYPGWA+9RsjDbrKf5k0MTEVqkGU1bfhT5fRzm49uR+8BXypRdf9Y/5mt12h86I0
 CkEjh55da62rWg1t/tWM2PDEMQuQ6kiBqidcJik6lpaT0ZwgDbcR5D0Nhkw/UKzP32QM
 H5+y/eTi4327RGuNI4dOhCnjhCXKTDEUnXF9oToXiSC7PCTr79eyRP3OtowwGwPvsfCk
 X6NnD1I9rwNMNum6WJxGQUdYPrcDuiXSy0EgrrxXA1vmFx831XIxsPsrPqygNLdMWwco
 Jy4QKB7qMyfHVHRywtdjoVaUhmWz+DVpB0ToaHG1fDSwwC22ESRaPrDbkvveAe/dUceL
 UYtA==
X-Gm-Message-State: AO0yUKVCUYGd/F+r5/2vZRpa+77iMQTk7ku1IH4IsIZ2X6kJmqpEhkgS
 8+C2IeQUHHUPrVTauM95c2LW5A==
X-Google-Smtp-Source: AK7set8F/7iSk0bIJsQ7w3yfVAih+AjBIsj1TKJpjsk67fHY3FPOvSRUtZzp0CNkr8tcTqbSGm2qdQ==
X-Received: by 2002:a17:902:728b:b0:19a:9831:c8d6 with SMTP id
 d11-20020a170902728b00b0019a9831c8d6mr7586137pll.50.1677748345344; 
 Thu, 02 Mar 2023 01:12:25 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 iz12-20020a170902ef8c00b0019945535973sm9850692plb.63.2023.03.02.01.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:12:24 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Igor Mammedov <imammedo@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V5 0/8] Add basic ACPI support for risc-v virt
Date: Thu,  2 Mar 2023 14:42:04 +0530
Message-Id: <20230302091212.999767-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1034.google.com
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

This adds support for RINTC and RHCT tables as specified in below ECR links
which are approved by UEFI forum.
RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view

These changes are also available @
https://github.com/vlsunil/qemu/tree/acpi_b1_us_review_V5

Changes since V4:
	1) Used possible_cpus to create cpu topology in DSDT, MADT and RHCT as
           per Igor's feedback.
        2) Moved MAINTAINER entries below ACPI/SMBIOS entry as per Drew's
           feedback
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
 hw/riscv/virt-acpi-build.c | 416 +++++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c            |  40 ++++
 include/hw/riscv/virt.h    |   6 +
 6 files changed, 476 insertions(+), 6 deletions(-)
 create mode 100644 hw/riscv/virt-acpi-build.c

-- 
2.34.1


