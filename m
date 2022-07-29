Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0586584E1E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 11:37:12 +0200 (CEST)
Received: from localhost ([::1]:47418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHMQh-0006Bx-L9
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 05:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHM9w-0002Uh-Ke
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:19:53 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHM9t-0005rl-GQ
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:19:52 -0400
Received: by mail-wr1-x429.google.com with SMTP id k8so3091278wrd.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 02:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LHmWxffgKwEpyb378qz96WYY9WGpR+W1GDJhRsXBR0Y=;
 b=ABlMDwb3exVqQkRRqy9mhh6Crj2RTJPDSMGfFG4Js+BqZ/IpZV9qbzPVfLXER76VpM
 ReYNAtu1OHpJ8Pu1MyF7MezBgYR/K+hNJfr4kMnhJxGka5xErQ6+yYIr0I0gZFeCmEya
 jWR8XzN0efbeJJP39n2U02d2PUqykQBCOfrt9ZTJXTfZFk1v75wuWN55s/MtuUB+rjFt
 RoqXyOcXR/Inpix9EPGTqOraCi+OAl3tpy+Us1m/EGK+TjX4ooCY189pjUkgOkRyP2g7
 CFKK5ym7atHtOz31U6vvVFm6pXioqz8hCRznjgOtzsbm3SWE4jhVlppDJmKRu4R0tetX
 sf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LHmWxffgKwEpyb378qz96WYY9WGpR+W1GDJhRsXBR0Y=;
 b=M4tpUrvoeDkfMAeygFIYNNLwM1mQhCts/cVatqO66oB5YbU0LdzIY2chgzmK9WSkI3
 4BXmFf1lBHapPoLTvu3sJXLGHynLCtehGwkxGL8Yxo8/e0lWNWmlUxN1ropZ7KUhSV0c
 /0NbrMxuur2EDCepD3bG0uk5XT2XDEfh1SozFQu5ni2ziksNTclUZWtYaKxamPQf5L29
 HB93nQNR/oEZePUYNHtYJKBcWLzTTflHaAnXJ+WMXhpvW8MddXAf/I0NIRfTDwnq2sd9
 72EDMJO5XvszgJk5In/4xrhBFXSs5UtQx81CmzbSx8Uv2JLio415pMdU3+IJzcu1MgKk
 ye5g==
X-Gm-Message-State: ACgBeo19mYXbBQ+8kO12YtveSlheSjO5jxQEQlsAQOs89qIAY+HMHuZE
 slei8GpKSzg2obWVw3iXDpYArw==
X-Google-Smtp-Source: AA6agR6Zm6B2wkiVn1pEGjUYjTf0aTVNC4iROoXfWDIOLONAEhFIyCEsmuFS+JbUhzD3lK3LKaGYDg==
X-Received: by 2002:a05:6000:2aa:b0:21d:ac4b:95af with SMTP id
 l10-20020a05600002aa00b0021dac4b95afmr1684345wry.479.1659086385881; 
 Fri, 29 Jul 2022 02:19:45 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p2-20020adfce02000000b0021e30e9e44asm3196415wrn.53.2022.07.29.02.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 02:19:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9CBFF1FFB7;
 Fri, 29 Jul 2022 10:19:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 00/13] testing, semihosting and doc fixes
Date: Fri, 29 Jul 2022 10:19:30 +0100
Message-Id: <20220729091943.2152410-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit cc42559ab129a15554cc485ea9265e34dde7ab5b:

  Merge tag 'pull-ppc-20220728' of https://gitlab.com/danielhb/qemu into staging (2022-07-28 15:06:42 -0700)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-next-290722-1

for you to fetch changes up to 1235cf7d315b415fc2e4aa81815fda6ce96518c4:

  qemu-options: bring the kernel and image options together (2022-07-29 09:48:01 +0100)

----------------------------------------------------------------
Testing, semihosting and doc fixes:

  - update to latest libvirt-ci
  - echo testlog.txt on failed cirrus runs
  - drop containers-layer2 stage
  - update handling of symlinks on windows builds
  - return 0 for failure of semihosting console write
  - don't copy unused buffer after semihost operation
  - check for errors in semihosting args
  - fix buffer handling for semihosting TMPNAM
  - add qapi exit-failure PanicAction
  - add lowcore unaligned access test to s390x
  - fix documentation of OBJECT_DECLARE_SIMPLE_TYPE
  - expand documentation on booting code

