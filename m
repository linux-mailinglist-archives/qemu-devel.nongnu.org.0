Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A873D6951EE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 21:34:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRfUP-0004Mn-4T; Mon, 13 Feb 2023 15:31:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pRfUC-0004LW-H6; Mon, 13 Feb 2023 15:31:40 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pRfU9-0002Si-LL; Mon, 13 Feb 2023 15:31:39 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 700DD22339;
 Mon, 13 Feb 2023 20:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676320293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kW9k+OtxXx1mFKJQQLA8dwCou+CUOXdtX+p9IXIicp0=;
 b=r5pzYxZvV5VtEbU67124S+9XDqH3IDmngarVTViXxOvMPe3PmCDN74Oylz1qSHCdhyZwi/
 TJJvqC/L7gI5T3DuWu/sldq26/Zm0yGnaXRNLDdTZKapaddIiSfzr0WusPJwcwPYC/cg8v
 gz746geVJwjAxY3ejyMRCvJ+4z8bRbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676320293;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kW9k+OtxXx1mFKJQQLA8dwCou+CUOXdtX+p9IXIicp0=;
 b=JGwRypO/xYOJIX9l7wA8FoPP0FDU16bc43RvaD02UT7uKkKpSWv20Nrf1KSNOPSSnhr3r4
 FdbTydeP8wkOeMAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B7701391B;
 Mon, 13 Feb 2023 20:31:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S5pqCCKe6mOVMwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:31:30 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RESEND v5 00/28] target/arm: Allow CONFIG_TCG=n builds
Date: Mon, 13 Feb 2023 17:28:59 -0300
Message-Id: <20230213202927.28992-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Hi, could someone take this?

I rebased and put the two series together to simplify. I'm keeping it
up-to-date and tested while it doesn't go in.

CI run here: https://gitlab.com/farosas/qemu/-/pipelines/776103500

Based on master.
Supersedes "target/arm: CONFIG_TCG=n part 1".

Thanks!

v5:
https://lore.kernel.org/r/20230120184825.31626-1-farosas@suse.de

This series makes the necessary changes to allow the use of
--disable-tcg for arm.

- Used "max" as the default CPU for KVM-only builds. This allows me to
  drop all the clunky qtest changes and it keeps disabling TCG
  separate from changing cpu defaults.

  I'm neutral towards removing the defaults for arm. We can do that in a
  separate series. It would be nice to make the TCG default equal to the
  non-TCG one. Otherwise we're bound to get reports that "this command
  line used to work" if users switch from: 'CONFIG_TCG=n -accel kvm' to
  'CONFIG_TCG=y -accel kvm' (the latter would try to use the cortex-a15
  as default).

- Move the ifdef around valid_cpus into the patches that move the
  respective cpus. Patches 1 & 2.

v5 was based on "target/arm: CONFIG_TCG=n part 1":
https://lore.kernel.org/r/20230118193518.26433-1-farosas@suse.de

v4:
https://lore.kernel.org/r/20230119135424.5417-1-farosas@suse.de

v3:
https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de

v2:
https://lore.kernel.org/r/20230109224232.11661-1-farosas@suse.de

v1:
https://lore.kernel.org/r/20230104215835.24692-1-farosas@suse.de

Claudio Fontana (6):
  target/arm: rename handle_semihosting to tcg_handle_semihosting
  target/arm: wrap psci call with tcg_enabled
  target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
  target/arm: move helpers to tcg/
  target/arm: Move psci.c into the tcg directory
  target/arm: move cpu_tcg to tcg/cpu32.c

Fabiano Rosas (21):
  target/arm: Move PC alignment check
  target/arm: Move cpregs code out of cpu.h
  target/arm: Move cpregs code into cpregs.c
  target/arm: Move define_debug_regs() to cpregs.c
  target/arm: Wrap breakpoint/watchpoint updates with tcg_enabled
  target/arm: move translate modules to tcg/
  target/arm: Wrap arm_rebuild_hflags calls with tcg_enabled
  target/arm: Move hflags code into the tcg directory
  target/arm: Move regime_using_lpae_format into internal.h
  target/arm: Don't access TCG code when debugging with KVM
  cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
  target/arm: Move cortex sysregs into cpregs.c
  tests/avocado: Skip tests that require a missing accelerator
  tests/avocado: Tag TCG tests with accel:tcg
  target/arm: Move 64-bit TCG CPUs into tcg/
  target/arm: Use "max" as default cpu for the virt machine with KVM
  tests/qtest: arm-cpu-features: Match tests to required accelerators
  tests/qtest: Restrict tpm-tis-devices-{swtpm}-test to CONFIG_TCG
  target/avocado: Pass parameters to migration test on aarch64
  arm/Kconfig: Always select SEMIHOSTING when TCG is present
  arm/Kconfig: Do not build TCG-only boards on a KVM-only build

