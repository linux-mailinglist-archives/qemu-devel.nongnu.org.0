Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE3D4DBAA4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 23:24:22 +0100 (CET)
Received: from localhost ([::1]:48566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUc45-00065D-3u
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 18:24:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tjeznach@rivosinc.com>)
 id 1nUc1f-0003qg-VE
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 18:21:51 -0400
Received: from [2607:f8b0:4864:20::429] (port=43876
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tjeznach@rivosinc.com>)
 id 1nUc1d-0006gm-Gz
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 18:21:51 -0400
Received: by mail-pf1-x429.google.com with SMTP id t2so5238795pfj.10
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 15:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TC3XQGVw8QP1ksVYAujjWT5pCvMkqsaGQ9upv2O/iXU=;
 b=NRfRWcc3VFfmLdDCKvHCSl0Yca8iQez/hNQpQvnhuejlvhm3jsnMeh+pyZWEwsfj36
 JqzFvE6y8X6gM/Gn9htcRUt7i57+xXTilaeJ9y2OW/38Q+XvYzCloAhEeXOe36Pa9hlr
 AdPoUCv5Oxehs+LNGRF6PymaFTNlaE2qJvfdECZPAGUSBQJWA23Nr2muGxLUtjj2UbHd
 ZmZWzXC8d6+g/x8RQhHlBK2mWCCKppgYOqgR3b1uy8jmR7CAzLxYa4N5AleQYdrViLEm
 LCQweBcfRT8d+unBA63lyPVuDthb5QefBAjceAu+1n43Udu38xmTJhljVqnI5Uja8tCb
 p2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TC3XQGVw8QP1ksVYAujjWT5pCvMkqsaGQ9upv2O/iXU=;
 b=d5Q3egg6DJSx50IOrLBDszIMKqGRq/P0/MX6uaDojgt5SpblHZ09fO2Mduso93NMo4
 x5gUj6PHEtPacJ1pnp/oY5KpIh7p9UQv22x1Z/lA8qqTvsGyaFNWH+/7w3KWc7A5Lwyj
 WvGiHnvT+pe7IApwMlPKdlbFhcBbVcMdXOdQmhRiM29ZwMxXYAG9C2qHA0XnkaANZTii
 IjO+8S3lyRbm5kiK/1fyvoBaFnfRe3o44S9YGBc90CbjattY4I1+NeFdwtesA4Gm1yfo
 eqDeQOXpE4DCDGAZayHGSsSUOjfeApYOtY+YXrCCHIUWbRqwVuE7KUjxz55x16dRQ5dq
 98qQ==
X-Gm-Message-State: AOAM533S6fOENNcHrxANkQ0x2+JDUsyJ1Z1gtXrwTrtKaha9gZx8RiV4
 ty5mjp3fQgN932vqm3spfItDooUBJjd+Gw==
X-Google-Smtp-Source: ABdhPJxJXh7p0CYOLu1IBkjlhwNlDbwweU8gQUkc4U7zo2t4AwxQDY3BAV+tOidUMrZOCntERciPPA==
X-Received: by 2002:a65:6e87:0:b0:380:a1ef:a9be with SMTP id
 bm7-20020a656e87000000b00380a1efa9bemr1334176pgb.284.1647469306935; 
 Wed, 16 Mar 2022 15:21:46 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 k14-20020aa7820e000000b004f7134a70cdsm3928363pfi.61.2022.03.16.15.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 15:21:46 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/2] hw/riscv: Baseline QEMU support for RISC-V IOMMU
 (draft)
Date: Wed, 16 Mar 2022 15:21:14 -0700
Message-Id: <20220316222116.2492777-1-tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=tjeznach@rivosinc.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 GOOGLE_DOC_SUSP=1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the series of patches to introduce RISC-V IOMMU emulation in QEMU.

The Rivos IOMMU device implementation is based on a draft proposal of a
RISC-V I/O Management Unit (IOMMU) [1] as published on 2022/03/10, shared and
discussed with RISCV-V IOMMU Task Group [2].

Specification is in *draft* stage and is expected to be changed based on
discussion and feedback received from RISC-V IOMMU TG.

This series enables rivos-iommu support for riscv/virt machine emulation.
With corresponding Linux kernel driver and (modified) pending AIA-IMSIC
support [3] QEMU is able to boot into Linux with I/O protection enabled for
PCIe devices.  Without AIA-IMSIC support interrupt based I/O translation fault
reporting and MSI remapping features are not available, while all remaining
IOMMU features are active.

To enable IOMMU in QEMU add 'rivos-iommu' to the device list for 'virt' machine
emulation.


[1] https://docs.google.com/document/d/1ytBZ6eDk1pAeBlZjDvm6_qqJbKQ0fMYKedyx0uoAGB0/view
[2] https://lists.riscv.org/g/tech-iommu/message/3
[3] https://lore.kernel.org/qemu-devel/20220220085526.808674-1-anup@brainfault.org

Tomasz Jeznach (2):
  hw/riscv: rivos-iommu: Baseline implementation of RIVOS IOMMU.
  hw/riscv: virt: Add rivos-iommu device to 'virt' machine.

 hw/riscv/Kconfig               |    4 +
 hw/riscv/meson.build           |    1 +
 hw/riscv/rivos_iommu.c         | 1350 ++++++++++++++++++++++++++++++++
 hw/riscv/trace-events          |    7 +
 hw/riscv/trace.h               |    2 +
 hw/riscv/virt.c                |  115 ++-
 include/hw/pci/pci_ids.h       |    1 +
 include/hw/riscv/rivos_iommu.h |   80 ++
 include/hw/riscv/virt.h        |    2 +
 meson.build                    |    1 +
 10 files changed, 1539 insertions(+), 24 deletions(-)
 create mode 100644 hw/riscv/rivos_iommu.c
 create mode 100644 hw/riscv/trace-events
 create mode 100644 hw/riscv/trace.h
 create mode 100644 include/hw/riscv/rivos_iommu.h

-- 
2.25.1


