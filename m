Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2FA4B5A58
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:04:16 +0100 (CET)
Received: from localhost ([::1]:35154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgdz-00048I-JP
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:04:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgWG-00071J-24; Mon, 14 Feb 2022 13:56:16 -0500
Received: from [2607:f8b0:4864:20::632] (port=38907
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgWE-0006Gv-Im; Mon, 14 Feb 2022 13:56:15 -0500
Received: by mail-pl1-x632.google.com with SMTP id c3so11269991pls.5;
 Mon, 14 Feb 2022 10:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6lYVMhHkGyHdpl2al9uSJC6KWVpBlEYf58S6UTyDs9Y=;
 b=PSQuL+dOz3ZMhkE06MAXZdeeAE4PUugNku/HPks5Lw5XMG1qQYcR4V0lScifUVPhQU
 Y0+QMyJ7x56/B8pO0HUjsQqg4U2325miKBYtZad+9dFA2y1CRmFOZdMxi+SLZwNwfxwj
 pDEKvEK9gbDyKKppyEQ2TqzaMqV1Wzlw2De2zKxivwbjsWAcW6DRPtJ1YLdOhdNqAmLF
 wQQ0TXTOHGlDmLKkgXQ4N2iGDfLEl6hHk0Yy33q2gVZJOrwbEanOq8stE3UrDjErw7GG
 gMtZzu+Z7QazNTwkE6ml3tfsmwZVhIcAA8xktlIJ77FxuzOlq1W71CF1dAUD52QiQ1uP
 Le6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=6lYVMhHkGyHdpl2al9uSJC6KWVpBlEYf58S6UTyDs9Y=;
 b=tbY8m1CWTPQuLmtfFXJV8/sp8brrZCBiHxjBxIH6MBtZJU1mfVxlxENiMbKIEeqVOo
 Asn1n5vA3qB8z9ZC6Gqni4dPOJQDOgXXDNb+KCUEObEZTiM8oJfVTJZQRCBRGej8uUrF
 YWIS14+0c2joOVDEus0GyBTYMKd9pzv2miz4AjCUajheFNyPBzmJR3RbRx5WNktt4H3Z
 GwK3YOMliTADzcVkuDrpL2LeTw58196JEuGqclpAC7Mvjh3dhI9gHgG9S7Uxhr86FB+W
 Nk1Ajj+C3SHvwszmxru6ooOrsnP+eWmmX084Kf/DgXF9e/hKpKNyLC3EtRfMR+jGoKoz
 MRDA==
X-Gm-Message-State: AOAM531ym2mtvRaO8Cj8L7Z8b7z5SPVO5Biag3TxmN6aRJgNHH/yP41W
 GJSbc5sTzWuJVK40YSQrnib6aDWBjco=
X-Google-Smtp-Source: ABdhPJw4pwtghnwIrxEmvf7nZ00YuTQCp3l4Svuv5bg5hjVvlk221hTUYsdkS0s8FL9HI19i2rEoHA==
X-Received: by 2002:a17:90b:4d81:: with SMTP id oj1mr32869pjb.96.1644864972662; 
 Mon, 14 Feb 2022 10:56:12 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id o7sm35212202pfk.184.2022.02.14.10.56.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:56:12 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 00/16] host: Support macOS 12
Date: Mon, 14 Feb 2022 19:55:49 +0100
Message-Id: <20220214185605.28087-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Few patches to be able to build QEMU on macOS 12 (Monterey).

This basically consists of adapting deprecated APIs.

CI job added to avoid bitrotting.

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

Based on Alex's testing/next

Akihiko Odaki (3):
  MAINTAINERS: Add Akihiko Odaki to macOS-relateds
  ui/cocoa: Add Services menu
  ui/cocoa: Do not alert even without block devices

Cameron Esfahani (3):
  hvf: Use standard CR0 and CR4 register definitions
  hvf: Fix OOB write in RDTSCP instruction decode
  hvf: Enable RDTSCP support

Philippe Mathieu-Daudé (10):
  configure: Allow passing extra Objective C compiler flags
  tests/fp/berkeley-testfloat-3: Ignore ignored #pragma directives
  hvf: Make hvf_get_segments() / hvf_put_segments() local
  hvf: Remove deprecated hv_vcpu_flush() calls
  block/file-posix: Remove a deprecation warning on macOS 12
  audio/coreaudio: Remove a deprecation warning on macOS 12
  audio/dbus: Fix building with modules on macOS
  ui/cocoa: Remove allowedFileTypes restriction in SavePanel
  lcitool: refresh
  gitlab-ci: Support macOS 12 via cirrus-run

 .gitlab-ci.d/cirrus.yml                    | 16 ++++++++++
 .gitlab-ci.d/cirrus/macos-12.vars          | 16 ++++++++++
 MAINTAINERS                                |  2 ++
 audio/coreaudio.c                          | 17 +++++++----
 audio/meson.build                          |  2 +-
 block/file-posix.c                         | 14 ++++++---
 configure                                  |  8 +++++
 meson.build                                |  5 ++++
 target/i386/hvf/hvf.c                      | 26 +++++++++++------
 target/i386/hvf/vmcs.h                     |  3 +-
 target/i386/hvf/vmx.h                      | 19 ++++++------
 target/i386/hvf/x86.c                      |  6 ++--
 target/i386/hvf/x86.h                      | 34 ----------------------
 target/i386/hvf/x86_cpuid.c                |  7 +++--
 target/i386/hvf/x86_decode.c               | 11 +++++--
 target/i386/hvf/x86_mmu.c                  |  2 +-
 target/i386/hvf/x86_task.c                 |  4 +--
 target/i386/hvf/x86hvf.c                   | 14 ++++++---
 target/i386/hvf/x86hvf.h                   |  3 +-
 tests/docker/dockerfiles/ubuntu1804.docker |  2 --
 tests/docker/dockerfiles/ubuntu2004.docker |  2 --
 tests/fp/meson.build                       |  1 +
 tests/lcitool/refresh                      |  1 +
 ui/cocoa.m                                 | 15 +++-------
 24 files changed, 133 insertions(+), 97 deletions(-)
 create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars

-- 
2.34.1


