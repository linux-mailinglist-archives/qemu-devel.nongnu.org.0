Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8156B2E72
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:19:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMfL-0003X3-Pn; Thu, 09 Mar 2023 15:15:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1paMf3-0002vP-LN; Thu, 09 Mar 2023 15:14:49 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1paMf0-0002RF-AP; Thu, 09 Mar 2023 15:14:49 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 81C12202A7;
 Thu,  9 Mar 2023 20:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678392879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZLNtAGCa5avhacFqL5fpgWGOfzoV3RLsxTR4Fqc0q9g=;
 b=vVMLbTp83lomC07N7lWEKJ6EfcB6aVMGM0StAO57cRpZt2QQml/IEEkdsaibQP60vKzhF0
 LLzRkLqXDC8yBmqnF0pDLpBxmY038r8T/zZOR2BwMCn/7tD/YL+70ZJv2B5j4wn3Ps88lb
 dZmGCn+XV/jkZLUHW8rpx/rto7vz9p8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678392879;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZLNtAGCa5avhacFqL5fpgWGOfzoV3RLsxTR4Fqc0q9g=;
 b=vt37MPuKT8h0jEb4H3ONDLSw6OG7bGevp9CtdYYIuTc7FUQ8bCr5LSPyJtTHuisGmgpngY
 mBJPGiflLsyaH9Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 960BE1391B;
 Thu,  9 Mar 2023 20:14:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cETwFiw+CmTUZwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 09 Mar 2023 20:14:36 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v8 00/11] target/arm: Allow CONFIG_TCG=n builds
Date: Thu,  9 Mar 2023 17:14:23 -0300
Message-Id: <20230309201434.10831-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
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

Changes since v7:

- patch 8: moved calls to qtest_has_accel after g_test_init to avoid
           the TAP error;

- moved the avocado patch towards the end of the series so we can
  merge the rest without it if needed;

- two new patches to fix regressions due to gdbstub changes.

CI run: https://gitlab.com/farosas/qemu/-/pipelines/801656194

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
  target/arm: Move 64-bit TCG CPUs into tcg/
  target/arm: Move aa32_max_features out of cpu_tcg.c
  arm/Kconfig: Always select SEMIHOSTING when TCG is present
  arm/Kconfig: Do not build TCG-only boards on a KVM-only build
  tests/qtest: Fix tests when no KVM or TCG are present
  tests/avocado: Pass parameters to migration test
  target/arm: gdbstub: Guard M-profile code with CONFIG_TCG
  target/arm: gdbstub: Guard pauth code with CONFIG_TCG

Philippe Mathieu-Daudé (1):
  gitlab-ci: Check building KVM-only aarch64 target

 .gitlab-ci.d/crossbuilds.yml                  |  11 +
 .../custom-runners/ubuntu-22.04-aarch64.yml   |   4 -
 configs/devices/aarch64-softmmu/default.mak   |   4 -
 configs/devices/arm-softmmu/default.mak       |  39 --
 hw/arm/Kconfig                                |  43 +-
 hw/arm/virt.c                                 |   6 +-
 target/arm/Kconfig                            |   7 +
 target/arm/cortex-regs.c                      |  69 +++
 target/arm/cpregs.h                           |   6 +
 target/arm/cpu.c                              |  69 +++
 target/arm/cpu64.c                            | 399 +---------------
 target/arm/gdbstub.c                          |   6 +
 target/arm/gdbstub64.c                        |   2 +
 target/arm/internals.h                        |   7 +-
 target/arm/meson.build                        |   2 +-
 target/arm/{cpu_tcg.c => tcg/cpu32.c}         | 141 +-----
 target/arm/tcg/cpu64.c                        | 438 ++++++++++++++++++
 target/arm/tcg/meson.build                    |   2 +
 tests/avocado/migration.py                    |  83 +++-
 tests/qtest/arm-cpu-features.c                |  12 +-
 tests/qtest/bios-tables-test.c                |  10 +-
 tests/qtest/boot-serial-test.c                |  10 +
 tests/qtest/migration-test.c                  |   9 +-
 tests/qtest/pxe-test.c                        |   7 +-
 tests/qtest/vmgenid-test.c                    |   8 +-
 25 files changed, 787 insertions(+), 607 deletions(-)
 create mode 100644 target/arm/cortex-regs.c
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (87%)
 create mode 100644 target/arm/tcg/cpu64.c

-- 
2.35.3


