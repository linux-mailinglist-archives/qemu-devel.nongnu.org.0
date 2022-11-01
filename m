Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4689561507B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:20:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprfa-0004d1-1a; Tue, 01 Nov 2022 09:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oprfX-0004cs-OX
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:51:07 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oprfS-0001FU-GH
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:51:07 -0400
Received: by mail-wr1-x432.google.com with SMTP id l14so20206582wrw.2
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3EyqE8Gn3IpI96P40bFotPMr2ZNtGTh2Jx8q8ulbDDw=;
 b=shF2ScUgTB2y/eZSYTMiC+1xNXTARkb3P45lNvyGCcjcch0lZVsbgaDf8CnglQ4bab
 jXkM5m+tfYTyhgSNnxlQVdMSm/CwCvSWAd+AUtyEywCbnQ1zPMp4QMUEFIyU1XyyrpwL
 rH63Hys00P78QuGS8ifhp4kzNpFyELM2V8oCZYMfqktnx8dHR3dF6eP2rpbZn9yWoU4n
 OaufQsvy+PHF0srfLzMIVdfYb/HkZG2lD+AYq70Vm47mMU73aEi6X2dt3z1oCS2Y8u/B
 HuEtKHmia2aEBO07out14ntidxwGPtZckGRnvGJVQNDISIWOecCaKrF7Xn4K3UTQH3xq
 Ee+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3EyqE8Gn3IpI96P40bFotPMr2ZNtGTh2Jx8q8ulbDDw=;
 b=qeuKvxjyNIJTTTu2liowgoGH6yYHzM80E4kTrCZ2H9T/LcMxheOrRRSdKUE2pAIZSt
 zKuDdkFaCNIaEUfUfEjqBovRw1CY5AHKq6f1xDKjYBx0nuXEkwgYnrG3piMyHzitS7fh
 smHyPGoquhitRdAFkvHU5XsfLPcvOG+DgQaTFLCB/s1U4Mc2k8FSAsP2ulQ0rlM2QuVA
 mn7vCH2UUPZN94xcjkqOLlIkb42MORSJ7teF2HAFonUhDH4euYQCojwjkcnn8akJYvja
 drPM23mAJXvCUnVL5eInSs8r4/nI0qL5exi0GV2dB/Ub69IPP9bnBb+x6c2oMieYRLgr
 shiA==
X-Gm-Message-State: ACrzQf1QFKGc9XRfptBLrzJZ7PhOWIsqV/2NBzUnoz3WMhIgdsxwUTSM
 Pj8t6zoKh0bXgSi52KsZ18SKpg==
X-Google-Smtp-Source: AMsMyM5vnw+HQvYeu+zdMNy1uPqgpfpUl/Tz0x3lkJyHmXWqzmhSNHZ2Z/MMLYNjOCXHGZSkPu9qjA==
X-Received: by 2002:a05:6000:510:b0:235:e5de:8da0 with SMTP id
 a16-20020a056000051000b00235e5de8da0mr11799726wrf.416.1667310659390; 
 Tue, 01 Nov 2022 06:50:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a5d56d1000000b0022cc6b8df5esm10164374wrw.7.2022.11.01.06.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:50:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE36C1FFB7;
 Tue,  1 Nov 2022 13:50:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v3 for 7.2 00/31] testing and plugin updates
Date: Tue,  1 Nov 2022 13:50:57 +0000
Message-Id: <20221101135057.1294566-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 5107fd3effb1cfec3b96d9e819f1605048640e31:

  net/vhost-vdpa.c: Fix clang compilation failure (2022-10-31 13:01:31 -0400)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-for-7.2-011122-3

for you to fetch changes up to 339bf0c071eff5e6ff1d9ddb3ad5cd02e4cd9ca3:

  tests/vm: use -o IdentitiesOnly=yes for ssh (2022-10-31 20:37:59 +0000)

----------------------------------------------------------------
testing and plugin updates for 7.2:

  - cleanup win32/64 docker files
  - update test-mingw test
  - add flex/bison to debian-all-test
  - handle --enable-static/--disable-pie in config
  - extend timeouts on x86_64 avocado tests
  - add flex/bison to debian-hexagon-cross
  - use regular semihosting for nios2 check-tcg
  - fix obscure linker error to nios2 softmmu tests
  - various windows portability fixes for tests
  - clean-up of MAINTAINERS
  - use -machine none when appropriate in avocado
  - make raspi2_initrd test detect shutdown
  - disable sh4 rd2 tests on gitlab
  - re-enable threadcount/linux-test for sh4
  - clean-up s390x handling of "ex" instruction
  - better handle new CPUs in execlog plugin
  - pass CONFIG_DEBUG_TCG to plugin builds
  - try and avoid races in test-io-channel-command
  - speed up ssh key checking for tests/vm

