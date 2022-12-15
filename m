Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C881E64DBF1
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:09:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ngp-0006cS-PC; Thu, 15 Dec 2022 07:50:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngm-0006bQ-Hf
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:16 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngk-00045b-HI
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:16 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so1734953wmb.5
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=el+PUdEeLSMrsbsCt9/CgSu6VD963uIOlDkNZxhmbRw=;
 b=HWud8DFLmkrNiBjmqEbZqgJH2JsZPm+L9RmNZWEIxCQ850RAvcAjaUDQdibDFizzH/
 3B84Y09Ydsd70Ir34P7BVwnTkqNzs1yFduMmzJgOXhUTIOX0JcvqyiTIabbyVefBLWmr
 B/TRYf5cRLb6pIPtt4E+cpb4RTpDRwIIt2XpelgxNW+mo3m5lqQ6UGaXhSgV2B4g/Tbq
 FAHgCLy+jiwGaTfFzor1imrn636D58oZ8v+9tYPdRFucyVdvwcqq0ublLvxgOEHkFi8L
 02W60d2wZMCrRbVZ7D2jC13NU84U02iYRrg9VokY1J6gpNMLJkeqz+XUCyyAcr+2cdfL
 X1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=el+PUdEeLSMrsbsCt9/CgSu6VD963uIOlDkNZxhmbRw=;
 b=KenjmJuYroIdtTEL0G6+CY32YqD16Lcbb0RsRIkN/k5U0z1XToPVueQZhbh1JfmzE6
 C3qihpQUFCcLviw6L27GCeBPvjFyVjYJQJcNmUtNHJpbJRW6kwQ5W9GP6Le9hZONWN/8
 QNKQ7jScNPU/sYyrApbUvEMPkbJX7ybzkoOFd1nd/WtQFtHAHKen97VczR3cUk/QvR7P
 rEPn7YLRV7t6o80a7t54a+n1BPSIC8ABMd/QzxYxK9z3yVObHrj9CagB9VGXfrTDE5lG
 sS6xZzbg/yaTMGtF+Ia3NIilXd2X+4gy6g1GxZBN7m1ez4PrvjrSzP7tfiKK+5nKBzXR
 xgrQ==
X-Gm-Message-State: ANoB5pnqS4rtLXunBn4skDaNHlfZ4uAenSnYB3tY1k2CKipGBEV+MR7G
 rcuZtW8q8xFNwE/NEh6lM/qXaMV4qwlMUCG4
X-Google-Smtp-Source: AA0mqf7iwG1bTFpjazCY4vt3d9r8MjePInDJUzjewwkTrQl+OX+kwsc3pvYC1y7FVfRpQ30EsNeKTg==
X-Received: by 2002:a05:600c:3799:b0:3d1:f74d:4f60 with SMTP id
 o25-20020a05600c379900b003d1f74d4f60mr21645640wmr.22.1671108612484; 
 Thu, 15 Dec 2022 04:50:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/29] target-arm queue
Date: Thu, 15 Dec 2022 12:49:40 +0000
Message-Id: <20221215125009.980128-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

First arm pullreq of the 8.0 series...

The following changes since commit ae2b87341b5ddb0dcb1b3f2d4f586ef18de75873:

  Merge tag 'pull-qapi-2022-12-14-v2' of https://repo.or.cz/qemu/armbru into staging (2022-12-14 22:42:14 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20221215

for you to fetch changes up to 4f3ebdc33618e7c163f769047859d6f34373e3af:

  target/arm: Restrict arm_cpu_exec_interrupt() to TCG accelerator (2022-12-15 11:18:20 +0000)

----------------------------------------------------------------
target-arm queue:
 * hw/arm/virt: Add properties to allow more granular
   configuration of use of highmem space
 * target/arm: Add Cortex-A55 CPU
 * hw/intc/arm_gicv3: Fix GICD_TYPER ITLinesNumber advertisement
 * Implement FEAT_EVT
 * Some 3-phase-reset conversions for Arm GIC, SMMU
 * hw/arm/boot: set initrd with #address-cells type in fdt
 * align user-mode exposed ID registers with Linux
 * hw/misc: Move some arm-related files from specific_ss into softmmu_ss
 * Restrict arm_cpu_exec_interrupt() to TCG accelerator

