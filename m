Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C636DF4E3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 14:19:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmZRB-0001xj-Jb; Wed, 12 Apr 2023 08:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pmZQv-0001Y7-Ki; Wed, 12 Apr 2023 08:18:42 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pmZQt-00019D-DH; Wed, 12 Apr 2023 08:18:41 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B10F31F6E6;
 Wed, 12 Apr 2023 12:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681301915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MKijkx67CYmcwu13PgnqnjEbuLd4RThGldKjbblvjlU=;
 b=evaVjfTcAK4EAAytD2+ctjFo0MqIH3s8r3GazvTUiXxq0X9ofgXnVdIdjgyxW2ii5ft/dA
 e/87zMqnoAcp8U/2gvQOmGKD4Av0LEYnGBfqFfbL82r5/SIlaiY6bZjJQi3qIjzQM+pSjE
 GliPxOG1ejw/aDZpKAHu7kT/6K78ub4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681301915;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MKijkx67CYmcwu13PgnqnjEbuLd4RThGldKjbblvjlU=;
 b=YB0kH+K4eBkXCeU+LtDKrcGj4gVeEyvCnQYo3kDAKGhAIUzRhN2j1s/dJIxWRzokG2Brle
 yIpjYlejieWJOcBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A71F8132C7;
 Wed, 12 Apr 2023 12:18:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Co/nGpihNmSMUgAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 12 Apr 2023 12:18:32 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v10 00/11] target/arm: Allow CONFIG_TCG=n builds
Date: Wed, 12 Apr 2023 09:18:18 -0300
Message-Id: <20230412121829.14452-1-farosas@suse.de>
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

Rebased on master, moved the neoverse-n1 regs into tcg/cpu64.c and
extracted three new patches from the cpu64 move:

- patch 2: remove dead code from cpu_max_get_sve_max_vq
- patch 3: move TCG -cpu max code into it's own function
- patch 4: add the tcg_enabled || qtest_enabled logic

CI run: https://gitlab.com/farosas/qemu/-/pipelines/834334928

Thanks

v9:

- reverted back to keeping -cpu max code for TCG in tcg/cpu64.c;

- pauth: used tcg_enabled instead of CONFIG_TCG in gdbstub.c. However
  we still need to keep the ifdef around the function definition in
  gdbstub64.c;

- moved all the regression and test fixes after the patches that
  enable the --disable-tcg flag;

- tests with --enable-xen --disable-tcg:

  Tests now explicitly skip instead of passing.

  We cannot do the check at build time because we build the tests only
  once for all the QEMU binaries and the native binary will have
  support for KVM, thus breaking our !CONFIG_TCG && !CONFIG_KVM
  verification.

  I also don't think we can have a wrapper because which accelerators
  are used is a test-specific information. The test should be able to
  specify which accelerators it needs. In other words there will
  always be hardcoded "tcg" and "kvm" strings somewhere.

https://lore.kernel.org/r/20230313151058.19645-1-farosas@suse.de

v8:
https://lore.kernel.org/r/20230309201434.10831-1-farosas@suse.de

v7 resend:
https://lore.kernel.org/r/20230228192628.26140-1-farosas@suse.de

v7:
https://lore.kernel.org/r/20230223130841.25916-1-farosas@suse.de

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

Claudio Fontana (1):
  target/arm: move cpu_tcg to tcg/cpu32.c

Fabiano Rosas (9):
  target/arm: Move cortex sysregs into a separate file
  target/arm: Remove dead code from cpu_max_set_sve_max_vq
  target/arm: Extract TCG -cpu max code into a function
  target/arm: Do not expose all -cpu max features to qtests
  target/arm: Move 64-bit TCG CPUs into tcg/
  tests/qtest: Fix tests when no KVM or TCG are present
  tests/avocado: Pass parameters to migration test
  arm/Kconfig: Always select SEMIHOSTING when TCG is present
  arm/Kconfig: Do not build TCG-only boards on a KVM-only build

Philippe Mathieu-Daudé (1):
  gitlab-ci: Check building KVM-only aarch64 target

 .gitlab-ci.d/crossbuilds.yml                  |  11 +
 .../custom-runners/ubuntu-22.04-aarch64.yml   |   4 -
 configs/devices/aarch64-softmmu/default.mak   |   4 -
 configs/devices/arm-softmmu/default.mak       |  39 -
 hw/arm/Kconfig                                |  43 +-
 hw/arm/virt.c                                 |   6 +-
 target/arm/Kconfig                            |   7 +
 target/arm/cortex-regs.c                      |  69 ++
 target/arm/cpregs.h                           |   6 +
 target/arm/cpu64.c                            | 702 +----------------
 target/arm/internals.h                        |  10 +-
 target/arm/meson.build                        |   2 +-
 target/arm/{cpu_tcg.c => tcg/cpu32.c}         |  72 +-
 target/arm/tcg/cpu64.c                        | 723 ++++++++++++++++++
 target/arm/tcg/meson.build                    |   2 +
 tests/avocado/migration.py                    |  83 +-
 tests/qtest/arm-cpu-features.c                |  12 +-
 tests/qtest/bios-tables-test.c                |  11 +-
 tests/qtest/boot-serial-test.c                |   5 +
 tests/qtest/migration-test.c                  |   9 +-
 tests/qtest/pxe-test.c                        |   8 +-
 tests/qtest/vmgenid-test.c                    |   9 +-
 22 files changed, 1007 insertions(+), 830 deletions(-)
 create mode 100644 target/arm/cortex-regs.c
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (93%)
 create mode 100644 target/arm/tcg/cpu64.c

-- 
2.35.3


