Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B9C663464
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:53:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF0qr-00040B-3p; Mon, 09 Jan 2023 17:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pF0qo-0003zI-Ep; Mon, 09 Jan 2023 17:42:42 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pF0ql-0003xh-RA; Mon, 09 Jan 2023 17:42:41 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 70A004039E;
 Mon,  9 Jan 2023 22:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673304157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gPW3fUh1fTTq/XahL+/GKvt1SmQ17OPD2vrM43xOoGI=;
 b=FIplD4fy0T6LK4CYHPiTsm7+g6FXETzsqgNAQWfam6DrYypZUBSAJBj0SsDBpqgppe12VF
 DbxR61Ut4QWRQDCyYgQiohvjyYBBPsVzhm/e9YDnX1RojdW/0Y0KYqB0YPne4v+T+qFdVb
 6tFtRxZjtjXPB0IfiETCq1qK5Rt4D0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673304157;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gPW3fUh1fTTq/XahL+/GKvt1SmQ17OPD2vrM43xOoGI=;
 b=UgIc0CR75+Eg3bMWITEtekhDwlZBTAwe82GHW+rZmNes+nwpiikex/nOV1O05OQfYY8v6a
 /C18DyLiQ8Ln5VCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BFFB313583;
 Mon,  9 Jan 2023 22:42:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id x/jvIVqYvGMdIQAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:42:34 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH v2 00/19] target/arm: Allow CONFIG_TCG=n builds
Date: Mon,  9 Jan 2023 19:42:13 -0300
Message-Id: <20230109224232.11661-1-farosas@suse.de>
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

This series makes the necessary changes to allow the use of
--disable-tcg for arm.

For the v2 I have taken a more strict approach to avoid introducing
changes in behavior, specially regarding the cpregs hash table.

changes:

patch 5:
  Move all cpregs related code from helper.c into cpregs.c;

patches 6 & 7:
  These are ARMCPRegInfo and accessors that are currently in helper
  files. I moved them into cpregs.c, otherwise we can't move the
  helpers into tcg/

patch 11:
  Richard suggested we handle the tcg_enable check in a header, but I
  noticed that are many more instances of arm_rebuild_hflags being
  called from code that is tcg-only, so I'm not sure if we want to
  have the added overhead in all calls. I have extracted all of the
  new tcg_enable() calls so we can judge if it's worth it.

dropped the previous patch 11:
  [RFC PATCH 11/27] target/arm: only perform TCG cpu and machine inits if TCG enabled

  This patch had a mistake when we moved
  register_cp_regs_for_features() under tcg_enabled(). That caused the
  cp_regs hash table to be empty and no registers being written in
  write_cpustate_to_list().

v1:
https://lore.kernel.org/r/20230104215835.24692-1-farosas@suse.de

I have included the other two already reviewed series to facilitate
the merge. Patch 12 is the first from this series proper.

I could use some help with the last two patches which deal with the
fact that ptw.c needs CPUTLBEntryFull and probe_access_full which are
_currently_ only compiled with CONFIG_TCG=y.

The 3 cpregs patches were split from the larger commit[1] from the
original series. We're still left with one huge patch, but it is only
code movement, it can be checked with:

diff -u <(sed -n 's/^-//p' patch) <(sed -n 's/^\+//p' patch)

1- [RFC v14 14/80] target/arm: split cpregs from tcg/helper.c
   https://lore.kernel.org/r/20210416162824.25131-15-cfontana@suse.de

Claudio Fontana (8):
  target/arm: rename handle_semihosting to tcg_handle_semihosting
  target/arm: wrap psci call with tcg_enabled
  target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
  target/arm: move helpers to tcg/
  target/arm: Move psci.c into the tcg directory
  tests: do not run test-hmp on all machines for ARM KVM-only
  tests: do not run qom-test on all machines for ARM KVM-only
  tests: device-introspect-test: cope with ARM TCG-only devices

