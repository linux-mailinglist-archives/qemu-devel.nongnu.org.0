Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA4C5B8C84
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:09:33 +0200 (CEST)
Received: from localhost ([::1]:45628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYUxA-00051u-WF
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnt-0006Rs-Qt
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:57 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnq-0002m6-EO
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:57 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z12so8116174wrp.9
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 08:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=yiFn3jLSEnDEykf1R0vH0UhWfcDa4GmtQBeVnC9Jt+E=;
 b=vsUzjHG0wJDph3hymNvl36oHb4TSjz1uJ+QFXUigXfz8At9btBVcMOXXBLtJbX4Y28
 ZoZV+Bep8m1qQeriLyY7TIJa5eQ+t77KEuR5BfeehyARPkm99UdUxYyCRqZNrK/RwmH2
 N6Ncz8nifoz39vxPXIVAOTBVkr2TvhyIHz+LTMJAM1t9pRRaRcU1YUAKul1Tsf1VWlRJ
 9rcRFCddd+9gY1wi9V0/1Ii4+Nb2Qv7Sv/lYA0fUqZnWo2Q7SEj24lSl3ym5jaG8+puM
 rm7fWXKkghaUwN+Ls2SRoggwP2vAS85G8L+PTVKRGNhspXoc0yl0soYzqQxNzvPSHqxc
 X/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=yiFn3jLSEnDEykf1R0vH0UhWfcDa4GmtQBeVnC9Jt+E=;
 b=ySevOiDfUVBfk8RNnnBvJ0eq/ETrLHuA+c8qwZ67KK7BIku95t0nwTbRe4PQn3+dUQ
 1X3YV0t9TVlyN/C3qwABcD/L7ucLaz98NrSo1RblhXwPn6wdqFK98ZMI6ByWqpZIh7v1
 e4G8fpMYsnbeUwCD/j5TnS/Fp8xAiWGmiUeWZOQDdfIy6h2v3qmT6LClieUDmtFmiUH9
 QFPXiE87/C9OUZu9HF1UoVRX9nCPhec87kCP0PqwAGVeDr6bcOOy6+o4U4ESrgQYkLkm
 qGvFI/d7WxD/Tbmzz0XX6oujGEzeKJ6+ACF2wqVNm/VOZTiaFpnaT0s1/3BplFA6rlrX
 0MpQ==
X-Gm-Message-State: ACgBeo18ZzOK98PXbUw9VxZYPqfAGZtGLYjkLpPy6N1qDe1mqeBYmkq5
 1nNK9WA1vP6jwdkJCjce2G7olQ==
X-Google-Smtp-Source: AA6agR6Mjw4ks7eyd+DuBCPmy4DdQOZ2v8LGzruQCE2fOUMjuq7yvUm+UGXQwhWTO+D5HO2op0K2MQ==
X-Received: by 2002:a05:6000:681:b0:22a:3007:df45 with SMTP id
 bo1-20020a056000068100b0022a3007df45mr17742167wrb.149.1663171192236; 
 Wed, 14 Sep 2022 08:59:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm14210886wru.49.2022.09.14.08.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 08:59:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6CB681FFB7;
 Wed, 14 Sep 2022 16:59:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 00/30] testing/next pre-PR (testing update and mips
 deprecation)
Date: Wed, 14 Sep 2022 16:59:20 +0100
Message-Id: <20220914155950.804707-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

Hi,

This is the current state of the testing tree. It was slightly delayed
from the last posting as I was waiting for the libvirt-ci update to
get merged. Changes since last post:

  - added some more avocado timeouts
  - moved cflags hack in the --disable-pie patch into configure
  - usual addressing of review comments (see --- in patches)

I'd like to roll the PR next week so please review the remaining
un-reviewed patches:

- tests/docker: remove FROM qemu/ support from docker.py
- tests/docker: update and flatten debian-hexagon-cross
- tests/docker: update and flatten debian-amd64-cross
- tests/docker: flatten debian-riscv64-test-cross
- configure: explicitly set cflags for --disable-pie
- tests/docker: remove tricore qemu/debian10 dependency
- tests/avocado: reduce the default timeout to 120s
- tests/avocado: add explicit timeout for ppc64le TCG tests
- tests/avocado: add explicit timeout for s390 TCG tests
- tests/avocado: add explicit timeout for Aarch64 TCG tests
- gitlab: reduce targets in cross_user_build_job

