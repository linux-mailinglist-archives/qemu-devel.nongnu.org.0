Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8744949E60A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 16:28:07 +0100 (CET)
Received: from localhost ([::1]:34858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD6gw-0003ow-KP
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 10:28:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nD5sd-0005HN-QQ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:36:08 -0500
Received: from [2a00:1450:4864:20::436] (port=33628
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nD5sZ-0005bU-Jb
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:36:07 -0500
Received: by mail-wr1-x436.google.com with SMTP id e8so5282697wrc.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 06:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p2GhnkmTKwpX6vg+BavbftPZC4r78oegMkP8OGJ236c=;
 b=QbtCtQMRcEr1b+48cnAIdIhOwRv/Rjsl0fqawgXCT5DNTRJ69FJOoWdZlcKpN9jIDn
 BPmI5ps1/GQ8OSZYTL7zMZuQ6x9a+wX/aZa2R+dDXtypcDTgIDHvYOWGGedcheXwY368
 A7Oym7WQt1mzqBW91gcv6Vu4yEc7ICzA7tyXKrinJO+CwaWmgGXmqV/AFdWN8ZHgf+rS
 4pMQAmeM2axgAlH4hju5L54fYl4CB1i1qonTcFcXcnZtz6SCCjqqKFdA4CgvjB+qAeK/
 Wy/XZ7lrNed4j/9UskxIWXgP0iciAG7f4ji6KxuADIYl9HSQkEsHAi83k2FfSQzk/eAY
 jo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p2GhnkmTKwpX6vg+BavbftPZC4r78oegMkP8OGJ236c=;
 b=IhHTqRBfRTBm7jLY7VK52WYg1ILUZkfwgIJmfrVp+zRqMf1k8klE7IcuIRQfrmg/hU
 GAdD395YpQPuVNyWqLgAywxj0vxMxoj/tiuYQ6mz1Z5Ork4IAekLG2KjX8JWEslKWpK/
 Dq0ZwHNXUq7+Z8eQENGixy8vBiFV8Z1/nok+SFIKCXUuL10ztbEseU11TlPrU3pOqjKG
 KS2NQ8FZPyYzvwClHBfTIs+X7REEGyaHcWDv6ZQlypkEhWW4NqTrES2ZmlwmDKmkzew2
 kE86HXtUrS280v1qTWEoLE19u8XTY3FPOrwP+uMzfJVvEFL0yhFaWnlPXuN/3LzHMm7U
 Ovmw==
X-Gm-Message-State: AOAM531hluN05qx6zxbEKC4LZTYmRFbYkMTut9ecIh6+BsKkax5C8LSs
 sdtfLVeeetFQvpbqFQO1Zh4zxQ==
X-Google-Smtp-Source: ABdhPJzXiOsBguTLqN0W0/z371BatsMwdFYl61+QUeJwqrsXmw+EUj/a5I5xBcsz+zeT21Q7DojTnw==
X-Received: by 2002:a05:6000:4d:: with SMTP id
 k13mr3287046wrx.625.1643294156612; 
 Thu, 27 Jan 2022 06:35:56 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id i3sm2285894wru.33.2022.01.27.06.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 06:35:56 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 0/4] virtio-iommu: Support VIRTIO_IOMMU_F_BYPASS_CONFIG
Date: Thu, 27 Jan 2022 14:29:37 +0000
Message-Id: <20220127142940.671333-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 pasic@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the VIRTIO_IOMMU_F_BYPASS feature with
VIRTIO_IOMMU_F_BYPASS_CONFIG, which enables a config space bit to switch
global bypass on and off.

Add a boot-bypass option, which defaults to 'on' to be in line with
other vIOMMUs and to allow running firmware/bootloader that are unaware
of the IOMMU. x86 doesn't need a workaround to boot with virtio-iommu
anymore.

Since v1 [1]:
* The specification [2] and Linux header [3] changes have been merged
* Patch 1 pulls in the whole Linux header changes, in order to
  get the virtio_iommu.h update
* Reset bypass on system reset, and other fixes suggested by Eric
* Added a simple test, patch 4, that checks the boot bypass value

[1] https://lore.kernel.org/qemu-devel/20210930185050.262759-1-jean-philippe@linaro.org/
[2] https://github.com/oasis-tcs/virtio-spec/issues/119
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=063ebb19d962

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
 hw/virtio/virtio-iommu.c                      |  83 +++++++++-
 tests/qtest/virtio-iommu-test.c               |   2 +
 hw/virtio/trace-events                        |   4 +-
 30 files changed, 552 insertions(+), 83 deletions(-)
 create mode 100644 include/standard-headers/linux/virtio_gpio.h
 create mode 100644 include/standard-headers/linux/virtio_i2c.h
 create mode 100644 include/standard-headers/linux/virtio_pcidev.h
 create mode 100644 include/standard-headers/linux/virtio_scmi.h
 create mode 100644 linux-headers/asm-riscv/bitsperlong.h
 create mode 100644 linux-headers/asm-riscv/mman.h
 create mode 100644 linux-headers/asm-riscv/unistd.h

-- 
2.34.1


