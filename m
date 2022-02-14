Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6194B5132
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:09:32 +0100 (CET)
Received: from localhost ([::1]:45978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJb6h-0005Qw-Os
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:09:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nJala-0008JH-JY
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:47:44 -0500
Received: from [2a00:1450:4864:20::62d] (port=45862
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nJalW-00066t-4W
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:47:40 -0500
Received: by mail-ej1-x62d.google.com with SMTP id lw4so6368870ejb.12
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8EynZCzzOwa6d/pox+zxXc087LSOBF09jVCbGFxyu6A=;
 b=abNA3IWECfAIDz5GwAXzBU7z0W+KWLzvVNKWWAMkfvg2ddmqNTpWjPYRV1Icl/lCi9
 a3O6Wwc+aZGaoPCoZa2mSajSZSkz9pnKSZ/qIX+NM+Sr9XglLJw3s4GCtX588OhyuEHn
 h5LT1CuwvpZUc7pExsZc4iOs+S6Ai0zf3YazlBD9jc6T/lfANI7BJkcgHUH7bn+v2Vd7
 3vMxt8a0UiX7QgIrl0fOYGdU7r23ecWGODMgClBE5OylrM9UeSo8A1CAdddBAcTrzjAf
 j7e0AVdLt+vGQsb+5cGjKyyz2r04A2dx11l7CMbdqCJmFzQsQkrXZcfI9k36/B84YqJQ
 LPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8EynZCzzOwa6d/pox+zxXc087LSOBF09jVCbGFxyu6A=;
 b=V4pyJzNagXfQLmBzdZmz55E+9Eu+Mkrbmal2cO82r7VWDHnygLFZTJqAXUykX0PpD8
 L+SSaniB0fpVU1g8u0s/ltpFa0+b6SqQHj5mZOaJblQKO4IJ4onVQJRFNSdDXXuPo1hj
 blWYPtcJ1PTp7UrI7DFl4e0t8BFmsowy66k4SmBhlbzAifGlgx4JpA+ClJkje76XAmwZ
 luNw7joZT1eExw0/TfbQZA8U0sTGxrb50REh1FgNobBmhao+4LpWAUzI8axplv43CcN8
 z8AxfoArs4Vbb5lIGkiRi+vKJMKp2jpsCvUJtUHuqd3QPindY5sVHPkpw8SgJ3z+4ulA
 7w6A==
X-Gm-Message-State: AOAM530eAXbdnfCnH/SxUfHc4wNBlvjXfNr1Tr4iObUsjb2sOLb6w5y+
 H4AjJMc2cICggGnFq+peLPFDIQ==
X-Google-Smtp-Source: ABdhPJx2+R3lbAYzzRgrDeJlL0aHZ/oRTPmUV4eUX1HqbybQoPQAZ3jQJykApVlLFM+P3T2JupfL7Q==
X-Received: by 2002:a17:906:6482:: with SMTP id
 e2mr11514279ejm.198.1644842854614; 
 Mon, 14 Feb 2022 04:47:34 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id kq17sm1475422ejb.205.2022.02.14.04.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 04:47:33 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 0/4] virtio-iommu: Support VIRTIO_IOMMU_F_BYPASS_CONFIG
Date: Mon, 14 Feb 2022 12:43:52 +0000
Message-Id: <20220214124356.872985-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: lvivier@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 thuth@redhat.com, mst@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pasic@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the VIRTIO_IOMMU_F_BYPASS feature with
VIRTIO_IOMMU_F_BYPASS_CONFIG, which enables a config space bit to switch
global bypass on and off.

Add a boot-bypass option, which defaults to 'on' to be in line with
other vIOMMUs and to allow running firmware/bootloader that are unaware
of the IOMMU. x86 doesn't need a workaround to boot with virtio-iommu
anymore.

Since v2 [1]:
* Added the new bypass bits to the migration stream.
  As discussed on the v2 thread, we assume that cross-version
  compatibility is not required for live migration at the moment, so we
  only increase the version number. Patch 2 says: "We add the bypass
  field to the migration stream without introducing subsections, based
  on the assumption that this virtio-iommu device isn't being used in
  production enough to require cross-version migration at the moment
  (all previous version required workarounds since they didn't support
  ACPI and boot-bypass)."

[1] https://lore.kernel.org/qemu-devel/20220127142940.671333-1-jean-philippe@linaro.org/

Jean-Philippe Brucker (4):
  linux-headers: update to v5.17-rc1
  virtio-iommu: Default to bypass during boot
  virtio-iommu: Support bypass domain
  tests/qtest/virtio-iommu-test: Check bypass config

 include/hw/virtio/virtio-iommu.h              |   1 +
 include/standard-headers/asm-x86/kvm_para.h   |   1 +
 include/standard-headers/drm/drm_fourcc.h     |  11 ++
 include/standard-headers/linux/ethtool.h      |   1 +
 include/standard-headers/linux/fuse.h         |  60 +++++++-
 include/standard-headers/linux/pci_regs.h     | 142 +++++++++---------
 include/standard-headers/linux/virtio_gpio.h  |  72 +++++++++
 include/standard-headers/linux/virtio_i2c.h   |  47 ++++++
 include/standard-headers/linux/virtio_iommu.h |   8 +-
 .../standard-headers/linux/virtio_pcidev.h    |  65 ++++++++
 include/standard-headers/linux/virtio_scmi.h  |  24 +++
 linux-headers/asm-generic/unistd.h            |   5 +-
 linux-headers/asm-mips/unistd_n32.h           |   2 +
 linux-headers/asm-mips/unistd_n64.h           |   2 +
 linux-headers/asm-mips/unistd_o32.h           |   2 +
 linux-headers/asm-powerpc/unistd_32.h         |   2 +
 linux-headers/asm-powerpc/unistd_64.h         |   2 +
 linux-headers/asm-riscv/bitsperlong.h         |  14 ++
 linux-headers/asm-riscv/mman.h                |   1 +
 linux-headers/asm-riscv/unistd.h              |  44 ++++++
 linux-headers/asm-s390/unistd_32.h            |   2 +
 linux-headers/asm-s390/unistd_64.h            |   2 +
 linux-headers/asm-x86/kvm.h                   |  16 +-
 linux-headers/asm-x86/unistd_32.h             |   1 +
 linux-headers/asm-x86/unistd_64.h             |   1 +
 linux-headers/asm-x86/unistd_x32.h            |   1 +
 linux-headers/linux/kvm.h                     |  17 +++
 hw/virtio/virtio-iommu.c                      |  99 ++++++++++--
 tests/qtest/virtio-iommu-test.c               |   2 +
 hw/virtio/trace-events                        |   4 +-
 30 files changed, 561 insertions(+), 90 deletions(-)
 create mode 100644 include/standard-headers/linux/virtio_gpio.h
 create mode 100644 include/standard-headers/linux/virtio_i2c.h
 create mode 100644 include/standard-headers/linux/virtio_pcidev.h
 create mode 100644 include/standard-headers/linux/virtio_scmi.h
 create mode 100644 linux-headers/asm-riscv/bitsperlong.h
 create mode 100644 linux-headers/asm-riscv/mman.h
 create mode 100644 linux-headers/asm-riscv/unistd.h

-- 
2.35.1


