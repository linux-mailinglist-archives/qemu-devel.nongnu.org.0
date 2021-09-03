Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B524240014E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 16:34:28 +0200 (CEST)
Received: from localhost ([::1]:56726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMAGx-00071h-Fe
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 10:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFF-0004EA-FU
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:32:41 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFC-0005Yb-Kr
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:32:41 -0400
Received: by mail-wm1-x329.google.com with SMTP id g135so3638771wme.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 07:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wCmSGUagquqiKpr5H6LCLK5h69XDNubxlm2zXBcPFl0=;
 b=ps07xr1oG2cKa292IgBKezled1nYH1hT5Hwx+/4EiZfSWtbgHtcvTQh761jivh7tmx
 zmqxI2ofqFcTZwLRwxSVmfRpELzWgoV1ceAjm3Gz2da22H8lq9gm+2TY0WpAm+rretHb
 9mS+yf2qJaG5azCCcwGME6UCW7UROatve7M2NtyJn/Jtd78D6K9r5Bqt2rXve75wDkue
 ZwoK4m61h/gXlHzgHoVJtsFdmPS5aAFhcEbzsBI9MrKdsuQv/c+KcaVq0T6srurfaSfG
 IhhUe9QCcJI7MUlDTDQ4j05FfQqn1Klo5AFhfdV6cjvyCmB8RWMrFdOJtlDH25oBXXDM
 avyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wCmSGUagquqiKpr5H6LCLK5h69XDNubxlm2zXBcPFl0=;
 b=uH5Xj6ykdQmlWNFFa51oqJ+a+fgBwPMyCwfJZaZDraiO7otXLbGl75Izr+ZZaEBQ/L
 y5Yl5iJUhtuC1oNJ7A4pwjq+XFz4QzSk5YdvYAWs6uq6dcwpSShFHZ+/6Bm36fhA9fu6
 UvEXbUAGGoCrb/zC9smc7AjzMUcvNFcscU3HCZ9QNPda4VHK29DJs3wH9g4wwAiBZic4
 QUWwinJLyaolRoaCnG3QHQYzdMwPNchgT78TC6OV9MqQTVjSatPCkDjd8GJ50VwJl8dX
 Afrj0rR8B2WUqtOBy6wJd7GNu7jnNGeC4oZ3kOnKQ0GIdQy/6Ib5yU1tZu8iTu5VXQpv
 iLCg==
X-Gm-Message-State: AOAM53236bFm2WwxobLDyL5quLfBvo8ZA5RNGufXrG9Kzqyh0WDSVaZA
 SEjKZBV1VMltbcOh0Vduvb0HgA==
X-Google-Smtp-Source: ABdhPJxIk2UFfpPkRdnjJaqFeYLtPPxQayhhldBNwrIvjWKxvUaC+ZP5X8PiF00jh0sxnH5WIoX/ww==
X-Received: by 2002:a05:600c:3213:: with SMTP id
 r19mr8551815wmp.11.1630679555026; 
 Fri, 03 Sep 2021 07:32:35 -0700 (PDT)
Received: from localhost.localdomain (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id z2sm4314843wma.45.2021.09.03.07.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 07:32:34 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 0/8] virtio-iommu: Add ACPI support
Date: Fri,  3 Sep 2021 16:32:01 +0200
Message-Id: <20210903143208.2434284-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Changes since [v1]:
* Patch 2, use build_append_int_noprefix() to generate the ACPI table.
* Patch 7, check that only one IOMMU is instantiated on x86.
* Added patch 5 that rejects multiple instantations of virtio-iommu on
  Arm. It's not crucial to the series but it matches the check added to
  x86 and is very simple.
* Added patch 8 documenting that interrupt remapping is not supported.

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

You can find a description of the VIOT table, which will be included in next
ACPI version, here: https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf

[v1] https://lore.kernel.org/qemu-devel/20210810084505.2257983-1-jean-philippe@linaro.org/

Eric Auger (1):
  pc: Allow instantiating a virtio-iommu device

Jean-Philippe Brucker (7):
  acpi: Add VIOT structure definitions
  hw/acpi: Add VIOT table
  hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
  hw/arm/virt: Remove device tree restriction for virtio-iommu
  hw/arm/virt: Reject instantiation of multiple IOMMUs
  pc: Add VIOT table for virtio-iommu
  docs: Add '-device virtio-iommu' entry

 hw/acpi/Kconfig              |   4 ++
 hw/arm/Kconfig               |   1 +
 hw/i386/Kconfig              |   1 +
 hw/acpi/viot.h               |  13 ++++
 include/hw/acpi/acpi-defs.h  |  60 +++++++++++++++++++
 include/hw/i386/pc.h         |   2 +
 hw/acpi/viot.c               | 112 +++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c     |   7 +++
 hw/arm/virt.c                |  15 +++--
 hw/i386/acpi-build.c         |   5 ++
 hw/i386/pc.c                 |  28 ++++++++-
 hw/virtio/virtio-iommu-pci.c |   7 ---
 hw/acpi/meson.build          |   1 +
 qemu-options.hx              |   3 +
 14 files changed, 243 insertions(+), 16 deletions(-)
 create mode 100644 hw/acpi/viot.h
 create mode 100644 hw/acpi/viot.c

-- 
2.33.0


