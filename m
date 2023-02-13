Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFC169484D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:41:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRa0g-00064E-D5; Mon, 13 Feb 2023 09:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0f-00063y-Fu
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:40:49 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0d-0005Ps-CD
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:40:49 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 oa11-20020a17090b1bcb00b002341a2656e5so866795pjb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 06:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YB4wqogtDPNCZYuObY/dN2oYhjeeY5+OLvSqUAg4TPc=;
 b=jcgDChFfv1Fqu4ytS7ccKnlPsnmdhN+lfe3l4OrpyC6bptesnGJjEqItD37UAl+KeJ
 MFyFt8Gw/n72MolkLXbdTyu/O5436bOcjcrkM6pjI/wBMbDeSd55NmxeCsMiRJQcWNq0
 OYFl4iM+OZ5wgLMlbJkK8eRcOIWdWtRvpZmYIORbIPJihLrIHfE4KjsH+JpUe9f/oztv
 jgRDptKW+RGE+qW2loydlrKvmNnOjc/ggbMqhaoD16Lk5uvt2Dbi2rA2N4+YvZu2awDj
 R8afnaqgDIOw04lN36tWVa7nd+ovLf0V8GVg/rdi93rxMiE6NRgxXgH2r1ADZ+u54dmr
 Auyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YB4wqogtDPNCZYuObY/dN2oYhjeeY5+OLvSqUAg4TPc=;
 b=cXCotWZ8KE+k248GuMeWNQ/8s6k3lGFp0DJm09AzzVapJvpFsKJwdSZcETDRMERgKu
 ZQwJoV+RhUufGoJB4W0BsVkyMHkfOXk6Hxh3Xs7NLbDyYx7OXA84K8Qjp75uaq5XZAYT
 ZjBvHF48Sr7Ewviu1upzm8oSd/a7mxOQ+7RsyAVC4JXx/b3KK5Ko01zakSa2Z1u7AUD+
 2k/mH1EOFH072xILqBaRK/aCigPFIFh+Tcv1fpZcCSm8OvtkxyTlnWjSrdIjo97eVLIn
 pky9c07ht3oU/BGR6749ao+hEXuH2EGg36zCMGkPN6uvJKMaHhw63KYeYU9FbPX7yWgN
 LI3w==
X-Gm-Message-State: AO0yUKVMv6a0G0VuLj8q8jqSzQKSEdorebl4dZHnA1tmkME7zExlb/DV
 4ZgybGwOk0BsfN/geNg7/qHcmw==
X-Google-Smtp-Source: AK7set9JatX7ZnwhJk/gthQ/L7zorv5aVsmFMshc8nqt6ZgTHnSZ86etowQezEJ9q4LLtDI6vX7eaQ==
X-Received: by 2002:a17:903:3013:b0:19a:8316:6b4a with SMTP id
 o19-20020a170903301300b0019a83166b4amr6274902pla.26.1676299245254; 
 Mon, 13 Feb 2023 06:40:45 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 y23-20020a63de57000000b004fb8732a2f9sm3777757pgi.88.2023.02.13.06.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:40:44 -0800 (PST)
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
Subject: [PATCH V2 00/10] Add basic ACPI support for risc-v virt
Date: Mon, 13 Feb 2023 20:10:28 +0530
Message-Id: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1035.google.com
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
Currently only INTC interrupt controller specification is approved by the
UEFI forum. External interrupt controller support in ACPI is in progress.

The basic infrastructure changes are mostly leveraged from ARM.

This adds support for INTC and RHCT tables as specified in below ECR links
which are approved by UEFI forum.
RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view

These changes are also available @
https://github.com/vlsunil/qemu/tree/acpi_b1_us_review_V2

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

Sunil V L (10):
  hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
  hw/riscv/virt: Add a switch to enable/disable ACPI
  hw/riscv/virt: Add memmap pointer to RiscVVirtState
  hw/riscv/virt: virt-acpi-build.c: Add basic ACPI tables
  hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
  hw/riscv/virt: virt-acpi-build.c: Add RHCT Table
  hw/riscv: meson.build: Build virt-acpi-build.c
  hw/riscv/Kconfig: virt: Enable ACPI config option
  hw/riscv/virt.c: Initialize the ACPI tables
  MAINTAINERS: Add entry for RISC-V ACPI

 MAINTAINERS                |   6 +
 hw/riscv/Kconfig           |   1 +
 hw/riscv/meson.build       |   1 +
 hw/riscv/virt-acpi-build.c | 384 +++++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c            |  45 +++++
 include/hw/riscv/virt.h    |   6 +
 6 files changed, 443 insertions(+)
 create mode 100644 hw/riscv/virt-acpi-build.c

-- 
2.34.1


