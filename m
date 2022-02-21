Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929864BD921
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 11:39:21 +0100 (CET)
Received: from localhost ([::1]:57132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM66C-0001EH-AH
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 05:39:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nM61j-00055F-4P
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 05:34:43 -0500
Received: from [2a00:1450:4864:20::533] (port=42634
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nM61g-00037C-0R
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 05:34:42 -0500
Received: by mail-ed1-x533.google.com with SMTP id i11so26692742eda.9
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 02:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+qmjo4xXO2v9bJsEjCTjFjvQA6rOKAaL+wMGYE4aP6s=;
 b=Q9FKnuT+z7HNXzTCwGIWsqV6WQNQdPD56g8xl3SZJV3s5nSXPh+L0PEWIOAqNq3seG
 KvQV9xVAmaX2UunQiel/hu/mBu/fkYFsmzVcl057U1E2QL9tRuS/bTQGscvYD9NpqXZT
 DDpU2gHuVUPCyj647a1KclMp+bBJ/yEqQRKDvPfCpu2zFU4WemqN58zFHwMjXQLlPSnx
 QdASm9vVfYUwlxKmiERBt4NA8mdmi4e5KinyPmskUQuPs5cKy1JZBFG7Dc6ajprAauB+
 MNSgB3nTgBhAzN9fGG1lS94si3vvpRYYaAh2D0N8q2rgXEzWn02mojVwtmFKxWTyLRfb
 FY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+qmjo4xXO2v9bJsEjCTjFjvQA6rOKAaL+wMGYE4aP6s=;
 b=4h8ZojqC2fuoLk5ztKSGyplZrmqqyp4tjtnlnv/eEwxZt0XzUFqQGSvhaGDqW8x8qM
 RfGcDHj5g453Uo+X/ipQJnZ5kzOLD1t0EuYerjXJ8RvaMtWajK+2yyPcvrP4APKYBznx
 uel0EW4KbQAo4oLwkanWsE7KWt9NiaxPgHJ3HldGWiwA2d++JrOLRFozemyoeWYnelAX
 1QaWac5MDYqoroQIAs55SgY3mMhdE2lv1yflxyX9l5ZDphu5/IdkNgv22B8JR/AWqJ7D
 kwnQGnZV7IkVVVAmAA9P7Rjo+08VfqlDV9KnstlmdqrdZ81LZLlm0ew4KySpF9mR0Ujd
 MTcA==
X-Gm-Message-State: AOAM533Ix652n4m/Afp3cGwy/VaAKZu1IrvdO9JZg5YQBuGfc8ZlEOsO
 6sKK2XCVmvO0olcpn6ZTKO0l51QBeQU=
X-Google-Smtp-Source: ABdhPJybW6wUZXlliOEEDCpqvzinYbUaWE6EuodkGHxDccqgg66jEYGvP6664aQXw1/tfdvwYUL7IA==
X-Received: by 2002:a50:da4b:0:b0:40f:28f0:c2c0 with SMTP id
 a11-20020a50da4b000000b0040f28f0c2c0mr20420953edk.374.1645439677985; 
 Mon, 21 Feb 2022 02:34:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id eg42sm6571608edb.79.2022.02.21.02.34.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 02:34:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 00/29] Misc mostly build system patches for 2022-02-15
Date: Mon, 21 Feb 2022 11:34:34 +0100
Message-Id: <20220221103435.65501-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ad38520bdeb2b1e0b487db317f29119e94c1c88d:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2022-02-15 19:30:33 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 5dc4618e781f36c4bea1b0cdd1bea75b48640c5a:

  configure, meson: move CONFIG_IASL to a Meson option (2022-02-21 10:35:54 +0100)

----------------------------------------------------------------
* More Meson conversions (0.59.x now required rather than suggested)
* UMIP support for TCG x86
* Fix migration crash
* Restore error output for check-block

----------------------------------------------------------------
v2->v3: AF_ALG must be disabled by default

Gareth Webb (1):
      target/i386: add TCG support for UMIP

Marc-André Lureau (9):
      qga/vss-win32: fix midl arguments
      meson: drop --with-win-sdk
      qga/vss-win32: use widl if available
      qga/vss: use standard windows headers location
      configure, meson: replace VSS SDK checks and options with --enable-vss-sdk
      meson: do not make qga/vss-win32/meson.build conditional on C++ presence
      qga/vss-win32: require widl/midl, remove pre-built TLB file
      meson: require dynamic linking for VSS support
      meson, configure: move ntddscsi API check to meson

Paolo Bonzini (17):
      meson: use .allowed() method for features
      meson: use .require() and .disable_auto_if() method for features
      configure, meson: move AVX tests to meson
      configure, meson: move membarrier test to meson
      configure, meson: move AF_ALG test to meson
      configure, meson: move libnuma detection to meson
      configure, meson: move TPM check to meson
      configure, meson: cleanup qemu-ga libraries
      configure, meson: move image format options to meson_options.txt
      configure, meson: move block layer options to meson_options.txt
      meson: define qemu_cflags/qemu_ldflags
      configure, meson: move some default-disabled options to meson_options.txt
      configure, meson: move coroutine options to meson_options.txt
      configure, meson: move smbd options to meson_options.txt
      configure, meson: move guest-agent, tools to meson
      meson: refine check for whether to look for virglrenderer
      configure, meson: move CONFIG_IASL to a Meson option

Peter Xu (1):
      memory: Fix qemu crash on starting dirty log twice with stopped VM

Thomas Huth (1):
      tests/qemu-iotests/testrunner: Print diff to stderr in TAP mode

 backends/tpm/meson.build           |  14 +-
 block/meson.build                  |  51 +++-
 configure                          | 598 +------------------------------------
 contrib/vhost-user-gpu/meson.build |   3 +-
 crypto/meson.build                 |   6 +-
 docs/devel/kconfig.rst             |   2 +-
 docs/meson.build                   |   2 -
 hw/acpi/meson.build                |   4 +-
 meson.build                        | 429 +++++++++++++++++---------
 meson_options.txt                  |  64 ++++
 migration/meson.build              |   4 +-
 net/slirp.c                        |  16 +-
 qga/commands-win32.c               |   6 +-
 qga/meson.build                    |  55 +++-
 qga/vss-win32/install.cpp          |   2 +-
 qga/vss-win32/meson.build          |  52 ++--
 qga/vss-win32/provider.cpp         |   4 +-
 qga/vss-win32/qga-vss.tlb          | Bin 1528 -> 0 bytes
 qga/vss-win32/requester.cpp        |   4 +-
 qga/vss-win32/vss-common.h         |   6 +-
 scripts/meson-buildoptions.py      |   2 +
 scripts/meson-buildoptions.sh      |  89 ++++++
 softmmu/memory.c                   |  65 ++--
 softmmu/meson.build                |   5 +-
 target/i386/cpu.c                  |   2 +-
 target/i386/cpu.h                  |   4 +-
 target/i386/helper.c               |   8 +-
 target/i386/tcg/translate.c        |  15 +
 tests/Makefile.include             |   2 +-
 tests/check-block.sh               |   4 -
 tests/meson.build                  |   2 +-
 tests/qemu-iotests/meson.build     |   2 +-
 tests/qemu-iotests/testrunner.py   |   5 +-
 tests/unit/meson.build             |   6 +-
 tools/meson.build                  |  31 +-
 util/meson.build                   |   4 +-
 36 files changed, 690 insertions(+), 878 deletions(-)
 delete mode 100644 qga/vss-win32/qga-vss.tlb
-- 
2.34.1


