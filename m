Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B3667408D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:06:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZHG-0003NQ-2Z; Thu, 19 Jan 2023 13:04:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH3-0003I8-5z
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:29 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH0-00010u-21
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:28 -0500
Received: by mail-wr1-x435.google.com with SMTP id r9so2668864wrw.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BRm1otPgrExRb08AWZc40PJiCCioZPQcspFOV7P1bvo=;
 b=yNV2t/ifJpj7uYMdbY/q/sxn9uQi2e8HNfM7Lzqvc6oPnQX/Ji7NhLAYWUUsL7eVed
 HNJwlUhsZGye7Dg+6HrTyze4HpEvQlPXtpKnLbG8WdqG1N7ds69S0NxkH/ECqvEk5HCU
 KkCy42ves4vS3KNgTwWEYwkpShph3h57yuPd5j7cfJAl28lMqQWvod2QsRoUgpyrKvCh
 62QIIahbQPnH0zvlFb++9Za9vasDSMKOK6R9kbc9jd6x0zv7sq7OWwCe0gKpcIBEyeTO
 5Pud6YpuFecZDj9SbkAvjXxZPBaWiFYISn9HC5BLAmJODyXOp0lA2ZOGyAI7OnMu2bV7
 WTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BRm1otPgrExRb08AWZc40PJiCCioZPQcspFOV7P1bvo=;
 b=Xnoe5f2YIEdwfUmW+GqOiV3V0uFqCe7eA1kzoNqrYVAkCjrxuFXdcytd+Dx2hApygX
 035V20OOu6Jm7rvaqtI3PFEoG23M6HUUL/mBd5wn8NXQGtq3mDTWcN7XRNBjAA3waxOw
 bm+G181qW0+sb+cwC5oFzPWz04PnkwyD51enN/KsThvdwZXEW1d5NOumKVc2K8293Roj
 ngTb6NSn6AlD4Wz8xl9z9Pu8koYt4gJ7SycYwBxhu+NnjYiqeKxZtSeuuAGeQiFi3B0/
 JD71muezTRp98SOQMJZhCq1bBR9rRA12GJbZTuqW6tkbpnRPgSmkikgor5Z00s9X4opW
 Gj0g==
X-Gm-Message-State: AFqh2krHST41QtZRDyc8EjaDYpg6GucoGGssXnJ0Iw9slv6w2C/xTbHJ
 UmZ36vhjjEiNRjOCX5TFreBvrQ==
X-Google-Smtp-Source: AMrXdXsmv5F19D9GytjPoCTk6/MRPDl0yyrIbQ+dFjQf43sVu8xBZKnLUqRZ0bkcWYGSU9b+DN2lrg==
X-Received: by 2002:adf:e912:0:b0:2b9:3cbb:6e02 with SMTP id
 f18-20020adfe912000000b002b93cbb6e02mr10655477wrm.27.1674151460361; 
 Thu, 19 Jan 2023 10:04:20 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t6-20020adfe446000000b002bb28209744sm34178194wrm.31.2023.01.19.10.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:04:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 77E141FFB7;
 Thu, 19 Jan 2023 18:04:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bandan Das <bsd@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 00/18] testing/next updates (gitlab, docker, check-tcg)
Date: Thu, 19 Jan 2023 18:04:01 +0000
Message-Id: <20230119180419.30304-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

My plans to post an omnibus release where stymied by a bunch of
regressions caused by the update to the Fedora image. I may have to
drop it if I can't figure out why the win64 stuff is hanging.

The following patches need review:

gitlab: wrap up test results for custom runners
tests/tcg: skip the vma-pthread test on CI
tests/docker: drop debian-tricore-cross's partial status
gitlab: add lsan suppression file to workaround tcmalloc issues
scripts/ci: update gitlab-runner playbook to use latest runner

Alex Bennée (7):
  scripts/ci: update gitlab-runner playbook to use latest runner
  gitlab: just use plain --cc=clang for custom runner build
  tests/unit: drop hacky race avoidance in test-io-channel-command
  gitlab: add lsan suppression file to workaround tcmalloc issues
  tests/docker: drop debian-tricore-cross's partial status
  tests/tcg: skip the vma-pthread test on CI
  gitlab: wrap up test results for custom runners

