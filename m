Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168E23E1EBE
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 00:32:13 +0200 (CEST)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBluO-0001uQ-16
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 18:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mBlsM-0007gK-51
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:30:06 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:43733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mBlsK-0005qI-G4
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 18:30:05 -0400
Received: by mail-qk1-x731.google.com with SMTP id f12so6798908qkh.10
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 15:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tTgbBm4KYGMmUC6CaEAnzc2MAY8fHUQJmsMQCASd5Nk=;
 b=Ha4WWEC5L9gIk4CBjPBHdxywZfF2kG+xE6Z6XJMm9SN/eBuUJpebgv9oWfCVjyfLPc
 4rUHfCg9I0za4yMirGSrl2kjxh9sBzK7664gFuxPhHlivXgr/KAPM181r7yQdhx1kd/P
 rgXIvvPW/DZTipbYfxTJ25/g0Rh+xW/Uaau/oHkeb/nI1orHSQXy7fLXg81PKDeBAbYK
 0YsQbkPcwhlkSK0SGRey109Hhl6jaL29VWn2y4IabBnkNsRwaMHMF9KK/+GFgQnkwZw+
 lQYGKT1EAa3+tFWKjpGDvFax3kOSpYWcaoAu9oGdkDBRUIf6LXEqCy7Xva9k6RuvEEFe
 ZBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tTgbBm4KYGMmUC6CaEAnzc2MAY8fHUQJmsMQCASd5Nk=;
 b=X5Q+5uvcW//WhS1+QzhDoY7iJNTakwU8kMJ9konhnBDIcvRcWT/ZHXD2qFtPp4Vpss
 iNU++OPQn1x/w3LuZutpjMa3sEOZup8MFlq2NJB0P9on5B+27sInEIg8QN8agfpXt3Ep
 MqYlztP51ttqF0/FLvhbu6ywNywCci+9vwos24v9ARQcrcufq+MeuA/C+juserqdIlzz
 NE+Tl9MIXZ9O7VDZ3exvKoJyJuCoxLi11qKQ7kgJtwNwqpWVARJy6B2M+p5M1huhublS
 NGP1IXnWF66VpQQOxEDvV3SR9rVKkr7RuZdQh/MCTEoIfk7GdGI0EyMAeoQp9EEAuBNs
 fUTA==
X-Gm-Message-State: AOAM533qn/gL8Ren+vNzqGMyTDurHdASfd/mskKqgw980ZuWHazrkLI9
 iDnX7nkm6UBIxMoN686525dCbQ==
X-Google-Smtp-Source: ABdhPJxhUFA1LTkAPKXruGN45q7TwQ3TF5eXWuHll7/n3DbQ4iuGhBEcETEv6tB+U1Vj1RNstHSxvg==
X-Received: by 2002:a05:620a:639:: with SMTP id
 25mr7140363qkv.179.1628202603301; 
 Thu, 05 Aug 2021 15:30:03 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id d28sm3655195qkj.25.2021.08.05.15.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 15:30:02 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v7 00/10] GICv3 LPI and ITS feature implementation
Date: Thu,  5 Aug 2021 18:29:52 -0400
Message-Id: <20210805223002.144855-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x731.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
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

Changes in v7:
 - Restructured the lpi pending table scan logic as per comments in v6
 - Addressed minor comments from v6
 - For sbsa-ref platform,ITS memory map has been inserted between
   distributor & redistributors region similar to GIC-600 layout.
   Also, introduced sbsa-ref versioning to reflect the latest its memory
   map change and subsequent future use for helper functions
 - All kvm_unit_tests PASS
 - Verified Linux Boot functionality

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

 hw/arm/sbsa-ref.c                      |   79 +-
 hw/arm/virt.c                          |   28 +-
 hw/intc/arm_gicv3.c                    |   14 +
 hw/intc/arm_gicv3_common.c             |   13 +
 hw/intc/arm_gicv3_cpuif.c              |    7 +-
 hw/intc/arm_gicv3_dist.c               |    5 +-
 hw/intc/arm_gicv3_its.c                | 1298 ++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |    7 +-
 hw/intc/arm_gicv3_its_kvm.c            |    2 +-
 hw/intc/arm_gicv3_redist.c             |  153 ++-
 hw/intc/gicv3_internal.h               |  188 +++-
 hw/intc/meson.build                    |    1 +
 include/hw/arm/virt.h                  |    2 +
 include/hw/intc/arm_gicv3_common.h     |   13 +
 include/hw/intc/arm_gicv3_its_common.h |   32 +-
 target/arm/kvm_arm.h                   |    4 +-
 tests/data/acpi/virt/IORT              |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.memhp        |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.numamem      |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.pxb          |  Bin 0 -> 124 bytes
 20 files changed, 1818 insertions(+), 28 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c
 create mode 100644 tests/data/acpi/virt/IORT
 create mode 100644 tests/data/acpi/virt/IORT.memhp
 create mode 100644 tests/data/acpi/virt/IORT.numamem
 create mode 100644 tests/data/acpi/virt/IORT.pxb

--
2.27.0

