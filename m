Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B354B508F85
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:34:29 +0200 (CEST)
Received: from localhost ([::1]:45220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhF9o-00033k-Qm
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEkp-0001gr-Ih
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:39 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:37402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEkn-0001YI-EK
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:39 -0400
Received: by mail-ed1-x530.google.com with SMTP id f17so3366321edt.4
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nHF7k0xV6pYUIfEcfVhnnZXUU0ZjKbHLTk6JggLV1fU=;
 b=C/Crnth1EOMTX/vxGTNYwlw7hrA711rYnfDBvbMILwYvqrFFL3gAb43rn5oKpXJxHa
 eoKjrvjm1TVMXlRHhIaiYJ19UQPSCMyOv7tNCRkNtFjfZ70WpEuK0C7njKU/C5Z5B9so
 EFMhUUlE6EUm1DzUEBrzVlBZ3x8JGCWOzAxX7ZkStXOq8bp4r01fIKhCRB033vr6QS3r
 WWtTJnanHkF5UZDPjVX6/YGDtUNFoIPRKk6vpWfDKXnI/nZlyRRQt1nIJxA/CZbs/Ea0
 iSCK1ORVRRHP7KTn4DqB8rkl1MshrgDRUpLJ2qiCn5vLVODvMK5b/vhuudUuBYXWzdyw
 c5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nHF7k0xV6pYUIfEcfVhnnZXUU0ZjKbHLTk6JggLV1fU=;
 b=LSxy/MaRAWjKt55+r9MjDLXO9m74PQ9N6RsFde3GbvttBUF/d1e8ZElRNVfV8W8Jqx
 DSbtwKYEyAv8WuUbVqi/SGcu2pA7icbJm0tzOH92czrUSEDJNFlQBLZorvZcfebqMEkW
 0c/w3rlzlBrbpnN0OTlV4M49fwHcpjEsgM9PwarTj3/+fDBee87vJL0JQUpxOy9D+JXk
 mQX+uRV0i2SPDg2QpjqH4g9t2Ee7UAaquEkup5t0gtXPMktOuSJKF5OMVr9Eh/k6KFvM
 99LWzpJA2rgOq+pQnQa8XAYLtY9ghqe7pUoXvxti440otKDfai6L0Kwkpp4GsgYyQvDz
 pX9Q==
X-Gm-Message-State: AOAM530w1SaF2AVKx410bflZLW36oxBT8ErYZEPfGPTOgimfYcAffQlK
 uiLVbvYffgdNpivbL8B5keQOhg==
X-Google-Smtp-Source: ABdhPJwyQKIpvrzBlkALWBLi/aHvAAfLu7pzz1vcLHbhMQErVVtPX8qEouRZHgrx5KxmYafFPgVsxg==
X-Received: by 2002:aa7:d602:0:b0:41d:78e2:655d with SMTP id
 c2-20020aa7d602000000b0041d78e2655dmr24519192edr.388.1650478115944; 
 Wed, 20 Apr 2022 11:08:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a056402194100b00416b174987asm10638467edz.35.2022.04.20.11.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:08:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4C2AB1FFB7;
 Wed, 20 Apr 2022 19:08:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 00/25] Various testing, doc and gdbstub fixes
Date: Wed, 20 Apr 2022 19:08:07 +0100
Message-Id: <20220420180832.3812543-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 1be5a765c08cee3a9587c8a8d3fc2ea247b13f9c:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-04-19 18:22:16 -0700)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-fixes-for-7.1-200422-1

for you to fetch changes up to caccf599181e2ea5f236345de9d9957a4c23e5ec:

  tests/guest-debug: better handle gdb crashes (2022-04-20 16:04:20 +0100)

----------------------------------------------------------------
Testing, docs and gdbstub updates:

  - make -M virt test exercise -cpu max
  - document how binfmt_misc docker works
  - clean-up the devel TOC generation
  - clean-up check-tcg cross-compile behaviour
  - fix byte swap error in xmm gdbstub access
  - add float_convd test with reference files
  - more reference files for float_convs
  - more cleanly handle gdb crashing during check-tcg

----------------------------------------------------------------
Alex Bennée (8):
      tests/avocado: update aarch64_virt test to exercise -cpu max
      docs/devel: add some notes on the binfmt-image-debian targets
      docs/devel: drop :hidden: and :includehidden: tags
      tests/tcg: remove duplicate sha512-sse case
      tests/tcg: add float_convd test
      tests/tcg: add missing reference files for float_convs
      target/i386: fix byte swap issue with XMM register access
      tests/guest-debug: better handle gdb crashes