----------------------------------------------------------------
Alex Bennée (21):
      tests/lcitool: Rename non-Debian specific helper
      tests/docker: update fedora-win[32|64]-cross with lcitool
      tests/lcitool: Refresh to latest libvirt-ci module
      tests/docker: update test-mingw to run single build
      configure: don't enable cross compilers unless in target_list
      configure: fix the --enable-static --disable-pie case
      tests/avocado: extend the timeout for x86_64 tcg tests
      tests/tcg: use regular semihosting for nios2-softmmu
      MAINTAINERS: add entries for the key build bits
      MAINTAINERS: add features_to_c.sh to gdbstub files
      MAINTAINERS: fix-up for check-tcg Makefile changes
      tests/avocado: set -machine none for userfwd and vnc tests
      tests/avocado: disable sh4 rd2 tests on Gitlab
      tests/tcg: re-enable linux-test for sh4
      tests/tcg: re-enable threadcount for sh4
      target/s390x: don't use ld_code2 to probe next pc
      target/s390x: don't probe next pc for EXecuted insns
      target/s390x: fake instruction loading when handling 'ex'
      contrib/plugins: enable debug on CONFIG_DEBUG_TCG
      contrib/plugins: protect execlog's last_exec expansion
      tests/unit: cleanups for test-io-channel-command

Anton Johansson (2):
      tests/docker: Add flex/bison to `debian-all-test`
      tests/docker: Add flex/bison to `debian-hexagon-cross`

Bin Meng (4):
      semihosting/arm-compat-semi: Avoid using hardcoded /tmp
      tcg: Avoid using hardcoded /tmp
      block/vvfat: Unify the mkdir() call
      hw/usb: dev-mtp: Use g_mkdir()

Ilya Leoshkevich (1):
      tests/vm: use -o IdentitiesOnly=yes for ssh

Paolo Bonzini (1):
      tests/tcg: include CONFIG_PLUGIN in config-host.mak

Peter Maydell (1):
      tests/avocado: raspi2_initrd: Wait for guest shutdown message before stopping

Richard Henderson (1):
      tests/tcg/nios2: Tweak 10m50-ghrd.ld

 configure                                          |  17 ++-
 include/exec/translator.h                          |  17 +++
 block/vvfat.c                                      |   9 +-
 contrib/plugins/execlog.c                          |  38 ++++--
 hw/usb/dev-mtp.c                                   |   4 +-
 semihosting/arm-compat-semi.c                      |   3 +-
 target/s390x/tcg/translate.c                       |  14 ++-
 tcg/tcg.c                                          |   3 +-
 tests/unit/test-io-channel-command.c               |  45 ++++---
 MAINTAINERS                                        |  29 ++++-
 contrib/plugins/Makefile                           |   1 +
 tests/avocado/boot_linux.py                        |   1 +
 tests/avocado/boot_linux_console.py                |   7 +-
 tests/avocado/info_usernet.py                      |   3 +
 tests/avocado/vnc.py                               |   1 +
 .../dockerfiles/debian-all-test-cross.docker       |   2 +
 .../docker/dockerfiles/debian-hexagon-cross.docker |   2 +-
 tests/docker/dockerfiles/fedora-win32-cross.docker | 139 +++++++++++++++------
 tests/docker/dockerfiles/fedora-win64-cross.docker | 138 ++++++++++++++------
 tests/docker/test-mingw                            |  16 +--
 tests/lcitool/libvirt-ci                           |   2 +-
 tests/lcitool/refresh                              |  48 ++++---
 tests/tcg/nios2/10m50-ghrd.ld                      |  14 ++-
 tests/tcg/nios2/Makefile.softmmu-target            |   3 +-
 tests/tcg/sh4/Makefile.target                      |  12 --
 tests/vm/basevm.py                                 |   3 +-
 26 files changed, 396 insertions(+), 175 deletions(-)

-- 
2.34.1


