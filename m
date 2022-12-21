Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34EA653288
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 15:41:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p80Gg-0006ut-Gw; Wed, 21 Dec 2022 09:40:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p80Ge-0006tr-IS
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:40:24 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p80Gc-0004tC-IB
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 09:40:24 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so1719696wma.1
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 06:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UREun9/w211oRcp0+fsUoxLBLbHw4sPRzwueBM1Yr3w=;
 b=VF0Rbqbf3MGlXBPYvJjiM/F4zMlsf650M0shUSTblXgKV1mOPj1lfO8hF11khkjuFM
 BuvlelVe3/TcNNhow2P973ykD55R7k9YlIcfgkmQJIgM96mO1VrP7m3NzTlGE/E3i7Al
 RU3PE2spUjo2yEC2/ogjFd1BpFlxJMWCGUG/nd56yRp1inaJTqNe2DfABpMTQp/+xSYZ
 MTV/TEL9DOPd47gtmJZ/12Ze0UZ+34VCTJZVkpwOtBjuDrC8rqBfVWhqHoc4AGii20Nb
 P0AJg4Lanw1W4NrZoVGfAHPDldJFz3g0VDo2IMEGq5MpcTe4D4ZUPhYjIOSYmPofVMXE
 Ngsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UREun9/w211oRcp0+fsUoxLBLbHw4sPRzwueBM1Yr3w=;
 b=nsVC56O+WIXhGA21yxErb0vOWeQIZ/IohlCcA23ZCv66zlB46i8Q21iUX5KRkQEucR
 2t48zTHA+ORvB/OEUTavkfnOdGiI6vLn4JjQi3sgBuzhtl5CCJb10RT0vLxA9J0001KV
 9gXzqubINDohrgqaX88p9qkVc8x47bceigm6G615VHhGAB1xe7uw3OlqeWs1zWudt30k
 GGX0dHQw8F9URblLVSmi38/lhjl0wgOd3lGNM3k3TIshn2rxakF1YokIwRhe0iTx7iQV
 IpL5nkWik9/1hTrQyKdKG100vuI0FhkZmHNRqEtIkji5Ne7Wttloem/GUeUqYj+AMaIy
 3/0w==
X-Gm-Message-State: AFqh2kokpBX8o9oMFmMAQVSd9xQM6a/29hjTEQopbBPsGZsm9bREG+lx
 /q+ykfPaLhAxJmTp70UKyqO7oN7ueZKS9FHU
X-Google-Smtp-Source: AMrXdXtNqP6RXvXyVkBAla0aa05hBgnpYk90X2/XLqEU1zyznRpO4okp4BDhNJybvvHfUz5MqSeITA==
X-Received: by 2002:a05:600c:348b:b0:3d1:fcb4:4074 with SMTP id
 a11-20020a05600c348b00b003d1fcb44074mr2100325wmq.22.1671633620805; 
 Wed, 21 Dec 2022 06:40:20 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bg40-20020a05600c3ca800b003b4cba4ef71sm2711858wmb.41.2022.12.21.06.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 06:40:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C17431FFB7;
 Wed, 21 Dec 2022 14:40:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 0/6] testing updates
Date: Wed, 21 Dec 2022 14:40:13 +0000
Message-Id: <20221221144019.2149905-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

The following changes since commit 8540a1f69578afb3b37866b1ce5bec46a9f6efbc:

  Merge tag 'hppa-fixes-pull-request' of https://github.com/hdeller/qemu-hppa into staging (2022-12-20 15:32:27 +0000)

are available in the Git repository at:

  https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-211222-1

for you to fetch changes up to 7a8ec48480c116db93e0d91688be1dcf34147795:

  gitlab-ci: Disable docs and GUIs for the build-tci and build-tcg-disabled jobs (2022-12-21 11:19:05 +0000)

----------------------------------------------------------------
testing updates:

  - fix minor shell-ism that can break check-tcg
  - turn off verbose logging on custom runners
  - make configure echo call in CI
  - fix unused variable in linux-test
  - add binary compiler docker image for hexagon
  - disable doc and gui builds for tci and disable-tcg builds

----------------------------------------------------------------
Alex Bennée (3):
      gitlab: turn off verbose logging for make check on custom runners
      configure: repeat ourselves for the benefit of CI
      tests/tcg: fix unused variable in linux-test

Mukilan Thiyagarajan (2):
      configure: Fix check-tcg not executing any tests
      tests/docker: use prebuilt toolchain for debian-hexagon-cross

Thomas Huth (1):
      gitlab-ci: Disable docs and GUIs for the build-tci and build-tcg-disabled jobs

 configure                                          |  11 +-
 tests/tcg/multiarch/linux/linux-test.c             |   6 +-
 .gitlab-ci.d/buildtest.yml                         |  10 +-
 .gitlab-ci.d/container-cross.yml                   |  19 +--
 .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml |  12 +-
 .../custom-runners/ubuntu-22.04-aarch32.yml        |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml        |  12 +-
 MAINTAINERS                                        |   1 -
 tests/docker/Makefile.include                      |   4 -
 .../debian-hexagon-cross.d/build-toolchain.sh      | 141 ---------------------
 .../docker/dockerfiles/debian-hexagon-cross.docker |  53 +++-----
 11 files changed, 47 insertions(+), 224 deletions(-)
 delete mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.d/build-toolchain.sh


-- 
2.34.1


