Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4796699A4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:13:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKht-0006XT-Sz; Fri, 13 Jan 2023 09:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pGKhU-0006T9-3r; Fri, 13 Jan 2023 09:06:35 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pGKhQ-0002ZJ-1X; Fri, 13 Jan 2023 09:06:31 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 229AD256BA;
 Fri, 13 Jan 2023 14:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673618785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/FEGpcFg9zbN6etlRXuk3dPtqAHUqZy1fKVQrdmJkJg=;
 b=JcTZUSGQNwSWfFnWA5NXTvV2L5M3cAOFkZy/k4WTkyey38xhySGfHv0KSRh+5Gu41Jj6WZ
 Y1/3IbAA7+BMhCQlxfFOAMiQeJHEYC4euuQVTErWvqEM12DJKMZ4bUNcoaIdnlvwu0jLB7
 7mEWwIpXccBz5MUZpsKH2/Qeu+46WAM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673618785;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/FEGpcFg9zbN6etlRXuk3dPtqAHUqZy1fKVQrdmJkJg=;
 b=2yWvJPFo1n/BQA8XOVTIJLA6B4dRk1NSg5BApLFqdO0lfwgEBBTAA87mu3DhNSZVpJKA82
 EyA0GDfsNAWwEUAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80AC61358A;
 Fri, 13 Jan 2023 14:06:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UkuUEl5lwWP8DQAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:06:22 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH v3 00/28] target/arm: Allow CONFIG_TCG=n builds
Date: Fri, 13 Jan 2023 11:03:51 -0300
Message-Id: <20230113140419.4013-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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

This series makes the necessary changes to allow the use of
--disable-tcg for arm.

Based on Richard's "target/arm: Introduce aarch64_set_svcr":
https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org

branch here: https://github.com/farosas/qemu/tree/arm-disable-tcg

Since v2:

patch 5: removed extraneous include statements
patch 6: removed extraneous tcg_enabled
patch 7: dropped in favor of "target/arm: Introduce aarch64_set_svcr"
patch 12: removed inline
patch 13-15: dropped, not needed due to Kconfig changes

new:

- cpregs.h changes I had forgotten to include in v2
- moved CPUs initialization into tcg/
- skipped tests that require TCG
- fixed the migration tests for aarch64
- Kconfig changes, left only the 'virt' machine set by default with KVM

NOTE: current master shows errors in make check when using
--without-default-devices. This series does not touch the implicitly
added devices, only the ones in devices.mak, so this shouldn't affect
it. I'll take a look at the errors on master in the meantime.

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

