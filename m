Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF3645376B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:28:47 +0100 (CET)
Received: from localhost ([::1]:43580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1KA-0007LL-2m
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:28:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mn1Gq-0004PH-Li
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:25:20 -0500
Received: from [2a00:1450:4864:20::331] (port=35789
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mn1Go-0004Bk-T2
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:25:20 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so2502826wme.0
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 08:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ixjNhO8g/zyriqLaxA3JcUsmkqQfMG9kRM3m2RfkbcU=;
 b=V5VseUh/DYzrz3w2RN4UvLhLZNHLm1ydrDweVhgtXEYx1fURrkbgtcg85jMJySIKnx
 +Yq8YxZjM48dbJI0toWnsA2ZYyIJxJkXOMP97Fdi6t76fJr1EVjDhwia4esEl0wtYumC
 OUVPlw0ppnvG34DqWLG7973Hll99B5BqoVJFz7kRhSY5ovR+n/QlYCq6CUX9a/25rHXE
 ODp1Dl8Ddg8luCkCU9pAcn+ybLhp4m+qM1YN5daADYiQHriJDMJY8koSsnKNXhowU2Q9
 4AYZjPWfuek9DLK+kKllTirCeIo6hAMG+dfkpbtG9nWrG2E+t/QKDCqKMnMnDwBolssq
 lEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ixjNhO8g/zyriqLaxA3JcUsmkqQfMG9kRM3m2RfkbcU=;
 b=kiXeNCG9j8hPcf0kWb6gWoEiSLS0BwyOpnKaJ1UPNnt+x+2UV6WuCNB+Xsu9jFWblu
 hc4bEB9CgZjeSsnetR7hnk8i9JOKKrh9/23WXU+X2UBWq3kjtIvq10NEHJz4eyYAGeB+
 EVS4LV6chCrEW4MpKxbgqsSoocAzYpsPvF312jfxqygQaxQ8IIyGnzWu8FxxKYdsEWTf
 FZdZhjs2F48TeUaa7dtYWdwbzPP3kluG7zRLtIQSkguYA6dhCZLeTWuq+c0N+aBovPbb
 gePPPtvphti5Vc8hVQnqomTdBs2Gg90cgqQvkCeR4a/6Ealof/7bPt3o/XUBDHi3BqPD
 C1Iw==
X-Gm-Message-State: AOAM531bqoZBqADx4BwR/CxDOl9QsR/QWWvMJTp6VWHurqWKEevmgS5K
 7B9tqN62nOrGfIQEyIJtI3r80Q==
X-Google-Smtp-Source: ABdhPJy5/xp35e8eo31wbcJf1AcY4Gm9ZGYL/vwIR7UgL/sHBzxtIiZ9JYWBd/vVtnGL0jkeUm6nIA==
X-Received: by 2002:a7b:c764:: with SMTP id x4mr71809798wmk.78.1637079916920; 
 Tue, 16 Nov 2021 08:25:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h1sm2943654wmb.7.2021.11.16.08.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:25:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5FFBB1FF96;
 Tue, 16 Nov 2021 16:25:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL for 6.2 0/7] misc build and test fixes
Date: Tue, 16 Nov 2021 16:25:08 +0000
Message-Id: <20211116162515.4100231-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 871c71b1bad2d2647641500603a2236869135c7f:

  Merge tag 'pull-block-2021-11-16' of https://gitlab.com/hreitz/qemu into staging (2021-11-16 14:20:39 +0100)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-for-6.2-161121-1

for you to fetch changes up to 9968de0a4a5470bd7b98dcd2fae5d5269908f16b:

  gitlab: skip cirrus jobs on master and stable branches (2021-11-16 16:19:53 +0000)

----------------------------------------------------------------
Misc build and test fixes:

  - force NOUSER for base docker images
  - don't run TCG VM tests by default
  - remove useless meson test
  - add Centos 8 custom runner
  - split up custom-runners to individual files
  - skip cirrus checks on master/stable branches

----------------------------------------------------------------
Alex Bennée (3):
      tests/docker: force NOUSER=1 for base images
      tests/vm: sort the special variable list
      tests/vm: don't build using TCG by default

Cleber Rosa (1):
      Jobs based on custom runners: add CentOS Stream 8

Daniel P. Berrangé (1):
      gitlab: skip cirrus jobs on master and stable branches

Paolo Bonzini (1):
      meson: remove useless libdl test

Philippe Mathieu-Daudé (1):
      gitlab-ci: Split custom-runners.yml in one file per runner

 docs/devel/ci-jobs.rst.inc                         |   7 +
 meson.build                                        |   8 +-
 .gitlab-ci.d/cirrus.yml                            |   3 +
 .gitlab-ci.d/custom-runners.yml                    | 239 +--------------------
 .../custom-runners/centos-stream-8-x86_64.yml      |  28 +++
 .gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml | 118 ++++++++++
 .../custom-runners/ubuntu-20.04-aarch64.yml        | 118 ++++++++++
 accel/tcg/meson.build                              |   2 +-
 .../ci/org.centos/stream/8/build-environment.yml   |  51 +++++
 scripts/ci/org.centos/stream/8/x86_64/configure    | 208 ++++++++++++++++++
 scripts/ci/org.centos/stream/8/x86_64/test-avocado |  70 ++++++
 scripts/ci/org.centos/stream/README                |  17 ++
 scripts/ci/setup/build-environment.yml             |  38 ++++
 tests/docker/Makefile.include                      |   3 +
 tests/vm/Makefile.include                          |  29 ++-
 15 files changed, 686 insertions(+), 253 deletions(-)
 create mode 100644 .gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
 create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
 create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
 create mode 100644 scripts/ci/org.centos/stream/8/build-environment.yml
 create mode 100755 scripts/ci/org.centos/stream/8/x86_64/configure
 create mode 100755 scripts/ci/org.centos/stream/8/x86_64/test-avocado
 create mode 100644 scripts/ci/org.centos/stream/README

-- 
2.30.2