----------------------------------------------------------------
Alex Bennée (2):
      docs/devel: fix description of OBJECT_DECLARE_SIMPLE_TYPE
      qemu-options: bring the kernel and image options together

Bin Meng (2):
      .cirrus.yml: Change winsymlinks to 'native'
      .gitlab-ci.d/windows.yml: Enable native Windows symlink

Daniel P. Berrangé (3):
      tests: refresh to latest libvirt-ci module
      gitlab: show testlog.txt contents when cirrus/custom-runner jobs fail
      gitlab: drop 'containers-layer2' stage

Ilya Leoshkevich (2):
      qapi: Add exit-failure PanicAction
      tests/tcg/s390x: Test unaligned accesses to lowcore

Peter Maydell (4):
      semihosting: Don't return negative values on qemu_semihosting_console_write() failure
      semihosting: Don't copy buffer after console_write()
      semihosting: Check for errors on SET_ARG()
      semihosting: Fix handling of buffer in TARGET_SYS_TMPNAM

 docs/devel/qom.rst                                 |  3 +-
 qapi/run-state.json                                |  5 +-
 include/sysemu/sysemu.h                            |  2 +-
 semihosting/arm-compat-semi.c                      | 29 +++++--
 semihosting/console.c                              |  3 +-
 semihosting/syscalls.c                             |  2 +-
 softmmu/main.c                                     |  6 +-
 softmmu/runstate.c                                 | 17 +++-
 .cirrus.yml                                        |  2 +-
 .gitlab-ci.d/cirrus/build.yml                      |  3 +-
 .gitlab-ci.d/cirrus/freebsd-12.vars                |  3 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars                |  3 +-
 .gitlab-ci.d/cirrus/macos-11.vars                  |  4 +-
 .gitlab-ci.d/container-cross.yml                   | 24 +++---
 .../custom-runners/centos-stream-8-x86_64.yml      |  2 +
 .../custom-runners/ubuntu-20.04-aarch32.yml        |  2 +
 .../custom-runners/ubuntu-20.04-aarch64.yml        | 12 +++
 .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml | 12 +++
 .gitlab-ci.d/stages.yml                            |  1 -
 .gitlab-ci.d/windows.yml                           |  2 +
 qemu-options.hx                                    | 98 +++++++++++++++++-----
 tests/docker/dockerfiles/alpine.docker             |  4 +-
 tests/docker/dockerfiles/centos8.docker            |  6 +-
 tests/docker/dockerfiles/debian-amd64.docker       |  2 +
 tests/docker/dockerfiles/debian-arm64-cross.docker |  2 +
 tests/docker/dockerfiles/debian-armel-cross.docker |  2 +
 tests/docker/dockerfiles/debian-armhf-cross.docker |  2 +
 .../dockerfiles/debian-mips64el-cross.docker       |  2 +
 .../docker/dockerfiles/debian-mipsel-cross.docker  |  2 +
 .../docker/dockerfiles/debian-ppc64el-cross.docker |  2 +
 tests/docker/dockerfiles/debian-s390x-cross.docker |  2 +
 tests/docker/dockerfiles/fedora.docker             |  3 +-
 tests/docker/dockerfiles/opensuse-leap.docker      |  7 +-
 tests/docker/dockerfiles/ubuntu2004.docker         |  2 +
 tests/lcitool/libvirt-ci                           |  2 +-
 tests/lcitool/projects/qemu.yml                    |  6 +-
 tests/lcitool/refresh                              |  4 +-
 tests/tcg/s390x/Makefile.softmmu-target            |  9 ++
 tests/tcg/s390x/unaligned-lowcore.S                | 19 +++++
 39 files changed, 243 insertions(+), 70 deletions(-)
 create mode 100644 tests/tcg/s390x/Makefile.softmmu-target
 create mode 100644 tests/tcg/s390x/unaligned-lowcore.S

-- 
2.30.2


