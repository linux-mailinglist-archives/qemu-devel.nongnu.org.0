Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD114AA166
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:50:01 +0100 (CET)
Received: from localhost ([::1]:33034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5Wq-0006aZ-4X
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:50:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qj-0006du-DD
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:41 -0500
Received: from [2a00:1450:4864:20::32d] (port=42862
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qh-0007KT-77
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:41 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 n40-20020a05600c3ba800b00353958feb16so4464180wms.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tPvPWoZfoAx56JLHOzUdBlaOjsJcPoCCPRQ/mi4ruyE=;
 b=SPI5dRb5AKlUWT3SwS5N4GGlgwlBzrxI0IFnu5Mj05Hb9mSzHkuCGFem86pDTGFELR
 x+xijbQ8CPgguQiA3n5LI+c6igoylQi8kefIvzfEzFnK3bzfzd3TbV7PwpnCdIsJ79ki
 HwqmvRwQiXjg0Gl5AYOefqcqf6IXb9HaymAUx3yjYlzWGKVRiO8gyzBPaGWG7VbXFFQt
 XBSEJ+sN5j7WrE4238KfHMShsLA+mPPpT7B8EKMMdO2oLfsnxliehNmo/wm9ZmUr9qp2
 m0mcbO7t8+UfKK7v97s06fvYhAQZB05ageQghvzfGXYhCYEraB9+B7aWwTZIYUNOpdXP
 o3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tPvPWoZfoAx56JLHOzUdBlaOjsJcPoCCPRQ/mi4ruyE=;
 b=S1qFxWP0/CWSAzgk+4YzUrvhqHyGHw9fCvlMAhudoR3MXdXmnBWweGOUg6tJ5+Pikg
 fUjUASK4U+SwA8HHMYVTDV5Oq0wNGfCWBZu/1a/tGzY/egfjC3inUnx7ds+5jGubN5Ss
 S1ZTrxnwB82Zu2seV/q+dgnPaeQKZq92ZyDh6GmpxnU3BKADxSjWkueT7px4S7KHmNqL
 WIwUaxbFEMyb7WhDzVolNOtHb2IS98GsL8Zad7ybVIs8dLqb0zVcMUfG1vcTQCfCR4lt
 eWfYLB/Jx4I7U812r7bNzXSkFqqzyRmR1xpIcU/QJYNH2WdOAUxm0LyajGYO+XmaHzlW
 Cxpw==
X-Gm-Message-State: AOAM530haZ41pnr6q6co+zDMLDzQ8t+hWFVK229ETFr4620wVAzRTDE8
 Z021Qjd0qT84BUSZCvHCrG+Idw==
X-Google-Smtp-Source: ABdhPJx4PGy8JCSd/DsZpYFzwPuFDELtF6P9MIuRZ1NXEb0CD643rWNrr22GPyZGNl7tCbeOBkAaIQ==
X-Received: by 2002:a05:600c:a4b:: with SMTP id
 c11mr3726099wmq.135.1644007416742; 
 Fri, 04 Feb 2022 12:43:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o5sm3203522wrc.23.2022.02.04.12.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:43:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 223091FFB7;
 Fri,  4 Feb 2022 20:43:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH  v3 00/26] testing and plugins pre-PR
Date: Fri,  4 Feb 2022 20:43:09 +0000
Message-Id: <20220204204335.1689602-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, berrange@redhat.com, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I plan to generate the PR for this next week so it's the last chance
for any review comments. I've added one additional commit which
disables the threadcount test for sh4-linux-user which is still pretty
shaky for anything thread related. The following could still do with
review:

 - plugins: move reset of plugin data to tb_start
 - tests/plugins: add instruction matching to libinsn.so
 - tests/plugin: allow libinsn.so per-CPU counts
 - tests/tcg/sh4: disable another unreliable test
 - Makefile: also remove .gcno files when cleaning
 - tests/qtest: enable more vhost-user tests by default

Alex Bennée (14):
  tests/Makefile.include: clean-up old code
  tests/qtest: enable more vhost-user tests by default
  Makefile: also remove .gcno files when cleaning
  .gitignore: add .gcov pattern
  docs/devel: mention our .editorconfig
  tests/tcg/sh4: disable another unreliable test
  docs: remove references to TCG tracing
  tracing: remove TCG memory access tracing
  tracing: remove the trace-tcg includes from the build
  tracing: excise the tcg related from tracetool
  tests/plugin: allow libinsn.so per-CPU counts
  tests/plugins: add instruction matching to libinsn.so
  target/i386: use CPU_LOG_INT for IRQ servicing
  plugins: move reset of plugin data to tb_start

Ivanov Arkady (2):
  plugins: add helper functions for coverage plugins
  contrib/plugins: add a drcov plugin

Michael Tokarev (1):
  drop libxml2 checks since libxml is not actually used (for parallels)

Philippe Mathieu-Daudé (6):
  MAINTAINERS: Cover lcitool submodule with build test / automation
  gitmodules: Correct libvirt-ci submodule URL
  tests/lcitool: Include local qemu.yml when refreshing cirrus-ci files
  tests/lcitool: Refresh submodule and remove libxml2
  tests: Manually remove libxml2 on MSYS2 runners
  tests/lcitool: Install libibumad to cover RDMA on Debian based distros

Stefan Hajnoczi (1):
  gitlab: fall back to commit hash in qemu-setup filename

Thomas Huth (2):
  tests/lcitool: Allow lcitool-refresh in out-of-tree builds, too
  tests: Update CentOS 8 container to CentOS Stream 8

 docs/about/removed-features.rst               |  13 ++
 docs/devel/style.rst                          |   4 +
 docs/devel/tracing.rst                        |  85 ---------
 Makefile                                      |   3 +-
 meson.build                                   |  10 --
 accel/tcg/atomic_template.h                   |  12 --
 include/exec/helper-gen.h                     |   2 -
 include/exec/helper-proto.h                   |   1 -
 include/exec/helper-tcg.h                     |   1 -
 include/qemu/qemu-plugin.h                    |  34 ++++
 include/trace-tcg.h                           |   6 -
 accel/tcg/cputlb.c                            |   2 -
 accel/tcg/plugin-gen.c                        |  29 ++--
 accel/tcg/user-exec.c                         |  14 --
 contrib/plugins/drcov.c                       | 163 ++++++++++++++++++
 plugins/api.c                                 |  48 ++++++
 target/i386/tcg/sysemu/seg_helper.c           |   4 +-
 tcg/tcg-op.c                                  |   5 -
 tests/plugin/insn.c                           | 126 +++++++++++++-
 tests/qtest/vhost-user-test.c                 |  21 +--
 accel/tcg/atomic_common.c.inc                 |  20 ---
 .cirrus.yml                                   |   1 -
 .gitignore                                    |   1 +
 .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
 .gitlab-ci.d/cirrus/macos-11.vars             |   2 +-
 .gitlab-ci.d/crossbuild-template.yml          |   2 +-
 .gitlab-ci.d/windows.yml                      |   2 -
 .gitmodules                                   |   2 +-
 MAINTAINERS                                   |   1 +
 block/meson.build                             |   3 +-
 contrib/plugins/Makefile                      |   1 +
 meson_options.txt                             |   2 -
 plugins/qemu-plugins.symbols                  |   4 +
 scripts/checkpatch.pl                         |   1 -
 .../ci/org.centos/stream/8/x86_64/configure   |   1 -
 scripts/coverity-scan/coverity-scan.docker    |   1 -
 scripts/coverity-scan/run-coverity-scan       |   2 +-
 scripts/meson-buildoptions.sh                 |   3 -
 scripts/tracetool/__init__.py                 |  41 +----
 scripts/tracetool/format/tcg_h.py             |  83 ---------
 scripts/tracetool/format/tcg_helper_c.py      |  79 ---------
 scripts/tracetool/format/tcg_helper_h.py      |  48 ------
 .../tracetool/format/tcg_helper_wrapper_h.py  |  70 --------
 scripts/tracetool/vcpu.py                     |  14 +-
 tests/Makefile.include                        |   4 -
 tests/docker/dockerfiles/alpine.docker        |   4 +-
 tests/docker/dockerfiles/centos8.docker       |   6 +-
 tests/docker/dockerfiles/fedora.docker        |   4 +-
 tests/docker/dockerfiles/opensuse-leap.docker |   3 +-
 tests/docker/dockerfiles/ubuntu1804.docker    |   4 +-
 tests/docker/dockerfiles/ubuntu2004.docker    |   4 +-
 tests/lcitool/Makefile.include                |   2 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/projects/qemu.yml               |   2 +-
 tests/lcitool/refresh                         |   4 +-
 tests/tcg/sh4/Makefile.target                 |   4 +
 trace-events                                  |  14 --
 trace/meson.build                             |  14 --
 59 files changed, 448 insertions(+), 594 deletions(-)
 delete mode 100644 include/trace-tcg.h
 create mode 100644 contrib/plugins/drcov.c
 delete mode 100644 scripts/tracetool/format/tcg_h.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_c.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_h.py
 delete mode 100644 scripts/tracetool/format/tcg_helper_wrapper_h.py

-- 
2.30.2


