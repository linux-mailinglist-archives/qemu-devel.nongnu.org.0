Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF86A60D1F8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:51:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMyD-00056L-MC; Tue, 25 Oct 2022 12:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyB-00053l-AN
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:03 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMy6-0001ON-Pc
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:02 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 l14-20020a05600c1d0e00b003c6ecc94285so936682wms.1
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=NPQeblfbfT0JwR9ZB6zux8xwSTn4cJ58m2oYGpLENng=;
 b=THX+7OYeNcR9cctFjmX+aKk9cxg0483d9bDe0tDUSw6nsVfK0HD38CI+M+6sKDi88N
 DBBHcCTX0Mi3C436tRCyAyYOOPBQQ3yPCNJio7tQjgXE7manAygyXwNY3BdJEzk7YsOE
 Yy2a2Y+yMaQRAgbrzT9OZNAiTGM/Zo5VR2KXzcv02ZuuVk5MVIaO5XoN3HRTZRKNSiyM
 +ApdcreUz70TpQpNFsZGo4qr7iAyafwVMZgkznGHJjshOo4JsjVKqUYIbiyfJF7xwoCQ
 rDcBcJONLehR3QxLusLzpGnTTZm8N93oqAKN+9jxyw3q9BZDZhVShEkH9X1CHxTdZzFU
 igaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NPQeblfbfT0JwR9ZB6zux8xwSTn4cJ58m2oYGpLENng=;
 b=bDR4G3iBIpBFPU+nl/AVjWfDBftG6k2HkgwpBiHsOyeEfC6yMrUCofYfI7fmPZl8y+
 6JrHovNvHx83l7ENQx6Y9YiiE5LOFEYWREU5Pvv9vSX/KTt2l1fjLD5xpbfJ8DEhpz1Q
 TB9bzl1H6b7keLVCHLNukLYnR6Y5uy6M+O+E8N2hMb4iIaX6j4KfIzJLD1QrC80vuTEL
 shoxvZzQjW/8/54hvLrofsvyOGKe2Frwl03FKFZUbi9qON699SjmmuocFHqrWYatxYoI
 gW9Q5ABOMkLwazDS9WDr8wTGUBuTxWonX19jg1Ui5CuFnzfTsxOGmqtrqBLkpBCFn/jX
 qGkA==
X-Gm-Message-State: ACrzQf38fW9yx69uXxFKvFpCK7Pl3LiRYtzKwrFI9s1Rt/vr3ksXgZco
 hBFTOXI6zp4d4pwZEEiI3Sbs3p7z6oyYvA==
X-Google-Smtp-Source: AMsMyM6HH+a45PqpEtNlzA5gslubqNPN+tjppU8Wi4lxU3Az0V+90sPK378LlnegXJb7o/64CYU1yA==
X-Received: by 2002:a05:600c:3b97:b0:3cc:c287:46fe with SMTP id
 n23-20020a05600c3b9700b003ccc28746femr10860450wms.148.1666715994821; 
 Tue, 25 Oct 2022 09:39:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.39.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:39:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/30] target-arm queue
Date: Tue, 25 Oct 2022 17:39:22 +0100
Message-Id: <20221025163952.4131046-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi; this is the latest target-arm queue. Most of the patches
here are RTH's FEAT_HAFDBS finally landing. I've also included
the RNG-seed randomization patches from Jason, as well as a few
more minor things. The patches include a couple of regression
fixes:
 * the resettable patch fixes a SCSI reset regression
 * the 'do not re-randomize on snapshot load' patches fix
   record-and-replay regressions

thanks
-- PMM

The following changes since commit e750a7ace492f0b450653d4ad368a77d6f660fb8:

  Merge tag 'pull-9p-20221024' of https://github.com/cschoenebeck/qemu into staging (2022-10-24 14:27:12 -0400)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20221025

for you to fetch changes up to e2114f701c78f76246e4b1872639dad94a6bdd21:

  rx: re-randomize rng-seed on reboot (2022-10-25 17:32:24 +0100)

----------------------------------------------------------------
target-arm queue:
 * Implement FEAT_E0PD
 * Implement FEAT_HAFDBS
 * honor HCR_E2H and HCR_TGE in arm_excp_unmasked()
 * hw/arm/virt: Fix devicetree warnings about the virtio-iommu node
 * hw/core/resettable: fix reset level counting
 * hw/hyperv/hyperv.c: Use device_cold_reset() instead of device_legacy_reset()
 * imx: reload cmp timer outside of the reload ptimer transaction
 * x86: do not re-randomize RNG seed on snapshot load
 * m68k/virt: do not re-randomize RNG seed on snapshot load
 * m68k/q800: do not re-randomize RNG seed on snapshot load
 * arm: re-randomize rng-seed on reboot
 * riscv: re-randomize rng-seed on reboot
 * mips/boston: re-randomize rng-seed on reboot
 * openrisc: re-randomize rng-seed on reboot
 * rx: re-randomize rng-seed on reboot

