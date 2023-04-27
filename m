Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD816F0896
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:46:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3oJ-0001tE-MN; Thu, 27 Apr 2023 11:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o4-0001oE-6t
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:16 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o1-0004id-Ss
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:15 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1cfed93e2so59817005e9.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610311; x=1685202311;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rlx55qk+9by3ULJ9I6Ok7FhVZzME2jTmRDTZhF1yTEk=;
 b=dasRU2sfV8JHhy4EkMV1qrPxRSonN08kyYrKj+wabtaOBPh55mgiI63sqLnf6sdp4I
 b+292wN15WZYLtW0kiHYwubqlyu7gOCXoxttoxDbSnKjlups5ivkVnYLbPrPhEO4f/l4
 KhUZHqNNWqdjmneoDOqsQVuCC3a2YbScrvgD3LXsAynJtJPQSL2LYBtPmIK/4w5xpPbK
 D1zN+t66hX+vkQQ2u0gx+4OaPq3fsJO6XGitjHzrEgjogavYBM77SVPa4epcoU8EiWTE
 Fb6yr/zGnw4fHnmQSQifgbwzV2HTdZovQZI4PFQoDZRIFPfHS3swdS64yZgGrx9S0AdS
 rvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610311; x=1685202311;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rlx55qk+9by3ULJ9I6Ok7FhVZzME2jTmRDTZhF1yTEk=;
 b=FhNQHzdOh82DzclFhlRyciRPjQxjx5TFphYHoKcu55UGCcekNN07O8wqvW46+breeu
 5Kfk4malhO3VG8FjJlU/MkhdtqQgg3dTccXpROEmCAuu2+x2oVmcNBNDcemjQlc+TNi2
 cIi3aR8aFHHas5tbtZ7RZlLIz5jJN/LgHA6hcIqI+YO8wp4WtffOFzUIk2lfPEyrCB/e
 bekaZ4QGViscxI+W13+sQfzTot+S/1aTIzOGr3iAtSlQk4ChxjZzA7rLe4OgT6ZAt//5
 1uWLN5fZSOAHiH++t/eMFqcmI39i0e88A8sjzi8zCwCysuIO3KE1urOIGckRoAS/iHcc
 TUiQ==
X-Gm-Message-State: AC+VfDztVjDtNNkLR00/PkUvblsBk/L6naSc5jo42e0umJfDpNXjyIK9
 RGL1hB2Y99JNbseO9gq0XZ8zf9CCVlpaVKkzmVs=
X-Google-Smtp-Source: ACHHUZ6PacCPxl+sWE+VBRSsnJUxeWHVTeFEWQGa9c/8KpctM3CsF8aCs0W+WCP/CYRu2YZ3cWge4A==
X-Received: by 2002:a05:600c:2248:b0:3f1:6fb4:44cf with SMTP id
 a8-20020a05600c224800b003f16fb444cfmr1813121wmm.28.1682610311658; 
 Thu, 27 Apr 2023 08:45:11 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c16d400b003f19bca8f03sm14954235wmn.43.2023.04.27.08.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:45:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B3BF21FFB7;
 Thu, 27 Apr 2023 16:45:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 00/18] testing and doc updates
Date: Thu, 27 Apr 2023 16:44:52 +0100
Message-Id: <20230427154510.1791273-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 1eb95e1baef852d0971a1dd62a3293cd68f1ec35:

  Merge tag 'migration-20230426-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-04-27 10:47:14 +0100)

are available in the Git repository at:

  https://gitlab.com/stsquad/qemu.git tags/pull-testing-docs-270423-1

for you to fetch changes up to ef46ae67ba9a785cf0cce58b5fc5a36ed3c6c7b9:

  docs/style: call out the use of GUARD macros (2023-04-27 14:58:51 +0100)

