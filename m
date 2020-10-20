Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D9628C442
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 23:47:04 +0200 (CEST)
Received: from localhost ([::1]:36364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS5eq-00029o-1X
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 17:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kS5dP-0001KY-Hj
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 17:45:35 -0400
Received: from mx2.suse.de ([195.135.220.15]:47942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kS5dN-0003J1-4a
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 17:45:35 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E9C8AB91;
 Mon, 12 Oct 2020 21:45:31 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 0/3] unbreak non-tcg builds
Date: Mon, 12 Oct 2020 23:45:24 +0200
Message-Id: <20201012214527.1780-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 01:21:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series now unbreaks current non-tcg builds
(!CONFIG_TCG).

tests Makefiles need to avoid relying on all non-native
archs binaries to be present,

bios-tables-test needs to skip tests that are tcg-only,

and notably the replay framework needs to consider that
it might not be functional (or its code present at all)
without TCG.

Tested ok target x86_64-softmmu on x86_64 host with:

./configure --enable-tcg --disable-kvm
./configure --enable-kvm --disable-tcg
./configure --enable-tcg --enable-kvm

running make check-qtest

Claudio Fontana (2):
  qtest: unbreak non-TCG builds in bios-tables-test
  replay: do not build if TCG is not available

Paolo Bonzini (1):
  tests/Makefile.include: unbreak non-tcg builds

 block/block-backend.c          |  17 ++++--
 block/io.c                     |  38 ++++++------
 block/iscsi.c                  |   9 ++-
 block/meson.build              |   3 +-
 block/nfs.c                    |  10 +++-
 block/null.c                   |   8 ++-
 block/nvme.c                   |  13 +++-
 block/rbd.c                    |   8 ++-
 hw/ide/core.c                  |  14 ++++-
 include/sysemu/replay.h        |   8 +--
 migration/savevm.c             |  11 ++--
 net/meson.build                |   3 +-
 replay/meson.build             |   2 +-
 replay/replay-events.c         |  20 +++++--
 replay/replay-input.c          |  20 +++++--
 stubs/meson.build              |   1 -
 stubs/replay-user.c            |   9 ---
 stubs/replay.c                 | 106 +++++++++++++++++++++++++++++++++
 tests/Makefile.include         |   2 +-
 tests/ptimer-test-stubs.c      |   5 --
 tests/qtest/bios-tables-test.c |  10 ++++
 tests/qtest/qmp-cmd-test.c     |   3 +
 ui/input.c                     |  10 +++-
 23 files changed, 256 insertions(+), 74 deletions(-)
 delete mode 100644 stubs/replay-user.c

-- 
2.26.2