----------------------------------------------------------------
Gavin Shan (7):
      hw/arm/virt: Introduce virt_set_high_memmap() helper
      hw/arm/virt: Rename variable size to region_size in virt_set_high_memmap()
      hw/arm/virt: Introduce variable region_base in virt_set_high_memmap()
      hw/arm/virt: Introduce virt_get_high_memmap_enabled() helper
      hw/arm/virt: Improve high memory region address assignment
      hw/arm/virt: Add 'compact-highmem' property
      hw/arm/virt: Add properties to disable high memory regions

Luke Starrett (1):
      hw/intc/arm_gicv3: Fix GICD_TYPER ITLinesNumber advertisement

Mihai Carabas (1):
      hw/arm/virt: build SMBIOS 19 table

Peter Maydell (15):
      target/arm: Allow relevant HCR bits to be written for FEAT_EVT
      target/arm: Implement HCR_EL2.TTLBIS traps
      target/arm: Implement HCR_EL2.TTLBOS traps
      target/arm: Implement HCR_EL2.TICAB,TOCU traps
      target/arm: Implement HCR_EL2.TID4 traps
      target/arm: Report FEAT_EVT for TCG '-cpu max'
      hw/arm: Convert TYPE_ARM_SMMU to 3-phase reset
      hw/arm: Convert TYPE_ARM_SMMUV3 to 3-phase reset
      hw/intc: Convert TYPE_ARM_GIC_COMMON to 3-phase reset
      hw/intc: Convert TYPE_ARM_GIC_KVM to 3-phase reset
      hw/intc: Convert TYPE_ARM_GICV3_COMMON to 3-phase reset
      hw/intc: Convert TYPE_KVM_ARM_GICV3 to 3-phase reset
      hw/intc: Convert TYPE_ARM_GICV3_ITS_COMMON to 3-phase reset
      hw/intc: Convert TYPE_ARM_GICV3_ITS to 3-phase reset
      hw/intc: Convert TYPE_KVM_ARM_ITS to 3-phase reset

Philippe Mathieu-Daudé (1):
      target/arm: Restrict arm_cpu_exec_interrupt() to TCG accelerator

Schspa Shi (1):
      hw/arm/boot: set initrd with #address-cells type in fdt

Thomas Huth (1):
      hw/misc: Move some arm-related files from specific_ss into softmmu_ss

Timofey Kutergin (1):
      target/arm: Add Cortex-A55 CPU

Zhuojia Shen (1):
      target/arm: align exposed ID registers with Linux

 docs/system/arm/emulation.rst          |   1 +
 docs/system/arm/virt.rst               |  18 +++
 include/hw/arm/smmuv3.h                |   2 +-
 include/hw/arm/virt.h                  |   2 +
 include/hw/misc/xlnx-zynqmp-apu-ctrl.h |   2 +-
 target/arm/cpu.h                       |  30 +++++
 target/arm/kvm-consts.h                |   8 +-
 hw/arm/boot.c                          |  10 +-
 hw/arm/smmu-common.c                   |   7 +-
 hw/arm/smmuv3.c                        |  12 +-
 hw/arm/virt.c                          | 202 +++++++++++++++++++++++-----
 hw/intc/arm_gic_common.c               |   7 +-
 hw/intc/arm_gic_kvm.c                  |  14 +-
 hw/intc/arm_gicv3_common.c             |   7 +-
 hw/intc/arm_gicv3_dist.c               |   4 +-
 hw/intc/arm_gicv3_its.c                |  14 +-
 hw/intc/arm_gicv3_its_common.c         |   7 +-
 hw/intc/arm_gicv3_its_kvm.c            |  14 +-
 hw/intc/arm_gicv3_kvm.c                |  14 +-
 hw/misc/imx6_src.c                     |   2 +-
 hw/misc/iotkit-sysctl.c                |   1 -
 target/arm/cpu.c                       |   5 +-
 target/arm/cpu64.c                     |  70 ++++++++++
 target/arm/cpu_tcg.c                   |   1 +
 target/arm/helper.c                    | 231 ++++++++++++++++++++++++---------
 hw/misc/meson.build                    |  11 +-
 26 files changed, 538 insertions(+), 158 deletions(-)

