Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297375364CA
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:38:43 +0200 (CEST)
Received: from localhost ([::1]:40784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuc2z-0002vF-1u
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0Y-0000Fp-L8
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:10 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0W-0002OU-6s
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:10 -0400
Received: by mail-ed1-x529.google.com with SMTP id g20so5881796edj.10
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1vSyL0ZTOyB9EYOVzzh6tV3xgLo+on8BGLHtsIacAHI=;
 b=U7zcIquSP1Ee2B/Cf9n4kbZL9NXy35WpUGOX880cxJo5GyZfhOCokmMhktdAxmT3lI
 e2jMXKtaojofKsLAHqG3iO/3HDRybSs45iNIRm6p0u1hkPAffgCE1HHS/sXrFLAW8Jee
 wzzAXafvzoLsRdw/FwOJqjqiO21a2rzDwAH0+6AlA+zq3SUKzfYawziOytV4QWYiaSes
 MGzIZmJHQei0jaPMRo5hFx6k+rDCC1LD1M9kr2Uxa681rp4WQ7/rVQvjs3QkFzj3o/rE
 aJsGkR4bXJ3Plwbnn4gshfXpB0wS5XhE0OTGjkZwziSycI0bWcLVY8yA09jhmy3tYtJd
 mSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1vSyL0ZTOyB9EYOVzzh6tV3xgLo+on8BGLHtsIacAHI=;
 b=T8FwPTb6s2UQsz3l27qMRDyndaVYAdFQsy8qnlN3/1J+9EgXdy1KWU8QAbiOcWpn2q
 MBg1hQ6tEiKMwoUyO41sHFwYFYNnpAOuIirxBYFvRJVA7a5AtBkrY2iSxARHw9QCyXyp
 uOZ9s0pE8TD31ch3fcSaLbGIJZmiJz3YTC5akQlLHuxKw9Os323bM0aDOP7E+F7mRyu9
 hPy7jlHXj2vmYANEYqOgNZ+Eqs8OBNVTXEoaITnfnZ2xf9rbTJDvkCYqVi1lhucD5Ws1
 6Pl62bUiiBWnb2rCQJmNfFY5x36jvCO96/tOCVZ3MqaeDuM9Kn8bqpOl0Pivz3NX92M7
 7w8g==
X-Gm-Message-State: AOAM530CpKjhKkh2IgT3DTZrCASZ/VFkUtPOlATpePR+pRaZcV4did/O
 AFOpEiwGdE02nVOUy+4/PbKwpg==
X-Google-Smtp-Source: ABdhPJw004PMh11uWizhf2Qf3ztr9svpr4t4eNw3gpruDb/H1CDbFXz6RyPShLeEkkNxBT3oxewOxw==
X-Received: by 2002:a05:6402:3484:b0:428:1a5e:3d48 with SMTP id
 v4-20020a056402348400b004281a5e3d48mr45986858edc.401.1653665766297; 
 Fri, 27 May 2022 08:36:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 bq8-20020a170906d0c800b006feb71acbb3sm1561237ejb.105.2022.05.27.08.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:36:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B021E1FFB7;
 Fri, 27 May 2022 16:36:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 00/33] testing/next (gitlab, junit, lcitool, x-compile)
Date: Fri, 27 May 2022 16:35:30 +0100
Message-Id: <20220527153603.887929-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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

After a delay caused with other priorities I've finally managed to
catch up with some of my maintainer duties. The result is the current
testing/next branch which contains:

  - some GitLab fixes from Thomas
  - exposing JUnit to gitlab from Marc-André
  - more lcitool docker conversions from me
  - sharing the testing cross compilers with rom builds from Paolo
  - disable testing on forks by default from Daniel

the last one is important with the upcoming rationing of CI minutes
as well as hopefully avoiding too much wasteful testing while
developing. See the doc tips about setting up aliases to make it easy
to trigger a CI build with a push.

So far it all seems to be hanging together fairly well. I'll probably
look to cut a PR from this next week if the soak testing doesn't throw
up anything else.

My patches could do with someone casting an eye over them as they are
un-reviewed and written on a Friday afternoon ;-)