----------------------------------------------------------------
Ake Koomsin (1):
      target/arm: honor HCR_E2H and HCR_TGE in arm_excp_unmasked()

Axel Heider (1):
      target/imx: reload cmp timer outside of the reload ptimer transaction

Damien Hedde (1):
      hw/core/resettable: fix reset level counting

Jason A. Donenfeld (10):
      reset: allow registering handlers that aren't called by snapshot loading
      device-tree: add re-randomization helper function
      x86: do not re-randomize RNG seed on snapshot load
      arm: re-randomize rng-seed on reboot
      riscv: re-randomize rng-seed on reboot
      m68k/virt: do not re-randomize RNG seed on snapshot load
      m68k/q800: do not re-randomize RNG seed on snapshot load
      mips/boston: re-randomize rng-seed on reboot
      openrisc: re-randomize rng-seed on reboot
      rx: re-randomize rng-seed on reboot

Jean-Philippe Brucker (1):
      hw/arm/virt: Fix devicetree warnings about the virtio-iommu node

Peter Maydell (2):
      target/arm: Implement FEAT_E0PD
      hw/hyperv/hyperv.c: Use device_cold_reset() instead of device_legacy_reset()

Richard Henderson (14):
      target/arm: Introduce regime_is_stage2
      target/arm: Add ptw_idx to S1Translate
      target/arm: Add isar predicates for FEAT_HAFDBS
      target/arm: Extract HA and HD in aa64_va_parameters
      target/arm: Move S1_ptw_translate outside arm_ld[lq]_ptw
      target/arm: Add ARMFault_UnsuppAtomicUpdate
      target/arm: Remove loop from get_phys_addr_lpae
      target/arm: Fix fault reporting in get_phys_addr_lpae
      target/arm: Don't shift attrs in get_phys_addr_lpae
      target/arm: Consider GP an attribute in get_phys_addr_lpae
      target/arm: Tidy merging of attributes from descriptor and table
      target/arm: Implement FEAT_HAFDBS, access flag portion
      target/arm: Implement FEAT_HAFDBS, dirty bit portion
      target/arm: Use the max page size in a 2-stage ptw

 docs/devel/reset.rst          |   8 +-
 docs/system/arm/emulation.rst |   2 +
 qapi/run-state.json           |   6 +-
 include/hw/boards.h           |   2 +-
 include/sysemu/device_tree.h  |   9 +
 include/sysemu/reset.h        |   5 +-
 target/arm/cpu.h              |  15 ++
 target/arm/internals.h        |  30 +++
 hw/arm/aspeed.c               |   4 +-
 hw/arm/boot.c                 |   2 +
 hw/arm/mps2-tz.c              |   4 +-
 hw/arm/virt.c                 |   5 +-
 hw/core/reset.c               |  17 +-
 hw/core/resettable.c          |   3 +-
 hw/hppa/machine.c             |   4 +-
 hw/hyperv/hyperv.c            |   2 +-
 hw/i386/microvm.c             |   4 +-
 hw/i386/pc.c                  |   6 +-
 hw/i386/x86.c                 |   2 +-
 hw/m68k/q800.c                |  33 ++-
 hw/m68k/virt.c                |  20 +-
 hw/mips/boston.c              |   3 +
 hw/openrisc/boot.c            |   3 +
 hw/ppc/pegasos2.c             |   4 +-
 hw/ppc/pnv.c                  |   4 +-
 hw/ppc/spapr.c                |   4 +-
 hw/riscv/boot.c               |   3 +
 hw/rx/rx-gdbsim.c             |   3 +
 hw/s390x/s390-virtio-ccw.c    |   4 +-
 hw/timer/imx_epit.c           |   9 +-
 migration/savevm.c            |   2 +-
 softmmu/device_tree.c         |  21 ++
 softmmu/runstate.c            |  11 +-
 target/arm/cpu.c              |  24 +-
 target/arm/cpu64.c            |   2 +
 target/arm/helper.c           |  31 ++-
 target/arm/ptw.c              | 524 +++++++++++++++++++++++++++---------------
 37 files changed, 572 insertions(+), 263 deletions(-)

