Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F256A0A00
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:12:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBNB-0007ho-HJ; Thu, 23 Feb 2023 08:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pVBN6-0007gD-5P; Thu, 23 Feb 2023 08:10:55 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pVBN4-0005Y9-1q; Thu, 23 Feb 2023 08:10:51 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E5A4033817;
 Thu, 23 Feb 2023 13:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677157846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xeb7GmzFOtNxshduRLRkAzP6xNHonX8j65wO62THt44=;
 b=F9PeoNS9+u/yhrX6z36PsqmQln/AJvjrmpb8/qC6HuCoS6gEYM1zco8a2u51jf+/I14n7T
 bM3U7gXyh3S1uld8tNBn8IfVbPNk89hfhA5bJADJYW5KWRS4Dpux/otnPwcQwNGbgJ/3L0
 1AXicjKIOU+PDzo5zV1hbMlSeFE1u2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677157846;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xeb7GmzFOtNxshduRLRkAzP6xNHonX8j65wO62THt44=;
 b=gZZ6JyNYachPLOKe2kexpI19m8ZVo0blBD4+fr6jQm7Cfj0Ch4FC++FUmP40MGa5AiecF3
 BPrgM15UFbpO4HCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1C1A139B5;
 Thu, 23 Feb 2023 13:10:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0SH8LdNl92MLawAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:10:43 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v7 00/20] target/arm: Allow CONFIG_TCG=n builds
Date: Thu, 23 Feb 2023 10:08:21 -0300
Message-Id: <20230223130841.25916-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
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

Changes since v6:

Now using the same feature set for -cpu max for both qtests and
TCG. This requires a slightly awkward code movement to expose
aa32_max_features to non-tcg code, but we gain by not having a
different environment for the tests.

Also applied Richard's suggestion of creating a new cortex-regs.c
file.

CI run: https://gitlab.com/farosas/qemu/-/pipelines/786195517

v6:
https://lore.kernel.org/r/20230217201150.22032-1-farosas@suse.de

v5 resend:
https://lore.kernel.org/r/20230213202927.28992-1-farosas@suse.de

v5:
https://lore.kernel.org/r/20230120184825.31626-1-farosas@suse.de

v4:
https://lore.kernel.org/r/20230119135424.5417-1-farosas@suse.de

v3:
https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de

v2:
https://lore.kernel.org/r/20230109224232.11661-1-farosas@suse.de

v1:
https://lore.kernel.org/r/20230104215835.24692-1-farosas@suse.de

Claudio Fontana (3):
  target/arm: move helpers to tcg/
  target/arm: Move psci.c into the tcg directory
  target/arm: move cpu_tcg to tcg/cpu32.c

Fabiano Rosas (16):
  target/arm: Wrap breakpoint/watchpoint updates with tcg_enabled
  target/arm: Wrap TCG-only code in debug_helper.c
  target/arm: move translate modules to tcg/
  target/arm: Wrap arm_rebuild_hflags calls with tcg_enabled
  target/arm: Move hflags code into the tcg directory
  target/arm: Move regime_using_lpae_format into internal.h
  target/arm: Don't access TCG code when debugging with KVM
  cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
  target/arm: Move cortex sysregs into a separate file
  target/arm: Move 64-bit TCG CPUs into tcg/
  target/arm: Move aa32_max_features out of cpu_tcg.c
  tests/avocado: Pass parameters to migration test
  tests/avocado: add machine:none tag to version.py
  arm/Kconfig: Always select SEMIHOSTING when TCG is present
  arm/Kconfig: Do not build TCG-only boards on a KVM-only build
  tests/qtest: Fix tests when no KVM or TCG are present