Marc-André Lureau (7):
  build-sys: fix crlf-ending C code
  .gitlab-ci.d/windows: do not disable opengl
  meson: replace Perl usage with Python
  docs: drop texinfo options
  Update lcitool and fedora to 37
  lcitool: drop perl from QEMU project/dependencies
  lcitool: drop texinfo from QEMU project/dependencies

Mark Cave-Ayland (1):
  gitlab: add FF_SCRIPT_SECTIONS for timings

Philippe Mathieu-Daudé (1):
  tests/docker: Install flex in debian-tricore-cross

Richard Henderson (1):
  tests/tcg: Use SIGKILL for timeout

Thomas Huth (1):
  MAINTAINERS: Fix the entry for tests/tcg/nios2

 MAINTAINERS                                   |  2 +-
 docs/conf.py                                  | 13 -----
 meson.build                                   |  2 +-
 tests/unit/test-io-channel-command.c          | 14 +++--
 .gitlab-ci.d/base.yml                         |  5 ++
 .gitlab-ci.d/buildtest.yml                    |  1 +
 .gitlab-ci.d/cirrus/freebsd-12.vars           |  2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |  2 +-
 .gitlab-ci.d/cirrus/macos-12.vars             |  2 +-
 .gitlab-ci.d/custom-runners.yml               | 11 ++++
 .../custom-runners/ubuntu-20.04-s390x.yml     | 13 ++---
 .../custom-runners/ubuntu-22.04-aarch32.yml   |  2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml   | 15 +++--
 .gitlab-ci.d/windows.yml                      |  5 +-
 scripts/ci/setup/build-environment.yml        |  1 -
 scripts/ci/setup/gitlab-runner.yml            | 56 +++++--------------
 scripts/ci/setup/vars.yml.template            |  2 -
 scripts/oss-fuzz/lsan_suppressions.txt        |  2 +
 scripts/shaderinclude.pl                      | 16 ------
 scripts/shaderinclude.py                      | 26 +++++++++
 tests/docker/Makefile.include                 |  1 -
 tests/docker/dockerfiles/alpine.docker        |  2 -
 tests/docker/dockerfiles/centos8.docker       |  2 -
 .../dockerfiles/debian-amd64-cross.docker     |  4 +-
 tests/docker/dockerfiles/debian-amd64.docker  |  2 -
 .../dockerfiles/debian-arm64-cross.docker     |  4 +-
 .../dockerfiles/debian-armel-cross.docker     |  4 +-
 .../dockerfiles/debian-armhf-cross.docker     |  4 +-
 .../dockerfiles/debian-mips64el-cross.docker  |  4 +-
 .../dockerfiles/debian-mipsel-cross.docker    |  4 +-
 .../dockerfiles/debian-ppc64el-cross.docker   |  4 +-
 .../dockerfiles/debian-s390x-cross.docker     |  4 +-
 .../dockerfiles/debian-toolchain.docker       |  1 -
 .../dockerfiles/debian-tricore-cross.docker   |  2 +-
 .../dockerfiles/fedora-win32-cross.docker     |  6 +-
 .../dockerfiles/fedora-win64-cross.docker     |  6 +-
 tests/docker/dockerfiles/fedora.docker        |  6 +-
 tests/docker/dockerfiles/opensuse-leap.docker |  2 -
 tests/docker/dockerfiles/ubuntu2004.docker    |  2 -
 tests/lcitool/libvirt-ci                      |  2 +-
 tests/lcitool/projects/qemu.yml               |  2 -
 tests/lcitool/refresh                         |  6 +-
 tests/qapi-schema/meson.build                 |  7 ++-
 tests/tcg/Makefile.target                     |  4 +-
 tests/tcg/multiarch/Makefile.target           |  9 +++
 tests/vm/centos.aarch64                       |  2 +-
 46 files changed, 124 insertions(+), 164 deletions(-)
 create mode 100644 scripts/oss-fuzz/lsan_suppressions.txt
 delete mode 100644 scripts/shaderinclude.pl
 create mode 100644 scripts/shaderinclude.py

-- 
2.34.1