----------------------------------------------------------------
Testing and documentation updates:

  - bump avocado to 101.0
  - use snapshots for tuxrun baseline tests
  - add sbda-ref test to avocado
  - avoid spurious re-configure in gitlab
  - better description of blockdev options
  - drop FreeBSD 12 from Cirrus CI
  - fix up the ast2[56]00 tests to be more stable
  - improve coverage of ppc64 tests in tuxrun baselines
  - limit plugin tests to just the generic multiarch binaries

----------------------------------------------------------------
Alex Bennée (7):
      tests/avocado: use the new snapshots for testing
      qemu-options: finesse the recommendations around -blockdev
      tests/tcg: limit the scope of the plugin tests
      docs/system: remove excessive punctuation from guest-loader docs
      docs/devel: make a statement about includes
      docs/devel: mention the spacing requirement for QOM
      docs/style: call out the use of GUARD macros

Kautuk Consul (3):
      tests/requirements.txt: bump up avocado-framework version to 101.0
      avocado_qemu/__init__.py: factor out the qemu-img finding
      tests/avocado/tuxrun_baselines.py: improve code coverage for ppc64

Philippe Mathieu-Daudé (1):
      tests/avocado: Add set of boot tests on SBSA-ref

Thomas Huth (6):
      gitlab-ci: Avoid to re-run "configure" in the device-crash-test jobs
      scripts/device-crash-test: Add a parameter to run with TCG only
      .gitlab-ci.d/cirrus: Drop the CI job for compiling with FreeBSD 12
      tests/avocado: Make ssh_command_output_contains() globally available
      tests/avocado/machine_aspeed: Fix the broken ast2[56]00_evb_sdk tests
      MAINTAINERS: Cover tests/avocado/machine_aspeed.py

Yohei Kojima (1):
      qemu-options.hx: Update descriptions of memory options for NUMA node

 MAINTAINERS                               |   3 +-
 docs/devel/qom.rst                        |   2 +
 docs/devel/style.rst                      | 105 ++++++++++++++
 docs/system/guest-loader.rst              |   6 +-
 .gitlab-ci.d/buildtest.yml                |   6 +-
 .gitlab-ci.d/cirrus.yml                   |  13 --
 .gitlab-ci.d/cirrus/freebsd-12.vars       |  16 ---
 qemu-options.hx                           |  49 +++++--
 scripts/device-crash-test                 |   4 +-
 tests/Makefile.include                    |  18 ++-
 tests/avocado/avocado_qemu/__init__.py    |  35 +++--
 tests/avocado/linux_ssh_mips_malta.py     |   8 --
 tests/avocado/machine_aarch64_sbsaref.py  | 158 ++++++++++++++++++++
 tests/avocado/machine_aspeed.py           |  30 ++--
 tests/avocado/tuxrun_baselines.py         | 232 ++++++++++++++++++++++++++----
 tests/lcitool/refresh                     |   1 -
 tests/requirements.txt                    |   2 +-
 tests/tcg/Makefile.target                 |  10 +-
 tests/tcg/aarch64/Makefile.softmmu-target |   2 -
 tests/tcg/aarch64/Makefile.target         |   1 -
 tests/tcg/arm/Makefile.softmmu-target     |   4 +-
 tests/tcg/arm/Makefile.target             |   8 --
 tests/tcg/cris/Makefile.target            |   3 +
 tests/tcg/hppa/Makefile.target            |   2 -
 tests/tcg/i386/Makefile.target            |  10 --
 tests/tcg/ppc64/Makefile.target           |   2 -
 tests/tcg/riscv64/Makefile.softmmu-target |   3 +
 tests/tcg/riscv64/Makefile.target         |   1 -
 tests/tcg/s390x/Makefile.softmmu-target   |   3 +
 tests/tcg/tricore/Makefile.softmmu-target |   3 +
 tests/tcg/xtensa/Makefile.softmmu-target  |   3 +
 31 files changed, 596 insertions(+), 147 deletions(-)
 delete mode 100644 .gitlab-ci.d/cirrus/freebsd-12.vars
 create mode 100644 tests/avocado/machine_aarch64_sbsaref.py

-- 
2.39.2


