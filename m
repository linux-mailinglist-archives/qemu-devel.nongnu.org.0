Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1180C4CEE5E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:20:17 +0100 (CET)
Received: from localhost ([::1]:36774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0Ah-0000Zx-Kn
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:20:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR08V-0006EW-Tw; Sun, 06 Mar 2022 18:17:59 -0500
Received: from [2a00:1450:4864:20::42e] (port=38680
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR08U-0007KC-9L; Sun, 06 Mar 2022 18:17:59 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t11so20676170wrm.5;
 Sun, 06 Mar 2022 15:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OgkpiHOWdedwvTgG8dQyFSAN6k9ArViQW9Sf59AH1TA=;
 b=i2EtSe29dQNipatL+xrJCyRI5Zx9Lr8XDVGBUjBhAoQHX4GAxr/bYLuzK1FkL3G9BI
 y3Z+JSLcPEMRZbk1faBNNJPyzb263gqV2wYN5N5O3mKdp9mHOeTRrT3eahXpas87tNJ8
 yBrhOPaO8kYpKD7djbOyPIFEGC+e+6AdBOhMRxDyB1gde2tSjYmX51GMAObz7rf81kbd
 jEKKQc5oPfbBD98KLe1H6pzWowX6AWlziduGHRJhwx4IuCbFgQwy3EMHaNj3ZBRI8Jz6
 rkIT5JtaUwC1eruZI4JaaaTaLmHFb0zNHcQUNzXU1X4gcBBRK2s+Ot5r8pmccP1Zqudi
 Vw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OgkpiHOWdedwvTgG8dQyFSAN6k9ArViQW9Sf59AH1TA=;
 b=1PFG4Wh1HaRqjGK8bYByv4V8iutlGWEGw8/jk98IWBIrjblB41hN3O4dtRupakDkFW
 HpvL5pZ8OlOKLL9MKo4HXtcucF4H2/+c7g3WfuKTPuR02/VrvbgJCcd6c+mtZ3Ks6wmJ
 Fiw3gyA+SGBQxpSTFiic23GnJr8XAAJ6mSp62XS5osT/XHF0ZUtB4/0AN58AdX2ftJUo
 WA3tz0xfKqZb8NseUk+X+DkbUuhyDQG7PgxE5j2/lSW1dycQ264zV7wC690q7I1d+Fel
 r+h++kHuufrQ6QrCmsHW58SzaVL8RSHKREyYgBfFs/K11YXLrflgDXTMY2n0PkI8MLA1
 Nyig==
X-Gm-Message-State: AOAM530kgYJjYab9tB+mhT4mJm3ms29o3ZUpv0oY3HnMPeyD1c/WvyAe
 zitZlX40M15cNwkz8I1DtvroTkHbZB8=
X-Google-Smtp-Source: ABdhPJwTnbtqh5E7lvRiOwD57f36NjJrw1aDZGAhM52asHo6jMpBK9Poa6nFV5HY48Pt1ExyHl+2jw==
X-Received: by 2002:adf:d1c2:0:b0:1f1:f89a:24ba with SMTP id
 b2-20020adfd1c2000000b001f1f89a24bamr1415391wrd.515.1646608676106; 
 Sun, 06 Mar 2022 15:17:56 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b00381141f4967sm14532375wmq.35.2022.03.06.15.17.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:17:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/22] host: Support macOS 12
Date: Mon,  7 Mar 2022 00:17:31 +0100
Message-Id: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Few patches to be able to build QEMU on macOS 12 (Monterey).

Missing review:
 0006-hvf-Fix-OOB-write-in-RDTSCP-instruction-decode.patch
 0013-osdep-Avoid-using-Clang-specific-__builtin_available.patch
 0014-meson-Resolve-the-entitlement.sh-script-once-for-goo.patch
 0015-meson-Log-QEMU_CXXFLAGS-content-in-summary.patch
 0016-configure-Pass-filtered-QEMU_OBJCFLAGS-to-meson.patch
 0017-ui-cocoa-Constify-qkeycode-translation-arrays.patch
 0020-ui-cocoa-capture-all-keys-and-combos-when-mouse-is-g.patch
 0021-ui-cocoa-add-option-to-swap-Option-and-Command.patch
 0022-gitlab-ci-Support-macOS-12-via-cirrus-run.patch

Since v6:
- Dropped merged patches
- Addressed Akihiko Odaki comments (squashed 2 patches, added R/T-b)
- Dropped 'configure: Disable out-of-line atomic operations on Aarch64'
- Add few macos patches on the list pending for 7.0 so tested by CI

Since v5:
- Fixed failed rebase between patches 10 and 16 (Akihiko)
- Include "ui/cocoa: Fix the leak of qemu_console_get_label"

Since v4:
- Use MAC_OS_X_VERSION_MIN_REQUIRED definition (Akihiko)
- Include patches from Akihiko

Since v3:
- Fix --enable-modules
- Ignore #pragma on softfloat3 tests
- Addressed Akihiko Odaki comments
- Include Cameron Esfahani patches

Since v2:
- Addressed Akihiko Odaki comments:
  . use __is_identifier(),
  . remove cocoa setAllowedFileTypes()
- Addressed Daniel Berrangé comment:
  . rebased on testing/next, update libvirt-ci/lcitool

Akihiko Odaki (2):
  audio: Log context for audio bug
  coreaudio: Always return 0 in handle_voice_change

Cameron Esfahani (2):
  hvf: Use standard CR0 and CR4 register definitions
  hvf: Fix OOB write in RDTSCP instruction decode

Carwyn Ellis (2):
  ui/cocoa: add option to disable left-command forwarding to guest
  ui/cocoa: release mouse when user switches away from QEMU window

Gustavo Noronha Silva (2):
  ui/cocoa: capture all keys and combos when mouse is grabbed
  ui/cocoa: add option to swap Option and Command

Philippe Mathieu-Daudé (14):
  configure: Allow passing extra Objective C compiler flags
  tests/fp/berkeley-testfloat-3: Ignore ignored #pragma directives
  hvf: Make hvf_get_segments() / hvf_put_segments() local
  hvf: Remove deprecated hv_vcpu_flush() calls
  block/file-posix: Remove a deprecation warning on macOS 12
  audio/coreaudio: Remove a deprecation warning on macOS 12
  audio/dbus: Fix building with modules on macOS
  audio: Rename coreaudio extension to use Objective-C compiler
  osdep: Avoid using Clang-specific __builtin_available()
  meson: Resolve the entitlement.sh script once for good
  meson: Log QEMU_CXXFLAGS content in summary
  configure: Pass filtered QEMU_OBJCFLAGS to meson
  ui/cocoa: Constify qkeycode translation arrays
  gitlab-ci: Support macOS 12 via cirrus-run

 .gitlab-ci.d/cirrus.yml            |  16 ++++
 .gitlab-ci.d/cirrus/macos-12.vars  |  16 ++++
 audio/audio.c                      |  25 +++---
 audio/audio_template.h             |  27 +++----
 audio/{coreaudio.c => coreaudio.m} |  23 +++---
 audio/meson.build                  |   4 +-
 block/file-posix.c                 |  14 +++-
 configure                          |  31 ++++++++
 include/qemu/osdep.h               |  10 +--
 meson.build                        |  17 +++-
 qapi/ui.json                       |  29 +++++++
 qemu-options.hx                    |  15 ++++
 target/i386/hvf/vmx.h              |  19 +++--
 target/i386/hvf/x86.c              |   6 +-
 target/i386/hvf/x86.h              |  34 --------
 target/i386/hvf/x86_decode.c       |  12 ++-
 target/i386/hvf/x86_mmu.c          |   2 +-
 target/i386/hvf/x86_task.c         |   4 +-
 target/i386/hvf/x86hvf.c           |  14 +++-
 target/i386/hvf/x86hvf.h           |   3 +-
 tests/fp/meson.build               |   5 ++
 tests/lcitool/refresh              |   1 +
 ui/cocoa.m                         | 122 ++++++++++++++++++++++++++---
 23 files changed, 327 insertions(+), 122 deletions(-)
 create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars
 rename audio/{coreaudio.c => coreaudio.m} (97%)

-- 
2.34.1


