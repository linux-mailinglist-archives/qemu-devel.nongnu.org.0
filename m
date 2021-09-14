Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3828040B21B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:53:23 +0200 (CEST)
Received: from localhost ([::1]:36144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9oI-0006fs-6t
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MP-00069p-K9
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:35 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MH-0005Jd-9c
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:33 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso2249025wme.4
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 07:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UHyMPYlDmIlbQAAhibWP9XaTuAff2yKrgLf7OIJQfpQ=;
 b=qS7g8zxrXEidnQwPjtG+BfH2l5PHMHFvHxM9pQVY5k2uhQoulRiyJDxOg2gWL4+1nH
 GYN0qmanL1rFL/E7rg1yDgpSxiCOs37Yf4kPYOdCzeoS0BhWC0/omBikgIH5lliFN5To
 5fkmfnioP1Nlh2xOYKtZku/M9U2QcTFxw3LsrtPHgp1vjtgyVQfciIbaG04jFam49wLw
 DufB1SV8nB5Yj49XTTPRWxhLhspQrenrDwTP8+PfSkhbCU9X41g8Wq6JC9JK2QQ3liqO
 ajzoaH4iSBD4RpFYActGu7LjOOaQCQQ+W+BdijPvRnSgrBvJySp57NbSov11PCA7j0uJ
 pS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UHyMPYlDmIlbQAAhibWP9XaTuAff2yKrgLf7OIJQfpQ=;
 b=JXC8NNkrvo/MuPl/1pVuG5aSdclJQ6tcyyX/EADr7bFSQfk/7KpqD9awjmhK9O4pnC
 OyXTRuRpEwE3eNwY7g7fp9eSHqbYBgN3TN4EZX0H8NQzDroY/hlCh6/DlOaYPiK9cQ/f
 uAn/P/86kozNa+zsDyVXCRmtJfgCA+Uu5AjZooE/SF9i8uYitEDm0TYDqPSBb7jjVFFA
 t8vcuriyxll29iWL89bm0VgfqYi+7NQVYQ3fBhpZ3huaEGqM83PhJQBvx2/CeTEVQmP/
 C03M3ndjF+DMPoyBX/TLREDNvmtu0aagN9zJtGt8kZe+9SFmJdM2+NIQFCqS8duyWVkU
 0FKQ==
X-Gm-Message-State: AOAM530U6WmGdBQpQmlBHSLOrlQNQOtNY1YdrtH0va9MTCB99H/NHSq3
 wtEKipB3ZZC4VNLQKdGmADHIoA==
X-Google-Smtp-Source: ABdhPJxI9EtH+A3filGqgu0np9rDwT6qh6ZeMuQF4oo9awpKdVDw0Vwy66TwY9vUI50RcZlU+TmiOw==
X-Received: by 2002:a1c:a181:: with SMTP id k123mr2538278wme.90.1631629460929; 
 Tue, 14 Sep 2021 07:24:20 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k6sm184252wmo.37.2021.09.14.07.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:24:20 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 00/10] virtio-iommu: Add ACPI support
Date: Tue, 14 Sep 2021 15:19:55 +0100
Message-Id: <20210914142004.2433568-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x335.google.com
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
 pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow instantiating a virtio-iommu device on ACPI systems by adding a
Virtual I/O Translation table (VIOT). Enable x86 support for VIOT.

Changes since v2 [1]:
* Use acpi_table_begin() and acpi_table_end().

  This series now depends on "acpi: refactor error prone build_header()
  and packed structures usage in ACPI tables" [2]

* Dropped ACPI header definitions.
* Dropped doc patch, to be revisited later.
* Squashed patch 5.
* Added tests for q35 and virt machines: patch 6 temporarily enables
  blob updates (for bisectability), patch 7 adds the two test cases and
  patches 8-10 add the three reference tables.


There is an important caveat at the moment: when virtio-iommu is
instantiated, device DMA faults until the guest configures the IOMMU.
Firmware is therefore unable to access storage devices and load the
bootloader and OS. Upcoming patches will align virtio-iommu with other
vIOMMUs and let DMA bypass the IOMMU during boot. In the meantime there
are several ways to circumvent the problem:
* Use plain old virtio-blk as storage, without enabling the
  'iommu_platform' property. DMA from the device bypasses the IOMMU.
* Place the storage device behind a PCI bus that bypasses the IOMMU,
  using the new 'bypass_iommu' bridge property.
  See docs/bypass-iommu.txt
* Use non-PCI storage devices, for example virtio-blk-device on the
  arm64 virt machine.

You can find a description of the VIOT table, which will be included in
next ACPI version, here: https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf

[1] https://lore.kernel.org/qemu-devel/20210903143208.2434284-1-jean-philippe@linaro.org/
[2] https://lore.kernel.org/qemu-devel/20210907144814.741785-1-imammedo@redhat.com/

Jean-Philippe Brucker (10):
  hw/acpi: Add VIOT table
  hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
  hw/arm/virt: Remove device tree restriction for virtio-iommu
  hw/arm/virt: Reject instantiation of multiple IOMMUs
  pc: Allow instantiating a virtio-iommu device
  tests/acpi: allow updates of VIOT expected data files
  tests/acpi: add test cases for VIOT
  tests/acpi: add expected VIOT blob for virt machine
  tests/acpi: add expected DSDT blob for VIOT test on q35
  tests/acpi: add expected VIOT blob for q35 machine

 hw/acpi/viot.h                 |  13 ++++
 include/hw/i386/pc.h           |   2 +
 hw/acpi/viot.c                 | 112 +++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c       |   7 +++
 hw/arm/virt.c                  |  15 +++--
 hw/i386/acpi-build.c           |   5 ++
 hw/i386/pc.c                   |  28 ++++++++-
 hw/virtio/virtio-iommu-pci.c   |   7 ---
 tests/qtest/bios-tables-test.c |  39 ++++++++++++
 hw/acpi/Kconfig                |   4 ++
 hw/acpi/meson.build            |   1 +
 hw/arm/Kconfig                 |   1 +
 hw/i386/Kconfig                |   1 +
 tests/data/acpi/q35/DSDT.viot  | Bin 0 -> 9415 bytes
 tests/data/acpi/q35/VIOT.viot  | Bin 0 -> 112 bytes
 tests/data/acpi/virt/VIOT      | Bin 0 -> 88 bytes
 16 files changed, 219 insertions(+), 16 deletions(-)
 create mode 100644 hw/acpi/viot.h
 create mode 100644 hw/acpi/viot.c
 create mode 100644 tests/data/acpi/q35/DSDT.viot
 create mode 100644 tests/data/acpi/q35/VIOT.viot
 create mode 100644 tests/data/acpi/virt/VIOT

-- 
2.33.0


