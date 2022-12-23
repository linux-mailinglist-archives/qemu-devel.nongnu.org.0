Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97E165533C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 18:23:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8ljz-0000Rw-MD; Fri, 23 Dec 2022 12:21:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p8ljr-0000RV-Df
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 12:21:43 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p8ljp-0005fP-IF
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 12:21:43 -0500
Received: by mail-wm1-x331.google.com with SMTP id ay40so4034720wmb.2
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 09:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N6VH20qL4sE0lZpyOaFGtgugUA6r5bHhLgm4QE8OBOw=;
 b=ymVMmx+T+QOaiMXjFM3b1CZYnxGktkaAoPkR0SCwmFw0T95ir5imqoKOgn4GAWPIHZ
 +u+muaPQo9WA/ktH/8VjHlM2G9gKpYOV6P6d42XZe6ayAPMnRGtedHlVG/QmMqTb9PT0
 axNR4hqySfzYIKViUZNVjgsDj+UeCqL5c6cLRaXOuS5lPq4rCjmH16Bzep3ZbcgVrE/K
 JRJTfxqTNX9PYxaJOCcHFiZ4hHXcEdRXLT7D8qTrz0KFVcRD2f7wXMTaf9rxeAHttvzc
 qx337QE9GjJMkwPR9lg8wwiWB85GUBihzcC4oVrnxpSiDKnP/YgPUCgFFD/mZ/pBy2eb
 F8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N6VH20qL4sE0lZpyOaFGtgugUA6r5bHhLgm4QE8OBOw=;
 b=fpJajNfuuIBqoXdzWxHm08QLuTrTEVRBU7xRbRTLYQvUuFh8ceVh2lyQ3Sxh8g0ByG
 1L0XSUDtcw+dHynZ2nNgnp0/QgUYHrhMwkptjbqPHMdYjhXyitGmSGGs0f09aBgTUmxk
 ZdvwUw3/PWSbgvoI3BjzrFVE4laOTOaEl1/chZEXDYuzbGx+dVajfFyksw+ZqSprScoA
 ZpfR+j85gke0fKNTBUuSyMILSWXX2XVt3l57N6lcEZTYr+C5JAFu6gfyyrA1cBt28MkM
 jPwPStHyxMB56r3eAjj/LB3bxltf2VDZviFysLusIUgGOPgnTJmrTpGFiYhmm9vcSlv7
 U0fQ==
X-Gm-Message-State: AFqh2ko954PFJLTZ02/NG+aNpSL84I4F8s6fFyJ4rOkWy7eEt9UwKZ0W
 OP9uR980HzeH/GQOrnRfCPQ3XQ==
X-Google-Smtp-Source: AMrXdXvQXHjMs32tFSo54CENGIOH4C0sjabuQN22p502MydPfshnutC0L3ef4i4TFoFPXcfVlVx+yw==
X-Received: by 2002:a05:600c:4998:b0:3cf:68d3:3047 with SMTP id
 h24-20020a05600c499800b003cf68d33047mr7620160wmp.41.1671816096602; 
 Fri, 23 Dec 2022 09:21:36 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bi20-20020a05600c3d9400b003c6c5a5a651sm4949426wmb.28.2022.12.23.09.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 09:21:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CBC801FFB7;
 Fri, 23 Dec 2022 17:21:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 0/6] testing updates
Date: Fri, 23 Dec 2022 17:21:35 +0000
Message-Id: <20221223172135.3450109-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

The following changes since commit 222059a0fccf4af3be776fe35a5ea2d6a68f9a0b:

  Merge tag 'pull-ppc-20221221' of https://gitlab.com/danielhb/qemu into staging (2022-12-21 18:08:09 +0000)

are available in the Git repository at:

  https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-231222-1

for you to fetch changes up to 3b4f911921e4233df0ba78d4acd2077da0b144ef:

  gitlab-ci: Disable docs and GUIs for the build-tci and build-tcg-disabled jobs (2022-12-23 15:17:13 +0000)

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
 .gitlab-ci.d/container-cross.yml                   |  22 +---
 .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml |  12 +-
 .../custom-runners/ubuntu-22.04-aarch32.yml        |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml        |  12 +-
 MAINTAINERS                                        |   1 -
 tests/docker/Makefile.include                      |   4 -
 .../debian-hexagon-cross.d/build-toolchain.sh      | 141 ---------------------
 .../docker/dockerfiles/debian-hexagon-cross.docker |  53 +++-----
 11 files changed, 47 insertions(+), 227 deletions(-)
 delete mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.d/build-toolchain.sh

-- 
2.34.1


