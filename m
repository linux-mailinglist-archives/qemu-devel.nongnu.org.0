Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31FD4C4D3C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 19:05:34 +0100 (CET)
Received: from localhost ([::1]:40154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeyD-0002OV-Kp
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 13:05:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGk-0003ln-9N
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:38 -0500
Received: from [2a00:1450:4864:20::529] (port=33479
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGf-0002Kt-Ta
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:36 -0500
Received: by mail-ed1-x529.google.com with SMTP id s14so8411030edw.0
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hc9848VzR+Si4ipzOwpZ6wOlLCqLImw6mENrIpFzBek=;
 b=F+Xl04PxnfZldjoLiGzFc31C/sw323wnoN1LQA3HvQICSJA/Tr3HJNUIknB3Kk/I4p
 Z7u0VE+gxlUriWd90xR70mpLWA4esgfjDKrLojnez2agS2SqhOk0lwFskV22v63OmlqH
 DkpQImbN9nJ3gnNy8iyOvSfWCwN78m5XoG9xtLl1ZMFjqN4ARviwzxYVRLYy5HXJP+Rq
 cQOR1ce8CS82+jyLmkk84x1lBJ7omGizKElZjD0V8RNqb/YaAeP6li/eVfG6DgN3vI3U
 ZapTYLS3t4JKxsBbrgjz3TfotbmjtWLNXgU51X4C75THB1KxaxSJwAix6uKW73qv4x5+
 Nwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hc9848VzR+Si4ipzOwpZ6wOlLCqLImw6mENrIpFzBek=;
 b=6xaf4RGfPFUVhs7F0Ze9EVF8TdJVqx/1V5TFJLkHUkjiBO7qCeaxRMDU6PYsH7Eyd0
 Y43YoDSRLA4jYfoh7G1IdsUKJKXyGxD7t+ek5YXAx1mYJFNsfn/5pzMQRpH2s1TsE5F4
 8PK/QcmqUHB+bbJPGknPp4I9Xk/JTw3HYQbRPC2M/XGStKP1Fcxtcm9MwbLw4wWfdlzH
 HRHu1QkejhWkaXHtdMfPhF6Xrt6ETc2FmySzwbvLRN66fd3uX5uAPJ8TRQe0Eo9Ly0QF
 noBHeTlan1uSQpmKO1ROieTTQxkyyr5uvzrNzZbldR2U0g+XRY6536u7eDkZlZm2XJDX
 QXZg==
X-Gm-Message-State: AOAM531g/o5kAs+6XHe/uAjkC9I8ssGe46wkgm8+hoQ0Xdxx0SzE6++R
 JJMm8EyKnnhD0h08vc41lXfIAg==
X-Google-Smtp-Source: ABdhPJxPReNGhy+Fbr2X+SyM/J+wyoTmWvviqTNf/HWSBoSh7XEthoO0eQWDC3zA0Altaxe4RYmcRg==
X-Received: by 2002:a05:6402:2805:b0:405:f6a8:f74 with SMTP id
 h5-20020a056402280500b00405f6a80f74mr7997981ede.241.1645809624502; 
 Fri, 25 Feb 2022 09:20:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a170906688a00b006ce29973bafsm1220217ejr.211.2022.02.25.09.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:20:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F217D1FFB7;
 Fri, 25 Feb 2022 17:20:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 00/18] testing and semihosting pre-PR
Date: Fri, 25 Feb 2022 17:20:03 +0000
Message-Id: <20220225172021.3493923-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, berrange@redhat.com, sw@weilnetz.de,
 richard.henderson@linaro.org, f4bug@amsat.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is the current state of my testing and semihosting trees which I
intend to generate a PR for next week. I'd like to have a clean plate
by the time we hit softfreeze. I'll probably have to drop the sha512 vector
test patches as they break TCI unless someone can figure out what is
going wrong.

The following patches still need review:

 - tests/tcg: completely disable threadcount for sh4
 - tests/tcg: add sha512 test
 - tests/tcg/ppc64: clean-up handling of byte-reverse
 - gitlab: add a new aarch32 custom runner definition
 - scripts/ci: allow for a secondary runner
 - scripts/ci: add build env rules for aarch32 on aarch64
 - tests/docker: update debian-s390x-cross with lcitool
 - tests/lcitool: update to latest version
 - tests/docker: restore TESTS/IMAGES filtering

Alex Bennée (17):
  tests/docker: restore TESTS/IMAGES filtering
  tests/docker: add NOUSER for alpine image
  tests/lcitool: update to latest version
  tests/docker: update debian-arm64-cross with lci-tool
  tests/docker: update debian-s390x-cross with lcitool
  tests/docker: introduce debian-riscv64-test-cross
  scripts/ci: add build env rules for aarch32 on aarch64
  scripts/ci: allow for a secondary runner
  gitlab: add a new aarch32 custom runner definition
  tests/tcg/ppc64: clean-up handling of byte-reverse
  tests/tcg: build sha1-vector with O3 and compare
  tests/tcg: add sha512 test
  tests/tcg: add vectorised sha512 versions
  gitlab: upgrade the job definition for s390x to 20.04
  tests/tcg: completely disable threadcount for sh4
  semihosting/arm-compat: replace heuristic for softmmu SYS_HEAPINFO
  tests/tcg: port SYS_HEAPINFO to a system test

Thomas Huth (1):
  travis.yml: Update the s390x jobs to Ubuntu Focal

 docs/devel/ci-jobs.rst.inc                    |   7 +
 include/hw/loader.h                           |  14 +
 hw/core/loader.c                              |  86 ++
 semihosting/arm-compat-semi.c                 | 124 +--
 tests/tcg/aarch64/system/semiheap.c           |  93 ++
 tests/tcg/multiarch/sha512.c                  | 990 ++++++++++++++++++
 .gitlab-ci.d/container-cross.yml              |  20 +-
 .gitlab-ci.d/custom-runners.yml               |   2 +-
 ...18.04-s390x.yml => ubuntu-20.04-s390x.yml} |  28 +-
 .../custom-runners/ubuntu-20.40-aarch32.yml   |  23 +
 .travis.yml                                   |  12 +-
 MAINTAINERS                                   |   1 +
 scripts/ci/setup/build-environment.yml        |  25 +
 scripts/ci/setup/gitlab-runner.yml            |  38 +
 tests/docker/Makefile.include                 |  29 +-
 .../dockerfiles/debian-arm64-cross.docker     | 186 +++-
 .../debian-arm64-test-cross.docker            |  13 -
 .../debian-riscv64-test-cross.docker          |  12 +
 .../dockerfiles/debian-s390x-cross.docker     | 181 +++-
 tests/docker/dockerfiles/opensuse-leap.docker |   3 +-
 tests/docker/dockerfiles/ubuntu1804.docker    |   3 +-
 tests/docker/dockerfiles/ubuntu2004.docker    |   3 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/refresh                         |  16 +
 tests/tcg/aarch64/Makefile.target             |  17 +
 tests/tcg/arm/Makefile.target                 |  17 +
 tests/tcg/configure.sh                        |   4 +-
 tests/tcg/i386/Makefile.target                |   6 +
 tests/tcg/ppc64/Makefile.target               |  20 +-
 tests/tcg/ppc64le/Makefile.target             |   9 +-
 tests/tcg/s390x/Makefile.target               |   9 +
 tests/tcg/sh4/Makefile.target                 |   2 +
 tests/tcg/x86_64/Makefile.target              |   7 +
 33 files changed, 1813 insertions(+), 189 deletions(-)
 create mode 100644 tests/tcg/aarch64/system/semiheap.c
 create mode 100644 tests/tcg/multiarch/sha512.c
 rename .gitlab-ci.d/custom-runners/{ubuntu-18.04-s390x.yml => ubuntu-20.04-s390x.yml} (87%)
 create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
 delete mode 100644 tests/docker/dockerfiles/debian-arm64-test-cross.docker
 create mode 100644 tests/docker/dockerfiles/debian-riscv64-test-cross.docker

-- 
2.30.2


