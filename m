Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9393B69DD32
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:50:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPE1-0006dZ-Rt; Tue, 21 Feb 2023 04:46:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDo-0006XJ-5f
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:04 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDl-0005gq-BF
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:03 -0500
Received: by mail-wr1-x42f.google.com with SMTP id 6so3305912wrb.11
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AZnaHrZOicUrbbchqPGYdv667dSFULMM/yNnwbvj5Qs=;
 b=FN80vJLkm4Vafkh6QxDZxEFAVAkkER7KHdZSTDdeGTIxL4ApmzS1vXoFZ+fVoAQeMr
 SNqq+9M3pUNA1SXz2ggI19MO5og+Dt/5jPQgoM9sMWlT5FGeEg2nVaKvm2qUn43Y4o2Q
 5TPCEOHVhrXNDttdaaI5DaKXkV1hZBWOLqADbLYUMeOh57zpZT1iiJ7sb17HSOu/SeZG
 4lsQ5+kj4HbM8QKlfA88OcuBSeuYdRYhpHqe/MFGYqty0IE8qKLHYD1/N5Jc7B0KdgdL
 hI/dUMdnvuIhkiiVcCkekyQ3kj9yQiw9CZdTcrdYHnIZJ2fPtoF1sq7R9ebM1JdnPBUr
 vYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AZnaHrZOicUrbbchqPGYdv667dSFULMM/yNnwbvj5Qs=;
 b=Gho5FotYAxkXeDJZBsIxSLW18BDmFxrfSj68kv8lAbyCG5T8HIje2bx+tKUGXigbNP
 hIvvnSmPO7vIQM3zJf1LsTSWlbrDoZXlQJJ7GHHSjPxGL+JIJxeITHl9PKnBLErzTcIn
 H54SlQbNPjaFfnLsWwI62nmCZ7rWzgzsBEVpQ3MXPnjh6G/WZEgWQW50BueMbu6D/xgj
 P6UvmL14uIIGhqy3e9SHYkMqSBDEllaQfD6hsU/5yS8uR7SH3I04lGwIVtnJgnKnPtq6
 XROwK+LhhrV/+yIk3gs+RlCStkX/KZeUQbpMZaZu5YjYSs/6f9IRWrd+uzkv9WrE/TXn
 m1yA==
X-Gm-Message-State: AO0yUKV/ki141ZQXM5oYatSzyuqQkF+HmXPBb+FPp2f3hDPGsY3K+gSJ
 L6iOQCA2snxncj4CKdbm1/umxA==
X-Google-Smtp-Source: AK7set8SQj1o1A2cAGMMfcCZraYTPa0hVC99fOOlbmw8Mwy8Nzk7+MiegEY09HeNjHBVh86JEs5pfg==
X-Received: by 2002:a5d:54c6:0:b0:2c5:4a1a:d075 with SMTP id
 x6-20020a5d54c6000000b002c54a1ad075mr3714211wrv.68.1676972759618; 
 Tue, 21 Feb 2023 01:45:59 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a5d434e000000b002c5a1bd527dsm3303024wrr.96.2023.02.21.01.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 01:45:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DD83B1FFB7;
 Tue, 21 Feb 2023 09:45:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 00/14] testing/next: docker, avocado, unit, gitlab
Date: Tue, 21 Feb 2023 09:45:44 +0000
Message-Id: <20230221094558.2864616-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Since the last posting:

  - included Anton's curl fix (to keep CI green)
  - split socat MacOS changes across two patches
  - dropped ninja verbosity patch
  - reduced chattiness of fp-test
    - see https://gitlab.com/qemu-project/berkeley-testfloat-3/-/merge_requests/1
  - usual cleanups bellow the ---

The following patches still need review:

tests: ensure we export job results for some cross builds
tests: add tuxrun baseline test to avocado
tests: skip the nios2 replay_kernel test
tests: don't run benchmarks for the tsan build
gitlab: extend custom runners with base_job_template
tests: make fp-test less chatty when running from test suite
tests: be a bit more strict cleaning up fifos

