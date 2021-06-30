Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B28A3B864E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:35:33 +0200 (CEST)
Received: from localhost ([::1]:57154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycFQ-0008Ip-JW
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycC4-0004a5-Ve
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:32:05 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:36771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lycC0-00053N-Eo
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:32:04 -0400
Received: by mail-qk1-x72a.google.com with SMTP id c3so1850141qkc.3
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 08:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kcy789aSxwjclOV8kUQBAZPZACnR40SMcFrF7/2UWvs=;
 b=eHLgfCiwXK8AArhfUuDZMN2KCM7uwFjGTtIBvvY1dxtj2l1bv4PiskRPPWLx63aeJv
 xIIqsBaMxH8OzQ2ClY+ea0va+dhvPkUO/78I1SH7gJSkbdrUunYGljfL4MoVCRWLQgD3
 dy11yWfe/5BqdX794CG87C6fCaLuTy69/buQfj6r3jCEXTzMUcexzpMq+8dRR/gn4pDT
 YBwJZ2yZKbQy8O+P3XgUaGs2CdG+txXMAMmP/ArF06YaNDJYvDGTOTbZvi2bwanHJkMV
 3evgvSCrNRsGHcvo9De3b4ZQ7DJM30xPwnKDzVFu8fQxRi3Y2vxKVQYTgGrA0WhjiDWc
 QCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kcy789aSxwjclOV8kUQBAZPZACnR40SMcFrF7/2UWvs=;
 b=ZgIkaSlmLMPp0GsssC3S8SFn2MbQfdGZKG3B71geoP0JbROu7fnD2QtJkjLrXzRgR0
 dSs2j9QRrSVaqokt2UZPOaGykagFEjqTZ6zpvJ2ioQfSDTi2FRX/rHU3TzNLeszFe/go
 OX5wRO3G9u3VMr6Ms9xs20R2rVNFPet9roBPTzw3QLbI2hrGQFdM5I509PeoD6mp5ouh
 RTLfJOSxCzIJvCsitIwuRgioEYErlwVE05iPW0f5Ydnpy6UgLoQgkwL7y6UAPkYH5H2D
 uzaD+AwMvuUMObAO/1bK6udl1mBQKWst5+RRfvTT9z/RnUMtp9gVhktWbWH0Lz5Sd5mZ
 bK8A==
X-Gm-Message-State: AOAM5313U/O55aTQQ1FBM6YLO6c0K9CxEwvRM08yk/DlRUwRh6fTWCkx
 qr/Xgg1z7JmppkFX8nDH+Bo7fQ==
X-Google-Smtp-Source: ABdhPJyrRmTIl1U3Yl/nEXFDn9etfVR0hKUnHCKz+0baOmKpoPzUD3VC5UW6x5eM/LqcYkn6ugRSaA==
X-Received: by 2002:a37:2f44:: with SMTP id v65mr36579760qkh.315.1625067118716; 
 Wed, 30 Jun 2021 08:31:58 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id 4sm836131qkm.100.2021.06.30.08.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 08:31:58 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v5 00/10] GICv3 LPI and ITS feature implementation
Date: Wed, 30 Jun 2021 11:31:46 -0400
Message-Id: <20210630153156.9421-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72a.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset implements qemu device model for enabling physical
LPI support and ITS functionality in GIC as per GICv3 specification.
Both flat table and 2 level tables are implemented.The ITS commands
for adding/deleting ITS table entries,trigerring LPI interrupts are
implemented.Translated LPI interrupt ids are processed by redistributor
to determine priority and set pending state appropriately before
forwarding the same to cpu interface.
The ITS feature support has been added to sbsa-ref platform as well as
virt platform,wherein the emulated functionality co-exists with kvm
kernel functionality.

Changes in v5:
 - v4 review comments addressed
 - All kvm_unit_tests PASS

Shashi Mallela (10):
  hw/intc: GICv3 ITS initial framework
  hw/intc: GICv3 ITS register definitions added
  hw/intc: GICv3 ITS command queue framework
  hw/intc: GICv3 ITS Command processing
  hw/intc: GICv3 ITS Feature enablement
  hw/intc: GICv3 redistributor ITS processing
  hw/arm/sbsa-ref: add ITS support in SBSA GIC
  tests/data/acpi/virt: Add IORT files for ITS
  hw/arm/virt: add ITS support in virt GIC
  tests/data/acpi/virt: Update IORT files for ITS

 hw/arm/sbsa-ref.c                      |   26 +-
 hw/arm/virt.c                          |   28 +-
 hw/intc/arm_gicv3.c                    |   14 +
 hw/intc/arm_gicv3_common.c             |   13 +
 hw/intc/arm_gicv3_cpuif.c              |    7 +-
 hw/intc/arm_gicv3_dist.c               |    5 +-
 hw/intc/arm_gicv3_its.c                | 1296 ++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |    7 +-
 hw/intc/arm_gicv3_its_kvm.c            |    2 +-
 hw/intc/arm_gicv3_redist.c             |  154 ++-
 hw/intc/gicv3_internal.h               |  187 +++-
 hw/intc/meson.build                    |    1 +
 include/hw/arm/virt.h                  |    2 +
 include/hw/intc/arm_gicv3_common.h     |   13 +
 include/hw/intc/arm_gicv3_its_common.h |   32 +-
 target/arm/kvm_arm.h                   |    4 +-
 tests/data/acpi/virt/IORT              |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.memhp        |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.numamem      |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.pxb          |  Bin 0 -> 124 bytes
 20 files changed, 1764 insertions(+), 27 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c
 create mode 100644 tests/data/acpi/virt/IORT
 create mode 100644 tests/data/acpi/virt/IORT.memhp
 create mode 100644 tests/data/acpi/virt/IORT.numamem
 create mode 100644 tests/data/acpi/virt/IORT.pxb

-- 
2.27.0


