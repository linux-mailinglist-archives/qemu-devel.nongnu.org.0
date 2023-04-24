Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537B46EC8B4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:23:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsPS-00075b-Dz; Mon, 24 Apr 2023 05:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPQ-00072t-3G
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:22:56 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPM-0004k7-Bm
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:22:55 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so27504155e9.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328171; x=1684920171;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uzHHwwTA3hmrtSIwwqnu0eAhXH84uDjdP+zsHl3COXA=;
 b=bvbXDDLovJviJzHl/9jZ82cs6m296XzjTx+YN8KGYvzFXZPeGkshuXDrl9KoGucWut
 6AKAaVgu2FJgGuT6Hrqh6Z6o/sITaVa5/Dks4loVE5yn2T660ZTdgVxjaV9Fc6sofcCp
 JFhxHFfMOzNzPt1NeXf9vIb0SyawRbuMupoWR1GG/5ZPn35PJ2rMhEvh5EBJsQNfLR/F
 98wFVqqFZ30i9P9+gGieX06LU1fz6B46M/rSyhbTMS+oEWZLpAblMzZW8pqOUf9/nGBx
 b61yiNF+z7tqTsWo0Tf7ydiAqdezg9qubeFJYiHmlopE8XRHr/r95zFWkHC4Lmsrk5ZV
 o+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328171; x=1684920171;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uzHHwwTA3hmrtSIwwqnu0eAhXH84uDjdP+zsHl3COXA=;
 b=lpzO6o6CU2d6QRZaFObnfxZhUNhFO9HJwAS6O8rWf689SQF84/8m3iX84LlkPB1pV9
 A7s1z3ODrxcIu377e+enIlMvgJTwm3Zn1IXqKCBg9HM9vEM3XjDrNbZCm8fNyOnzTB3l
 k0TKJ+Q0DWUA3JS/j2la+wWzx91pWPACc/973v1iFYiUp2DmSzwjXP7YjttOiDeeU4GC
 0B+uREeseDHNOo+wXa/XwCKJQGQSw54ng46ZgtSMIs4qM6IWB6cp+R3ZlzLhMv6EC6qb
 DrcA15EqwoOuUDketm21GNATv0DjDZpvXs9cDuJ37FLThZ/m8gmqY5dy91Iz83PgvrAa
 p+xw==
X-Gm-Message-State: AAQBX9fjNCs02uopYI/8yO216MbDqjAqfkfk3BZXlf6ifWKEUx6JYuX2
 LEeFBVqQm9A7WE7OCUG0vhHluQ==
X-Google-Smtp-Source: AKy350a8UgbFQzOxLLDJSisQTcSjBgTuNiiDEjiNR6Fyz4h5UcTDG/WnEMauinmv/v+bgfZvVwYX5w==
X-Received: by 2002:a1c:7211:0:b0:3f1:71d2:da3a with SMTP id
 n17-20020a1c7211000000b003f171d2da3amr7140332wmc.30.1682328170890; 
 Mon, 24 Apr 2023 02:22:50 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1c7902000000b003f193d7c6b7sm8205254wme.41.2023.04.24.02.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:22:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A0FF1FFB7;
 Mon, 24 Apr 2023 10:22:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 00/18] testing/next: avocado, docs (pre-PR)
Date: Mon, 24 Apr 2023 10:22:31 +0100
Message-Id: <20230424092249.58552-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

This is my pre-PR tree for the current state of testing/next and the
various documentation patches that haven't been picked up by others.
I'll look to send the PR later in the week.

The following patches still need review:

  tests/tcg: limit the scope of the plugin tests (1 acks, 1 sobs, 0 tbs)
  tests/avocado: use the new snapshots for testing

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
 docs/devel/style.rst                      | 108 ++++++++++
 docs/system/guest-loader.rst              |   6 +-
 .gitlab-ci.d/buildtest.yml                |   6 +-
 .gitlab-ci.d/cirrus.yml                   |  13 --
 .gitlab-ci.d/cirrus/freebsd-12.vars       |  16 --
 qemu-options.hx                           |  49 ++++-
 scripts/device-crash-test                 |   4 +-
 tests/Makefile.include                    |  18 +-
 tests/avocado/avocado_qemu/__init__.py    |  35 +++-
 tests/avocado/linux_ssh_mips_malta.py     |   8 -
 tests/avocado/machine_aarch64_sbsaref.py  | 158 +++++++++++++++
 tests/avocado/machine_aspeed.py           |  30 +--
 tests/avocado/tuxrun_baselines.py         | 232 +++++++++++++++++++---
 tests/lcitool/refresh                     |   1 -
 tests/requirements.txt                    |   2 +-
 tests/tcg/Makefile.target                 |  10 +-
 tests/tcg/aarch64/Makefile.softmmu-target |   2 -
 tests/tcg/aarch64/Makefile.target         |   1 -
 tests/tcg/arm/Makefile.softmmu-target     |   4 +-
 tests/tcg/arm/Makefile.target             |   8 -
 tests/tcg/cris/Makefile.target            |   3 +
 tests/tcg/hppa/Makefile.target            |   2 -
 tests/tcg/i386/Makefile.target            |  10 -
 tests/tcg/ppc64/Makefile.target           |   2 -
 tests/tcg/riscv64/Makefile.softmmu-target |   3 +
 tests/tcg/riscv64/Makefile.target         |   1 -
 tests/tcg/s390x/Makefile.softmmu-target   |   3 +
 tests/tcg/tricore/Makefile.softmmu-target |   3 +
 tests/tcg/xtensa/Makefile.softmmu-target  |   3 +
 31 files changed, 599 insertions(+), 147 deletions(-)
 delete mode 100644 .gitlab-ci.d/cirrus/freebsd-12.vars
 create mode 100644 tests/avocado/machine_aarch64_sbsaref.py

-- 
2.39.2