Alex Bennée (10):
  tests: don't run socat tests on MacOS as well
  tests: add socat dependency for tests
  tests: be a bit more strict cleaning up fifos
  tests: make fp-test less chatty when running from test suite
  gitlab: extend custom runners with base_job_template
  tests: don't run benchmarks for the tsan build
  testing: update ubuntu2004 to ubuntu2204
  tests: skip the nios2 replay_kernel test
  tests: add tuxrun baseline test to avocado
  tests: ensure we export job results for some cross builds

Anton Johansson (1):
  block: Handle curl 7.55.0, 7.85.0 version changes

Bastian Koppelmann (1):
  tests/docker: Use binaries for debian-tricore-cross

Thomas Huth (2):
  gitlab-ci: Use artifacts instead of dumping logs in the Cirrus-CI jobs
  cirrus.yml: Improve the windows_msys2_task

 MAINTAINERS                                   |   1 +
 docs/devel/testing.rst                        |   4 +-
 tests/tcg/tricore/macros.h                    |   2 +-
 block/curl.c                                  |  44 +-
 tests/fp/fp-test.c                            |  19 +-
 tests/unit/test-io-channel-command.c          |  10 +-
 .cirrus.yml                                   |   8 +-
 .gitlab-ci.d/buildtest.yml                    |  23 +-
 .gitlab-ci.d/cirrus/build.yml                 |   7 +-
 .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
 .gitlab-ci.d/cirrus/macos-12.vars             |   2 +-
 .gitlab-ci.d/containers.yml                   |   4 +-
 .gitlab-ci.d/crossbuild-template.yml          |  11 +
 .gitlab-ci.d/crossbuilds.yml                  |  12 +-
 .gitlab-ci.d/custom-runners.yml               |   3 +-
 .../custom-runners/ubuntu-20.04-s390x.yml     |  10 +-
 .../custom-runners/ubuntu-22.04-aarch32.yml   |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml   |  10 +-
 tests/avocado/replay_kernel.py                |   1 +
 tests/avocado/tuxrun_baselines.py             | 423 ++++++++++++++++++
 tests/docker/dockerfiles/alpine.docker        |   1 +
 tests/docker/dockerfiles/centos8.docker       |   1 +
 .../dockerfiles/debian-amd64-cross.docker     |   1 +
 tests/docker/dockerfiles/debian-amd64.docker  |   1 +
 .../dockerfiles/debian-arm64-cross.docker     |   1 +
 .../dockerfiles/debian-armel-cross.docker     |   1 +
 .../dockerfiles/debian-armhf-cross.docker     |   1 +
 .../dockerfiles/debian-mips64el-cross.docker  |   1 +
 .../dockerfiles/debian-mipsel-cross.docker    |   1 +
 .../dockerfiles/debian-ppc64el-cross.docker   |   1 +
 .../dockerfiles/debian-s390x-cross.docker     |   1 +
 .../dockerfiles/debian-tricore-cross.docker   |  10 +-
 .../dockerfiles/fedora-win32-cross.docker     |   1 +
 .../dockerfiles/fedora-win64-cross.docker     |   1 +
 tests/docker/dockerfiles/fedora.docker        |   1 +
 tests/docker/dockerfiles/opensuse-leap.docker |   1 +
 tests/docker/dockerfiles/ubuntu2004.docker    |   4 +-
 tests/docker/dockerfiles/ubuntu2204.docker    | 147 ++++++
 tests/docker/test-tsan                        |   2 +-
 tests/fp/berkeley-testfloat-3                 |   2 +-
 tests/fp/meson.build                          |   2 +-
 tests/lcitool/projects/qemu.yml               |   1 +
 tests/lcitool/refresh                         |  11 +-
 tests/tcg/tricore/Makefile.softmmu-target     |   6 +-
 45 files changed, 720 insertions(+), 80 deletions(-)
 create mode 100644 tests/avocado/tuxrun_baselines.py
 create mode 100644 tests/docker/dockerfiles/ubuntu2204.docker

-- 
2.39.1


