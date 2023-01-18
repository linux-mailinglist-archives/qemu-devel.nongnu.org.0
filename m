Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C846728A1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 20:42:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIEGF-00033K-Rw; Wed, 18 Jan 2023 14:38:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIEFj-00029G-D1; Wed, 18 Jan 2023 14:37:43 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIEFU-0007W2-4J; Wed, 18 Jan 2023 14:37:29 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D86543EEAC;
 Wed, 18 Jan 2023 19:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674070643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tOh9TckU1sSiBRvgWZve0VSfKbLt2OgigIgHgjgUZvE=;
 b=nq/+f78szrdAFXTcDToqe9jO+EZZ3O9GFMjBMD6nsKlyMJU+/ciWkXk3WNBt2FfYWUtsZ5
 YD1kEETIpnsXY62Xtv2H86yarJTqBakC0iig1huKaNzYeA+2jkK3fwk+PO3EoZn4kfj0hf
 +ISI4rxDjulWJe4GuzNJ9MHygxbwP3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674070643;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tOh9TckU1sSiBRvgWZve0VSfKbLt2OgigIgHgjgUZvE=;
 b=dXtNMA+skFoHz2bz5J+AOppBjAVfv9ZKYYHk2lez+nIkR8a1f5GXkPY0j0fyZOpUNlwjgM
 TMq3dW7ZBbzig5AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 39656139D2;
 Wed, 18 Jan 2023 19:37:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 89j0AHFKyGOWBwAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 19:37:21 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
Date: Wed, 18 Jan 2023 16:34:58 -0300
Message-Id: <20230118193518.26433-1-farosas@suse.de>
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

These are the already reviewed patches from the first half of my
previous series:
https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de

This unbreaks the --disable-tcg build, but there are issues in runtime
that are still being hashed out in the other series.

For the build _with_ TCG, this should behave the same as master.

Based on Richard's "target/arm: Introduce aarch64_set_svcr":
https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org

Claudio Fontana (5):
  target/arm: rename handle_semihosting to tcg_handle_semihosting
  target/arm: wrap psci call with tcg_enabled
  target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
  target/arm: move helpers to tcg/
  target/arm: Move psci.c into the tcg directory

Fabiano Rosas (15):
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
  tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI
  tests/avocado: Skip tests that require a missing accelerator
  tests/avocado: Tag TCG tests with accel:tcg

 MAINTAINERS                             |    1 +
 hw/arm/boot.c                           |    6 +-
 hw/intc/armv7m_nvic.c                   |   20 +-
 include/exec/cpu-defs.h                 |    6 +
 target/arm/arm-powerctl.c               |    7 +-
 target/arm/cpregs.c                     | 9533 +++++++++++++++++++++++
 target/arm/cpregs.h                     |  104 +
 target/arm/cpu.c                        |    9 +-
 target/arm/cpu.h                        |   91 -
 target/arm/cpu64.c                      |    1 +
 target/arm/cpu_tcg.c                    |   59 -
 target/arm/helper.c                     | 9461 +---------------------
 target/arm/internals.h                  |   38 +-
 target/arm/machine.c                    |   30 +-
 target/arm/meson.build                  |   48 +-
 target/arm/ptw.c                        |    4 +
 target/arm/tcg-stubs.c                  |   27 +
 target/arm/{ => tcg}/a32-uncond.decode  |    0
 target/arm/{ => tcg}/a32.decode         |    0
 target/arm/{ => tcg}/crypto_helper.c    |    0
 target/arm/{ => tcg}/debug_helper.c     |  367 -
 target/arm/{ => tcg}/helper-a64.c       |    0
 target/arm/tcg/hflags.c                 |  370 +
 target/arm/{ => tcg}/iwmmxt_helper.c    |    0
 target/arm/{ => tcg}/m-nocp.decode      |    0
 target/arm/{ => tcg}/m_helper.c         |    0
 target/arm/tcg/meson.build              |   51 +
 target/arm/{ => tcg}/mte_helper.c       |    0
 target/arm/{ => tcg}/mve.decode         |    0
 target/arm/{ => tcg}/mve_helper.c       |    0
 target/arm/{ => tcg}/neon-dp.decode     |    0
 target/arm/{ => tcg}/neon-ls.decode     |    0
 target/arm/{ => tcg}/neon-shared.decode |    0
 target/arm/{ => tcg}/neon_helper.c      |    0
 target/arm/{ => tcg}/op_helper.c        |    0
 target/arm/{ => tcg}/pauth_helper.c     |    0
 target/arm/{ => tcg}/psci.c             |    0
 target/arm/{ => tcg}/sme-fa64.decode    |    0
 target/arm/{ => tcg}/sme.decode         |    0
 target/arm/{ => tcg}/sme_helper.c       |    0
 target/arm/{ => tcg}/sve.decode         |    0
 target/arm/{ => tcg}/sve_helper.c       |    0
 target/arm/{ => tcg}/t16.decode         |    0
 target/arm/{ => tcg}/t32.decode         |    0
 target/arm/{ => tcg}/tlb_helper.c       |   18 -
 target/arm/{ => tcg}/translate-a64.c    |    0
 target/arm/{ => tcg}/translate-a64.h    |    0
 target/arm/{ => tcg}/translate-m-nocp.c |    0
 target/arm/{ => tcg}/translate-mve.c    |    0
 target/arm/{ => tcg}/translate-neon.c   |    0
 target/arm/{ => tcg}/translate-sme.c    |    0
 target/arm/{ => tcg}/translate-sve.c    |    0
 target/arm/{ => tcg}/translate-vfp.c    |    0
 target/arm/{ => tcg}/translate.c        |    0
 target/arm/{ => tcg}/translate.h        |    0
 target/arm/{ => tcg}/vec_helper.c       |    0
 target/arm/{ => tcg}/vec_internal.h     |    0
 target/arm/{ => tcg}/vfp-uncond.decode  |    0
 target/arm/{ => tcg}/vfp.decode         |    0
 target/arm/trace-events                 |    2 +-
 tests/avocado/avocado_qemu/__init__.py  |    4 +
 tests/avocado/boot_linux_console.py     |    1 +
 tests/avocado/reverse_debugging.py      |    8 +
 tests/qtest/meson.build                 |    4 +-
 64 files changed, 10210 insertions(+), 10060 deletions(-)
 create mode 100644 target/arm/cpregs.c
 create mode 100644 target/arm/tcg-stubs.c
 rename target/arm/{ => tcg}/a32-uncond.decode (100%)
 rename target/arm/{ => tcg}/a32.decode (100%)
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


