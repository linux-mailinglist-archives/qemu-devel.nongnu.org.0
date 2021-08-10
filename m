Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CDC3E55D2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:48:21 +0200 (CEST)
Received: from localhost ([::1]:40240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNQq-0000k8-5a
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPH-0006UQ-Ux
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:46:44 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:46753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPG-00081L-44
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:46:43 -0400
Received: by mail-ed1-x530.google.com with SMTP id f13so29043467edq.13
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 01:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n6/p42lQ3xlNmfzVU4VUBau7zfQXFWcF9XLxtvX2gxQ=;
 b=IR3q8C0grgYJ2Ulmzdtvqf/mHEo/1cebMbaqFotufmRaoI/14bRrU7Z4FuhX14PxW5
 N9cwXpbqLbfSUD4qxLUBnZadabq9bIfkHKCpwksViVXGZ7FYP5rHf1IhyoQjVR91MZfw
 RELft+FIRUcyPeTGM3QqwTa7txrGmrErOLSeXmkkh5zED2RrVjjzEOOWccHwH7aQ/Kp0
 Zm3bcCqZNixAMxghsf8E4l+wS6+nudcJa2vNYxBnVvCG4BPGFTKkajXurF1W9gpFoz9d
 7EHbsN07UYySGbgN8WPzIn6uqk3SS9v68E3NA60jLdUObLroueQuRw8KLU5IIAnrb7iw
 pufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n6/p42lQ3xlNmfzVU4VUBau7zfQXFWcF9XLxtvX2gxQ=;
 b=fEtjV+EIR/puz56fEGpCVQ5VlphjAzL5MxpzOIkmugW/O1fh2dodbmhnfgeMDMR1GM
 DxeFFtvMEDSHG2q5AhdUR1Sd8U/I43cDsc1aMeJwjK1lQ3R0vYHT9ozUyUIg1zaAsFdB
 tRnxkt7B3gSgnRFx3hSRK+Y3YpOLvgHu7HMe2MyqOqmCPKyQI+cLHL8b90s7ztF2krhr
 gRhWDpxhNsQO1m2vLLKvbI/uV0KzWOz1gFKUIGlq3gXLzZQ4BYDaK/lr1wmrIz9BlW2J
 E5eF2hoKdmpLP6Ulo0diacfobGgqqju8Kx44QOui02uW6MfRJVRdWea6er39cGkrNoQc
 XwYw==
X-Gm-Message-State: AOAM53171+uNRuimFraXScGe35yqL7Cc6GT134XdVbGFElZOwlZW3Kma
 Lh/lIKnpemStgjw9FuYrvCaVcw==
X-Google-Smtp-Source: ABdhPJwfrJRONBjS92yufDryy835xrq+Zm30oTTuaE51wulXH8WGFoRhQ1c0G0e+4GQRNHT5WkE2lw==
X-Received: by 2002:a05:6402:74f:: with SMTP id
 p15mr3595682edy.195.1628585199769; 
 Tue, 10 Aug 2021 01:46:39 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id fl2sm1533516ejc.114.2021.08.10.01.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 01:46:39 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH 0/6] virtio-iommu: Add ACPI support
Date: Tue, 10 Aug 2021 10:45:00 +0200
Message-Id: <20210810084505.2257983-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x530.google.com
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
 pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow instantiating a virtio-iommu device on ACPI systems by adding a
Virtual I/O Translation table (VIOT). Enable x86 support for VIOT.

With a simple configuration the table contains a virtio-iommu-pci node
and a pci-range node:

	qemu-system-aarch64 -M virt -bios QEMU_EFI.fd
	  -device virtio-iommu ...

	$ iasl -d ...
	[000h 0000   4]                    Signature : "VIOT"

	[024h 0036   2]                   Node count : 0002
	[026h 0038   2]                  Node offset : 0030

	[030h 0048   1]                         Type : 03 [VirtIO-PCI IOMMU]
	[032h 0050   2]                       Length : 0010
	[034h 0052   2]                  PCI Segment : 0000
	[036h 0054   2]               PCI BDF number : 0030

	[040h 0064   1]                         Type : 01 [PCI Range]
	[042h 0066   2]                       Length : 0018
	[044h 0068   4]               Endpoint start : 00000000
	[048h 0072   2]            PCI Segment start : 0000
	[04Ah 0074   2]              PCI Segment end : 0000
	[04Ch 0076   2]                PCI BDF start : 0000
	[04Eh 0078   2]                  PCI BDF end : 00FF
	[050h 0080   2]                  Output node : 0030

With a more complex topology multiple PCI Range nodes describe the system:

	qemu-system-aarch64 -bios QEMU_EFI.fd -device virtio-iommu
	  -M virt,default_bus_bypass_iommu=true
	  -device pxb-pcie,bus_nr=0x10,id=pcie.1000,bus=pcie.0
	  -device pxb-pcie,bus_nr=0x20,id=pcie.2000,bus=pcie.0,bypass_iommu=true
	  -device pxb-pcie,bus_nr=0x30,id=pcie.3000,bus=pcie.0

	[024h 0036   2]                   Node count : 0003
	[026h 0038   2]                  Node offset : 0030

	[030h 0048   1]                         Type : 03 [VirtIO-PCI IOMMU]
	[032h 0050   2]                       Length : 0010
	[034h 0052   2]                  PCI Segment : 0000
	[036h 0054   2]               PCI BDF number : 0020

	[040h 0064   1]                         Type : 01 [PCI Range]
	[042h 0066   2]                       Length : 0018
	[044h 0068   4]               Endpoint start : 00003000
	[048h 0072   2]            PCI Segment start : 0000
	[04Ah 0074   2]              PCI Segment end : 0000
	[04Ch 0076   2]                PCI BDF start : 3000
	[04Eh 0078   2]                  PCI BDF end : 32FF
	[050h 0080   2]                  Output node : 0030

	[058h 0088   1]                         Type : 01 [PCI Range]
	[05Ah 0090   2]                       Length : 0018
	[05Ch 0092   4]               Endpoint start : 00001000
	[060h 0096   2]            PCI Segment start : 0000
	[062h 0098   2]              PCI Segment end : 0000
	[064h 0100   2]                PCI BDF start : 1000
	[066h 0102   2]                  PCI BDF end : 11FF
	[068h 0104   2]                  Output node : 0030


The VIOT table description will be in the next release of ACPI.
In the meantime you can find a description at
https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf
Linux support for VIOT was added in version 5.14

Eric Auger (1):
  pc: Allow instantiating a virtio-iommu device

Jean-Philippe Brucker (5):
  acpi: Add VIOT structure definitions
  hw/acpi: Add VIOT table
  hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
  hw/arm/virt: Remove device tree restriction for virtio-iommu
  pc: Add VIOT table for virtio-iommu

 hw/acpi/viot.h               | 13 ++++++
 include/hw/acpi/acpi-defs.h  | 60 ++++++++++++++++++++++++++
 include/hw/i386/pc.h         |  2 +
 hw/acpi/viot.c               | 82 ++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c     |  7 +++
 hw/arm/virt.c                | 10 +----
 hw/i386/acpi-build.c         |  5 +++
 hw/i386/pc.c                 | 18 +++++++-
 hw/virtio/virtio-iommu-pci.c |  7 ---
 hw/acpi/Kconfig              |  4 ++
 hw/acpi/meson.build          |  1 +
 hw/arm/Kconfig               |  1 +
 hw/i386/Kconfig              |  1 +
 13 files changed, 195 insertions(+), 16 deletions(-)
 create mode 100644 hw/acpi/viot.h
 create mode 100644 hw/acpi/viot.c

-- 
2.32.0


