Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A55698479
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:26:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNPR-0006iL-CR; Wed, 15 Feb 2023 14:25:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPL-0006h9-SE
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:35 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPJ-0001fq-BP
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:35 -0500
Received: by mail-wm1-x334.google.com with SMTP id he5so6304955wmb.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IATeMDUlTFAkO9JWBf6hTj7x3KxTi1q/uESjx/vLLSo=;
 b=QOSpaOH4Z5ncUu00i5dmWstK49op+8N3ud6a+Nr5Y49laQDnYT7cXiG8O2uHPnEpLm
 GKKHuNAr+otU2l6O67oz7XP0HsSQreeduydx+Xh9rohBjmDtfDBORJ0ex8Wyjxh8DOMS
 3iotEGk9h6ZehY5vkzVHbWuqAaXVl82+zVvnRjMl5xeZOrk4uOHSOFOCX9+WEVtkuSbU
 2GOA0Ej9+cSqRUPDlrfjcIh7D67iSCYFNRwa6KYd2FnK1w9r9hs8YEQ0ZpumwBjNDM5X
 fqLA4bEDLdNMPstZfRiE5j+G0sjIApUfl3FkueFgIHK2oDjA0Ow1Ms+bQHWIDzty82Nc
 DdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IATeMDUlTFAkO9JWBf6hTj7x3KxTi1q/uESjx/vLLSo=;
 b=MLJKWmskum+o/II6UcB6s0RoOU0VUt9FjPFx/aFu00mqWjudh1M6fX3aoYMiT1gna5
 IZC1KLIa+339rTr5KmR1PMka/PA9f1g6gQmDmdi8LzHlanTpGIiSDKnfDX1uVYY79fPm
 PzDxmf1023DGIbmCZHKMuThXFmVOOyxl6aMRxQSRyryqTdsiNCVcC/fHQ47gifXDDAAh
 bYjQGF3vkfM4NgYl2JOLMerQSef/VSUYvGk+z6d8Py9zFrgBgCFgqhmct/TCUdhBSc+G
 kA5M3vtRGvxBsf1xsaFkyKjrP3JHxivIDbuIb6qGJhmQIsiIeLlDVG0ASYeYb3bWolU7
 3oaA==
X-Gm-Message-State: AO0yUKU3vxhaqYRQ78udRqbuzlkhsqU9eR1KNUgzraMjkFPK3tuQ+LMk
 2kC94WgY7jULmG15L0Ihi3o55g==
X-Google-Smtp-Source: AK7set/tFmAtt4rr4UvJbetatC6N/l4c/cmTgyVj9xTpDhCHIqoFjUwLiuK83b6oiQDKmEfjGEyNKw==
X-Received: by 2002:a05:600c:330a:b0:3e2:6c6:31a6 with SMTP id
 q10-20020a05600c330a00b003e206c631a6mr1253724wmp.9.1676489131155; 
 Wed, 15 Feb 2023 11:25:31 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c4f9400b003e200dc15f5sm3020608wmq.42.2023.02.15.11.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 11:25:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 68AAB1FFB7;
 Wed, 15 Feb 2023 19:25:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 00/12] testing/next: docker, avocado, unit,
Date: Wed, 15 Feb 2023 19:25:18 +0000
Message-Id: <20230215192530.299263-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

Here is the current status of my testing next. I've had to jump a few
hoops on MacOS as adding socat discovered a unit test failure. This
also includes tuxrun_baselines which is a collection of quick test
images that exercise a wide range of platforms.

The following patches need review:

tests: ensure we export job results for some cross builds
tests: add tuxrun baseline test to avocado
tests: skip the nios2 replay_kernel test
testing: update ubuntu2004 to ubuntu2204
gitlab: extend custom runners with base_job_template
gitlab: reduce default verbosity of cirrus run
tests: be a bit more strict cleaning up fifos
tests: add socat dependency for tests
gitlab: tweak and filter ninja output to reduce build noise

Alex Bennée (10):
  gitlab: tweak and filter ninja output to reduce build noise
  tests/avocado: retire the Aarch64 TCG tests from boot_linux.py
  tests: add socat dependency for tests
  tests: be a bit more strict cleaning up fifos
  gitlab: reduce default verbosity of cirrus run
  gitlab: extend custom runners with base_job_template
  testing: update ubuntu2004 to ubuntu2204
  tests: skip the nios2 replay_kernel test
  tests: add tuxrun baseline test to avocado
  tests: ensure we export job results for some cross builds

Bastian Koppelmann (1):
  tests/docker: Use binaries for debian-tricore-cross

Thomas Huth (1):
  cirrus.yml: Improve the windows_msys2_task

 MAINTAINERS                                   |   1 +
 docs/devel/testing.rst                        |   4 +-
 tests/tcg/tricore/macros.h                    |   2 +-
 tests/unit/test-io-channel-command.c          |  10 +-
 .cirrus.yml                                   |   8 +-
 .gitlab-ci.d/buildtest-template.yml           |   2 +-
 .gitlab-ci.d/buildtest.yml                    |  22 +-
 .gitlab-ci.d/cirrus/build.yml                 |   4 +-
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
 tests/avocado/boot_linux.py                   |  48 +-
 tests/avocado/machine_aarch64_virt.py         |  64 ++-
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
 .../{ubuntu2004.docker => ubuntu2204.docker}  |  17 +-
 tests/docker/test-tsan                        |   2 +-
 tests/lcitool/projects/qemu.yml               |   1 +
 tests/lcitool/refresh                         |  10 +-
 tests/tcg/tricore/Makefile.softmmu-target     |   6 +-
 43 files changed, 589 insertions(+), 119 deletions(-)
 create mode 100644 tests/avocado/tuxrun_baselines.py
 rename tests/docker/dockerfiles/{ubuntu2004.docker => ubuntu2204.docker} (91%)

-- 
2.39.1


