Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A6962E30F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:30:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovieD-0006OD-54; Thu, 17 Nov 2022 12:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovie2-0006KV-Bg
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:47 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovids-0006Dl-A8
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:42 -0500
Received: by mail-wr1-x431.google.com with SMTP id g2so1316501wrv.6
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 09:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RsODjKuwVQbvJ2TTNby8KuqYhcq7tnWg6EN/Adlr8/Q=;
 b=Ky6lb6eHCFetprWmJ4nyC7h295eapXBSSOUDo10DhXA1sqZ0wzD20GEpX9EbH47O7r
 0SN8JSt2G1qUPJYNx2sq2dArwNmjL8Q8l9oLezOt7nN3jtvC56x1mGxiN2ReiQlv/9Q2
 zW3msiZffz0w78vkfiTF0+4QQMgZ241KA0xBWPksOu1HuVVzk6vJxzt6Yz0D5lIiE5pT
 /3wvalG3JeNwX+9ksa/1yve02GACA/vFIss707aTA0u0pfGeKOkcgih7CbFgWqNFqnY0
 RYEV1/QuKuICCNAasyRXz3+ea/DpShJOqFze1ONGfRZf2uXq3elO7sP4hb7san4vCYUd
 8AdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RsODjKuwVQbvJ2TTNby8KuqYhcq7tnWg6EN/Adlr8/Q=;
 b=u1tqSf56K7HXAiYQu7jwZHt3tHypsYywwYtSdSkZkKwQ/KAdvikW3xVMj13ql2HH48
 0Kc23fhQ8TFFpigjiy5w8fHcUfMpNFP+/TZJAkxwROMtzwuuI1UYWQITw8ZDKW1EIRjI
 Y1Al1/TNaFj1rjrV6OK5QmH6x+ieV+vafXT37wIQqH7PzzuqIau6Z7E+3vHDfYhcO8TB
 9GV2rMkmYQmU+/YciTS7288frQT30MkKkLfBDJwZLBOMaLTvbbnaQagEUeLKIniQPPiu
 fb8BckjoMT03yRlwp6MwXlbWqohUGChoE5gFyZtiIdwhPihHYm6z4lK5FEtU5t0Iro/N
 PxNg==
X-Gm-Message-State: ANoB5pnmH/ObDUAo7NzYrYXbw3C9O8kd+QYOgBiVuCgzwNl13b3kBovA
 2mGr9SQuOlv8GtY/kwVmp5Weng==
X-Google-Smtp-Source: AA0mqf7iOof+iuwaHEjbXLz/4QqG42iGfuDAueUhodHKyNOhhPP8FrOLDrUqRNCoMSumfZDCjfhWFg==
X-Received: by 2002:adf:f74d:0:b0:236:4e3c:7720 with SMTP id
 z13-20020adff74d000000b002364e3c7720mr2107914wrp.674.1668705934919; 
 Thu, 17 Nov 2022 09:25:34 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t11-20020adff60b000000b0022e035a4e93sm1475023wrp.87.2022.11.17.09.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 09:25:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D17F51FFB7;
 Thu, 17 Nov 2022 17:25:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 7.2 v3 00/13] testing and doc updates (pre-PR)
Date: Thu, 17 Nov 2022 17:25:19 +0000
Message-Id: <20221117172532.538149-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This contains my last set of fixes which didn't make it in the last
pull request I sent. I've dropped the console peek patch which
unearthed a number of additional tests which can't handle even the
smallest delay in avocado draining the console chardev. As a result we
still occasionally miss login prompts but the rest of the tests are
more stable.

New in this iteration:

  - more bumping of timeouts
  - disable the tcg virt tests in CI in favour of a new alpine based one
  - cirrus updates for macos

The following need review:

 - gitlab: integrate coverage report (1 acks, 1 sobs)
 - tests/avocado: skip aarch64 cloud TCG tests in CI
 - tests/avocado: introduce alpine virt test for CI

Alex Bennée (8):
  tests/docker: allow user to override check target
  docs/devel: add a maintainers section to development process
  docs/devel: make language a little less code centric
  docs/devel: simplify the minimal checklist
  docs/devel: try and improve the language around patch review
  tests/avocado: introduce alpine virt test for CI
  tests/avocado: skip aarch64 cloud TCG tests in CI
  gitlab: integrate coverage report

Cédric Le Goater (1):
  tests/avocado/machine_aspeed.py: Reduce noise on the console for SDK
    tests

Daniel P. Berrangé (1):
  ci: replace x86_64 macos-11 with aarch64 macos-12

Peter Maydell (2):
  tests/avocado: Raise timeout for
    boot_linux.py:BootLinuxPPC64.test_pseries_tcg
  tests/avocado/boot_linux.py: Bump aarch64 virt test timeout to 720s

Stefan Weil (1):
  Run docker probe only if docker or podman are available

 docs/devel/code-of-conduct.rst                |   2 +
 docs/devel/index-process.rst                  |   1 +
 docs/devel/maintainers.rst                    | 106 ++++++++++++++++++
 docs/devel/submitting-a-patch.rst             | 101 +++++++++++------
 docs/devel/submitting-a-pull-request.rst      |  12 +-
 configure                                     |   2 +-
 .gitlab-ci.d/buildtest.yml                    |  12 +-
 .gitlab-ci.d/cirrus.yml                       |  12 +-
 .../cirrus/{macos-11.vars => macos-12.vars}   |  12 +-
 tests/avocado/boot_linux.py                   |  13 ++-
 tests/avocado/machine_aarch64_virt.py         |  46 +++++++-
 tests/avocado/machine_aspeed.py               |  17 ++-
 tests/docker/Makefile.include                 |   2 +
 tests/docker/common.rc                        |   6 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/refresh                         |   2 +-
 16 files changed, 275 insertions(+), 73 deletions(-)
 create mode 100644 docs/devel/maintainers.rst
 rename .gitlab-ci.d/cirrus/{macos-11.vars => macos-12.vars} (74%)

-- 
2.34.1