Paolo Bonzini (17):
      tests/docker: remove dead code for linux-user containers
      tests/docker: remove test targets
      tests/docker: remove dead variable
      tests/docker: remove unnecessary default definitions
      tests/docker: inline variable definitions or move close to use
      tests/docker: remove unnecessary filtering of $(DOCKER_IMAGES)
      tests/docker: simplify docker-TEST@IMAGE targets
      tests/docker: do not duplicate rules for hexagon-cross
      tests/tcg: add compiler test variables when using containers
      tests/tcg: remove CONFIG_LINUX_USER from config-target.mak
      tests/tcg: remove CONFIG_USER_ONLY from config-target.mak
      tests/tcg: prepare Makefile.prereqs at configure time
      tests/tcg: list test targets in Makefile.prereqs
      tests/tcg: invoke Makefile.target directly from QEMU's makefile
      tests/tcg: isolate from QEMU's config-host.mak
      tests/docker: remove SKIP_DOCKER_BUILD
      tests/tcg: fix non-static build

 docs/devel/index-api.rst                           |   1 -
 docs/devel/index-build.rst                         |   3 +-
 docs/devel/index-internals.rst                     |   1 -
 docs/devel/index-process.rst                       |   1 -
 docs/devel/index-tcg.rst                           |   1 -
 docs/devel/index.rst                               |   2 -
 docs/devel/qtest.rst                               |   1 -
 docs/devel/testing.rst                             |  38 +
 configure                                          |   3 +-
 target/i386/gdbstub.c                              |   4 +-
 tests/tcg/multiarch/float_convd.c                  | 106 +++
 MAINTAINERS                                        |   1 +
 tests/Makefile.include                             |  63 +-
 tests/avocado/boot_linux_console.py                |  25 -
 tests/avocado/machine_aarch64_virt.py              |  51 ++
 tests/docker/Makefile.include                      | 115 +--
 tests/docker/docker.py                             |  57 --
 .../build-toolchain.sh                             |   0
 tests/docker/dockerfiles/empty.docker              |   8 -
 tests/guest-debug/run-test.py                      |  11 +-
 tests/tcg/Makefile.prereqs                         |  18 -
 tests/tcg/Makefile.qemu                            | 121 ---
 tests/tcg/Makefile.target                          |  14 +-
 tests/tcg/aarch64/Makefile.softmmu-target          |   2 +-
 tests/tcg/aarch64/Makefile.target                  |  10 +-
 tests/tcg/aarch64/float_convd.ref                  | 988 +++++++++++++++++++++
 tests/tcg/arm/float_convd.ref                      | 988 +++++++++++++++++++++
 tests/tcg/configure.sh                             |  78 +-
 tests/tcg/i386/Makefile.target                     |   2 +-
 tests/tcg/i386/float_convd.conf                    | 988 +++++++++++++++++++++
 tests/tcg/i386/float_convs.ref                     | 748 ++++++++++++++++
 tests/tcg/multiarch/Makefile.target                |   2 +-
 tests/tcg/ppc64/Makefile.target                    |   4 +-
 tests/tcg/ppc64le/Makefile.target                  |   4 +-
 tests/tcg/x86_64/Makefile.target                   |   9 +-
 tests/tcg/x86_64/float_convd.ref                   | 988 +++++++++++++++++++++
 tests/tcg/x86_64/float_convs.ref                   | 748 ++++++++++++++++
 37 files changed, 5780 insertions(+), 424 deletions(-)
 create mode 100644 tests/tcg/multiarch/float_convd.c
 create mode 100644 tests/avocado/machine_aarch64_virt.py
 rename tests/docker/dockerfiles/{debian-hexagon-cross.docker.d => debian-hexagon-cross.d}/build-toolchain.sh (100%)
 delete mode 100644 tests/docker/dockerfiles/empty.docker
 delete mode 100644 tests/tcg/Makefile.prereqs
 delete mode 100644 tests/tcg/Makefile.qemu
 create mode 100644 tests/tcg/aarch64/float_convd.ref
 create mode 100644 tests/tcg/arm/float_convd.ref
 create mode 100644 tests/tcg/i386/float_convd.conf
 create mode 100644 tests/tcg/i386/float_convs.ref
 create mode 100644 tests/tcg/x86_64/float_convd.ref
 create mode 100644 tests/tcg/x86_64/float_convs.ref

-- 
2.30.2