Philippe Mathieu-Daudé (1):
  gitlab-ci: Check building KVM-only aarch64 target

 .gitlab-ci.d/crossbuilds.yml                  |    11 +
 .../custom-runners/ubuntu-22.04-aarch64.yml   |     4 -
 MAINTAINERS                                   |     1 +
 configs/devices/aarch64-softmmu/default.mak   |     4 -
 configs/devices/arm-softmmu/default.mak       |    39 -
 hw/arm/Kconfig                                |    43 +-
 hw/arm/boot.c                                 |     6 +-
 hw/arm/virt.c                                 |    10 +-
 hw/intc/armv7m_nvic.c                         |    20 +-
 include/exec/cpu-defs.h                       |     6 +
 target/arm/Kconfig                            |     7 +
 target/arm/arm-powerctl.c                     |     7 +-
 target/arm/cpregs.c                           |  9825 +++++++++++++++
 target/arm/cpregs.h                           |   104 +
 target/arm/cpu.c                              |     9 +-
 target/arm/cpu.h                              |    91 -
 target/arm/cpu64.c                            |   634 +-
 target/arm/helper.c                           | 10224 +---------------
 target/arm/internals.h                        |    42 +-
 target/arm/machine.c                          |    30 +-
 target/arm/meson.build                        |    49 +-
 target/arm/ptw.c                              |     4 +
 target/arm/tcg-stubs.c                        |    27 +
 target/arm/{ => tcg}/a32-uncond.decode        |     0
 target/arm/{ => tcg}/a32.decode               |     0
 target/arm/{cpu_tcg.c => tcg/cpu32.c}         |    72 +-
 target/arm/tcg/cpu64.c                        |   655 +
 target/arm/{ => tcg}/crypto_helper.c          |     0
 target/arm/{ => tcg}/debug_helper.c           |   459 -
 target/arm/{ => tcg}/helper-a64.c             |     0
 target/arm/tcg/hflags.c                       |   403 +
 target/arm/{ => tcg}/iwmmxt_helper.c          |     0
 target/arm/{ => tcg}/m-nocp.decode            |     0
 target/arm/{ => tcg}/m_helper.c               |     0
 target/arm/tcg/meson.build                    |    53 +
 target/arm/{ => tcg}/mte_helper.c             |     0
 target/arm/{ => tcg}/mve.decode               |     0
 target/arm/{ => tcg}/mve_helper.c             |     0
 target/arm/{ => tcg}/neon-dp.decode           |     0
 target/arm/{ => tcg}/neon-ls.decode           |     0
 target/arm/{ => tcg}/neon-shared.decode       |     0
 target/arm/{ => tcg}/neon_helper.c            |     0
 target/arm/{ => tcg}/op_helper.c              |     0
 target/arm/{ => tcg}/pauth_helper.c           |     0
 target/arm/{ => tcg}/psci.c                   |     0
 target/arm/{ => tcg}/sme-fa64.decode          |     0
 target/arm/{ => tcg}/sme.decode               |     0
 target/arm/{ => tcg}/sme_helper.c             |     0
 target/arm/{ => tcg}/sve.decode               |     0
 target/arm/{ => tcg}/sve_helper.c             |     0
 target/arm/{ => tcg}/t16.decode               |     0
 target/arm/{ => tcg}/t32.decode               |     0
 target/arm/{ => tcg}/tlb_helper.c             |    18 -
 target/arm/{ => tcg}/translate-a64.c          |     0
 target/arm/{ => tcg}/translate-a64.h          |     0
 target/arm/{ => tcg}/translate-m-nocp.c       |     0
 target/arm/{ => tcg}/translate-mve.c          |     0
 target/arm/{ => tcg}/translate-neon.c         |     0
 target/arm/{ => tcg}/translate-sme.c          |     0
 target/arm/{ => tcg}/translate-sve.c          |     0
 target/arm/{ => tcg}/translate-vfp.c          |     0
 target/arm/{ => tcg}/translate.c              |     0
 target/arm/{ => tcg}/translate.h              |     0
 target/arm/{ => tcg}/vec_helper.c             |     0
 target/arm/{ => tcg}/vec_internal.h           |     0
 target/arm/{ => tcg}/vfp-uncond.decode        |     0
 target/arm/{ => tcg}/vfp.decode               |     0
 target/arm/trace-events                       |     2 +-
 tests/avocado/avocado_qemu/__init__.py        |     4 +
 tests/avocado/boot_linux_console.py           |     1 +
 tests/avocado/migration.py                    |    10 +
 tests/avocado/reverse_debugging.py            |     8 +
 tests/qtest/arm-cpu-features.c                |    34 +-
 tests/qtest/meson.build                       |     4 +-
 74 files changed, 11576 insertions(+), 11344 deletions(-)
 create mode 100644 target/arm/cpregs.c
 create mode 100644 target/arm/tcg-stubs.c
 rename target/arm/{ => tcg}/a32-uncond.decode (100%)
 rename target/arm/{ => tcg}/a32.decode (100%)
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (93%)
 create mode 100644 target/arm/tcg/cpu64.c
 rename target/arm/{ => tcg}/crypto_helper.c (100%)
 rename target/arm/{ => tcg}/debug_helper.c (57%)
 rename target/arm/{ => tcg}/helper-a64.c (100%)
 create mode 100644 target/arm/tcg/hflags.c
 rename target/arm/{ => tcg}/iwmmxt_helper.c (100%)
 rename target/arm/{ => tcg}/m-nocp.decode (100%)
 rename target/arm/{ => tcg}/m_helper.c (100%)
 create mode 100644 target/arm/tcg/meson.build
 rename target/arm/{ => tcg}/mte_helper.c (100%)
 rename target/arm/{ => tcg}/mve.decode (100%)
 rename target/arm/{ => tcg}/mve_helper.c (100%)
 rename target/arm/{ => tcg}/neon-dp.decode (100%)
 rename target/arm/{ => tcg}/neon-ls.decode (100%)
 rename target/arm/{ => tcg}/neon-shared.decode (100%)
 rename target/arm/{ => tcg}/neon_helper.c (100%)
 rename target/arm/{ => tcg}/op_helper.c (100%)
 rename target/arm/{ => tcg}/pauth_helper.c (100%)
 rename target/arm/{ => tcg}/psci.c (100%)
 rename target/arm/{ => tcg}/sme-fa64.decode (100%)
 rename target/arm/{ => tcg}/sme.decode (100%)
 rename target/arm/{ => tcg}/sme_helper.c (100%)
 rename target/arm/{ => tcg}/sve.decode (100%)
 rename target/arm/{ => tcg}/sve_helper.c (100%)
 rename target/arm/{ => tcg}/t16.decode (100%)
 rename target/arm/{ => tcg}/t32.decode (100%)
 rename target/arm/{ => tcg}/tlb_helper.c (94%)
 rename target/arm/{ => tcg}/translate-a64.c (100%)
 rename target/arm/{ => tcg}/translate-a64.h (100%)
 rename target/arm/{ => tcg}/translate-m-nocp.c (100%)
 rename target/arm/{ => tcg}/translate-mve.c (100%)
 rename target/arm/{ => tcg}/translate-neon.c (100%)
 rename target/arm/{ => tcg}/translate-sme.c (100%)
 rename target/arm/{ => tcg}/translate-sve.c (100%)
 rename target/arm/{ => tcg}/translate-vfp.c (100%)
 rename target/arm/{ => tcg}/translate.c (100%)
 rename target/arm/{ => tcg}/translate.h (100%)
 rename target/arm/{ => tcg}/vec_helper.c (100%)
 rename target/arm/{ => tcg}/vec_internal.h (100%)
 rename target/arm/{ => tcg}/vfp-uncond.decode (100%)
 rename target/arm/{ => tcg}/vfp.decode (100%)

-- 
2.35.3