Fabiano Rosas (11):
  target/arm: Move PC alignment check
  target/arm: Move cpregs code into cpregs.c
  target/arm: Move define_debug_regs() to cpregs.c
  target/arm: Move helper_set_pstate_* into cpregs.c
  target/arm: move translate modules to tcg/
  target/arm: Wrap arm_rebuild_hflags calls with tcg_enabled
  target/arm: Move hflags code into the tcg directory
  tests/tcg: Do not build/run TCG tests if TCG is disabled
  target/arm: Move regime_using_lpae_format into internal.h
  cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
  target/arm: don't access TCG code when debugging with KVM

 MAINTAINERS                             |    1 +
 configure                               |    4 +
 hw/arm/boot.c                           |    6 +-
 hw/intc/armv7m_nvic.c                   |   20 +-
 include/exec/cpu-defs.h                 |    6 +
 target/arm/arm-powerctl.c               |    7 +-
 target/arm/cpregs.c                     | 9505 +++++++++++++++++++++++
 target/arm/cpu.c                        |   10 +-
 target/arm/helper.c                     | 9459 +---------------------
 target/arm/internals.h                  |   32 +-
 target/arm/machine.c                    |   31 +-
 target/arm/meson.build                  |   48 +-
 target/arm/ptw.c                        |    4 +
 target/arm/tcg-stubs.c                  |   33 +
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
 target/arm/{ => tcg}/op_helper.c        |    1 +
 target/arm/{ => tcg}/pauth_helper.c     |    0
 target/arm/{ => tcg}/psci.c             |    0
 target/arm/{ => tcg}/sme-fa64.decode    |    0
 target/arm/{ => tcg}/sme.decode         |    0
 target/arm/{ => tcg}/sme_helper.c       |   29 -
 target/arm/{ => tcg}/sve.decode         |    0
 target/arm/{ => tcg}/sve_helper.c       |    0
 target/arm/{ => tcg}/t16.decode         |    0
 target/arm/{ => tcg}/t32.decode         |    0
 target/arm/{ => tcg}/tlb_helper.c       |   18 -
 target/arm/{ => tcg}/translate-a64.c    |    1 +
 target/arm/{ => tcg}/translate-a64.h    |    0
 target/arm/{ => tcg}/translate-m-nocp.c |    0
 target/arm/{ => tcg}/translate-mve.c    |    0
 target/arm/{ => tcg}/translate-neon.c   |    0
 target/arm/{ => tcg}/translate-sme.c    |    0
 target/arm/{ => tcg}/translate-sve.c    |    0
 target/arm/{ => tcg}/translate-vfp.c    |    0
 target/arm/{ => tcg}/translate.c        |    1 +
 target/arm/{ => tcg}/translate.h        |    0
 target/arm/{ => tcg}/vec_helper.c       |    0
 target/arm/{ => tcg}/vec_internal.h     |    0
 target/arm/{ => tcg}/vfp-uncond.decode  |    0
 target/arm/{ => tcg}/vfp.decode         |    0
 target/arm/trace-events                 |    2 +-
 tests/Makefile.include                  |   10 +
 tests/qtest/device-introspect-test.c    |   32 +-
 tests/qtest/qom-test.c                  |   21 +
 tests/qtest/test-hmp.c                  |   21 +
 61 files changed, 10154 insertions(+), 9936 deletions(-)
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
 rename target/arm/{ => tcg}/op_helper.c (99%)
 rename target/arm/{ => tcg}/pauth_helper.c (100%)
 rename target/arm/{ => tcg}/psci.c (100%)
 rename target/arm/{ => tcg}/sme-fa64.decode (100%)
 rename target/arm/{ => tcg}/sme.decode (100%)
 rename target/arm/{ => tcg}/sme_helper.c (98%)
 rename target/arm/{ => tcg}/sve.decode (100%)
 rename target/arm/{ => tcg}/sve_helper.c (100%)
 rename target/arm/{ => tcg}/t16.decode (100%)
 rename target/arm/{ => tcg}/t32.decode (100%)
 rename target/arm/{ => tcg}/tlb_helper.c (94%)
 rename target/arm/{ => tcg}/translate-a64.c (99%)
 rename target/arm/{ => tcg}/translate-a64.h (100%)
 rename target/arm/{ => tcg}/translate-m-nocp.c (100%)
 rename target/arm/{ => tcg}/translate-mve.c (100%)
 rename target/arm/{ => tcg}/translate-neon.c (100%)
 rename target/arm/{ => tcg}/translate-sme.c (100%)
 rename target/arm/{ => tcg}/translate-sve.c (100%)
 rename target/arm/{ => tcg}/translate-vfp.c (100%)
 rename target/arm/{ => tcg}/translate.c (99%)
 rename target/arm/{ => tcg}/translate.h (100%)
 rename target/arm/{ => tcg}/vec_helper.c (100%)
 rename target/arm/{ => tcg}/vec_internal.h (100%)
 rename target/arm/{ => tcg}/vfp-uncond.decode (100%)
 rename target/arm/{ => tcg}/vfp.decode (100%)

-- 
2.35.3


