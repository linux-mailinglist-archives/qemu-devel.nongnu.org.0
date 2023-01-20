Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87181675D13
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 19:52:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIwTS-0002Oy-Nj; Fri, 20 Jan 2023 13:50:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIwTD-0002OQ-6L; Fri, 20 Jan 2023 13:50:35 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIwTB-0005Li-8Q; Fri, 20 Jan 2023 13:50:34 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 328005FC21;
 Fri, 20 Jan 2023 18:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674240631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZwSxwK1RVrkRcXI3JB+sTN/wZ8lCk0L2hnmiLpHXDBg=;
 b=EoZGLMnumSc1UJa86OvzmlvxeVzT0b+L6OffnfNPuv0EfRKkrQiwmUteo6WhxAErVdGe+M
 KDXz3tWtuXJIgwuyxyoAP10C/GYNKgVrjngr2ZpVZlb7Oz6FVCKK2VJqmBrLZNiuW6YpwT
 yi3QMKVt2x4W+tdlSw/1yghu5vTwpZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674240631;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZwSxwK1RVrkRcXI3JB+sTN/wZ8lCk0L2hnmiLpHXDBg=;
 b=x7EK3zDx92hL/57BEbpzO9UDId8X4nFvlvojhFDBzCqxm/Ej/OOnjLQIakwjbY0wRP3Pu8
 zCD7QVCGfkZ/kdDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B20D1390C;
 Fri, 20 Jan 2023 18:50:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id haMUNHPiymNSbQAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 20 Jan 2023 18:50:27 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [RFC PATCH v5 0/9] target/arm: Allow CONFIG_TCG=n builds
Date: Fri, 20 Jan 2023 15:48:16 -0300
Message-Id: <20230120184825.31626-1-farosas@suse.de>
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

Based on "target/arm: CONFIG_TCG=n part 1":
https://lore.kernel.org/r/20230118193518.26433-1-farosas@suse.de

Since v4:

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

Fabiano Rosas (8):
  target/arm: Move 64-bit TCG CPUs into tcg/
  target/arm: Use "max" as default cpu for the virt machine with KVM
  tests/qtest: arm-cpu-features: Match tests to required accelerators
  tests/qtest: Restrict tpm-tis-devices-{swtpm}-test to CONFIG_TCG
  tests/tcg: Do not build/run TCG tests if TCG is disabled
  target/avocado: Pass parameters to migration test on aarch64
  arm/Kconfig: Always select SEMIHOSTING when TCG is present
  arm/Kconfig: Do not build TCG-only boards on a KVM-only build

 configs/devices/aarch64-softmmu/default.mak |   4 -
 configs/devices/arm-softmmu/default.mak     |  39 --
 configure                                   |   6 +-
 hw/arm/Kconfig                              |  43 +-
 hw/arm/virt.c                               |  10 +-
 target/arm/Kconfig                          |   7 +
 target/arm/cpu64.c                          | 632 +------------------
 target/arm/internals.h                      |   4 +
 target/arm/meson.build                      |   1 -
 target/arm/{cpu_tcg.c => tcg/cpu32.c}       |  13 +-
 target/arm/tcg/cpu64.c                      | 654 ++++++++++++++++++++
 target/arm/tcg/meson.build                  |   2 +
 tests/avocado/migration.py                  |  10 +
 tests/qtest/arm-cpu-features.c              |  34 +-
 tests/qtest/meson.build                     |   4 +-
 15 files changed, 772 insertions(+), 691 deletions(-)
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (99%)
 create mode 100644 target/arm/tcg/cpu64.c

-- 
2.35.3


