Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 020C33EA8DC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 18:56:46 +0200 (CEST)
Received: from localhost ([::1]:54184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEE0a-0001zk-VY
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 12:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxm-0007jb-Qo
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:53:50 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:44852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxh-0005zT-Fb
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:53:50 -0400
Received: by mail-qt1-x82f.google.com with SMTP id h10so5739909qtj.11
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 09:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xLc4riw3FaP4r2MMUFC1UfsjaEnoNlJKICJNpIiofFA=;
 b=dw7sH+FVrfvOMIAF/Ic7hefNVQztMGYeKrFaVkBSc6zgMGts/TK1Jv5VS0RTymQBkT
 FWMOvKgb5MTeJRE8jnPJhXSNOa/+6R7TtrrAUR9wZ0nKn+yzQ1D14JYQPP5x/DDQHME4
 GPK4DEhFTDvdk44IH/hIgu5EptukLGVd/jyijHiuo3KOTFgC77sGs4umFKEK5504CGM5
 avFwi8KpC65zcm5B7g6CbyNW/JutxoehPEs4p0gYOUlpOkG+6CuL0JP0/qc9yjmsCMFK
 Fdp/Ouut6hhWAtJcgri1LDBORcAc3M9ecCtsBRLH7xrm+bwALnEfv8kggIYoh9DH7c4J
 h0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xLc4riw3FaP4r2MMUFC1UfsjaEnoNlJKICJNpIiofFA=;
 b=NG6pWOgTEs/F7/141wvaGatX4c/4uqC2+fK8KWFZ29hCqpwvykQ79Zv0i4UR9yh5RL
 AVisCm86+f7qSczL37weIOyTelFLsNbv0tYZx5LylD3d8WW8lEw3tE329TQ9TDzkb1Sj
 0ezTL2HsdeS5FEn1NoDbY1fScnLyzfP6cyWlMrc0lfGaZUxeYYUvcM7iqfe/8HoX5hR+
 1m4kwVOykk9fZD3ndlCaxU0dvVLNd6Vwn3DJBmv2tKy+ufQ/Qbil7GmnKYoU0+jNOd3F
 Q7sXMgufZ+dbwQ5qTT04g5zbukzLJC3ZTy8vTBpSWn58LKmWPxS/N48aFEDSf8oFewyD
 Q+YA==
X-Gm-Message-State: AOAM532SBFMLQ3sO3dnSLkdwzsOscETCxqQj+aca+1YjrognYlJKVIrY
 ufCSgSgG0MhZj8EWZ29uhdWmxA==
X-Google-Smtp-Source: ABdhPJywBOSJ1FV+AuxIqt7OxR4nKw6OQdemeS/ySTvsWkVyYiFyze46mPFda5g/ukeqtkPhzYko5w==
X-Received: by 2002:a05:622a:1106:: with SMTP id
 e6mr4684116qty.172.1628787223760; 
 Thu, 12 Aug 2021 09:53:43 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id c69sm1714864qkg.1.2021.08.12.09.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 09:53:43 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v8 00/10] GICv3 LPI and ITS feature implementation
Date: Thu, 12 Aug 2021 12:53:31 -0400
Message-Id: <20210812165341.40784-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
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

Changes in v8:
 - moved tcg ITS support to virt platform 6.1 options (since it will be
   supported in 6.2)
 - modified the ite entry access offset based on latest test results
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
 hw/intc/arm_gicv3_its.c                | 1301 ++++++++++++++++++++++++
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
 20 files changed, 1821 insertions(+), 28 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c
 create mode 100644 tests/data/acpi/virt/IORT
 create mode 100644 tests/data/acpi/virt/IORT.memhp
 create mode 100644 tests/data/acpi/virt/IORT.numamem
 create mode 100644 tests/data/acpi/virt/IORT.pxb

--
2.27.0

