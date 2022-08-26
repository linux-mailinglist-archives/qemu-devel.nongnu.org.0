Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999675A2D60
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:24:08 +0200 (CEST)
Received: from localhost ([::1]:59538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRd3v-0001If-Nc
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1R-0004FD-2N
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:34 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1P-0002Ju-5X
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:32 -0400
Received: by mail-wr1-x42f.google.com with SMTP id n17so2563644wrm.4
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=MIBuTRuLR+kgyN2yqCm7Dn8BAabHsoM2Xad98Va+Up8=;
 b=asOy5pbWcMNajdI+MY7H9L9Y4fc8xyIzl/UXxvqZoieOPF5GsKCJPSW1nQbWyqKwya
 YmEWwTbUQIEZB/m1BPQifFsuFa4nc+LYa9VAqOPMdtF2y9UinKGnUSsm/ghOBvbh3IWj
 xGbPGdM4rJL8YEkVZHrQdqc2weL9ESvSBeubrJ3ws3jeOtp58FuUni4a7jwrPIJTIi0b
 B5dTpRYMIxgCF2tJE5BL9o8JX/wjJ1gao76TLs+HDqu1gAZHysfiCbuuvPOewD6zGpDy
 +WO9uVykuFeoh9OvungTYIQ2ez2QFnyPH0OkrtthYpS/LwnEXQrAftkNxDmfGl7mZD7A
 gOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=MIBuTRuLR+kgyN2yqCm7Dn8BAabHsoM2Xad98Va+Up8=;
 b=hT2eVGy4wqymmxGxg0+OJF+Hhr0yFh3fYZvGrc4tPQhuUAPUuXH+wKVUGvViaUfQki
 /Q24io38rZEOT9DRJsVoTR1qPvq3Mpur6bnhhUJft5hFRosUcYMHpB1EO2JlNCw5JJAZ
 l0L79u0NkIkdLT7gyKhU/g5e26yTOyBYn59ZUbjpXXZhjvSS5W5xpD86wu3itaCIzL4h
 gLD535oUUCy8zbATUIhrkoM+HFa4a3+stuubc0tRd83tUohuh2RwvVotM3oJIrxo/s8y
 kNJOHOiGlwrobIbHmzCvlgyekig1NokHuKHAhwYZGYynFb60iRtyn2+sJ+rDsyeUo1VW
 xbgA==
X-Gm-Message-State: ACgBeo0T2j1GEzb1j+mWNYjRvcQuem0CrkMuk12rqFplKe3mic/SAb5X
 mEWzlgMN+dDHxcW9/micpVg2Lg==
X-Google-Smtp-Source: AA6agR6EzOxYuiK/nCULkHIjSYHCCIJLnmTGhL+yeJiOhEmNys9zbfv0dNi0Md3CxrAAXYVyFegaqg==
X-Received: by 2002:a05:6000:156b:b0:222:c789:cb2d with SMTP id
 11-20020a056000156b00b00222c789cb2dmr373315wrz.197.1661534489700; 
 Fri, 26 Aug 2022 10:21:29 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a5d6705000000b00225285b8136sm261353wru.38.2022.08.26.10.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:21:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ACAAC1FFB7;
 Fri, 26 Aug 2022 18:21:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH  v1 for 7.2 00/25] testing updates and mips deprecation
Date: Fri, 26 Aug 2022 18:21:03 +0100
Message-Id: <20220826172128.353798-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

This is the first testing series for 7.2 once the tree opens. Along
with the usual small collection of tweaks and fixes I also finish the
effort to remove our internally layered Dockerfiles. This is a first
step to removing the dependency on docker.py totally and hopefully
improving the caching between what is in the registry and when we
trigger a re-build.

I've also started the deprecation of the big endian MIPS host given
the increasing difficulty of keeping the cross compilation going.

Please review.

Alex Bennée (22):
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
  tests/vm: Remove obsolete Fedora VM test
  gitlab-ci: Only use one process in Windows jobs for compilation

 docs/about/build-platforms.rst                |   2 +-
 docs/about/deprecated.rst                     |  13 ++
 docs/devel/testing.rst                        |   2 +-
 .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
 .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
 .gitlab-ci.d/container-core.yml               |   5 -
 .gitlab-ci.d/container-cross.yml              |  12 --
 .gitlab-ci.d/containers.yml                   |   5 -
 .gitlab-ci.d/crossbuilds.yml                  |  14 --
 .gitlab-ci.d/custom-runners.yml               |   4 +-
 ...4-aarch32.yml => ubuntu-22.04-aarch32.yml} |   6 +-
 ...4-aarch64.yml => ubuntu-22.04-aarch64.yml} |  38 ++--
 .gitlab-ci.d/windows.yml                      |   4 +-
 tests/avocado/avocado_qemu/__init__.py        |   2 +-
 tests/avocado/machine_aspeed.py               |  18 ++
 tests/docker/Makefile.include                 |  30 +--
 tests/docker/docker.py                        |  38 +---
 .../dockerfiles/debian-all-test-cross.docker  |  18 +-
 .../dockerfiles/debian-alpha-cross.docker     |  12 +-
 .../dockerfiles/debian-amd64-cross.docker     | 178 ++++++++++++++--
 .../dockerfiles/debian-hexagon-cross.docker   |  13 +-
 .../dockerfiles/debian-hppa-cross.docker      |  12 +-
 .../dockerfiles/debian-loongarch-cross.docker |   8 +-
 .../dockerfiles/debian-m68k-cross.docker      |  12 +-
 .../dockerfiles/debian-mips-cross.docker      |  40 +---
 .../dockerfiles/debian-mips64-cross.docker    |  12 +-
 .../debian-powerpc-test-cross.docker          |  12 +-
 .../debian-riscv64-test-cross.docker          |  10 +-
 .../dockerfiles/debian-sh4-cross.docker       |  12 +-
 .../dockerfiles/debian-sparc64-cross.docker   |  12 +-
 .../dockerfiles/debian-toolchain.docker       |   5 +-
 tests/docker/dockerfiles/debian10.docker      |  38 ----
 tests/docker/dockerfiles/debian11.docker      |  18 --
 tests/docker/dockerfiles/opensuse-leap.docker |   2 +-
 tests/docker/dockerfiles/ubuntu2004.docker    |   2 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/refresh                         |   7 +
 tests/vm/Makefile.include                     |   3 +-
 tests/vm/fedora                               | 190 ------------------
 39 files changed, 346 insertions(+), 469 deletions(-)
 rename .gitlab-ci.d/custom-runners/{ubuntu-20.04-aarch32.yml => ubuntu-22.04-aarch32.yml} (86%)
 rename .gitlab-ci.d/custom-runners/{ubuntu-20.04-aarch64.yml => ubuntu-22.04-aarch64.yml} (82%)
 delete mode 100644 tests/docker/dockerfiles/debian10.docker
 delete mode 100644 tests/docker/dockerfiles/debian11.docker
 delete mode 100755 tests/vm/fedora

-- 
2.30.2