Alex Bennée (9):
  meson.build: fix summary display of test compilers
  tests/lcitool: fix up indentation to correct style
  tests/docker: update debian-armhf-cross with lcitool
  tests/docker: update debian-armel-cross with lcitool
  tests/docker: update debian-mipsel-cross with lcitool
  tests/docker: update debian-mips64el-cross with lcitool
  tests/docker: update debian-ppc64el-cross with lcitool
  tests/docker: update debian-amd64 with lcitool
  docs/devel: clean-up the CI links in the docs

Daniel P. Berrangé (5):
  gitlab: introduce a common base job template
  gitlab: convert Cirrus jobs to .base_job_template
  gitlab: convert static checks to .base_job_template
  gitlab: convert build/container jobs to .base_job_template
  gitlab: don't run CI jobs in forks by default

Marc-André Lureau (1):
  gitlab-ci: add meson JUnit test result into report

Paolo Bonzini (16):
  configure: do not define or use the CPP variable
  build: clean up ninja invocation
  build: add a more generic way to specify make->ninja dependencies
  build: do a full build before running TCG tests
  configure, meson: move symlinking of ROMs to meson
  tests/tcg: correct target CPU for sparc32
  tests/tcg: merge configure.sh back into main configure script
  configure: add missing cross compiler fallbacks
  configure: handle host compiler in probe_target_compiler
  configure: introduce --cross-prefix-*=
  configure: include more binutils in tests/tcg makefile
  configure: move symlink configuration earlier
  configure: enable cross-compilation of s390-ccw
  configure: enable cross-compilation of optionrom
  configure: enable cross compilation of vof
  configure: remove unused variables from config-host.mak

Thomas Huth (2):
  .gitlab-ci.d/container-cross: Fix RISC-V container dependencies /
    stages
  .gitlab-ci.d/crossbuilds: Fix the dependency of the cross-i386-tci job

 docs/devel/ci-jobs.rst.inc                    | 116 +++-
 docs/devel/ci.rst                             |  11 +-
 docs/devel/submitting-a-patch.rst             |  36 +-
 docs/devel/testing.rst                        |   2 +
 configure                                     | 605 +++++++++++++++---
 Makefile                                      |   9 +-
 pc-bios/s390-ccw/netboot.mak                  |   2 +-
 meson.build                                   |   8 +-
 .gitlab-ci.d/base.yml                         |  72 +++
 .gitlab-ci.d/buildtest-template.yml           |  18 +-
 .gitlab-ci.d/buildtest.yml                    |  28 +-
 .gitlab-ci.d/cirrus.yml                       |  16 +-
 .gitlab-ci.d/container-cross.yml              |  24 +-
 .gitlab-ci.d/container-template.yml           |   1 +
 .gitlab-ci.d/containers.yml                   |   3 +-
 .gitlab-ci.d/crossbuild-template.yml          |   3 +
 .gitlab-ci.d/crossbuilds.yml                  |   2 +
 .gitlab-ci.d/qemu-project.yml                 |   1 +
 .gitlab-ci.d/static_checks.yml                |  19 +-
 .gitlab-ci.d/windows.yml                      |   1 +
 pc-bios/meson.build                           |  17 +-
 pc-bios/optionrom/Makefile                    |   4 +-
 pc-bios/s390-ccw/Makefile                     |   9 +-
 pc-bios/vof/Makefile                          |  17 +-
 scripts/mtest2make.py                         |   8 +-
 tests/Makefile.include                        |   4 +-
 tests/docker/Makefile.include                 |   5 -
 tests/docker/dockerfiles/debian-amd64.docker  | 194 ++++--
 .../dockerfiles/debian-armel-cross.docker     | 178 +++++-
 .../dockerfiles/debian-armhf-cross.docker     | 184 +++++-
 .../dockerfiles/debian-mips64el-cross.docker  | 177 ++++-
 .../dockerfiles/debian-mipsel-cross.docker    | 179 +++++-
 .../dockerfiles/debian-ppc64el-cross.docker   | 178 +++++-
 tests/lcitool/refresh                         | 178 ++++--
 tests/tcg/configure.sh                        | 376 -----------
 35 files changed, 1884 insertions(+), 801 deletions(-)
 create mode 100644 .gitlab-ci.d/base.yml
 delete mode 100755 tests/tcg/configure.sh

-- 
2.30.2


