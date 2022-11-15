Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D15F629A9E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 14:36:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouw5v-0006Ig-Dy; Tue, 15 Nov 2022 08:35:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouw5N-0006HO-Dx
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:34:45 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouw5L-0004IT-NE
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:34:45 -0500
Received: by mail-wm1-x32b.google.com with SMTP id t4so9662789wmj.5
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 05:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uSjfOFe0wTHGdomtf9beatltRqNEhPusT3iqM1j5UPw=;
 b=bSkVu9nBvHJ5UmF3kjPtZRFxCVb1hx/q/2Wgqnulgz0mSLAKjA3orIlqr3x3xd7jUW
 webMQ6hdei3ehQFxLQqrulJoCiFhMNszykE/bDdDn3qrQaC7zuQkVCmvst7h9tQeWeDk
 iRiT+wzZsFXQOiB0lYp4gymxKcI/ot/0mycIkUevxEQ0pIKSIQTWzMF1r1ffcLeBrzTm
 HKKeC6KVromYnqOxJT9jte3AqkSvkyd+lN09FUas24fhg1kxKjXp4KNP7+Xn25C9tMX0
 ftwT0U7ZAOrTmKXJpW/OQArS0JZxo94qBLHkW6vjSFaxMidWG4j0q5K84FOhCCk0MoUN
 HRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uSjfOFe0wTHGdomtf9beatltRqNEhPusT3iqM1j5UPw=;
 b=Sjr86WxefHOvS/X+w/oXSRXbvGfHHN4s/FLMPQbr6EpQdo6wqkrpvH5JgDmyrZj2Ib
 irYt1MzAFH2NGjhXYPXSwHRZHDWx6Vbos8jarhzjCRe75+dhEYcxnqislO+zqcPmxKWO
 uRTxJaEb2CEsGyWnmsaQAY/pKkS74nUy95QiFGwdkPwLpTSzLRAJXkxkBdjJrY/n/zkD
 HI5QXmHzNK8+nuUfH6W2Hq5A1dzrQM8AMglTD08/GEcKIL3tysZebwYmRDZEMPwageWE
 tuhkEzeoyqPlM32aN4S0aN9ITImLpNU9L/Sw8RPD9kQ94izzFdDE05LICuZCBIh/OsXx
 wBJQ==
X-Gm-Message-State: ANoB5pkhe8piC86vz9N4a+UaFaCp3+UJjmiQe+4FaIgHF9ML2rEIFCE7
 hOrh5fRN/bsTOcrUbHIdimaTjA==
X-Google-Smtp-Source: AA0mqf7EWD183scgZG2r5H0ZLcxr73A7KBlGmNizAbmu3fOsRJujNl2CO8CxE0KTH9U4leQMiOUEyw==
X-Received: by 2002:a1c:7212:0:b0:3cf:5657:4717 with SMTP id
 n18-20020a1c7212000000b003cf56574717mr418588wmc.87.1668519280856; 
 Tue, 15 Nov 2022 05:34:40 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a5d6191000000b0023657e1b980sm12497141wru.53.2022.11.15.05.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:34:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3AD351FFB7;
 Tue, 15 Nov 2022 13:34:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL for 7.2 00/10] testing and doc updates
Date: Tue, 15 Nov 2022 13:34:29 +0000
Message-Id: <20221115133439.2348929-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

The following changes since commit 98f10f0e2613ba1ac2ad3f57a5174014f6dcb03d:

  Merge tag 'pull-target-arm-20221114' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-11-14 13:31:17 -0500)

are available in the Git repository at:

  https://gitlab.com/stsquad/qemu.git tags/pull-misc-for-7.2-151122-2

for you to fetch changes up to 6bac1087ef4c6b190c865384dd69cde683b977bf:

  gitlab: integrate coverage report (2022-11-15 12:21:34 +0000)

----------------------------------------------------------------
Testing and doc updates:

  - Only probe if docker or podman binaries in path
  - tweak avacado console to better find login prompts
  - reduce console noise for aspeed avocado tests
  - update documents on maintainer roles and process
  - raise timeout for ppc64 avocado tests
  - integrate coverage reports into gitlab

----------------------------------------------------------------
Alex Bennée (7):
      tests/avocado: improve behaviour waiting for login prompts
      tests/docker: allow user to override check target
      docs/devel: add a maintainers section to development process
      docs/devel: make language a little less code centric
      docs/devel: simplify the minimal checklist
      docs/devel: try and improve the language around patch review
      gitlab: integrate coverage report

Cédric Le Goater (1):
      tests/avocado/machine_aspeed.py: Reduce noise on the console for SDK tests

Peter Maydell (1):
      tests/avocado: Raise timeout for boot_linux.py:BootLinuxPPC64.test_pseries_tcg

Stefan Weil (1):
      Run docker probe only if docker or podman are available

 docs/devel/code-of-conduct.rst           |   2 +
 docs/devel/index-process.rst             |   1 +
 docs/devel/maintainers.rst               | 106 +++++++++++++++++++++++++++++++
 docs/devel/submitting-a-patch.rst        | 101 ++++++++++++++++++-----------
 docs/devel/submitting-a-pull-request.rst |  12 ++--
 configure                                |   2 +-
 .gitlab-ci.d/buildtest.yml               |  12 +++-
 tests/avocado/avocado_qemu/__init__.py   |  90 +++++++++++++++++++++++++-
 tests/avocado/boot_linux.py              |   2 +-
 tests/avocado/machine_aspeed.py          |  17 +++--
 tests/docker/Makefile.include            |   2 +
 tests/docker/common.rc                   |   6 +-
 12 files changed, 297 insertions(+), 56 deletions(-)
 create mode 100644 docs/devel/maintainers.rst

-- 
2.34.1


