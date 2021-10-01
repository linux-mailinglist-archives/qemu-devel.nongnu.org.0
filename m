Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B147A41F3A6
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:52:57 +0200 (CEST)
Received: from localhost ([::1]:59916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMiO-000373-LC
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUA-0000PX-IK
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:14 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:34409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMU8-0000du-Ii
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:14 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 r11-20020a1c440b000000b0030cf0f01fbaso3987369wma.1
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+GDR8oRq/C83jwYzaHDaSmBQ8xgB6bUk2ya2BldqeZk=;
 b=Rp+nnGxqw0unZ4jNapgGNpTzXWKXLgk0slr3lBzAZIKdC47dwcUK+ZCNUgxScTAYCv
 s1xuKZ16qZtd28ZwWkKQoKCLRHrg5AQKBLno/XGeY5WK8FRn8X/p4QPFfCe9mqAsvo4I
 UwhabKlIXd7rzpiF3EMwR2qi/aDybutqA+1ao288Liui7GTYBxcnzg+bxVbpM9Mzpwhk
 B8z3AWjEp8Jm1P0IrObBeyGhm2VZvkkfTPtdzgD0VYaUyyEMB8LIKh8DTa8vuSrVpFiu
 Y/ZLb74MUTrQO1BHqm7S8lzsNtUzpAZbMVrZymLb1ncSYlgTy8DFQsZ3Ueur15iNvPmu
 PyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+GDR8oRq/C83jwYzaHDaSmBQ8xgB6bUk2ya2BldqeZk=;
 b=HxpBTcwK2GBvN3lfV6SfFsXvskACYiJbudwnLZJJJsQm50EUOaS5t1Lx3EJM/D08gw
 n428BRrxTpPK5GeTaYQj2R87q7dCRkkLwPX6H6RAPj9wx17Y4qODtDEU17epaNlVBnqP
 E/0fHhO//JmqnpO5GIeYXjOnqlFV3TDYdM1ETvt/chhmkgcE1VOcVoxSCgMKyQq85Yhc
 X8NIxeRvga/ggFAixnh5z3qBJvE209I1+wyL/g+hq2Jx3+v7QQAPtFG6F6x282sUF3UJ
 1aAUUhOYm8WWMGx+LWV7Dz4lTIA0+nyxwd5ywIw0nWVQ6k2KFTgc49zaKsYUDaPOsAqU
 363Q==
X-Gm-Message-State: AOAM533JoCG3aT378gTSRKGzo9K5bBT9LukSL5leLRCvpTwMpNrxe5ya
 ztbOZyyeHcHih96hxmt/Rd+e9A==
X-Google-Smtp-Source: ABdhPJwSGuQTEDS9ICr9M/vcHMd6shl4t+oMf/+IGqMrM/TwBAY79toNfUd5HCl5SmpGSnYBO+Ot2Q==
X-Received: by 2002:a05:600c:3b83:: with SMTP id
 n3mr5878193wms.50.1633109890827; 
 Fri, 01 Oct 2021 10:38:10 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k9sm6186592wrz.22.2021.10.01.10.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:38:10 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 00/11] virtio-iommu: Add ACPI support
Date: Fri,  1 Oct 2021 18:33:48 +0100
Message-Id: <20211001173358.863017-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow instantiating a virtio-iommu device on ACPI systems by adding a
Virtual I/O Translation table (VIOT). Enable x86 support for VIOT.

Changes since v3 [1]:
* Cleaned the IOMMU-uniqueness checks. Added patch 6 to have a
  single check on x86.
* Added patch 5 that allows to gracefully propagate errors when setting
  resv_mem properties.
* Squashed table blobs into patch 11.
* Addressed all other comments from v3.

Caveats:

* Series depends on "acpi: refactor error prone build_header() and
  packed structures usage in ACPI tables" [2]

* Since virtio-iommu doesn't support boot-bypass at the moment, firmware
  can't access storage behind the IOMMU to load bootloader or kernel.
  This will be solved by another series currently in flight [3]. In the
  meantime you can use a storage device that bypasses the IOMMU such as
  virtio-blk-pci (without iommu_platform property) or a bypass bridge
  (docs/iommu-bypass.txt).

You can find a description of the VIOT table, which will be included in
next ACPI version, here: https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf

[1] https://lore.kernel.org/qemu-devel/20210914142004.2433568-1-jean-philippe@linaro.org/
[2] https://lore.kernel.org/qemu-devel/20210924122802.1455362-1-imammedo@redhat.com/
[3] https://lore.kernel.org/qemu-devel/20210930185050.262759-1-jean-philippe@linaro.org/

Jean-Philippe Brucker (11):
  hw/acpi: Add VIOT table
  hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
  hw/arm/virt: Remove device tree restriction for virtio-iommu
  hw/arm/virt: Reject instantiation of multiple IOMMUs
  hw/arm/virt: Use object_property_set instead of qdev_prop_set
  hw/i386: Move vIOMMU uniqueness check into pc.c
  pc: Allow instantiating a virtio-iommu device
  tests/acpi: allow updates of VIOT expected data files
  tests/acpi: add test cases for VIOT
  tests/acpi: add expected blob for VIOT test on virt machine
  tests/acpi: add expected blobs for VIOT test on q35 machine

 hw/acpi/viot.h                 |  13 ++++
 include/hw/i386/pc.h           |   2 +
 hw/acpi/viot.c                 | 112 +++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c       |   7 +++
 hw/arm/virt.c                  |  20 +++---
 hw/i386/acpi-build.c           |   5 ++
 hw/i386/pc.c                   |  30 ++++++++-
 hw/i386/x86-iommu.c            |   6 --
 hw/virtio/virtio-iommu-pci.c   |   7 ---
 tests/qtest/bios-tables-test.c |  38 +++++++++++
 hw/acpi/Kconfig                |   4 ++
 hw/acpi/meson.build            |   1 +
 hw/arm/Kconfig                 |   1 +
 hw/i386/Kconfig                |   1 +
 tests/data/acpi/q35/DSDT.viot  | Bin 0 -> 9398 bytes
 tests/data/acpi/q35/VIOT.viot  | Bin 0 -> 112 bytes
 tests/data/acpi/virt/VIOT      | Bin 0 -> 88 bytes
 17 files changed, 223 insertions(+), 24 deletions(-)
 create mode 100644 hw/acpi/viot.h
 create mode 100644 hw/acpi/viot.c
 create mode 100644 tests/data/acpi/q35/DSDT.viot
 create mode 100644 tests/data/acpi/q35/VIOT.viot
 create mode 100644 tests/data/acpi/virt/VIOT

-- 
2.33.0