Philippe Mathieu-Daudé (1):
  gitlab-ci: Check building KVM-only aarch64 target

 .gitlab-ci.d/crossbuilds.yml                  |  11 +
 .../custom-runners/ubuntu-22.04-aarch64.yml   |   4 -
 MAINTAINERS                                   |   1 +
 configs/devices/aarch64-softmmu/default.mak   |   4 -
 configs/devices/arm-softmmu/default.mak       |  39 --
 hw/arm/Kconfig                                |  43 +-
 hw/arm/boot.c                                 |   6 +-
 hw/arm/virt.c                                 |   6 +-
 hw/intc/armv7m_nvic.c                         |  20 +-
 include/exec/cpu-defs.h                       |   6 +
 target/arm/Kconfig                            |   7 +
 target/arm/arm-powerctl.c                     |   7 +-
 target/arm/cortex-regs.c                      |  69 +++
 target/arm/cpregs.h                           |   6 +
 target/arm/cpu.c                              |  78 ++-
 target/arm/cpu64.c                            | 399 +-------------
 target/arm/debug_helper.c                     | 490 +++++++++---------
 target/arm/helper.c                           | 411 +--------------
 target/arm/internals.h                        |  30 +-
 target/arm/machine.c                          |  12 +-
 target/arm/meson.build                        |  48 +-
 target/arm/ptw.c                              |   4 +
 target/arm/tcg-stubs.c                        |  27 +
 target/arm/{ => tcg}/a32-uncond.decode        |   0
 target/arm/{ => tcg}/a32.decode               |   0
 target/arm/{cpu_tcg.c => tcg/cpu32.c}         | 141 +----
 target/arm/tcg/cpu64.c                        | 438 ++++++++++++++++
 target/arm/{ => tcg}/crypto_helper.c          |   0
 target/arm/{ => tcg}/helper-a64.c             |   0
 target/arm/tcg/hflags.c                       | 403 ++++++++++++++
 target/arm/{ => tcg}/iwmmxt_helper.c          |   0
 target/arm/{ => tcg}/m-nocp.decode            |   0
 target/arm/{ => tcg}/m_helper.c               |   0
 target/arm/tcg/meson.build                    |  52 ++
 target/arm/{ => tcg}/mte_helper.c             |   0
 target/arm/{ => tcg}/mve.decode               |   0
 target/arm/{ => tcg}/mve_helper.c             |   0
 target/arm/{ => tcg}/neon-dp.decode           |   0
 target/arm/{ => tcg}/neon-ls.decode           |   0
 target/arm/{ => tcg}/neon-shared.decode       |   0
 target/arm/{ => tcg}/neon_helper.c            |   0
 target/arm/{ => tcg}/op_helper.c              |   0
 target/arm/{ => tcg}/pauth_helper.c           |   0
 target/arm/{ => tcg}/psci.c                   |   0
 target/arm/{ => tcg}/sme-fa64.decode          |   0
 target/arm/{ => tcg}/sme.decode               |   0
 target/arm/{ => tcg}/sme_helper.c             |   0
 target/arm/{ => tcg}/sve.decode               |   0
 target/arm/{ => tcg}/sve_helper.c             |   0
 target/arm/{ => tcg}/t16.decode               |   0
 target/arm/{ => tcg}/t32.decode               |   0
 target/arm/{ => tcg}/tlb_helper.c             |  18 -
 target/arm/{ => tcg}/translate-a64.c          |   0
 target/arm/{ => tcg}/translate-a64.h          |   0
 target/arm/{ => tcg}/translate-m-nocp.c       |   0
 target/arm/{ => tcg}/translate-mve.c          |   0
 target/arm/{ => tcg}/translate-neon.c         |   0
 target/arm/{ => tcg}/translate-sme.c          |   0
 target/arm/{ => tcg}/translate-sve.c          |   0
 target/arm/{ => tcg}/translate-vfp.c          |   0
 target/arm/{ => tcg}/translate.c              |   0
 target/arm/{ => tcg}/translate.h              |   0
 target/arm/{ => tcg}/vec_helper.c             |   0
 target/arm/{ => tcg}/vec_internal.h           |   0
 target/arm/{ => tcg}/vfp-uncond.decode        |   0
 target/arm/{ => tcg}/vfp.decode               |   0
 tests/avocado/migration.py                    |  83 ++-
 tests/avocado/version.py                      |   1 +
 tests/qtest/arm-cpu-features.c                |  12 +-
 tests/qtest/bios-tables-test.c                |   4 +
 tests/qtest/boot-serial-test.c                |  10 +
 tests/qtest/migration-test.c                  |   5 +
 tests/qtest/pxe-test.c                        |   6 +
 tests/qtest/vmgenid-test.c                    |   6 +
 74 files changed, 1592 insertions(+), 1315 deletions(-)
 create mode 100644 target/arm/cortex-regs.c
 create mode 100644 target/arm/tcg-stubs.c
 rename target/arm/{ => tcg}/a32-uncond.decode (100%)
 rename target/arm/{ => tcg}/a32.decode (100%)
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (87%)
 create mode 100644 target/arm/tcg/cpu64.c
 rename target/arm/{ => tcg}/crypto_helper.c (100%)
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