Alex Bennée (27):
  gitlab: reduce targets in cross_user_build_job
  tests/avocado: add explicit timeout for Aarch64 TCG tests
  tests/avocado: add explicit timeout for s390 TCG tests
  tests/avocado: add explicit timeout for ppc64le TCG tests
  tests/avocado: split the AST2x00Machine classes
  tests/avocado: reduce the default timeout to 120s
  tests/docker: update and flatten debian-alpha-cross
  tests/docker: update and flatten debian-hppa-cross
  tests/docker: update and flatten debian-m68k-cross
  tests/docker: update and flatten debian-mips64-cross
  tests/docker: update and flatten debian-sh4-cross
  tests/docker: update and flatten debian-sparc64-cross
  tests/docker: flatten debian-powerpc-test-cross
  tests/docker: remove tricore qemu/debian10 dependency
  tests/docker: remove amd64 qemu/debian10 dependency
  configure: explicitly set cflags for --disable-pie
  gitlab-ci: update aarch32/aarch64 custom runner jobs
  Deprecate 32 bit big-endian MIPS
  tests/docker: flatten debian-riscv64-test-cross
  tests/docker: update and flatten debian-all-test-cross
  tests/lcitool: bump to latest version
  tests/docker: update and flatten debian-amd64-cross
  tests/docker: update and flatten debian-loongarch-cross
  tests/docker: update and flatten debian-hexagon-cross
  tests/docker: update and flatten debian-toolchain
  tests/docker: remove FROM qemu/ support from docker.py
  tests/docker: remove the Debian base images

Richard Henderson (1):
  gitlab-ci/custom-runners: Disable -static-pie for ubuntu-20.04-aarch64

Thomas Huth (2):
  tests/avocado/boot_linux_console: Fix the
    test_aarch64_xlnx_versal_virt test
  tests/vm: Remove obsolete Fedora VM test

 docs/about/build-platforms.rst                |   2 +-
 docs/about/deprecated.rst                     |  13 ++
 docs/devel/testing.rst                        |   2 +-
 configure                                     |   6 +
 .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
 .gitlab-ci.d/container-core.yml               |   5 -
 .gitlab-ci.d/container-cross.yml              |  12 --
 .gitlab-ci.d/containers.yml                   |   5 -
 .gitlab-ci.d/crossbuild-template.yml          |   5 +-
 .gitlab-ci.d/crossbuilds.yml                  |  14 --
 .gitlab-ci.d/custom-runners.yml               |   4 +-
 ...4-aarch32.yml => ubuntu-22.04-aarch32.yml} |   6 +-
 ...4-aarch64.yml => ubuntu-22.04-aarch64.yml} |  38 ++--
 MAINTAINERS                                   |   3 +-
 tests/avocado/avocado_qemu/__init__.py        |   2 +-
 tests/avocado/boot_linux.py                   |   5 +
 tests/avocado/boot_linux_console.py           |   6 +-
 tests/avocado/machine_aspeed.py               |  18 ++
 tests/docker/Makefile.include                 |  30 +--
 tests/docker/docker.py                        |  38 +---
 .../dockerfiles/debian-all-test-cross.docker  |  18 +-
 .../dockerfiles/debian-alpha-cross.docker     |  12 +-
 .../dockerfiles/debian-amd64-cross.docker     | 178 ++++++++++++++--
 .../dockerfiles/debian-hexagon-cross.docker   |  19 +-
 .../dockerfiles/debian-hppa-cross.docker      |  12 +-
 .../dockerfiles/debian-loongarch-cross.docker |   8 +-
 .../dockerfiles/debian-m68k-cross.docker      |  12 +-
 .../dockerfiles/debian-mips-cross.docker      |  38 +---
 .../dockerfiles/debian-mips64-cross.docker    |  12 +-
 .../debian-powerpc-test-cross.docker          |  12 +-
 .../debian-riscv64-test-cross.docker          |  10 +-
 .../dockerfiles/debian-sh4-cross.docker       |  12 +-
 .../dockerfiles/debian-sparc64-cross.docker   |  12 +-
 .../dockerfiles/debian-toolchain.docker       |   5 +-
 tests/docker/dockerfiles/debian10.docker      |  38 ----
 tests/docker/dockerfiles/debian11.docker      |  18 --
 tests/docker/dockerfiles/opensuse-leap.docker |   3 +-
 tests/docker/dockerfiles/ubuntu2004.docker    |   2 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/refresh                         |   7 +
 tests/vm/Makefile.include                     |   3 +-
 tests/vm/fedora                               | 190 ------------------
 43 files changed, 365 insertions(+), 476 deletions(-)
 rename .gitlab-ci.d/custom-runners/{ubuntu-20.04-aarch32.yml => ubuntu-22.04-aarch32.yml} (86%)
 rename .gitlab-ci.d/custom-runners/{ubuntu-20.04-aarch64.yml => ubuntu-22.04-aarch64.yml} (82%)
 delete mode 100644 tests/docker/dockerfiles/debian10.docker
 delete mode 100644 tests/docker/dockerfiles/debian11.docker
 delete mode 100755 tests/vm/fedora

-- 
2.34.1


