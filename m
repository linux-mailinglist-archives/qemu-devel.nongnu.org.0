Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDB04351F4
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 19:49:31 +0200 (CEST)
Received: from localhost ([::1]:58130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdFiV-0004XP-35
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 13:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUa-0005BU-8a
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:08 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUQ-0002UA-V4
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:07 -0400
Received: by mail-wr1-x435.google.com with SMTP id r7so48563702wrc.10
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 10:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oIH6WK1qXdpPwPLW/BefpJvgWS12mdE2Q4g5YXgA9Ks=;
 b=chpGLP+UJEzzZP4WDfrhMYVBOI6CoXW3PZW747eNOX35+ssPPxt7boXvnibRulSOvq
 eZ8lWlGsvioAgy6iUucg8Hcn6/Z7FJDa73WNewV/bI7YFDTML+JPFn8MzlgkbQSgEtAr
 8qFP+KrVwJIV69IFVbOI/zewLPsA3yel88reMMoNoj84SCM4aAs9Upk13NJPD68RFlYy
 aHLGE8da/Fif8xhtP9wsjW4UZTGCSFU6RoT2RwiimiRtbL+Ubji/N6yXpcH0sXeOAawd
 ZUk+mLyJg2UmzURCbYsu+o04tqEiDyPfqIOaZOVgyYkwMUGFZ2lsdXKWiYU2XfiKb7su
 a73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oIH6WK1qXdpPwPLW/BefpJvgWS12mdE2Q4g5YXgA9Ks=;
 b=tnsNAXngtMCKBMvWDjhXmtSBdoJlLzaTaKkawSzyue5wqiHr4WTMdBpMpA+a5QrErS
 47sKGLz3g2wJ7o3LlfAHQpKG3Ln7SMfy/CDeTH6AM/6M1XbWO1EiLP6C8LPX/M2Q+afO
 YO+k9PKwbY2MLsm6UQwrV/M9gVt9eid6Sa3hxmdwvpFwXiALSpy9U9ErP3ftOSQhEaGC
 bd+Ncfoq3GX7lHzt6fm70rZ/Vi+FGDHWyWxFyEiiSHaaWt1l3GoiAJoMdviYIjvV+MOZ
 rftk4YId/Bq7QqzWXpJ25NJNg2n53K0vCL+6OLZFv13w0CrGvtYxEbBBVwZdsvcGcgwY
 XTSw==
X-Gm-Message-State: AOAM530yrDX3EfZ2I/jnN6j/nwk29jKKr7ZqcmrxuhitWCVtpAlXxC6O
 pUnZBzgKOhSd8J4Y1V3ndHSSSQ==
X-Google-Smtp-Source: ABdhPJzOgMzbAIgMRZU+275AJL5FDqd2L/WAPRHYo9Mnc9o+98G2CQdPSWk5ybRg+xG35ALI/9C7ww==
X-Received: by 2002:a5d:6d8c:: with SMTP id l12mr771231wrs.80.1634751296616;
 Wed, 20 Oct 2021 10:34:56 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id n7sm2662270wrp.17.2021.10.20.10.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 10:34:55 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 00/12] virtio-iommu: Add ACPI support
Date: Wed, 20 Oct 2021 18:27:34 +0100
Message-Id: <20211020172745.620101-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ehabkost@redhat.com,
 eric.auger@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow instantiating a virtio-iommu device on ACPI systems by adding a
Virtual I/O Translation table (VIOT). Enable x86 support for VIOT.

Patches 5-8 need acks from Arm maintainers in order for this to go
through the x86 tree.

Changes since v4 [1]:
* New patch 2 removes unnecessary x86_iommu_get_type().
* Patch 3 now moves the IOMMU variable into PCMachineState, in addition
  to the check for duplicate IOMMUs.
* Fixed assertion error in patch 6.
* Addressed the other comments.
* Added more review and test tags, thanks!

The boot-bypass series [2] isn't a hard requirement for this series but
will be needed for complete support. In the meantime, storage accessed
by firmware needs to bypass the IOMMU some other way, using either a
virtio-blk device without the iommu_platform property, or a bypass
bridge (docs/iommu-bypass.txt).

You can find a description of the VIOT table, which will be included in
next ACPI version, here: https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf

[1] https://lore.kernel.org/qemu-devel/20211001173358.863017-1-jean-philippe@linaro.org/
[2] https://lore.kernel.org/qemu-devel/20210930185050.262759-1-jean-philippe@linaro.org/

Jean-Philippe Brucker (12):
  hw/acpi: Add VIOT table
  hw/i386/pc: Remove x86_iommu_get_type()
  hw/i386/pc: Move IOMMU singleton into PCMachineState
  hw/i386/pc: Allow instantiating a virtio-iommu device
  hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
  hw/arm/virt: Remove device tree restriction for virtio-iommu
  hw/arm/virt: Reject instantiation of multiple IOMMUs
  hw/arm/virt: Use object_property_set instead of qdev_prop_set
  tests/acpi: allow updates of VIOT expected data files
  tests/acpi: add test cases for VIOT
  tests/acpi: add expected blob for VIOT test on virt machine
  tests/acpi: add expected blobs for VIOT test on q35 machine

 hw/acpi/viot.h                 |  13 ++++
 include/hw/i386/pc.h           |   1 +
 include/hw/i386/x86-iommu.h    |  12 ----
 hw/acpi/viot.c                 | 114 +++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c       |   7 ++
 hw/arm/virt.c                  |  20 +++---
 hw/i386/acpi-build.c           |  28 ++++----
 hw/i386/amd_iommu.c            |   2 -
 hw/i386/intel_iommu.c          |   3 -
 hw/i386/pc.c                   |  26 +++++++-
 hw/i386/x86-iommu-stub.c       |   5 --
 hw/i386/x86-iommu.c            |  31 +++------
 hw/virtio/virtio-iommu-pci.c   |  12 +---
 tests/qtest/bios-tables-test.c |  38 +++++++++++
 hw/acpi/Kconfig                |   4 ++
 hw/acpi/meson.build            |   1 +
 hw/arm/Kconfig                 |   1 +
 hw/i386/Kconfig                |   1 +
 tests/data/acpi/q35/DSDT.viot  | Bin 0 -> 9398 bytes
 tests/data/acpi/q35/VIOT.viot  | Bin 0 -> 112 bytes
 tests/data/acpi/virt/VIOT      | Bin 0 -> 88 bytes
 21 files changed, 242 insertions(+), 77 deletions(-)
 create mode 100644 hw/acpi/viot.h
 create mode 100644 hw/acpi/viot.c
 create mode 100644 tests/data/acpi/q35/DSDT.viot
 create mode 100644 tests/data/acpi/q35/VIOT.viot
 create mode 100644 tests/data/acpi/virt/VIOT

-- 
2.33.0