Fabiano Rosas (22):
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
  target/arm: Move common cpu code into cpu.c
  target/arm: Set cortex-a57 as default cpu for KVM-only build
  tests/qtest: Skip tests that depend on TCG when CONFIG_TCG=n
  tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI
  tests/tcg: Do not build/run TCG tests if TCG is disabled
  tests/avocado: Skip tests that require a missing accelerator
  tests/avocado: Tag TCG tests with accel:tcg
  target/avocado: Pass parameters to migration test on aarch64
  arm/Kconfig: Always select SEMIHOSTING when TCG is present
  arm/Kconfig: Do not build TCG-only boards on a KVM-only build

 MAINTAINERS                                 |    1 +
 configs/devices/aarch64-softmmu/default.mak |    4 -
 configs/devices/arm-softmmu/default.mak     |   38 -
 configure                                   |    4 +
 hw/arm/Kconfig                              |   40 +-
 hw/arm/boot.c                               |    6 +-
 hw/arm/virt.c                               |    6 +
 hw/intc/armv7m_nvic.c                       |   20 +-
 include/exec/cpu-defs.h                     |    6 +
 target/arm/Kconfig                          |    7 +
 target/arm/arm-powerctl.c                   |    7 +-
 target/arm/cpregs.c                         | 9530 +++++++++++++++++++
 target/arm/cpregs.h                         |  104 +
 target/arm/cpu.c                            |   85 +-
 target/arm/cpu.h                            |   91 -
 target/arm/cpu64.c                          |    1 +
 target/arm/helper.c                         | 9457 +-----------------
 target/arm/internals.h                      |   38 +-
 target/arm/machine.c                        |   30 +-
 target/arm/meson.build                      |   49 +-
 target/arm/ptw.c                            |    4 +
 target/arm/tcg-stubs.c                      |   27 +
 target/arm/{ => tcg}/a32-uncond.decode      |    0
 target/arm/{ => tcg}/a32.decode             |    0
 target/arm/{cpu_tcg.c => tcg/cpu32.c}       |  149 +-
 target/arm/{ => tcg}/crypto_helper.c        |    0
 target/arm/{ => tcg}/debug_helper.c         |  367 -
 target/arm/{ => tcg}/helper-a64.c           |    0
 target/arm/tcg/hflags.c                     |  370 +
 target/arm/{ => tcg}/iwmmxt_helper.c        |    0
 target/arm/{ => tcg}/m-nocp.decode          |    0
 target/arm/{ => tcg}/m_helper.c             |    0
 target/arm/tcg/meson.build                  |   52 +
 target/arm/{ => tcg}/mte_helper.c           |    0
 target/arm/{ => tcg}/mve.decode             |    0
 target/arm/{ => tcg}/mve_helper.c           |    0
 target/arm/{ => tcg}/neon-dp.decode         |    0
 target/arm/{ => tcg}/neon-ls.decode         |    0
 target/arm/{ => tcg}/neon-shared.decode     |    0
 target/arm/{ => tcg}/neon_helper.c          |    0
 target/arm/{ => tcg}/op_helper.c            |    0
 target/arm/{ => tcg}/pauth_helper.c         |    0
 target/arm/{ => tcg}/psci.c                 |    0
 target/arm/{ => tcg}/sme-fa64.decode        |    0
 target/arm/{ => tcg}/sme.decode             |    0
 target/arm/{ => tcg}/sme_helper.c           |    0
 target/arm/{ => tcg}/sve.decode             |    0
 target/arm/{ => tcg}/sve_helper.c           |    0
 target/arm/{ => tcg}/t16.decode             |    0
 target/arm/{ => tcg}/t32.decode             |    0
 target/arm/{ => tcg}/tlb_helper.c           |   18 -
 target/arm/{ => tcg}/translate-a64.c        |    0
 target/arm/{ => tcg}/translate-a64.h        |    0
 target/arm/{ => tcg}/translate-m-nocp.c     |    0
 target/arm/{ => tcg}/translate-mve.c        |    0
 target/arm/{ => tcg}/translate-neon.c       |    0
 target/arm/{ => tcg}/translate-sme.c        |    0
 target/arm/{ => tcg}/translate-sve.c        |    0
 target/arm/{ => tcg}/translate-vfp.c        |    0
 target/arm/{ => tcg}/translate.c            |    0
 target/arm/{ => tcg}/translate.h            |    0
 target/arm/{ => tcg}/vec_helper.c           |    0
 target/arm/{ => tcg}/vec_internal.h         |    0
 target/arm/{ => tcg}/vfp-uncond.decode      |    0
 target/arm/{ => tcg}/vfp.decode             |    0
 target/arm/trace-events                     |    2 +-
 tests/Makefile.include                      |   10 +
 tests/avocado/avocado_qemu/__init__.py      |    4 +
 tests/avocado/boot_linux_console.py         |    1 +
 tests/avocado/migration.py                  |   11 +-
 tests/avocado/reverse_debugging.py          |    8 +
 tests/qtest/arm-cpu-features.c              |   27 +-
 tests/qtest/meson.build                     |    4 +-
 73 files changed, 10388 insertions(+), 10190 deletions(-)
 create mode 100644 target/arm/cpregs.c
 create mode 100644 target/arm/tcg-stubs.c
 rename target/arm/{ => tcg}/a32-uncond.decode (100%)
 rename target/arm/{ => tcg}/a32.decode (100%)
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (86%)
 rename target/arm/{ => tcg}/crypto_helper.c (100%)
 rename target/arm/{ => tcg}/debug_helper.c (63%)
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


