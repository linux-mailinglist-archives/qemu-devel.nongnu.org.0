Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6871C43B9A9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:33:02 +0200 (CEST)
Received: from localhost ([::1]:39688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRFt-0002mt-GG
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfR8I-0005oz-P6
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:25:11 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:42901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfR8F-0006js-OS
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:25:10 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 b82-20020a1c8055000000b0032ccc728d63so187152wmd.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J+mydok+GdSz5BEWTeeuDqIV/M+1kwExOxID/aNZBvc=;
 b=TzkroQGT9LJw9wHTh7m1/zetodpfiS8Jf8nUF1ZP2dgd7U2M4pFRSQacdraI5eujRC
 ybCPdYIGrLh6qlwOpJcmYlondt1q7vkrvxUMabnvAIoyVxf0/dOLpGMSA2nN1fU+0XEM
 84G5E6p0ytTaiYKFFPtbCTeXOW4dNYtsP/WcAW+9NUKdIZNGjWzkcycYfAYReg0f9zyi
 w1FCOFZq+xcyCYnZ+fA1OloRm4sZjBC041UZfbpYRH84/KowbGym9/2J5yR9gwMO2ltS
 v4DGnEkIloHZ8JZxZuWxfJzkout9IxWkfJ/3uP+W7iwlwuIfD4BfFeW2YsHd7EcLlD36
 yAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J+mydok+GdSz5BEWTeeuDqIV/M+1kwExOxID/aNZBvc=;
 b=cus2zT02iVCC4jATxmFdPnB+f/+ctKeV0aM1YspUz1fNgyIN0pb5BHe5MDKVUK5ram
 QAQLDoyH3juediRsMIt5fIZq3QOcXKEakJzwnP9rPVMOalUk68P9cP3f2Jn+YcWlkARZ
 kHbmjsdHSaBYpXUPLIgs3gtojo3pkjPEA5XRLZEvZUTw50kHadw1YZun0cJpghZdILtB
 Fe+vYB4KfXt9xJCR//oOd+4W483CquhWlcx35Z1AXyHFT09fqcGwvWyLdFJBMQPD6p5Y
 p+EXcZaQifTyXkWOBcXyCRKogI+Up7dOzCfRoRKDaEhecB7K7kumD2H195LFMcUh0UIm
 cOZw==
X-Gm-Message-State: AOAM530d1Rr7pKZbpufX0s+UFtPfR5PsLgovmwOQiVR+39jEHNu0mhfk
 TFCY/cPMVh6T+ce+Kvg6KPwuhw==
X-Google-Smtp-Source: ABdhPJwZIh0+oz19c3gQnm4LjoJecHCJqaTLtZDSsvZV8Lpnbutu7G2LrBT2JM0YZtftmS15i7c98g==
X-Received: by 2002:a7b:cb99:: with SMTP id m25mr334324wmi.87.1635272704021;
 Tue, 26 Oct 2021 11:25:04 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id b19sm1275283wmj.9.2021.10.26.11.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 11:25:02 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v6 0/7] virtio-iommu: Add ACPI support (x86 part)
Date: Tue, 26 Oct 2021 19:20:19 +0100
Message-Id: <20211026182024.2642038-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x336.google.com
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
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, eric.auger@redhat.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow instantiating a virtio-iommu device on ACPI systems by adding a
Virtual I/O Translation table (VIOT). Enable x86 support for VIOT.

Changes since v5 [1]:
* Split the series into x86 and arm parts. This patchset contains only
  the VIOT table (patch 1) and the x86 support.
* Rebased onto master to fix a merge conflict
* Added review and acks, thanks!

The boot-bypass series [2] isn't a hard requirement for this series but
will be needed for complete support. In the meantime, storage accessed
by firmware needs to bypass the IOMMU some other way, using either a
virtio-blk device without the iommu_platform property, or a bypass
bridge (docs/iommu-bypass.txt).

You can find a description of the VIOT table, which will be included in
next ACPI version, here: https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf

[1] https://lore.kernel.org/qemu-devel/20211020172745.620101-1-jean-philippe@linaro.org/
[2] https://lore.kernel.org/qemu-devel/20210930185050.262759-1-jean-philippe@linaro.org/

Jean-Philippe Brucker (7):
  hw/acpi: Add VIOT table
  hw/i386/pc: Remove x86_iommu_get_type()
  hw/i386/pc: Move IOMMU singleton into PCMachineState
  hw/i386/pc: Allow instantiating a virtio-iommu device
  tests/acpi: allow updates of VIOT expected data files on q35 machine
  tests/acpi: add test case for VIOT on q35 machine
  tests/acpi: add expected blobs for VIOT test on q35 machine

 hw/acpi/viot.h                 |  13 ++++
 include/hw/i386/pc.h           |   1 +
 include/hw/i386/x86-iommu.h    |  12 ----
 hw/acpi/viot.c                 | 114 +++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c           |  28 ++++----
 hw/i386/amd_iommu.c            |   2 -
 hw/i386/intel_iommu.c          |   3 -
 hw/i386/pc.c                   |  26 +++++++-
 hw/i386/x86-iommu-stub.c       |   5 --
 hw/i386/x86-iommu.c            |  31 +++------
 tests/qtest/bios-tables-test.c |  21 ++++++
 hw/acpi/Kconfig                |   4 ++
 hw/acpi/meson.build            |   1 +
 hw/i386/Kconfig                |   1 +
 tests/data/acpi/q35/DSDT.viot  | Bin 0 -> 9398 bytes
 tests/data/acpi/q35/VIOT.viot  | Bin 0 -> 112 bytes
 16 files changed, 205 insertions(+), 57 deletions(-)
 create mode 100644 hw/acpi/viot.h
 create mode 100644 hw/acpi/viot.c
 create mode 100644 tests/data/acpi/q35/DSDT.viot
 create mode 100644 tests/data/acpi/q35/VIOT.viot

-- 
2.33.0


