Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CE8673ADA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:57:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVPJ-0008DP-Oq; Thu, 19 Jan 2023 08:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIVP8-0008Ag-GG; Thu, 19 Jan 2023 08:56:34 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIVP6-00068d-2x; Thu, 19 Jan 2023 08:56:33 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D88E05CE73;
 Thu, 19 Jan 2023 13:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674136589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oliGwYKP5xIhh4SI6Oq8VhV0YNuZWeeVtWzQPSGl6b0=;
 b=wR+Aqq8mkFVPhMQ1S0rg+C3v3sfrQRb+zrbZY85kkgWu6jCQtNudQTAXtJePxqyvU5CgXF
 2aIXZCCYSabb3O3/yOEI4AqgVCGNPZ4dwDKe+qGQNyOso3k75+0vvhxQ/rofLs9+W5Q9sm
 NH1pDTkoIGUrFhh4QKQ9c6KdMe6UD4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674136589;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oliGwYKP5xIhh4SI6Oq8VhV0YNuZWeeVtWzQPSGl6b0=;
 b=Qy54Pl/I6Sq4WqKYlb63OPpWHYxbKc64xF8ij//kXDpWpaixZMynwf7/tf3fTtFh6iEQIo
 bRQV/4pYBvWP0hBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CADBE134F5;
 Thu, 19 Jan 2023 13:56:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S8eqIwpMyWOCFAAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:56:26 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [RFC PATCH v4 00/15] target/arm: Allow CONFIG_TCG=n builds
Date: Thu, 19 Jan 2023 10:54:09 -0300
Message-Id: <20230119135424.5417-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
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

Based on "target/arm: CONFIG_TCG=n part 1":
https://lore.kernel.org/r/20230118193518.26433-1-farosas@suse.de

Since v3:

Aside from minor review comments, the larger changes in this version
are:

- The split of 64-bit CPUs into tcg/cpu64.c. I have moved everything
  aside from the cortex-a53 and cortex-a57 cpus which could in theory
  be used with KVM.

- qtest vs. default cpu. By removing the default CPU for KVM we now
  need to make sure the tests pass a -cpu option.

  I don't think allowing tests without -cpu would be feasible because
  we'd have to go searching for every piece of code that assumes a cpu
  is always present.

v3:
https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de

v2:
https://lore.kernel.org/r/20230109224232.11661-1-farosas@suse.de

v1:
https://lore.kernel.org/r/20230104215835.24692-1-farosas@suse.de

Claudio Fontana (1):
  target/arm: move cpu_tcg to tcg/cpu32.c

Fabiano Rosas (14):
  target/arm: Move 64-bit TCG CPUs into tcg/
  target/arm: Remove default cpu for KVM-only builds
  tests/qtest: arm-cpu-features: Match tests to required accelerators
  tests/qtest: Restrict tpm-tis-devices-{swtpm}-test to CONFIG_TCG
  tests/qtest: Add qtest_get_machine_args
  tests/qtest: Adjust qom-test to always set a -cpu option
  tests/qtest: Adjust test-hmp to always pass -cpu option
  tests/qtest: Adjust device-introspect-test to always set a -cpu option
  tests/qtest: aarch64: Set -cpu for numa-test
  tests/qemu-iotests: Allow passing a -cpu option in the QEMU cmdline
  tests/tcg: Do not build/run TCG tests if TCG is disabled
  target/avocado: Pass parameters to migration test on aarch64
  arm/Kconfig: Always select SEMIHOSTING when TCG is present
  arm/Kconfig: Do not build TCG-only boards on a KVM-only build

 configs/devices/aarch64-softmmu/default.mak |   4 -
 configs/devices/arm-softmmu/default.mak     |  39 --
 configure                                   |   6 +-
 hw/arm/Kconfig                              |  43 +-
 hw/arm/virt.c                               |   9 +
 target/arm/Kconfig                          |   7 +
 target/arm/cpu64.c                          | 633 +------------------
 target/arm/internals.h                      |   4 +
 target/arm/meson.build                      |   1 -
 target/arm/{cpu_tcg.c => tcg/cpu32.c}       |  13 +-
 target/arm/tcg/cpu64.c                      | 654 ++++++++++++++++++++
 target/arm/tcg/meson.build                  |   2 +
 tests/avocado/migration.py                  |  11 +-
 tests/qemu-iotests/testenv.py               |   7 +
 tests/qtest/arm-cpu-features.c              |  34 +-
 tests/qtest/device-introspect-test.c        |  17 +-
 tests/qtest/libqtest.c                      |  99 +++
 tests/qtest/libqtest.h                      |  11 +
 tests/qtest/meson.build                     |  12 +-
 tests/qtest/numa-test.c                     |   1 +
 tests/qtest/qom-test.c                      |  19 +-
 tests/qtest/test-hmp.c                      |  34 +-
 22 files changed, 960 insertions(+), 700 deletions(-)
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (99%)
 create mode 100644 target/arm/tcg/cpu64.c

-- 
2.35.3


